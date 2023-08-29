#' UI Body
#'
#' This function is internally used to manage the body
#'
#' @import shiny
#' @import shinydashboard
#' @importFrom unhcrshiny theme_shinydashboard_unhcr
#' @noRd
#' @keywords internal

body <- function() {
  shinydashboard::dashboardBody(
    unhcrshiny::theme_shinydashboard_unhcr(),
    tags$head(
      tags$script(src = "custom.js")
    ),
    shinydashboard::tabItems(
      #Add ui module here - separated with a coma!
      mod_home_ui("home_ui_1")
    )
  )
}
