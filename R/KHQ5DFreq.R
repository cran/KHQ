

#' @title Cumulative frequency analysis
#' @description Function used to calculate the frequency, percentage, cumulative 
#'   frequency and cumulative percentage for each health profile in an KHQ5D dataset
#' @param scores data.frame with colnames RL, PL, SL, E, and S representing 
#'   Role limitation, Physical limitation, Social Limitation, Emotions 
#'   and Sleep. Alternatively a data.frame with the KHQ5D health profiles can be 
#'   provided in a five digit format e.g., data.frame(state = c(11111, 22432, 
#'   34241, 43332)).
#' @param save.xlsx logical to indicate whether or not save the results; Default: FALSE.
#' @param filename string specifying the file name if save.xlsx = TRUE; 
#'   Default: "Res_KHQ5D_Frequency.xlsx".
#' @param sheetName string specifying the sheet name if save.xlsx = TRUE; 
#'   Default: "Frequency".
#' @param ignore.invalid logical to indicate whether to ignore items data 
#'   with invalid, incomplete or missing data; Default: FALSE.
#' @return A data frame with the Health states, Frequency, Percentage, Cumulative 
#'   frequency and Cumulative percentage for each five digit profile in an KHQ5D 
#'   dataset.
#' @details Named vector RL, PL, SL, E and S represent Role limitation, 
#'   Physical limitation, Social Limitation, Emotions and Sleep, respectfully.
#'   
#' 
#' @examples 
#' scores.df <- data.frame(
#'   RL = c(1,2,3,4,2), 
#'   PL = c(4,3,4,3,2), 
#'   SL = c(1,2,2,4,1), 
#'   E = c(1,3,4,3,4), 
#'   S = c(1,2,1,2,1))
#' 
#' KHQ5DFreq(scores = scores.df, ignore.invalid = TRUE)
#' 
#' scores.df2 <- data.frame(state = c(11111, 22432, 34241, 43332, 22141))
#' 
#' KHQ5DFreq(scores = scores.df2, ignore.invalid = TRUE)
#' 
#' KHQ5DFreq(scores = scores.df2$state, ignore.invalid = TRUE)
#' 
#' KHQ5DFreq(scores = c(11111,11111,22432, 34241, 43332, 22141), 
#'   ignore.invalid = TRUE)
#' 
#' KHQ5DFreq(scores = KHQ5D_data, ignore.invalid = TRUE)
#' 
#' KHQ5DFreq(scores = scores.df, save.xlsx = FALSE, 
#'   filename = "Res_KHQ5D_Frequency.xlsx", 
#'   sheetName = "Frequency", 
#'   ignore.invalid = TRUE)
#' 
#' @seealso 
#'  \code{\link[KHQ]{KHQConvKHQ5D}} and \code{\link[KHQ]{KHQ5D}}
#' @rdname KHQ5DFreq
#' @export 
#' @importFrom magrittr %>%
#' @importFrom openxlsx write.xlsx
#' @importFrom stats na.omit


KHQ5DFreq <- function(
  scores,
  save.xlsx = FALSE,
  filename = NULL,
  sheetName = NULL,
  ignore.invalid = FALSE
){
  
  # Checking dimension names
  DimensionNames <- c("RL", "PL", "SL", "E", "S")
  
  if (is.numeric(scores) & length(names(scores)) == 5) {
    if (!all(DimensionNames %in% names(scores))) {
      print(names(scores))
      stop("Unable to identify KHQ5D dimensions (RL, PL, SL, E, and S) in data.")
    }
  } else if (is.data.frame(scores) & length(names(scores)) == 5) {
    if (!all(DimensionNames %in% names(scores))) {
      print(names(scores))
      stop("Unable to identify KHQ5D dimensions (RL, PL, SL, E, and S) in data.")
    }
  }
  
  
  # Splitting data with five digit format into a five column data.frame and converting the single numeric entry to data.frame
  if (length(as.data.frame(scores)) == 1 & length(names(scores)) != 5) {
    scores <- data.frame(score = scores)
    colnames(scores) <- "score"
    scores <- strsplit(as.character(scores$score), "")
    
    if (!all(lengths(scores) == 5)) {
      digitMissing <- data.frame(digitMissing = lengths(scores) != 5, numDigit = lengths(scores))
      digitMissing$rowDigitMissing <- rownames(digitMissing)
      print(digitMissing[digitMissing[,1] == "TRUE", 2:3])
      stop("Unable to identify the five digit format in the data.")
    }
    
    scores <- do.call(rbind, scores) %>% data.frame()
    colnames(scores) <- DimensionNames
    
  } else if (is.numeric(scores)) {
    scores <- as.data.frame(matrix(scores, ncol = 5))
    colnames(scores) <- DimensionNames
  }
  
  
  # Checking NAs
  if (ignore.invalid == TRUE & any(is.na(scores) == TRUE)) {
    scores <- stats::na.omit(scores)
    
  } else if (ignore.invalid == FALSE & any(is.na(scores) == TRUE)){
    rowNAs = which(is.na(scores) == TRUE, arr.ind = TRUE) %>% data.frame()
    print(scores[unique(rowNAs$row),])
    stop("Missing/non-numeric dimension found. In case the response was randomly lost, consider use ignore.invalid == TRUE to avoid further problems.")
  }
  
  
  # Checking coded scores
  if (any(apply(scores, 1, function(x) !all(x %in% 1:4)) == TRUE)) {
    rowCodedWrong <- data.frame(rowCodedWrong = apply(scores, 1, function(x) !all(x %in% 1:4)))
    rowCodedWrong <- data.frame(rowCodedWrong = rowCodedWrong, numRowCodeWrong = rownames(rowCodedWrong))
    print(scores[rowCodedWrong[rowCodedWrong[,1] == "TRUE", 2],])
    stop("Scores must be coded as 1, 2, 3 or 4 for KHQ5D.")
  }
  
  
  # Health state, Frequency, Percentage, Cumulative frequency, Cumulative percentage
  states <- paste0(scores$RL, scores$PL, scores$SL, scores$E, scores$S)
  
  frequencies <- sort(table(states), decreasing = TRUE)
  percentage <- round(prop.table(as.numeric(frequencies)) * 100, 1)
  cum.freq <- cumsum(as.numeric(frequencies))
  cum.perc <- round(cum.freq/sum(frequencies) * 100, 1)
  
  df_res_freq <- data.frame(HealthState = names(frequencies), 
                            Frequency = as.numeric(frequencies),
                            Percentage = percentage, 
                            CumulativeFreq = cum.freq, 
                            CumulativePerc = cum.perc, 
                            stringsAsFactors = FALSE)
  
  
  # Saving results to an Excel file
  if (save.xlsx == TRUE & is.null(filename) & is.null(sheetName)) {
    openxlsx::write.xlsx(df_res_freq, file = "Res_KHQ5D_Frequency.xlsx", sheetName = "Frequency", keepNA = FALSE, na.string = "NA", overwrite = TRUE)
    
  } else if (save.xlsx == TRUE) {
    openxlsx::write.xlsx(df_res_freq, file = filename, sheetName = sheetName, keepNA = FALSE, na.string = "NA", overwrite = TRUE)
    
  }
  
  return(df_res_freq)
  
}
