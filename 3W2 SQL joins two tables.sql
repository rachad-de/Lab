use sakila;
#1. Which actor has appeared in the most films?
select count(actor.actor_id), actor.actor_id,actor.first_name, actor.last_name
from actor inner join film_actor on actor.actor_id = film_actor.actor_id
group by actor.actor_id order by count(actor.actor_id) desc;

#2. Most active customer (the customer that has rented the most number of films)
select count(rental.customer_id), customer.customer_id, customer.first_name, customer.last_name
from rental inner join customer on rental.customer_id = rental.customer_id
group by rental.customer_id order by count(rental.customer_id) desc;

select count(customer.customer_id), customer.first_name,customer.last_name, rental_id 
from customer join rental on customer.customer_id = rental.customer_id 
group by customer.customer_id order by count(customer.customer_id) desc;

#3. List number of films per category.
select count(film_category.category_id), name from film_category inner join category
on film_category.category_id=category.category_id group by category.name order by count(film_category.category_id) desc;

#4. Display the first and last names, as well as the address, of each staff member.
select staff_id,first_name, last_name, address.address from staff inner join address on staff.address_id= address.address_id order by staff_id desc;

#5. get films titles where the film language is either English or italian, and whose titles starts with letter "M" , sorted by title descending.

#6. Display the total amount rung up by each staff member in August of 2005.

#7. List each film and the number of actors who are listed for that film.
select film_actor.film_id, count(film_actor.actor_id), title from film_actor 
inner join film on film_actor.film_id=film.film_id 
group by film.film_id order by count(film_actor.actor_id) desc;

#8. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
select  sum(payment.amount),first_name, last_name from customer  inner join payment using (customer_id) group by customer.customer_id 
order by customer.last_name asc;

#9. Write sql statement to check if you can find any actor who never particiapted in any film.

#10. get the addresses that has NO customers, and ends with the letter "e"
