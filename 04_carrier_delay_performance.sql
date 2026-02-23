-- Purpose: Identify carrier-wise delay performance
-- Business Impact: Helps identify underperforming carriers and 
-- supports operational improvement and contract decisions

USE transportation_network;

SELECT 
    c.carrier_name,
    COUNT(*) AS total_orders,
    SUM(status = 'Delayed') AS delayed_orders,
    ROUND(
		SUM(status = 'Delayed') / COUNT(*) * 100, 2
	) AS delay_percentage
    
FROM shipments s
JOIN carriers c
    USING (carrier_id)
    
WHERE status IN ('On Time', 'Delayed')
GROUP BY c.carrier_name
ORDER BY delay_percentage DESC;
