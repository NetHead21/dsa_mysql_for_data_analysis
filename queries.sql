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