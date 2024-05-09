# Real Estate Database

This project is a relational database designed for managing various aspects of a real estate system. It includes tables for products, customers, orders, order items, reviews, and users.

## Tables

### Products
- `product_id`: Unique identifier for each product.
- `product_name`: Name of the product.
- `price`: Price of the product.
- `stock_quantity`: Quantity of the product in stock.
- `category`: Category of the product.

### Customers
- `customer_id`: Unique identifier for each customer.
- `first_name`: First name of the customer.
- `last_name`: Last name of the customer.
- `email`: Email address of the customer.
- `password_hash`: Hashed password of the customer.

### Orders
- `order_id`: Unique identifier for each order.
- `customer_id`: ID of the customer who placed the order.
- `order_date`: Date when the order was placed.
- `status`: Current status of the order.

### Order Items
- `order_item_id`: Unique identifier for each order item.
- `order_id`: ID of the order to which the item belongs.
- `product_id`: ID of the product in the order.
- `quantity`: Quantity of the product ordered.
- `price_at_time_of_order`: Price of the product at the time of ordering.

### Reviews
- `review_id`: Unique identifier for each review.
- `product_id`: ID of the product being reviewed.
- `customer_id`: ID of the customer who wrote the review.
- `rating`: Rating given by the customer.
- `comment`: Text comment provided by the customer.
- `review_date`: Date when the review was written.

### Users
- `user_id`: Unique identifier for each user.
- `username`: Username of the user.
- `password_hash`: Hashed password of the user.
- `role`: Role or privileges of the user.

## Usage

To use this database, you can import the provided SQL script into your preferred database management system (DBMS), such as MySQL or PostgreSQL. Once imported, you can interact with the database using SQL queries or integrate it into your application.

## Contributing

Contributions are welcome! If you find any issues or have suggestions for improvements, please open an issue or submit a pull request.


