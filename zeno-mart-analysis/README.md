# 📊 Retail Customer Demographics & Sales Performance Data Model

## 📌 Project Overview
The goal of this project was to take a raw, messy customer transaction dataset and transform it into a structured, analysis-ready data model. The original data contained poorly formatted text fields, raw email strings, and unstandardized dates that prevented reliable segmentation by demographics or geography. 

![Raw data.png](src/Raw%20data.png)

Using Power Query, I built a repeatable data transformation pipeline to extract clean customer details, standardize time-intelligence parameters, and engineer profitability metrics per order. This structured star-schema foundation allows the business to seamlessly break down sales patterns by customer age, regional distribution, and loyalty tier status.

![power query.png](src/power%20query.png)

---

## 🛠️ Tool Used
* **Power Query**: For deep data cleaning, text splitting, and dimensional modeling, `my_query.m` [here](my_query.m)

## 📊 Core Dataset Scope
* **Unique Customers Profiles**: Comprehensive tracking across regional markets (USA, Canada, UK, Australia, Singapore).
* **Diversified Segments**: Granular product line grouping spanning Electronics, Beauty, Clothing, Sports, Books, and Home & Kitchen.

---

## ⚙️ Data Engineering & Transformation Process

### 👤 1. Customer Profile Normalization
* **Name Extraction**: Extracted and capitalized the first and last names directly from the raw customer email string fields, merging them into a standardized `Full Name` column.
* **Age Calculation**: Standardized the uneven `Customer Date of Birth` rows into a unified Date format, allowing for dynamic age extraction and subsequent age-cohort clustering.

### 📦 2. Text Scrubbing & Regional Mapping
* **Data Hygiene**: Applied string trimming and transformation functions to clear stray white spaces within the `Product Name` field to prevent duplication errors during visual aggregation.
* **Geographic Alignment**: Extracted and grouped location variables into a distinct `Region` field (mapping markets like Ontario, London, New South Wales, and West Coast zones).

### 💳 3. Feature Engineering & Logic Rules
* **Loyalty Categorization**: Created a logical mapping column (`Have loyal card` – Yes/No) utilizing dynamic conditional statements tied to baseline system ID criteria.
* **Time Intelligence Setup**: Parsed raw transaction timestamps to cleanly isolate the `Purchase Date` and independent calendar attributes like `Year` for yearly trend metrics.

### 💵 4. Financial KPI Formulation
* **Order Calculations**: Engineered explicit mathematical fields at the row level to isolate true financial metrics, including `Cost Per Order` and `Sales Per Order`.
* **Profit Visibility**: Structured a distinct `Profit Per Order` metric mapping the absolute variance between cost structures and gross retail revenue, finalized with strict currency constraints.

---
## Final Work
![work data (sheet 1).png](src/work%20data%20(sheet%201).png)


You can also view the PDF of the Excel file , `ZENO-MART-CUSTOMER-TRANSACTION-DATA (worked).pdf`. [here](ZENO-MART-CUSTOMER-TRANSACTION-DATA%20(worked).pdf).


---
## Files Included
- `ZENO-MART-CUSTOMER-TRANSACTION-DATA (worked).xlsx`:[Cleaned Excel file.](docs/ZENO-MART-CUSTOMER-TRANSACTION-DATA%20(worked).xlsx).

- `ZENO-MART-CUSTOMER-TRANSACTION-DATA.xlsx`: [Raw excel data from Zeno Mart.](docs/ZENO-MART-CUSTOMER-TRANSACTION-DATA.xlsx).
