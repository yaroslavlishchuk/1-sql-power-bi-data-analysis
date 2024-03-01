create database pizza_db;

use pizza_db;

select * from pizza_sales;

alter table pizza_sales
modify column pizza_name_id varchar(50);

set sql_safe_updates = 0;

update pizza_sales
set order_date = date_format(str_to_date(order_date, '%d-%m-%Y'), '%Y-%m-%d');

set sql_safe_updates = 1;
 
alter table pizza_sales
modify column order_date date;

alter table pizza_sales
modify column order_time time;

alter table pizza_sales
modify column unit_price float;

alter table pizza_sales
modify column total_price float;

alter table pizza_sales
modify column pizza_size varchar(50);

alter table pizza_sales
modify column pizza_category varchar(50);

alter table pizza_sales
modify column pizza_ingredients varchar(200);

alter table pizza_sales
modify column pizza_name varchar(50);