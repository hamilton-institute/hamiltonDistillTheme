#' ggplot2 Hamilton Distill Theme
#'
#' Add the Hamilton Distill theme to a ggplot2 plot.
#'
#' @export
#'
#' @examples
#' ggplot2::ggplot(mtcars) +
#'    ggplot2::geom_point(ggplot2::aes(wt, mpg)) +
#'    theme_hamilton_distill()
#'
theme_hamilton_distill <- function () {

  default_text_color <- ggplot2::element_text(
    colour = distill_status_to_colour("primary")
  )
  default_line_color <- ggplot2::element_line(
    colour = distill_status_to_colour("primary")
  )

  ggplot2::theme(
    axis.text = default_text_color,
    axis.title = default_text_color,
    axis.title.x = default_text_color,
    axis.title.y = default_text_color,
    plot.title = default_text_color,
    legend.title = default_text_color,
    legend.text = default_text_color,
    axis.line = default_line_color,
    panel.grid = ggplot2::element_line(
      colour = "#bce0e6"
    ),
    legend.background = ggplot2::element_rect(
      fill = "white"
    ),
    panel.background = ggplot2::element_rect(
      fill = "white"
    ),
    plot.background = ggplot2::element_rect(
      fill = "white"
    )
  )
}
