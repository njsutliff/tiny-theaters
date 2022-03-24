use tiny_theaters;
-- Theater insert
select distinct theater, theater_address, theater_phone, theater_email from rcttc_data;

insert into theater (
theater_name,
theater_address,
theater_phone,
theater_email
)
select distinct
theater,
theater_address,
theater_phone,
theater_email
from rcttc_data;

select *
from theater;

-- Customer insert
select distinct customer_first, customer_last, customer_email,customer_phone,customer_address from rcttc_data;

insert into customer (
customer_first, 
customer_last, 
customer_email,
customer_phone,
customer_address
)
select distinct 
customer_first, 
customer_last, 
customer_email,
customer_phone,
customer_address
from rcttc_data;

select * 
from customer;


-- Play insert
select distinct
`show`,
`date`,
theater
from rcttc_data;

insert into play (
play_name,
play_date,
theater_name
)
select distinct
`show`,
`date`,
theater
from rcttc_data;

select *
from play;

-- Ticket insert
/* P -> Play, T -> Ticket, C -> Customer R -> rcttc_data (file)
*/
select distinct p.play_date, p.play_name, t.seat, t.ticket_price, c.customer_email
from rcttc_data r
inner join play p on t.`show` = p.play_name
and p.play_date = t.`date` -- 'show' here references play.play_name and 'date' = play.play_date
inner join customer c on r.customer_email = c.customer_email;

insert into ticket (
play_date,
play_name,
seat,
ticket_price,
customer_email)
select distinct p.play_date, p.play_name, t.seat, t.ticket_price, c.customer_email
from rcttc_data t
inner join play p on t.`show` = p.play_name
and p.play_date = t.`date`
inner join customer c on t.customer_email = c.customer_email;

drop table if exists rcttc_data;
