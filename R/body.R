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
    golem::activate_js(),
    tags$head(
      tags$script(src = "custom.js")
    ),
    shinydashboard::tabItems(
      #Add ui module here - separated with a coma!
      mod_home_ui("home_ui_1"),
      mod_variable_mapping_ui("variable_mapping_ui_1"),
      mod_remap_code_ui("remap_code_ui_1"),
      mod_apply_calculation_ui("apply_calculation_ui_1")
    )
  )
}
