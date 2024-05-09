
-- Create tables
CREATE TABLE agents (
    agent_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(255),
    phone VARCHAR(20)
);

CREATE TABLE properties (
    property_id INT AUTO_INCREMENT PRIMARY KEY,
    agent_id INT,
    title VARCHAR(255),
    description TEXT,
    price DECIMAL(10,2),
    property_type VARCHAR(50),
    status VARCHAR(50),
    location VARCHAR(255),
    FOREIGN KEY (agent_id) REFERENCES agents(agent_id)
);

CREATE TABLE clients (
    client_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(255),
    phone VARCHAR(20)
);

CREATE TABLE viewings (
    viewing_id INT AUTO_INCREMENT PRIMARY KEY,
    property_id INT,
    client_id INT,
    viewing_date DATE,
    status VARCHAR(100),
    FOREIGN KEY (property_id) REFERENCES properties(property_id),
    FOREIGN KEY (client_id) REFERENCES clients(client_id)
);

CREATE TABLE transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    property_id INT,
    client_id INT,
    transaction_type VARCHAR(50),
    transaction_date DATE,
    price DECIMAL(10,2),
    FOREIGN KEY (property_id) REFERENCES properties(property_id),
    FOREIGN KEY (client_id) REFERENCES clients(client_id)
);

CREATE TABLE property_reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    property_id INT,
    client_id INT,
    rating INT,
    comment TEXT,
    review_date DATE,
    FOREIGN KEY (property_id) REFERENCES properties(property_id),
    FOREIGN KEY (client_id) REFERENCES clients(client_id)
);

-- Example Advanced SQL Features
-- Trigger to update property status after a transaction
DELIMITER $$
CREATE TRIGGER after_transaction_complete
AFTER INSERT ON transactions FOR EACH ROW
BEGIN
    UPDATE properties
    SET status = CASE
        WHEN NEW.transaction_type = 'sale' THEN 'sold'
        WHEN NEW.transaction_type = 'rent' THEN 'rented'
    END
    WHERE property_id = NEW.property_id;
END$$
DELIMITER ;

-- View for properties listed by an agent
CREATE VIEW agent_listings AS
SELECT a.first_name, a.last_name, p.title, p.status, p.price
FROM agents a
JOIN properties p ON a.agent_id = p.agent_id;

-- Stored Procedure for calculating total sales by an agent
DELIMITER $$
CREATE PROCEDURE TotalSalesByAgent(IN agentID INT)
BEGIN
    SELECT a.first_name, a.last_name, SUM(t.price) AS total_sales
    FROM agents a
    JOIN properties p ON a.agent_id = p.agent_id
    JOIN transactions t ON p.property_id = t.property_id
    WHERE a.agent_id = agentID AND t.transaction_type = 'sale'
    GROUP BY a.agent_id;
END$$
DELIMITER ;
