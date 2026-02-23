-- 		** Creating the Database **

-- If any database with the same name already exists, then we drop it first
DROP DATABASE IF EXISTS transportation_network;
CREATE DATABASE transportation_network;

-- Selecting the Database to write queries against it
USE transportation_network;


-- 		** Creating the tables **

-- Creating the cities table with 3 columns
CREATE TABLE cities (
		city_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
        city_name VARCHAR(50) NOT NULL,
        region VARCHAR(20)
    );
    
-- Creating the carriers table with 4 columns
CREATE TABLE carriers (
		carrier_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
        carrier_name VARCHAR(100) NOT NULL,
        carrier_type VARCHAR(20),	-- Air / Surface
        cost_per_km DECIMAL(6, 2)
	);
    
-- Creating the delay_reasons table with 3 columns
CREATE TABLE delay_reasons (
		delay_code VARCHAR(10) PRIMARY KEY NOT NULL,
        delay_reason VARCHAR(100) NOT NULL,
        category VARCHAR(20)	-- Internal / External
	);
    
-- Creating the shipments(main) table with 9 columns
CREATE TABLE shipments (
		shipment_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
        origin_city_id INT NOT NULL,
        destination_city_id INT NOT NULL,
        carrier_id INT NOT NULL,
        ship_date DATE NOT NULL,
        expected_delivery_date DATE,
        actual_delivery_date DATE,
        delay_code VARCHAR(10),
        status VARCHAR(50),
        
        FOREIGN KEY (origin_city_id) REFERENCES cities(city_id),
        FOREIGN KEY (destination_city_id) REFERENCES cities(city_id),
        FOREIGN KEY (carrier_id) REFERENCES carriers(carrier_id),
        FOREIGN KEY (delay_code) REFERENCES delay_reasons(delay_code)
	);