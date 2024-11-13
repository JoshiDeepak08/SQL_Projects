-- Calculate Ride Cancellation Rate: Problem Statement

-- Creating database and using database

CREATE DATABASE ride;
USE ride;

-- creating tables and inserting data 


CREATE TABLE trip (
    id INT PRIMARY KEY,
    client_id INT,
    driver_id INT,
    city_id INT,
    status VARCHAR(30),
    request_at DATE
);

INSERT INTO trip (id, client_id, driver_id, city_id, status, request_at) VALUES
    (1, 1, 10, 1, 'completed', '2023-07-12'),
    (2, 2, 11, 1, 'cancelled_by_driver', '2023-07-12'),
    (3, 3, 12, 6, 'completed', '2023-07-12'),
    (4, 4, 13, 6, 'cancelled_by_client', '2023-07-12'),
    (5, 1, 10, 1, 'completed', '2023-07-13'),
    (6, 2, 11, 6, 'completed', '2023-07-13'),
    (7, 3, 12, 6, 'completed', '2023-07-13'),
    (8, 2, 12, 12, 'completed', '2023-07-14'),
    (9, 3, 10, 12, 'completed', '2023-07-14'),
    (10, 4, 13, 12, 'cancelled_by_driver', '2023-07-14');


CREATE TABLE users(
    user_id INT,
    banned VARCHAR(3),
    role  VARCHAR(20)
);

INSERT INTO users (user_id, banned, role) VALUES
    (1, 'No', 'client'),
    (2, 'Yes', 'client'),
    (3, 'No', 'client'),
    (4, 'No', 'client'),
    (10, 'No', 'driver'),
    (11, 'No', 'driver'),
    (12, 'No', 'driver'),
    (13, 'No', 'driver');

-- to calculate the ride cancellation rate using SQL:


    WITH unbanned_user AS (
        SELECT 
        t.request_at AS day1,
        COUNT(CASE WHEN t.status LIKE "cancelled%" THEN 1 END) AS total_canceled,
        COUNT (*) AS total_requests
        FROM
        trip t
        JOIN users u1 ON t.client_id = u1.user_id
        JOIN users u2 ON t.driver_id = u2.user_id
        WHERE
        u1.banned = "No" AND u2.banned = "No"
        GROUP BY
        t.request_at
    )

    SELECT
    day1,
    ROUND(total_canceled / NULLIF(total_requests,0 ),2) AS rate
    FROM 
    unbanned_user
    ORDER BY
    day1;