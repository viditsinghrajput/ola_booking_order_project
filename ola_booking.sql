create database ola;
use ola;

-- retrive all sucess full bookings
create view Successfull_booking as
select * from ola
where Booking_Status = "Success";

select * from Successfull_booking;


-- find the average ride distance for each vehicle type
create view avg_ride_distance as 
select vehicle_type , avg(ride_distance) as avg_distance from ola
group by vehicle_type;

select * from avg_ride_distance;

-- get the total number of canceled rides by customer 
create view canceled_ride_by_customer as 
select count(*) from ola where booking_status= "Canceled by Customer";

select * from  canceled_ride_by_customer;

-- list the top 5 customer who booked the highest no of rides 

create view highest_ride as 
select customer_id , count(booking_id) as total_ride
from ola
group by customer_id 
order by total_ride desc limit 5;

select * from highest_ride;

-- get the number of rides canceled by drivers due to personal and car-related issue

select count(*) from ola
where Canceled_Rides_by_Driver="Personal & Car related issue";


-- find the max and min driver rating for prime sedan booking 
select max(Driver_Ratings) as max_rating,
min(Driver_Ratings) as min_rating 
from ola where Vehicle_Type = "Prime Sedan";

-- retrive all rides where payment was made using upi 

select * from ola where payment_method ="UPI";

-- find the avg customer rating per vechile type 

select  vehicle_type, avg(customer_rating) as avg_customer_rating
from ola 
group by vehicle_type;

-- calculate the total booking value of riders completed successfully 

select sum(booking_value) as total_successful_value
from ola where booking_status = "Success";

-- list all incomplete rides along with the reason 

select booking_id, incomplete_rides_reason from ola where incomplete_rides = "Yes";

