---MIGRATE table nortwind.category to hr-db

--menampilkan database dan tabel 
select* from sales.categories
select*from Northwind.dbo.Categories

--langkah1 (Cara 1)
set identity_insert sales.categories on;
insert into  sales.categories(cate_id,cate_name,cate_description)
select CategoryID,CategoryName,Description from Northwind.dbo.Categories 
set identity_insert sales.categories off;

--- Menmpilkan hasil
select* from sales.categories
-- Menghapus tabel
delete from sales.categories


/*
CARA RESET AGAR NOMOR BERURUTAN
1. Hapus terlebih dahulu data dari tabelnya
2. Reset menggunakan 
---reset identity
DBCC CHECKIDENT ('sales.categories',RESEED,0);
GO
3. sekarang dapat menggunakan cara 2

----reset identity
*/

--langkah2 (Cara 2)
insert into  sales.categories(cate_name,cate_description)
select CategoryName,Description from Northwind.dbo.Categories 

select* from sales.categories
-- Menghapus tabel
delete from sales.categories

---reset identity
DBCC CHECKIDENT ('sales.categories',RESEED,0);
GO

select* from Northwind.dbo.Orders
---- Menampilkan semua data Northwind.dbo.Orders

select CompanyName,City,CustomerID from Northwind.dbo.Customers
---- Menampilkan hanya data (CompanyName,City,CustomerID) dari Northwind.dbo.Orders

----Materi Lanjutan customers
select* from sales.Customers
select* from Northwind.dbo.Customers
select CompanyName,City,CustomerID from Northwind.dbo.Customers

insert into sales.CUSTOMERS(cust_name,cust_city,cust_code)
select CompanyName,City,CustomerID from Northwind.dbo.Customers 

--- jangan lupa menambahkan koma
--- jangan lupa menambahkan koma
--- jangan lupa menambahkan koma
--- jangan lupa menambahkan koma
--- jangan lupa menambahkan koma

set identity_insert sales.Customers on;
insert into  sales.Customers(cust_id,cust_name,cust_city,cust_code)
select CustomersID,CategoryName,Description from Northwind.dbo.Categories 
set identity_insert sales.categories off;


--alter table.sales.Customers (Menambahkan table)
alter table sales.customers add cust_code nchar(5)



----migrasi data  from nortwind.dbo.customer into sales.customer

insert into sales.customers(cust_name,cust_city,cust_code)
select CompanyName,city,CustomerID from Northwind.dbo.Customers


/*----Using Merge Into
(Target and Source)
*/

select *from  sales.customers
delete from  sales.customers

---reset seed
DBCC CHECKIDENT ('sales.customers',RESEED,0);
GO

merge into sales.customers as tg
using (select CompanyName,city,CustomerID from Northwind.dbo.Customers) src
on tg.cust_code=src.customerid
when matched then
	update set cust_name = src.companyName
	when not matched then
	insert (cust_name,cust_city,cust_code)
	values (src.companyname,src.city,src.customerid);

---MIGRATE table nortwind.category to hr-db

--menampilkan database dan tabel 
select* from sales.CUSTOMERS
select*from Northwind.dbo.Customers

select* from sales.customers 

---- DI OEDER  ADD 2 KOLOM UNTUK MENYIMPAN LINK X_CUTOMERRCODE ID X_EMPLOYEEID

