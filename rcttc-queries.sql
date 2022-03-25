/* TODO
-- List customer, show, theater, and seat number in one query.
-- Recreate the spreadsheet data with a single query.
-- Calculate the total revenue per show based on tickets sold.
-- Calculate the total revenue per theater based on tickets sold.
-- Who is the biggest supporter of RCTTC? Who spent the most in 2021?
*/
-- Find all performances in the last quarter of 2021 (Oct. 1, 2021 - Dec. 31 2021).
select * from play where play_date between '2021-10-01' and '2021-12-31';
-- List customers without duplication.
select  distinct * from customer;
-- Find all customers without a .com email address.
select * from customer where customer_email not like '%com';
-- Find the three cheapest shows.
select distinct play_name, ticket_price from ticket order by ticket_price asc limit 3 ;
-- List customers and the show they're attending with no duplication.
select  customer_first, customer_last, ticket.play_name
from customer
inner join ticket on customer.customer_email = ticket.customer_email;
-- List customer, show, theater, and seat number in one query.
select customer, play, theater;  -- TODO

-- Find customers without an address.
select * from customer where customer_address = '';

-- Who is the biggest supporter of RCTTC? Who spent the most in 2021?
select * from ticket  order by ticket_price desc limit 1; -- TODO

