drop database if exists tiny_theaters;
create database tiny_theaters;
use tiny_theaters;
-- theater
create table theater (
theater_name  varchar(25) primary key not null,
theater_address varchar(25) not null,
theater_phone int(25) not null,
theater_email varchar(25) not null
);

-- customer

create table customer(
customer_last varchar(50) primary key not null,
customer_first varchar(50)  not null,
customer_email varchar(50) not null,
customer_phone varchar(50) not null,
customer_address varchar(50) not null
);

-- play relates with theater with foreign key 'theater'

create table play(
play_id  int(25) primary key, -- auto inc
play_name varchar(25)  not null,
play_date varchar(25) not null,
theater varchar(25) not null,
constraint fk_play_theater_name
	foreign key (theater_name)
    references theater(theater_name)
);

create table ticket(
ticket_id int(50) primary key, -- auto inc
ticket_price decimal(5) not null,
seat varchar(50) not null,
play_date varchar(25) not null,
customer_last varchar(50) not null,
constraint fk_ticket_customer_last
	foreign key (customer_last)
    references customer(customer_last)
) ;