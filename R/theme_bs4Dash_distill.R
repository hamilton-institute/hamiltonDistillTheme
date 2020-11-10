theme_bs4Dash_distill <- function () {
  fresh::create_theme(
    fresh::bs4dash_yiq(
      contrasted_threshold = 10,
      text_dark = "#ffffff"
    ),
    fresh::bs4dash_status(
      info = status_to_colour("info"),
      secondary = status_to_colour("secondary"), primary = status_to_colour("primary"),
      success = status_to_colour("success"), warning = status_to_colour("warning"),
      danger = status_to_colour("danger"), light = status_to_colour("primary")
    ),
    fresh::bs4dash_color(
      lightblue = status_to_colour("info"),
      gray_800 = "#164b53", blue = status_to_colour("primary"),
      green = status_to_colour("success"), yellow = status_to_colour("warning")
    ),
    fresh::bs4dash_sidebar_light(bg = status_to_colour("secondary")),
    fresh::bs4dash_layout(main_bg = "#ffffff", sidebar_width = "180px"),
    fresh::bs4dash_vars(body_color = status_to_colour("primary"))
  )
}

status_to_colour_distill <- function (status) {
  switch(
    status,
    primary = "#164b53",
    secondary = colorspace::lighten("#164b53",0.99),
    info = "#e9ecef",
    success = "#046874",
    warning = "#b99306",
    danger = "#bf281e"
  )
}

use_css_bs4Dash_distill <- function(path = NULL) {
  if (is.null(path)) {
    path = "inst/app/www/custom.css"
  }
  file.copy(
    from = system.file("custom.css", package = "hamiltonThemes"),
    to = path
  )
}
