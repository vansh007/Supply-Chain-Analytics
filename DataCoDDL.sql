drop database datacodb;
drop table Customers,Categories,Departments,Products,Shipments,Orders,OrderLine;

Create DATABASE IF NOT EXISTS DataCoDB;

use DataCoDB;
 
Create table if not exists Customers(
id int auto_increment,
cust_id int,
cust_first_name varchar(50),
cust_last_name varchar(30),
cust_email varchar(50),
cust_segment varchar(50),
cust_street varchar(50),
cust_state char(2),
cust_zipcode int,
cust_country varchar(20),
sales_per_customer decimal,
cust_city varchar(20),
Primary key(id)
);

-- desc Customers;
Create table if not exists Categories(
Category_id int,
Category_name varchar(30),
Primary key(Category_id)
); 

drop table customers;

Create table if not exists Departments(
Department_id int,
Department_name varchar(20),
Latitude decimal, 
Longitude decimal, 
Market varchar(20),
Category_id int,
primary key(Department_id),
foreign key(Category_id) references Categories(Category_id)
);

Create table if not exists Products(
Product_CardId int, 
Product_Category_id int,
Product_Description varchar(50),
Product_Image varchar(100),
Product_Name varchar(25),
Product_Price NUMERIC(11, 8),
Product_Status int,
primary key(Product_CardID),
foreign key(Product_Category_id) references Categories(Category_id) 
);

Create table if not exists Shipments(
shipment_id int not null auto_increment,
Days_for_shipping_real int,
Days_for_shipment_scheduled int,
shipping_date DATETIME, 
Shipping_Mode varchar(30),
primary key(shipment_id)
);

Create table if not exists Orders(
OrderID int, 
Order_Country varchar(20),
Order_state varchar(36),
Order_city varchar(20),
Order_date DATE,
order_status varchar(15),
order_sales decimal,
profit_per_order decimal, 
transaction_type varchar(15),
cust_id int,
product_id int,
shipment_id int,
primary key(orderID),
-- foreign key(cust_id) references Customers(cust_id),
foreign key(product_id) references Products(Product_Cardid),
foreign key(shipment_id) references shipments(shipment_id)
);

Create table if not exists OrderLine(
Orderitem_Id int,
Orderitem_Cardprod_Id int,
Orderitem_Discount decimal,
Orderitem_Discount_Rate decimal,
Orderitem_Product_Price decimal,
Orderitem_Profit_Ratio decimal,
Orderitem_Quantity int,
Sales decimal,
Orderitem_total decimal,
Order_id int,
primary key(Orderitem_Id),
foreign key(order_id) references Orders(OrderID)
);