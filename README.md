
<!-- README.md is generated from README.Rmd. Please edit that file -->

# {IndicatorCalc}

<!-- badges: start -->
<!-- badges: end -->

There is broad consensus around the key indicators used to measure,
inform and monitor progress towards global development objectives, as
exemplified by the Sustainable Development Goals and related efforts of
the MICS, DHS, IHSN, together with national governments. UNHCR’s
objectives are largely aligned with these frameworks. [UNHCR Results
Monitoring Surveys
(RMS)](https://intranet.unhcr.org/en/support-services/common-good-data-initiatives/household-surveys/Results-Monitoring-Surveys.html)
are household-level surveys with standard questionnaires following
context-appropriate methodological approaches. They can be implemented
across UNHCR operations to monitor changes in the lives of all relevant
groups of persons of concern (impacts) and in UNHCR’s key areas of
engagement (outcomes). RMS help us to calculate impact and outcome
indicators in a standardized way to have a global understanding of the
results. Both indicators and questionnaire is also largely aligned with
MICS, DHS, IHSN, national household surveys and other UNHCR standardized
surveys.

The goal of {IndicatorCalc} is to ease the implementation of standard
calculations for survey indicators related to Forcibly Displaced
Population.

The package is designed to work based on dataset standard backup format
exported from [kobotoolbox](http://http://kobo.unhcr.org) within [UNHCR
internal data repository](http://ridl.unhcr.org). It is adapted from the
initial [indicator
script](https://github.com/bozdagilgi/UNHCR-RMS-Indicators) version.

Each calculation is implemented as a function with in-built check to
identify whether the expected variables and modalities are within the
dataset and a `mapper` to transform the data in the expected format in
case of divergence of data structure between what was collected and what
is expected. You can check each [function
reference](/reference/index.html) to see in details all documented
calculations

*Population* refers to survey population in this guidance for the
calculation of indicators as shown by enumerator and denominator.
*Denominators* that are representing the households will be obtained by
weighting the number of households by the number of household members at
the end of the analysis. If there are no weights used it will be used as
‘weight’ variable for household level indicators.

## Usage

The easiest way to use the package is through the [shiny
interface](http://rstudio.unhcr.org/IndicatorCalc) and then follow the
instruction from there.

## Developpers

You can install the development version of {IndicatorCalc} from
[GitHub](https://github.com/unhcr-americas/IndicatorCalc) with:

``` r
# install.packages("devtools")
devtools::install_github("unhcr-americas/IndicatorCalc")
```

The package development roadmap includes:

- a dummy data generator
- an SDG comparison plot..
- a report template to output a quick exploration of all indicators
  results
- a shiny app to provide access to the package online with Rstudio
  connect (versus offline rstudio)
