# Installing the readxl package
install.packages("readxl")

# Load the readxl package
library(readxl)
# Import the air pollution data 
pollution_data <- read_excel("C:\\Users\\user\\Downloads\\Pollution Level - Disease Analysis.xlsx", sheet = "PollutionLevels (Co&Year)")

# Import the respiratory disease data 
disease_data <- read_excel("C:\\Users\\user\\Downloads\\Pollution Level - Disease Analysis.xlsx", sheet = "DiseaseType (Co,Year&Deaths)")


# Descriptive statistical techniques 
# Numerical analysis 
#Mean, Median and Mode

# Calculate mean and median for PM2.5 levels
mean_pm25 <- mean(pollution_data$"PM2.5 (μg/m3)", na.rm = TRUE)
median_pm25 <- median(pollution_data$"PM2.5 (μg/m3)", na.rm = TRUE)

# Calculate mean and median for PM10 levels
mean_pm10 <- mean(pollution_data$"PM10 (μg/m3)", na.rm = TRUE)
median_pm10 <- median(pollution_data$"PM10 (μg/m3)", na.rm = TRUE)

# Calculate mean and median for NO2 levels
mean_no2 <- mean(pollution_data$"NO2 (μg/m3)", na.rm = TRUE)
median_no2 <- median(pollution_data$"NO2 (μg/m3)", na.rm = TRUE)

# Calculate mean and median for deaths from all diseases
mean_deaths <- mean(disease_data$"Number of death (rounded)", na.rm = TRUE)
median_deaths <- median(disease_data$"Number of death (rounded)", na.rm = TRUE)

# Install package dplyr
install.packages("dplyr")
# Load dplyr library for data manipulation to filter diseases in the diagnose column
library(dplyr)

str(pollution_data)
str(disease_data)

combined_data <- pollution_data %>%
  left_join(disease_data, by = c("Country", "Year"))  

str(combined_data)  # Check the structure
head(combined_data)

# Calculate mean and median for disease mortality rates (asthma,COPD,and lung cancer deaths)
mean_asthma_deaths <- mean(disease_data$`Number of death (rounded)`[disease_data$Diagnose == "Asthma"], na.rm = TRUE)
median_asthma_deaths <- median(disease_data$`Number of death (rounded)`[disease_data$Diagnose == "Asthma"], na.rm = TRUE)

