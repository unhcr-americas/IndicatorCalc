
<!-- README.md is generated from README.Rmd. Please edit that file -->

# {IndicatorCalc}

<!-- badges: start -->
<!-- badges: end -->

The goal of {IndicatorCalc} is to ease the implementation of standard
calculation for survey indicators related to Forcibly Displaced
Population.

The package is designed to work based on dataset standard backup format
exported from [kobotoolbox](http://http://kobo.unhcr.org) within [UNHCR
internal data repository](http://ridl.unhcr.org). It is adapted from the
initial [RMS indicator
script](https://github.com/bozdagilgi/UNHCR-RMS-Indicators)

Each calculation is implemented as a function with in-built check to
identify whether the expected variables and modalities are within the
dataset and a `mapper` to transform the data in the expected format if
needs be. You can check each [function reference](/reference/index.html)
to see in details all documented calculations

The package also includes:

- a wrapper to chain all single calculations
- a report template to output a quick exploration of all indicators
  results
- a shiny app to provide access to the package online with Rstudio
  connect (versus offline rstudio)

## Usage

The easiest way to use the package is through the [shiny
interface](http://rstudio.unhcr.org/IndicatorCalc) and then follow the
instruction from there

## Developpers

You can install the development version of {IndicatorCalc} from
[GitHub](https://github.com/unhcr-americas/IndicatorCalc) with:

``` r
# install.packages("devtools")
devtools::install_github("unhcr-americas/IndicatorCalc")
```
