
## Project Name :- Olympics Data Analysis Using MySQL
------------------------------------------

Introduction:-
-
This project analyzes historical Olympic Games data using MySQL to uncover trends, patterns, and interesting facts about athletes, sports, countries, and medal distributions. The goal was to practice SQL querying, aggregation, and data exploration while extracting meaningful insights that can help understand Olympic history.

------------------------------------------------------------------------------------------------------------------------------
Dataset Info:-
-
Source:Kaggle – 120 years of Olympic history: athletes and results
Size: \~270,000 athlete records
Key Columns: `Name`, `Sex`, `Age`, `Team`, `NOC`, `Games`, `Year`, `Season`, `City`, `Sport`, `Event`, `Medal`

------------------------------------------------------------------------------------------------------------------------------
Project Goals
-
* Identify participation trends over the years.
* Find the top-performing countries and athletes.
* Analyze medal distribution patterns.
* Detect gender participation growth.
* Highlight special historical Olympic facts.

------------------------------------------------------------------------------------------------------------------------------
Methodology
-
 Database: MySQL
 Techniques Used:
  * `GROUP BY`, `ORDER BY` for ranking
  * Aggregate functions (`COUNT`, `MAX`, `MIN`, `AVG`)
  * Filtering with `WHERE`
  * Joins between athlete and results datasets
  * Subqueries for complex filtering
  * CTEs for structured analysis

------------------------------------------------------------------------------------------------------------------------------
Key Insights (Summary)
-
* **USA** leads in total medals across all time, followed by **Russia** and **Germany**.
* **Michael Phelps** is the most decorated Olympian with 28 medals.
* Summer Olympics have consistently higher participation than Winter Olympics.
* Women’s participation has increased significantly since the 1970s.
* Athletics and Swimming dominate in terms of medal count.
* The **youngest medalist** was only 13 years old, while the oldest was over 60.
* Some countries have only participated once in Olympic history.
* The number of events has expanded over time, reflecting diversification of sports.

------------------------------------------------------------------------------------------------------------------------------

Repository Structure:-
-

├── olympics_analysis.sql      # All MySQL queries used for analysis
├── insights.docx              # Detailed insights & interpretations
├── README.md                  # Project overview (this file)
└── dataset_info.txt           # Dataset details & column description

------------------------------------------------------------------------------------------------------------------------------
How to Use
-
1. Download the Kaggle dataset and import it into MySQL.
2. Run `olympics_analysis.sql` in your MySQL Workbench or CLI.
3. View the results to replicate the analysis.
4. Open `insights.docx` for a detailed breakdown of findings.

------------------------------------------

