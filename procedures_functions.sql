CREATE PROCEDURE late_fee_matt(
    p_id INTEGER,
    feeAmount NUMERIC (5, 2)
    )
-- p_id = payment_id
-- NUMERIC(5, 2) - 5 digits long - two of them are decimals
    LANGUAGE plpgsql
    -- ALWAYS plpgsql (programming language postgres SQL)
    AS
    $$
    BEGIN
    -- add the code block here
        UPDATE payment
        SET amount = amount + feeAmount --provided from input
        WHERE payment_id = p_id;
        -- You can have as many procedures here as you want

        -- Updating a PRIMARY KEY will change the FOREIGN KEYS in other tables automatically
        --      as long as they have the FOREIGN KEY constraint attached
        -- commit the above statement inside of a transaction
        -- COMMIT is what actually changes the database
        COMMIT;
    END
    $$
    ;

SELECT payment_id, amount
FROM payment
WHERE payment_id = 22687;

CALL late_fee_matt(22687, 0.99);

-- Procedures don't return anything, they update in place
-- A function allows us to return a value

SELECT *
FROM actor
LIMIT 1;

-- Needs first_name, last_name, actor_id

CREATE OR REPLACE FUNCTION add_actor_matt(
    a_id INTEGER,
    f_name VARCHAR(45),
    l_name VARCHAR(45)
)
RETURNS VOID
-- Don't need anything back when we add an actor to a table
LANGUAGE plpgsql
AS
$MAIN$
-- SYNTAX $MAIN-$ to add functions
BEGIN
    -- insert into actor
    INSERT INTO actor(actor_id, first_name, last_name, last_update)
    VALUES (a_id, f_name, l_name, NOW()::TIMESTAMP);
    -- The values are variables (like python functions) that we will insert later
    -- NOW()::TIMESTAMP is a special function to get the timestamp of input - W3SCHOOLS
    -- No COMMIT necessary for FUNCTIONS
END
$MAIN$
;

-- do not use CALL keyword... it will not work
-- instead use SELECT

SELECT add_actor_matt(405, 'Michael J', 'Fox');

SELECT *
FROM actor;




