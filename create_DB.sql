BEGIN;
CREATE TABLE department (
    id SERIAL PRIMARY KEY,
    name varchar(255) NOT NULL, 
    city varchar(255) NOT NULL, 
    street varchar(255) NOT NULL, 
    house_number integer NOT NULL,
    opening_date date NOT NULL
);
INSERT INTO department (name, city, street, house_number, opening_date) VALUES
('Mayer Group', 'Chaddview', 'Herman Dam', 43, '2013-03-26T02:32:34.926Z'),
('Hilll Group', 'Geoffreyton', 'Elinore Lock', 79, '2017-05-24T16:52:25.957Z'),
('Marvin - Eichmann', 'East Kim', 'Conn Parkway', 31, '2013-04-05T07:17:40.250Z'),
('Olson - Bradtke', 'Colemouth', 'Zboncak Lock', 94, '2016-05-23T14:35:33.196Z'),
('Gleason Group', 'Lake Brendon', 'Steuber Court', 109, '2013-03-01T23:14:21.683Z'),
('Pfeffer LLC', 'Kundechester', 'Percival Neck', 64, '2010-10-20T11:25:28.177Z'),
('King, Beier and Keeling', 'West Elijah', 'Waelchi Mall', 27,  '2019-01-26T10:43:02.815Z'),
('Konopelski - Morar', 'Concepcionborough', 'Haley Gateway', 123, '2015-04-28T17:24:47.349Z'),
('Walker and Sons', 'Chaddview', 'Herman Dam', 43, '2013-03-26T02:32:34.926Z'),
('Bernar Inc', 'Kelleytown', 'Hickle Turnpike', 86, '2013-11-11T18:22:16.494Z');
COMMIT;



BEGIN;
CREATE TABLE department_division (
    id SERIAL PRIMARY KEY, 
    name varchar(255) NOT NULL, 
    department_id integer REFERENCES department,
    city varchar(255) NOT NULL, 
    street varchar(255) NOT NULL, 
    house_number integer NOT NULL, 
    opening_date date NOT NULL,
    closing_date date
);
INSERT INTO department_division (department_id, name, city, street, house_number, opening_date, closing_date) VALUES
(3, 'Bartell, Harvey and Hagenes', 'Gildafort', 'Jermey Lake', 76, '2019-03-25T18:19:43.586Z', '2019-12-04T08:11:43.050Z'),
(5, 'Heidenreich, Ryan and Wolff', 'MacGyverville', 'Toy Heights', 88, '2019-09-19T07:22:24.246Z', null),
(10, 'Dooley LLC', 'Kassulkeport', 'Mohammed Flats', 125, '2010-07-14T09:46:50.660Z', '2013-10-13T05:58:57.398Z'),
(2, 'Berge - Lynch', 'Port Derrickburgh', 'Ryan Springs', 70, '2017-08-22T04:32:17.178Z', '2019-11-03T04:45:03.792Z'),
(4, 'Buckridge, Durgan and Botsford', 'East Luramouth', 'Fausto Corner', 128, '2012-04-25T21:08:54.625Z', '2014-10-07T08:38:37.514Z'),
(6, 'Pfannerstill Group', 'South Willyfort', 'Julien Mews', 25, '2014-05-04T13:11:24.647Z', '2019-04-20T00:17:51.675Z'),
(1, 'Morissette, Stracke and Casper', 'New Parkermouth', 'Willms Track', 145, '2013-06-15T15:44:27.994Z', '2020-05-06T14:52:29.793Z'),
(8, 'Collier, Kuvalis and Herzog', 'Abrahamville', 'Winfield Mall', 61, '2014-07-12T00:25:11.050Z', '2016-06-08T05:37:41.637Z'),
(9, 'Davis - Weimann', 'Port Jena', 'Jarrell Ways', 51, '2011-01-20T08:09:42.677Z', '2015-07-28T09:47:28.995Z'),
(7, 'Lueilwitz, Torp and Waters', 'Stoltenbergberg', 'Elvera Road', 14, '2019-04-20T14:19:07.574Z', null);
COMMIT;



