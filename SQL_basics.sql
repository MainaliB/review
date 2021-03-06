
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



# we are selecting every columns from the employees table whose emp_no is less thhan 16000 and last name starts with b or c
select * 
from employees
where emp_no < 16000 and (last_name like 'b%' or last_name like 'c%');

# lets find all the current or previous employees with first names Irena, Vidya, or Maya
select *
from employees
where first_name in ('Irena', 'Vidya', 'Maya');
# NUMBER OF ROWS RETURNED = 709

# we can try using or to see if we can get the same results for the above scenario
select *
from employees
where first_name = 'Irena' or first_name = 'Vidya' or first_name = 'Maya';
# NUMBER OF ROWS RETURNED = 709

# lets use the same scenario but lets filter to only get males
select *
from employees
where (first_name = 'Irena' or first_name = 'Vidya' or first_name = 'Maya') and gender = 'M';

# lets get all the employees whose last name starts with E
select *
from employees
where last_name like 'E%';


# lets get all the employees whose last name starts with E and ends with E
select *
from employees
where last_name like 'E%' and last_name like '%E';


# lets get all the employees whose last name ends with E but does not start with E
select *
from employees
where last_name like '%E' and last_name not like 'E%';

# find all the current or previous employees who were hired in the 90s
select *
from employees
where hire_date like '199%-%%-%%';

# find all the current or previous employees who were born in christmas day
select *
from employees
where birth_date like '%%%%-12-25';

# find all the current or previous employees who were born in christmas day and were hired in 90s
select *
from employees
where birth_date like '%%%%-12-25' and hire_date like '199%-%%-%%';

#find all the current or previous employees with q in their last name
select *
from employees
where last_name like '%q%';

# find all the current or previous employees with q in their last name but not qu
select *
from employees
where last_name like '%q%' and last_name not like '%qu%';

# USING ORDER BY
select first_name, last_name
from employees
order by last_name ASC;

# you can also chain order by clause
select first_name, last_name
from employees
order by last_name ASC, first_name DESC;

# lets find all the current or previous employees with first names Irena, Vidya, or Maya and get the results ordered by first name
select first_name, last_name
from employees
where first_name in ('Irena', 'Vidya', 'Maya')
order by first_name;

# lets do the same thing as above but order by first_name and then last_name
select first_name, last_name
from employees
where first_name in ('Irena', 'Vidya', 'Maya')
order by first_name, last_name;

# lets do the same thing as above but order by last_name and then first_name
select first_name, last_name
from employees
where first_name in ('Irena', 'Vidya', 'Maya')
order by last_name, first_name;

# lets find all the employees born in 90s and on christmas and sort the results so that the oldest employee who was hired the last in the first result

select first_name, last_name, birth_date, hire_date
from employees
where birth_date like '%%%%-12-25' and hire_date like '199%-%%-%%'
order by birth_date ASC, hire_date DESC;

# we can use limit to limit the number of results lets use the limit to get only 10 results in the above exercise
select first_name, last_name, birth_date, hire_date
from employees
where birth_date like '%%%%-12-25' and hire_date like '199%-%%-%%'
order by birth_date ASC, hire_date DESC
limit 10;

# concat function
select concat ('Aarya ', 'Banskota');

select concat(first_name,' ', last_name) as full_name 
from employees;

# like and not like
select first_name, last_name
from employees
where first_name like 'B%' and last_name not like 'F%';


#substr
# used to extract part of the string.
# need to supply the starting index and the length of the string that we want to extract
# for example:
select substr('abcdefgh', 2, 5); # here the starting index is 2. Here the index count starts at 1 and we the length we want is 5


# we can convert to upper or lower case by using UPPER() and LOWER() function. For example
select upper('abcde'), lower('ABCDE');


# lets try some example
select concat(first_name, ' ', last_name) as full_name
from employees
where last_name like 'E%E';

# lets convert everything to upper case to the results from above query
select concat(upper(first_name), ' ', upper(last_name)) as FULL_NAME
from employees
where last_name like 'E%E';



# Replace
# we can use replace function to manipulate string by replacing some values within the string.Replace function takes subject where replacement takes place, items to be replaced, and items to be replaced with. Example
select replace('abcdeghh', 'ghh', 'fgh') as replacement_practice;

select replace(123456789, 789, 'abc') as replacement_practice;

select replace('abc123ghi789', '123', 'defjkl') as replacement_practice;

#Date and Time Functions

# NOW() returns current time in YYYY-MM-DD HH:MM:SS format. Example
select now() as time_now;

# CURDATE() returns just the current date with no time information in YYYY-MM-DD format. Example
select curdate() as date_today;

#CURTIME() returns the time formatted as HH:MM:SS.Example
select curtime() as time_now;



# The UNIX_TIMESTAMP() function is used to represent time as an integer. It will return the number of seconds since midnight January 1st, 1970. If you pass a date time value to UNIX_TIMESTAMP(), it will give you the number of seconds from the unix epoch to that date.

select unix_timestamp(curdate()) as seconds_since_1stJan1970; # we can simply use unix_timestamp(), it will show the secods since jan 1970 till current date

#another example
select unix_timestamp() - unix_timestamp('1989-05-01');

#another example
select unix_timestamp('2020-05-05') - unix_timestamp('2013-02-26') as seconds_in_the_Army;


# Some of the Numerical Functions in SQL
select min(emp_no) as minimum_val_for_emp_no
from employees;

