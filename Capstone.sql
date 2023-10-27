use sakila;
select * from actor
                               -- Task 1 - 	Display the fullnames of all actors available in data
                               
Select concat(first_name," ",last_name) as "Name of actors" from actor;

-- Task 2
-- Task 2.i
select first_name, count(first_name) as "Repeated_times"  from actor
group by first_name order by Repeated_times desc;

-- Task 2.ii 
     
select distinct count( first_name)from actor;

select distinct ( first_name)from actor;
-- Task 3
            -- Task 3.i
SELECT last_name, COUNT(*) as count_of_repeated
FROM sakila.actor
GROUP BY last_name
ORDER BY count_of_repeated DESC;

-- Task 3.ii
select distinct( last_name)from actor;

-- Task 4
-- Task 4.i
select * from film where rating="R";

-- Task 4.ii
select * from film where rating <> "R";

-- Task 4.iii
select * from film where rating in ("PG-13","G");

-- Task 5
-- task 5.i
select * from film where replacement_cost <=11;

-- Task 5.ii
select * from film where replacement_cost between 11 and 20;

-- task 5.iii
select * from film order by replacement_cost desc;

-- Task 6
select a.title ,count(actor_id) as "Number_of_Actors" from film a
join film_actor b
on a.film_id=b.film_id 
group by a.film_id order by Number_of_Actors desc limit 3 ; 

-- Task 7
select * from film where title like "K%" or title like "Q%";

-- Task 8
select c.actor_id,concat(first_name," ",last_name) as "Actor's full name" ,a.title from film a
join film_actor b
join actor c
on a.film_id=b.film_id and b.actor_id=c.actor_id
where a.title like "Agent Truman";

-- Task 9
select * from film_category;

select * from category;

SELECT title,category.name
FROM sakila.film
JOIN sakila.film_category ON film.film_id = film_category.film_id
JOIN sakila.category ON film_category.category_id = category.category_id
WHERE category.name = 'Family';

-- task 10
         -- task 10.i
select rating, max(rental_rate) as "Maximum rental rate",
min(rental_rate)as "Minimum rental rate",
avg(rental_rate) as "Average_rental_rate" 
from film group by rating
order by Average_rental_rate desc;

       -- task 10.ii
select a.title,count(rental_id) as "Rental frequencies" from film a
join inventory b
join rental c
on a.film_id=b.film_id and b.inventory_id=c.inventory_id
group by a.title order by count(rental_id) desc ;

-- Task 11

SELECT count(film.film_id),name AS category_name,avg(replacement_cost) as "average replacemt cost",
avg(rental_rate) as "average rental rate" ,AVG(film.replacement_cost - film.rental_rate) FROM category
JOIN sakila.film_category ON category.category_id = film_category.category_id
JOIN sakila.film ON film_category.film_id = film.film_id
GROUP BY name
HAVING AVG(film.replacement_cost - film.rental_rate) > 15;


-- task 12

select a.name,count(title) as "Number of Movies" from category a
join film_category b
join film c
on a.category_id=b.category_id and b.film_id=c.film_id
group by a.name
having count(title) >70;







