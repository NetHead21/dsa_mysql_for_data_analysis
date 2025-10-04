create database finance;

use finance;
show tables;


select *
from tbl_sales;


#1 List all records of sales for Canada.
select *
from tbl_sales
where country = 'Canada';

#2 Retrieve the top 10 highest sales transactions.
select *
from tbl_sales
order by sales desc
limit 10;

#3 Show all unique product names.
select distinct product
from tbl_sales;
