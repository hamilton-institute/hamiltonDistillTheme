ui <- bs4Dash::bs4DashPage(
  sidebar_collapsed = TRUE,
  sidebar_mini = FALSE,
  body = bs4Dash::bs4DashBody(
    hamiltonThemes::use_bs4Dash_distill_theme(),
    hamiltonThemes::use_bs4Dash_distill_css(),
    shiny::fluidRow(
      bs4Dash::column(
        width = 4,
        shiny::br(),
        shiny::selectInput(
          "variable",
          label = "Select a variable:",
          choices = names(mtcars)
        )
      ),
      bs4Dash::column(
        width = 8,
        shiny::br(),
        shiny::h4(style = "color: black;", "Figure guide:"),
        shiny::p(style = "color: black;", "Each point relates to a car model."),
        hamiltonThemes::distill_load_spinner(shiny::plotOutput("plot"))
      )
    )
  ),
  footer = bs4dash_distill_footer()
)

server <- function(input, output, session) {
  output$plot <- renderPlot({
    Sys.sleep(2)
    ggplot2::ggplot(
      mtcars,
      ggplot2::aes_string(x = input$variable, y = "mpg")
    ) +
      ggplot2::geom_point()
  })
}

shiny::shinyApp(ui, server)
