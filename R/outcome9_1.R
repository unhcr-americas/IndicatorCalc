# WARNING - Generated by {fusen} from dev/indicators.Rmd: do not edit by hand

#' outcome9_1
#' 
#' **Proportion of Persons of Concern living in habitable and affordable housing**
#' 
#' This indicator measures the proportion of persons of concern living in habitable and affordable housing.
#' This indicator focuses only on habitability and affordability.
#' It is limited in its reflection on other key aspects of adequate housing including security of tenure, availability of other basic services and infrastructure, accessibility, location of housing, and cultural appropriateness.
#' It is also linked to SGD indicator [11.1.1](https://unstats.un.org/sdgs/metadata/files/Metadata-11-01-01.pdf).
#' 
#' The right to access adequate housing is protected by international law.
#' The concept of "adequacy" means that housing is more than four walls and a roof as indicated in [The Sphere Handbook](https://spherestandards.org/wp-content/uploads/Sphere-Handbook-2018-EN.pdf).
#' Habitable housing primarily refers to the fact that the housing should provide protection from cold, damp, heat, rain, wind, and other threats to health, structural hazards, and disease vectors and it should not be overcrowded.
#' As shelter/housing is primarily a contextual element, there may be discrepancies from country to country on how this data is measured.Habitable shelter is measured based on having improved material for the dwelling as indicated in [DHS](https://dhsprogram.com/pubs/pdf/AS61/AS61.pdf) publication on housing conditions which is also used by [MICS6](https://mics.unicef.org/tools).
#' Overcrowding is also used which occurs if there are more than three people per habitable room as defined by [UN-Habitat](https://www.ncbi.nlm.nih.gov/books/NBK535289/table/ch3.tab2/).
#' 
#' Affordable housing refers to the fact that the cost of housing and its related expenditures on maintenance and household items should be at such a level that it should not compromise the attainment and satisfaction of other basic needs
#' 
#' |    Standard Questions     |
#' |:-------------------------:|
#' | DWE01-DWE05 & DWE08-DWE09 |
#' 
#' **Numerator**: Total population living in habitable and affordable housing
#' 
#' **Denominator**: Total population
#' 
#' **Formula**: *DWE01* = 1,2 & *DWE02* = 3,4,5,6,7,8,9 & *DWE03* = 8,9,10,11,12,13 & *DWE04* = 10,11,12,13,14,15 & crowding (*HH01*/*DWE05*) \<= 3 & (DWE08=1 & DWE09=1,2) \| DWE08=0
#'  
#' 
#' This indicator is calculated from the main dataset
#' 
#' classify as habitable when improved/adequate shelter
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
#' ## Apply indicator function on datalist
#' datalist <- outcome9_1(datalist)
#'
#' ## Visualise value
#' fct_plot_indic_donut(indicator = datalist[["main"]]$outcome9_1,
#'                      iconunicode = "f140")   
outcome9_1 <- function(datalist){
  # Mapper , 
mapper = list(
           hierarchy = "main",
          variablemap = data.frame(
            label = 
c("1.What type of dwelling does the household live in?", "2. Main material of the dwelling floor", 
"3. Main material of the roof.", "4. Main material of the exterior walls", 
"5. How many separate rooms do the members of your household occupy?", 
"8. Does your household pay any rent?", "9. Can your household generally afford to pay the rent without any major financial distress?", 
"What is the total number of persons in this household ? (including the respondent)"
)
              ,
            variable =  
c("DWE01", "DWE02", "DWE03", "DWE04", "DWE05", "DWE08", "DWE09", 
"HH01")
              ),
          modalitymap = data.frame(
            variable =  
c("DWE01", "DWE01", "DWE01", "DWE01", "DWE01", "DWE01", "DWE01", 
"DWE01", "DWE01", "DWE01", "DWE02", "DWE02", "DWE02", "DWE02", 
"DWE02", "DWE02", "DWE02", "DWE02", "DWE02", "DWE02", "DWE03", 
"DWE03", "DWE03", "DWE03", "DWE03", "DWE03", "DWE03", "DWE03", 
"DWE03", "DWE03", "DWE03", "DWE03", "DWE03", "DWE03", "DWE04", 
"DWE04", "DWE04", "DWE04", "DWE04", "DWE04", "DWE04", "DWE04", 
"DWE04", "DWE04", "DWE04", "DWE04", "DWE04", "DWE04", "DWE04", 
"DWE04", "DWE05", "DWE08", "DWE08", "DWE09", "DWE09", "DWE09", 
"DWE09", "HH01")
               ,
            label =  
c("Apartment", "House", "Tent", "Caravan", "Collective Center", 
"Worksite/Unfinished Home/ Abandoned Building", "Farm Building", 
"School, mosque, church or other religious building", "Garage, shop, workshop, or other structure not meant as residential space", 
"Other (Specify)", "Earth/sand", "Dung", "Wood planks", "Palm/bamboo", 
"Parquet or polished wood", "Vinyl or asphalt strips", "Ceramic tiles", 
"Cement", "Carpet", "Other (Specify)", "No roof", "Thatch/Palm leaf", 
"Sod", "Rustic mat", "Palm/bamboo", "Wood planks", "Cardboard", 
"Metal/tin", "Wood", "Calamine/Cement fibre", "Ceramic tiles", 
"Cement", "Roofing shingles", "Other (Specify)", "No walls", 
"Cane/Palm/ Trunks", "Dirt", "Bamboo with mud", "Stone with mud", 
"Uncovered adobe", "Plywood", "Cardboard", "Reused wood", "Cement", 
"Stone with lime/ cement", "Bricks", "Cement blocks", "Covered adobe", 
"Wood planks/shingles", "Other (Specify)", NA, "Yes", "No", "Always", 
"Often", "Sometimes", "Never", NA)
               ,
            standard =  
c("1", "2", "3", "4", "5", "6", "7", "8", "9", "96", "1", "2", 
"3", "4", "5", "6", "7", "8", "9", "96", "1", "2", "3", "4", 
"5", "6", "7", "8", "9", "10", "11", "12", "13", "96", "1", "2", 
"3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", 
"15", "96", NA, "1", "0", "1", "2", "3", "4", NA)
              ))

  ## So first we check that we have what we need in the data set based on the mapper
  check_map <- fct_check_map(datalist = datalist,
                             mapper = mapper)
  if ( check_map == FALSE) {
   cat( "There are missing data requirement to calculate Indicator Outcome 9.1")
  } else {
  
 #Only apartment and house
datalist[["main"]]$dwe01_cat<- dplyr::case_when(
         (as.integer(datalist[["main"]]$DWE01) == 1 | 
          as.integer(datalist[["main"]]$DWE01) == 2) ~ 1, 
         TRUE ~ 0 )

datalist[["main"]]$dwe01_cat <- labelled::labelled(datalist[["main"]]$dwe01_cat,
                        labels = c('Yes' = 1, 'No' = 0 ),
           label = "Proportion of apartment and house")

#unimproved floor when not earth,sand,clay,mud, dung or other
datalist[["main"]]$dwe02_cat<- dplyr::case_when( 
    (as.integer(datalist[["main"]]$DWE02) == 1 | 
     as.integer(datalist[["main"]]$DWE02) == 2 | 
     as.integer(datalist[["main"]]$DWE02) == 96) ~ 0, 
    TRUE ~ 1 )
datalist[["main"]]$dwe02_cat <- labelled::labelled(datalist[["main"]]$dwe02_cat,
                        labels = c('Yes' = 1, 'No' = 0 ),
           label = "Proportion of improved floor, ie. no earth,sand,clay,mud, 
           dung or other")

#unimproved roof all options except metal,wood,ceramic tiles, cement, roofing shingles/sheets
datalist[["main"]]$dwe03_cat<- dplyr::case_when( 
    (as.integer(datalist[["main"]]$DWE03) == 8 |
     as.integer(datalist[["main"]]$DWE03) == 9 | 
     as.integer(datalist[["main"]]$DWE03) == 10 | 
     as.integer(datalist[["main"]]$DWE03) == 11 |
     as.integer(datalist[["main"]]$DWE03) == 12 | 
     as.integer(datalist[["main"]]$DWE03) == 13 ) ~ 1 , 
    TRUE ~ 0)
datalist[["main"]]$dwe03_cat <- labelled::labelled(datalist[["main"]]$dwe03_cat,
                        labels = c('Yes' = 1, 'No' = 0 ),
           label = "Proportion of improved roof all options except metal,
           wood,ceramic tiles, cement, roofing shingles/sheets")

#improved wall: cement,stone,bricks,cement blocks, covered adobe, wood planks
datalist[["main"]]$dwe04_cat<- dplyr::case_when( 
    ( as.integer(datalist[["main"]]$DWE04) == 10 | 
      as.integer(datalist[["main"]]$DWE04) == 11 | 
      as.integer(datalist[["main"]]$DWE04) == 12 | 
      as.integer(datalist[["main"]]$DWE04) == 13 | 
      as.integer(datalist[["main"]]$DWE04) == 14 | 
      as.integer(datalist[["main"]]$DWE04) == 15) ~ 1,
  TRUE ~ 0) 
datalist[["main"]]$dwe04_cat <- labelled::labelled(datalist[["main"]]$dwe04_cat,
                        labels = c('Yes' = 1, 'No' = 0 ),
           label = "Proportion of improved wall: cement,stone,bricks, 
           cement blocks, covered adobe, wood planks")

####Calculate crowding index - overcrowded when more than 3 persons

datalist[["main"]]$crowding <- as.integer(datalist[["main"]]$HH01) /
                               as.integer(datalist[["main"]]$DWE05)
##if crowding <= 3, not overcrowded 
datalist[["main"]]$dwe05_cat <- dplyr::case_when( 
    datalist[["main"]]$crowding <= 3 ~ 1, 
    TRUE ~ 0)
datalist[["main"]]$dwe05_cat <- labelled::labelled(datalist[["main"]]$dwe05_cat,
                        labels = c('Yes' = 1, 'No' = 0 ),
           label = "Proportion of overcrowded sheters") 


## Add DWE08 and DWE09 to calculations - 
# if household is paying rent, they should be able to afford to pay rent without any financial distress

#affordable if HH pays rent and often and always without financial distress
datalist[["main"]]$dwe09_cat <-  dplyr::case_when( 
  (as.integer(datalist[["main"]]$DWE08) == 1 &
     (as.integer(datalist[["main"]]$DWE09) == 1 | 
      as.integer(datalist[["main"]]$DWE09) == 2 ) ) ~ 1,
  
  (as.integer(datalist[["main"]]$DWE08) == 1 &
     (as.integer(datalist[["main"]]$DWE09) == 3 | 
      as.integer(datalist[["main"]]$DWE09) == 4 ) ) ~ 0,  
  
  datalist[["main"]]$DWE08== 0 ~ 1)

datalist[["main"]]$dwe09_cat <- labelled::labelled(datalist[["main"]]$dwe09_cat,
                        labels = c('Yes' = 1, 'No' = 0 ),
   label = "Proportion of affordable sheters - HH pays rent and often and always without financial distress")
      
####Combine all shelter indicators 

##dwe01_cat / dwe02_cat / dwe03_cat / dwe04_cat / dwe05_cat / dwe09_cat


datalist[["main"]]$outcome9_1 <- dplyr::case_when(
    datalist[["main"]]$dwe01_cat == 0 | 
    datalist[["main"]]$dwe02_cat == 0 | 
    datalist[["main"]]$dwe03_cat == 0 | 
    datalist[["main"]]$dwe04_cat == 0 | 
    datalist[["main"]]$dwe05_cat == 0 | 
    datalist[["main"]]$dwe09_cat == 0  ~ 0,
    
    datalist[["main"]]$dwe01_cat == 1 & 
    datalist[["main"]]$dwe02_cat == 1 & 
    datalist[["main"]]$dwe03_cat == 1 & 
    datalist[["main"]]$dwe04_cat == 1 & 
    datalist[["main"]]$dwe05_cat == 1 & 
    datalist[["main"]]$dwe09_cat == 1 ~ 1)

datalist[["main"]]$outcome9_1  <- labelled::labelled(datalist[["main"]]$outcome9_1,
                        labels = c('Yes' = 1, 'No' = 0 ),
   label = "Proportion of PoCs living in habitable and affordable housing")

  }
   return(datalist) 
}
