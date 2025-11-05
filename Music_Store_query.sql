/* Question Set - EASY*/

/* Q1. Who is th senior most employee based on job title?*/

SELECT title, first_name, last_name
FROM employee
ORDER BY levels desc
LIMIT 1

/*Q2. Which country has the most invoices?*/

SELECT COUNT(*) AS c, billing_country
FROM invoice 
GROUP BY billing_country
ORDER BY c DESC

/* Q3. What are top 3 values of total invoice?*/

select total 
from invoice 
order by total DESC
limit 3

/* Q4. Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money. 
Write a query that returns one city that has the highest sum of invoice totals. Return both the city name & sum of all invoice totals.*/

select billing_city, SUM(total) AS InvoiceTotal
from invoice
group by billing_city
order by InvoiceTotal DESC
limit 1

/* Q5. Who is the best customer? The customer who has spent the most money will be declared the best customer.
Write a query that returns the person who has spent the most money.*/

select customer.customer_id, customer.first_name, customer.last_name, SUM(invoice.total) AS total
from customer
join invoice on customer.customer_id = invoice.customer_id
group by customer.customer_id
order by total desc
limit 1

