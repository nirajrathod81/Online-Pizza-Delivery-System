
CREATE TABLE Order_Delivery(
   Order_ID VARCHAR2(20) NOT NULL,
   Customer_ID VARCHAR2(20) NOT NULL,
   Date_TimeTaken DATE,
   Date_TimeDelivered DATE,
   Vehicle_ID VARCHAR2(20),
   Status_ID VARCHAR2(20) NOT NULL  
);

ALTER TABLE Order_Delivery 
ADD CONSTRAINT pk_order_id PRIMARY KEY (Order_ID);

CREATE TABLE Order_Details_Pizza(
   Item_ID VARCHAR2(20) NOT NULL,
   Order_ID VARCHAR2(20) NOT NULL,
   Pizza_ID VARCHAR2(20) NOT NULL,
   Size_ID VARCHAR2(20) NOT NULL,
   Quantity INT,
   Total_Price INT NOT NULL
);

ALTER TABLE Order_Details_Pizza 
ADD CONSTRAINT pk_item_id PRIMARY KEY (Item_ID);



CREATE TABLE Customer_Details(
   Customer_ID VARCHAR2(20) NOT NULL,
   Customer_Name VARCHAR2(20) NOT NULL,
   Mobile_No VARCHAR2(20) NOT NULL,
   Email_ID VARCHAR2(20),
   Customer_Address VARCHAR2(50)
);

ALTER TABLE Customer_Details 
ADD CONSTRAINT pk_customer_id PRIMARY KEY (Customer_ID);


CREATE TABLE Employee(
   Emp_ID VARCHAR2(20) NOT NULL,
   Emp_Name VARCHAR2(20) NOT NULL,
   Contact VARCHAR2(20) ,
   Emp_Address VARCHAR2(50)   
);


ALTER TABLE Employee   
ADD CONSTRAINT pk_emp_id PRIMARY KEY (Emp_ID);

CREATE TABLE Vehicle_Details(
   Vehicle_ID VARCHAR2(20) NOT NULL,
   Vehicle_Desc VARCHAR2(20),
   Vehicle_Status VARCHAR2(20)
);

ALTER TABLE Vehicle_Details   
ADD CONSTRAINT pk_vehicle_id PRIMARY KEY (Vehicle_ID);

CREATE TABLE Status(
   Status_ID VARCHAR2(20) NOT NULL,
   Status_Desc VARCHAR2(20)
);

ALTER TABLE Status   
ADD CONSTRAINT pk_status_id PRIMARY KEY (Status_ID);


CREATE TABLE Feedback(
   Order_ID VARCHAR2(20) NOT NULL,
   Service_Rating INT,
   FoodQuality_Rating INT
);

CREATE TABLE Item_Toppings_Details(
   Order_ID VARCHAR2(20),
   Item_ID VARCHAR2(20),
   Topping_ID VARCHAR2(20)
);

CREATE TABLE Toppings_Details(
   Topping_ID VARCHAR2(20) NOT NULL,
   Topping_Name VARCHAR2(20)
);

ALTER TABLE Toppings_Details   
ADD CONSTRAINT pk_topping_id PRIMARY KEY (Topping_ID);

CREATE TABLE Toppings_Price_Details(
   Size_ID VARCHAR2(20) NOT NULL,
   Topping_ID VARCHAR2(20) NOT NULL,
   Topping_Price NUMERIC(10,2) 
);

alter table Order_Details_Pizza 
modify 
( 
   Total_Price NUMERIC(10,2)
);

CREATE TABLE Pizza_Details(
   Pizza_ID VARCHAR2(20) NOT NULL,
   Pizza_Name VARCHAR2(20) 
);

ALTER TABLE Pizza_Details   
ADD CONSTRAINT pk_pizza_id PRIMARY KEY (Pizza_ID);


CREATE TABLE Pizza_Price_Details(
   Pizza_ID VARCHAR2(20) NOT NULL,
   Size_ID VARCHAR2(20), 
   Pizza_Price VARCHAR2(20) 
);

alter table Pizza_Price_Details 
modify 
( 
   Pizza_Price NUMERIC(10,2)
);


CREATE TABLE Size_Details(
   Size_ID VARCHAR2(20) NOT NULL,
   Size_Desc VARCHAR2(20) 
);

ALTER TABLE Size_Details   
ADD CONSTRAINT pk_size_id PRIMARY KEY (Size_ID);

commit;


ALTER TABLE Order_Delivery
ADD CONSTRAINT fk_cust_id FOREIGN KEY(Customer_ID) REFERENCES CUSTOMER_DETAILS(CUSTOMER_ID);


alter table Order_Delivery
add DeliveredBy_empID VARCHAR2(20);


ALTER TABLE Order_Delivery
ADD CONSTRAINT fk_emp_id FOREIGN KEY(DeliveredBy_empID) REFERENCES Employee(Emp_ID);


ALTER TABLE Order_Delivery
ADD CONSTRAINT fk_vehicle_id FOREIGN KEY(Vehicle_ID) REFERENCES Vehicle_Details(Vehicle_ID);

ALTER TABLE Status
ADD CONSTRAINT fk_status_id FOREIGN KEY(Status_ID) REFERENCES Status(Status_ID);

ALTER TABLE Order_Details_Pizza
ADD CONSTRAINT fk_orderD_pizzaD_PizzaID FOREIGN KEY(Pizza_ID) REFERENCES Pizza_Details(Pizza_ID);

ALTER TABLE Order_Details_Pizza
ADD CONSTRAINT fk_orderD_SizeD_SID FOREIGN KEY(Size_ID) REFERENCES Size_Details(Size_ID);

ALTER TABLE Feedback
ADD CONSTRAINT fk_feedback_OID FOREIGN KEY(Order_ID) REFERENCES Order_Delivery(Order_ID);

ALTER TABLE Item_Toppings_Details
ADD CONSTRAINT fk_itemToppingsD_OID FOREIGN KEY(Order_ID) REFERENCES Order_Delivery(Order_ID);

ALTER TABLE Item_Toppings_Details
ADD CONSTRAINT fk_itemToppings_IID FOREIGN KEY(Item_ID) REFERENCES Order_Details_Pizza(Item_ID);

ALTER TABLE Item_Toppings_Details
ADD CONSTRAINT fk_itemToppingsD_TID FOREIGN KEY(Topping_ID) REFERENCES Toppings_Details(Topping_ID);

ALTER TABLE Toppings_Price_Details
ADD CONSTRAINT fk_ToppingsPriceD_TID FOREIGN KEY(Topping_ID) REFERENCES Toppings_Details(Topping_ID);

ALTER TABLE Pizza_Price_Details
ADD CONSTRAINT fk_PizzaPriceD_PID FOREIGN KEY(Pizza_ID) REFERENCES Pizza_Details(Pizza_ID);

ALTER TABLE Pizza_Price_Details
ADD CONSTRAINT fk_PizzaPriceD_SID FOREIGN KEY(Size_ID) REFERENCES Size_Details(Size_ID);




commit;



