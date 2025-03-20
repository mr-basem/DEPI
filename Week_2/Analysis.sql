use [UK trin ride]

SELECT 
    Purchase_Type,
    AVG(CAST(Price AS FLOAT)) AS Avg_Price
FROM railway
GROUP BY Purchase_Type
ORDER BY Avg_Price ASC;


SELECT 
    Journey_Status, 
    AVG(CAST(Price AS FLOAT)) AS Avg_Ticket_Price,
    COUNT(*) AS Total_Tickets
FROM railway
WHERE Journey_Status IN ('Delayed', 'On Time') 
GROUP BY Journey_Status
ORDER BY Avg_Ticket_Price DESC;

SELECT 
    Payment_Method, 
    Ticket_Type, 
    COUNT(*) AS Ticket_Count
FROM railway
GROUP BY Payment_Method, Ticket_Type
ORDER BY Payment_Method, Ticket_Count DESC;


SELECT 
    Departure_Station, 
    Arrival_Destination, 
    COUNT(*) AS Total_Journeys
FROM railway
GROUP BY Departure_Station, Arrival_Destination
ORDER BY Total_Journeys DESC;
SELECT 
    Departure_Station, 
    COUNT(*) AS Departures_Count
FROM railway
GROUP BY Departure_Station
ORDER BY Departures_Count DESC;

SELECT 
    Arrival_Destination, 
    COUNT(*) AS Arrivals_Count
FROM railway
GROUP BY Arrival_Destination
ORDER BY Arrivals_Count DESC;

SELECT 
    Purchase_Type, 
    COUNT(*) AS Ticket_Count,
    (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM railway)) AS Percentage
FROM railway
GROUP BY Purchase_Type;

SELECT 
    DATEPART(HOUR, Time_of_Purchase) AS Purchase_Hour,
    COUNT(*) AS Ticket_Count
FROM railway
GROUP BY DATEPART(HOUR, Time_of_Purchase)
ORDER BY Ticket_Count DESC;

SELECT 
    DATENAME(WEEKDAY, Date_of_Purchase) AS Purchase_Day,
    COUNT(*) AS Ticket_Count
FROM railway
GROUP BY DATENAME(WEEKDAY, Date_of_Purchase)
ORDER BY Ticket_Count DESC;


SELECT 
    Ticket_Class, 
    Ticket_Type, 
    ROUND(AVG(CAST(Price AS FLOAT)), 2) AS Avg_Ticket_Price
FROM railway
GROUP BY Ticket_Class, Ticket_Type
ORDER BY Ticket_Class, Avg_Ticket_Price DESC;

SELECT 
    Payment_Method, 
    ROUND(AVG(CAST(Price AS FLOAT)), 2) AS Avg_Ticket_Price,
    COUNT(*) AS Ticket_Count
FROM railway
GROUP BY Payment_Method
ORDER BY Avg_Ticket_Price DESC;


SELECT 
    Payment_Method, 
    Ticket_Type, 
    ROUND(AVG(CAST(Price AS FLOAT)), 2) AS Avg_Ticket_Price
FROM railway
GROUP BY Payment_Method, Ticket_Type
ORDER BY Payment_Method, Avg_Ticket_Price DESC;

SELECT 
    Reason_for_Delay, 
    COUNT(*) AS Delay_Count,
    ROUND((COUNT(*) * 100.0 / (SELECT COUNT(*) FROM railway WHERE Journey_Status = 'Delayed')), 2) AS Percentage
FROM railway
WHERE Journey_Status = 'Delayed'
GROUP BY Reason_for_Delay
ORDER BY Delay_Count DESC;




SELECT 
    DATEPART(HOUR, Departure_Time) AS Departure_Hour,
    COUNT(*) AS Total_Journeys,
    SUM(CASE WHEN Journey_Status = 'Delayed' THEN 1 ELSE 0 END) AS Delayed_Journeys,
    ROUND((SUM(CASE WHEN Journey_Status = 'Delayed' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)), 2) AS Delay_Percentage
FROM railway
GROUP BY DATEPART(HOUR, Departure_Time)
ORDER BY Delay_Percentage DESC;


SELECT 
    Purchase_Type, 
    ROUND(AVG(CAST(Price AS FLOAT)), 2) AS Avg_Ticket_Price,
    COUNT(*) AS Ticket_Count
FROM railway
GROUP BY Purchase_Type
ORDER BY Avg_Ticket_Price DESC;









