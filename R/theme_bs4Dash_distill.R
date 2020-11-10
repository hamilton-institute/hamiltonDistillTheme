#' Use distill theme for bs4Dash app
#'
#' @export
#' @examples
#'
#' if (interactive()) {
#'   library(shiny)
#'   library(fresh)
#'   library(shiny)
#'   ui <- fluidPage(
#'     use_bs4Dash_distill_theme(),
#'     tags$h1("Distill theme"),
#'
#'     sidebarLayout(
#'       sidebarPanel(
#'         "This is the sidebar panel"
#'       ),
#'       mainPanel(
#'         tags$h1("First level title"),
#'         tags$h2("Second level title"),
#'         tags$h3("Third level title"),
#'         tags$h4("Fourth level title"),
#'         tags$h5("Fifth level title"),
#'         tags$h6("Sixth level title")
#'       )
#'     )
#'   )
#'
#'   server <- function(input, output, session) {
#'
#'   }
#'   shinyApp(ui, server)
#' }
#'
use_bs4Dash_distill_theme <- function () {
  fresh::use_theme(
    fresh::create_theme(
      fresh::bs4dash_yiq(
        contrasted_threshold = 10,
        text_dark = "#ffffff"
      ),
      fresh::bs4dash_status(
        info = distill_status_to_colour("info"),
        secondary = distill_status_to_colour("secondary"), primary = distill_status_to_colour("primary"),
        success = distill_status_to_colour("success"), warning = distill_status_to_colour("warning"),
        danger = distill_status_to_colour("danger"), light = distill_status_to_colour("primary")
      ),
      fresh::bs4dash_color(
        lightblue = distill_status_to_colour("info"),
        gray_800 = "#164b53", blue = distill_status_to_colour("primary"),
        green = distill_status_to_colour("success"), yellow = distill_status_to_colour("warning")
      ),
      fresh::bs4dash_sidebar_light(bg = distill_status_to_colour("secondary")),
      fresh::bs4dash_layout(main_bg = "#ffffff", sidebar_width = "180px"),
      fresh::bs4dash_vars(body_color = distill_status_to_colour("primary"))
    )
  )
}


#' Use Distill CSS for bs4Dash app
#'
#' @export
#'
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'   library(fresh)
#'   library(shiny)
#'   ui <- fluidPage(
#'     use_bs4Dash_distill_css(),
#'     tags$h1("Distill theme"),
#'
#'     sidebarLayout(
#'       sidebarPanel(
#'         "This is the sidebar panel"
#'       ),
#'       mainPanel(
#'         tags$h1("First level title"),
#'         tags$h2("Second level title"),
#'         tags$h3("Third level title"),
#'         tags$h4("Fourth level title"),
#'         tags$h5("Fifth level title"),
#'         tags$h6("Sixth level title")
#'       )
#'     )
#'   )
#'
#'   server <- function(input, output, session) {
#'
#'   }
#'   shinyApp(ui, server)
#' }
#'
use_bs4Dash_distill_css <- function() {
  shiny::addResourcePath(
    "distill",
    system.file("distill", package = "hamiltonThemes")
  )
  shiny::tags$head(
    shiny::tags$link(
      rel = "stylesheet",
      type = "text/css",
      href = "distill/distill.css"
    )
  )
}

#' bs4Dash distill footer
#'
#' Creates a Hamilton Institute footer with distill theme
#' for bs4Dash apps.
#'
#' @param year Numeric. Defaults to the current year.
#'
#' @examples
#'
#' \dontrun{
#'    bs4Dash::bs4DashPage(
#'       footer = hamiltonThemes::bs4dash_distill_footer()
#'    )
#' }
#'
bs4dash_distill_footer <- function(year = NULL) {
  if (is.null(year)) {
    year <- lubridate::year(Sys.Date())
  }
  bs4Dash::dashboardFooter(
    copyrights = shiny::a(
      href = "https://www.maynoothuniversity.ie/hamilton",
      target = "_blank", "Hamilton Institute"
    ),
    right_text = paste(year, "| developed by Hamilton Institute")
  )
}

#' Distill load spinner
#'
#' Distill themed \code{\link[shinycssloaders]{withSpinner}} spinner.
#'
#' @param ui_element The element to apply the spinner to.
#' @param type The type of spinner to use, valid values are
#' integers between 0-8 (0 means no spinner).
#' Check out \url{https://daattali.com/shiny/shinycssloaders-demo}
#' to see the different types of spinners. You can also
#' use your own custom image using the image parameter.
#' @param color The color of the spinner in hex format.
#' Ignored if image is used.
#' @param ... See \code{\link[shinycssloaders]{withSpinner}}.
#'
#' @export
distill_load_spinner <- function(ui_element, type = 4,
                                 color = NULL, ...) {

  if (is.null(color)) {
    color <- distill_status_to_colour("primary")
  }

  shinycssloaders::withSpinner(
    ui_element,
    type = type,
    color = color,
    ...
  )

}


distill_status_to_colour <- function (status) {
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

