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

--values to be inserted into the products table
INSERT INTO products VALUES('Ruffled t-shirt', 'Ruffle sleeve tops for women, suit for casual, daily, lounge, going out, workout, exercise, jogging, climbling, gym, yoga, sports, club, party, outdoor', 11.50, 'S, M, L', 'yellow', 'Shein', 17);
INSERT INTO products VALUES('Floral Dress', ' Ditsy Floral Puff Sleeve Shirred Bodycon Dress. Good for spring, summer and fall, Weekend casual, Summer daily wear, Holiday, Office wear, Beach, Vacation', 15, 'S, M, L', 'purple', 'Shein', 32);
INSERT INTO products VALUES('Graphic Tee', 'Suited for casual wear, vacation, daily life and outgoing, easy to pair with jeans, shorts, skirt, etc', 22, 'S, M, L', 'brown', 'Shein', 4);
INSERT INTO products VALUES('Cropped Graphic Tee', 'Floral & Slogan Graphic Drop Shoulder Tee. Great with high waisted jeans or shorts', 13, 'S, M, L', 'white', 'Shein', 7);
INSERT INTO products VALUES('Denim Dress', 'adjustable strap, zipper front, sleeveless, backless, bustier, solid color, slim fit. Fabric has some stretch, and is soft and comfortable', 35, 'S, M, L', 'medium denim', 'Shein', 11);
INSERT INTO products VALUES('Pleated Skirt', 'This pleated skirt for women is suitable for golf, tennis, casual,school,beach, uniform,party and daily wear. The pleated skirt is perfect for cheerleader cosplay, also plenty of fashion girls wear it for tennis skirt.', 19.99, 'S, M, L', 'khaki', 'Shein', 2);
INSERT INTO products VALUES('5-pcs Women Socks', 'These Nice Women Cute Socks Are Produced With Hand Stitching Technology. Seamless Toe Closure Prevents Abrasion on The Toes.', 8, 'S, M, L', 'multicolor', 'Shein', 12);
INSERT INTO products VALUES('Biker Shorts', 'The high-quality active shorts is high-value, perfect for everyday athleisure. This comfortable workout tights customized for indoor or outdoor activities and daily wear, yoga, biker, fitness, running, any type of workout, or everyday use.', 10, 'S, M, L, XL', 'black, green, navy blue', 'Shein', 23);
INSERT INTO products VALUES('Workout Bra', 'Spaghetti straps racerback design for full range of movement.', 26.99, 'S, M, L', 'black', 'Shein', 14);
INSERT INTO products VALUES('8 pcs Headband', 'The set includes 8 different colored headbands, allowing you to match your sports accessories with your outfit. Perfect for sports, yoga, dance, and fitness activities.', 8.99, 'regular size (fits all)', 'multicolor', 'Shein', 7);
INSERT INTO products VALUES('Women jumpsuit', 'This wide leg jumpsuit outfits great for summer party, workout, vacation, weekend, family party, casual tourism and daily wear,a must have one piece modest outfits', 39.99, 'S, M, L', 'coffee brown, black, grey', 'Shein', 17);
INSERT INTO products VALUES('Push-up Bra', 'Perfect Shape Push Up bra is built for lift and volume. This bra adds outward shape in addition to your classic push up for sexy cleavage and fuller look.', 49.95, '32A, 34A, 34B, 34C, 34D, 36A, 36B, 36C', 'purple lace, black lace, black smooth, pink lace', 'Victoria Secret', 31);
INSERT INTO products VALUES('Boyfriend jeans for women', 'This denim pants has classic five pockets, it is enough for daily using, baggy jeans is very friendly to most kinds of body shape, high waist design is trendy, you will have a fashion look in it', 32.99, 'S, M', 'blue denim', 'Shein', 3);
INSERT INTO products VALUES('3 Piece Bikini Set', 'Perfect for tropical vacations, summer, beach & pool, honeymoon, cruise.', 30.99, 'S, M, L', 'olive green, hot pink, lavender, blue', 'Shein', 89);
INSERT INTO products VALUES('2 piece Thong bikini set for women', 'Cheeky thong bathing suits features small ring metal accessories, side adjustable spaghetti straps , moderate butt coverage, high cut, high leg, make you look more charming and sexy.', 23.99, 'S, M, L', 'purple, yellow, dark green, coffee, red', 'Shein', 129);

--values for 
