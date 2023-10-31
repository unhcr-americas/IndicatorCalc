#' Module UI

#' @title mod_variable_mapping_ui and mod_variable_mapping_server
#' @description A shiny module.
#' @description A shiny module.
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#' @import shiny
#' @import shinydashboard
#' @keywords internal

mod_variable_mapping_ui <- function(id) {
	ns <- NS(id)
	tabItem(
		tabName = "variable_mapping",
		fluidRow(
				 column(
				 width = 12,
						 h2('Variable mapping'),
						 p("The first step in the process is to map the variables defined in your specific XlsForm with the one expected for the calculation")
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

mod_variable_mapping_server <- function(input, output, session, AppReactiveValue) {
	ns <- session$ns
## add here the server logic part of your module....
}

## copy to body.R
# mod_variable_mapping_ui("variable_mapping_ui_1")

## copy to sidebar.R
# shinydashboard::menuItem("displayName",tabName = "variable_mapping",icon = icon("user"))

## and copy to app_server.R
# callModule(mod_variable_mapping_server, "variable_mapping_ui_1", AppReactiveValue)

