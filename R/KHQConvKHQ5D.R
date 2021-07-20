
# Brazier et al. (2008)

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


#' @title KHQConvKHQ5D
#' @description Function used to convert the KHQ item scores to KHQ5D scores.
#' @param scores data.frame containing 9 items that compose the KHQ5D; colnames
#'   must be 3a, 3b, 4a, 4b, 4d, 5c, 6a, 6b, and 7a.
#' @param save.xlsx logical to indicate whether or not save the results; Default: FALSE.
#' @param filename string specifying the file name if save.xlsx = TRUE; 
#'   Default: "KHQ_conv_KHQ5D.xlsx".
#' @param sheetName string specifying the sheet name if save.xlsx = TRUE; 
#'   Default: "Scores".
#' @param ignore.invalid logical to indicate whether to ignore items data 
#'   with invalid, incomplete or missing data; Default: FALSE
#' @return A data frame with scores of the KHQ five dimensions (KHQ5D).
#' @details Nine items of the KHQ are used to calculate the KHQ5D scores. The 
#'   items must be named equal the number in the original questionnaire (3a, 3b, 
#'   4a, 4b, 4d, 5c, 6a, 6b, 7a).
#' 
#' 
#' @examples 
#' scores.df <- data.frame(
#'   "3a" = c(4,3,4,3,2), "3b" = c(4,3,4,3,2), 
#'   "4a" = c(1,3,4,3,4), "4b" = c(1,3,4,3,4), 
#'   "4d" = c(2,2,3,4,2), "5c" = c(2,2,3,4,2), 
#'   "6a" = c(3,2,2,4,1), "6b" = c(3,2,2,4,1),
#'   "7a" = c(1,3,4,3,4), check.names = FALSE)
#' 
#' KHQConvKHQ5D(scores = scores.df, ignore.invalid = FALSE)
#' 
#' scores.df2 <- data.frame(
#'   "3a" = c(4,3,4,3,2), "3b" = c(4,3,4,3,2), 
#'   "4a" = c(1,3,4,3,4), "4b" = c(1,3,4,3,4), 
#'   "4d" = c(2,2,3,4,2), "5c" = c(2,2,3,4,2), 
#'   "6a" = c(3,2,2,4,1), "6b" = c(3,2,2,4,1),
#'   "7a" = c(1,3,4,3,4), check.names = FALSE)
#' 
#' KHQConvKHQ5D(scores = scores.df2, save.xlsx = FALSE,
#'   filename = "KHQ_conv_KHQ5D.xlsx", sheetName = "Scores",
#'   ignore.invalid = TRUE)
#' 
#' KHQConvKHQ5D(scores = KHQ_Conv_KHQ5D_data, save.xlsx = FALSE,
#'   filename = "KHQ_conv_KHQ5D.xlsx", sheetName = "Scores",
#'   ignore.invalid = TRUE)
#' 
#' @seealso 
#'  \code{\link[KHQ]{KHQ5D}}
#' @rdname KHQConvKHQ5D
#' @export 
#' @importFrom magrittr %>%
#' @importFrom openxlsx write.xlsx


KHQConvKHQ5D <- function(
  scores,
  save.xlsx = FALSE,
  filename = NULL,
  sheetName = NULL,
  ignore.invalid = FALSE
){
  
  # Checking the class of the data
  if (is.data.frame(scores) == FALSE) {
    stop("Use an matrix of data with 'class' data.frame instead of ", class(scores))
    
  }
  
  
  # Checking number of items
  if (is.data.frame(scores) & ncol(scores) != 9) {
    print(colnames(scores))
    stop("Number of items is different from what is needed to convert KHQ data to KHQ5D data. Items must be 3a, 3b, 4a, 4b, 4d, 5c, 6a, 6b and 7a.")
    
  }
  
  
  # Checking the name of the items
  ItemsNames <- c("3a", "3b", "4a", "4b", "4d", "5c", "6a", "6b", "7a")
  
  if (is.data.frame(scores) & ncol(scores) == 9) {
    if(!all(ItemsNames %in% names(scores))) {
      print(names(scores))
      stop("Unable to identify the name of the items in the KHQ data. Items must be 3a, 3b, 4a, 4b, 4d, 5c, 6a, 6b and 7a.")
      
    }
  }
  
  # Converting the response from the Personal Relationship domain that was marked as Not Applicable = 0 in NA
  scores$"5c"[scores$"5c" == 0] <- NA
  
  # Checking coded scores
  if(any(apply(scores, 1, function(x) !all(x %in% c(NA, 1:4))) == TRUE)) {
    rowCodedWrong <- data.frame(rowCodedWrong = apply(scores, 1, function(x) !all(x %in% c(NA, 1:4))))
    rowCodedWrong <- data.frame(rowCodedWrong = rowCodedWrong, numRowCodeWrong = rownames(rowCodedWrong))
    print(scores[rowCodedWrong[rowCodedWrong[,1] == "TRUE", 2],])
    stop("Scores must be coded as 1, 2, 3 or 4 for these items of the KHQ.")
  }
  
  
  # Checking NAs
  if (ignore.invalid == TRUE & any(is.na(scores) == TRUE)) {
    scores[is.na(scores) == TRUE] <- 0
    
  } else if (ignore.invalid == FALSE & any(is.na(scores) == TRUE)){
    rowNAs <- which(is.na(scores) == TRUE, arr.ind = TRUE) %>% data.frame()
    print(scores[unique(rowNAs$row),])
    stop("Missing/non-numeric item found. In case the response was randomly lost, consider use ignore.invalid == TRUE to avoid further problems.")
  }
  
  
  # Converting the KHQ items into the KHQ5D classification
  conv_score <- data.frame(RL = rep(0, nrow(scores)),
                           PL = rep(0, nrow(scores)),
                           SL = rep(0, nrow(scores)),
                           E = rep(0, nrow(scores)),
                           S = rep(0, nrow(scores)))
  
  for (i in 1:nrow(scores)) {
    # Role Limitations
    if (scores$"3a"[i] > scores$"3b"[i]) {
      conv_score[i,1] <- scores$"3a"[i]
    } else {
      conv_score[i,1] <- scores$"3b"[i]
    }
    
    # Physical Limitations
    if (scores$"4a"[i] > scores$"4b"[i]) {
      conv_score[i,2] <- scores$"4a"[i]
    } else {
      conv_score[i,2] <- scores$"4b"[i]
    }
    
    # Social Limitations
    if (scores$"4d"[i] > scores$"5c"[i]) {
      conv_score[i,3] <- scores$"4d"[i]
    } else {
      conv_score[i,3] <- scores$"5c"[i]
    }
    
    # Energy
    if (scores$"6a"[i] > scores$"6b"[i]) {
      conv_score[i,4] <- scores$"6a"[i]
    } else {
      conv_score[i,4] <- scores$"6b"[i]
    }
    
    # Sleep
    conv_score[i,5] <- scores$"7a"[i]
  }
  
  conv_score[conv_score == 0] <- NA
  
  
  # Saving results to an Excel file
  if (save.xlsx == TRUE & is.null(filename) & is.null(sheetName)) {
    openxlsx::write.xlsx(conv_score, file = "KHQ_conv_KHQ5D.xlsx", sheetName = "Scores", keepNA = FALSE, na.string = "NA", overwrite = TRUE)
    
  } else if (save.xlsx == TRUE) {
    openxlsx::write.xlsx(conv_score, file = filename, sheetName = sheetName, keepNA = FALSE, na.string = "NA", overwrite = TRUE)
    
  }
  
  return(conv_score)
  
}
