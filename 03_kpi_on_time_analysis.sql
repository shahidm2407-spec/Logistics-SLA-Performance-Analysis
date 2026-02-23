-- Purpose: To calculate overall On-Time Delivery Performance (SLA Compliance)
-- Business Impact: Helps monitor network reliability and identify service risks.

USE transportation_network;

SELECT 
    COUNT(*) AS total_completed_shipments,
    
    SUM(CASE 
            WHEN status = 'On Time' THEN 1 
            ELSE 0 
        END) AS on_time_shipments,
        
    ROUND(
        SUM(CASE 
                WHEN status = 'On Time' THEN 1 
                ELSE 0 
            END) * 100.0 / COUNT(*),
    2) AS on_time_percentage

FROM shipments
WHERE status IN ('On Time', 'Delayed');