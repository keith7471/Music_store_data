
 --> 1. which countries have the most invoices
 
 select * from invoice;
 select top 1 * from (
 select * from (
 select billing_country,count(billing_country) as total_count from invoice
 group by billing_country
 
 )s)g
 order by g.total_count desc


 --> 2. find the top 3 total invoices
 select * from invoice
 select top 3 total from invoice
 order by total desc

 --> 3. The music store would like to throw a music festival in the city in which it has gained maximum money from. create a query to mention the 
 --> name and total invoices

select billing_city, cast(sum(total) as int) as total_invoices 
from invoice
group by billing_city
order by total_invoices desc


--> 4. Find the customer name who has spent the most in buying the albums
select * from customer
select * from invoice

select top 1 * from(
select c.customer_id,c.first_name,c.last_name,cast(sum(invoice.total) as int) as total from customer as c
join invoice 
on c.customer_id=invoice.customer_id
group by c.customer_id,c.first_name,c.last_name
)s
order by s.total desc

--> 7. write query to list all the people who listen rock music genre
-- list their name by alphabetical order starting with A

select distinct email,first_name,last_name from customer
join invoice on customer.customer_id=invoice.customer_id
join invoice_line on invoice.invoice_id=invoice_line.invoice_id
where track_id in (
select track_id from track
join genre on track.genre_id=genre.genre_id
where genre.name like 'Rock'
)
order by first_name 


--> 8. write query to list the artist who has written the most rock music
-- write query to show the artist name,  and total track count for top 10 rock band

select top 10 artist.artist_id, artist.name, count(artist.artist_id) as total_songs
from track
join album on album.album_id=track.album_id
join artist on artist.artist_id=album.artist_id
join genre on genre.genre_id=track.genre_id	
where genre.name like 'Rock'
group by artist.artist_id,artist.name
order by total_songs desc
 

--> 9.list all the song names that have song length greater than average song length

select name, milliseconds from track
where milliseconds > (select AVG(milliseconds) from track)
order by milliseconds desc

