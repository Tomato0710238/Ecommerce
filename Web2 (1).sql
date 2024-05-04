USE [master]
GO

IF EXISTS (SELECT * FROM sys.databases WHERE name = 'Web2')
	DROP DATABASE Web2
GO


create database Web2
GO
use Web2
create table tblUser(
	id int IDENTITY(1,1) NOT NULL primary key,
	name nvarchar(255) not null,
	address nvarchar(255) not null,
	email nvarchar(255) not null,
	phone nvarchar(255) not null,
	username nvarchar(255) not null,
	password nvarchar(255) not null,
	role int default 1 not null
)

create table shipping(
	id int IDENTITY(1,1) NOT NULL primary key,
	name nvarchar(250) null,
	price int
)

create table shop_order(
	id int IDENTITY(1,1) NOT NULL primary key,
	date_order date,
	total_price int,
	status_order nvarchar(255) not null,
	address_shiping nvarchar(255) not null,
	shipping_id int foreign key (shipping_id) references shipping(id),
	user_id int foreign key (user_id) references tblUser(id)
)

create table shopping_cart(
	id int IDENTITY(1,1) NOT NULL primary key,
	shop_order_id int foreign key (shop_order_id) references shop_order(id),
	user_id int foreign key (user_id) references tblUser(id)
)

create table payment(
	id int IDENTITY(1,1) NOT NULL primary key,
	date_payment date,
	method_payment nvarchar(255),
	shopping_cart_id int foreign key (shopping_cart_id) references shopping_cart(id),
	user_id int foreign key (user_id) references tblUser(id)
)

create table product_category(
	id int IDENTITY(1,1) NOT NULL primary key,
	category_name nvarchar(250) not null
)

create table product(
	id int IDENTITY(1,1) NOT NULL primary key,
	description nvarchar(250) not null,
	image varchar(255),
	name nvarchar(255) not null,
	price int not null,
	quantity int not null,
	product_category_id int foreign key (product_category_id) references product_category(id)
)

create table shopping_cart_item(
	id int IDENTITY(1,1) NOT NULL primary key,
	quantity int not null,
	product_id int foreign key (product_id) references product(id),
	shopping_cart_id int foreign key (shopping_cart_id) references shopping_cart(id)
)

