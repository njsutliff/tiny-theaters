
use tiny_theaters;
-- Theater    
insert into theater (
theater_name,
theater_address,
theater_phone,
theater_email)
select distinct 
theater,
theater_address, 
theater_phone,
theater_email
from rcttc_data;
select * from theater;
-- Customer
insert into customer(
customer_email,
customer_first,
customer_last,
customer_email,
customer_phone,
customer_address)
select distinct 
customer_email,
customer_last,
customer_first,
customer_phone,
customer_address
from rcttc_data;
select * from customer;

-- play
insert into play(
play_name,
play_date,
theater
)
select distinct
play,
play_date,
theater
from rcttc_data;
select * from play;
-- ticket
insert into ticket(
ticket_price,
seat,
play_date,
customer_last
)
select distinct
p.play,
p.play_date,
t.seat,
t.ticket_price,
c.customer_email
from rcttc_data r

inner join customer c on t.customer_email = c.customer_email  
  inner join play p on t.play = p.play
and p.play_date = t.play_date