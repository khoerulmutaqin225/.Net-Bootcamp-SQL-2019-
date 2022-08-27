----CARA MENGERJAKAN SOAL LATIHAN 2

select * from hr.JOB_HISTORY

select *from INFORMATION_SCHEMA.TABLES
select *from INFORMATION_SCHEMA.TABLE_CONSTRAINTS

select *from INFORMATION_SCHEMA.TABLES

----Materi Lanjutan customers

select* from sales.SHIPPERS
select* from Northwind.dbo.Shippers

---MENAMPILKAN NAMA CITY ID COSTUMER
select CompanyName,City,CustomerID from Northwind.dbo.Customers

set identity_insert sales.SHIPPERS on;
insert into sales.SHIPPERS(ship_id,ship_name,ship_phone)
select ShipperID,CompanyName,Phone from Northwind.dbo.Shippers 
set identity_insert sales.SHIPPERS off;

--- jangan lupa menambahkan koma
--- jangan lupa menambahkan koma
--- jangan lupa menambahkan koma
--- jangan lupa menambahkan koma
--- jangan lupa menambahkan koma

--- JAWABAN NO 1
select* from sales.SHIPPERS
select* from Northwind.dbo.Shippers

set identity_insert sales.SHIPPERS on;
insert into sales.SHIPPERS(ship_id,ship_name,ship_phone)
select ShipperID,CompanyName,Phone from Northwind.dbo.Shippers 
set identity_insert sales.SHIPPERS off;

--- JAWABAN NO 2
select* from sales.SUPPLIERS
select* from Northwind.dbo.SUPPLIERS

set identity_insert sales.SUPPLIERS on;
insert into sales.SUPPLIERS(supr_id,supr_name,supr_contact_name,supr_city)
select SupplierID,CompanyName,ContactName,City from Northwind.dbo.SUPPLIERS 
set identity_insert sales.SUPPLIERS off;

--- JAWABAN NO 3
select* from sales.PRODUCTS
select* from Northwind.dbo.PRODUCTS

set identity_insert sales.PRODUCTS on;
insert into sales.PRODUCTS(prod_id,prod_name,prod_quantity,prod_price,prod_in_stock,prod_on_order,prod_reorder_level,prod_discontinued,prod_cate_id,prod_supr_id)
select ProductID,ProductName,QuantityPerUnit,UnitPrice,UnitsInStock,UnitsOnOrder,ReorderLevel,Discontinued,CategoryID,SupplierID from Northwind.dbo.PRODUCTS 
set identity_insert sales.PRODUCTS off;

--- JAWABAN NO 4
select* from sales.ORDERS_DETAIL
select* from Northwind.dbo.[Order Details]

insert into sales.ORDERS_DETAIL(ordet_order_id,ordet_prod_id,ordet_price,ordet_quality,ordet_discount)
select OrderID,ProductID,UnitPrice,Quantity,Discount from Northwind.dbo.[Order Details]

---JAWABANA NO 5
select* from sales.orders

/*--- Menmbah kolom

alter table sales.orders add x_cust_code nchar(5)
---menghapus kolom
alter table sales.orders drop column x_cust_code 
-----

CustomerID (Order)
EmployeeID (Order)
*/

select* from sales.ORDERS
select* from Northwind.dbo.Orders

set identity_insert sales.ORDERS on;
insert into sales.ORDERS(order_id,order_date,order_required_date,order_shipped_date,order_freight ,order_ship_city,order_ship_address,x_Customerid,x_EmployeeID)
select OrderID,OrderDate,RequiredDate,ShippedDate,Freight,ShipCity,ShipAddress,CustomerID,EmployeeID from Northwind.dbo.Orders
set identity_insert sales.ORDERS off;

