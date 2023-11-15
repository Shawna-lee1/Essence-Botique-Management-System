--Database: essence_boutique

DROP DATABASE IF EXISTS essence_boutique;

CREATE DATABASE essence_boutique
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

CREATE TABLE products (
	name text PRIMARY KEY,
	description varchar(500) NOT NULL,
	price money NOT NULL,
	size text,
	color varchar(20) NOT NULL,
	brand varchar(20) NOT NULL,
	stock_quantity integer NOT NULL
);

CREATE TABLE categories (
	id integer PRIMARY KEY,
	category_name varchar(50) NOT NULL
);


CREATE TABLE product_category (
	id integer PRIMARY KEY,
	products_name text REFERENCES products(name),
	categories_id integer REFERENCES categories(id)
	);

CREATE TABLE admin (
	id integer PRIMARY KEY,
	user_name varchar(20) NOT NULL,
	password varchar(20) NOT NULL
);

CREATE TABLE customers (
	id integer PRIMARY KEY,
	first_name varchar(20) NOT NULL,
	last_name varchar(20) NOT NULL,
	email varchar(50) NOT NULL,
	password varchar(20) NOT NULL,
	street_address text NOT NULL,
	telephone char(10) NOT NULL,
	payment_info text NOT NULL
);


CREATE TABLE wishlist (
	id integer PRIMARY KEY,
	customers_id integer REFERENCES customers(id),
	products_name text REFERENCES products(name)
);

CREATE TABLE coupons (
	id integer PRIMARY KEY,
	code bigint NOT NULL,
	discount_amount money NOT NULL,
	expiration_date date NOT NULL
);

CREATE TABLE orders (
	id integer PRIMARY KEY,
	customers_id integer REFERENCES customers(id),
	order_date date NOT NULL,
	status varchar(250) NOT NULL,
	total_number_of_items integer NOT NULL
);

CREATE TABLE ordered_items (
	id integer PRIMARY KEY,
	orders_id integer REFERENCES orders(id),
	products_name text REFERENCES products(name),
	quantity integer NOT NULL,
	subtotal money NOT NULL
);

CREATE TABLE address (
	id integer PRIMARY KEY,
	street_address text NOT NULL,
    city varchar(30) NOT NULL,
    state varchar(2) NOT NULL,
    postal_code char(9) NOT NULL,
    country varchar(60) NOT NULL
);

CREATE TABLE shipping_info (
	id integer PRIMARY KEY,
	shipping_info_id integer REFERENCES shipping_info(id),
	address_id integer REFERENCES address(id),
	shipping_method varchar(50) NOT NULL,
	tracking_number char(15) NOT NULL
);

CREATE TABLE reviews (
    id integer PRIMARY KEY,
	products_name text REFERENCES products(name),
	customers_id integer REFERENCES customers(id),
    rating numeric NOT NULL,
    comment varchar(350) NULL,
    review_date date NOT NULL
);
