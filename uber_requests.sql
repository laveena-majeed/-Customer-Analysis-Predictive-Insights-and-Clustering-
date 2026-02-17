-- =========================================================
-- TABLE CREATION
-- =========================================================
-- This table stores Uber ride request details including
-- pickup location, driver assignment, ride status, and timestamps

CREATE TABLE uber_requests (
    Request_id INT,
    Pickup_point VARCHAR(50),
    Driver_id INT,
    Status VARCHAR(50),
    Request_timestamp TEXT,
    Drop_timestamp TEXT
);

-- =========================================================
-- SAMPLE DATA CHECK
-- =========================================================
-- View first 10 records to verify successful data import

SELECT * 
FROM uber_requests 
LIMIT 10;

-- =========================================================
-- QUERY 1: OVERALL RIDE STATUS DISTRIBUTION
-- =========================================================
-- This query shows how many requests were completed,
-- cancelled, or failed due to no cab availability

SELECT 
    Status, 
    COUNT(*) AS total_requests
FROM uber_requests
GROUP BY Status;

-- INSIGHT:
-- A significant number of ride requests are either cancelled
-- or marked as 'No Cars Available', indicating inefficiencies
-- in meeting rider demand.

-- =========================================================
-- QUERY 2: PICKUP POINT VS RIDE STATUS
-- =========================================================
-- This query compares ride outcomes between Airport and City
-- pickup locations

SELECT 
    Pickup_point,
    Status,
    COUNT(*) AS total_requests
FROM uber_requests
GROUP BY Pickup_point, Status
ORDER BY Pickup_point;

-- INSIGHT:
-- Airport pickups experience a higher number of unfulfilled
-- requests, while city pickups show more cancellations,
-- highlighting location-specific supply issues.

-- =========================================================
-- QUERY 3: DRIVER CANCELLATIONS ANALYSIS
-- =========================================================
-- This query focuses specifically on cancelled rides

SELECT 
    COUNT(*) AS cancelled_rides
FROM uber_requests
WHERE Status = 'Cancelled';

-- INSIGHT:
-- A high volume of cancellations suggests driver reluctance
-- during certain time periods, especially early mornings.

-- =========================================================
-- QUERY 4: UNFULFILLED DEMAND (NO CARS AVAILABLE)
-- =========================================================
-- This query identifies which pickup locations face the
-- highest shortage of available cabs

SELECT 
    Pickup_point,
    COUNT(*) AS no_car_requests
FROM uber_requests
WHERE Status = 'No Cars Available'
GROUP BY Pickup_point;

-- INSIGHT:
-- The Airport location shows a higher number of requests
-- failing due to cab unavailability, especially during night
-- hours, indicating a critical supply-demand gap.






