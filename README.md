
# 🧠 COVID-19 Data Analysis using R

This project performs a detailed **exploratory data analysis (EDA)** on COVID-19 case data using the **R programming language**.  
It focuses on understanding **death rates**, **age distributions**, and **gender-based outcomes** through data cleaning, statistical testing, and visualization.

---

## 📋 Table of Contents
1. [Project Overview](#project-overview)
2. [Objectives](#objectives)
3. [Technologies Used](#technologies-used)
4. [Features](#features)
5. [Installation](#installation)
6. [Usage](#usage)
7. [Results](#results)
8. [Future Enhancements](#future-enhancements)
9. [References](#references)

---

## 📖 Project Overview
The project analyzes a COVID-19 dataset containing patient-level information such as **age**, **gender**, and **death status**.  
It identifies statistical relationships and visual patterns that explain the spread and impact of COVID-19.

The analysis includes:
- Data preprocessing and cleaning
- Feature engineering (`death_dummy` variable)
- Descriptive statistics
- Statistical hypothesis testing
- Visual representation of trends

---

## 🎯 Objectives
- To calculate and compare death rates among different groups.
- To study how **age** and **gender** affect mortality outcomes.
- To visualize patterns using histograms, scatter plots, boxplots, and bar charts.
- To summarize key findings for decision-making and further research.

---

## 🧰 Technologies Used
- **Language:** R  
- **IDE:** RStudio  
- **Libraries:**
  - [`ggplot2`](https://ggplot2.tidyverse.org) — for visualization  
  - [`Hmisc`](https://cran.r-project.org/package=Hmisc) — for data summary and statistical description  

---

## ⚙️ Features
- Load and summarize COVID-19 data.  
- Clean invalid or missing entries.  
- Create binary outcome (`death_dummy`).  
- Perform statistical analysis:
  - Mean age of deceased vs. survivors  
  - Death rate comparison by gender  
  - T-tests for statistical significance  
- Generate visualizations:
  - Histogram (Age vs. Death)  
  - Scatter plot (Age vs. Outcome)  
  - Boxplot (Age by Death Status)  
  - Bar chart (Death Rate by Gender)  
- Save all plots automatically in an `/output` folder.  

---

## 💻 Installation

1. **Install R and RStudio**  
   - [Download R](https://cran.r-project.org)  
   - [Download RStudio](https://posit.co/download/rstudio-desktop/)

2. **Clone this Repository**
   ```bash
   git clone https://github.com/your-username/COVID19-Data-Analysis.git
   cd COVID19-Data-Analysis
Install Required Packages in R

r
Copy code
install.packages("Hmisc")
install.packages("ggplot2")
▶️ Usage
Place your dataset file in the data/ or Downloads/ directory (e.g., COVID19_line_list_data.csv).

Open the covid_analysis.R script in RStudio.

Run the script line by line or use the “Run All” option.

The script will:

Load and clean the dataset.

Perform statistical analysis.

Generate and save plots in the /output folder.

📊 Results
Higher age correlates with an increased probability of death.

Gender influences death rates slightly, with males showing a higher mortality ratio.

Visual outputs (histograms, scatter plots, boxplots, bar charts) illustrate clear trends in data.

Results confirm that age is a major risk factor in COVID-19 outcomes.

All results and charts are saved automatically in the output/ directory as .png images.

🚀 Future Enhancements
Integrate live COVID-19 data from APIs.

Add machine learning models for outcome prediction.

Build an interactive dashboard using R Shiny or Power BI.

Implement geographical visualizations for regional analysis.

Automate data updates and cleaning processes.

📚 References
R Core Team (2024). R: A Language and Environment for Statistical Computing.
https://www.r-project.org

Hadley Wickham (2016). ggplot2: Elegant Graphics for Data Analysis.
https://ggplot2.tidyverse.org

Frank E. Harrell Jr. (2021). Hmisc: Harrell Miscellaneous R Package.
https://cran.r-project.org/package=Hmisc

World Health Organization (WHO). Coronavirus Disease (COVID-19) Dashboard.
https://covid19.who.int

Johns Hopkins University CSSE COVID-19 Data Repository.
https://github.com/CSSEGISandData/COVID-19

📬 Author
Your Name: Arpit
GitHub: @Arpit2004-UI
