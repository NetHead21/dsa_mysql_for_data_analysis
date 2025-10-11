create database finance;

use finance;
show tables;


-- Basic query to view all data in the table
select *
from tbl_sales;


-- 1 List all records of sales for Canada.
-- Filters all rows where the country column equals 'Canada'
-- Returns all columns for Canadian sales transactions
select *
from tbl_sales
where country = 'Canada';
+------------------+---------+-----------+---------------+------------+---------------------+------------+-------------+-----------+-----------+---------+-----------+-----------+--------------+------------+------+
| Segment          | Country | Product   | Discount_Band | Units_Sold | Manufacturing_Price | Sale_Price | Gross_Sales | Discounts | Sales     | COGS    | Profit    | Date      | Month_Number | Month_Name | Year |
+------------------+---------+-----------+---------------+------------+---------------------+------------+-------------+-----------+-----------+---------+-----------+-----------+--------------+------------+------+
| Government       | Canada  | Carretera | None          |     1618.5 |                   3 |         20 |       32370 |         0 |     32370 |   16185 | 16185     | 1/1/2024  |            1 | January    | 2024 |
| Channel Partners | Canada  | Montana   | None          |       2518 |                   5 |         12 |       30216 |         0 |     30216 |    7554 | 22662     | 6/1/2024  |            6 | June       | 2024 |
| Enterprise       | Canada  | Montana   | None          |     2665.5 |                   5 |        125 |    333187.5 |         0 |  333187.5 |  319860 | 13327.5   | 7/1/2024  |            7 | July       | 2024 |
| Enterprise       | Canada  | Montana   | None          |        345 |                   5 |        125 |       43125 |         0 |     43125 |   41400 | 1725      | 10/1/2023 |           10 | October    | 2023 |
| Government       | Canada  | Paseo     | None          |        292 |                  10 |         20 |        5840 |         0 |      5840 |    2920 | 2920      | 2/1/2024  |            2 | February   | 2024 |


-- 2 Retrieve the top 10 highest sales transactions.
-- Orders all records by the sales column in descending order (highest first)
-- Limits the result to only the top 10 rows
select *
from tbl_sales
order by sales desc
limit 10;

+----------------+---------+-----------+---------------+------------+---------------------+------------+-------------+-----------+-----------+--------+---------+-----------+--------------+------------+------+
| Segment        | Country | Product   | Discount_Band | Units_Sold | Manufacturing_Price | Sale_Price | Gross_Sales | Discounts | Sales     | COGS   | Profit  | Date      | Month_Number | Month_Name | Year |
+----------------+---------+-----------+---------------+------------+---------------------+------------+-------------+-----------+-----------+--------+---------+-----------+--------------+------------+------+
| Government     | USA     | Paseo     | Low           |       3450 |                  10 |        350 |     1207500 |     48300 |   1159200 | 897000 | 262200  | 7/1/2024  |            7 | July       | 2024 |
| Small Business | Canada  | Montana   | Medium        |     3802.5 |                   5 |        300 |     1140750 |  102667.5 | 1038082.5 | 950625 | 87457.5 | 4/1/2024  |            4 | April      | 2024 |
| Small Business | Canada  | Velo      | Medium        |     3793.5 |                 120 |        300 |     1138050 |  102424.5 | 1035625.5 | 948375 | 87250.5 | 7/1/2024  |            7 | July       | 2024 |
| Government     | Germany | Amarilla  | Low           |       2966 |                 260 |        350 |     1038100 |     20762 |   1017338 | 771160 | 246178  | 10/1/2023 |           10 | October    | 2023 |
| Government     | Germany | Velo      | Low           |       2966 |                 120 |        350 |     1038100 |     20762 |   1017338 | 771160 | 246178  | 10/1/2023 |           10 | October    | 2023 |
| Government     | Germany | VTT       | Low           |       2877 |                 250 |        350 |     1006950 |     20139 |    986811 | 748020 | 238791  | 10/1/2024 |           10 | October    | 2024 |
| Government     | Germany | Velo      | Low           |       2877 |                 120 |        350 |     1006950 |     20139 |    986811 | 748020 | 238791  | 10/1/2024 |           10 | October    | 2024 |
| Government     | Canada  | Paseo     | Low           |       2852 |                  10 |        350 |      998200 |     19964 |    978236 | 741520 | 236716  | 12/1/2024 |           12 | December   | 2024 |
| Government     | Canada  | Carretera | Low           |       2852 |                   3 |        350 |      998200 |     19964 |    978236 | 741520 | 236716  | 12/1/2024 |           12 | December   | 2024 |
| Government     | France  | Amarilla  | None          |       2750 |                 260 |        350 |      962500 |         0 |    962500 | 715000 | 247500  | 2/1/2024  |            2 | February   | 2024 |
+----------------+---------+-----------+---------------+------------+---------------------+------------+-------------+-----------+-----------+--------+---------+-----------+--------------+------------+------+


