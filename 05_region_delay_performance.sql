-- Purpose: Analyze destination region-wise delay performance
-- Business Impact: Identifies high-risk regions and helps optimize routing,
-- capacity planning, and regional operations strategy

USE transportation_network;

SELECT 
	d.region,
    COUNT(*) AS total_shipments,
    SUM(status = 'Delayed') AS delayed_shipments,
    ROUND(
		SUM(status = 'Delayed') / COUNT(*) * 100, 2
	) AS delay_percentage
    
FROM shipments s
JOIN cities o
	ON s.origin_city_id = o.city_id
JOIN cities d
	ON s.destination_city_id = d.city_id
    
WHERE status IN ('On Time', 'Delayed')
GROUP BY d.region
ORDER BY delay_percentage DESC;