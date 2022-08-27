----Membuat skema sales----

drop table Sales.SNIPPERS;

----Fik Koding
DROP table sales.SHIPPERS
create table sales.SHIPPERS
(
    ship_id int identity,
    ship_name varchar(40) default null,
    ship_phone varchar(24) default null,
    constraint region_id_pk primary key(ship_id)
)

DROP table sales.CATEGORIES
create table sales.CATEGORIES
(
    cate_id int identity (1,1),
    cate_name varchar(15) default null, 
    cate_description  ntext,
    constraint cate_id_pk primary key (cate_id)
)

DROP table sales.CUSTOMERS
create table sales.CUSTOMERS
(
    cust_id int identity (1,1),
    cust_name nvarchar(40) default null,
    cust_city nvarchar(15) default null,
    constraint cust_id_pk primary key(cust_id),
    cust_location_id int,
    constraint cust_location_id_fk foreign key(cust_location_id)
    references hr.LOCATIONS(location_id)
)


----disamping hr=database contrain pk
DROP table sales.SUPPLIERS
create table sales.SUPPLIERS
(
    supr_id int identity (1,2),
    supr_name nvarchar(40) default null,
    supr_contact_name nvarchar(30) default null,
    supr_city nvarchar(15) default null,
    supr_location_id int,
    constraint supr_id_pk primary key(supr_id),
    constraint supr_location_id_fk foreign key(supr_location_id)references
    hr.LOCATIONS(location_id)
)

----disamping hr=database contrain pk
DROP table sales.PRODUCTS
create table sales.PRODUCTS
(
    prod_id int identity (1,1),
    prod_name nvarchar(40) default null,
    prod_quantity  nvarchar(20) default null,
    prod_price  money default null,
    prod_in_stock smallint default null,
    prod_on_order smallint default null,
    prod_reorder_level smallint default null,
    prod_discontinued  bit,
    prod_cate_id int,
    prod_supr_id int,
    constraint prod_id_pk primary key(prod_id),
    constraint prod_cate_id_fk foreign key(prod_cate_id)references    sales.CATEGORIES(cate_id),
    constraint prod_supr_id_fk foreign key(prod_supr_id)references    sales.SUPPLIERS(supr_id)
)


DROP table sales.ORDERS_DETAIL
create table sales.ORDERS_DETAIL
(
    ordet_order_id int,
    ordet_prod_id int,
    constraint ordet_order_id_fk foreign key(ordet_order_id)references
    sales.ORDERS(order_id),
    constraint ordet_prod_id_fk foreign key(ordet_prod_id)references
    sales.PRODUCTS(prod_id),
    ordet_price money,
    ordet_quality smallint,
    ordet_discount real,
    constraint od_ordet_order_id_ordet_prod_id_pk primary key(ordet_order_id,ordet_prod_id),
)

DROP table sales.ORDERS    
create table sales.ORDERS
(
    order_id int identity,
    constraint order_id_pk primary key(order_id),

    order_date datetime,
    order_required_date datetime,
    order_shipped_date datetime,
    order_freight money,
    order_subtotal money,
    order_total_qty smallint,
    order_ship_city nvarchar(15),
    order_ship_address  nvarchar(60),
    order_status  nvarchar(15),
    order_employee_id  int,
    order_cust_id int, 
    order_ship_id int,

    constraint order_employee_id_fk foreign key(order_employee_id)references
    hr.EMPLOYEES(employee_id),
    constraint order_cust_id_fk foreign key(order_cust_id)references
    sales.CUSTOMERS(cust_id),
    constraint order_ship_id_fk foreign key(order_ship_id)references
    sales.SHIPPERS(ship_id)
)


DROP table sales.ORDERS_DETAIL
select *from INFORMATION_SCHEMA.TABLES
select *from INFORMATION_SCHEMA.TABLE_CONSTRAINTS