-- 3 Show all unique product names.
-- Uses DISTINCT to return only unique product names from the table
-- Eliminates duplicate product entries
select distinct product
from tbl_sales;


-- 4 Find sales made in January 2024.
-- Filters rows where Month_Name is 'January' AND year is '2024'
-- Both conditions must be true for a row to be included
select *
from tbl_sales
where Month_Name = 'January'
  and year = '2024';

select *
from tbl_sales
where Month_Number = 1;

+------------------+---------+-----------+---------------+------------+---------------------+------------+-------------+-----------+-----------+--------+-----------+----------+--------------+------------+------+
| Segment          | Country | Product   | Discount_Band | Units_Sold | Manufacturing_Price | Sale_Price | Gross_Sales | Discounts | Sales     | COGS   | Profit    | Date     | Month_Number | Month_Name | Year |
+------------------+---------+-----------+---------------+------------+---------------------+------------+-------------+-----------+-----------+--------+-----------+----------+--------------+------------+------+
| Government       | Canada  | Carretera | None          |     1618.5 |                   3 |         20 |       32370 |         0 |     32370 |  16185 | 16185     | 1/1/2024 |            1 | January    | 2024 |
| Government       | Germany | Carretera | None          |       1321 |                   3 |         20 |       26420 |         0 |     26420 |  13210 | 13210     | 1/1/2024 |            1 | January    | 2024 |
| Government       | Mexico  | Velo      | None          |       1493 |                 120 |          7 |       10451 |         0 |     10451 |   7465 | 2986      | 1/1/2024 |            1 | January    | 2024 |
| Government       | France  | Paseo     | Low           |       3945 |                  10 |          7 |       27615 |    276.15 |  27338.85 |  19725 | 7613.85   | 1/1/2024 |            1 | January    | 2024 |
+------------------+---------+-----------+---------------+------------+---------------------+------------+-------------+-----------+-----------+--------+-----------+----------+--------------+------------+------+

-- 5 Display all transactions where profit is negative.
-- Filters rows where profit column is less than 0
-- Shows all loss-making transactions
select *
from tbl_sales
where profit < 0;


-- 6 Total sales per country.
-- select country, round(sum(sales), 2) as total_sales — Selects the country name and the sum of all sales for that
-- country, rounded to 2 decimal places from tbl_sales — Data is pulled from the tbl_sales table
-- group by country — Groups all rows by country, so the sum(sales) is calculated separately for each country
select country,
       round(sum(sales), 2) as total_sales
from tbl_sales
group by country;

+---------+-------------+
| country | total_sales |
+---------+-------------+
| Canada  | 24887654.89 |
| Germany | 23505340.82 |
| France  | 24354172.29 |
| Mexico  | 20949352.11 |
| USA     | 25029830.18 |
+---------+-------------+


-- 7 Average units sold by product.
-- Groups data by product and calculates the average units_sold for each product
-- round(avg(units_sold), 2) — Computes average and rounds to 2 decimal places
-- Useful for understanding typical order sizes per product
select product,
       round(avg(units_sold), 2) as product_avg_unit_sold
from tbl_sales
group by product;

+-----------+-----------------------+
| product   | product_avg_unit_sold |
+-----------+-----------------------+
| Carretera |               1578.99 |
| Montana   |               1658.04 |
| Paseo     |               1674.45 |
| Velo      |               1490.13 |
| VTT       |               1548.47 |
| Amarilla  |               1652.29 |
+-----------+-----------------------+

-- 8 Total profit per year.
-- Groups all transactions by year
-- sum(profit) — Adds up all profit values for each year
-- Shows yearly profit performance, rounded to 2 decimal places
select year,
       round(sum(profit), 2) as total_profit
from tbl_sales
group by year;

+------+--------------+
| year | total_profit |
+------+--------------+
| 2024 |  13015237.78 |
| 2023 |   3878464.51 |
+------+--------------+


-- 9 Find top 5 countries with the highest sales.
-- Groups by country and sums total sales for each country
-- order by sum_of_sales desc — Sorts countries from highest to lowest sales
-- limit 5 — Returns only the top 5 countries
select country, round(sum(sales), 2) as sum_of_sales
from tbl_sales
group by country
order by sum_of_sales desc
limit 5;

