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
