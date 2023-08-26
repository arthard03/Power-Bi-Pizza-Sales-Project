select *
from pizza_sales
--KPI DEVELOPMENT
-- total revenue 
select sum(total_price/order_id) as Total_Revenue
from pizza_sales
-- average order value
select (sum(total_price) / COUNT(distinct order_id)) as Average_order_value
from pizza_sales
--Total Pizzas sold
select sum(quantity) as Total_pizza_sold 
from pizza_sales
--Total Orders
select count(distinct order_id) as  Total_orders
from pizza_sales
--Average Pizzas per Order
select  cast(cast(sum(quantity)as decimal(10,2))/ 
cast(count(distinct order_id) as decimal(10,2)) as decimal(10,2)) as Average_Pizza_per_Order
from pizza_sales
--CHART DEVELOPMENT
--Daily Trend for Total Orders
select DATENAME(DW,order_date) as order_date,COUNT(distinct order_id) as Total_Orders
from pizza_sales
group by  DATENAME(DW,	order_date)
--Monthly Trend for Total Orders  
select DATENAME(month, order_date)as Month_Name, count(distinct order_id) as Total_Orders
from pizza_sales
group	 by  DATENAME(month, order_date)