+---------+--------------+
| country | sum_of_sales |
+---------+--------------+
| USA     |  25029830.18 |
| Canada  |  24887654.89 |
| France  |  24354172.29 |
| Germany |  23505340.82 |
| Mexico  |  20949352.11 |
+---------+--------------+


-- 10 Number of transactions per market segment.
-- Groups data by segment (e.g., Government, Small Business, Enterprise, etc.)
-- count(*) — Counts the number of rows (transactions) in each segment
-- Shows transaction volume by market segment
select segment, count(*) as count_of_transactions
from tbl_sales
group by segment;

+------------------+-----------------------+
| segment          | count_of_transactions |
+------------------+-----------------------+
| Government       |                   300 |
| Midmarket        |                   100 |
| Channel Partners |                   100 |
| Enterprise       |                   100 |
| Small Business   |                   100 |
+------------------+-----------------------+

-- 11 Products with total sales above 100,000.
-- Groups by product and sums total sales for each product
-- having total_sales > 100000 — Filters groups where total sales exceed 100,000
-- HAVING is used (not WHERE) because it filters aggregated results
-- order by total_sales desc — Sorts from highest to lowest sales
select product, round(sum(sales), 2) as total_sales
from tbl_sales
group by product
having total_sales > 100000
order by total_sales desc;

+-----------+-------------+
| product   | total_sales |
+-----------+-------------+
| Paseo     | 33011143.96 |
| VTT       | 20511921.02 |
| Velo      | 18250059.47 |
| Amarilla  | 17747116.07 |
| Montana   | 15390801.88 |
| Carretera | 13815307.89 |
+-----------+-------------+

-- Alternative approach: Wraps the previous query as a subquery
-- Achieves the same result but demonstrates subquery usage
select *
from (select product, round(sum(sales), 2) as total_sales
      from tbl_sales
      group by product
      having total_sales > 100000
      order by total_sales desc) pts;


-- 12 Countries where average discount is greater than 500.
-- Groups by country and calculates average discount for each country
-- having avg_discount > 500 — Filters countries with average discount above 500
-- Identifies countries where discounts are highest
select country, avg(discounts) as avg_discount
from tbl_sales
group by country
having avg_discount > 500;

+---------+--------------------+
| country | avg_discount       |
+---------+--------------------+
| Canada  |          14603.633 |
| Germany | 10115.190571428571 |
| France  | 12339.301642857139 |
| Mexico  | 12697.020642857144 |
| USA     |         15996.6275 |
+---------+--------------------+


-- Alternative approach: Uses the aggregate function directly in HAVING clause
-- Both approaches produce the same result
select country, avg(discounts) as avg_discount
from tbl_sales
group by country
having avg(discounts) > 500;


-- 13 Find the most profitable product in each country.
-- Subquery: Groups by country and product, calculates total profit for each combination
-- row_number() over (partition by country order by sum(profit) desc) — Assigns rank 1 to the top product per country
-- partition by country — Creates separate ranking for each country
-- Outer query: Filters where rn = 1 to get only the top product per country
select country, product, max_profit
from (select country,
             product,
             round(sum(profit), 2) as max_profit,
             row_number() over (partition by country order by sum(profit) desc) as rn
      from tbl_sales
      group by country, product) ranked
where rn = 1
order by country;

+---------+---------+------------+
| country | product | max_profit |
+---------+---------+------------+
| Canada  | Paseo   | 1265017.99 |
| France  | Paseo   |  838748.56 |
| Germany | Velo    |     788789 |
| Mexico  | Paseo   |  928651.39 |
| USA     | Paseo   | 1020603.28 |
+---------+---------+------------+


-- 14 Top 3 segments by total profit.
-- Groups by segment and sums total profit for each segment
-- order by total_profit desc — Sorts segments from highest to lowest profit
-- limit 3 — Returns only the top 3 most profitable segments
select segment, round(sum(profit), 2) as total_profit
from tbl_sales
group by segment
order by total_profit desc
limit 3;

+------------------+--------------+
| segment          | total_profit |
+------------------+--------------+
| Government       |  11388173.18 |
| Small Business   |    4143168.5 |
| Channel Partners |   1316803.14 |
+------------------+--------------+


-- 15 Products where average sales price > 120.
-- Groups by product and calculates average sale_price for each product
-- having avg(sale_price) > 120 — Filters products with average price above 120
-- Identifies premium-priced products
-- order by avg_sale_price desc — Sorts from highest to lowest average price
select product, round(avg(sale_price), 2) as avg_sale_price
from tbl_sales
group by product
having avg(sale_price) > 120
order by avg_sale_price desc;

