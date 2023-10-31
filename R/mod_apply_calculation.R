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
				  "Content",
				  downloadButton( outputId = ns("getdata"),
				                label = " get Data ",
				                width = "100%"  ),
				  downloadButton( outputId = ns("getreport"),
				                label = " get Report ",
				                width = "100%"  ),
				  downloadButton( outputId = ns("getanalysisplan"),
				                label = " get Extended XlsFrom with Indicators calculation ",
				                width = "100%"  )
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
	output$downloadreport <- downloadHandler(
	  filename = "exploration_report.html",
	  content = function(file) {
	    # Copy the report file and form to a temporary directory before processing it, in
	    # case we don't have write permissions to the current working dir (which
	    # can happen when deployed).
	    tempReport <- file.path(AppReactiveValue$thistempfolder,
	                            "report.Rmd")

	    ## Copy the report notebook template in the tempfolder..
	    file.copy(system.file("rmarkdown/templates/rms_report/skeleton/skeleton.Rmd",
	                          package = "kobocruncher"),
	              tempReport, overwrite = TRUE)

	    ## tweak to get here::here working - create .here file
	    file.create(  paste0(AppReactiveValue$thistempfolder, "/.here") ,
	                  "/.here")

	    ## paste the form in the data-raw folder for further knitting
	    file.copy( AppReactiveValue$xlsformpath,
	               paste0(AppReactiveValue$thistempfolder,
	                      "/data-raw/",
	                      AppReactiveValue$xlsformname),
	               overwrite = TRUE)

	    ## A few check in the console...
	    print(paste0( "thistempfolder: ", AppReactiveValue$thistempfolder))
	    print(paste0( "xlsformname: ", AppReactiveValue$xlsformname))
	    print(paste0( "datauploadname: ", AppReactiveValue$datauploadname))



	    #browser()
	    # Set up parameters to pass to Rmd document
	    params = list(
	      # datafolder= "",
	      data =   AppReactiveValue$datauploadname,
	      form =   AppReactiveValue$xlsformname,
	      # ridl =  ridl,
	      # datasource = AppReactiveValue$datasource,
	      # publish =  publish,
	      # visibility= visibility,
	      # stage = stage,
	      language = AppReactiveValue$language )

	    showModal(modalDialog("Please wait, compiling the report... The more questions in your report, the more time it will take...", footer=NULL))
	    # Knit the document, passing in the `params` list, and eval it in a
	    # child of the global environment (this isolates the code in the document
	    # from the code in this app).
	    rmarkdown::render(tempReport,
	                      output_file = file,
	                      params = params,
	                      envir = new.env(parent = globalenv())

	    )
	    removeModal()
	  }
	)

	## Get download ready for expanded form
	output$getdata <- downloadHandler(
	  filename =  function(){paste0("Indicator_data.xlsx") },
	  content <- function(file) { file.copy( AppReactiveValue$indicatordata , file)}
	)
	## Get download ready for expanded form
	output$getanalysisplan <- downloadHandler(
	  filename =  function(){paste0(AppReactiveValue$xlsformfilename, "_expanded.xlsx") },
	  content <- function(file) { file.copy( AppReactiveValue$expandedform , file)}
	)



}

## copy to body.R
# mod_apply_calculation_ui("apply_calculation_ui_1")

## copy to sidebar.R
# shinydashboard::menuItem("displayName",tabName = "apply_calculation",icon = icon("user"))

## and copy to app_server.R
# callModule(mod_apply_calculation_server, "apply_calculation_ui_1", AppReactiveValue)

