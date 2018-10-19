
/*
Queries:

/*1.	Write a query to display orders delivered on a current date.(currently their is no orders 
      on current date so it won't display anything).*/

    select * from ORDER_DELIVERY where DATE_TIMEDELIVERED=SYSDATE;
    
/*output:    no rows selected*/
/*==========================================================================================================================*/
/*2.Write a query to display orders delivered by employee id 1023.*/

  select * from ORDER_DELIVERY where DELIVEREDBY_EMPID=1023;
/*OUTPUT:
ORDER_ID             CUSTOMER_ID          DATE_TIMETAKEN DATE_TIMEDELIVERED VEHICLE_ID           STATUS_ID            DELIVEREDBY_EMPID  
-------------------- -------------------- -------------- ------------------ -------------------- -------------------- --------------------
O0004                330003               10-NOV-16      10-NOV-16          v002                 D                    1023                

/*===============================================================================================================================*/
/*3.	Write a query to display quantity of pizza order by 'Mark'.(customer_id of Mark is 330001)*/

    select count(order_id) from ORDER_DELIVERY where CUSTOMER_ID=330001;
/*    

                        COUNT(ORDER_ID)
---------------------------------------                                      3

*/
/*===========================================================================================================================*/


/*4.	Write a query to display order of 'Steve'.(order done by Steve is displayed by this 
    query and 330002 is the customer_id of Steve)*/

    select op.order_id,op.pizza_id,op.size_id,op.quantity,op.total_price 
    from ORDER_DETAILS_PIZZA op, ORDER_DELIVERY o
    where o.order_id=op.order_id AND o.CUSTOMER_ID=330002;

/*OUTPUT:
ORDER_ID             PIZZA_ID             SIZE_ID                QUANTITY  TOTAL_PRICE
-------------------- -------------------- -------------------- ---------- ------------
O0003                P012                 SP12                          2        32.98

*/
/*==============================================================================================================================*/

/*5.	Write a query to display those vehicles which are not available for delivery now.*/

    select vehicle_id, vehicle_desc from VEHICLE_DETAILS
    where VEHICLE_STATUS='Unavailable';
/*OUTPUT:
VEHICLE_ID           VEHICLE_DESC       
-------------------- --------------------
v003                 Toyota Camry a      
v004                 Nissan              
*/
/*================================================================================================================================*/

/*6.	List the pizzas which have price more than $15.(It displays the pizza name of those pizzas whose price is more than $15)*/

    select p.pizza_id,p.pizza_name from PIZZA_DETAILS p,PIZZA_PRICE_DETAILS pp 
    where p.pizza_id = pp.pizza_id AND pizza_price >= 15; 
/*OUTPUT:
PIZZA_ID             PIZZA_NAME         
-------------------- --------------------
P012                 medium chicken      
P013                 large chicken       
P033                 large pepperoni     
P031                 small pepperoni     
P032                 medium pepperoni    
P033                 large pepperoni     
P043                 l spicy italian     
P052                 m bbq chicken       
P053                 l bbq chicken       

 9 rows selected 
*/
/*===============================================================================================================================*/

/*7.	List all the pizzas which are available in medium size.*/

    select pizza_id,pizza_name from PIZZA_DETAILS  
    where pizza_name LIKE 'm%';
/*OUTPUT:
PIZZA_ID             PIZZA_NAME         
-------------------- --------------------
P012                 medium chicken      
P022                 m cheese pizza      
P032                 medium pepperoni    
P042                 m spicy italian     
P052                 m bbq chicken       
*/

/*==============================================================================================================================*/

/*8.	List all the employees who has delivered pizzas on 17th november,2016.  */  

    select e.emp_name 
    from employee e, ORDER_DELIVERY o
    where e.EMP_ID=o.DELIVEREDBY_EMPID AND o.DATE_TIMEDELIVERED='17-NOV-16';
/*
EMP_NAME           
--------------------
Tony                
Alex                
*/

/*9.	Write a query to display all details of the employee id 1036.*/

    select * from employee where EMP_ID=1036;
/*
EMP_ID               EMP_NAME             CONTACT              EMP_ADDRESS                                      
-------------------- -------------------- -------------------- --------------------------------------------------
1036                 Alex                 988-433-1036         88 Myrtle ave                                     
*/
/*==============================================================================================================================*/

