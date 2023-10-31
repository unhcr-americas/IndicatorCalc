#' Server
#'
#' This function is internally used to manage the shinyServer
#'
#' @import shiny
#' @import shinydashboard
#' @noRd
#' @keywords internal
app_server <- function(input, output, session) {

  ## add a reactive value object to pass by elements between objects
  AppReactiveValue <-  reactiveValues()
  # pins::board_register() # connect to pin board if needed
  callModule(mod_home_server, "home_ui_1")
  callModule(mod_variable_mapping_server, "variable_mapping_ui_1", AppReactiveValue)
  callModule(mod_remap_code_server, "remap_code_ui_1", AppReactiveValue)
  callModule(mod_apply_calculation_server, "apply_calculation_ui_1", AppReactiveValue)
}
