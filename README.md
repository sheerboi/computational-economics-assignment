# computational-economics-assignment

---

## Overview

This project answers **Question 2** from the assignment for the course *Computational Methods in Economics*. The main objective is to compute and analyze the Foster-Greer-Thorbecke (FGT) poverty index, followed by hypothesis testing and corrections for multiple comparisons. The data is drawn from poverty measures across various states in India, focusing on both rural and urban poverty levels.

## Problem Statement

We analyze poverty measures using the **Foster-Greer-Thorbecke (FGT)** index. The formula for the FGT index is:

\[
FGT_{\alpha} = \frac{100}{n} \sum_{i=1}^{q} \left(\frac{z - y_i}{z}\right)^\alpha
\]

Where:
- \( n \): Total number of individuals.
- \( q \): Number of individuals below the poverty line.
- \( z \): Poverty line.
- \( y_i \): Income of individual \( i \).
- \( \alpha \): Poverty aversion parameter.

The subparts of **Question 2** cover:
1. Testing null hypotheses regarding poverty measures.
2. Testing poverty measures across Indian states with multiple hypothesis corrections.
3. Comparing rural and urban poverty levels for each state.

## Files

- **`data_forQuestion2.csv`**: The dataset used in this analysis, containing income and poverty measures across various states and districts of India.
  
## Code Structure

### Part (a)

- Hypothesis test for 9 poverty indices across rural and urban regions.
- Rejection of the null hypothesis signifies that observed values are statistically different from expected values.

**Key R Functions Used:**
- `t.test()`: Used to perform t-tests for the hypothesis.
  
### Part (b)

- Hypothesis testing for each state across 9 indices, resulting in 81 p-values.
- Family-wise error rate controlled using **Bonferroni Correction** and **Benjamini-Hochberg Procedure**.

**Key R Concepts:**
- **Bonferroni Correction**: Adjusts p-values to control for multiple comparisons by making the test more conservative.
- **Benjamini-Hochberg (BH) Procedure**: Controls the false discovery rate, less conservative than Bonferroni.

### Part (c)

- Hypothesis test comparing rural and urban poverty for each state.
- Results corrected for multiple comparisons using Bonferroni and BH methods.

## Results

- **Part (a)**: Null hypothesis rejected for all indices, indicating significant deviations from expected poverty benchmarks.
- **Part (b)**: Bonferroni correction identified 41 significant indices, while BH identified 57.
- **Part (c)**: Significant differences between rural and urban poverty in multiple states.

## Conclusion

The findings suggest a significant change in poverty levels across India, with marked differences between rural and urban areas. The analysis underlines the importance of targeted poverty alleviation strategies tailored to regional disparities.

---
