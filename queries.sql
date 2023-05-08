Use sql_store;

select * from customers
where customer_id = 1;

select * from customers order by first_name;

select  first_name,last_name,city,points,points*0.01 as discount  from customers;

select distinct state from customers ;


select * from customers where Not(birth_date<='1990-01-01' or points>1000);

select * from customers where (500<points and points<1000) or points>1500;
select * from customers where (points between 500 and 1000) or points>1500;

select * from customers where state in('MA','VA','FL');
select * from customers where state not in('MA','VA','FL');

select * from customers where points between 500 and 1000;

select * from customers where last_name like '%a%';
select * from customers where last_name regexp '$field';
select * from customers where last_name regexp '^Mac';

select * from customers where phone is Null;
select * from customers where phone is not Null;

-- select * from customers where order by state desc, first_name asc; 
select * from customers limit 5,4;


-- join

select * from orders o
join customers c 
on c.customer_id=o.customer_id;

select order_id , c.customer_id , first_name from orders o
join customers c on c.customer_id=o.customer_id;

select order_id , c.customer_id , first_name,points from orders o
join customers c on c.customer_id=o.customer_id
where points>1000;

-- joining b/w tabes from two diff databases
select * from order_items oi
join sql_inventory.products p
on oi.product_id=p.product_id;

select distinct oi.product_id,name,quantity_in_stock from order_items oi
join sql_inventory.products p
on oi.product_id=p.product_id
where quantity_in_stock>50;

-- self join 
select e.employee_id,e.first_name,m.first_name as manager,m.employee_id from employees e
join employees m
on e.reports_to = m.employee_id;



-- copy of a table
create table new_orders as select * from orders;


INSERT INTO `customers` VALUES (default,'harsh','vishwakarma','1986-03-05','781-532-6754','patal lok','patal','nk',default);
select * from customers;

update customers
set points = 1575
-- and  birth_date ='1990-05-02'
where customer_id =12;

delete from customers where customer_id =11;

-- sub-queries
select * from customers where customer_id in ( select customer_id from customers where points>2000 );

-- union
select order_id,order_date,
'Active' as Status from orders
where order_date>='2019-01-01'
union
select order_id,order_date,
'Archived' as Status from orders
where order_date>='2019-01-01';

-- alter table
alter table customers
add Email varchar(100);

update customers 
set Email = 'xyz@gmail.com'
where customer_id=12;

select * from customers;



