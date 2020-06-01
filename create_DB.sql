BEGIN;
CREATE TABLE department (
    id SERIAL PRIMARY KEY, 
    city varchar(255) NOT NULL, 
    street varchar(255) NOT NULL, 
    house_number integer NOT NULL, 
    coordinate_x float NOT NULL, 
    coordinate_y float NOT NULL, 
    description varchar(255),
    opening_date date NOT NULL
);
CREATE TABLE department_division (
    id SERIAL PRIMARY KEY, 
    department_id integer REFERENCES department,
    city varchar(255) NOT NULL, 
    street varchar(255) NOT NULL, 
    house_number integer NOT NULL, 
    coordinate_x float NOT NULL, 
    coordinate_y float NOT NULL, 
    opening_date date NOT NULL,
    closing_date date,
    worker_id integer,
    shop_id integer NOT NULL
);
CREATE TABLE shop (
    id SERIAL PRIMARY KEY, 
    department_division_id integer REFERENCES department_division,
    city varchar(255) NOT NULL, 
    street varchar(255) NOT NULL, 
    house_number integer NOT NULL, 
    coordinate_x float NOT NULL, 
    coordinate_y float NOT NULL, 
    opening_date date NOT NULL, 
    closing_date date, 
    worker_id integer,
    client_id integer NOT NULL
);
CREATE TABLE product (
    id SERIAL PRIMARY KEY, 
    name varchar(255) NOT NULL,
    description varchar(255)
);
CREATE TABLE price_chart (
    id SERIAL PRIMARY KEY, 
    product_id integer REFERENCES product, 
    dicount_start date NOT NULL, 
    new_price numeric(5, 2) NOT NULL
);
CREATE TABLE propeties (
    id SERIAL PRIMARY KEY,  
    product_id integer REFERENCES product, 
    property varchar(255) NOT NULL, 
    value varchar(255) NOT NULL
);
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
CREATE TABLE client (
    id SERIAL PRIMARY KEY, 
    first_name varchar(255) UNIQUE,
    last_name varchar(255) UNIQUE,
    email varchar(255) UNIQUE,
    phone_number varchar(255) UNIQUE,
    personal_discount integer, 
    cheque_id integer NOT NULL REFERENCES cheque,
    shop_id integer NOT NULL REFERENCES shop
);
CREATE TABLE schedule (
    id SERIAL PRIMARY KEY, 
    start_shift time NOT NULL, 
    finish_shift time NOT NULL 
);
CREATE TABLE worker (
    id SERIAL PRIMARY KEY, 
    first_name varchar(255) NOT NULL,
    last_name varchar(255) NOT NULL,
    email varchar(255) NOT NULL UNIQUE, 
    phone_number varchar(255) NOT NULL UNIQUE,
    payment_id integer NOT NULL UNIQUE,
    city varchar(255) NOT NULL, 
    street varchar(255) NOT NULL, 
    house_number integer NOT NULL, 
    coordinate_x float NOT NULL, 
    coordinate_y float NOT NULL, 
    registration varchar(255) NOT NULL,
    start_work date NOT NULL,
    start_work date,
    schedule_id integer NOT NULL
);
CREATE TABLE worker_department (
    id SERIAL PRIMARY KEY, 
    worker_id integer REFERENCES worker,  
    department_id integer REFERENCES department, 
    date_start date NOT NULL, 
    date_finish date
);
CREATE TABLE worker_department_division (
    id SERIAL PRIMARY KEY, 
    worker_id integer REFERENCES worker, 
    department_division_id integer REFERENCES department_division, 
    date_start date NOT NULL, 
    date_finish date 
);
CREATE TABLE worker_shop (
    id SERIAL PRIMARY KEY,     
    worker_id integer REFERENCES worker,  
    shop_id integer REFERENCES shop, 
    date_start date NOT NULL, 
    date_finish date
);
CREATE TABLE supplier (
    id SERIAL PRIMARY KEY, 
    company_name varchar(255) NOT NULL, 
    email varchar(255) NOT NULL UNIQUE, 
    phone_number varchar(255) NOT NULL UNIQUE, 
    city varchar(255) NOT NULL, 
    street varchar(255) NOT NULL, 
    house_number integer NOT NULL, 
    coordinate_x float NOT NULL, 
    coordinate_y float NOT NULL, 
    product_id integer NOT NULL REFERENCES product
);
CREATE TABLE supply (
    id SERIAL PRIMARY KEY,
    product_id integer REFERENCES product,
    supplier_id integer REFERENCES supplier,
    worker_id integer REFERENCES worker,
    shop_id integer REFERENCES shop,
    delivery_date date NOT NULL
);

COMMIT;