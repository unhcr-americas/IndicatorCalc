#' UI Side menau
#'
#' This function is internally used to manage the side menu
#'
#' @import shiny
#' @import shinydashboard
#' @noRd
#' @keywords internal
#'
sidebar <- function() {
  shinydashboard::dashboardSidebar(
    shinydashboard::sidebarMenu(
      ## Here the menu item entry to the first module
      shinydashboard::menuItem("About",tabName = "home",icon = icon("bookmark")),
      shinydashboard::menuItem("Map Variable",tabName = "variable_mapping",icon = icon("map-location")),
      shinydashboard::menuItem("Recode Data",tabName = "remap_code",icon = icon("code")),
      shinydashboard::menuItem("Apply calculations",tabName = "apply_calculation",icon = icon("calculator"))
      # - add more - separated by a comma!
      ## For icon search on https://fontawesome.com/search?o=r&m=free - filter on free
    )
  )
}