BEGIN;
CREATE TABLE shop (
    id SERIAL PRIMARY KEY, 
    department_division_id integer REFERENCES department_division,
	name varchar(255) NOT NULL,
    city varchar(255) NOT NULL, 
    street varchar(255) NOT NULL, 
    house_number integer NOT NULL,
    opening_date date NOT NULL, 
    closing_date date
);
INSERT INTO shop (department_division_id, name, city, street, house_number, opening_date, closing_date) VALUES
(6, 'Waelchi Group', 'Trantowbury', 'Schinner Well', 174, '2017-12-27T01:42:45.730Z', '2019-06-20T08:53:00.267Z'),
(7, 'Keeling LLC', 'Lowemouth', 'Columbus Fork', 61, '2011-06-28T17:08:02.526Z', '2015-05-10T19:01:20.038Z'),
(5, 'Purdy, Ebert and Gorczany', 'Walshstad', 'Fadel Cape', 134, '2019-11-07T08:10:14.779Z', null),
(4, 'Schiller, Mueller and Borer', 'Gudrunview', 'Damian Field', 48, '2015-03-12T00:45:13.923Z', '2017-12-16T05:46:58.740Z'),
(9, 'Schinner - Runolfsson', 'Port Carol', 'Ludie Mission', 162, '2018-08-12T02:24:30.422Z', null),
(10, 'Windler LLC', 'Annamaemouth', 'Dibbert Point', 7, '2011-01-19T17:26:01.266Z', '2014-12-17T04:45:57.519Z'),
(2, 'Moen - Nienow', 'Loweside', 'Heathcote Village', 105, '2016-05-16T10:00:46.804Z', '2019-11-05T17:15:50.986Z'),
(3, 'Farrell, Ziemann and Barrows', 'Maximoburgh', 'Stroman Knolls', 47, '2019-06-06T06:34:22.142Z', null),
(8, 'Frami, Kertzmann and Mraz', 'Pagacborough', 'Audie Freeway', 149, '2019-10-02T04:28:00.158Z', null),
(1, 'Kassulke and Sons', 'Letitiaville', 'Cummings Burg', 46, '2013-05-05T06:05:37.316Z', '2014-08-19T05:06:47.568Z');
COMMIT;



BEGIN;
CREATE TABLE product (
    id SERIAL PRIMARY KEY, 
    name varchar(255) NOT NULL,
	price numeric(5, 2) NOT NULL,
    description varchar(255)
);
CREATE TABLE price_chart (
    id SERIAL PRIMARY KEY, 
    product_id integer REFERENCES product, 
    dicount_start date NOT NULL, 
    new_price numeric(5, 2) NOT NULL
);
CREATE TABLE properties (
    id SERIAL PRIMARY KEY,  
    product_id integer REFERENCES product, 
    property varchar(255) NOT NULL, 
    value varchar(255) NOT NULL
);

INSERT INTO product (name, price, description) VALUES
('Apple', '700.00', 'Aut vitae itaque laboriosam repellat recusandae.'),
('Banana', '516.00','Ad voluptatem nobis voluptatem eum rerum nulla laborum sit.'),
('Orange', '173.00','Illo velit ex sed enim.'),
('Lemon', '289.00','Omnis tempore accusantium ut est voluptates sunt optio.'),
('Cake', '424.00','Quisquam sed esse velit cum consequuntur maiores possimus.'),
('Juice', '440.00','Ut et sint enim esse.'),
('Potato', '606.00','Voluptatem in ad et eos.'),
('Tomato', '101.00','Sequi sint optio dolorem suscipit natus impedit incidunt numquam.'),
('Cheeze', '151.00','Vitae et pariatur.'),
('Pie', '852.00','Dolores velit possimus et cupiditate repellendus quos praesentium.');

