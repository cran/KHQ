
<!-- README.md is generated from README.Rmd. Please edit that file -->
<!-- badges: start -->

[![R-CMD-check](https://github.com/augustobrusaca/KHQ/workflows/R-CMD-check/badge.svg)](https://github.com/augustobrusaca/KHQ/actions)
[![Travis-CI Build
Status](https://travis-ci.com/augustobrusaca/KHQ.svg?branch=master)](https://travis-ci.com/augustobrusaca/KHQ)
[![CRAN RStudio mirror
downloads](https://cranlogs.r-pkg.org/badges/KHQ)](https://www.r-pkg.org:443/pkg/KHQ)
<!-- badges: end -->

# KHQ

## King’s Health Questionnaire (KHQ)

The KHQ is a disease-specific, self-administered questionnaire designed
specific to assess the impact of Urinary incontinence (UI) on Quality of
Life (QoL). The questionnaire was developed by [Kelleher and
collaborators in
1997](https://doi.org/10.1111/j.1471-0528.1997.tb11006.x). It is a
simple, acceptable and reliable measure to use in the clinical setting
and a research tool that is useful in evaluating UI treatment outcomes.

The KHQ consists of two parts and 32 items. The first part is composed
by 21 items investigating nine domains with four to five response
categories – Likert scale. There are two single-item questions that
address General Health Perception (GHP) and Incontinence Impact (II).
The following seven multi-item domains are: Role Limitations (RL; 2
items), Physical Limitations (PL; 2 items), Social Limitations (SL; 2
items), Personal Relationships (PR; 3 items), Emotions (E; 3 items),
Sleep and Energy Disturbances associated with UI (SE; 2 items), and
Severity Measures for UI (SM; 5 items). The second part is a 11-item
Symptom Severity Scale (SSS) that assesses the presence and severity of
urinary symptoms. The KHQ is scored by domain, and scores range from 0
(best QoL) to 100 (worst QoL). While the SSS is scored by adding the 11
items, thus ranging from 0 (best) to 33 (worst).

## KHQ five dimensions (KHQ5D)

The KHQ5D is a condition-specific preference-based measure developed by
[Brazier and collaborators in
2008](https://doi.org/10.1177/0272989X07301820). Although not as popular
as the [SF6D](https://doi.org/10.1016/S0895-4356(98)00103-6) and
[EQ-5D](https://euroqol.org/), the KHQ5D measures health-related quality
of life (HRQoL) specifically for UI, not general conditions like the
others two instruments mentioned. The KHQ5D can be used in the clinical
and economic evaluation of health care. The subject self-rates their
health in terms of five dimensions: Role Limitation (RL), Physical
Limitations (PL), Social Limitations (SL), Emotions (E), and Sleep (S).
Following assessment, the Health States (i.e., scores) are reported as a
five-digit number ranging from 11111 (full health) to 44444 (worst
health). This five-digit Health Profiles are converted to a single
utility value (utility index, index value) using country specific value
sets, which can be used in the clinical and economic evaluation of
health care as well as in population health surveys.

## Installation

You can install the released version of KHQ from
[CRAN](https://CRAN.R-project.org/package=KHQ) with:

``` r
install.packages("KHQ")
```

And the development version from
[GitHub](https://github.com/augustobrusaca/KHQ) with:

``` r
install.packages("devtools")

devtools::install_github("augustobrusaca/KHQ")
```

## Quick Start

### KHQScore function - calculating scores for each dimension of the KHQ

``` r
library(KHQ)
library(magrittr)

# The items must be named equal the number in the original questionnaire
# published by Kelleher and collaborator in 1997 (1, 2, 3a, 3b, 4a, 4b, 
# 4c, 4d, 5a, 5b, 5c, 6a, 6b, 6c, 7a, 7b, 8a, 8b, 8c, 8d, 8e, 9a, 9b, 9c, 
# 9d, 9e, 9f, 9g, 9h, 9i, 9j, 9k)

# Kelleher et al. (1997)

#         Domains             Items
# General Health Perception - 1
# Incontinence Impact       - 2
# Role Limitations          - 3a and 3b
# Physical limitations      - 4a and 4b
# Social limitations        - 4c and 4d
# Personal Relationships    - 5a, 5b and 5c
# Emotions                  - 6a, 6b and 6c
# Sleep/Energy              - 7a and 7b
# Severity Measures         - 8a, 8b, 8c, 8d and 8e
# Symptom Severity Scale    - 9a, 9b, 9c, 9d, 9e, 9f, 9g, 9h, 9i and 9j


# Computing the scores of each domain of the KHQ
# Data frame with items of the original questionnaire
scores_UK <- data.frame(
  "1" = c(1,2,3,4,5,NA), 
  "2" = c(1,2,3,4,NA,NA), 
  "3a" = c(1,2,3,4,NA,NA), "3b" = c(1,2,3,4,NA,NA), 
  "4a" = c(1,2,3,4,NA,NA), "4b" = c(1,2,3,4,NA,NA),
  "4c" = c(1,2,3,4,NA,1), "4d" = c(1,2,3,4,NA,1),
  "5a" = c(1,2,3,4,1,NA), "5b" = c(1,2,3,4,NA,1), "5c" = c(1,2,3,4,0,1),
  "6a" = c(1,2,3,4,NA,NA), "6b" = c(1,2,3,4,NA,NA), "6c" = c(1,2,3,4,NA,NA),
  "7a" = c(1,2,3,4,NA,NA), "7b" = c(1,2,3,4,NA,NA),
  "8a" = c(1,2,3,4,NA,NA), "8b" = c(1,2,3,4,NA,NA), "8c" = c(1,2,3,4,NA,NA), 
  "8d" = c(1,2,3,4,NA,NA), "8e" = c(1,2,3,4,NA,NA),
  "9a" = c(0,1,2,3,NA,NA), "9b" = c(0,1,2,3,NA,NA), "9c" = c(0,1,2,3,NA,NA), 
  "9d" = c(0,1,2,3,NA,NA), "9e" = c(0,1,2,3,NA,NA), "9f" = c(0,1,2,3,NA,NA), 
  "9g" = c(0,1,2,3,NA,NA), "9h" = c(0,1,2,3,NA,NA), "9i" = c(0,1,2,3,NA,NA), 
  "9j" = c(0,1,2,3,NA,NA), "9k" = c(0,1,2,3,NA,NA),
  check.names = FALSE)


# Original algorithm
KHQScores(scores = scores_UK, country = "UK", author = "Kelleher", 
          year = 1997, ignore.invalid = TRUE) %>% round(2)
#>   GHP     II     RL     PL     SL     PR      E     SE     SM SSS
#> 1   0   0.00   0.00   0.00   0.00   0.00   0.00   0.00   0.00   0
#> 2  25  33.33  33.33  33.33  33.33  33.33  33.33  33.33  33.33  11
#> 3  50  66.67  66.67  66.67  66.67  66.67  66.67  66.67  66.67  22
#> 4  75 100.00 100.00 100.00 100.00 100.00 100.00 100.00 100.00  33
#> 5 100     NA     NA     NA     NA   0.00     NA     NA     NA   0
#> 6  NA     NA     NA     NA   0.00   0.00     NA     NA     NA   0


UK_scores <- data.frame(
  "1" = c(1,2,3,4,5,4), 
  "2" = c(4,3,2,1,NA,4), 
  "3a" = c(1,2,3,4,NA,4), "3b" = c(1,2,3,4,NA,3), 
  "4a" = c(4,1,1,3,3,NA), "4b" = c(1,2,3,4,2,NA),
  "4c" = c(4,3,2,1,NA,1), "4d" = c(1,2,3,4,NA,1),
  "5a" = c(4,3,2,1,1,NA), "5b" = c(1,2,3,4,NA,1), "5c" = c(4,3,2,1,0,1),
  "6a" = c(1,2,3,4,2,NA), "6b" = c(4,3,2,1,2,NA), "6c" = c(1,2,3,4,4,NA),
  "7a" = c(4,3,2,1,NA,3), "7b" = c(1,2,3,4,NA,3),
  "8a" = c(4,3,2,1,4,NA), "8b" = c(1,2,3,4,2,NA), "8c" = c(4,3,2,1,2,NA), 
  "8d" = c(4,3,2,1,NA,NA), "8e" = c(1,2,3,4,NA,NA),
  "9a" = c(0,1,2,3,NA,NA), "9b" = c(3,2,1,0,NA,NA), "9c" = c(0,1,2,3,NA,NA), 
  "9d" = c(3,2,1,0,NA,NA), "9e" = c(0,1,2,3,NA,NA), "9f" = c(3,2,1,0,NA,NA), 
  "9g" = c(0,1,2,3,NA,NA), "9h" = c(3,2,1,0,NA,NA), "9i" = c(0,1,2,3,NA,NA), 
  "9j" = c(3,2,1,0,NA,NA), "9k" = c(0,1,2,3,NA,NA),
  check.names = FALSE)


# There is an option to use the 'save.xlsx', where you can enter the 
# 'filename' and 'sheetName'. The file with the calculated scores is 
# saved in .xlsx format (Excel file).
KHQScores(scores = UK_scores, country = "UK", author = "Kelleher", 
          year = 1997, ignore.invalid = TRUE, save.xlsx = FALSE, 
          filename = "Res_Scores_Dimensions_KHQ.xlsx", 
          sheetName = "Scores") %>% round(2)
#>   GHP     II     RL    PL    SL PR     E    SE    SM SSS
#> 1   0 100.00   0.00 50.00 66.67 50 33.33 50.00 60.00  15
#> 2  25  66.67  33.33 16.67 55.56 50 44.44 50.00 53.33  16
#> 3  50  33.33  66.67 33.33 44.44 50 55.56 50.00 46.67  17
#> 4  75   0.00 100.00 83.33 33.33 50 66.67 50.00 40.00  18
#> 5 100     NA     NA 50.00    NA  0 55.56    NA    NA   0
#> 6  75 100.00  83.33    NA  0.00  0    NA 66.67    NA   0
```

Dealing with missing data (scores) of the dimensions of the King’s
Health Questionnaire following the article by [Reese and collaborators
(2003)](https://doi.org/10.1023/A:1023422208910). Resse et al. used the
strategy of inserting the mean of items of a certain dimension into the
missing item of the same dimension.

Reese et al. (2003) - “Missing responses for questions in a summated
domain (i.e., all domains except the KHQ symptom severity) were imputed
if at least half of the items in the domain had non-missing responses by
using the mean value of responses to other items within the same
domain.”

``` r
# Data frame with items of the original questionnaire
df_UK_scores <- data.frame(
  "1" = c(1,2,3,4,5,4), 
  "2" = c(4,3,2,1,NA,4), 
  "3a" = c(1,NA,3,4,NA,4), "3b" = c(1,2,3,4,NA,3), 
  "4a" = c(4,1,1,3,3,NA), "4b" = c(NA,2,3,4,2,NA),
  "4c" = c(4,3,2,1,4,1), "4d" = c(1,2,3,4,NA,1),
  "5a" = c(4,3,2,NA,1,NA), "5b" = c(1,2,3,4,NA,1), "5c" = c(4,3,2,1,0,1),
  "6a" = c(1,2,3,4,2,NA), "6b" = c(4,3,NA,1,2,NA), "6c" = c(1,2,3,4,4,NA),
  "7a" = c(4,3,2,1,NA,3), "7b" = c(1,NA,3,4,NA,3),
  "8a" = c(4,3,2,1,4,NA), "8b" = c(1,NA,3,4,2,2), "8c" = c(4,3,2,1,2,3), 
  "8d" = c(4,3,2,1,NA,NA), "8e" = c(1,2,3,4,NA,NA),
  "9a" = c(0,1,2,3,1,1), "9b" = c(3,2,1,0,NA,NA), "9c" = c(0,1,2,3,1,2), 
  "9d" = c(3,2,1,0,3,1), "9e" = c(0,1,2,3,2,NA), "9f" = c(3,2,1,0,3,3), 
  "9g" = c(0,1,2,3,NA,NA), "9h" = c(3,2,1,0,NA,3), "9i" = c(0,1,2,3,3,3), 
  "9j" = c(3,2,1,0,NA,3), "9k" = c(0,1,2,3,1,NA),
  check.names = FALSE)

# Computing the scores of each domain of the KHQ using mean.na = TRUE
KHQScores(scores = df_UK_scores, country = "UK", author = "Kelleher", 
          year = 1997, ignore.invalid = TRUE, mean.na = TRUE) %>% round(2)
#>   GHP     II     RL     PL     SL PR     E    SE    SM SSS
#> 1   0 100.00   0.00 100.00  66.67 50 33.33 50.00 60.00  15
#> 2  25  66.67  33.33  16.67  55.56 50 44.44 66.67 58.33  16
#> 3  50  33.33  66.67  33.33  44.44 50 66.67 50.00 46.67  17
#> 4  75   0.00 100.00  83.33  33.33 75 66.67 50.00 40.00  18
#> 5 100     NA     NA  50.00 100.00  0 55.56    NA 55.56  14
#> 6  75 100.00  83.33     NA   0.00  0    NA 66.67 50.00  16
```

### KHQConvKHQ5D function - converts KHQ item scores to KHQ5D scores

``` r
# Nine items of the KHQ are used to calculate the KHQ5D scores.
# The items must be named equal the number in the original 
# questionnaire (3a, 3b, 4a, 4b, 4d, 5c, 6a, 6b, 7a)

# Original domains and items
#         Domains             Items
# Role Limitations          - 3a and 3b
# Physical limitations      - 4a and 4b
# Social limitations        - 4d
# Personal Relationships    - 5c
# Emotions                  - 6a and 6b
# Sleep/Energy              - 7a


# Five dimensions and items of the KHQ5D
#      Dimensions         Items
# Role limitation       - 3a and 3b
# Physical limitation   - 4a and 4b
# Social Limitation     - 4d and 5c
# Emotions              - 6a and 6b
# Sleep                 - 7a


# Converting the KHQ items into the KHQ5D classification using a 
# data.frame with all items completed
scores <- data.frame(
  "3a" = c(4,3,4,3,2), 
  "3b" = c(4,3,4,3,2), 
  "4a" = c(1,3,4,3,4), 
  "4b" = c(1,3,4,3,4), 
  "4d" = c(2,2,3,4,2),
  "5c" = c(2,2,3,4,2), 
  "6a" = c(3,2,2,4,1), 
  "6b" = c(3,2,2,4,1), 
  "7a" = c(1,3,4,3,4),
  check.names = FALSE)

KHQConvKHQ5D(scores = scores, ignore.invalid = FALSE)
#>   RL PL SL E S
#> 1  4  1  2 3 1
#> 2  3  3  2 2 3
#> 3  4  4  3 2 4
#> 4  3  3  4 4 3
#> 5  2  4  2 1 4


# Converting the KHQ items into the KHQ5D classification using a 
# data.frame with a missing response. In this example, use 
# ignore.invalid = TRUE to avoid any problems with missing data.
scores_2 <- data.frame(
  "3a" = c(4,3,4,3,2), 
  "3b" = c(4,3,4,3,2), 
  "4a" = c(1,3,4,3,4), 
  "4b" = c(1,3,4,3,4), 
  "4d" = c(2,2,3,4,2),
  "5c" = c(2,2,3,4,2), 
  "6a" = c(3,2,2,4,1), 
  "6b" = c(3,NA,2,4,1), 
  "7a" = c(1,3,4,3,4),
  check.names = FALSE)

KHQConvKHQ5D(scores = scores_2, ignore.invalid = TRUE)
#>   RL PL SL E S
#> 1  4  1  2 3 1
#> 2  3  3  2 2 3
#> 3  4  4  3 2 4
#> 4  3  3  4 4 3
#> 5  2  4  2 1 4


# As with in the KHQScore function it is possible to use the 'save.xlsx'.
KHQConvKHQ5D(scores = scores, save.xlsx = FALSE, 
             filename = "KHQ_conv_KHQ5D.xlsx", 
             sheetName = "Scores", ignore.invalid = TRUE)
#>   RL PL SL E S
#> 1  4  1  2 3 1
#> 2  3  3  2 2 3
#> 3  4  4  3 2 4
#> 4  3  3  4 4 3
#> 5  2  4  2 1 4
```

### KHQ5D function - calculating the utility index of the KHQ5D

``` r
# Named vector RL, PL, SL, E and S represent Role limitation, 
# Physical limitation, Social Limitation, Emotions and Sleep, 
# respectfully.

# single calculation using the UK SG value set
scores <- c(RL = 1, PL = 1, SL = 1, E = 1, S = 1)

KHQ5D(scores = scores, country = "UK", type = "SG", 
      author = "Brazier", year = 2008, source = "KHQ", 
      ignore.invalid = TRUE)
#>   UtilityIndex
#> 1        0.996

# or

KHQ5D(scores = c(RL=1,PL=1,SL=1,E=1,S=1), country = "UK", 
      type = "SG", author = "Brazier", year = 2008, source = "KHQ", 
      ignore.invalid = TRUE)
#>   UtilityIndex
#> 1        0.996


# Using five digit format
KHQ5D(scores = 11111, country = "UK", type = "SG", 
      author = "Brazier", year = 2008, source = "KHQ", 
      ignore.invalid = TRUE)
#>   UtilityIndex
#> 1        0.996

# or

KHQ5D(scores = c(11111), country = "UK", type = "SG", 
      author = "Brazier", year = 2008, source = "KHQ", 
      ignore.invalid = TRUE)
#>   UtilityIndex
#> 1        0.996

# or

KHQ5D(scores = c(11111, 22432, 34241, 43332, 22141), 
      country = "UK", type = "SG", author = "Brazier", 
      year = 2008, source = "KHQ", ignore.invalid = TRUE)
#>   UtilityIndex
#> 1        0.996
#> 2        0.930
#> 3        0.947
#> 4        0.926
#> 5        0.965


# Using a data.frame with individual dimensions
scores.df <- data.frame(
  RL = c(1,2,3,4,2), 
  PL = c(4,3,4,3,2), 
  SL = c(1,2,2,4,1), 
  E = c(1,3,4,3,4), 
  S = c(1,2,1,2,1))

KHQ5D(scores = scores.df, country = "UK", type = "SG", 
      author = "Brazier", year = 2008, source = "KHQ", 
      ignore.invalid = TRUE)
#>   UtilityIndex
#> 1        0.990
#> 2        0.946
#> 3        0.947
#> 4        0.910
#> 5        0.965


# Data.frame using five digit format
scores.df2 <- data.frame(state = c(11111, 22432, 34241, 43332, 22141))

KHQ5D(scores = scores.df2, country = "UK", type = "SG", 
      author = "Brazier", year = 2008, source = "KHQ", 
      ignore.invalid = TRUE)
#>   UtilityIndex
#> 1        0.996
#> 2        0.930
#> 3        0.947
#> 4        0.926
#> 5        0.965

# or using a vector

KHQ5D(scores = scores.df2$state, country = "UK", type = "SG", 
      author = "Brazier", year = 2008, source = "KHQ", 
      ignore.invalid = TRUE)
#>   UtilityIndex
#> 1        0.996
#> 2        0.930
#> 3        0.947
#> 4        0.926
#> 5        0.965


# Using weights = TRUE to generate the weights for each score of the KHQ5D
KHQ5D(scores = c(14411, 22432, 34241, 43332, 44444), country = "UK", type = "SG", 
      author = "Brazier", year = 2008, source = "KHQ", 
      ignore.invalid = TRUE, weights = TRUE)
#>       RL     PL     SL      E      S UtilityIndex
#> 1  0.000 -0.006 -0.027  0.000  0.000        0.963
#> 2 -0.009 -0.006 -0.027 -0.011 -0.013        0.930
#> 3 -0.016 -0.006 -0.011 -0.016  0.000        0.947
#> 4 -0.029 -0.006 -0.011 -0.011 -0.013        0.926
#> 5 -0.029 -0.006 -0.027 -0.016 -0.031        0.887


# As with in the KHQScore function it is possible to use the 'save.xlsx'.
KHQ5D(scores = scores.df, country = "UK", type = "SG", 
      author = "Brazier", year = 2008, source = "KHQ", 
      save.xlsx = FALSE, filename = "Res_KHQ5D_uti_ind.xlsx", 
      sheetName = "Utility_Index", ignore.invalid = TRUE)
#>   UtilityIndex
#> 1        0.990
#> 2        0.946
#> 3        0.947
#> 4        0.910
#> 5        0.965
```

### KHQ5Freq function - calculating the frequency, percentage, cumulative frequency and cumulative percentage for each health profile in an KHQ5D dataset

``` r
# Calculation using a data.frame with individual dimensions
KHQ5DFreq(scores = scores.df, ignore.invalid = TRUE)
#>   HealthState Frequency Percentage CumulativeFreq CumulativePerc
#> 1       14111         1         20              1             20
#> 2       22141         1         20              2             40
#> 3       23232         1         20              3             60
#> 4       34241         1         20              4             80
#> 5       43432         1         20              5            100

# Data.frame using five digit format
KHQ5DFreq(scores = scores.df2, ignore.invalid = TRUE)
#>   HealthState Frequency Percentage CumulativeFreq CumulativePerc
#> 1       11111         1         20              1             20
#> 2       22141         1         20              2             40
#> 3       22432         1         20              3             60
#> 4       34241         1         20              4             80
#> 5       43332         1         20              5            100

# or using a vector

KHQ5DFreq(scores = scores.df2$state, ignore.invalid = TRUE)
#>   HealthState Frequency Percentage CumulativeFreq CumulativePerc
#> 1       11111         1         20              1             20
#> 2       22141         1         20              2             40
#> 3       22432         1         20              3             60
#> 4       34241         1         20              4             80
#> 5       43332         1         20              5            100

# Using five digit format
KHQ5DFreq(scores = c(11111, 11111, 22432,34241, 43332, 22141), 
          ignore.invalid = TRUE)
#>   HealthState Frequency Percentage CumulativeFreq CumulativePerc
#> 1       11111         2       33.3              2           33.3
#> 2       22141         1       16.7              3           50.0
#> 3       22432         1       16.7              4           66.7
#> 4       34241         1       16.7              5           83.3
#> 5       43332         1       16.7              6          100.0

# As with in the KHQScore function it is possible to use the 'save.xlsx'.
KHQ5DFreq(scores = scores.df, save.xlsx = FALSE, 
          filename = "Res_KHQ5D_Frequency.xlsx", 
          sheetName = "Frequency", 
          ignore.invalid = TRUE)
#>   HealthState Frequency Percentage CumulativeFreq CumulativePerc
#> 1       14111         1         20              1             20
#> 2       22141         1         20              2             40
#> 3       23232         1         20              3             60
#> 4       34241         1         20              4             80
#> 5       43432         1         20              5            100
```

## Example data

Example data is included with the package and can be accessed using the
name of the data set.

``` r
## Loading example data from KHQ items.
scores_UK <- KHQ_data_Kelleher

# Calculating the scores of each dimension
scores_KHQ <- KHQScores(scores = scores_UK, country = "UK", 
                        author = "Kelleher", year = 1997, 
                        ignore.invalid = TRUE) %>% round(2)

# Top 6 scores
head(scores_KHQ)
#>   GHP     II     RL     PL    SL    PR     E     SE    SM SSS
#> 1  50  66.67  50.00  66.67  0.00  0.00 88.89   0.00 46.67   6
#> 2  25  33.33  33.33  16.67  0.00  0.00 11.11   0.00 20.00   2
#> 3  25   0.00   0.00   0.00  0.00  0.00  0.00   0.00 26.67   2
#> 4  25 100.00 100.00 100.00 33.33 33.33 44.44 100.00 60.00  15
#> 5  25  66.67 100.00  83.33 33.33 33.33 33.33  16.67 66.67  15
#> 6  50 100.00  50.00 100.00 66.67 50.00 88.89   0.00 66.67  15


## Loading example data from KHQ items used to be converted to KHQ5D scores.
scores_KHQ_to_conv <- KHQ_Conv_KHQ5D_data

# Converting the scores of each dimension of the KHQ5D
scores_KHQ5D <- KHQConvKHQ5D(scores = scores_KHQ_to_conv, ignore.invalid = TRUE)

# Top 6 scores
head(scores_KHQ5D)
#>   RL PL SL E S
#> 1  3  4  1 4 1
#> 2  2  2  1 2 1
#> 3  1  1  1 1 1
#> 4  4  4  2 4 4
#> 5  4  4  2 2 2
#> 6  4  4  4 4 1


## Calculating the utility index of the KHQ5D using the converted scores
# Calculating the scores of each dimension
uti_index <- KHQ5D(scores = scores_KHQ5D, country = "UK", 
                   type = "SG", author = "Brazier", year = 2008, 
                   source = "KHQ", ignore.invalid = TRUE)

# Top 6 scores
head(uti_index)
#>   UtilityIndex
#> 1        0.958
#> 2        0.971
#> 3        0.996
#> 4        0.903
#> 5        0.927
#> 6        0.918


## It is also possible to use the KHQ5D example data.
KHQ5D_scores <- KHQ5D_data

# Calculate the scores of each dimension
df_uti_index <- KHQ5D(scores = KHQ5D_scores, country = "UK", 
                      type = "SG", author = "Brazier", year = 2008, 
                      source = "KHQ", ignore.invalid = TRUE)

# Top 6 scores
head(df_uti_index)
#>   UtilityIndex
#> 1        0.958
#> 2        0.971
#> 3        0.996
#> 4        0.903
#> 5        0.927
#> 6        0.918


## Cumulative frequency analysis using the KHQ5D example data 
df_res_freq <- KHQ5DFreq(scores = KHQ5D_scores, ignore.invalid = TRUE)

# Top 6 scores
head(df_res_freq)
#>   HealthState Frequency Percentage CumulativeFreq CumulativePerc
#> 1       13111         2        6.7              2            6.7
#> 2       22121         2        6.7              4           13.3
#> 3       44131         2        6.7              6           20.0
#> 4       44441         2        6.7              8           26.7
#> 5       44444         2        6.7             10           33.3
#> 6       11111         1        3.3             11           36.7
```

## Error alerts

All functions check if the data is correct to be used, if there is any
error an error alert will be displayed.

Items checked when running the function:

-   KHQScores
    -   Checking the class of the data, it should be ‘class’ data.frame;
    -   Checking information to calculate the scores, such as: country,
        author, and year;
    -   Checking number of items;
    -   Checking the name of the items;
    -   Checking for NAs in the data;
    -   Checking coded scores.
-   KHQConvKHQ5D
    -   Checking the class of the data;
    -   Checking number of items;
    -   Checking the name of the items;
    -   Checking coded scores;
    -   Checking for NAs in the data.
-   KHQ5D
    -   Checking dimension names;
    -   Checking the five-digit data format;
    -   Checking for NAs in the data;
    -   Checking coded scores;
    -   Checking the country in which the weighted score was calculated;
    -   Checking other information of the data used, such as: Year,
        Author, Type, and Source.
-   KHQ5DFreq
    -   Checking dimension names;
    -   Checking the five-digit data format;
    -   Checking for NAs in the data;
    -   Checking coded scores;

Be aware that the evaluation of possible errors is done step-by-step in
the sequence given above. So if the data has more than one error it must
be corrected multiple times.

``` r
# Example
# Checking number of items
scores_UK_1 <- cbind(scores_UK, item = scores_UK[,1])

KHQScores(scores = scores_UK_1, country = "UK", author = "Kelleher", 
          year = 1997, ignore.invalid = TRUE)
#>  [1] "1"    "2"    "3a"   "3b"   "4a"   "4b"   "4c"   "4d"   "5a"   "5b"  
#> [11] "5c"   "6a"   "6b"   "6c"   "7a"   "7b"   "8a"   "8b"   "8c"   "8d"  
#> [21] "8e"   "9a"   "9b"   "9c"   "9d"   "9e"   "9f"   "9g"   "9h"   "9i"  
#> [31] "9j"   "9k"   "item"
#> Error in KHQScores(scores = scores_UK_1, country = "UK", author = "Kelleher", : The number of items is different from what is needed to calculate KHQ domain scores. 
#>       
#>  Number of items must be 32:
#>       
#>  General Health Perception  - 1;
#>       
#>  Incontinence Impact        - 2;
#>       
#>  Role Limitations           - 3a and 3b;
#>       
#>  Physical limitations       - 4a and 4b;
#>       
#>  Social limitations         - 4c and 4d;
#>       
#>  Personal Relationships     - 5a, 5b and 5c;
#>       
#>  Emotions                   - 6a, 6b and 6c;
#>       
#>  Sleep/Energy               - 7a and 7b;
#>       
#>  Severity Measures          - 8a, 8b, 8c, 8d and 8e;
#>       
#>  Symptom Severity Scale     - 9a, 9b, 9c, 9d, 9e, 9f, 9g, 9h, 9i, 9j and 9k.


# Checking coded scores
scores <- data.frame(
  "3a" = c(4,3,4,3,2), 
  "3b" = c(4,3,4,5,2), 
  "4a" = c(1,3,4,3,4), 
  "4b" = c(1,3,4,3,4), 
  "4d" = c(2,2,3,4,2),
  "5c" = c(2,2,3,4,2), 
  "6a" = c(3,2,2,4,1), 
  "6b" = c(3,2,2,4,1), 
  "7a" = c(1,3,4,3,4),
  check.names = FALSE)

KHQConvKHQ5D(scores = scores, ignore.invalid = FALSE)
#>   3a 3b 4a 4b 4d 5c 6a 6b 7a
#> 4  3  5  3  3  4  4  4  4  3
#> Error in KHQConvKHQ5D(scores = scores, ignore.invalid = FALSE): Scores must be coded as 1, 2, 3 or 4 for these items of the KHQ.

# The error shows which row in the data has a score outside the allowable limit.
```

## Information

Consult the documentation for each function and example data within the
package using ?\[name\] of the function or example data. It is also
possible to consult the functions on the [R Package
Documentation](https://rdrr.io/cran/KHQ/man/) website or download the
reference manual from the [CRAN](https://CRAN.R-project.org/package=KHQ)
repository.

Example: ?KHQScores

## Issues & Bugs

Please report [issues](https://github.com/augustobrusaca/KHQ/issues)
with [KHQ package](https://github.com/augustobrusaca/KHQ) in their
directory on GitHub or send an email to <augustobrusaca@gmail.com>. I
will be happy to resolve the issue & bug of the package as soon as
possible. Always remember to post/send a reproducible piece of your code
that is generating the issue & bug.

## Future functions

More coming soon. New ideas are welcome.

## License

This project is licensed under the MIT License - see the
[LICENSE.md](https://github.com/augustobrusaca/KHQ/blob/master/LICENSE.md)
file for details.
