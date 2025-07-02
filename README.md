# 🛒 Superstore SQL Analysis Project

This project showcases a complete data analysis workflow on the **Superstore** dataset using SQL and SQLite. It includes data cleaning, transformation, and deep business insight generation through structured SQL queries. Results are compiled into a well-formatted PDF report.

---

## 📌 Highlights

- 📊 Performed **12+ SQL queries** for data preprocessing and analysis
- 🧹 Cleaned data by handling NULLs, invalid values, and duplicates
- 📈 Uncovered insights across regions, customer segments, and products


---

## 📁 Files

| File Name                                                    | Description                                      |
|--------------------------------------------------------------|--------------------------------------------------|
| `Sales and Profit Analysis of Superstore Data Using SQL.pdf` | Final PDF report with queries and tabular output |
| `superstore_analysisupdated.sql`                             | All SQL queries (cleaning + analysis)            |
| `superstore.db`                                              | SQLite database containing Superstore data       |
| `README.md`                                                  | You're reading it!                               |

---

## 🔎 Sample Output

### Total Sales by Region

| Region  | Total Sales |
|---------|-------------|
| West    | 725,355.49  |
| East    | 677,906.37  |
| Central | 501,239.89  |
| South   | 391,007.83  |

### Most Profitable Sub-Categories

| Sub-Category | Total Profit |
|--------------|--------------|
| Copiers      |55,617.82     |
| Phones       | 44,515.73    |
| Accessories  | 41,867.82    |
| Paper        | 34,009.47    |

---

## 🛠️ Tech Stack

- **SQLite** (via DB Browser)
- **SQL** (Data Cleaning + Analysis)


## 🧠 Key Insights

- **California** leads in both sales and profit
- **Copiers**,**Phones** and **Accessories** are top profitable categories

---

## 📌 Setup Instructions

```bash
# 1. Clone the repo
git clone https://github.com/vam/Sales-and-Profit-Analysis-of-Superstore-Data-Using-SQL.git

# 2. Open the database using DB Browser for SQLite

# 3. Run queries from superstore_analysis.sql

# 4. View results or generate PDF using Python script (optional)
