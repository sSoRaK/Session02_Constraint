create database session_02;
use session_02;

create table Product(
	product_id char(5) primary key,
    product_name varchar(100) not null unique,
    price float check( price >0 ),
    descriptions text not null,
    product_status bit default 1
);
create table Orders(
	order_id int auto_increment,
    created date default (current_date()), -- curdate(), now()
    total_amount float,
    order_status bit default 0,
    primary key(order_id)
);
create table Oder_Detail(
	product_id char(5),
	order_id int,
    primary key(product_id, order_id),
    foreign key (product_id) references Product(product_id),
    foreign key (order_id) references Orders(order_id),
	price float,
    quantity int,
    amount FLOAT generated always as (price * quantity) stored -- tính tự động giá trị amount
);
-- select product_id, order_id, price, quantity, price * quantity as amount
--  from Order_Detail;