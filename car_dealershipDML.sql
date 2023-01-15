INSERT INTO employee(
    first_name,
    last_name,
    email,
    position
)VALUES(
    'Mike',
    'Thomas',
    'mthomas@dealership.com',
    'salesman'
),(
    'John',
    'Jenkins',
    'jjenkins@dealership.com',
    'salesman'
),(
    'Bob',
    'MeChanic',
    'bob@dealership.com',
    'mechanic'
),(
    'Jane',
    'Thomas',
    'jthomas@dealership.com',
    'mechanic'
);

CREATE OR REPLACE FUNCTION add_customer(
    f_name VARCHAR(50),
    l_name VARCHAR(50),
    e VARCHAR(150)
)
RETURNS VOID
LANGUAGE plpgsql
AS
$MAIN$
BEGIN
    INSERT INTO customer(first_name, last_name, email)
    VALUES (f_name, l_name, e);
END
$MAIN$
;

SELECT add_customer('Matt', 'Day', 'mattdaymusic10@gmail.com');
SELECT add_customer('Kelly', 'Day', 'dayk@franklinschools.org');
SELECT add_customer('Steve', 'Day', 'sday@indy.net');
SELECT add_customer('Michael', 'Scott', 'mscott@dundermifflin.com');


CREATE OR REPLACE FUNCTION add_car(
    v_num VARCHAR(25),
    c_make VARCHAR(50),
    c_model VARCHAR(50),
    c_year INTEGER,
    price NUMERIC(10,2)
)
RETURNS VOID
LANGUAGE plpgsql
AS
$MAIN$
BEGIN
    INSERT INTO car(vin_number, car_make, car_model, car_year, sticker_price)
    VALUES (v_num, c_make, c_model, c_year, price);
END
$MAIN$
;

SELECT add_car('A0000000001', 'Ford', 'Fusion', 2008, 16000.00);
SELECT add_car('A0000000002', 'Toyota', 'Prius', 2015, 18000.00);
SELECT add_car('A0000000003', 'Kia', 'Niro', 2022, 35000.00);
SELECT add_car('A0000000004', 'Tesla', 'Model Y', 2022, 50000.00);


CREATE OR REPLACE FUNCTION add_service(
    v_num VARCHAR(25),
    e_id INTEGER,
    s_description VARCHAR,
    s_price NUMERIC(10,2)
)
RETURNS VOID
LANGUAGE plpgsql
AS
$MAIN$
BEGIN
    INSERT INTO service(vin_number, employee_id, date_of_service, service_description, service_price)
    VALUES (v_num, e_id, NOW()::TIMESTAMP, s_description, s_price);
END
$MAIN$
;

SELECT add_service('A0000000002', 3, 'Tire Rotation.  Wheel Alignment', 153.92);
SELECT add_service('A0000000004', 4, 'Oil Change.  Check tire pressure.', 49.99);


CREATE OR REPLACE FUNCTION add_sale(
    v_num VARCHAR(25),
    e_id INTEGER,
    c_id INTEGER,
    s_id INTEGER
)
RETURNS VOID
LANGUAGE plpgsql
AS
$MAIN$
BEGIN
    INSERT INTO sale(vin_number, employee_id, date_of_sale, customer_id, service_id)
    VALUES (v_num, e_id, NOW()::TIMESTAMP, c_id, s_id);
END
$MAIN$
;

SELECT add_sale('A0000000001', 1, 1, NULL);
SELECT add_sale('A0000000002', 3, 2, 1);
SELECT add_sale('A0000000004', 4, 4, 2);
SELECT add_sale('A0000000003', 2, 3, NULL);