INSERT INTO price_chart (product_id, dicount_start, new_price) VALUES
(7, '2018-05-04T08:29:36.676Z', 454.00),
(2, '2014-03-10T01:02:01.641Z', 655.00),
(5, '2020-05-05T02:52:30.596Z', 942.00),
(8, '2016-03-24T00:04:15.636Z', 387.00),
(4, '2018-09-17T13:29:12.883Z', 731.00),
(1, '2013-02-09T00:19:17.254Z', 169.00),
(10, '2017-03-29T14:08:03.391Z', 673.00),
(3, '2020-01-22T21:35:59.067Z', 839.00),
(9, '2010-11-26T16:41:04.833Z', 597.00),
(6, '2013-08-14T20:51:34.803Z', 212.00);

INSERT INTO properties (product_id, property, value) VALUES
(1, 'Color', 'Green'),
(6, 'Fruit', 'Cherry'),
(7, 'Weight', '5'),
(9, 'Weight', '0.2'),
(8, 'Size', 'Small'),
(4, 'Weight', '0.1'),
(5, 'Size', '20x20'),
(3, 'Weight', '0.5'),
(2, 'Color', 'Yellow'),
(10, 'Size', '10x10');
COMMIT;



CREATE TABLE product_shop (
    id SERIAL PRIMARY KEY, 
    product_id integer REFERENCES product, 
    shop_id integer REFERENCES shop
);
CREATE TABLE cheque (
    id SERIAL PRIMARY KEY, 
    product_id integer  NOT NULL REFERENCES product,
    shop_id integer NOT NULL REFERENCES shop,
    discount_amount integer NOT NULL,
    purchase_amount integer NOT NULL
);
BEGIN;
CREATE TABLE client (
    id SERIAL PRIMARY KEY, 
    fio_name varchar(255) UNIQUE,
    email varchar(255) UNIQUE,
    phone_number varchar(255) UNIQUE
);
INSERT INTO client (fio_name, email, phone_number) VALUES
('Hartley Bryant', 'Sarah_Dickinson@gmail.com', '1-300-512-4019'),
('Jameson Patterson', 'Tillman.Zemlak@gmail.com', '(972) 467-6324'),
('Gerald Rogers', 'Ryann90@yahoo.com', '(567) 573-6956'),
('Desmond Jones', 'Tabitha.Crona@gmail.com', '1-793-997-2805'),
('Quirino Sanders', 'Bret3@hotmail.com', '804.218.7639'),
('Christopher Perez', 'Arvilla.Schiller71@gmail.com', '253.598.4963 x215'),
('Yunis Wilson', 'Aletha26@yahoo.com', '1-662-409-5404 x12680'),
('Vance Butler', 'Ephraim_Zboncak@hotmail.com', '176.981.2366 x6802'),
('Camden Bennett', 'Jamel0@gmail.com', '368-417-6040 x27367'),
('Trey Hayes', 'Corrine_McCullough52@gmail.com', '1-900-582-3947 x5531');
COMMIT;



