#' Module UI

#' @title mod_remap_code_ui and mod_remap_code_server
#' @description A shiny module.
#' @description A shiny module.
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#' @import shiny
#' @import shinydashboard
#' @keywords internal

mod_remap_code_ui <- function(id) {
	ns <- NS(id)
	tabItem(
		tabName = "remap_code",
		fluidRow(
				 column(
				 width = 12,
						 h2('Variable Recoding'),
						 p("Review the non matching variables and code.")
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

mod_remap_code_server <- function(input, output, session, AppReactiveValue) {
	ns <- session$ns
## add here the server logic part of your module....
}

## copy to body.R
# mod_remap_code_ui("remap_code_ui_1")

## copy to sidebar.R
# shinydashboard::menuItem("displayName",tabName = "remap_code",icon = icon("user"))

## and copy to app_server.R
# callModule(mod_remap_code_server, "remap_code_ui_1", AppReactiveValue)

