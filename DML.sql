

insert into Employee Values ('1021','Sam','988-433-1021','12 Fairfield ave, Bridgeport');

insert into Employee Values ('1022','Tony','988-433-1022','45 Rennel Street');

insert into Employee Values ('1023','Tim','988-433-1023','5 Johns Street');

insert into Employee Values ('1024','Karen','988-433-1024','10 Bernard Street');

insert into Employee Values ('1025','Rick','988-433-1025','67 Park ave');

insert into Employee Values('1036','Alex','988-433-1036','88 Myrtle ave');

select * from employee;

insert into CUSTOMER_DETAILS Values('330001','Mark','988-101-1001','mark@mail.com','2 Atlantic Street');

insert into CUSTOMER_DETAILS Values('330002','Steve','988-101-1012','steve@gmail.com','22 Lafayyete Street');

insert into CUSTOMER_DETAILS Values('330003','Richard','988-101-1065','richard@gmail.com','45 Fairfield Street');

insert into CUSTOMER_DETAILS Values('330004','Will','988-101-3098','will@gmail.com','32 Main Street');

insert into CUSTOMER_DETAILS Values('330005','Rocky','988-101-0978','rocky@gmail.com','2 East Street');

insert into CUSTOMER_DETAILS Values('330006','Niraj','988-101-6016','niraj@gmail.com','520 Atlantic Street');

insert into CUSTOMER_DETAILS Values('330007','Raj','988-101-6098','raj@gmail.com','98 Gregory Street');

select * from CUSTOMER_DETAILS;

insert into VEHICLE_DETAILS Values('v001','Honda Civic','Available');

insert into VEHICLE_DETAILS Values('v002','Jeep','Available');

insert into VEHICLE_DETAILS Values('v003','Toyota Camry a','Unavailable');

insert into VEHICLE_DETAILS Values('v004','Nissan','Unavailable');

insert into VEHICLE_DETAILS Values('v005','Toyota Camry b','Available');

select * from VEHICLE_DETAILS;

insert into SIZE_DETAILS Values('s','small');

insert into SIZE_DETAILS Values('m','medium');

insert into SIZE_DETAILS Values('l','large');

select * from SIZE_DETAILS;

insert into TOPPINGS_DETAILS Values('T01','Shredded Cheese');

insert into TOPPINGS_DETAILS Values('T02','Jalapeno');

insert into TOPPINGS_DETAILS Values('T03','Olives');

insert into TOPPINGS_DETAILS Values('T04','Chicken');

insert into TOPPINGS_DETAILS Values('T05','Salami');

insert into TOPPINGS_DETAILS Values('T06','Onions');

insert into TOPPINGS_DETAILS Values('T07','Green Pepper');

insert into TOPPINGS_DETAILS Values('T08','Red Pepper');

select * from TOPPINGS_DETAILS;

insert into STATUS Values('P','In Process');

insert into STATUS Values('D','Delivered');

insert into STATUS Values('C','Cancel');

select * from STATUS;

delete from SIZE_DETAILS;

select * from SIZE_DETAILS;

insert into SIZE_DETAILS Values('SP11','small chicken pizza');

insert into SIZE_DETAILS Values('SP12','medium chicken pizza');

insert into SIZE_DETAILS Values('SP13','large chicken pizza');

insert into SIZE_DETAILS Values('SP21','small cheese pizza');

insert into SIZE_DETAILS Values('SP22','medium cheese pizza');

insert into SIZE_DETAILS Values('SP23','large cheese pizza');

insert into SIZE_DETAILS Values('SP31','small pepperoni');

insert into SIZE_DETAILS Values('SP32','medium pepperoni');
insert into SIZE_DETAILS Values('SP33','large pepperoni');

SELECT * FROM SIZE_DETAILS;

insert into SIZE_DETAILS Values('SP41','s spicy italian');

insert into SIZE_DETAILS Values('SP42','m spicy italian');

insert into SIZE_DETAILS Values('SP43','L spicy italian');

insert into SIZE_DETAILS Values('SP51','s bbq chicken');
insert into SIZE_DETAILS Values('SP52','m bbq chicken');