BEGIN;
CREATE TABLE worker (
    id SERIAL PRIMARY KEY, 
    fio_name varchar(255) NOT NULL,
    email varchar(255) NOT NULL UNIQUE, 
    phone_number varchar(255) NOT NULL UNIQUE,
    payment_id integer NOT NULL UNIQUE,
    city varchar(255) NOT NULL, 
    street varchar(255) NOT NULL,
    house_number integer NOT NULL
);
INSERT INTO worker (fio_name, email, phone_number, payment_id, city, street, house_number) VALUES
('Zakary Cox', 'Freda.Pagac@gmail.com', '1-671-983-2848 x8898', 51, 'South Ubaldoville', 'Jamarcus Crescent', 103),
('Osman Rogers', 'Summer83@yahoo.com', '611-290-0277 x206',92, 'Vonview', 'Williamson Knolls', 82),
('Marcus Rivera', 'Mohamed5@hotmail.com', '1-846-761-6289 x55455',63, 'Deonmouth', 'Antwan Mission', 192),
('Josue Torres', 'Barbara_Fahey12@hotmail.com', '(128) 062-2060',33, 'North Ambrose', 'Chanel Stream', 57),
('Xuan Perry', 'Rahul_Koepp@yahoo.com', '090.278.5580',72, 'Santiagofort', 'Toy Spring', 95),
('Archer Ross', 'Selina_Metz3@hotmail.com', '443.300.0971',41, 'Dayneport', 'Zulauf Viaduct', 49),
('Floyd Wilson', 'Ida85@hotmail.com', '388-267-8416',58, 'Yoststad', 'Crooks Stream', 94),
('Wade Power', 'Nash81@hotmail.com', '872.674.9043 x46611',38, 'Gutkowskiland', 'Lang Ridges', 18),
('Thatcher Anderson', 'Adrienne.Veum79@hotmail.com', '615-211-3417', 37,'Favianburgh', 'Hessel Mill', 179),
('Ismael Coleman', 'Wallace_Romaguera@hotmail.com', '1-118-814-2894',10, 'Cartwrightport', 'Jennyfer Mountains', 36);
COMMIT;



BEGIN;
CREATE TABLE schedule (
    id SERIAL PRIMARY KEY, 
    worker_id integer REFERENCES worker, 
    start_shift time NOT NULL, 
    finish_shift time NOT NULL 
);
INSERT INTO schedule(worker_id, start_shift, finish_shift) VALUES
(9, '1:00:00', '5:00:00'),
(3, '1:00:00', '5:00:00'),
(1, '6:00:00', '10:00:00'),
(6, '6:00:00', '10:00:00'),
(2, '6:00:00', '10:00:00'),
(5, '11:00:00', '17:00:00'),
(7, '11:00:00', '17:00:00'),
(10, '11:00:00', '17:00:00'),
(4, '18:00:00', '23:00:00'),
(8, '18:00:00', '23:00:00');
COMMIT;



BEGIN;
CREATE TABLE worker_department (
    id SERIAL PRIMARY KEY, 
    worker_id integer REFERENCES worker, 
    department_id integer REFERENCES department, 
    date_start date NOT NULL, 
    date_finish date
);
INSERT INTO worker_department(worker_id, department_id, date_start, date_finish) VALUES
(7, 2, '2015-07-10T08:21:17.966Z', '2019-05-21T06:39:33.843Z'),
(4, 5, '2011-03-01T08:33:30.607Z', '2018-05-15T23:51:55.732Z'),
(8, 10, '2016-06-27T10:43:57.285Z', '2018-10-15T14:45:16.355Z'),
(1, 6, '2012-10-17T06:58:30.284Z', '2018-12-17T00:12:46.466Z'),
(2, 7, '2019-05-23T05:33:56.424Z', null),
(3, 9, '2016-12-25T20:58:21.101Z', null),
(5, 4, '2017-10-07T01:42:27.179Z', '2018-11-25T04:45:10.982Z'),
(6, 3, '2016-07-16T15:18:22.210Z', null),
(10, 1, '2019-05-30T02:27:26.852Z', null),
(9, 8, '2012-03-29T04:04:55.341Z', '2018-02-16T19:48:26.537Z');
COMMIT;



BEGIN;
CREATE TABLE worker_department_division (
    id SERIAL PRIMARY KEY, 
    worker_id integer REFERENCES worker, 
    department_division_id integer REFERENCES department_division, 
    date_start date NOT NULL, 
    date_finish date 
);
INSERT INTO worker_department_division(worker_id, department_division_id, date_start, date_finish) VALUES
(4, 10, '2011-05-20T12:02:04.500Z', '2014-02-14T15:03:04.284Z'),
(7, 8, '2018-05-19T13:47:09.465Z', null),
(6, 5, '2013-08-22T00:49:08.252Z', '2014-03-19T11:34:26.249Z'),
(2, 2, '2011-05-20T16:25:57.603Z', '2017-07-20T13:59:14.166Z'),
(9, 3, '2013-01-08T11:43:08.160Z', '2017-10-22T18:39:55.251Z'),
(8, 9, '2010-06-09T02:02:37.512Z', '2012-04-13T00:45:39.119Z'),
(1, 6, '2017-10-13T09:20:30.658Z', null),
(10, 1, '2017-04-25T13:17:30.213Z', null),
(5, 4, '2012-02-04T11:01:53.944Z', '2015-04-28T21:21:37.849Z'),
(3, 7, '2017-04-18T09:43:54.870Z', null);
COMMIT;



