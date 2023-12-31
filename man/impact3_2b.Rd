% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/impact3_2b.R
\name{impact3_2b}
\alias{impact3_2b}
\title{impact3_2b}
\usage{
impact3_2b(datalist)
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
\strong{Proportion of Persons of Concern enrolled in secondary education}
}
\details{
This indicator measures the number of students enrolled in secondary education,
regardless of age, expressed as a percentage of the official school-age population
corresponding to the respective same level of education.

This is also referred to as Gross enrollment rate (GER).
It is linked to SGD indicator 4.1.1 on quality education.

The standard questions for this indicator are taken from UNHCR's \href{https://www.unhcr.org/60804b214.pdf}{Standardized Education Module} which are adapted primarily from
the IHSN/EPDC and MICS indicator and questionnaire frameworks.

Definitions:
\enumerate{
\item "Enrollment" refers individuals officially registered in a primary/secondary school education programme.
\item "Secondary education" provides learning and educational activities building on primary education and preparing for both first labour market entry as well as further study.
}

The common duration is 6 years and is often divided between lower and upper secondary education (corresponding respectively to ISCED 2 and 3).
\enumerate{
\item "Secondary school age" depends on the education system and differ from
country to country.
Children typically enter secondary education between age 11 and 13 and leave between age 17-19.
\item Whenever possible, operations are encouraged also to disaggregate data between lower and upper secondary
}\tabular{c}{
   Standard Questions \cr
   EDU01-EDU04 \cr
}


\strong{Numerator}: Population enrolled in secondary education (regardless of age)
\strong{Denominator}: Total secondary school age population (to be adjusted by the country for enumeration)

\strong{Formula}: (\emph{EDU01}=1 & \emph{EDU02}=1 & (\emph{EDU03}=3,4) / Number of children aged from 11 to 18

This indicator comes from the individual dataset

Include if they are attending secondary or secondary -technical and vocational
}
\examples{
## data, cf example  fct_re_map()
datalist <- kobocruncher::kobo_data( system.file("dummy_RMS_CAPI_v2_mapped.xlsx", 
                                                 package = "IndicatorCalc"))
## Apply calculation
datalist <- impact3_2b(datalist )

## Visualise value
fct_plot_indic_donut(indicator = datalist[["ind"]]$impact3_2b,
                     iconunicode = "f140")  
 
}