insert into SIZE_DETAILS Values('SP53','L bbq chicken');

insert into SIZE_DETAILS Values('ST01','shredded cheese');

insert into SIZE_DETAILS Values('ST02','jalapeno');

insert into SIZE_DETAILS Values('ST03','olives');

insert into SIZE_DETAILS Values('ST04','chicken');

insert into SIZE_DETAILS Values('ST05','salami');

insert into SIZE_DETAILS Values('ST06','onions');

insert into SIZE_DETAILS Values('ST07','green pepper');

insert into PIZZA_DETAILS Values('P011','small chicken');

insert into PIZZA_DETAILS Values('P012','medium chicken');
insert into PIZZA_DETAILS Values('P013','large chicken');
insert into PIZZA_DETAILS Values('P021','small cheese pizza');
insert into PIZZA_DETAILS Values('P022','m cheese pizza');
insert into PIZZA_DETAILS Values('P023','l cheese pizza');

insert into PIZZA_DETAILS Values('P031','small pepperoni');
insert into PIZZA_DETAILS Values('P032','medium pepperoni');
insert into PIZZA_DETAILS Values('P033','large pepperoni');
insert into PIZZA_DETAILS Values('P041','s spicy italian');
insert into PIZZA_DETAILS Values('P042','m spicy italian');
insert into PIZZA_DETAILS Values('P043','l spicy italian');
insert into PIZZA_DETAILS Values('P051','s bbq chicken');
insert into PIZZA_DETAILS Values('P052','m bbq chicken');
insert into PIZZA_DETAILS Values('P053','l bbq chicken');

insert into TOPPINGS_PRICE_DETAILS Values('ST01','T01','2.99');
insert into TOPPINGS_PRICE_DETAILS Values('ST02','T02','1.99');
insert into TOPPINGS_PRICE_DETAILS Values('ST03','T03','1.99');
insert into TOPPINGS_PRICE_DETAILS Values('ST04','T04','3.99');
insert into TOPPINGS_PRICE_DETAILS Values('ST05','T05','3.49');
insert into TOPPINGS_PRICE_DETAILS Values('ST06','T06','1.99');
insert into TOPPINGS_PRICE_DETAILS Values('ST07','T07','1.99');


SELECT * FROM TOPPINGS_PRICE_DETAILS;

commit;

insert into PIZZA_PRICE_DETAILS Values('P011','SP11','10.49');
insert into PIZZA_PRICE_DETAILS Values('P012','SP12','16.49');
insert into PIZZA_PRICE_DETAILS Values('P013','SP13','21.49');
insert into PIZZA_PRICE_DETAILS Values('P021','SP21','9.49');
insert into PIZZA_PRICE_DETAILS Values('P022','SP22','14.49');
insert into PIZZA_PRICE_DETAILS Values('P033','SP23','18.49');
insert into PIZZA_PRICE_DETAILS Values('P031','SP31','15.49');
insert into PIZZA_PRICE_DETAILS Values('P032','SP32','19.49');
insert into PIZZA_PRICE_DETAILS Values('P033','SP33','23.49');
insert into PIZZA_PRICE_DETAILS Values('P041','SP41','9.49');
insert into PIZZA_PRICE_DETAILS Values('P042','SP42','14.49');
insert into PIZZA_PRICE_DETAILS Values('P043','SP43','18.49');
insert into PIZZA_PRICE_DETAILS Values('P051','SP51','10.49');
insert into PIZZA_PRICE_DETAILS Values('P052','SP52','16.49');
insert into PIZZA_PRICE_DETAILS Values('P053','SP53','21.49');


/*------ Simple Trigger-------*/

SET SERVEROUTPUT ON;
CREATE OR REPLACE TRIGGER Trig_Order_Delivery
BEFORE INSERT ON Order_Delivery
FOR EACH ROW
ENABLE
DECLARE
  v_user VARCHAR2(20);
BEGIN
	SELECT user INTO v_user FROM dual;
	DBMS_OUTPUT.PUT_LINE('You just got an order for delivery by user: ' ||v_user);
