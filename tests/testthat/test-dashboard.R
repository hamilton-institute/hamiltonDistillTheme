test_that("dashboard works", {
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
  expect_equal(class(ui), "shiny.tag")
})
