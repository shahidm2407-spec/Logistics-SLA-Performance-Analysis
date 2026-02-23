-- Purpose: Analyze monthly SLA trend over time
-- Business Impact: Enables performance tracking, trend detection, 
-- and proactive operational planning

USE transportation_network;

SELECT 
    DATE_FORMAT(ship_date, '%Y-%m') AS month,
    COUNT(*) AS total_shipments,
    SUM(status = 'Delayed') AS delayed_shipments,
    ROUND(
        SUM(status = 'Delayed') / COUNT(*) * 100, 2
    ) AS delay_percentage
    
FROM shipments
WHERE status IN ('On Time', 'Delayed')
GROUP BY DATE_FORMAT(ship_date, '%Y-%m')
ORDER BY month;