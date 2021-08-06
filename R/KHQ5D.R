

#' @title Convert the health states of the KHQ5D to index value
#' @description Function used to convert the scores of the five dimensions of 
#'   the KHQ5D to a single utility index using country specific value set.
#' @param scores data.frame with colnames RL, PL, SL, E, and S representing 
#'   Role limitation, Physical limitation, Social Limitation, Emotions 
#'   and Sleep. Alternatively a data.frame with the KHQ5D health profiles can be 
#'   provided in a five digit format e.g., data.frame(state = c(11111, 22432, 
#'   34241, 43332)) or only the five digit e.g., 11111, c(11111), c(11111, 22432, 
#'   34241).
#' @param country string specifying the country in which the value set scores 
#'   were calculated.
#' @param type string specifying method type used in deriving value set scores.
#' @param author string specifying the author of the article containing the 
#'   value set scores.
#' @param year string specifying the year the article containing the value set 
#'   scores was published.
#' @param source string specifying the version of the King's Health Questionnaire used.
#' @param ignore.invalid logical to indicate whether to ignore items data 
#'   with invalid, incomplete or missing data; Default: FALSE.
#' @param weights logical to indicate whether or not save the weights of each 
#'   score of the KHQ5D. If weights = TRUE the weights will be generated and 
#'   if weights and save.xlsx = TRUE an Excel file will be saved with the 
#'   weights of each score plus the utility index under filename = 
#'   "Res_KHQ5D_weig_uti_ind.xlsx" and sheetName = "Weights_Utility_Index". 
#'   It is also possible to indicate another name, both for the file and for 
#'   the sheet; Default: NULL.
#' @param save.xlsx logical to indicate whether or not save the results; Default: FALSE.
#' @param filename string specifying the file name if save.xlsx = TRUE; 
#'   Default: "Res_KHQ5D_uti_ind.xlsx". If weights = true, default: 
#'   "Res_KHQ5D_weig_uti_ind.xlsx".
#' @param sheetName string specifying the sheet name if save.xlsx = TRUE; 
#'   Default: "Utility_Index". If weights = true, default: "Weights_Utility_Index".
#' @return A data frame with utility index scores of the KHQ5D.
#' @details Named vector RL, PL, SL, E and S represent Role limitation, 
#'   Physical limitation, Social Limitation, Emotions and Sleep, respectfully.
#'   
#' 
#' @examples 
#' KHQ5D(scores = c(RL=1,PL=1,SL=1,E=1,S=1), country = "UK", 
#'   type = "SG", author = "Brazier", year = 2008, 
#'   source = "KHQ", ignore.invalid = TRUE, weights = NULL)
#' 
#' KHQ5D(scores = c(RL=1,PL=1,SL=1,E=1,S=1), country = "UK",
#'   type = "SG", author = "Brazier", year = 2008,
#'   source = "KHQ", ignore.invalid = TRUE, 
#'   weights = NULL, save.xlsx = FALSE, 
#'   filename = "Res_KHQ5D_uti_ind.xlsx",
#'   sheetName = "Utility_Index")
#' 
#' KHQ5D(scores = 11111, country = "UK", type = "SG", 
#'   author = "Brazier", year = 2008, source = "KHQ", 
#'   ignore.invalid = TRUE)
#' 
#' KHQ5D(scores = c(11111), country = "UK", type = "SG", 
#'   author = "Brazier", year = 2008, source = "KHQ", 
#'   ignore.invalid = TRUE)
#'   
#' KHQ5D(scores = c(11111, 22432, 34241, 43332, 22141), 
#'   country = "UK", type = "SG", author = "Brazier", 
#'   year = 2008, source = "KHQ", ignore.invalid = TRUE)
#' 
#' scores.df <- data.frame(
#'   RL = c(1,2,3,4,2), 
#'   PL = c(4,3,4,3,2), 
#'   SL = c(1,2,2,4,1), 
#'   E = c(1,3,4,3,4), 
#'   S = c(1,2,1,2,1))
#' 
#' KHQ5D(scores = scores.df, country = "UK", type = "SG", 
#'   author = "Brazier", year = 2008, source = "KHQ", 
#'   ignore.invalid = TRUE)
#' 
#' scores.df2 <- data.frame(state = c(11111, 22432, 34241, 43332, 22141))
#' 
#' KHQ5D(scores = scores.df2, country = "UK", type = "SG", 
#'   author = "Brazier", year = 2008, source = "KHQ", 
#'   ignore.invalid = TRUE)
#' 
#' KHQ5D(scores = scores.df2$state, country = "UK", type = "SG", 
#'   author = "Brazier", year = 2008, source = "KHQ", 
#'   ignore.invalid = TRUE)
#' 
#' KHQ5D(scores = KHQ5D_data, country = "UK", type = "SG", 
#'   author = "Brazier", year = 2008, source = "KHQ", 
#'   ignore.invalid = TRUE, weights = TRUE)
#' 
#' @seealso 
#'  \code{\link[KHQ]{KHQConvKHQ5D}} and \code{\link[KHQ]{KHQ5DFreq}}
#' @rdname KHQ5D
#' @export 
#' @importFrom magrittr %>%
#' @importFrom openxlsx write.xlsx


