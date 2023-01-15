CREATE TABLE employee(
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(150),
    position VARCHAR(100)
);

CREATE TABLE customer(
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(150)
);

CREATE TABLE car(
    vin_number VARCHAR(25) PRIMARY KEY,
    car_make VARCHAR(50),
    car_model VARCHAR(50),
    car_year INTEGER,
    sticker_price INTEGER
);

CREATE TABLE service(
    service_id SERIAL PRIMARY KEY,
    vin_number VARCHAR(25),
    employee_id INTEGER,
    date_of_service TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    service_description VARCHAR,
    service_price NUMERIC(10,2)
);

ALTER TABLE service
ADD FOREIGN KEY (vin_number) REFERENCES car(vin_number);

ALTER TABLE service
ADD FOREIGN KEY (employee_id) REFERENCES employee(employee_id);

CREATE TABLE sale(
    invoice_id SERIAL PRIMARY KEY,
    vin_number VARCHAR(25) NOT NULL,
    employee_id INTEGER NOT NULL,
    customer_id INTEGER NOT NULL,
    service_id INTEGER,
    date_of_sale TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (vin_number) REFERENCES car(vin_number),
    FOREIGN KEY (employee_id) REFERENCES employee(employee_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (service_id) REFERENCES service(service_id)
);

