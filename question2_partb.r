
# Defining the states and indices
states <- c("Assam", "Bihar", "Gujarat", "Karnataka", "Madhya Pradesh", "Maharashtra", "Orissa", "Rajasthan", "Uttar Pradesh")
indices <- c("fgt0", "fgt1", "fgt2", "fgt0_u", "fgt1_u", "fgt2_u", "fgt0_r", "fgt1_r", "fgt2_r")
m_0_values <- c(27, 7, 3, 29, 10, 4, 45, 15, 4)
# Initializing a vector to store p-values
p_values <- numeric()
# Looping through each state and index to perform t-tests
for (state in states) {
  for (i in 1:length(indices)) {
    column_name <- indices[i]
    m_0 <- m_0_values[i]
     # Extracting the data for the current state and index
    state_data <- data[data$state == state, column_name]
    # Performing the one-sample t-test
    t_test_result <- t.test(state_data, mu = m_0)
    # Storing the p-value
    p_values <- c(p_values, t_test_result$p.value)
  }
}
 
# Applying Bonferroni correction
bonferroni_p_values <- p.adjust(p_values, method = "bonferroni")
bonferroni_significant <- bonferroni_p_values < 0.05
 
# Applying Benjamini-Hochberg correction
bh_p_values <- p.adjust(p_values, method = "BH")
bh_significant <- bh_p_values < 0.05
 
# Combining results into a data frame for easy viewing
results <- data.frame(
  p_value = p_values,
  bonferroni_p_value = bonferroni_p_values,
  bonferroni_significant = bonferroni_significant,
  bh_p_value = bh_p_values,
  bh_significant = bh_significant
)
# Printing the results
print(results)
# Counting the number of TRUE and FALSE values for bonferroni_significant
bonferroni_summary <- table(results$bonferroni_significant)
print("Bonferroni Significance Summary:")
print(bonferroni_summary)
# Counting the number of TRUE and FALSE values for bh_significant
bh_summary <- table(results$bh_significant)
print("Benjamini-Hochberg Significance Summary:")
print(bh_summary)
