
# show all the databases managed by the dbms
SHOW DATABASES;

# select the databse you want to work on
USE chipotle;


#look at the query used to create the table
SHOW CREATE DATABASE chipotle;

#show the database currently using
SELECT database();

# lets start with basic select statement


#lets select everything that is on the table
select * from orders;

# lets use some where clause to filter data

# we are selecting all the orders where the quantity is 1
select* 
from orders
where quantity = 1;

# we are selecting all the orders where the quantity is greater than 1
select*
from orders
where quantity > 1;


# we are selecting all the orders where the quantity is greater than 1 and sorting it by order id in ascending order and descending order
select * 
from orders
where quantity > 1
Order by order_id DESC;

select * 
from orders
where quantity > 1
Order by order_id ASC;

# lets try using two condition on where to filter out the data
select *
from orders
where quantity > 1 and (item_name = 'Chicken Bowl')
order by item_price ASC;

# lets get the count of all the chicken bowl orders
select sum(quantity) as total_orders
from orders
where (item_name = 'Chicken Bowl');


# LEARNING HOW TABLES ARE CREATED

create table grade(
student_first_name VARCHAR(15) not null,
student_last_name VARCHAR(15) not null,
grades INT(3) not null
);

# lets check all the tables that exist on this database
show tables;



# lets look at the syntax that created the table
show create table grade;

# we can also assign primary key to a table
create table info(
ID INT UNSIGNED NOT NULL AUTO_INCREMENT,
student_first_name VARCHAR(15) not null,
student_last_name VARCHAR(15) not null,
student_gpa DECIMAL(3,2) not null,
primary key (ID)
);


# to get the details about the table including the data types, primary key, column names etc
DESCRIBE info;


# you can print arbitraty data like below:
select 'My name is John Wick' as Info;

#lets look at all of the databases
show databases;

#use the ablbum database
use albums_db;

# lets look at everything that are in the albums table
select name
from albus;

#lets get the name of all of the Pink Floyds album
select name, artist
from albums
where artist = 'Pink Floyd';

# get the year Sgt. Pepper's Lonely Hearts Club Band was released
select release_date
from albums
where name = 'Sgt. Pepper\'s Lonely Hearts Club Band'
;

#Which albums were released in the 1990s
select *
from albums
where release_date between 1990 and 1999;


#Which albums had less than 20 million certified sales
select *
from albums
where sales < 20;

#all albumns with genre of rock
select * 
from albums
where genre = 'Rock';

# lets use different database
show databases;

# use employees dataabse
use employees;

#lets see what these table hold, we will start with employees table
select *
from employees;

# lets try different things
select Distinct first_name # outputs the distinct first name only
from employees;

# we are getting the count of all the unique last names
select count(distinct last_name) as number_of_unique_last_names
from employees;

# we are getting the count of all of the unique first names that start with b
select count(distinct first_name) as number_of_unique_first_name
from employees
where first_name like 'b%%';

# we can supply a list of values and look for them 
select *
from employees
where emp_no in (10001,10002,10005,10019,10024);
