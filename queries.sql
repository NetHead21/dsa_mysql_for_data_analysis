create database finance;

use finance;
show tables;


select *
from tbl_sales;


#1 List all records of sales for Canada.
select *
from tbl_sales
where country = 'Canada';