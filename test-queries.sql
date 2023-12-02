--QUERY #1 
SELECT DISTINCT country
FROM address;

--QUERY #2 
UPDATE coupons 
SET discount_amount = 2
WHERE code = 4575391336;

--QUERY #3
UPDATE address
SET state = 'FR'
WHERE country = 'France' 
returning state as state_id;

--QUERY #4
DELETE FROM reviews 
WHERE rating < 3.5;

--QUERY #5
SELECT comment, rating
FROM reviews
WHERE review_date between '04-01-2024'
  AND '05-30-2024';

--QUERY #6
SELECT count(*)
FROM products;

--QUERY #7
SELECT *  
FROM ordered_items
  INNER JOIN  orders
  ON  orders.id = ordered_items.id;

--QUERY #8
insert into coupons (id, code, discount_amount, expiration_date) 
  values (16, '4934226079', '$14.69', '9/25/2024');
