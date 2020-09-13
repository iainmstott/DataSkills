allThemesHack <- function() {
  themes <- dir(
    system.file("shinythemes/css", package = "shinythemes"),
    "*.min.css"
  )
  sub(".min.css", "", themes)
}

themeSelectorHack <- function() {
  shiny::absolutePanel(
    top = "20px",
    right = "20px",
    draggable = FALSE,
    fixed = FALSE,
    style = "width: 250px; margin-top: -100px; z-index: 100000;",
    div(class = "panel-body",
      selectInput("shinytheme-selector", "Theme:",
        c("default", allThemesHack()),
        selectize = FALSE
      )
    ),
    tags$script(
"$('#shinytheme-selector')
  .on('change', function(el) {
    var allThemes = $(this).find('option').map(function() {
      if ($(this).val() === 'default')
        return 'bootstrap';
      else
        return $(this).val();
    });
    // Find the current theme
    var curTheme = el.target.value;
    if (curTheme === 'default') {
      curTheme = 'bootstrap';
      curThemePath = 'shared/bootstrap/css/bootstrap.min.css';
    } else {
      curThemePath = 'shinythemes/css/' + curTheme + '.min.css';
    }
    // Find the <link> element with that has the bootstrap.css
    var $link = $('link').filter(function() {
      var theme = $(this).attr('href');
      theme = theme.replace(/^.*\\//, '').replace(/(\\.min)?\\.css$/, '');
      return $.inArray(theme, allThemes) !== -1;
    });
    // Set it to the correct path
    $link.attr('href', curThemePath);
  });"
    )
  )
}