mean_COPD_deaths <- mean(disease_data$`Number of death (rounded)`[disease_data$Diagnose == "Chronic obstructive pulmonary disease
"], na.rm = TRUE)
median_COPD_deaths <- median(disease_data$`Number of death (rounded)`[disease_data$Diagnose == "Chronic obstructive pulmonary disease
"], na.rm = TRUE)

mean_lungcancer_deaths <- mean(disease_data$`Number of death (rounded)`[disease_data$Diagnose == "Tracheal, bronchus, and lung cancer"], na.rm = TRUE)
median_lungcancer_deaths <- median(disease_data$`Number of death (rounded)`[disease_data$Diagnose == "Tracheal, bronchus, and lung cancer"], na.rm = TRUE)

#Standard deviation and variance

# Calculate standard deviation and variance for PM2.5 levels
sd_pm25 <- sd(pollution_data$"PM2.5 (μg/m3)", na.rm = TRUE)
var_pm25 <- var(pollution_data$"PM2.5 (μg/m3)", na.rm = TRUE)

# Calculate standard deviation and variance for PM10 levels
sd_pm10 <- sd(pollution_data$"PM10 (μg/m3)", na.rm = TRUE)
var_pm10 <- var(pollution_data$"PM10 (μg/m3)", na.rm = TRUE)

# Calculate standard deviation and variance for NO2 levels
sd_no2 <- sd(pollution_data$"NO2 (μg/m3)", na.rm = TRUE)
var_no2 <- var(pollution_data$"NO2 (μg/m3)", na.rm = TRUE)

# Calculate standard deviation and variance for deaths
sd_deaths <- sd(disease_data$"Number of death (rounded)", na.rm = TRUE)
var_deaths <- var(disease_data$"Number of death (rounded)", na.rm = TRUE)

# Calculate standard deviation and variance for disease mortality rates (asthma,COPD,and lung cancer deaths)
sd_asthma_deaths <- sd(disease_data$`Number of death (rounded)`[disease_data$Diagnose == "Asthma"], na.rm = TRUE)
var_asthma_deaths <- var(disease_data$`Number of death (rounded)`[disease_data$Diagnose == "Asthma"], na.rm = TRUE)

sd_COPD_deaths <- sd(disease_data$`Number of death (rounded)`[disease_data$Diagnose == "Chronic obstructive pulmonary disease
"], na.rm = TRUE)
var_COPD_deaths <- var(disease_data$`Number of death (rounded)`[disease_data$Diagnose == "Chronic obstructive pulmonary disease
"], na.rm = TRUE)

sd_lungcancer_deaths <- sd(disease_data$`Number of death (rounded)`[disease_data$Diagnose == "Tracheal, bronchus, and lung cancer"], na.rm = TRUE)
var_lungcancer_deaths <- var(disease_data$`Number of death (rounded)`[disease_data$Diagnose == "Tracheal, bronchus, and lung cancer"], na.rm = TRUE)

# Correlation coefficients
# Calculate correlation between PM2.5 levels and asthma deaths
# Correlation_pm25_asthma <- cor(pollution_data$PM2.5, disease_data$Asthma, use = "complete.obs")
# Create a correlation matrix for multiple pollutants and diseases

# Install tidyr part of tidyverse to tidy up the data
install.packages("tidyr")
# Load library(tidyr)
library(tidyr)

# Pivot 'Diagnose' to create separate columns for each disease's death count
combined_data_wide <- combined_data %>%
  pivot_wider(names_from = Diagnose, values_from = "Number of death (rounded)", values_fill = 0)

#Select relevant columns for the correlation matrix
# Assuming pollutants columns are 'pm2.5', 'pm10', 'no2' and each disease has its own column
correlation_data <- combined_data_wide %>%
  select(`PM2.5 (μg/m3)`, `PM10 (μg/m3)`, `NO2 (μg/m3)`, `Asthma`, `Chronic obstructive pulmonary disease`, `Tracheal, bronchus, and lung cancer`)
# Calculate the correlation matrix
correlation_matrix <- cor(correlation_data, use = "complete.obs")

#Graphical Analysis 
#Time Series Plots
install.packages("ggplot2")
library(ggplot2)

# Convert data to a long format to plot all pollutants in one chart
combined_long <- combined_data %>%
  pivot_longer(cols = starts_with("PM") | starts_with("NO"), 
               names_to = "Pollutant", 
               values_to = "Value")

# Create the scatter plot with faceting by pollutant
ggplot(combined_long, aes(x = Year, y = Value, color = Country)) +
  geom_point() +
  geom_line() +
  labs(title = "Pollutant Levels Over Time by Country",
       x = "Year",
       y = "Pollutant Levels (μg/m3)") +
  facet_wrap(~ Pollutant, scales = "free_y") +  # Create a separate plot for each pollutant
  theme_minimal() +
  theme(legend.position = "none")  # Hide legend for clarity



# Specify the countries you want to include
selected_countries <- c("Belgium", "Hungary", "Germany", "Norway")

# Filter for only these 10 countries
filtered_data <- combined_long %>%
  filter(Country %in% selected_countries)

# Scatter plot with labels for each country
my_scatterplot<-ggplot(filtered_data, aes(x = Year, y = Value, color = Country)) +
  geom_point() +
  geom_line() +
  geom_text(aes(label = round(Value, 2)), vjust = -0.5, size = 3, check_overlap = TRUE) +  # Adds exact values rounded to 2 decimal places
  labs(title = "Pollutant Levels Over Time for Selected Countries",
       x = "Year",
       y = "Pollutant Levels (μg/m3)") +
  facet_wrap(~ Pollutant, scales = "free_y") +
  theme_minimal() +
  theme(legend.position = "right")  # Hide legend to avoid redundancy

# Boxplot
# Reshape data to include only pollutants and deaths, filtering for non-null values
combined_long_deaths <- combined_data %>%
  pivot_longer(cols = starts_with("PM") | starts_with("NO"), 
               names_to = "Pollutant", 
               values_to = "Value") %>%
  filter(!is.na("Number of death (rounded)"))  # Filter out any rows where deaths data is missing

# Create boxplot
my_boxplot<-ggplot(combined_long_deaths, aes(x = Pollutant, y = `Number of death (rounded)`, fill = Pollutant)) +
  geom_boxplot() +
  labs(title = "Effect of Particulate Matter and Emissions on Deaths by Country",
       x = "Pollutant",
       y = "Number of death (rounded)") +
  theme_minimal() +
  theme(legend.position = "right")  # Remove legend for a cleaner look

#Linear Regression 
# Here, we create a new data frame for regression analysis
regression_data <- combined_data %>%
  select(`Number of death (rounded)`, `PM2.5 (μg/m3)`, `PM10 (μg/m3)`, `NO2 (μg/m3)`) %>%
  drop_na()  # Remove rows with missing values

# Fit the linear regression model
linear_model <- lm(`Number of death (rounded)` ~ `PM2.5 (μg/m3)` + `PM10 (μg/m3)` + `NO2 (μg/m3)`, data = regression_data)

# Summary of the linear regression model
summary(linear_model)

install.packages("patchwork")
library(patchwork)
my_scatterplot+my_boxplot
