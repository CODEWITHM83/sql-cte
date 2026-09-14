use student;
select * from orders;
-----Standalone CTE----------------------------------

--finde  the Total Sales per Customer
with cte_Total_sales as(
		select 
		  customer_id,
		  sum(amount)as Totalsales
		from orders
		group by customer_id
)
---main Query
select  c.Customer_id,
        cts.Totalsales
		from orders c
	    left join
		cte_Total_sales cts
		on c.customer_id=cts.customer_id;

----Multiple Standalone CTE----------------------------------
--Step1: finde  the Total Sales per Customer
with cte_Total_sales as(
		select 
		  customer_id,
		  sum(amount)as Totalsales
		from orders
		group by customer_id
),
---Step2: Finde the last order Date for each Customer
CTE_last_order as(
		select
		   customer_id,
		   max(order_date)as last_date
		from orders 
		group by customer_id
)
---main Query
select 
        c.Customer_id,
        cts.Totalsales,
		clo.last_date
from orders c
left join
		cte_Total_sales cts
on c.customer_id=cts.customer_id
left join
CTE_last_order clo on
clo.customer_id=c.customer_id;