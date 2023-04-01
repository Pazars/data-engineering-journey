CREATE DATABASE IF NOT EXISTS Sales;

USE Sales;
-- if not using USE, then need to select using database_object.sql_object
-- e.g customers.Sales 

CREATE TABLE Sales (
    purchase_number INT NOT NULL AUTO_INCREMENT,
    date_of_purchase DATE NOT NULL,
    customer_id INT,
    item_code VARCHAR(10) NOT NULL,
    PRIMARY KEY (purchase_number)
);

alter table sales
add foreign key (customer_id) references customers(customer_id) on delete cascade;

-- Can check name in table info DDL section
-- Remove accidentally added duplicate foreign key 
alter table sales
drop foreign key sales_ibfk_2;


-- child table = referencing table
-- parent table = referenced table
-- in this case sales is the child and customers is the parent

CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email_address VARCHAR(255),
    number_of_complaints INT,
    PRIMARY KEY (customer_id)
);

alter table customers
change column number_of_complaints number_of_complaints int default 0;

alter table customers
add column gender enum('m', 'f') after last_name;

alter table customers
add unique key (email_address);

-- Remove a unique key
alter table customers
drop index email_address;

insert into customers (first_name, last_name, gender,
email_address, number_of_complaints)

values ('John', 'Mackinley', 'm',
'john.mckinley@365careers.com', 0)
;

insert into customers (first_name, last_name, gender)
values ('Peter', 'Figaro', 'm');

SELECT 
    *
FROM
    customers;

CREATE TABLE items (
    item_code VARCHAR(255),
    item VARCHAR(255),
    unit_price NUMERIC(10 , 2 ),
    company_id VARCHAR(255)
);

CREATE TABLE companies (
    company_id INT AUTO_INCREMENT,
    company_name VARCHAR(255) NOT NULL,
    headquarters_phone_number VARCHAR(255),
    PRIMARY KEY (company_id),
    UNIQUE KEY (headquarters_phone_number)
);

# remove not null constraint
alter table companies
modify company_name varchar(255) null;

# add not null constraint
alter table companies
change column company_name company_name varchar(255) not null;

drop table companies;

/* 
Coding style and best practices:

- short, meaningful, pronouncable names
- no blank spaces between words
- use code formatters
- add comments

*/