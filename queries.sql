create database finance;

use finance;
show tables;


# Basic query to view all data in the table
select *
from tbl_sales;


#1 List all records of sales for Canada.
# Filters all rows where the country column equals 'Canada'
# Returns all columns for Canadian sales transactions
select *
from tbl_sales
where country = 'Canada';


#2 Retrieve the top 10 highest sales transactions.
# Orders all records by the sales column in descending order (highest first)
# Limits the result to only the top 10 rows
select *
from tbl_sales
order by sales desc
limit 10;


#3 Show all unique product names.
select distinct product
from tbl_sales;


#4 Find sales made in January 2024.
select *
from tbl_sales
where Month_Name = 'January'
  and year = '2024';

select *
from tbl_sales
where Month_Number = 1;


#5 Display all transactions where profit is negative.
select *
from tbl_sales
where profit < 0;