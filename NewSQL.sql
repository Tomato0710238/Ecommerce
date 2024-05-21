	USE [master]
GO

IF EXISTS (SELECT * FROM sys.databases WHERE name = 'Web2')
	DROP DATABASE Web2;
	CREATE DATABASE Web2;
GO
USE Web2;
GO

CREATE TABLE site_user (
	id int PRIMARY KEY IDENTITY(1,1),
	email varchar(100) unique,
	phone varchar(15),
	password varchar(50),
)
CREATE TABLE user_address (
	user_id int,
	address_id int,
	is_default int,
)
CREATE TABLE address (
	id int PRIMARY KEY IDENTITY(1,1),
	unit_number int,
	street_number int,
	address_line1 varchar(100),
	address_line2 varchar(100),
	city varchar(50),
	region varchar(50),
	postal_code int,
	country_id int,
)
CREATE TABLE country (
	id int PRIMARY KEY IDENTITY(1,1),
	name varchar(50),
)
----------------------------------------
CREATE TABLE product (
	id int PRIMARY KEY IDENTITY(1,1),
	category_id int,
	name varchar(50),
	description varchar(200),
	image_url varchar(150),
)
CREATE TABLE product_item (
	id int PRIMARY KEY IDENTITY(1,1),
	product_id int,
	SKU varchar(50),
	qty_in_stock int,
	image_url varchar(150),
	price int,
)
CREATE TABLE product_category (
	id int PRIMARY KEY IDENTITY(1,1),
	parent_category_id int,
	name varchar(50),
)
CREATE TABLE product_configuration (
	product_item_id int,
	variation_option_id int,
)
CREATE TABLE variation (
	id int PRIMARY KEY IDENTITY(1,1),
	category_id int,
	name varchar(50),
)
CREATE TABLE variation_option (
	id int PRIMARY KEY IDENTITY(1,1),
	variation_id int,
	value varchar(50),
)
CREATE TABLE promotion (
	id int PRIMARY KEY IDENTITY(1,1),
	name varchar(50),
	description varchar(200),
	discount_rate float,
	start_date datetime,
	end_date datetime,
)
CREATE TABLE promotion_category (
	category_id int,
	promotion_id int,
)
----------------------------------------
CREATE TABLE user_payment_method (
	id int PRIMARY KEY IDENTITY(1,1),
	user_id int,
	payment_type_id int,
	provider varchar(50), -- MasterCard, Visa, ...
	account_number varchar(20),
	expiry_date date, -- Expiration date of card
	is_default int,
)
CREATE TABLE payment_type (
	id int PRIMARY KEY IDENTITY(1,1),
	value varchar(50),
)
CREATE TABLE shopping_cart (
	id int PRIMARY KEY IDENTITY(1,1),
	user_id int,
)
CREATE TABLE shopping_cart_item (
	id int PRIMARY KEY IDENTITY(1,1),
	cart_id int,
	product_item_id int,
	qty int, -- quantity
)
----------------------------------------
CREATE TABLE shop_order(
	id int PRIMARY KEY IDENTITY(1,1),
	user_id int,
	order_date datetime,
	payment_method_id int,
	shipping_address_id int,
	shipping_method_id int,
	order_total int,
	order_status_id int,
)
CREATE TABLE shipping_method (
	id int PRIMARY KEY IDENTITY(1,1),
	name varchar(50),
	price int,
)
CREATE TABLE order_status (
	id int PRIMARY KEY IDENTITY(1,1),
	status int,
)
CREATE TABLE order_line (
	id int PRIMARY KEY IDENTITY(1,1),
	product_item_id int,
	order_id int,
	qty int,
	price int,
)
----------------------------------------
CREATE TABLE user_review (
	id int PRIMARY KEY IDENTITY(1,1),
	user_id int,
	ordered_product_id int,
	rating_value int,
	comment varchar(200),
)

/* ################################## */

ALTER TABLE user_address
ADD FOREIGN KEY (user_id) REFERENCES site_user(id),
FOREIGN KEY (address_id) REFERENCES address(id);
ALTER TABLE address
ADD FOREIGN KEY (country_id) REFERENCES country(id);
-------------------------------
ALTER TABLE product
ADD FOREIGN KEY (category_id) REFERENCES product_category(id);
ALTER TABLE product_item
ADD FOREIGN KEY (product_id) REFERENCES product(id);
ALTER TABLE product_category
ADD FOREIGN KEY (parent_category_id) REFERENCES product_category(id);
ALTER TABLE variation
ADD FOREIGN KEY (category_id) REFERENCES product_category(id);
ALTER TABLE variation_option
ADD FOREIGN KEY (variation_id) REFERENCES variation(id);
ALTER TABLE product_configuration
ADD FOREIGN KEY (product_item_id) REFERENCES product_item(id),
FOREIGN KEY (variation_option_id) REFERENCES variation_option(id);
ALTER TABLE promotion_category
ADD FOREIGN KEY (category_id) REFERENCES product_category(id),
FOREIGN KEY (promotion_id) REFERENCES promotion(id)
--------------------------------
ALTER TABLE user_payment_method
ADD FOREIGN KEY (user_id) REFERENCES site_user(id),
FOREIGN KEY (payment_type_id) REFERENCES payment_type(id)
ALTER TABLE shopping_cart
ADD FOREIGN KEY (user_id) REFERENCES site_user(id)
ALTER TABLE shopping_cart_item
ADD FOREIGN KEY (cart_id) REFERENCES shopping_cart(id),
FOREIGN KEY (product_item_id) REFERENCES product_item(id)
-------------------------------
ALTER TABLE shop_order
ADD FOREIGN KEY (user_id) REFERENCES site_user(id),
FOREIGN KEY (payment_method_id) REFERENCES user_payment_method(id),
FOREIGN KEY (shipping_address_id) REFERENCES address(id),
FOREIGN KEY (shipping_method_id) REFERENCES shipping_method(id),
FOREIGN KEY (order_status_id) REFERENCES order_status(id)
ALTER TABLE order_line
ADD FOREIGN KEY (product_item_id) REFERENCES product_item(id),
FOREIGN KEY (order_id) REFERENCES shop_order(id);
------------------------------
ALTER TABLE user_review
ADD FOREIGN KEY (user_id) REFERENCES site_user(id),
FOREIGN KEY (ordered_product_id) REFERENCES order_line(id)

/* #################################### */