KHQ5D <- function(
  scores,
  country,
  type,
  author,
  year,
  source,
  ignore.invalid = FALSE,
  weights = NULL,
  save.xlsx = FALSE,
  filename = NULL,
  sheetName = NULL
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
  if (ignore.invalid == FALSE & any(is.na(scores) == TRUE)){
    rowNAs = which(is.na(scores) == TRUE, arr.ind = TRUE) %>% data.frame()
    print(scores[unique(rowNAs$row),])
    stop("Missing/non-numeric dimension found. In case the response was randomly lost, consider use ignore.invalid == TRUE to avoid further problems.")
  }
  
  
  # Checking coded scores
  if (any(apply(scores, 1, function(x) !all(x %in% c(NA,1:4))) == TRUE)) {
    rowCodedWrong <- data.frame(rowCodedWrong = apply(scores, 1, function(x) !all(x %in% c(NA,1:4))))
    rowCodedWrong <- data.frame(rowCodedWrong = rowCodedWrong, numRowCodeWrong = rownames(rowCodedWrong))
    print(scores[rowCodedWrong[rowCodedWrong[,1] == "TRUE", 2],])
    stop("Scores must be coded as 1, 2, 3 or 4 for KHQ5D.")
  }
  
  
  # Load utility index scores
  Utility_Index_data <- KHQ::Utility_Index_data
  # Utility_Index_data <- readxl::read_xlsx(
  #   path = system.file("data-raw", "Score_Utility_Index.xlsx", package = "KHQ"), 
  #   sheet = "KHQ5D", .name_repair = "minimal") %>% 
  #   data.frame(check.names = FALSE)
  
  
  # Check the country in which the weighted score was calculated
  if (!any(country == unique(colnames(Utility_Index_data)[-1]))) {
    print(data.frame(Country = unique(unique(colnames(Utility_Index_data)[-1]))))
    stop("Country must be one of the above.")
  }
  
  
  # Selecting weighted score for a specific country
  Utility_Index_data <- Utility_Index_data[, c(1, grep(pattern = paste0("^", country), colnames(Utility_Index_data)))]
  
  
  # Selecting weighted score and checking the Year, Author, Type, and Source from which the utility index scores were obtained
  info_data <- Utility_Index_data[(which(Utility_Index_data$Variables == "Year" | 
                                    Utility_Index_data$Variables == "Author" | 
                                    Utility_Index_data$Variables == "Type" | 
                                    Utility_Index_data$Variables == "Source")), ]
  
  collist <- colnames(info_data)
  select_score <- apply(info_data[,collist], 2, function(x) all(x %in% c(year, author, type, source)))
  
  if (select_score[-1] == FALSE) {
    colnames(info_data) <- NULL
    rownames(info_data) <- NULL
    print(info_data)
    stop("\n Information set type not recognized.\n Year, Author, Type, and Source must be one of the above.")
  }
  
  # Deleting some rows
  Utility_Index_data <- data.frame(Variables = Utility_Index_data$Variables, data_country = Utility_Index_data[,select_score])
  
  df_Sco_Uti_Ind <- Utility_Index_data[-(which(Utility_Index_data$Variables == "Year" | 
                                          Utility_Index_data$Variables == "Author" | 
                                          Utility_Index_data$Variables == "Type" | 
                                          Utility_Index_data$Variables == "Source" | 
                                          Utility_Index_data$Variables == "Health state")), ]
  
  df_Sco_Uti_Ind$data_country <- as.numeric(df_Sco_Uti_Ind$data_country)
  
  
  df_Sco_Uti_Ind <- data.frame(RL = c(0, df_Sco_Uti_Ind[2:4,2]),
                               PL = c(0, df_Sco_Uti_Ind[5:7,2]),
                               SL = c(0, df_Sco_Uti_Ind[8:10,2]),
                               E = c(0, df_Sco_Uti_Ind[11:13,2]),
                               S = c(0, df_Sco_Uti_Ind[14:16,2]))
  
  
  # Calculate utility index
  df_weight <- data.frame(matrix(0, nrow = nrow(scores), ncol = ncol(scores)))
  colnames(df_weight) <- DimensionNames
  
  for (i in 1:nrow(scores)) {
    if (is.na(scores[i,1])) {
      df_weight[i,1] <- NA
    } else {
      df_weight[i,1] <- df_Sco_Uti_Ind[scores[i,1],1]
    }
    
    if (is.na(scores[i,2])) {
      df_weight[i,2] <- NA
    } else {
      df_weight[i,2] <- df_Sco_Uti_Ind[scores[i,2],2]
    }
    
    if (is.na(scores[i,3])) {
      df_weight[i,3] <- NA
    } else {
      df_weight[i,3] <- df_Sco_Uti_Ind[scores[i,3],3]
    }
    
    if (is.na(scores[i,4])) {
      df_weight[i,4] <- NA
    } else {
      df_weight[i,4] <- df_Sco_Uti_Ind[scores[i,4],4]
    }
    
    if (is.na(scores[i,5])) {
      df_weight[i,5] <- NA
    } else {
      df_weight[i,5] <- df_Sco_Uti_Ind[scores[i,5],5]
    }
  }
  
  FullHealth <- Utility_Index_data[which(Utility_Index_data$Variables == "FullHealth"),2] %>% as.numeric()
  
  df_Uti_Ind <- data.frame(UtilityIndex = 1:nrow(scores))
  
  for (i in 1:nrow(scores)) {
    df_Uti_Ind[i,] <- FullHealth - abs(sum(df_weight[i,])) 
  }
  
  
  # Creating a data.frame with the weights and the utility index
  if (!is.null(weights)) {df_Uti_Ind <- cbind(df_weight, df_Uti_Ind)}
  
  # Saving results to an Excel file
  if (!is.null(weights) & save.xlsx == TRUE & is.null(filename) & is.null(sheetName)) {
    openxlsx::write.xlsx(df_Uti_Ind, file = "Res_KHQ5D_weig_uti_ind.xlsx", sheetName = "Weights_Utility_Index", keepNA = FALSE, na.string = "NA", overwrite = TRUE)
    
  } else if (save.xlsx == TRUE & is.null(filename) & is.null(sheetName)) {
    openxlsx::write.xlsx(df_Uti_Ind, file = "Res_KHQ5D_uti_ind.xlsx", sheetName = "Utility_Index", keepNA = FALSE, na.string = "NA", overwrite = TRUE)
    
  } else if (save.xlsx == TRUE) {
    openxlsx::write.xlsx(df_Uti_Ind, file = filename, sheetName = sheetName, keepNA = FALSE, na.string = "NA", overwrite = TRUE)
    
  }
  
  return(df_Uti_Ind)
  
}
