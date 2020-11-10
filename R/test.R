#' Test distill theme with simple app
#'
#' @export
#'
#' @examples
#' if (interactive()) {
#'    test_with_simple_app()
#' }
test_with_simple_app <- function() {
  shiny::runApp(
    system.file("app/simple_app.R", package = "hamiltonThemes")
  )
}


#' Test distill theme with dashboard
#'
#' @export
#'
#' @examples
#' if (interactive()) {
#'    test_with_dashboard()
#' }
test_with_dashboard <- function() {
  shiny::runApp(
    system.file("app/dashboard.R", package = "hamiltonThemes")
  )
}
