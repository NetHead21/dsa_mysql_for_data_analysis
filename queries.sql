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


-- 2 Retrieve the top 10 highest sales transactions.
-- Orders all records by the sales column in descending order (highest first)
-- Limits the result to only the top 10 rows
select *
from tbl_sales
order by sales desc
limit 10;


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


-- 7 Average units sold by product.
-- Groups data by product and calculates the average units_sold for each product
-- round(avg(units_sold), 2) — Computes average and rounds to 2 decimal places
-- Useful for understanding typical order sizes per product
select product,
       round(avg(units_sold), 2) as product_avg_unit_sold
from tbl_sales
group by product;


-- 8 Total profit per year.
-- Groups all transactions by year
-- sum(profit) — Adds up all profit values for each year
-- Shows yearly profit performance, rounded to 2 decimal places
select year,
       round(sum(profit), 2) as total_profit
from tbl_sales
group by year;


-- 9 Find top 5 countries with the highest sales.
-- Groups by country and sums total sales for each country
-- order by sum_of_sales desc — Sorts countries from highest to lowest sales
-- limit 5 — Returns only the top 5 countries
select country, round(sum(sales), 2) as sum_of_sales
from tbl_sales
group by country
order by sum_of_sales desc
limit 5;


-- 10 Number of transactions per market segment.
-- Groups data by segment (e.g., Government, Small Business, Enterprise, etc.)
-- count(*) — Counts the number of rows (transactions) in each segment
-- Shows transaction volume by market segment
select segment, count(*) as count_of_transactions
from tbl_sales
group by segment;


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


-- 14 Top 3 segments by total profit.
-- Groups by segment and sums total profit for each segment
-- order by total_profit desc — Sorts segments from highest to lowest profit
-- limit 3 — Returns only the top 3 most profitable segments
select segment, round(sum(profit), 2) as total_profit
from tbl_sales
group by segment
order by total_profit desc
limit 3;


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