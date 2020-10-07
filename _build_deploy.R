
### learnr run tutorial

rmarkdown::run("Zbook.rmd", render_args = list(quiet = TRUE))


# Deploy the application to shinyapps.io
rsconnect::deployApp(
    appDir = "C:/Dropbox/Work/Software/learnr/ShinyGLiM",
    appName = "ShinyGLiM", appId = "1249945",
    account = "iainmstott", upload = TRUE
)
