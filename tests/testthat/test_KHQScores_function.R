
## Test 1
data_test_1 <- data.frame(
  "1" = c(1,2,3,4), 
  "2" = c(1,2,3,4), 
  "3a" = c(1,2,3,4), "3b" = c(1,2,3,4), 
  "4a" = c(1,2,3,4), "4b" = c(1,2,3,4),
  "4c" = c(1,2,3,4), "4d" = c(1,2,3,4),
  "5a" = c(1,2,3,4), "5b" = c(1,2,3,4), "5c" = c(1,2,3,4),
  "6a" = c(1,2,3,4), "6b" = c(1,2,3,4), "6c" = c(1,2,3,4),
  "7a" = c(1,2,3,4), "7b" = c(1,2,3,4),
  "8a" = c(1,2,3,4), "8b" = c(1,2,3,4), "8c" = c(1,2,3,4), "8d" = c(1,2,3,4), 
  "8e" = c(1,2,3,4),
  "9a" = c(0,1,2,3), "9b" = c(0,1,2,3), "9c" = c(0,1,2,3), "9d" = c(0,1,2,3), 
  "9e" = c(0,1,2,3), "9f" = c(0,1,2,3), "9g" = c(0,1,2,3), "9h" = c(0,1,2,3), 
  "9i" = c(0,1,2,3), "9j" = c(0,1,2,3), "9k" = c(0,1,2,3),
  check.names = FALSE)

res_test_1 <- data.frame(
  GHP = c(0,25,50,75),
  II = c(0.00000,33.33333,66.66667,100.00000),
  RL = c(0.00000,33.33333,66.66667,100.00000),
  PL = c(0.00000,33.33333,66.66667,100.00000),
  SL = c(0.00000,33.33333,66.66667,100.00000),
  PR = c(0.00000,33.33333,66.66667,100.00000),
  E = c(0.00000,33.33333,66.66667,100.00000),
  SE = c(0.00000,33.33333,66.66667,100.00000),
  SM = c(0.00000,33.33333,66.66667,100.00000),
  SSS = c(0,11,22,33),
  check.names = FALSE)

test_that("Wrapper function gives correct answer", {
  expect_equal(round(KHQScores(scores = data_test_1, country = "UK", 
                         author = "Kelleher", year = 1997, 
                         ignore.invalid = FALSE),5), res_test_1)
  
})


# Test 2
test_that("KHQScores throws error for incorrect class of the data", {
  expect_error(KHQScores(scores = as.matrix(data_test_1), country = "UK", 
                         author = "Kelleher", year = 1997, 
                         ignore.invalid = FALSE))
  
})


# Test 3
test_that("KHQScores throws error for incorrect information: country, author, and year", {
  expect_error(KHQScores(scores = data_test_1, country = "BR", 
                         author = "Kelleher", year = 1997, 
                         ignore.invalid = FALSE))
  
  expect_error(KHQScores(scores = data_test_1, country = "UK", 
                         author = "Brusaca", year = 1997, 
                         ignore.invalid = FALSE))
  
  expect_error(KHQScores(scores = data_test_1, country = "BR", 
                         author = "Brusaca", year = 1997, 
                         ignore.invalid = FALSE))
  
})


# Test 4
# Load data
data_test_2 <- data.frame(
  "1" = c(1,2,3,4), 
  "2" = c(1,2,3,4), 
  "3a" = c(1,2,3,4), "3b" = c(1,2,3,4), 
  "4a" = c(1,2,3,4), "4b" = c(1,2,3,4),
  "4c" = c(1,2,3,4), "4d" = c(1,2,3,4),
  "5a" = c(1,2,3,4), "5b" = c(1,2,3,4), "5c" = c(1,2,3,4),
  "6a" = c(1,2,3,4), "6b" = c(1,2,3,4), "6c" = c(1,2,3,4),
  "7a" = c(1,2,3,4), "7b" = c(1,2,3,4),
  "8a" = c(1,2,3,4), "8b" = c(1,2,3,4), "8c" = c(1,2,3,4), "8d" = c(1,2,3,4), 
  "8e" = c(1,2,3,4),
  "9a" = c(0,1,2,3), "9b" = c(0,1,2,3), "9c" = c(0,1,2,3), "9d" = c(0,1,2,3), 
  "9e" = c(0,1,2,3), "9f" = c(0,1,2,3), "9g" = c(0,1,2,3), "9h" = c(0,1,2,3), 
  "9i" = c(0,1,2,3), "9j" = c(0,1,2,3),
  check.names = FALSE)


test_that("KHQScores throws error for incorrect number of items", {
  expect_error(KHQScores(scores = data_test_2, country = "UK", 
                         author = "Kelleher", year = 1997, 
                         ignore.invalid = FALSE))
  
})


