

--Name :- Kunal Desai
--Write SQL queries for below given questions


--1. Total sales $ via Invoice
select sum(total)
from Invoice

--2. Total sales $ via Invoiceline
select sum(unitprice*quantity) from InvoiceLine

--3. Total tracks (songs) sold
select count(distinct trackid) from InvoiceLine

--4.Total sales $ by customer’s country – ranked (sorted largest to 
smallest)
select c.country Country,sum(total) [Total Sales]
from invoice i
inner join customer c on i.CustomerId=c.CustomerId
group by c.Country
order by 2 desc

--5. Total sales $ by customer’s geo (country, state & city)
select c.country Country, c.state State, c.city City, sum(total) [Total Sales]
from invoice i
inner join customer c on i.CustomerId=c.CustomerId
group by c.Country, c.state, c.city
order by 2 desc

--6. Total sales $ by customer (a person with last name & first 
name) – ranked (sorted largest to smallest)
select c.FirstName+' ' +c.LastName, sum(total) [Total Sales]
from invoice i
inner join customer c on i.CustomerId=c.CustomerId
group by c.FirstName+' ' +c.LastName
order by 2 desc

--7. Total sales $ by company – ranked (sorted largest to smallest)
select c.company, sum(total) [Total Sales]
from invoice i
right join customer c on i.CustomerId=c.CustomerId
group by c.company
order by 2 desc

--8. Total sales $ by artist – ranked (sorted largest to smallest)
select art.[Name],sum(total)
from invoice i
inner join InvoiceLine il on i.InvoiceId=il.InvoiceId
inner join track t on t.TrackId=il.TrackId
inner join album a on a.AlbumId=t.AlbumId
inner join Artist art on art.ArtistId=a.ArtistId
group by art.[Name]
order by 2 desc

--9. Total sales $ by album – ranked (sorted largest to smallest)
select a.Title,sum(total)
from invoice i
inner join InvoiceLine il on i.InvoiceId=il.InvoiceId
inner join track t on t.TrackId=il.TrackId
inner join album a on a.AlbumId=t.AlbumId
group by a.Title
order by 2 desc

--10. Total sales $ by salesperson (employee)
select (e.FirstName+' ' +e.lastname) [Employee Name],sum(i.total) [Sales]
from invoice i
inner join customer c on i.CustomerId=c.CustomerId
inner join Employee e on e.EmployeeId=c.SupportRepId
group by (e.FirstName+' ' +e.lastname)
order by 2 desc

--11. Total sales $ by media type
select m.[name],sum(total)
from invoice i
inner join InvoiceLine il on i.InvoiceId=il.InvoiceId
inner join track t on t.TrackId=il.TrackId
inner join MediaType m on m.MediaTypeId=t.MediaTypeId
group by m.[name]
order by 2 desc

--12. Total sales $ by genre
select g.[name],sum(total)
from invoice i
inner join InvoiceLine il on i.InvoiceId=il.InvoiceId
inner join track t on t.TrackId=il.TrackId
inner join Genre g on g.GenreId=t.GenreId
group by g.[name]
order by 2 desc

--13. What are the total sales $ by year
select year(invoicedate) [Year],sum(total) [Sales]
from invoice
group by year(invoicedate)
order by 1

--14. What are the total sales $ by year-month
select year(invoicedate) [Year],format(invoicedate,'MMMM') [Month],sum(total) [Sales]
from invoice
group by year(invoicedate),format(invoicedate,'MMMM')
order by 1

--15. What are the employees’ name, birthday, hiredate, years of working with company (assume as of 2013-12-31), address, city, state, country, title, manager and manager’s title
select 
e.FirstName+' '+e.LastName,
e.BirthDate,
e.HireDate,
datediff(year,e.HireDate,'2013-12-31'),
e.[Address],
e.City,
e.[State],
e.Country,
e.Title,
isnull(m.FirstName+' '+m.LastName, 'NO MANAGER'),
isnull(m.Title, 'NO MANAGER')
from employee e
left join employee m on e.ReportsTo=m.EmployeeId

--16. What are the total sales $ by employee age at the time of the invoice date
select datediff(year,e.BirthDate,i.InvoiceDate) [Employee Age],sum(i.total) [Sales]
from invoice i
inner join customer c on i.CustomerId=c.CustomerId
inner join Employee e on e.EmployeeId=c.SupportRepId
group by datediff(year,e.BirthDate,i.InvoiceDate)
order by 1 desc

--17. What are the total sales $ by employees who are in their 30s, 40s, 50s and 60s (employee age at the time of the invoice date)
select datediff(year,e.BirthDate,i.InvoiceDate) [Employee Age],sum(i.total) [Sales]
from invoice i
inner join customer c on i.CustomerId=c.CustomerId
inner join Employee e on e.EmployeeId=c.SupportRepId
group by datediff(year,e.BirthDate,i.InvoiceDate)
having datediff(year,e.BirthDate,i.InvoiceDate) between 30 and 69
order by 1 desc