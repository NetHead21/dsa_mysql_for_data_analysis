# MySQL Training - Finance Database

## Project Overview
This project contains a comprehensive collection of SQL queries for analyzing sales data using MySQL. It demonstrates various SQL concepts including filtering, aggregation, window functions, and complex analytical queries.

## Database Information
- **Database Name**: `finance`
- **Main Table**: `tbl_sales`
- **Data Source**: `tbl_sales.csv`

## Table Structure
The `tbl_sales` table contains the following columns:
- `country` - Country where the sale occurred
- `product` - Product name
- `segment` - Market segment
- `sales` - Sales amount
- `profit` - Profit amount
- `discounts` - Discount amount
- `gross_sales` - Gross sales amount
- `sale_price` - Sale price per unit
- `units_sold` - Number of units sold
- `year` - Year of transaction
- `Month_Number` - Month number (1-12)
- `Month_Name` - Month name (January-December)

## Prerequisites
- MySQL 8.0 or higher (required for window functions)
- MySQL Workbench or DataGrip (recommended)
- Basic understanding of SQL

## Setup Instructions

### 1. Create Database
```sql
CREATE DATABASE finance;
USE finance;
```

### 2. Import Data
Import the `tbl_sales.csv` file into the `tbl_sales` table using your MySQL client.

### 3. Verify Installation
```sql
SHOW TABLES;
SELECT * FROM tbl_sales LIMIT 10;
```

## Query Categories

### Basic Queries (1-5)
- **Query #1**: List all sales records for Canada
- **Query #2**: Top 10 highest sales transactions
- **Query #3**: Unique product names
- **Query #4**: Sales made in January 2024
- **Query #5**: Transactions with negative profit

### Aggregation Queries (6-12)
- **Query #6**: Total sales per country
- **Query #7**: Average units sold by product
- **Query #8**: Total profit per year
- **Query #9**: Top 5 countries with highest sales
- **Query #10**: Number of transactions per market segment
- **Query #11**: Products with total sales above 100,000
- **Query #12**: Countries where average discount > 500

### Advanced Analytics (13-25)
- **Query #13**: Most profitable product in each country (Window Function)
- **Query #14**: Top 3 segments by total profit
- **Query #15**: Products where average sales price > 120
- **Query #16**: Best-selling product in each year (Window Function)
- **Query #17**: Country with highest profit margin
- **Query #18**: Monthly sales trend for 2024
- **Query #19**: Top 5 most profitable transactions per country (Window Function)
- **Query #20**: Segment with highest average profit per unit sold
- **Query #21**: Countries with sales > 200,000 and discount < 1000
- **Query #22**: Yearly profit growth analysis (LAG Window Function)
- **Query #23**: Top product per segment by profit (Window Function)
- **Query #24**: Months where discounts exceeded 10% of gross sales
- **Query #25**: Most profitable product-country pair

## Key SQL Concepts Demonstrated

### 1. Filtering & Sorting
- `WHERE` clause for filtering
- `ORDER BY` for sorting results
- `LIMIT` for restricting result set
- `DISTINCT` for unique values

### 2. Aggregation Functions
- `SUM()` - Calculate totals
- `AVG()` - Calculate averages
- `COUNT()` - Count records
- `MAX()` - Find maximum values
- `ROUND()` - Round numeric values

### 3. Grouping & Having
- `GROUP BY` - Group data by columns
- `HAVING` - Filter grouped results

### 4. Window Functions (MySQL 8.0+)
- `ROW_NUMBER()` - Assign sequential numbers
- `LAG()` - Access previous row values
- `PARTITION BY` - Create partitions for window functions
- `OVER()` - Define window specifications

### 5. Subqueries
- Derived tables in `FROM` clause
- Filtering results from subqueries

### 6. Mathematical Operations
- Division with `NULLIF()` to prevent division by zero
- Percentage calculations
- Profit margin calculations

## Usage

### Running Individual Queries
1. Open `queries.sql` in your MySQL client
2. Select the query you want to run
3. Execute the selected query

### Running All Queries
Execute the entire `queries.sql` file to run all queries sequentially.

## Naming Conventions
This project follows standard SQL naming conventions:
- **Tables**: Lowercase with underscores (e.g., `tbl_sales`)
- **Columns**: Lowercase with underscores (e.g., `units_sold`)
- **Aliases**: Descriptive and lowercase (e.g., `total_sales`, `avg_discount`)
- **Variables**: Prefix with `v_` or `p_` (e.g., `v_total_sales`, `p_country`)

## Best Practices Applied
- ✅ Consistent lowercase naming
- ✅ Descriptive column aliases
- ✅ Proper use of `NULLIF()` to prevent division by zero
- ✅ Comments for each query explaining its purpose
- ✅ Efficient use of indexes (assumes proper indexing on `country`, `product`, `year`)
- ✅ Window functions for complex analytics
- ✅ Proper grouping and aggregation

## Common Issues & Solutions

### Issue: Window Functions Not Working
**Solution**: Ensure you're using MySQL 8.0 or higher. Check version with:
```sql
SELECT VERSION();
```

### Issue: Column Not Found Error
**Solution**: Verify column names match the table structure. Column names are case-sensitive in some MySQL configurations.

### Issue: Division by Zero
**Solution**: Queries use `NULLIF()` function to handle division by zero safely.

## File Structure
```
Intro to MySQL Training/
├── README.md                           # This file
├── queries.sql                         # All SQL queries
├── tbl_sales.csv                       # Source data file
├── 25 Business Question - MySQL.xlsx   # Business requirements
└── How to Download, Install, Configure MySQL.txt
```

## Learning Path
1. Start with basic queries (#1-5) to understand filtering and selection
2. Move to aggregation queries (#6-12) to learn grouping and summary statistics
3. Progress to advanced analytics (#13-25) for window functions and complex analysis

## Author
Juniven Saavedra

## Date
October 2025

## Notes
- All queries are tested and validated for MySQL 8.0+
- Window functions require MySQL 8.0 or higher
- Some queries have multiple variations to demonstrate different approaches
- Results may vary based on the actual data in `tbl_sales.csv`

## Additional Resources
- [MySQL 8.0 Documentation](https://dev.mysql.com/doc/refman/8.0/en/)
- [MySQL Window Functions](https://dev.mysql.com/doc/refman/8.0/en/window-functions.html)
- [SQL Best Practices](https://www.sqlstyle.guide/)

---

**Happy Learning! 🚀**

