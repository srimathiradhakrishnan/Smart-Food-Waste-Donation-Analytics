create database smart_food_waste;
use smart_food_waste;

create table restaurants (
    restaurant_id int primary key,
    restaurant_name varchar(100),
    location varchar(100),
    food_type varchar(20),
    daily_capacity int
);

create table ngos (
    ngo_id int primary key,
    ngo_name varchar(100),
    location varchar(100),
    daily_requirement int,
    food_preference varchar(20)
);

create table food_surplus (
    surplus_id int primary key,
    restaurant_id int,
    date DATE,
    food_item varchar(100),
    food_prepared int,
    food_sold int,
    surplus_quantity int,
    expiry_hours int,

    foreign key (restaurant_id)
    references restaurants(restaurant_id)
);

create table donation_allocations (
    allocation_id int auto_increment primary key,
    date DATE,
    surplus_id int,
    restaurant_id int,
    restaurant_name varchar(100),
    ngo_id int,
    ngo_name varchar(100),
    food_item varchar(100),
    allocated_quantity int,

    foreign key (surplus_id)
    references food_surplus(surplus_id),

    foreign key (restaurant_id)
	references restaurants(restaurant_id),

    foreign key (ngo_id)
    references ngos(ngo_id)
);

show tables;

select count(*)as total_restaurants from restaurants; 
select count(*)as total_ngos from ngos; 
select count(*)as total_records from food_surplus; 
select count(*)as toatl_allocations from donation_allocations;

select sum(surplus_quantity) as total_surplus from food_surplus;
select sum(allocated_quantity)as total_allocated_food from donation_allocations;
select
    (select sum(surplus_quantity)
     from food_surplus) as total_surplus,
    (select sum(allocated_quantity)
     from donation_allocations) as total_allocated,
    (select sum(surplus_quantity)
     from food_surplus) - 
    (select sum(allocated_quantity)
     from donation_allocations) as remaining_surplus; 
     
	select
    r.restaurant_name,
    r.location,
    SUM(f.surplus_quantity) AS total_surplus
from restaurants r
join food_surplus f
on r.restaurant_id = f.restaurant_id
group by r.restaurant_id, r.restaurant_name, r.location
order by total_surplus desc
limit 10;

select
    food_item,
    SUM(surplus_quantity) as total_surplus
from food_surplus
group by food_item
order by total_surplus desc;

select
    r.location,
    SUM(f.surplus_quantity) as total_surplus
from restaurants r
join food_surplus f
on r.restaurant_id = f.restaurant_id
group by r.location
order by total_surplus desc;

select
    n.ngo_name,
    n.location,
    sum(d.allocated_quantity) as total_allocated
from ngos n
join donation_allocations d
on n.ngo_id = d.ngo_id
group by n.ngo_id, n.ngo_name, n.location
order by total_allocated desc;

select
    DATE_FORMAT(date, '%Y-%m') as month,
    SUM(surplus_quantity) as total_surplus
from food_surplus
group by DATE_FORMAT(date, '%Y-%m')
order by month;

select
    ROUND(((select SUM(allocated_quantity)
             from donation_allocations)/
            (select SUM(surplus_quantity)
             from food_surplus)
        ) * 100,
        2
    ) as allocation_percentage;
    
    select
    r.restaurant_name,
    SUM(f.surplus_quantity) as total_surplus,
    coalesce(SUM(a.allocated_quantity), 0) as total_allocated,
    SUM(f.surplus_quantity)
      - coalesce(SUM(a.allocated_quantity), 0)
      as remaining_surplus
from restaurants r
join food_surplus f
on r.restaurant_id = f.restaurant_id
left join (
    select
        surplus_id,
        SUM(allocated_quantity) as allocated_quantity
    from donation_allocations
    group by surplus_id
) a
on f.surplus_id = a.surplus_id
group by r.restaurant_id, r.restaurant_name
order by remaining_surplus desc;

select
    (select count(*)
     from restaurants) as total_restaurants,

    (select count(*)
     from ngos) as total_ngos,

    (select count(*)
     from food_surplus) as total_surplus_records,

    (select sum(surplus_quantity)
     from food_surplus) as total_surplus_food,

    (select sum(allocated_quantity)
     from donation_allocations) as total_allocated_food;