+----------+----------------+
| product  | avg_sale_price |
+----------+----------------+
| VTT      |         138.59 |
| Amarilla |         128.68 |
+----------+----------------+


-- 16 Find the best-selling product in each year.
-- Subquery: Groups by year and product, sums units_sold for each combination
-- row_number() over (partition by year order by sum(units_sold) desc) — Ranks products within each year
-- partition by year — Creates separate ranking for each year
-- Outer query: Filters where rn = 1 to get the top-selling product per year
select year, product, total_units_sold
from (select year,
             product,
             sum(units_sold)                                                     as total_units_sold,
             row_number() over (partition by year order by sum(units_sold) desc) as rn
      from tbl_sales
      group by year, product) ranked
where rn = 1
order by year;

+------+---------+------------------+
| year | product | total_units_sold |
+------+---------+------------------+
| 2023 | Paseo   |            82247 |
| 2024 | Paseo   |         255992.5 |
+------+---------+------------------+


-- 17 Country with highest profit margin (Profit/Sales).
-- Calculates profit margin as (total profit / total sales) * 100 for each country
-- having sum(sales) > 0 — Ensures we don't divide by zero
-- order by profit_margin desc — Sorts from highest to lowest margin
-- limit 1 — Returns only the country with the highest profit margin
select country, round(sum(profit) / sum(sales) * 100, 2) as profit_margin
from tbl_sales
group by country
having sum(sales) > 0
order by profit_margin desc
limit 1;

+---------+---------------+
| country | profit_margin |
+---------+---------------+
| Germany |         15.66 |
+---------+---------------+


