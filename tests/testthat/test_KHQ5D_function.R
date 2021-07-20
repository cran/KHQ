

## Test 1
data_test_1 <- c(RL = 1, PL = 1, SL = 1, E = 1, S = 1)

res_test_1 <- data.frame(UtilityIndex = 0.996)


test_that("Wrapper function gives correct answer - Using a numeric vector", {
  expect_equal(KHQ5D(scores = data_test_1, country = "UK", type = "SG", 
                     author = "Brazier", year = 2008, source = "KHQ", 
                     ignore.invalid = FALSE), res_test_1)
  
  expect_equal(KHQ5D(scores = c(RL=1,PL=1,SL=1,E=1,S=1), country = "UK", 
                     type = "SG", author = "Brazier", year = 2008, 
                     source = "KHQ", ignore.invalid = FALSE), res_test_1)
  
})


test_that("Wrapper function gives correct answer - Using five digit format", {
  expect_equal(KHQ5D(scores = 11111, country = "UK", type = "SG", 
                     author = "Brazier", year = 2008, source = "KHQ", 
                     ignore.invalid = FALSE), res_test_1)
  
  expect_equal(KHQ5D(scores = c(11111), country = "UK", type = "SG", 
                     author = "Brazier", year = 2008, source = "KHQ", 
                     ignore.invalid = FALSE), res_test_1)
  
})


data_test_1.1 <- data.frame(
  RL = c(1,2,3,4,2), 
  PL = c(4,3,4,3,2), 
  SL = c(1,2,2,4,1), 
  E = c(1,3,4,3,4), 
  S = c(1,2,1,2,1)
)

res_test_1.1 <- data.frame(UtilityIndex = c(0.990, 0.946, 0.947, 0.910, 0.965))

test_that("Wrapper function gives correct answer - Using a data.frame with individual dimensions", {
  expect_equal(KHQ5D(scores = data_test_1.1, country = "UK", type = "SG", 
                     author = "Brazier", year = 2008, source = "KHQ", 
                     ignore.invalid = FALSE), res_test_1.1)
  
})


data_test_1.2 <- data.frame(state = c(11111, 22432, 34241, 43332, 22141))

res_test_1.2 <- data.frame(UtilityIndex = c(0.996, 0.930, 0.947, 0.926, 0.965))

test_that("Wrapper function gives correct answer - Using a data.frame with five digit format", {
  expect_equal(KHQ5D(scores = data_test_1.2, country = "UK", type = "SG", 
                     author = "Brazier", year = 2008, source = "KHQ", 
                     ignore.invalid = FALSE), res_test_1.2)
  
  expect_equal(KHQ5D(scores = data_test_1.2$state, country = "UK", type = "SG", 
                     author = "Brazier", year = 2008, source = "KHQ", 
                     ignore.invalid = FALSE), res_test_1.2)
  
})


# Test 2
data_test_2 <- c(RP = 1, PL = 1, SL = 1, E = 1, S = 1)

test_that("KHQ5D throws error for incorrect dimension names", {
  expect_error(KHQ5D(scores = data_test_2, country = "UK", type = "SG", 
                     author = "Brazier", year = 2008, source = "KHQ", 
                     ignore.invalid = FALSE))
  
})


# Test 3
data_test_3 <- data.frame(state = c(11111, 22432, 3241, 43332, 22141))

test_that("KHQ5D throws error for incorrect five-digit data format", {
  expect_error(KHQ5D(scores = c(1111), country = "UK", type = "SG", 
                     author = "Brazier", year = 2008, source = "KHQ", 
                     ignore.invalid = FALSE))
  
  expect_error(KHQ5D(scores = data_test_3, country = "UK", type = "SG", 
                     author = "Brazier", year = 2008, source = "KHQ", 
                     ignore.invalid = FALSE))
  
})


# Test 4
data_test_4 <- data.frame(
  RL = c(1,2,3,4,2), 
  PL = c(4,3,4,3,2), 
  SL = c(1,2,2,4,1), 
  E = c(1,3,NA,3,4), 
  S = c(1,2,1,2,1)
)

test_that("KHQ5D throws error for NAs in the data", {
  expect_error(KHQ5D(scores = data_test_4, country = "UK", type = "SG", 
                     author = "Brazier", year = 2008, source = "KHQ", 
                     ignore.invalid = FALSE))
  
})


res_test_4 <- data.frame(UtilityIndex = c(0.990, 0.946, NA, 0.910, 0.965))

test_that("When ignore.invalid flag is TRUE the correct answer is returned", {
  expect_equal(KHQ5D(scores = data_test_4, country = "UK", type = "SG", 
                     author = "Brazier", year = 2008, source = "KHQ", 
                     ignore.invalid = TRUE), res_test_4)
  
})


# Test 5
data_test_5 <- data.frame(
  RL = c(1,2,3,4,2), 
  PL = c(0,3,4,3,2), 
  SL = c(1,2,2,4,1), 
  E = c(1,3,5,3,4), 
  S = c(1,2,1,2,1)
)

test_that("KHQ5D throws error for incorrect coded scores", {
  expect_error(KHQ5D(scores = data_test_5, country = "UK", type = "SG", 
                     author = "Brazier", year = 2008, source = "KHQ", 
                     ignore.invalid = FALSE))
  
})


# Test 6
test_that("KHQ5D throws error for incorrect country", {
  expect_error(KHQ5D(scores = c(11111), country = "BR", type = "SG", 
                     author = "Brazier", year = 2008, source = "KHQ", 
                     ignore.invalid = TRUE))
  
})


# Test 7
test_that("KHQ5D throws error for incorrect information: Year, Author, Type, and Source", {
  expect_error(KHQ5D(scores = c(11111), country = "UK", type = "SG", 
                     author = "Brazier", year = 2000, source = "KHQ", 
                     ignore.invalid = FALSE))
  
  expect_error(KHQ5D(scores = c(11111), country = "UK", type = "SG", 
                     author = "Brusaca", year = 2008, source = "KHQ", 
                     ignore.invalid = FALSE))
  
  expect_error(KHQ5D(scores = c(11111), country = "UK", type = "TTO", 
                     author = "Brazier", year = 2008, source = "KHQ", 
                     ignore.invalid = FALSE))
  
  expect_error(KHQ5D(scores = c(11111), country = "UK", type = "SG", 
                     author = "Brazier", year = 2008, source = "KHQ5D", 
                     ignore.invalid = FALSE))
  
})

