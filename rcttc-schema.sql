drop database if exists tiny_theaters;
create database tiny_theaters;
use tiny_theaters;
-- theater
create table theater (
	theater_name varchar(25) primary key,
    theater_address varchar(100) not null,
    theater_phone varchar(25) not null,
    theater_email varchar(50) not null
);

-- customer

create table customer (
	customer_email varchar(50) primary key,
    customer_first varchar(25) not null,
    customer_last varchar(25) not null,
    customer_phone varchar(25),
    customer_address varchar(50)
    );       
-- play relates with customer with foreign key 'customer_email'

create table play (
	play_id int primary key auto_increment,
	play_name varchar(100),
    play_date date not null,
    theater_name varchar(25) not null,
    constraint fk_play_theater_name
		foreign key (theater_name)
		references theater(theater_name)
);
-- ticket
create table ticket (
	ticket_id int primary key auto_increment,
    ticket_price decimal(4,2) not null,
    seat varchar(2) not null,
    play_date date not null,
    play_name varchar(100) not null,
    customer_email varchar(50) not null,
    constraint fk_ticket_customer_email
		foreign key (customer_email)
		references customer(customer_email)
);