Smart Food Waste & Donation Analytics

##Project Overview

This project analyzes restaurant food surplus and explores how available food can be allocated to NGOs more efficiently.

The project combines Python, MySQL, and Power BI to perform data cleaning, exploratory data analysis, donation allocation analysis, and interactive dashboard development.

Note: This project uses simulated data for educational and portfolio purposes. Food allocations represent proposed allocations, not confirmed real-world donations.

## Problem Statement

Restaurants may generate surplus food while NGOs face challenges meeting food requirements.

This project aims to:

- Analyze restaurant food surplus.
- Identify food items generating the highest surplus.
- Analyze location-wise food availability.
- Explore food allocation opportunities for NGOs.
- Measure proposed food allocation efficiency.
- Visualize key insights using Power BI.

## Technologies Used

- Python: Data processing, cleaning, and analysis
- Pandas: Data manipulation
- Matplotlib: Data visualization
- MySQL: Database management and SQL analysis
- Power BI: Interactive dashboard development
- DAX: KPI calculations
- Jupyter Notebook: Python development

## Dataset

The simulated dataset includes:

- 50 restaurants
- 10 NGOs
- 500 food surplus records
- Donation allocation records

## Project Workflow

1. Dataset creation using Python
2. Data cleaning and preprocessing
3. Exploratory Data Analysis (EDA)
4. Food surplus analysis
5. NGO matching and proposed food allocation
6. MySQL database creation
7. SQL analysis
8. Power BI dashboard development

## Key Project Results

| Metric | Result |
|---|---:|
| Total Restaurants | 50 |
| Total NGOs | 10 |
| Food Surplus Records | 500 |
| Total Surplus Food | 39,774 units |
| Total Allocated Food | 31,046 units |
| Remaining Surplus Food | 8,728 units |
| Allocation Rate | 78.06% |

## Key Insights

- Biryani generated the highest total food surplus among the analyzed food items.
- Restaurant_14 generated the highest total surplus among restaurants.
- Approximately 78.06% of the available surplus food was assigned through the proposed allocation process.
- Approximately 21.94% remained unallocated.
- Location-wise and monthly analysis helps identify patterns in surplus food availability.

## Power BI Dashboard

The interactive dashboard includes:

- Total Surplus Food KPI
- Total Allocated Food KPI
- Remaining Surplus KPI
- Allocation Percentage KPI
- Top Restaurants by Surplus Food
- Food Surplus by Food Item
- Location-wise Food Surplus
- Monthly Food Surplus Trend
- NGO Food Allocation Analysis
- Food Allocation Distribution

![Power BI Dashboard](dashboard_preview.png)

## Conclusion

This project demonstrates how data analytics can support food waste management and donation planning.

By combining Python, SQL, and Power BI, the project identifies food surplus patterns, analyzes proposed NGO allocations, and presents useful insights through an interactive dashboard.

The analysis demonstrates a potential allocation rate of 78.06% within the simulated dataset.

## Future Improvements

- Include real-time restaurant surplus information.
- Incorporate food expiry times into allocation decisions.
- Consider transportation distance and delivery constraints.
- Develop automated NGO matching.
- Improve allocation efficiency using optimization algorithms.
