

## Test 1
data_test_1.1 <- data.frame(
  RL = c(1,2,3,4,2), 
  PL = c(4,3,4,3,2), 
  SL = c(1,2,2,4,1), 
  E = c(1,3,4,3,4), 
  S = c(1,2,1,2,1))

res_test_1.1 <- data.frame(HealthState = c("14111", "22141", "23232", "34241", "43432"),
                           Frequency = c(1, 1, 1, 1, 1),
                           Percentage = c(20, 20, 20, 20, 20),
                           CumulativeFreq = c(1, 2, 3, 4, 5),
                           CumulativePerc = c(20, 40, 60, 80, 100))

test_that("Wrapper function gives correct answer - Using a data.frame with individual dimensions", {
  expect_equal(KHQ5DFreq(scores = data_test_1.1, ignore.invalid = FALSE), res_test_1.1)
  
})


data_test_1.2 <- data.frame(state = c(14111, 22141, 23232, 34241, 43432))


test_that("Wrapper function gives correct answer - Using a data.frame with five digit format", {
  expect_equal(KHQ5DFreq(scores = data_test_1.2, ignore.invalid = FALSE), res_test_1.1)
  
  expect_equal(KHQ5DFreq(scores = data_test_1.2$state, ignore.invalid = FALSE), res_test_1.1)
  
})


test_that("Wrapper function gives correct answer - Using a vector with five digit format", {
  expect_equal(KHQ5DFreq(scores = c(14111, 22141, 23232, 34241, 43432), 
                         ignore.invalid = FALSE), res_test_1.1)
  
})



# Test 2
data_test_2 <- data.frame(
  RL = c(1,2,3,4,2), 
  PL = c(4,3,4,3,2), 
  SL = c(1,2,2,4,1), 
  A = c(1,3,4,3,4), 
  S = c(1,2,1,2,1))

test_that("KHQ5DFreq throws error for incorrect dimension names", {
  expect_error(KHQ5DFreq(scores = data_test_2, ignore.invalid = FALSE))
  
})


# Test 3
data_test_3 <- data.frame(state = c(1411, 22141, 23232, 34241, 43432))

test_that("KHQ5DFreq throws error for incorrect five-digit data format", {
  expect_error(KHQ5DFreq(scores = data_test_3, ignore.invalid = FALSE))
  
})


test_that("KHQ5DFreq throws error for incorrect five-digit data format", {
  expect_error(KHQ5DFreq(scores = c(1411, 22141, 23232, 34241, 43432), 
                         ignore.invalid = FALSE))
  
})


# Test 4
data_test_4 <- data.frame(
  RL = c(1,2,3,4,2), 
  PL = c(4,3,4,3,2), 
  SL = c(1,2,2,4,1), 
  E = c(1,3,4,3,4), 
  S = c(1,2,1,2,NA))

test_that("KHQ5DFreq throws error for NAs in the data", {
  expect_error(KHQ5DFreq(scores = data_test_4, ignore.invalid = FALSE))
  
})


res_test_4 <- data.frame(HealthState = c("14111", "23232", "34241", "43432"),
                         Frequency = c(1, 1, 1, 1),
                         Percentage = c(25, 25, 25, 25),
                         CumulativeFreq = c(1, 2, 3, 4),
                         CumulativePerc = c(25, 50, 75, 100))

test_that("When ignore.invalid flag is TRUE the correct answer is returned", {
  expect_equal(KHQ5DFreq(scores = data_test_4, ignore.invalid = TRUE), res_test_4)
  
})


# Test 5
data_test_5 <- data.frame(
  RL = c(1,2,3,4,2), 
  PL = c(0,3,4,3,2), 
  SL = c(1,2,2,4,1), 
  E = c(1,3,5,3,4), 
  S = c(1,2,1,2,1))

test_that("KHQ5DFreq throws error for incorrect coded scores", {
  expect_error(KHQ5DFreq(scores = data_test_5, ignore.invalid = FALSE))
  
})

