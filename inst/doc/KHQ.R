## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----example 1----------------------------------------------------------------
library(KHQ)

# The items must be named equal the number in the original questionnaire published by Kelleher and collaborator in 1997 (1, 2, 3a, 3b, 4a, 4b, 4c, 4d, 5a, 5b, 5c, 6a, 6b, 6c, 7a, 7b, 8a, 8b, 8c, 8d, 8e, 9a, 9b, 9c, 9d, 9e, 9f, 9g, 9h, 9i, 9j, 9k)

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
  "8a" = c(1,2,3,4,NA,NA), "8b" = c(1,2,3,4,NA,NA), "8c" = c(1,2,3,4,NA,NA), "8d" = c(1,2,3,4,NA,NA), "8e" = c(1,2,3,4,NA,NA),
  "9a" = c(0,1,2,3,NA,NA), "9b" = c(0,1,2,3,NA,NA), "9c" = c(0,1,2,3,NA,NA), "9d" = c(0,1,2,3,NA,NA), "9e" = c(0,1,2,3,NA,NA), "9f" = c(0,1,2,3,NA,NA), "9g" = c(0,1,2,3,NA,NA), "9h" = c(0,1,2,3,NA,NA), "9i" = c(0,1,2,3,NA,NA), "9j" = c(0,1,2,3,NA,NA), "9k" = c(0,1,2,3,NA,NA),
  check.names = FALSE)


# Original algorithm
KHQScores(scores = scores_UK, country = "UK", author = "Kelleher", year = 1997, ignore.invalid = TRUE)


UK_scores <- data.frame(
  "1" = c(1,2,3,4,5,4), 
  "2" = c(4,3,2,1,NA,4), 
  "3a" = c(1,2,3,4,NA,4), "3b" = c(1,2,3,4,NA,3), 
  "4a" = c(4,1,1,3,3,NA), "4b" = c(1,2,3,4,2,NA),
  "4c" = c(4,3,2,1,NA,1), "4d" = c(1,2,3,4,NA,1),
  "5a" = c(4,3,2,1,1,NA), "5b" = c(1,2,3,4,NA,1), "5c" = c(4,3,2,1,0,1),
  "6a" = c(1,2,3,4,2,NA), "6b" = c(4,3,2,1,2,NA), "6c" = c(1,2,3,4,4,NA),
  "7a" = c(4,3,2,1,NA,3), "7b" = c(1,2,3,4,NA,3),
  "8a" = c(4,3,2,1,4,NA), "8b" = c(1,2,3,4,2,NA), "8c" = c(4,3,2,1,2,NA), "8d" = c(4,3,2,1,NA,NA), "8e" = c(1,2,3,4,NA,NA),
  "9a" = c(0,1,2,3,NA,NA), "9b" = c(3,2,1,0,NA,NA), "9c" = c(0,1,2,3,NA,NA), "9d" = c(3,2,1,0,NA,NA), "9e" = c(0,1,2,3,NA,NA), "9f" = c(3,2,1,0,NA,NA), "9g" = c(0,1,2,3,NA,NA), "9h" = c(3,2,1,0,NA,NA), "9i" = c(0,1,2,3,NA,NA), "9j" = c(3,2,1,0,NA,NA), "9k" = c(0,1,2,3,NA,NA),
  check.names = FALSE)


# There is an option to use the 'save.xlsx', where you can enter the 'filename' and 'sheetName'. The file with the calculated scores is saved in .xlsx format (Excel file).
KHQScores(scores = UK_scores, country = "UK", author = "Kelleher", year = 1997, save.xlsx = FALSE, filename = "Res_Scores_Dimensions_KHQ.xlsx", sheetName = "Scores", ignore.invalid = TRUE)

## ----example 2----------------------------------------------------------------
# Nine items of the KHQ are used to calculate the KHQ5D scores.
# The items must be named equal the number in the original questionnaire (3a, 3b, 4a, 4b, 4d, 5c, 6a, 6b, 7a)

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


# Converting the KHQ items into the KHQ5D classification using a data.frame with all items completed
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
  check.names = FALSE
)

KHQConvKHQ5D(scores = scores, ignore.invalid = FALSE)


