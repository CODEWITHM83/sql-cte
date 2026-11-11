--cte common table expression
git
CTE_last_order as(
		select
		   customer_id,
		   max(order_date)as last_date
		from orders 
		group by customer_id
)