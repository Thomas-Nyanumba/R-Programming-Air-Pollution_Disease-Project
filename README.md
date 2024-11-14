# Relationship Between Air Pollution and Respiratory Health

![](https://github.com/Thomas-Nyanumba/R-Programming-Air-Pollution_Disease-Project/blob/main/Image.jpg)

## Introduction
Air pollution has become a significant public health concern globally, particularly in urban areas. Exposure to pollutants like particulate matter (PM2.5, PM10) and nitrogen dioxide (NO2) has been linked to increased rates of respiratory diseases, including asthma, chronic obstructive pulmonary disease (COPD), and lung cancer. This project investigates the correlation between air pollution levels and respiratory disease mortality across several countries over time, using statistical analysis techniques in R.

## Problem Statement
The project aims to assess the extent to which air pollution affects respiratory health. Specifically, it examines whether higher levels of air pollution correlate with increased mortality rates from respiratory diseases, with implications for public health and environmental policy.

## Skills Demonstrated

- **Data Cleaning and Transformation:** 
  - Cleaned and transformed raw data from multiple CSV files in Excel, addressing missing values and duplicate entries to ensure data quality.
  - Utilized Excel Power Query for initial data preprocessing, including standardizing formats, renaming columns for consistency, and converting data types (e.g., pollutants in micrograms per cubic meter).
  - Further refined the data in R, handling outliers and converting categorical and numerical data for analysis readiness.

- **Exploratory Data Analysis (EDA):**
  - Performed exploratory data analysis in R, including calculating measures of central tendency (mean, median) and variability (standard deviation, variance) to understand the distribution and spread of pollutant levels and mortality rates across countries.
  - Used correlation matrices to examine relationships between pollutants (PM2.5, PM10, NO2) and different respiratory diseases (asthma, COPD, lung cancer), identifying trends and potential points of interest for further analysis.

- **Statistical Analysis and Hypothesis Testing:**
  - Conducted regression analysis to test hypotheses about the impact of air pollutants on respiratory disease mortality, using R’s linear regression functions to model the relationship between pollutants and mortality rates.
  - Interpreted regression coefficients, p-values, and F-statistics to evaluate the significance of each pollutant on respiratory health outcomes, ensuring rigorous statistical validation.
  - Generated a multiple R-squared value to assess model fit, providing insights into how much variability in mortality rates is explained by air pollution.

- **Data Visualization:**
  - Created a variety of visualizations to illustrate key findings:
    - **Scatter Plots:** Highlighted the relationship between pollutant levels and respiratory mortality, displaying positive trends for pollutants like NO2.
    - **Box Plots:** Compared distributions of respiratory mortality rates across countries with varying levels of PM2.5, PM10, and NO2, visually emphasizing areas with higher pollution and mortality rates.
  - Customized plot aesthetics (e.g., colors, labels, legends) to improve clarity and accessibility for a broad audience.

- **Interpretation and Critical Analysis:**
  - Analyzed and contextualized the results, explaining the broader implications of air pollution on respiratory health.
  - Identified confounding factors, such as healthcare access and socio-economic conditions, that may influence respiratory outcomes alongside air quality.
  - Provided actionable insights by discussing the role of specific pollutants, particularly NO2, in respiratory mortality, offering evidence-based recommendations for policy development.

## Data Overview
The datasets used in this analysis were sourced from Kaggle and included:
1. **Pollution Data** – Measurements of PM2.5, PM10, and NO2 levels over multiple years and countries. Find raw data [here](https://github.com/Thomas-Nyanumba/R-Programming-Air-Pollution_Disease-Project/blob/main/Air_Pollution_Levels_Raw_Data.xlsx)
2. **Mortality Data** – Annual mortality rates from respiratory diseases, focusing on asthma, COPD, and lung cancer. Find raw data [here]()
3. **Pollution and Mortality Clean Data** - Excel power query cleaned data in a single Excel Workbook. Find combined clean data [here]()

## Methodology
1. **Data Preprocessing:** The raw data was cleaned in Excel to remove missing and duplicated values and then imported into R.
2. **Descriptive Statistics:** Calculated means, medians, standard deviations, and variances for pollutant levels and mortality rates.
3. **Regression Analysis:** Conducted regression to assess the impact of PM2.5, PM10, and NO2 levels on mortality from respiratory diseases.
4. **Visualization:** Created scatter and box plots to visualize the relationship between pollutant levels and mortality rates.

## Results and Analysis
- **Descriptive Statistics:** PM10 showed the highest concentration levels, while mortality rates were highest in areas with elevated NO2 levels.
- **Correlation Analysis:** Positive correlations were found between pollutant levels and respiratory disease mortality, especially with NO2 and COPD/lung cancer mortality.
- **Regression Analysis:** NO2 had the most significant positive association with respiratory disease mortality, indicating a need for focused emission reductions.

### Visualizations
- **Scatter Plots:** Displayed positive trends between pollutants and respiratory deaths.
- **Box Plots:** Showed broader distributions in respiratory mortality in countries with high PM levels.

## Conclusion
The analysis indicates that NO2 significantly impacts respiratory disease mortality, especially for chronic conditions like COPD and lung cancer. This highlights the importance of reducing NO2 emissions through stricter regulations.

## Recommendations
- Implementing stricter air quality standards for NO2 and PM10 in high-risk areas.
- Developing public health policies focused on respiratory health in heavily polluted regions.
- Further research to explore the long-term effects of PM2.5 and interactions between various pollutants.

## Files
- `Analysis_R_Code.R`: The R code for data cleaning, statistical analysis, and visualization.
- `Relationship between air pollution and respiratory health.docx`: A detailed report of the analysis and findings.

---

*This project serves as an important foundation for future public health policies aimed at reducing the impact of air pollution on respiratory health.*

---

### Contact
For further inquiries or collaboration, please reach out via [LinkedIn](your-linkedin-profile) or email.
