use mavenmovies;

select month(rental_date) as month, count(*) as rental_count
from rental
group by month
order by month;

select hour(rental_date) as hour, count(*) as count_rental_hour
from rental
group by hour
order by count_rental_hour desc;

select * from film;

select film.title, count(*) as rental_count
from rental inner join inventory 
on rental.inventory_id = inventory.inventory_id
inner join film on inventory.film_id = film.film_id
group by film.title
order by rental_count desc limit 10;

select category.name, count(*) as rental_count
from rental inner join inventory
on rental.inventory_id = inventory.inventory_id
inner join film on inventory.film_id = film.film_id
inner join film_category on film.film_id = film_category.film_id
inner join category on film_category.category_id = category.category_id
group by category.name
order by rental_count desc;

select store.store_id, sum(payment.amount) as total_amount
from payment inner join rental
on payment.rental_id = rental.rental_id
inner join inventory on rental.inventory_id = inventory.inventory_id
inner join store on inventory.store_id = store.store_id
group by store.store_id order by total_amount desc limit 1;

select staff.first_name as Name, count(*) as rental_count
from rental inner join staff
on rental.staff_id = staff.staff_id
group by Name
order by rental_count desc;

select * from staff;



