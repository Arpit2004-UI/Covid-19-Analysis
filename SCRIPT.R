# ========================
# COVID-19 Analysis Script
# ========================

# --- 1. Setup: Install & Import Packages ---
if (!require("Hmisc")) install.packages("Hmisc")
if (!require("ggplot2")) install.packages("ggplot2")
library(Hmisc)
library(ggplot2)

# Output directory for images
if(!dir.exists("output")) dir.create("output")

# --- 2. Data Load & Summary ---
data <-  read.csv("C:/Users/ARPIT/Downloads/COVID19_line_list_data.csv")
describe(data)
cat("Loaded data and printed summary.\n")

# --- 3. Feature Engineering ---
data$death_dummy <- as.integer(data$death != 0)
cat("Added binary death_dummy variable.\n")

# --- 4. DATA CLEANING for analysis & plotting ---
clean_data <- subset(data,
                     !is.na(age) & is.finite(age) &
                       !is.na(death_dummy) & is.finite(death_dummy)
)

cat(sprintf("Excluded %d rows with missing or invalid age/death_dummy.\n", nrow(data) - nrow(clean_data)))

# Only keep gender rows for gender plots
clean_gender <- subset(clean_data,
                       !is.na(gender) & gender %in% c("male", "female")
)

# --- 5. Analysis: Death rate & Age ---
death_rate <- sum(clean_data$death_dummy, na.rm=TRUE) / nrow(clean_data)
dead <- subset(clean_data, death_dummy == 1)
alive <- subset(clean_data, death_dummy == 0)
mean_age_dead <- mean(dead$age)
mean_age_alive <- mean(alive$age)
age_ttest <- t.test(alive$age, dead$age, alternative="two.sided", conf.level = 0.99)

# --- 6. VISUALIZATIONS ---
# Histogram: Age distribution by death status
p1 <- ggplot(clean_data, aes(x = age, fill = as.factor(death_dummy))) +
  geom_histogram(alpha = 0.6, position = "identity", bins = 30) +
  labs(title = "Age Distribution by Survival Status",
       x = "Age", fill = "Died (1=Yes)") +
  theme_minimal()
print(p1)
ggsave("output/age_distribution_by_death.png", plot = p1)

# Scatter plot: Age vs Death
p2 <- ggplot(clean_data, aes(x = age, y = death_dummy)) +
  geom_jitter(alpha = 0.2, color = "blue", width = 0.2, height=0.05) +
  labs(title = "Scatter: Age versus Death Outcome",
       x = "Age", y = "Death (0=Alive, 1=Dead)") +
  theme_minimal()
print(p2)
ggsave("output/scatter_age_death.png", plot = p2)

# --- 6B. Boxplot: Age vs Death Outcome ---
p_box <- ggplot(clean_data, aes(x = as.factor(death_dummy), y = age, fill = as.factor(death_dummy))) +
  geom_boxplot(alpha = 0.7, outlier.color = "red") +
  labs(title = "Boxplot: Age by Death Status",
       x = "Death (0=Alive, 1=Dead)",
       y = "Age") +
  theme_minimal() +
  scale_fill_manual(values = c("#56B4E9", "#E69F00"), name = "Death Status")
print(p_box)
ggsave("output/boxplot_age_by_death.png", plot = p_box)

# --- 7. Gender analysis & plot ---
men <- subset(clean_gender, gender == "male")
women <- subset(clean_gender, gender == "female")
men_death_rate <- mean(men$death_dummy)
women_death_rate <- mean(women$death_dummy)
gender_rates <- data.frame(
  Gender = c("Male", "Female"),
  DeathRate = c(men_death_rate, women_death_rate)
)

p3 <- ggplot(gender_rates, aes(x = Gender, y = DeathRate, fill = Gender)) +
  geom_col() +
  labs(title = "Death Rate by Gender", y = "Death Rate", x = "Gender") +
  theme_minimal()
print(p3)
ggsave("output/barplot_gender_deathrate.png", plot = p3)

gender_ttest <- t.test(men$death_dummy, women$death_dummy,
                       alternative="two.sided", conf.level=0.99)

# --- 8. Results Output ---
cat("\n====== SUMMARY ======\n")
cat("Overall Death Rate:", round(death_rate, 4), "\n")
cat("Mean Age (Dead):", round(mean_age_dead, 2), "\n")
cat("Mean Age (Alive):", round(mean_age_alive, 2), "\n")
cat("Age t-test p-value:", signif(age_ttest$p.value, 3), "\n")
cat("Men Death Rate:", round(men_death_rate, 3), "\n")
cat("Women Death Rate:", round(women_death_rate, 3), "\n")
cat("Gender t-test p-value:", signif(gender_ttest$p.value, 3), "\n")
cat("\nSee charts in the output folder. Analysis complete.\n")

# =========================
# End of Script
# =========================
