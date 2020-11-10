test_that("simple app works", {
  ui <- bs4Dash::bs4DashPage(
    sidebar_collapsed = TRUE,
    sidebar_mini = FALSE,
    body = bs4Dash::bs4DashBody(
      use_bs4Dash_distill_theme(),
      use_bs4Dash_distill_css(),
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
          distill_load_spinner(shiny::plotOutput("plot"))
        )
      )
    ),
    footer = bs4dash_distill_footer()
  )
  expect_equal(class(ui), "shiny.tag")
})
