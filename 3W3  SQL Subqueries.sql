use sakila;
#1. List all films whose length is longer than the average of all the films.
select title from film
where length > (select avg(length) from film);

#2.  How many copies of the film Hunchback Impossible exist in the inventory system?
select count (film_id) from inventory where film_id in (select film_id where title like '%Hunchback Impossible%')
group by film_id;

#3. Use subqueries to display all actors who appear in the film Alone Trip.
select film_id, actor_id, first_name, last_name from actor
join film_actor using (actor_id)
where film_id = (select film_id from film_text where title like '%Alone Trip%');

#4. Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as family films.<<<<<
select title, film_id from film join film_category using(film_id)
where film_id in (select film_id from film_category join category using (category_id)
where category_id = (select category_id from category where name like '%family%'));

#5. Get name and email from customers from Canada using subqueries. Do the same with joins. Note that to create a join, you will have to identify the correct tables with their primary keys and foreign keys, that will help you get the relevant informatio
select first_name, last_name, email from customer where address_id in
(select address_id from address where city_id in 
(select city_id from city where country_id like
(select country_id from country where country = 'canada')));
