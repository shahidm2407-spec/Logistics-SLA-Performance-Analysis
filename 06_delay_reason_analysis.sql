-- Purpose: Identify top delay reasons across shipments
-- Business Impact: Helps prioritize operational improvements by 
-- highlighting the most frequent causes of delivery delays

USE transportation_network;

SELECT 
	dr.delay_reason,
    COUNT(*) AS occurrences
    
FROM shipments s
JOIN delay_reasons dr
	USING (delay_code)
    
WHERE status = 'Delayed'
GROUP BY dr.delay_reason
ORDER BY occurrences DESC;