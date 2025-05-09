CREATE DATABASE WOODCHUCK_JSON_PRODUCTS;
USE WOODCHUCK_JSON_PRODUCTS;

CREATE TABLE WOODCHUCK_JSON_PRODUCTS.PUBLIC.td_products(
    record_id INT AUTOINCREMENT,
    product_json VARIANT
)

INSERT INTO WOODCHUCK_JSON_PRODUCTS.PUBLIC.td_products(product_json)
SELECT TRY_PARSE_JSON('{
	  "productId": "SNW-WIDGET-001",
	  "productName": "Snowflake Super Widget",
	  "category": "Widgets",
	  "isActive": true,
	  "price": 199.99,
	  "features": [
		{"name": "Durability", "rating": 5},
		{"name": "Speed", "rating": 4},
		{"name": "Ease of Use", "rating": null}
	  ],
	  "dimensions": {
		"length_cm": 25.5,
		"width_cm": 10.0,
		"height_cm": 5.2
	  },
	  "stock": {
		"warehouse_A": 150,
		"warehouse_B": 75
	  },
	  "notes": null,
	  "internal-code": "WIDG-ALPHA"
	}');


SELECT product_json['features'][0]['name'] FROM td_products
WHERE record_id = 301
    
SELECT product_json['productName'] FROM td_products
WHERE record_id = 301