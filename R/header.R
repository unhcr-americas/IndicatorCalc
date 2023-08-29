header <- function() {
	 shinydashboard::dashboardHeader(
		 title = tagList(
			span(class = 'logo-lg',a("IndicatorCalc",style="color:white !important",href='https://rstudio.unhcr.org/IndicatorCalc')),
	) )
}