END;
/

/* Procedure */



insert into ORDER_DELIVERY Values('O0001','330001','16-MAR-2015','16-MAR-2015','v005','D','1036');
insert into ORDER_DELIVERY Values('O0002','330007','16-MAR-2015','16-MAR-2015','v005','D','1021');
insert into ORDER_DELIVERY Values('O0003','330002','10-NOV-2016','10-NOV-2016','v001','D','1022');
insert into ORDER_DELIVERY Values('O0004','330003','10-NOV-2016','10-NOV-2016','v002','D','1023');
insert into ORDER_DELIVERY Values('O0005','330004','11-NOV-2016','11-NOV-2016','v001','D','1036');
insert into ORDER_DELIVERY Values('O0006','330005','13-NOV-2016','13-NOV-2016','v001','D','1024');
insert into ORDER_DELIVERY Values('O0007','330006','13-NOV-2016','13-NOV-2016','v005','D','1025');
insert into ORDER_DELIVERY Values('O0008','330007','14-NOV-2016','14-NOV-2016','v005','D','1021');
insert into ORDER_DELIVERY Values('O0009','330001','17-NOV-2016','17-NOV-2016','v005','D','1022');
insert into ORDER_DELIVERY Values('O0010','330001','17-NOV-2016','17-NOV-2016','v002','D','1036');
insert into ORDER_DELIVERY Values('O0011','330005','17-MAR-2015','17-MAR-2015','v002','P','1021');



insert into ORDER_DETAILS_PIZZA Values('I0001','O0001','P011','SP11',2,20.98);
insert into ORDER_DETAILS_PIZZA Values('I0002','O0002','P011','SP11',2,20.98);
insert into ORDER_DETAILS_PIZZA Values('I0003','O0003','P012','SP12',2,32.98);
insert into ORDER_DETAILS_PIZZA Values('I0004','O0004','P013','SP13',3,64.47);
insert into ORDER_DETAILS_PIZZA Values('I0005','O0005','P021','SP21',3,28.47);
insert into ORDER_DETAILS_PIZZA Values('I0006','O0006','P022','SP22',2,28.98);
insert into ORDER_DETAILS_PIZZA Values('I0007','O0007','P023','SP23',1,18.49);
insert into ORDER_DETAILS_PIZZA Values('I0008','O0008','P031','SP31',2,30.98);
insert into ORDER_DETAILS_PIZZA Values('I0009','O0009','P032','SP32',3,58.47);
insert into ORDER_DETAILS_PIZZA Values('I0010','O0010','P033','SP33',1,23.49);

insert into ITEM_TOPPINGS_DETAILS Values('O0001','I0001','T01');
insert into ITEM_TOPPINGS_DETAILS Values('O0002','I0002','T04');
insert into ITEM_TOPPINGS_DETAILS Values('O0003','I0003','T04');
insert into ITEM_TOPPINGS_DETAILS Values('O0004','I0004','T07');
insert into ITEM_TOPPINGS_DETAILS Values('O0005','I0005','T03');
insert into ITEM_TOPPINGS_DETAILS Values('O0006','I0006','T02');
insert into ITEM_TOPPINGS_DETAILS Values('O0007','I0007','T02');
insert into ITEM_TOPPINGS_DETAILS Values('O0008','I0008','T06');
insert into ITEM_TOPPINGS_DETAILS Values('O0009','I0009','T04');
insert into ITEM_TOPPINGS_DETAILS Values('O0010','I0010','T04');

insert into FEEDBACK Values('O0001',4,4);
insert into FEEDBACK Values('O0002',3,4);
insert into FEEDBACK Values('O0003',2,3);
insert into FEEDBACK Values('O0004',3,3);
insert into FEEDBACK Values('O0005',4,4);
insert into FEEDBACK Values('O0006',2,3);
insert into FEEDBACK Values('O0007',2,2);
insert into FEEDBACK Values('O0008',4,3);
insert into FEEDBACK Values('O0009',4,4);
insert into FEEDBACK Values('O0010',3,3);



commit;



