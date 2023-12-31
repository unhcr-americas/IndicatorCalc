% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/outcome13_2.R
\name{outcome13_2}
\alias{outcome13_2}
\title{outcome13_2}
\usage{
outcome13_2(datalist)
}
\arguments{
\item{datalist}{A list with all hierarchical data frame for a survey data set.
format is expected to match the Excel export synchronized from kobo to RILD
and loaded with  kobocruncher::kobo_data()}
}
\value{
new calculated variable - appended or not...
}
\description{
\strong{Proportion of Persons of Concern who self-report positive changes in their income compared to previous year}
}
\details{
This indicator measures the proportion of PoC who self-report positive changes in their income compared to previous year.\tabular{c}{
   Standard Questions \cr
   INC01 \cr
}


\strong{Numerator}: Population 18 and above who self-report increased income compared to last year

\strong{Denominator}: Total population 18 and above

\strong{Formula}: \emph{INC01}=1

This indicator comes from main dataset based on the respondent randomly selected for individual level
Only calculate as positive if they responded 'more'
}
\examples{
## data, cf example  fct_re_map()
datalist <- kobocruncher::kobo_data( system.file("dummy_RMS_CAPI_v2_mapped.xlsx", 
                                                 package = "IndicatorCalc"))
## Apply indicator function on datalist
datalist <- outcome13_2(datalist)

## Visualise value
fct_plot_indic_donut(indicator = datalist[["main"]]$outcome13_2,
                     iconunicode = "f140")   
}
