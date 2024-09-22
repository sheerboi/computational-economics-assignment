# Defining the states
 states <- c("Assam", "Bihar", "Gujarat", "Karnataka", "Madhya Pradesh", "Maharashtra", "Orissa", "Rajasthan", "Uttar Pradesh")
  # Initializing vectors to store p-values
 p_values_rural_vs_urban <- numeric()
 
 # Looping through each state to perform two-sample t-tests comparing rural and urban poverty
for (state in states) {
     # Extracting data for rural and urban poverty for each index
    rural_data <- data[data$state == state & grepl("_r$", names(data)), ]
     urban_data <- data[data$state == state & grepl("_u$", names(data)), ]
     
     # Ensuring there are corresponding rural and urban columns
     for (i in 1:3) { # Assuming indices are fgt0, fgt1, fgt2
         rural_col <- paste0("fgt", i-1, "_r")
         urban_col <- paste0("fgt", i-1, "_u")
         
         if (rural_col %in% names(rural_data) & urban_col %in% names(urban_data)) {
             # Performing two-sample t-test
             t_test_result <- t.test(rural_data[[rural_col]], urban_data[[urban_col]])
             
             # Storing the p-value 
           p_values_rural_vs_urban <- c(p_values_rural_vs_urban, t_test_result$p.value)
         }
     }
 }
 
 # Applying Bonferroni correction
 bonferroni_p_values_rural_vs_urban <- p.adjust(p_values_rural_vs_urban, method = "bonferroni")
 bonferroni_significant_rural_vs_urban <- bonferroni_p_values_rural_vs_urban < 0.05
 
 # Applying Benjamini-Hochberg correction
 bh_p_values_rural_vs_urban <- p.adjust(p_values_rural_vs_urban, method = "BH")
 bh_significant_rural_vs_urban <- bh_p_values_rural_vs_urban < 0.05
 
 # Combining results into a data frame for easy viewing
results_rural_vs_urban <- data.frame(
    p_value = p_values_rural_vs_urban,
     bonferroni_p_value = bonferroni_p_values_rural_vs_urban,
     bonferroni_significant = bonferroni_significant_rural_vs_urban,
     bh_p_value = bh_p_values_rural_vs_urban,
     bh_significant = bh_significant_rural_vs_urban
 )
 
 # Printing the results
 print(results_rural_vs_urban)
