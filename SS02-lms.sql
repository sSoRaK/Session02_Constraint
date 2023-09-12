create database QuanLyBanHang;
use QuanLyBanHang;

create table Customer(
	Customer_id char(4) primary key,
    Customer_name varchar(50) not null,
    Customer_age int default 18
);
alter table Customer 
add constraint Customer_id unique (Customer_id);

create table Orders(
	Order_id int auto_increment primary key,
    Customer_id char(4) not null,
    foreign key (Customer_id) references Customer(Customer_id),
    Oder_date date default (now()),
    Order_Total_Price float 
);
alter table Orders
add constraint Order_id unique (Order_id);

create table Product(
	Product_id char(4) primary key,
    Product_name varchar(100) not null,
    Product_price float
);
create table Order_Detail(
	Order_id int auto_increment,
    Product_id char(4),
    primary key(Order_id, Product_id),
    foreign key (Order_id) references Orders(Order_id),
    foreign key (Product_id) references Product(Product_id),
    Order_quantity int default 0
)
