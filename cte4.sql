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