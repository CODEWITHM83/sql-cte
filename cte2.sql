--cte common table expression
git
CTE_last_order as(
		select
		   customer_id,
		   max(order_date)as last_date
		from orders 
		group by customer_id
)
---sql cte for 3--------------
select * from (
    select 
        id,
        name,
        department,
        salary,
        row_number() over (partition by department order by salary desc) as rn
    from employees
) as ranked_employees
where rn = 1;