-- 18 Monthly sales trend for 2024.
-- Filters data for year 2024 only
-- Groups by Month_Number and calculates total sales for each month
-- max(Month_Name) — Gets the month name (using MAX since it's the same for each Month_Number)
-- order by Month_Number — Sorts chronologically from January (1) to December (12)
select Month_Number, max(Month_Name) as Month_Name, round(sum(sales), 2) as total_sales
from tbl_sales
where year = 2024
group by Month_Number
order by Month_Number;

+--------------+------------+-------------+
| Month_Number | Month_Name | total_sales |
+--------------+------------+-------------+
|            1 | January    |  6607761.69 |
|            2 | February   |  7297531.39 |
|            3 | March      |  5586859.87 |
|            4 | April      |  6964775.08 |
|            5 | May        |  6210211.06 |
|            6 | June       |  9518893.82 |
|            7 | July       |  8102920.19 |
|            8 | August     |  5864622.42 |
|            9 | September  |  6398697.24 |
|           10 | October    | 12375819.92 |
|           11 | November   |   5384214.2 |
|           12 | December   |  11998787.9 |
+--------------+------------+-------------+


-- 19 Top 5 most profitable transactions per country.
-- Subquery: Uses row_number() to rank transactions within each country by profit (highest first)
-- partition by country — Creates separate ranking for each country
-- Outer query: Filters where rn <= 5 to get the top 5 transactions per country
-- order by country, transaction_profit desc — Sorts by country, then by profit within each country
select country, profit as transaction_profit
from (select country,
             profit,
             row_number() over (partition by country order by profit desc) as rn
      from tbl_sales) ranked
where rn <= 5
order by country, transaction_profit desc;

+---------+--------------------+
| country | transaction_profit |
+---------+--------------------+
| Canada  | 9614.8             |
| Canada  | 959.2              |
| Canada  | 9242.6             |
| Canada  | 9242.6             |
| Canada  | 91327.5            |
| France  | 99814.5            |
| France  | 9948.4             |
| France  | 97461              |
| France  | 973.76             |
| France  | 9503.8             |
| Germany | 97875              |
| Germany | 9416               |
| Germany | 9416               |
| Germany | 9374.4             |
| Germany | 90540              |
| Mexico  | 9882.4             |
| Mexico  | 9592.2             |
| Mexico  | 9495.84            |
| Mexico  | 9495.84            |
| Mexico  | 9433.2             |
| USA     | 9834               |
| USA     | 976.32             |
| USA     | 9715.2             |
| USA     | 940.5              |
| USA     | 940.5              |
+---------+--------------------+


-- 20 Segment with highest average profit per unit sold.
-- Calculates profit per unit by dividing profit by units_sold
-- nullif(units_sold, 0) — Prevents division by zero errors
-- where units_sold > 0 — Filters out transactions with no units sold
-- Groups by segment and calculates average profit per unit for each segment
-- limit 1 — Returns only the segment with the highest average profit per unit
select segment, round(avg(profit / nullif(units_sold, 0)), 2) as avg_profit_per_unit
from tbl_sales
where units_sold > 0
group by segment
order by avg_profit_per_unit desc
limit 1;

+----------------+---------------------+
| segment        | avg_profit_per_unit |
+----------------+---------------------+
| Small Business |               27.38 |
+----------------+---------------------+


-- 21 Countries where total sales exceed 200,000 and average discount is less than 1000.
-- Groups by country and calculates total sales and average discount for each country
-- having sum(sales) > 200000 and avg(discounts) < 1000 — Filters countries meeting both conditions
-- Identifies high-revenue countries with low discount strategies
select country,
       round(sum(sales), 2)     as total_sales,
       round(avg(discounts), 2) as avg_discount
from tbl_sales
group by country
having sum(sales) > 200000
   and avg(discounts) < 1000;


-- 22 Yearly profit growth (compare profits across years).
-- Groups by year and calculates total profit for each year
-- lag(sum(profit)) over (order by year) — Gets the previous year's profit
-- profit_growth — Calculates absolute difference from previous year
-- growth_percentage — Calculates percentage change from previous year
-- nullif prevents division by zero for the first year
select year,
       round(sum(profit), 2) as total_profit,
       round(sum(profit) - lag(sum(profit)) over (order by year), 2) as profit_growth,
       round((sum(profit) - lag(sum(profit)) over (order by year)) / nullif(lag(sum(profit)) over (order by year), 0) * 100, 2) as growth_percentage
from tbl_sales
group by year
order by year;

+------+--------------+---------------+-------------------+
| year | total_profit | profit_growth | growth_percentage |
+------+--------------+---------------+-------------------+
| 2023 |   3878464.51 |          NULL |              NULL |
| 2024 |  13015237.78 |    9136773.27 |            235.58 |
+------+--------------+---------------+-------------------+
2 rows in set (0.00 sec)


-- 23 Top product per segment by profit.
-- Subquery: Groups by segment and product, calculates total profit for each combination
-- row_number() over (partition by segment order by sum(profit) desc) — Ranks products within each segment
-- partition by segment — Creates separate ranking for each segment
-- Outer query: Filters where rn = 1 to get the most profitable product per segment
select segment, product, total_profit
from (select segment,
             product,
             round(sum(profit), 2) as total_profit,
             row_number() over (partition by segment order by sum(profit) desc) as rn
      from tbl_sales
      group by segment, product) ranked
where rn = 1
order by segment;

+------------------+---------+--------------+
| segment          | product | total_profit |
+------------------+---------+--------------+
| Channel Partners | Paseo   |     331838.4 |
| Enterprise       | Montana |    -31096.25 |
| Government       | Paseo   |   3057290.71 |
| Midmarket        | Paseo   |    258739.35 |
| Small Business   | Paseo   |    1231309.5 |
+------------------+---------+--------------+


-- 24 Find months where discounts exceeded 10% of gross sales.
-- First query: Returns distinct months/years where discount > 10% of gross_sales
-- where discounts > (0.1 * gross_sales) — Filters transactions with high discount ratio
-- distinct — Eliminates duplicate month-year combinations


-- Alternative approach: Counts how many transactions had high discounts per month
-- Provides more detail by showing transaction count for each month
select Month_Number, Month_Name, year, count(*) as transactions_with_high_discount
from tbl_sales
where discounts > (0.1 * gross_sales)
group by Month_Number, Month_Name, year
order by year, Month_Number;


-- 25 Most profitable product-country pair overall.
-- First query: Orders all transactions by profit (highest first)
-- limit 1 — Returns the single most profitable transaction
-- Shows the highest profit in a single transaction
select country, product, round(profit, 2) as max_profit
from tbl_sales
order by profit desc
limit 1;

+---------+---------+------------+
| country | product | max_profit |
+---------+---------+------------+
| France  | Paseo   |    99814.5 |
+---------+---------+------------+

-- Alternative approach: Groups by country and product, sums total profit
-- Finds the product-country pair with highest cumulative profit across all transactions
-- More meaningful for identifying best overall product-country combination
select country, product, round(sum(profit), 2) as total_profit
from tbl_sales
group by country, product
order by total_profit desc
limit 1;

+---------+---------+--------------+
| country | product | total_profit |
+---------+---------+--------------+
| Canada  | Paseo   |   1265017.99 |
+---------+---------+--------------+