/*10.	 List all the toppings.*/

    select TOPPING_NAME from TOPPINGS_DETAILS;
/*    
TOPPING_NAME       
--------------------
Shredded Cheese     
Jalapeno            
Olives              
Chicken             
Salami              
Onions              
Green Pepper        

 7 rows selected 
*/

/*=================================================================================================================================*/
/*11.	 Write a query to display number of orders who ordered 'chicken' as toppings. */ 

      select count(o.ORDER_ID) from TOPPINGS_DETAILS t 
      join ITEM_TOPPINGS_DETAILS i on t.TOPPING_ID=i.TOPPING_ID
      join ORDER_DETAILS_PIZZA o on i.ITEM_ID = o.ITEM_ID 
      where t.TOPPING_ID='T04';  
/*
                      COUNT(O.ORDER_ID)
---------------------------------------
                                      4

*/
/*================================================================================================================================*/
/* 12.	Write a query to display number of orders who has ordered 'Jalapeno' as 
      toppings from date 12th november,2016 to 16th november,2016.    */ 
     
      select count(o.order_id) from TOPPINGS_DETAILS t 
      join ITEM_TOPPINGS_DETAILS i ON t.TOPPING_ID = i.TOPPING_ID
      join ORDER_DELIVERY o ON i.ORDER_ID = o.ORDER_ID
      where t.TOPPING_NAME='Jalapeno' AND o.DATE_TIMEDELIVERED BETWEEN '12-NOV-16' AND '16-NOV-16';

/*
                      COUNT(O.ORDER_ID)
---------------------------------------
                                      2
*/
/*================================================================================================================================*/

/*13.  Write a query to display name of the customers who ordered pizza on 13th november,2016.*/

      select c.customer_name from CUSTOMER_DETAILS c 
      JOIN ORDER_DELIVERY o ON c.CUSTOMER_ID = o.CUSTOMER_ID
      where o.DATE_TIMEDELIVERED = '13-NOV-16';
/*
CUSTOMER_NAME      
--------------------
Rocky               
Niraj               
*/
/*====================================================================================================================================*/

/*14.	 Write a query to display order-ID and Status description of the orders who are 'In Process' on current time.*/

      select o.ORDER_ID,s.STATUS_DESC from ORDER_DELIVERY o,STATUS s 
      where o.STATUS_ID = s.STATUS_ID AND s.STATUS_DESC='In Process';
/*
ORDER_ID             STATUS_DESC        
-------------------- --------------------
O0011                In Process          

*/

/*=========================================================================================================================================*/
/*15.   Write a query to display number of orders who got 4 ratings for service on 17th november,2016.*/

      select count(o.ORDER_ID) from ORDER_DELIVERY o 
      JOIN FEEDBACK f on o.ORDER_ID=f.ORDER_ID 
      where f.SERVICE_RATING=4 AND o.DATE_TIMEDELIVERED='17-NOV-16'
      GROUP BY o.ORDER_ID;
/*

                      COUNT(O.ORDER_ID)
---------------------------------------
                                      1

*/

/* Procedure */

CREATE OR REPLACE PROCEDURE PROC_CUSTOMER_DETAILS
IS
    cid VARCHAR2(20);
    c_name varchar2(20);
    mobile VARCHAR2(20);
    email VARCHAR2(20);
    address VARCHAR2(50);
    
BEGIN
    SELECT CUSTOMER_ID ,CUSTOMER_NAME ,MOBILE_NO ,EMAIL_ID ,CUSTOMER_ADDRESS  
    INTO cid,c_name,mobile,email,address 
    FROM Customer_Details
    WHERE CUSTOMER_ID = '330006';
    
    DBMS_OUTPUT.PUT_LINE('Customer ID: '||cid );
    DBMS_OUTPUT.PUT_LINE('Customer Name: '||c_name );
    DBMS_OUTPUT.PUT_LINE('Mobile No: '|| mobile);
    DBMS_OUTPUT.PUT_LINE('Email ID: '|| email );
    DBMS_OUTPUT.PUT_LINE('Address: '||address );
    
END PROC_CUSTOMER_DETAILS;







    





      




