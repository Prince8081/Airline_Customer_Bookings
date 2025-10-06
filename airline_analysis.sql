create database Airline_Customer_db ;
use Airline_Customer_db;

select *  from airline_customer;

-- Total Bookings & Completion Rate --

SELECT 
    COUNT(*) AS total_bookings,
    SUM(CASE
        WHEN booking_complete = 'Yes' THEN 1
        ELSE 0
    END) AS successfull_bookings,
    ROUND(SUM(CASE
                WHEN booking_complete = 'Yes' THEN 1
                ELSE 0
            END) * 100 / COUNT(*),
            2) AS completion_rate
FROM
    airline_customer;
    
 -- Completion Rate by Sales Channel -- 
 
 SELECT 
    sales_channel,
    COUNT(*) AS total_bookings,
    SUM(CASE
        WHEN booking_complete = 'Yes' THEN 1
        ELSE 0
    END) AS successfull_bookings,
    ROUND(SUM(CASE
                WHEN booking_complete = 'Yes' THEN 1
                ELSE 0
            END) * 100 / COUNT(*),
            2) AS completion_rate
FROM
    airline_customer
GROUP BY 1;


 -- Completion Rate by Trip type -- 
 
 SELECT 
    trip_type,
    COUNT(*) AS total_bookings,
    SUM(CASE
        WHEN booking_complete = 'Yes' THEN 1
        ELSE 0
    END) AS successfull_bookings,
    ROUND(SUM(CASE
                WHEN booking_complete = 'Yes' THEN 1
                ELSE 0
            END) * 100 / COUNT(*),
            2) AS completion_rate
FROM
    airline_customer
GROUP BY 1;


 -- Completion Rate by Add-on Preferences --

SELECT 
    wants_extra_baggage,
    wants_preferred_seat,
    wants_in_flight_meals,
    COUNT(*) AS total_bookings,
    SUM(CASE
        WHEN booking_complete = 'Yes' THEN 1
        ELSE 0
    END) AS successful_booings ,
    ROUND(100.0 * SUM(CASE
                WHEN booking_complete = 'Yes' THEN 1
                ELSE 0
            END) / COUNT(*),
            2) AS completion_rate
FROM
    airline_customer
GROUP BY wants_extra_baggage , wants_preferred_seat , wants_in_flight_meals
ORDER BY completion_rate DESC;


-- Completion Rate by Flight Hour -- 

 SELECT 
    flight_hour,
    COUNT(*) AS total_bookings,
    SUM(CASE
        WHEN booking_complete = 'Yes' THEN 1
        ELSE 0
    END) AS successfull_bookings,
    ROUND(SUM(CASE
                WHEN booking_complete = 'Yes' THEN 1
                ELSE 0
            END) * 100 / COUNT(*),
            2) AS completion_rate
FROM
    airline_customer
GROUP BY 1;


 -- Completion Rate by Flight period -- 

 SELECT 
    flight_period,
    COUNT(*) AS total_bookings,
    SUM(CASE
        WHEN booking_complete = 'Yes' THEN 1
        ELSE 0
    END) AS successfull_bookings,
    ROUND(SUM(CASE
                WHEN booking_complete = 'Yes' THEN 1
                ELSE 0
            END) * 100 / COUNT(*),
            2) AS completion_rate
FROM
    airline_customer
GROUP BY 1;


-- Completion Rate by Flight day --

  SELECT 
    flight_day,
    COUNT(*) AS total_bookings,
    SUM(CASE
        WHEN booking_complete = 'Yes' THEN 1
        ELSE 0
    END) AS successfull_bookings,
    ROUND(SUM(CASE
                WHEN booking_complete = 'Yes' THEN 1
                ELSE 0
            END) * 100 / COUNT(*),
            2) AS completion_rate
FROM
    airline_customer
GROUP BY 1
ORDER BY 2 DESC;