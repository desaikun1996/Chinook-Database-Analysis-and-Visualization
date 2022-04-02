
--Name :- Kunal Desai
--Write SQL queries for below given questions

--1. Total sales $
select sum(total) [Total Sales] from invoice

--2. Total sales $ by customer’s country – ranked (sorted largest to smallest)
select c.country Country,sum(total) [Total Sales]
from invoice i
inner join customer c on i.CustomerId=c.CustomerId
group by c.country
order by 2 desc

--3. Total sales $ by customer’s geo (country, state & city)
select c.country Country, c.state State, c.city City, sum(total) [Total Sales]
from invoice i
inner join customer c on i.CustomerId=c.CustomerId
group by c.country, c.state, c.city
order by 2 desc

--4. Total sales $ by customer (a person with last name & first name) – ranked (sorted largest to smallest)
select c.FirstName+' ' +c.LastName, sum(total) [Total Sales]
from invoice i
inner join customer c on i.CustomerId=c.CustomerId
group by c.FirstName+' ' +c.LastName
order by 2 desc

--5. Total sales $ by company
select c.company, sum(total) [Total Sales]
from invoice i
right join customer c on i.CustomerId=c.CustomerId
group by c.company
order by 2 desc

--6. Total sales $ by artist – ranked (sorted largest to smallest)
select art.[Name],sum(total)
from invoice i
inner join InvoiceLine il on i.InvoiceId=il.InvoiceId
inner join track t on t.TrackId=il.TrackId
inner join album a on a.AlbumId=t.AlbumId
inner join Artist art on art.ArtistId=a.ArtistId
group by art.[Name]
order by 2 desc

--7. Total sales $ by album
select a.Title,sum(total)
from invoice i 
inner join InvoiceLine il on i.InvoiceId=il.InvoiceId
inner join track t on t.TrackId=il.TrackId 
inner join album a on a.AlbumId=t.AlbumId
group by a.Title
order by 2 desc

--8. Total sales $ by salesperson (employee)
select (e.FirstName+' ' +e.lastname) [Employee Name],sum(i.total) [Total Sales]
from invoice i
inner join customer c on i.CustomerId=c.CustomerId
inner join Employee e on e.EmployeeId=c.SupportRepId
group by (e.FirstName+' ' +e.lastname)
order by 2 desc

--9. Total sales $ by media type
select m.[name],sum(total)
from invoice i 
inner join InvoiceLine il on i.InvoiceId=il.InvoiceId
inner join track t on t.TrackId=il.TrackId 
inner join MediaType m on m.MediaTypeId=t.MediaTypeId
group by m.[name]
order by 2 desc

--10. Total sales $ by genre
select g.[name],sum(total)
from invoice i 
inner join InvoiceLine il on i.InvoiceId=il.InvoiceId
inner join track t on t.TrackId=il.TrackId
inner join Genre g on g.GenreId=t.GenreId
group by g.[name]
order by 2 desc