BEGIN;
CREATE TABLE worker_shop (
    id SERIAL PRIMARY KEY,     
    worker_id integer REFERENCES worker, 
    shop_id integer REFERENCES shop, 
    date_start date NOT NULL, 
    date_finish date
);
INSERT INTO worker_shop(worker_id, shop_id, date_start, date_finish) VALUES
(6, 5, '2015-03-01T17:19:50.160Z', '2017-09-28T18:32:35.973Z'),
(8, 8, '2011-01-21T22:24:04.814Z', '2018-04-07T00:14:14.325Z'),
(7, 9, '2012-08-13T20:48:49.939Z', '2019-09-27T21:47:45.974Z'),
(10, 7, '2015-05-05T22:17:41.570Z', '2020-04-05T12:10:33.265Z'),
(2, 6, '2017-11-12T08:43:59.514Z', null),
(3, 3, '2018-03-22T18:58:44.402Z', null),
(5, 4, '2011-01-11T19:56:12.174Z', '2018-04-25T23:57:59.779Z'),
(1, 1, '2014-06-17T16:19:56.698Z', null),
(4, 10, '2014-03-13T18:26:37.099Z', '2015-03-15T20:17:25.063Z'),
(9, 2, '2014-12-29T13:34:04.123Z', null);
COMMIT;



BEGIN;
CREATE TABLE supplier (
    id SERIAL PRIMARY KEY, 
    company_name varchar(255) NOT NULL, 
    email varchar(255) NOT NULL UNIQUE, 
    phone_number varchar(255) NOT NULL UNIQUE, 
    city varchar(255) NOT NULL, 
    street varchar(255) NOT NULL, 
    house_number integer NOT NULL
);
CREATE TABLE supply (
    id SERIAL PRIMARY KEY,
    product_id integer REFERENCES product,
    supplier_id integer REFERENCES supplier,
    worker_id integer REFERENCES worker,
    shop_id integer REFERENCES shop,
	product_amount integer,
    delivery_date date NOT NULL,
	delivery_price numeric(5,2) NOT NULL
);

INSERT INTO supplier (company_name, email, phone_number, city, street, house_number) VALUES
('Oberbrunner, Davis and Grimes', 'Carissa.Homenick44@gmail.com', '551-964-3130', 'Hilpertview', 'Swift Lane', 27),
('Satterfield LLC', 'Tressie1@gmail.com', '105.071.5555', 'Ratkehaven', 'Paxton Village', 96),
('Farrell - Farrell', 'Grady_Bednar@hotmail.com', '(612) 762-8558', 'Port Rhettberg', 'Wiza Expressway', 110),
('Baumbach, Jast and Davis', 'Rosetta_Kunde@gmail.com', '(694) 569-7558 x1684', 'East Tevin', 'Miracle Street', 153),
('Langworth, Bednar and Ondricka', 'Dameon.Will56@gmail.com', '1-445-240-1915', 'Krajcikhaven', 'Spencer Tunnel', 51),
('Dietrich and Sons', 'Eugenia_Kemmer78@gmail.com', '(658) 206-0411', 'North Tristin', 'Beier Flat', 60),
('Mraz LLC', 'Johanna_Mayert59@gmail.com', '133-324-6923', 'Koelpinmouth', 'Andreane Road', 84),
('Runolfsson Inc', 'Pauline_Heller93@hotmail.com', '054.322.3396', 'Faustoborough', 'Oberbrunner Way', 14),
('Hintz, Herzog and Schimmel', 'Waldo_Abbott@hotmail.com', '665-031-3220 x2311', 'Nienowchester', 'Kautzer Oval', 72),
('Welch - Morissette', 'Minnie_Terry@yahoo.com', '433.227.9297', 'Hammesbury', 'Autumn Highway', 176);