# Converting the KHQ items into the KHQ5D classification using a data.frame with a missing response. In this example, use ignore.invalid = TRUE to avoid any problems with missing data.
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
  check.names = FALSE
)

KHQConvKHQ5D(scores = scores_2, ignore.invalid = TRUE)


# As with in the KHQScore function it is possible to use the 'save.xlsx'.
KHQConvKHQ5D(scores = scores, save.xlsx = FALSE, filename = "KHQ_conv_KHQ5D.xlsx", sheetName = "Scores", ignore.invalid = TRUE)

## ----example 3----------------------------------------------------------------
# Named vector RL, PL, SL, E and S represent Role limitation, Physical limitation, Social Limitation, Emotions and Sleep, respectfully.

# single calculation using the UK SG value set
scores <- c(RL = 1, PL = 1, SL = 1, E = 1, S = 1)

KHQ5D(scores = scores, country = "UK", type = "SG", author = "Brazier", year = 2008, source = "KHQ", ignore.invalid = TRUE)

# or

KHQ5D(scores = c(RL=1,PL=1,SL=1,E=1,S=1), country = "UK", type = "SG", author = "Brazier", year = 2008, source = "KHQ", ignore.invalid = TRUE)


# Using five digit format
KHQ5D(scores = 11111, country = "UK", type = "SG", author = "Brazier", year = 2008, source = "KHQ", ignore.invalid = TRUE)

# or

KHQ5D(scores = c(11111), country = "UK", type = "SG", author = "Brazier", year = 2008, source = "KHQ", ignore.invalid = TRUE)


# Using a data.frame with individual dimensions
scores.df <- data.frame(
  RL = c(1,2,3,4,2), 
  PL = c(4,3,4,3,2), 
  SL = c(1,2,2,4,1), 
  E = c(1,3,4,3,4), 
  S = c(1,2,1,2,1)
)

KHQ5D(scores = scores.df, country = "UK", type = "SG", author = "Brazier", year = 2008, source = "KHQ", ignore.invalid = TRUE)


# Data.frame using five digit format
scores.df2 <- data.frame(state = c(11111, 22432, 34241, 43332, 22141))

KHQ5D(scores = scores.df2, country = "UK", type = "SG", author = "Brazier", year = 2008, source = "KHQ", ignore.invalid = TRUE)

# or using a vector

KHQ5D(scores = scores.df2$state, country = "UK", type = "SG", author = "Brazier", year = 2008, source = "KHQ", ignore.invalid = TRUE)


# As with in the KHQScore function it is possible to use the 'save.xlsx'.
KHQ5D(scores = scores.df, country = "UK", type = "SG", author = "Brazier", year = 2008, source = "KHQ", save.xlsx = FALSE, filename = "Res_KHQ5D_uti_ind.xlsx", sheetName = "Utility_Index", ignore.invalid = TRUE)

## ----example data-------------------------------------------------------------
## Loading example data from KHQ items.
scores_UK <- KHQ_data_Kelleher

# Calculating the scores of each dimension
scores_KHQ <- KHQScores(scores = scores_UK, country = "UK", author = "Kelleher", year = 1997, ignore.invalid = TRUE)

# Top 6 scores
head(scores_KHQ)


## Loading example data from KHQ items used to be converted to KHQ5D scores.
scores_KHQ_to_conv <- KHQ_Conv_KHQ5D_data

# Converting the scores of each dimension of the KHQ5D
scores_KHQ5D <- KHQConvKHQ5D(scores = scores_KHQ_to_conv, ignore.invalid = TRUE)

# Top 6 scores
head(scores_KHQ5D)


## Calculating the utility index of the KHQ5D using the converted scores
# Calculating the scores of each dimension
uti_index <- KHQ5D(scores = scores_KHQ5D, country = "UK", type = "SG", author = "Brazier", year = 2008, source = "KHQ", ignore.invalid = TRUE)

# Top 6 scores
head(uti_index)


## It is also possible to used a example data from KHQ5D.
KHQ5D_scores <- KHQ5D_data

# Calculate the scores of each dimension
df_uti_index <- KHQ5D(scores = KHQ5D_scores, country = "UK", type = "SG", author = "Brazier", year = 2008, source = "KHQ", ignore.invalid = TRUE)

# Top 6 scores
head(df_uti_index)

