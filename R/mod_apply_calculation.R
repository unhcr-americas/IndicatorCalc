#' Module UI

#' @title mod_apply_calculation_ui and mod_apply_calculation_server
#' @description A shiny module.
#' @description A shiny module.
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#' @import shiny
#' @import shinydashboard
#' @keywords internal

mod_apply_calculation_ui <- function(id) {
	ns <- NS(id)
	tabItem(
		tabName = "apply_calculation",
		fluidRow(
				 column(
				 width = 12,
						 h2('Now apply the calculations'),
						 p("You can now apply the standard calculations")
					 )
				 ),

				 fluidRow(
				 shinydashboard::box(
				  title = "Module Step",
				  #  status = "primary",
				  status = "info",
				  solidHeader = FALSE,
				  collapsible = TRUE,
				  width = 12,
				  "Content"
## do not forget that all elements ID of the GUI needs to be called with ns("ID")....
				  )

		)
	)
}

#' Module Server
#' @noRd
#' @import shiny
#' @import tidyverse
#' @keywords internal

mod_apply_calculation_server <- function(input, output, session, AppReactiveValue) {
	ns <- session$ns
## add here the server logic part of your module....
}

## copy to body.R
# mod_apply_calculation_ui("apply_calculation_ui_1")

## copy to sidebar.R
# shinydashboard::menuItem("displayName",tabName = "apply_calculation",icon = icon("user"))

## and copy to app_server.R
# callModule(mod_apply_calculation_server, "apply_calculation_ui_1", AppReactiveValue)

