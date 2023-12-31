# WARNING - Generated by {fusen} from dev/indicators.Rmd: do not edit by hand

#' impact3_2a
#' 
#'  **Proportion of Persons of Concern enrolled in primary education** 
#'  
#'  This indicator measures the number of students enrolled in primary education,
#'   regardless of age, expressed as a percentage of the official school-age population 
#'   corresponding to the respective same level of education.
#'   
#'   This is also referred to as Gross enrollment rate (GER).
#'   
#'   It is linked to SGD indicator 4.1.1 on quality education.
#'   
#'   The standard questions for this indicator are taken from UNHCR's
#'    [Standardized Education Module](https://www.unhcr.org/60804b214.pdf) which 
#'    are adapted primarily from the IHSN/EPDC and MICS indicator and questionnaire frameworks.
#'    
#'    *Definitions*:
#'    
#'    1.  "Enrollment" refers individuals officially registered in a primary/secondary school education programme.
#'    
#'    2.  "Primary education" is designed to provide students with fundamental skills in reading, writing and mathematics.
#'    
#'    Duration typically varies from 4 to 7 years.
#'    The most common duration is 6 years.
#'    It corresponds to ISCED (International Standard Classification of Education) level 1.
#'    
#'    3.  "Primary school age" depends on the education system and it varies from country to country.
#'    Children typically enter in primary education between age 5 and 7 and leave at the age of 10 and 12.
#'    
#'    | Standard Questions |
#'    |:------------------:|
#'    |    EDU01-EDU04     |
#'    
#'    **Numerator**: Population enrolled in primary education (regardless of age)
#'    **Denominator**: Total primary school age population (to be adjusted by the country for enumeration)
#'    
#'    **Formula**: (*EDU01*=1 & *EDU02*=1 & *EDU03*=2) / Number of children aged from 6 to 10
#' 
#' This indicator comes from the individual dataset
#' 
#' @param datalist A list with all hierarchical data frame for a survey data set.
#'    format is expected to match the Excel export synchronized from kobo to RILD
#'    and loaded with  kobocruncher::kobo_data() 
#' 
#' @importFrom dplyr mutate case_when
#' @importFrom labelled labelled
#' 
#' @return new calculated variable - appended or not...
#' 
#' @export
#' @examples
#' ## data, cf example  fct_re_map()
#' datalist <- kobocruncher::kobo_data( system.file("dummy_RMS_CAPI_v2_mapped.xlsx", 
#'                                                  package = "IndicatorCalc"))
#' ## Apply calculation
#' datalist <- impact3_2a(datalist  )
#' table(datalist[["ind"]]$impact3_2a, useNA = "ifany")
#' table(datalist[["ind"]]$edu_primary, useNA = "ifany")
#' table(datalist[["ind"]]$age_primary, useNA = "ifany")
#'
#' ## Visualise value
#' fct_plot_indic_donut(indicator = datalist[["ind"]]$impact3_2a,
#'                      iconunicode = "f140")  
impact3_2a <- function(datalist ){

  ## Mapper 
mapper = list(
           hierarchy = "ind",
          variablemap = data.frame(
            label = 
c("1. Has ${child_edu_name} ever attended school?", "2. Did ${child_edu_name} attend school or pre-school at any time during current school year?", 
"3. During this/that school year , what level is (was) ${child_edu_name} attending?", 
"4. What type of school?", "6. Can you estimate how old is ${HH02}?"
)
              ,
            variable =  
c("EDU01", "EDU02", "EDU03", "EDU04", "HH07")
              ),
          modalitymap = data.frame(
            variable =  
c("EDU01", "EDU01", "EDU02", "EDU02", "EDU03", "EDU03", "EDU03", 
"EDU03", "EDU03", "EDU03", "EDU03", "EDU04", "EDU04", "EDU04", 
"EDU04", "EDU04", "EDU04", "EDU04", "HH07")
               ,
            label =  
c("Yes", "No", "Yes", "No", "Early Childhood Education or Pre-primary", 
"Primary", "Secondary", "Secondary - Technical and Vocational Education and Training (TVET)", 
"Post-secondary - Technical and Vocational Education and Training (TVET)", 
"Tertiary", "Don\u2019t know", "Government or public", "UN or NGO (non-governmental organization)", 
"Religious or faith-based organization", "Community", "Private", 
"Other (specify)", "Don\u2019t know", NA)
               ,
            standard =  
c("1", "0", "1", "0", "1", "2", "3", "4", "5", "6", "98", "1", 
"2", "3", "4", "5", "96", "98", NA)
              ))
  ## So first we check that we have what we need in the data set based on the mapper
  check_map <- fct_check_map(datalist = datalist,
                             mapper = mapper)
  if ( check_map == FALSE) {
   cat( "There are missing data requirement to calculate Indicator Impact 3.2.a")
  } else {

datalist[["ind"]]$edu_primary<- dplyr::case_when(
    as.integer(datalist[["ind"]]$EDU01) == 1 & 
    as.integer(datalist[["ind"]]$EDU02) == 1 & 
    as.integer(datalist[["ind"]]$EDU03) == 2 ~ 1, 
    
    as.integer(datalist[["ind"]]$EDU01) == 0 | 
    as.integer(datalist[["ind"]]$EDU02) == 0 ~ 0, 
    
    TRUE ~ 0)

#Adjust age group for primary school  enrollment --> this to go in function var...
datalist[["ind"]]$age_primary<- dplyr::case_when(
    as.integer(datalist[["ind"]]$HH07) >= 6 &
    as.integer(datalist[["ind"]]$HH07) <= 10 ~ 1, 
    TRUE ~ NA_real_) 

datalist[["ind"]]$impact3_2a <- sum(datalist[["ind"]]$edu_primary, na.rm = TRUE) /
                                sum(datalist[["ind"]]$age_primary, na.rm = TRUE)

datalist[["ind"]]$impact3_2a  <- labelled::labelled(datalist[["ind"]]$impact3_2a,
  labels = c('Yes' = 1, 'No' = 0 ),
  label = "Proportion of persons of concern enrolled in primary education")

   }
   return(datalist)
}
