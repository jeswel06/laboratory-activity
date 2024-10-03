
create table customers(
customer_id int auto_increment primary key,
first_name varchar(50),
last_name varchar (50),
email varchar(100)
);

create table books(
book_id int auto_increment primary key,
title varchar (100),
author_id int,
price decimal(10,2),
foreign key (author_id) references authors(author_id)

);

create table authors(
author_id int auto_increment primary key,
first_name varchar (50),
last_name varchar (50)
);

create table orders(
order_id int auto_increment primary key,
order_date DATE,
customer_id int,
amount decimal (10,2),
foreign key (customer_id) references customers(customer_id)
);

create table order_items(
order_item_id int auto_increment primary key,
order_id int,
book_id int,
quantity int,
foreign key (order_id) references orders(order_id),
foreign key (book_id) references books(book_id)
);

select * from customers;
select * from books;
select * from authors;
select * from orders;
select * from order_items;

insert into customers(first_name, last_name, email)
values ('John','Doe', 'john@gmail.com'),
        ('Jane' , 'Smith', 'jane@gmail.com'),
        ('Alice', 'johnson', 'alice@gmail.com');
       
insert into books(title,author_id,price)
values ('Book A','1', 50.00),
  ('Book B','2',70.00),
       ('Book C','3',150.00);
       
insert into authors(first_name, last_name)
values ('JK', 'Rowling'),
       ('Sponge', 'Bob'),
       ('Storm', 'Code');

INSERT INTO orders (order_date, customer_id, amount)
VALUES
('2023-10-01', 1, 250.00),  
('2023-10-05', 2, 750.00),  
('2023-10-12', 3, 200.00);
       
INSERT INTO order_items (order_id, book_id, quantity)
VALUES
(5, 7, 2),  
(6, 8, 1),
(7, 9, 1);  

SELECT
    o.order_id,
    c.first_name AS customer_firstname,
    c.last_name,
    b.title,
    b.price,
    a.first_name AS author_firstname,
    a.last_name AS author_lastname,
    oi.quantity,
    o.amount
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
INNER JOIN order_items oi ON o.order_id = oi.order_id
INNER JOIN books b ON oi.book_id = b.book_id
INNER JOIN authors a ON b.author_id = a.author_id;
















