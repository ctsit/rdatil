library(testthat)
context("get_categorical_field_labels")
library(rdatil)
library(tidyr)
library(dplyr)
library(stringr)

# load a test data set.  We will process it via the function and
# via dplyr then compare the results.
load(file="animal_metadata.RData")
cat_labels <- get_categorical_field_labels(animal_metadata)

cat_labels_row_count_by_type <- function(x) cat_labels %>% filter(field_type == x) %>% distinct(field_name) %>% nrow()
input_data_row_count_by_type <- function(x) animal_metadata %>% filter(field_type == x) %>% nrow()

test_that("radio fields are included", {
  expect_equal(cat_labels_row_count_by_type("radio"),input_data_row_count_by_type("radio"))
  expect_false(cat_labels_row_count_by_type("radio") == 0)
})

test_that("dropdown fields are included", {
  expect_equal(cat_labels_row_count_by_type("dropdown"),input_data_row_count_by_type("dropdown"))
  expect_false(cat_labels_row_count_by_type("dropdown") == 0)
})

test_that("yesno fields are included", {
  expect_equal(cat_labels_row_count_by_type("yesno"),input_data_row_count_by_type("yesno"))
  expect_false(cat_labels_row_count_by_type("yesno") == 0)
})

test_that("non-categorical fields are excluded", {
  expect_false(input_data_row_count_by_type("text") == 0)
  expect_true(cat_labels_row_count_by_type("text") == 0)
  expect_false(input_data_row_count_by_type("descriptive") == 0)
  expect_true(cat_labels_row_count_by_type("descriptive") == 0)
})

# Check field_labels and field_names
test_that("field labels change with field names", {
  expect_equal(cat_labels %>% distinct(field_label, field_name) %>% nrow(),
               cat_labels %>% distinct(field_name) %>% nrow())
})

test_that("no field_labels are NA", {
  expect_equal(cat_labels %>% select(field_label) %>% filter(is.na(field_label)) %>% nrow(), 0)
})

# Check Keys and Values
test_that("keys change with values", {
  expect_equal(cat_labels %>% distinct(field_name, key, value) %>% nrow(),
               cat_labels %>% distinct(field_name, key) %>% nrow())
})

test_that("no keys are NA", {
  expect_equal(cat_labels %>% select(key) %>% filter(is.na(key)) %>% nrow(), 0)
})

# Check Codes and labels
test_that("codes change with values", {
  expect_equal(cat_labels %>% distinct(field_name, code, label) %>% nrow(),
               cat_labels %>% distinct(field_name, code) %>% nrow())
})

test_that("no codes are NA", {
  expect_equal(cat_labels %>% select(code) %>% filter(is.na(code)) %>% nrow(), 0)
})
