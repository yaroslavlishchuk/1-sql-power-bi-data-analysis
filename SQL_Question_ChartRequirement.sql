-- 1. Daily Trend for Total Orders:
-- Create a bar chart that displays the daily trend of total orders over a specific time period. This chart will help us identify any patterns or fluctuations in order volumes on a daily basis. 
select dayname(order_date) order_day,
	count(distinct order_id) total_order
from pizza_sales
group by order_day;


-- 2. Monthly Trend for Total Orders:
-- Create a line chart thet illustrates the monthly trend of total orders throughout the year. This chart will allow us to identify peack month or periods of high order activity.
select monthname(order_date) order_month,
	count(distinct order_id) total_order
from pizza_sales
group by order_month
order by total_order desc;



-- 3. Percentage of Sales by Pizza Category:
-- Create a pie chart that shows the distribution of sales across different pizza categories. This chart will provide insights into the popularity of various pizza categories and their contribution to overall sales.

select pizza_category,  
	round(sum(total_price), 2) as total_sales,
	round(sum(total_price)*100/(select sum(total_price) from pizza_sales), 2) as PCT
from pizza_sales
group by pizza_category;

-- 4. Percantage of Sales by Pizza Size:
-- Generate a pie chart that represents the percentage of sales atributed to diffent pizza sizes. This chart will help us understand customer preferences for pizza sizes and their impact on sales.
select pizza_size,  
	round(sum(total_price), 2) as total_sales,
	round(sum(total_price)*100/(select sum(total_price) from pizza_sales), 2) as PCT
from pizza_sales
group by pizza_size;

-- 5. Total Pizzas Sold by Pizza Category:
-- Create a funnel chart that presents the total number of pizzas sold for each pizza category. This chart will allow us to compare the sales perfomance of different pizza categories.
select pizza_category,
	sum(quantity) as total_number
from pizza_sales
group by pizza_category
order by total_number desc;

-- 6. Top 5 Best Sellers by Revenue, Total Quantity and Total Orders:
-- Create a bar chart highlighting the top 5 best-selling pizzas based on Revenue, Total Quanity, Total Orders. This chart will help us identify the most popular pizzas options.

-- Revenue
select pizza_name, sum(total_price) revenue
from pizza_sales
group by pizza_name
order by revenue desc
limit 5;

-- Quantity
select pizza_name, sum(quantity) quantity
from pizza_sales
group by pizza_name
order by quantity desc
limit 5;

-- Ordered
select pizza_name, count(distinct order_id) as ordered
from pizza_sales
group by pizza_name
order by ordered desc
limit 5;

-- 7.  Bottom 5 Best Sellers by Revenue, Total Quantity and Total Orders:
-- Create a bar chart showcasing the bottom 5 worst-selling pizzas based on the Revenue, Total Quantity, Total Orders. This chart will enable us to identify underperforming or less popular pizza options.

-- Revenue
select pizza_name, round(sum(total_price), 2) revenue
from pizza_sales
group by pizza_name
order by revenue 
limit 5;

-- Quantity
select pizza_name, sum(quantity) quantity
from pizza_sales
group by pizza_name
order by quantity 
limit 5;

-- Ordered
select pizza_name, count(distinct order_id) as ordered
from pizza_sales
group by pizza_name
order by ordered 
limit 5;