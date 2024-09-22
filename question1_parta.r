# Part 1: Defining the m_0 values and column names
m_0_values <- c(27, 7, 3, 29, 10, 4, 45, 15, 4)
indices <- c("fgt0", "fgt1", "fgt2", "fgt0_u", "fgt1_u", "fgt2_u", "fgt0_r", "fgt1_r", "fgt2_r")
# Part 2: Performing one-sample t-tests and storing the results
test_results <- list()
for (i in 1:length(indices)) {
  column_name <- indices[i]
  m_0 <- m_0_values[i]
   # Performing the one-sample t-test
  t_test_result <- t.test(data[[column_name]], mu = m_0)
   # Storing the result
  test_results[[column_name]] <- list(
    statistic = t_test_result$statistic,
    p_value = t_test_result$p.value,
    mean = mean(data[[column_name]]),
    m_0 = m_0
  )
}
# Part 3: Printing and interpreting the results
for (index in indices) {
  result <- test_results[[index]]
  
  if (result$p_value < 0.05) {
    cat("For", index, ": The null hypothesis is rejected (p-value =", result$p_value, ").\n")
  } else {
    cat("For", index, ": The null hypothesis is not rejected (p-value =", result$p_value, ").\n")
  }
}
