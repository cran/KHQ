
## Test 1
data_test_1 <- data.frame(
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

res_test_1 <- data.frame(
  RL = c(4,3,4,3,2),
  PL = c(1,3,4,3,4),
  SL = c(2,2,3,4,2),
  E = c(3,2,2,4,1),
  S = c(1,3,4,3,4)
)

test_that("Wrapper function gives correct answer", {
  expect_equal(KHQConvKHQ5D(scores = data_test_1, ignore.invalid = FALSE), res_test_1)
  
})


# Test 2
test_that("KHQConvKHQ5D throws error for incorrect class of the data", {
  expect_error(KHQConvKHQ5D(scores = as.matrix(data_test_1), ignore.invalid = FALSE))
  
})


# Test 3
data_test_2 <- data.frame(
  "3a" = c(4,3,4,3,2), 
  "3b" = c(4,3,4,3,2), 
  "4a" = c(1,3,4,3,4), 
  "4b" = c(1,3,4,3,4), 
  "4d" = c(2,2,3,4,2),
  "5c" = c(2,2,3,4,2), 
  "6a" = c(3,2,2,4,1), 
  "6b" = c(3,2,2,4,1),
  check.names = FALSE
)

test_that("KHQConvKHQ5D throws error for incorrect number of items", {
  expect_error(KHQConvKHQ5D(scores = data_test_2, ignore.invalid = FALSE))
  
})


# Test 4
data_test_3 <- data.frame(
  "1" = c(4,3,4,3,2), 
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

test_that("KHQConvKHQ5D throws error for incorrect name of the items", {
  expect_error(KHQConvKHQ5D(scores = data_test_3, ignore.invalid = FALSE))
  
})


# Test 5
data_test_4 <- data.frame(
  "3a" = c(5,3,4,3,2), 
  "3b" = c(4,3,4,3,2), 
  "4a" = c(1,3,4,5,4), 
  "4b" = c(1,3,4,3,4), 
  "4d" = c(2,2,3,4,2),
  "5c" = c(2,2,3,4,2), 
  "6a" = c(3,2,2,4,1), 
  "6b" = c(3,2,2,4,1), 
  "7a" = c(1,3,4,3,4),
  check.names = FALSE
)

test_that("KHQConvKHQ5D throws error for incorrect coded scores", {
  expect_error(KHQConvKHQ5D(scores = data_test_4, ignore.invalid = FALSE))
  
})


# Test 6
data_test_5 <- data.frame(
  "3a" = c(4,NA,4,3,2), 
  "3b" = c(4,NA,4,3,2), 
  "4a" = c(1,3,4,3,4), 
  "4b" = c(1,3,4,3,4), 
  "4d" = c(2,2,3,NA,2),
  "5c" = c(2,2,3,NA,2), 
  "6a" = c(3,2,2,4,1), 
  "6b" = c(3,2,2,4,1), 
  "7a" = c(1,3,4,3,4),
  check.names = FALSE
)

test_that("KHQConvKHQ5D throws error for NAs in the data", {
  expect_error(KHQConvKHQ5D(scores = data_test_5, ignore.invalid = FALSE))
  
})


res_test_2 <- data.frame(
  RL = c(4,NA,4,3,2),
  PL = c(1,3,4,3,4),
  SL = c(2,2,3,NA,2),
  E = c(3,2,2,4,1),
  S = c(1,3,4,3,4)
)

test_that("When ignore.invalid flag is TRUE the correct answer is returned", {
  expect_equal(KHQConvKHQ5D(scores = data_test_5, ignore.invalid = TRUE), res_test_2)
  
})

