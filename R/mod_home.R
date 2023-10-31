# Module UI Home

#' @title mod_home_ui and mod_home_server
#' @description A shiny module.
#' @import shiny
#' @import shinydashboard
#' @noRd
#' @keywords internal

mod_home_ui <- function(id) {
	ns <- NS(id)
	tabItem(
		tabName = "home",
		absolutePanel(  ## refers to a css class
		  id = "splash_panel", top = 0, left = 0, right = 0, bottom = 0,
		  ### Get the name for your tool
		  p(
		    tags$span("IndicatorCalc  ", style = "font-size: 60px"),
		    tags$span("  Alpha-version", style = "font-size: 24px")
		  ),
		  br(),
		  ### Then a short explainer
		  p( "The calculation of Standard Indicators is a key step in the analysis of Household survey dataset.
		     UNHCR Results Monitoring Survey is based on international statistical standards and definitions,
		     comes with standardised calculation to apply and can appear complex
		     as sometime a single indicator might imply to compile more than 15 different variables",
		    style = "font-size: 20px"),
		br(),
		p( "This ",tags$span("companion app", style = "color:#00B398"), "  support the application of those calculations.
		     It allows to ", strong("map the necessary variables")," based on the xlsform definition of the dataset you have or will collect.
		     In case needs be, it eases ", strong("data recoding")," based on this mapping. Finally, it generates the indicators together with ", strong("standard report"),".
		     Though token identification, all of this can also be recorded in RIDL for data auditing and quality asurance" ,
		   style = "font-size: 18px; text-align: left;"),

		br(),
		p("This app is part of a ",tags$span("companion app toolkit", style = "color:#00B398"),
		  "designed to mainstream knowledge, automate processes and facilitate standardised documentation of survey implementation. It includes: ",
		  tags$a(href="https://rstudio.unhcr.org/rmsSampling/", "rmsSampling"), " to help designing sampling strategies, ",
		  tags$a(href="https://rstudio.unhcr.org/Survey_Designer", "SurveyDesigner"), " to help integrating annual survey needs, ",
		  tags$a(href="https://rstudio.unhcr.org/XlsFormUtil/", "XlsFormUtil"), " to help reviewing form contextualisation, ",
		  tags$a(href="https://rstudio.unhcr.org/HighFrequencyChecks/", "HighFrequencyChecks"), " to monitor data collection quality, ",
		  tags$a(href="https://rstudio.unhcr.org/kobocruncher/", "KoboCruncher"), " to perform rapid data exploration and ",
		  tags$a(href="https://rstudio.unhcr.org/IndicatorCalc", "IndicatorCalc"), "compile indicators.
		       Each App has different maturity level from Alpha Version, Beta version till Candidate Release",
		  style = "font-size: 12px; text-align: left;"),
		  p(tags$i( class = "fa fa-github"),
		    "App built with ",
		    tags$a(href="https://edouard-legoupil.github.io/graveler/",
		           "{graveler}" ),
		    " -- report ",
		    tags$a(href="https://github.com/Edouard-Legoupil/graveler/issues",
		           "issues here." ,
		    ),
		    style = "font-size: 10px")
		)
	)
}

# Module Server
#' @import shiny
#' @import shinydashboard
#' @noRd
#' @keywords internal

mod_home_server <- function(input, output, session) {
	ns <- session$ns
	# This create the links for the button that allow to go to the next module
	observeEvent(input$go_to_firstmod, {
	  shinydashboard::updateTabItems(
	    session = parent_session,
	    inputId = "tab_selected",
	    selected = "firstmod"
	  )
	})
}

## copy to body.R
# mod_home_ui("home_ui_1")

## copy to app_server.R
# callModule(mod_home_server, "home_ui_1")

## copy to sidebar.R
# menuItem("displayName",tabName = "home",icon = icon("user"))

