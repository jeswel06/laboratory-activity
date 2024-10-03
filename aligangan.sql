Create database aliganga_it2b;
Use aliganga_it2b;


CREATE TABLE Authors(
  author_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

CREATE TABLE Customers(
customer_id INT AUTO_INCREMENT PRIMARY KEY,
First_name VARCHAR(50),
Last_name VARCHAR(50),
email VARCHAR (100) UNIQUE
);


CREATE TABLE Books(
book_id INT AUTO_INCREMENT PRIMARY KEY,
title VARCHAR(100),
author_id INT,
price DECIMAL(10,2),
FOREIGN KEY (author_id)
REFERENCES Authors (author_id)
);

CREATE TABLE Orders(
order_id INT AUTO_INCREMENT PRIMARY KEY,
order_date DATE,
customer_id INT,
amount DECIMAL (10,2),
FOREIGN KEY (customer_id)
REFERENCES Customers(customer_id)
);

CREATE TABLE Order_Items(
order_item_id INT AUTO_INCREMENT PRIMARY KEY,
order_id INT,
book_id INT,
quantity INT,
FOREIGN KEY (order_id)
REFERENCES Orders(order_id),
FOREIGN KEY(book_id)
REFERENCES Books(book_id)
);

INSERT INTO Authors (first_name,  last_name)
VALUES ('Jk', 'Rowling'),
('Sponge', 'Bob'),
('Steven', 'Code');

INSERT INTO Customers(First_name, Last_name, email)
VALUES ('John', 'Doe', 'John@example.com'),
('Jane', 'Smith', 'Jane@example.com'),
('Alice', 'Johnson', 'Alice@example.com');

INSERT INTO Books(title, author_id, price)
VALUES
('BOOK A', 1, '50.00'),  
    ('BOOK B', 2, '70.00'),  
    ('BOOK C', 3, '150.00');

INSERT INTO Orders(order_date, customer_id, amount)
VALUES ('2023-10-01', 1, '250.00'),
('2023-10-05', 2, '150.00'),
('2023-10-12', 1, '200.00'),
('2023-10-14', 3, '300.00');

 INSERT INTO Order_Items(order_id, book_id, quantity)
 VALUES(1, 1, 2),
 (1, 2, 1),
 (2, 3, 1),
(3, 1, 1),
(4, 2, 3);

SELECT
    o.order_id,
    c.First_name AS customer_first_name,
    c.Last_name,
    b.title,
    b.price,
    a.first_name AS author_first_name,
    a.last_name AS author_last_name,
    oi.quantity,
    o.amount
FROM Orders o
INNER JOIN Customers c ON o.customer_id = c.customer_id
INNER JOIN Order_Items oi ON o.order_id = oi.order_id
INNER JOIN Books b ON oi.book_id = b.book_id
INNER JOIN Authors a ON b.author_id = a.author_id;

