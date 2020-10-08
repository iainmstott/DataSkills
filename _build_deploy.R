
### learnr run tutorial

rmarkdown::run("DataSkills.rmd", render_args = list(quiet = TRUE))


# Deploy the application to shinyapps.io
rsconnect::deployApp(
    appDir = "C:/Dropbox/Work/Software/learnr/Data Skills",
    appName = "DataSkills", appId = "2964489",
    account = "iainmstott", upload = TRUE
)