INSERT INTO supply (product_id, supplier_id, worker_id, shop_id, product_amount, delivery_date,delivery_price) VALUES
(3, 4, 7, 7, 26, '2018-02-07T21:38:42.709Z', 477.00),
(4, 5, 3, 8, 20, '2019-07-12T02:04:29.670Z', 381.00),
(8, 7, 2, 4, 37, '2017-09-04T22:17:37.779Z', 146.00),
(1, 6, 9, 9, 45, '2020-03-08T12:57:35.037Z', 879.00),
(10, 10, 8, 5, 48, '2010-12-12T16:47:02.959Z', 550.00),
(7, 9, 8, 6, 34, '2013-09-08T07:36:50.363Z', 901.00),
(6, 4, 9, 3, 22, '2010-06-24T11:32:15.337Z', 417.00),
(5, 8, 2, 1, 50, '2012-03-19T09:55:59.824Z', 660.00),
(2, 5, 1, 10, 47, '2015-08-30T17:51:51.639Z', 354.00),
(9, 1, 3, 2, 38, '2019-10-25T01:10:43.804Z', 390.00);
COMMIT;



BEGIN;
CREATE TABLE warehouse (
    id SERIAL PRIMARY KEY, 
    name varchar(255) NOT NULL,
    value varchar(255) NOT NULL
);
INSERT INTO warehouse (name, value) VALUES
('Food', '72%'),
('Chemistry', '69%'),
('Medicine', '80%'),
('Fruits', '53%'),
('Meat', '74%'),
('Snacks', '26%'),
('Water', '43%'),
('Industrial', '78%'),
('Bread', '76%'),
('Pets', '25%');
COMMIT;



BEGIN;
CREATE TABLE cheque  (
    id SERIAL PRIMARY KEY, 
    client_id integer REFERENCES client,
    shop_id integer NOT NULL REFERENCES shop,
    warehouse_id integer REFERENCES warehouse,
    date_purchase date NOT NULL, 
    amount numeric(7, 2) NOT NULL
);
INSERT INTO cheque(client_id, shop_id, warehouse_id, date_purchase, amount) VALUES
(3, 10, 1, '2019-08-03T10:29:06.993Z', 2585.00),
(8, 3, 9, '2019-09-29T15:59:52.633Z', 2882.00),
(9, 5, 4, '2018-11-30T11:57:24.249Z', 2225.00),
(4, 8, 3, '2019-12-13T20:59:10.648Z', 2946.00),
(7, 1, 7, '2019-11-17T06:12:06.850Z', 1815.00),
(5, 2,10, '2019-12-14T12:28:06.502Z', 2208.00),
(10, 6, 8, '2019-02-15T15:30:37.434Z', 2002.00),
(6, 4, 5, '2020-04-09T09:44:56.601Z', 2718.00),
(1, 9, 6, '2019-01-04T23:10:19.645Z', 2660.00),
(2, 7, 2, '2020-04-30T11:32:15.074Z', 2360.00);
COMMIT;



BEGIN;
CREATE TABLE cheque_product (
    id SERIAL PRIMARY KEY,  
    cheque_id integer REFERENCES cheque, 
	product_id integer REFERENCES product, 
    count integer NOT NULL
);
INSERT INTO cheque_product (cheque_id, product_id, count) VALUES
(5, 7, 9),
(6, 8, 7),
(9, 9, 3),
(1, 1, 1),
(8, 3, 10),
(3, 6, 8),
(10, 5, 6),
(7, 10, 4),
(4, 2, 5),
(2, 4, 2);
COMMIT;