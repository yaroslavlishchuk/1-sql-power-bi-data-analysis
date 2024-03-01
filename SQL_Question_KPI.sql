-- 1. Total Revenue
select sum(total_price) total_revenue
from pizza_sales;

-- 2. Average Order Value
select sum(total_price)/count(distinct order_id) avg_order_value
from pizza_sales; 

-- 3. Total Pizzas Sold
select sum(quantity) total_pizza_sold
from pizza_sales;

-- 4. Total Orders
select count(distinct order_id) total_orders
from pizza_sales;

-- 5 Average Pizzas Per Order
select cast(sum(quantity)/count(distinct order_id) as decimal(10,2)) avg_pizza_per_order
from pizza_sales;