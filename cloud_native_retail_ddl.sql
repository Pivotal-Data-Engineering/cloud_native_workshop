drop database retail; 
create database retail; 

create user 'demo' with password 'pivotal';

drop schema if exists cloud_native; 

create schema cloud_native; 

grant usage on schema cloud_native to demo; 


set search_path to 'cloud_native';


drop table if exists retail_purchase_master; 

create table retail_purchase_master 
(purchase_id  serial, 
customer_id integer, 
payment_id integer, 
visit_id integer,
store_id integer,
time_of_purchase timestamp,
amount numeric(10,2),
reserved_col1 text, 
reserved_col2 text
)
distributed by (purchase_id); 


drop table if exists customer; 
create table customer 
(customer_id  serial, 
customer_fname text, 
customer_lname text , 
customer_group char(1) ,
customer_phone char(10)
)
distributed by (customer_id); 


drop table if exists store; 

create table store 
(store_id  serial, 
store_name text  , 
store_lat float, 
store_long float
)
distributed by (store_id); 


drop table if exists purchase_visit_timeline; 
create table purchase_visit_timeline 
(visit_id  serial, 
customer_id integer, 
event_time timestamp , 
beacon_id char(5)
)
distributed randomly; 


drop table if exists products_in_purchase; 

create table products_in_purchase 
(purchase_id  integer, 
product_id integer, 
payment_id integer, 
quantity integer,
total_cost numeric(10,2)
)
distributed by (purchase_id,product_id); 


drop table if exists promotions; 

create table promotions 
(promotions_id  integer, 
product_id integer, 
date_from date, 
date_to date,
is_current char(1),
promotion_name text ,
promotion_price numeric(10,2)
)
distributed by (promotions_id,product_id); 

drop table if exists product; 
create table product
(
product_id integer, 
product_name text, 
unit_cost numeric(10,2),
beacon_id char(5)
)
distributed by (product_id); 



drop table if exists payment; 
create table payment 
(
payment_id serial,
payment_mode char(5)
)
distributed by (payment_id);


