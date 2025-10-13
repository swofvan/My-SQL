-- table customers

CREATE TABLE customers (
    id int PRIMARY KEY AUTO_INCREMENT NOT null,
    name varchar(100) NOT null,
    phone int NOT null,
    address varchar(100) NOT null,
    UNIQUE (phone)
    );
    
ALTER TABLE customers AUTO_INCREMENT=101;

ALTER TABLE customers DROP INDEX phone;

ALTER TABLE customers
MODIFY COLUMN phone varchar(15) NOT null;

INSERT INTO customers (name, phone, address)
VALUES ('Jishnu', '9847001234', '24 MG Road, Kochi, Ernakulam'),
       ('Sahal', '9895678123', '56 Beach Road, Alappuzha'),
       ('Suresh', '9745234567', '12 Market St, Thrissur'),
       ('Priya', '9634587432', '98 Main Rd, Kozhikode'),
       ('Lakshmi', '9846132456', '41 Lake View, Kollam'),
       ('Akhila', '9846132852', 'Ottapalam, Palakkad'),
       ('Nikhil', '9841752426', 'Ankamali, Thrissur'),
       ('Swofvan', '984611234', 'Kuttippuram, Malappuram');

-- table restaurants;

CREATE TABLE restaurants (
   id int AUTO_INCREMENT PRIMARY KEY NOT null,
   name varchar(100) NOT null,
   location varchar(100),
   rating decimal(2,1)
   );


INSERT INTO restaurants (name, location, rating)
VALUES ('Spice Villa', 'Kochi, Kerala', 4.5),
       ('Coconut Grove', 'Thiruvananthapuram, Kerala', 4.2),
       ('Backwaters Delight', 'Alappuzha, Kerala', 4.7),
       ('The Kerala Kitchen', 'Kozhikode, Kerala', 4.1),
       ('Malabar Treats', 'Kannur, Kerala', 4.3),
       ('Green Leaf Cafe', 'Wayanad, Kerala', 4.6),
       ('Cashew House', 'Kollam, Kerala', 4.4),
       ('Peppercorn Lounge', 'Thrissur, Kerala', 4.0), 
       ('Cardamom Court', 'Palakkad, Kerala', 4.3),
       ('Banana Leaf Bistro', 'Pathanamthitta, Kerala', 4.5),
       ('Tamarind Tales', 'Idukki, Kerala', 4.2),
       ('Sapphire Spoon', 'Ernakulam, Kerala', 4.7),
       ('Mango Tree Diner', 'Alappuzha, Kerala', 4.1),
       ('Lotus Leaf Cafe', 'Thrissur, Kerala', 4.4),
       ('Curry Pot', 'Kozhikode, Kerala', 4.3);

DELETE FROM restaurants
WHERE id BETWEEN 6 AND 15;

-- table menu

CREATE TABLE menu (
    id INT PRIMARY KEY AUTO_INCREMENT NOT null,
    name varchar(100) NOT null,
    restaurant_id int NOT null,
    price decimal(8,2) NOT null, 
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(id)
    );

INSERT INTO menu (name, restaurant_id, price)
VALUES ('Fish Molee', 1, 170.00),
       ('Chicken Roast', 1, 160.00),
       ('Vegetable Kurma', 2, 50.50),
       ('Idli', 2, 10.00),
       ('Karimeen Pollichathu', 3, 250.00),
       ('Mutton Curry', 3, 230.00),
       ('Puttu', 4, 10.00),
       ('Kadala Curry', 4, 30.00),
       ('Chapati', 5, 20.00),
       ('Beef Fry', 5, 160.00),
       ('Nadan Chicken Fry', 1, 110.00),
       ('Parotta with Curry', 2, 120.00),
       ('Fish Biryani', 3, 200.00),
       ('Vegetable Fry', 4, 85.00),
       ('Egg Roast', 5, 50.00);

-- table delivery_partners

CREATE TABLE delivery_partners (
    id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(100) NOT null,
    phone varchar(15) NOT null
    );

INSERT INTO delivery_partners (name, phone)
VALUES ('Aslam', '9847012345'),
       ('Amith', '9895781234'),
       ('Suresh', '9745612345'),
       ('Manu', '9634527890'),
       ('Rahul', '9951234567'),
       ('Arun', '9801123456'),
       ('Joju', '9776543210'),
       ('Vishnu', '9847123456'),
       ('Ravi', '9900123456'),
       ('Manoj', '9812345678');

-- table offers

CREATE TABLE offers (
    id int AUTO_INCREMENT PRIMARY KEY NOT null,
    c_code varchar(15),
    description varchar(100)
    );

ALTER TABLE offers
ADD UNIQUE (c_code);

ALTER TABLE offers
ADD COLUMN expiry_date varchar(100)

INSERT INTO offers (c_code, description, expiry_date)
VALUES ('SWIGGY100', 'Get ₹100 off on orders above ₹500', '31-10-2025'),
       ('FIRSTORDER', '10% off on your first order', 'No Expiry'),
       ('HAPPYSUNDAY', '20% off on sunday', '25-10-2025'),
       ('FESTIVE50', '50% off during Diwali', '18-10-2025');

-- table orders

CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    restaurant_id INT,
    item_id int,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10,2),
    coupon_code varchar(100),
    FOREIGN KEY (customer_id) REFERENCES customers(id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(id),
    FOREIGN KEY (item_id) REFERENCES menu(id),
    FOREIGN KEY (coupon_code) REFERENCES offers(c_code)	
    );

-- table delivery

CREATE TABLE delivery (
    id int AUTO_INCREMENT PRIMARY KEY NOT null,
    order_id int,
    partner_id int,
    d_status varchar(100),
    d_time varchar(100),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (partner_id) REFERENCES delivery_partners(id)
    );