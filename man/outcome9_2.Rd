% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/outcome9_2.R
\name{outcome9_2}
\alias{outcome9_2}
\title{outcome9_2}
\usage{
outcome9_2(datalist)
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
\strong{Proportion of Persons of Concern that have energy to ensure lighting}
}
\details{
This indicator measures the percentage of Persons of Concern who have access to clean and sustainable source of lighting at household level.
Safe and sustainable access to clean energy is increasingly recognized as human right and is an integral part of the Sustainable Development Goals.

The indicator for lighting is constructed from the essential questions \emph{LIGHT01} and \emph{LIGHT02} which captures the most used light source.
\href{https://documents1.worldbank.org/curated/en/557341633679857128/pdf/Measuring-Energy-Access-A-Guide-to-Collecting-Data-Using-the-Core-Questions-on-Household-Energy-Use.pdf}{LSMS Guidebook} is the main source for measuring energy access as defined for SGD 7.1.12.\tabular{c}{
   Standard Questions \cr
   LIGHT01 - LIGHT03 \cr
}


: $\frac{Population with reliance on clean fuels and technologies for lighting}{Total population}$

\strong{Numerator}: Population living in households with primary reliance on clean fuels and technologies for lighting

\strong{Denominator}: Total population

\strong{Formula}: \emph{LIGHT01} = 1 & \emph{LIGHT02} = 1, 3, 4, 5, 6, 7, 8 / Total Population

This comes from the main dataset

The below Calculates percentage of PoC having access to clean fuel for lighting and / or basic connectivity (9.1 Outcome Indicator)
}
\examples{
## data, cf example  fct_re_map()
datalist <- kobocruncher::kobo_data( system.file("dummy_RMS_CAPI_v2_mapped.xlsx", 
                                                 package = "IndicatorCalc"))
## Apply indicator function on datalist
datalist <- outcome9_2(datalist )

## Visualise value
fct_plot_indic_donut(indicator = datalist[["main"]]$outcome9_2,
                     iconunicode = "f140")   
}
