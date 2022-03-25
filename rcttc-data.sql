use tiny_theaters;
-- Theater insert --
insert into theater (theater_name,theater_address,theater_phone,theater_email)
select distinct theater,theater_address,theater_phone,theater_email
from rcttc_data;
select *
from theater;
-- Customer insert --
insert into customer (customer_first, customer_last, customer_email,customer_phone,customer_address)
select distinct customer_first, customer_last, customer_email,customer_phone,customer_address
from rcttc_data;
select * from customer;
-- Play insert --
insert into play (play_name,play_date,theater_name)
select distinct`show`,`date`,theater
from rcttc_data;
select * from play;
-- Ticket insert --
-- P -> Play,C -> Customer R -> rcttc_data (file)
insert into ticket (play_date,play_name,seat,ticket_price,customer_email)
select distinct p.play_date, p.play_name, r.seat, r.ticket_price, c.customer_email
from rcttc_data r
inner join play p on r.`show` = p.play_name
and p.play_date = r.`date`
inner join customer c on r.customer_email = c.customer_email;



-- updates -- 
select * from ticket where play_name = 'The Sky Lit Up' and play_date = '2021-03-01';
set SQL_SAFE_UPDATES = 0; -- I assume the SQL error provided is a part of ACID guarantee to prevent someone from just deleting everything, stackoverflow helped.
update ticket 
set ticket_price = '22.25'
where play_name = 'The Sky Lit Up' and play_date = '2021-03-01';
-- Move seat over. Should be only id 96 needs to move up to B5 as this theater goes to B5 and its empty for this plat and date.
-- Move everyone from ID 91 to 96 down one seat respectively starting at A4-> B1 ...(B4 and B5 up to C1 and C2 and last three shifted to C3...5)
select * from ticket where play_name = 'The Sky Lit Up' and play_date = '2021-03-01';
-- Bedburrow
update ticket 
set seat = 'B1'
where ticket_id = 91 and customer_email = 'pbedburrowcc@stanford.edu';
update ticket 
set seat = 'B2'
where ticket_id = 92 and customer_email = 'pbedburrowcc@stanford.edu';
update ticket 
set seat = 'B3'
where ticket_id = 93 and customer_email = 'pbedburrowcc@stanford.edu';
update ticket
set seat = 'B4'
where ticket_id = 94 and customer_email = 'pbedburrowcc@stanford.edu';
update ticket
-- Cullen
set seat = 'C1'
where ticket_id = 95 and customer_email = 'cguirau11@mozilla.com';
update ticket
set seat = 'C2'
where ticket_id = 96 and customer_email = 'cguirau11@mozilla.com';
update ticket
set seat = 'C5'
where ticket_id = 97 and customer_email = 'cvailhe@ft.com'; -- not optimal but it keeps the two after him together

-- Update Jammie Swindles's phone number from "801-514-8648" to "1-801-EAT-CAKE
update customer
set customer_phone = '1-801-EAT-CAKE'
where customer_first = 'Jammie' and customer_last = 'Swindles';

-- Deleting  all single-ticket reservations at the 10 Pin.
Delete  from ticket where ticket_id = 20 and 21 and 24 and 36 and 43 and 44 and 54 and 62 and 63;

-- Delete customer  liv egle ( and her tickets)
Delete from customer where customer_email = 'legleofgermanybh@blinklist.com';
Delete from ticket where customer_email = 'legleofgermanybh@blinklist.com';