# Test 5
# Load data
data_test_3 <- data.frame(
  "1" = c(1,2,3,4), 
  "2a" = c(1,2,3,4), 
  "3a" = c(1,2,3,4), "3b" = c(1,2,3,4), 
  "4a" = c(1,2,3,4), "4b" = c(1,2,3,4),
  "4c" = c(1,2,3,4), "4d" = c(1,2,3,4),
  "5a" = c(1,2,3,4), "5b" = c(1,2,3,4), "5c" = c(1,2,3,4),
  "6a" = c(1,2,3,4), "6b" = c(1,2,3,4), "6c" = c(1,2,3,4),
  "7a" = c(1,2,3,4), "7b" = c(1,2,3,4),
  "8a" = c(1,2,3,4), "8b" = c(1,2,3,4), "8c" = c(1,2,3,4), "8d" = c(1,2,3,4), 
  "8e" = c(1,2,3,4),
  "9a" = c(0,1,2,3), "9b" = c(0,1,2,3), "9c" = c(0,1,2,3), "9d" = c(0,1,2,3), 
  "9e" = c(0,1,2,3), "9f" = c(0,1,2,3), "9g" = c(0,1,2,3), "9h" = c(0,1,2,3), 
  "9i" = c(0,1,2,3), "9j" = c(0,1,2,3), "9k" = c(0,1,2,3),
  check.names = FALSE)

test_that("KHQScores throws error for incorrect name of the items", {
  expect_error(KHQScores(scores = data_test_3, country = "UK", 
                         author = "Kelleher", year = 1997, 
                         ignore.invalid = FALSE))
  
})


# Test 6
# Load data
data_test_4 <- data.frame(
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


test_that("KHQScores throws error for NAs in the data", {
  expect_error(KHQScores(scores = data_test_4, country = "UK", 
                         author = "Kelleher", year = 1997, 
                         ignore.invalid = FALSE))
  
})


res_test_2 <- data.frame(
  GHP = c(0,25,50,75,100,NA),
  II = c(0.00000,33.33333,66.66667,100.00000,NA,NA),
  RL = c(0.00000,33.33333,66.66667,100.00000,NA,NA),
  PL = c(0.00000,33.33333,66.66667,100.00000,NA,NA),
  SL = c(0.00000,33.33333,66.66667,100.00000,NA,0.00000),
  PR = c(0.00000,33.33333,66.66667,100.00000,0.00000,0.00000),
  E = c(0.00000,33.33333,66.66667,100.00000,NA,NA),
  SE = c(0.00000,33.33333,66.66667,100.00000,NA,NA),
  SM = c(0.00000,33.33333,66.66667,100.00000,NA,NA),
  SSS = c(0,11,22,33,0,0),
  check.names = FALSE)

test_that("When ignore.invalid flag is TRUE the correct answer is returned", {
  expect_equal(round(KHQScores(scores = data_test_4, country = "UK", 
                         author = "Kelleher", year = 1997, 
                         ignore.invalid = TRUE),5), res_test_2)
  
})


# Test 7
# Load data
data_test_5 <- data.frame(
  "1" = c(1,2,3,4), 
  "2" = c(5,2,3,4), 
  "3a" = c(1,2,3,4), "3b" = c(1,2,3,4), 
  "4a" = c(1,2,3,4), "4b" = c(1,2,3,4),
  "4c" = c(1,2,3,4), "4d" = c(1,2,3,4),
  "5a" = c(1,2,5,4), "5b" = c(1,2,3,4), "5c" = c(1,2,3,4),
  "6a" = c(1,2,3,4), "6b" = c(1,2,3,4), "6c" = c(1,2,3,4),
  "7a" = c(1,2,3,4), "7b" = c(1,2,3,4),
  "8a" = c(1,2,3,4), "8b" = c(1,2,3,4), "8c" = c(1,2,3,4), "8d" = c(1,2,3,4), 
  "8e" = c(1,2,3,4),
  "9a" = c(0,1,2,3), "9b" = c(0,1,2,3), "9c" = c(0,1,2,3), "9d" = c(0,1,2,3), 
  "9e" = c(0,1,2,3), "9f" = c(0,1,2,3), "9g" = c(0,1,2,3), "9h" = c(0,1,2,3), 
  "9i" = c(0,1,2,3), "9j" = c(0,1,2,3), "9k" = c(0,1,2,3),
  check.names = FALSE)

test_that("KHQScores throws error for incorrect coded scores", {
  expect_error(KHQScores(scores = data_test_5, country = "UK", 
                         author = "Kelleher", year = 1997, 
                         ignore.invalid = TRUE))
  
})


