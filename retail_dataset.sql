SELECT * FROM retail_sales
limit 10;


select count(*)
from retail_sales;


--data cleaning
SELECT * FROM retail_sales
where 
transactions_id is null
or
sale_date is null
or
sale_time is null
or 
gender is null
or
age is null
or
category is null
or
quantity is null
or
price_per_unit is null
or
cost is null
or
total_sale is null;


delete from retail_sales
where 
transactions_id is null
or
sale_date is null
or
sale_time is null
or 
gender is null
or
age is null
or
category is null
or
quantity is null
or
price_per_unit is null
or
cost is null
or
total_sale is null;

--data exploration
--how many sales we have ?
select count(*) as total_sale from retail_sales;

--how many customers we have?
select count(distinct customer_id) from retail_sales;

--how much unique category will they have?
select distinct category from retail_sales;

--data analysis & buisiness key problem and answers
--My analysis and findings
--1) wqd to retrieve all column for sales made on 2022-11-05?
select * 
from retail_sales 
where sale_date='2022-11-05';


--2)to retrieve all transactions where the category is 'clothing' and the quantity is sold is more than 10 in the month of nov-2022?
select * 
from retail_sales
where category='clothing' 
and quantity>=4
and to_char(sale_date ,'YYYY-MM')='2022-11';


--3) wqd to find total sale in ecah category?
select sum(total_sale),category,
from retail_sales
group by category;


--4)wqd a sql find the average age of customers who purchased items from the beauty category
select avg(age) from retail_sales
where category='Beauty';

--5)wqd find all transactionswhere the total_sale is greater than 1000

select * from retail_sales
where total_sale>1000;

--6)wqd to find the total number of transactions made by each gender in each category
select count(transactions_id) as transactions,gender,category
from retail_sales
group by gender,category;

--7)wqd calculate avg sal efo rech month ,find out best selling month in each year
--8) wqd find the top 5 cust based on highest sales?
select customer_id ,sum(total_sale)
from retail_sales
group by 1
order by 2 desc;
--9)number of unique customers who purchased items from each category
select count( distinct customer_id), category
from retail_sales
group by 2;


--10)wqd sql query to create each shift and number of orders
select *,
case 
when extract(hour from sale_time)<=12 then 'morning'
when extract(hour from sale_time) between 12 and 17 then 'afternoon'
else 'evening'
end as shift
from retail_sales;

--end of project
