ui <- bs4Dash::dashboardPage(
  enable_preloader = FALSE,
  old_school = FALSE,
  sidebar_mini = TRUE,
  sidebar_collapsed = FALSE,
  controlbar_collapsed = TRUE,
  controlbar_overlay = TRUE,
  # loading_background = "#4682B4",
  title = "My dashboard",

  #---
  controlbar = bs4Dash::dashboardControlbar(),

  #---
  navbar = bs4Dash::bs4DashNavbar(
    skin = "light",
    status = "light",
    border = TRUE,
    sidebarIcon = "bars",
    compact = FALSE,
    controlbarIcon = "th"
  ),

  #---
  sidebar = bs4Dash::dashboardSidebar(
    skin = "light",
    status = "primary",
    brandColor = "dark",
    title = "My dashboard",
    bs4Dash::bs4SidebarMenu(
      bs4Dash::bs4SidebarMenuItem(
        "Summary",
        tabName = "summary",
        icon = "bullseye"
      ),
      bs4Dash::bs4SidebarMenuItem(
        "Data",
        tabName = "data",
        icon = "database"
      )
    )
  ),

  #---
  body = bs4Dash::dashboardBody(
    use_bs4Dash_distill_theme(),
    use_bs4Dash_distill_css(),
    bs4Dash::bs4TabItems(
      bs4Dash::bs4TabItem(
        tabName = "summary",
        shiny::fluidRow(
          shiny::column(
            width = 12,
            shiny::h1("Summary")
          )
        ),
        shiny::fluidRow(
          shiny::column(
            width = 4,
            bs4Dash::bs4ValueBoxOutput("vb_num_cars", width = 12)
          ),
          shiny::column(
            width = 4,
            bs4Dash::bs4ValueBoxOutput("vb_num_vars", width = 12),
          ),
          shiny::column(
            width = 4,
            bs4Dash::bs4ValueBoxOutput("vb_avg_mpg", width = 12)
          )
        )
      ),
      bs4Dash::bs4TabItem(
        tabName = "data",
        distill_load_spinner(
          reactable::reactableOutput("data")
        )
      )
    )
  ),

  #---
  footer = bs4dash_distill_footer()
)

server <- function(input, output, session) {

  output$vb_num_cars <- bs4Dash::renderbs4ValueBox({
    bs4Dash::bs4ValueBox(
      value = nrow(mtcars),
      subtitle = "Number of cars",
      status = "primary",
      icon =  "car"
    )
  })

  output$vb_num_vars <- bs4Dash::renderbs4ValueBox({
    bs4Dash::bs4ValueBox(
      value = ncol(mtcars),
      subtitle = "Number of variables",
      status = "primary",
      icon = "info"
    )
  })

  output$vb_avg_mpg <- bs4Dash::renderbs4ValueBox({
    bs4Dash::bs4ValueBox(
      value = tags$span(
        round(mean(mtcars$mpg), 2),
        style = "color: #164b53; margin: 0px !important;"
      ),
      subtitle = tags$span(
        "Average mpg",
        style = "color: #164b53;"
      ),
      status = "secondary",
      icon = "gas-pump"
    )
  })

  output$data <- reactable::renderReactable({
    Sys.sleep(2)
    reactable::reactable(
      data = datasets::mtcars,
      resizable = TRUE,
      filterable = TRUE,
      searchable = TRUE,
      showPageSizeOptions = TRUE,
      compact = TRUE,
      wrap = FALSE,
      highlight = TRUE,
      defaultPageSize = 10
    )
  })

}

shiny::shinyApp(ui, server)
