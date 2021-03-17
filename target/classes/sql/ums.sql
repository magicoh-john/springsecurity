
Create user ums identified by 1234;
Grant create session to ums
Grant Create table, resource to ums
Grant Create view to ums
commit

--// Add primary key with alter statement //--------------------------------
ALTER TABLE table_name
ADD CONSTRAINT constraint_name PRIMARY KEY (column1, column2.......);


-- //Category Table Create //-------------------------------------------------
Drop table category;
Create table category(
	category_id number,
    category_name varchar2(100) not null,
    description varchar2(200),
    is_active char(3),
    Constraint pk_category primary key(category_id)
    );
Create sequence seq_category increment by 1 start with 1;


-- // Product Table Create //----------------------------------------------------
Drop table product;
Create table product(
	product_id number(5),
    product_name varchar2(100) not null,
    brand varchar2(100),
    description varchar2(200),
    unit_price number(10) default 0,
    category_id number,
    is_active char(3),
    constraint pk_product_id primary key (product_id),
    constraint  fk_category_id foreign key (category_id) references category(category_id)
    );
Create sequence seq_product increment by 1 start with 1 ;

ALTER TABLE product ADD receipt_date DATE DEFAULT sysdate;
COMMIT

-- //Client Create Table // -------------------------------------------------------------
Drop table client;

Create table client(
	client_id number(5),
	client_name varchar2(100) not null,
    address varchar2(200),
    postal_code varchar2(5),
    phone varchar2(15),
    fax varchar2(15),
    email varchar2(100),
    is_active char(3),
    constraint pk_client primary key(client_id)
    );
Create Sequence seq_client increment by 1 start with 1 ;
    
-- // Create invoiceHeader Table //------------------------------------------
Drop table invoiceHeader;
Create table invoiceHeader(
	invoice_id number(5),
    client_id number not null,
    shipping_address varchar2(200),
    total_amt number(10) not null,
    description varchar2(200),
    created_date date default sysdate,
    modified_date date default sysdate,
    constraint pk_invoiceHeader primary key(invoice_id),
    constraint fk_client_id foreign key(client_id) references client(client_id)
    );
Create sequence seq_invoiceHeader increment by 1 start with 1 ;
ALTER TABLE INVOICEHEADER ADD invoice_date DATE DEFAULT sysdate;


-- // Create invoiceDetail Table //------------------------------------------

Drop table invoiceDetail;

Create table invoiceDetail(
	invoice_detail_id number(5),
    invoice_id number(5),
    product_id number(5) not null,
    unit_price number(10) default 0,
    quantity number(5) default 0,
    total_amt number(10) default 0,
    created_date date default sysdate,
    modified_date date default sysdate,
    constraint pk_invoice_detail_id primary key(invoice_detail_id),
    constraint  fk_invoice_id foreign key(invoice_id) references invoiceHeader(invoice_id),
    constraint fk_product_id foreign key(product_id) references product(product_id)
    );
Create sequence seq_invoice_detail increment by 1 start with 1 ;

commit

 -- // Create department Table //------------------------------------------

Drop table department;
Create Table department(
    DEPT_ID number(5),
    DEPT_NAME VARCHAR2(20) not null,
    parent_id number(3),
    managed_id number(3),
    location VARCHAR2(20),
    constraint pk_department primary key(dept_id)
);
Create sequence seq_department increment by 1 start with 1;


 -- // Create bbs Table //------------------------------------------
-- Drop table bbs;
 
 
create table bbs(
    no number(5) primary key,
    title varchar2(100) not null,
    content varchar2(1000),
    writer varchar2(50),
    hit number(5) default 0,
    regdate date
);
Create sequence seq_bbs_no increment by 1 start with 1;
commit

    


 -- // Create department Table //------------------------------------------
Drop table role CASCADE CONSTRAINTS PURGE;

Create table role(
	role_id varchar2(15),
    role_name varchar2(50) not null,
    constraint pk_role_id primary key(role_id)
);
Create sequence seq_role increment by 1 start with 1 ;

-- // Create user Table //------------------------------------------
Drop table users CASCADE CONSTRAINTS PURGE;

Create table users(
    user_no number(5),
    user_id varchar2(15),
    user_pwd varchar2(200) not null,
    user_name varchar2(50) not null,
    email varchar2(100),
    phone varchar2(15),
    fax varchar2(15),
    zip_num char(7),
    address1 varchar2(50),
    address2 varchar2(50),
    dept_id number(5),
    role_id varchar2(15),
    image_path varchar2(50),
    useyn char(3) default '1',
    regdate Date default sysdate,
    moddate Date default sysdate,
    enavled number(1),
    constraint pk_user_no primary key(user_no),
    constraint fk_user_dept_id foreign key(dept_id) references department(dept_id)
    --constraint fk_user_role_id foreign key(role_id) references role(role_id)
);

Create sequence seq_users increment by 1 start with 1 ;
-- user_id Unique 설정
ALTER TABLE users ADD CONSTRAINT uk_user_id UNIQUE (user_id);

COMMIT;

desc  users


insert into users(user_no, user_id, user_pwd, user_name) values(seq_users.nextval, 'java', '$2a$10$MbkBWdnjTfXsUsX5/Udw9eTF16UcW3/87ivnDEa95z6Tum2OhMnRW', 'on');

select * from users

commit

 -- // Create user_role Table //------------------------------------------
Drop table user_role ;

Create table user_role(
user_role_id number(5),
user_id varchar2(15),
role_id varchar2(15),
constraint pk_user_role_id primary key(user_role_id)
--constraint fk_user_id foreign key(user_id) references users(user_id),
--constraint fk_role_id foreign key(role_id) references role(role_id)
);
Create sequence seq_user_role_id increment by 1 start with 1 ;
commit
delete from user_role
desc users

-- remember-me 항목(csrf token) 사용시 저장 선택적 생성
-- Drop table persistent_logins

CREATE TABLE persistent_logins (
    user_id VARCHAR(15) NOT NULL,
    series VARCHAR(64) PRIMARY KEY,
    token VARCHAR(64) NOT NULL,
    last_used TIMESTAMP NOT NULL
);



/****************** 샘플 데이터 삽입 *******************/

-- //카테고리 데이터//--------------------------------------------------------
INSERT into Category(category_id, category_name, description, is_active) VALUES (seq_category.nextval, 'Electronic', 'Electronic description', 1);
INSERT into Category(category_id, category_name, description, is_active) VALUES (seq_category.nextval, 'Household', 'Household description', 1);
INSERT into Category(category_id, category_name, description, is_active) VALUES (seq_category.nextval, 'Vehicle', 'Vehicle description', 1);
INSERT into Category(category_id, category_name, description, is_active) VALUES (seq_category.nextval, 'Computer', 'Computer description', 1);
INSERT into Category(category_id, category_name, description, is_active) VALUES (seq_category.nextval, 'Food', 'Food description', 1);

-- //제품 데이터//--------------------------------------------------------
INSERT Into product(product_id, product_name, unit_price,  category_id, is_active) 
                VALUES (seq_product.nextval, 'Refrigerator', 37000, 1, 1);

INSERT Into product(product_id, product_name, unit_price,  category_id, is_active) 
                VALUES (seq_product.nextval, 'Air Conditioner', 4000, 1,  1);

INSERT Into product(product_id, product_name, unit_price,  category_id, is_active) 
                VALUES (seq_product.nextval, 'Fan', 5000, 1, 1);

INSERT Into product(product_id, product_name, unit_price,  category_id, is_active) 
VALUES (seq_product.nextval, 'LED TV', 2000, 1,  1);

INSERT Into product(product_id, product_name, unit_price,  category_id, is_active) 
VALUES (seq_product.nextval, 'LCD TV', 1000, 1,  1);

INSERT Into product(product_id, product_name, unit_price,  category_id, is_active) 
VALUES (seq_product.nextval, 'OLED TV', 3000, 1,  1);

INSERT Into product(product_id, product_name, unit_price,  category_id, is_active) 
VALUES (seq_product.nextval, 'Bicycle', 1000, 1, 2);

INSERT Into product(product_id, product_name, unit_price,  category_id, is_active) 
VALUES (seq_product.nextval, 'Desk', 3000, 1, 2);

INSERT Into product(product_id, product_name, unit_price,  category_id, is_active) 
VALUES (seq_product.nextval, 'Chair', 2000, 1, 2);

INSERT Into product(product_id, product_name, unit_price,  category_id, is_active) 
VALUES (seq_product.nextval,'Shoes', 1000, 1, 2);

 INSERT Into product(product_id, product_name, unit_price,  category_id, is_active) 
VALUES (seq_product.nextval,'Car', 30000, 1, 3);

INSERT Into product(product_id, product_name, unit_price,  category_id, is_active) 
VALUES (seq_product.nextval,'Lorry', 50000, 1, 3);

INSERT Into product(product_id, product_name, unit_price,  category_id, is_active) 
VALUES (seq_product.nextval,'Motorcycle', 5000, 1, 3);

INSERT Into product(product_id, product_name, unit_price,  category_id, is_active) 
VALUES (seq_product.nextval,'DeskTop', 2000, 1, 3);

INSERT Into product(product_id, product_name, unit_price,  category_id, is_active) 
VALUES (seq_product.nextval,'NoteBook', 25000, 1, 3);

INSERT Into product(product_id, product_name, unit_price,  category_id, is_active) 
VALUES (seq_product.nextval,'DeskTop', 20000, 1, 4);

INSERT Into product(product_id, product_name, unit_price,  category_id, is_active) 
VALUES (seq_product.nextval,'NoteBook', 25000, 1, 4);

INSERT Into product(product_id, product_name, unit_price,  category_id, is_active) 
VALUES (seq_product.nextval,'Rice', 3000, 1, 5);

INSERT Into product(product_id, product_name, unit_price,  category_id, is_active) 
VALUES (seq_product.nextval,'Vegetable', 1000, 1, 5);

INSERT Into product(product_id, product_name, unit_price,  category_id, is_active) 
VALUES (seq_product.nextval,'Flour', 2000, 1, 5);


SELECT P.PRODUCT_ID, 
			P.PRODUCT_NAME, 
			P.BRAND, 
			P.UNIT_PRICE, 
			P.CATEGORY_ID, 
			C.CATEGORY_NAME, 
			P.IS_ACTIVE, 
			P.RECEIPT_DATE AS RECEIPT_DATE
		FROM PRODUCT P 
        INNER JOIN CATEGORY C ON P.CATEGORY_ID = C.CATEGORY_ID
		WHERE 1 = 1
		--AND P.IS_ACTIVE = '1'
		ORDER BY P.PRODUCT_ID DESC;
UPDATE Product SET IS_ACTIVE = '1';
COMMIT;
-- //거래처 데이터//--------------------------------------------------------

INSERT into client(client_id, client_name, address, postal_code, phone, email, is_active) VALUES (seq_client.nextval, 'SAMSUNG', 'SEOUL', '29387', '02-3383-4948', 'ahnjunggeun@naver.com', 1);
INSERT  into client(client_id, client_name, address, postal_code, phone, email, is_active) VALUES (seq_client.nextval,'LG Electronic', 'NEW YORK 3837-3', '33736', '02-4848-4949', 'kingsejong@daum.net', 1);
INSERT  into client(client_id, client_name, address, postal_code, phone, email, is_active) VALUES (seq_client.nextval,'SK', 'PARIS 100-2', '38376', '02-3983-3837', 'generalleeseunshin@google.com', 1);
INSERT  into client(client_id, client_name, address, postal_code, phone, email, is_active) VALUES (seq_client.nextval,'HYUNDAI', 'TOKOY 93-1', '37367', '02-3033-4487', 'yoonbonggil@yahoo.com', 1);
INSERT  into  client(client_id, client_name, address, postal_code, phone, email, is_active) VALUES (seq_client.nextval,'HANHWA', 'ITALY 332-1', '38377', '02-393-3938', 'leebongchang@lycos.com', 1);    

-- //부서 데이터//--------------------------------------------------------

INSERT into department(dept_id,  dept_name, location) VALUES (seq_department.nextval, 'Administration', 'SEOUL');
INSERT into department(dept_id,  dept_name, location) VALUES (seq_department.nextval,  'CM', 'BUSAN');
INSERT into department(dept_id,  dept_name, location) VALUES (seq_department.nextval,  'Planning', 'GWANGJOO');
INSERT into department(dept_id,  dept_name, location) VALUES (seq_department.nextval,  'Production', 'DAEJEON');
INSERT into department(dept_id,  dept_name, location) VALUES (seq_department.nextval,  'Purchasing', 'DAEGOO');
INSERT into department(dept_id,  dept_name, location) VALUES (seq_department.nextval,  'Finance', 'SEOUL');
INSERT into department(dept_id,  dept_name, location) VALUES (seq_department.nextval,  'Research', 'SEOUL');
INSERT into department(dept_id,  dept_name, location) VALUES (seq_department.nextval,  'Accounting', 'BUSAN');
INSERT into department(dept_id,  dept_name, location) VALUES (seq_department.nextval,  'Marketing', 'GWANGJOO');
INSERT into department(dept_id,  dept_name, location) VALUES (seq_department.nextval, 'Trade', 'DAEJEON');

-- //부서 데이터//--------------------------------------------------------
INSERT into role(role_id, role_name ) VALUES (seq_role.nextval, 'Administrator');
INSERT into role(role_id, role_name ) VALUES (seq_role.nextval,  'Manager');
INSERT into role(role_id, role_name ) VALUES (seq_role.nextval,  'User');

-- //User 데이터//--------------------------------------------------------
insert into users(user_no, user_id, user_pwd, user_name, email, dept_id, role_id) values(seq_users.nextval, 'magicoh', '1234', '매직오', 'magicoh@naver.com', 1, 1);
insert into users(user_no, user_id, user_pwd, user_name, email, dept_id, role_id) values(seq_users.nextval, 'dream', '1234', '꿈돌이', 'dream@google.com', 2, 2);


-- // insert invoiceHeader //----------------------------------------------------------------

INSERT into invoiceHeader(invoice_id, created_date, client_id, total_amt, shipping_address, description, modified_date) 
VALUES (seq_invoiceHeader.nextval, '2020-04-18', 1, 192500 		,'SEOUL 238-3', 		NULL, '2020-04-18');
INSERT into invoiceHeader(invoice_id, created_date, client_id, total_amt, shipping_address, description, modified_date) 
VALUES (seq_invoiceHeader.nextval, '2020-10-01', 2, 7865000 	,'NEW YORK 238-3', 		NULL, '2020-10-01');

INSERT into invoiceHeader(invoice_id, created_date, client_id, total_amt, shipping_address, description, modified_date) 
VALUES (seq_invoiceHeader.nextval, '2020-10-02', 2, 1186000 	,'PARIS 3837-3', 	NULL, '2020-10-02');

INSERT into invoiceHeader(invoice_id, created_date, client_id, total_amt, shipping_address, description, modified_date) 
VALUES (seq_invoiceHeader.nextval, '2020-10-03', 3, 285650 	,'TOKOY 100-2', 				NULL, '2020-10-03');

INSERT into invoiceHeader(invoice_id, created_date, client_id, total_amt, shipping_address, description, modified_date) 
VALUES (seq_invoiceHeader.nextval, '2020-10-04', 5, 778500 		,'ITALY 93-1', 		NULL, '2020-10-04');



select * from invoiceHeader
select * from client

-- insert invoiceDetail

INSERT into invoiceDetail(invoice_detail_id,                invoice_id,     product_id,     unit_price,     quantity,       total_amt,      created_date,       modified_date) 
                    VALUES (seq_invoice_detail.nextval,     1,              1,                   1000,           3,                3000, 		     '2020-04-18',      '2020-04-18');

INSERT into seq_invoice_detail(invoice_detail_id, invoice_id, product_id, unit_price, quantity, total_amt, created_date, modified_date) 
VALUES (seq_invoice_detail.nextval,1, 2,  4000, 4, 160000, 	'2020-04-18', '2020-04-18');
INSERT into invoiceDetail(invoice_detail_id, invoice_id, product_id, unit_price, quantity, total_amt, created_date, modified_date) 
VALUES (seq_invoice_detail.nextval,1, 3,  500, 5, 25000, 					'2020-04-18', '2020-04-18');
INSERT into invoiceDetail(invoice_detail_id, invoice_id, product_id, unit_price, quantity, total_amt, created_date, modified_date) 
VALUES (seq_invoice_detail.nextval,2, 1,  100, 30, 300000, 	'2020-04-18', '2020-04-18');

select * from invoiceDetail


INSERT into invoiceDetail(invoice_detail_id, invoice_id, product_id, unit_price, quantity, total_amt, created_date, modified_date) 
VALUES (seq_invoice_detail.nextval,2, 2,  400, 55, 2200000,	'2020-10-01', '2020-10-01');
INSERT into invoiceDetail(invoice_detail_id, invoice_id, product_id, unit_price, quantity, total_amt, created_date, modified_date) 
VALUES (seq_invoice_detail.nextval,2, 3,  500, 700, 350000, 				'2020-10-01', '2020-10-01');

INSERT into invoiceDetail(invoice_detail_id, invoice_id, product_id, unit_price, quantity, total_amt, created_date, modified_date) 
VALUES (seq_invoice_detail.nextval,2, 4, 1000, 7580, 75800, 		'2020-10-01', '2020-10-01');


INSERT into invoiceDetail(invoice_detail_id, invoice_id, product_id, unit_price, quantity, total_amt, created_date, modified_date) 
VALUES (seq_invoice_detail.nextval, 3, 1,  10000, 1, 10000, 		'2020-10-02', '2020-10-02');
INSERT into invoiceDetail(invoice_detail_id, invoice_id, product_id, unit_price, quantity, total_amt, created_date, modified_date) 
VALUES (seq_invoice_detail.nextval,3, 2,  10000, 34, 340000, 			'2020-10-02', '2020-10-02');
INSERT into invoiceDetail(invoice_detail_id, invoice_id, product_id, unit_price, quantity, total_amt, created_date, modified_date) 
VALUES (seq_invoice_detail.nextval,3, 3,  2000, 5755, 1151000, 		'2020-10-02', '2020-10-02');

INSERT into invoiceDetail(invoice_detail_id, invoice_id, product_id, unit_price, quantity, total_amt, created_date, modified_date) 
VALUES (seq_invoice_detail.nextval, 4, 1,  40000, 200, 80000,'2020-10-03', '2020-10-03');
INSERT into invoiceDetail(invoice_detail_id, invoice_id, product_id, unit_price, quantity, total_amt, created_date, modified_date) 
VALUES (seq_invoice_detail.nextval,4, 2,  500, 90, 45000, 				'2020-10-03', '2020-10-03');
INSERT into invoiceDetail(invoice_detail_id, invoice_id, product_id, unit_price, quantity, total_amt, created_date, modified_date)
VALUES (seq_invoice_detail.nextval,4, 3,  2000, 60, 12000, 			'2020-10-03', '2020-10-03');

INSERT into invoiceDetail(invoice_detail_id, invoice_id, product_id, unit_price, quantity, total_amt, created_date, modified_date) 
VALUES (seq_invoice_detail.nextval,4, 4,  300000, 68, 2040000, 			'2020-10-03', '2020-10-03');
INSERT into invoiceDetail(invoice_detail_id, invoice_id, product_id, unit_price, quantity, total_amt, created_date, modified_date) 
VALUES (seq_invoice_detail.nextval, 5, 1,  10000, 33, 33000, 	'2020-10-04', '2020-10-04');
INSERT into invoiceDetail(invoice_detail_id, invoice_id, product_id, unit_price, quantity, total_amt, created_date, modified_date) 
VALUES (seq_invoice_detail.nextval,5, 2,  4000, 44, 176000, '2020-10-04', '2020-10-04');
INSERT into invoiceDetail(invoice_detail_id, invoice_id, product_id, unit_price, quantity, total_amt, created_date, modified_date) 
VALUES (seq_invoice_detail.nextval,5, 3,  500, 56, 28000, 				'2020-10-04', '2020-10-04');

-- //우편번호 주소 테이블//----------------------------------------------------------------------

-- Drop Table address

Create Table address(
    zip_num varchar2(7),
    sido varchar2(30),
    gugun varchar2(30),
    dong varchar2(100),
    zip_code varchar2(30),
    bunji varchar2(30)
);

commit

SELECT 	
            ZIP_NUM,
			SIDO,
			GUGUN,
			DONG,
			ZIP_CODE,
			BUNJI 
		FROM ADDRESS 
		WHERE DONG LIKE '%'||''||'%'
        And rownum <= 20


SELECT 
			ZIP_NUM,
			SIDO,
			GUGUN,
			DONG,
			ZIP_CODE,
			BUNJI 
		FROM ADDRESS
		WHERE 1=1
			AND ROWNUM <= 20
			AND DONG LIKE '%'||'신림동'||'%'


select * from users;
select * from user_role;
SELECT * FROM ROLE;

INSERT INTO USERS(
			USER_NO, 
			USER_ID, 
			USER_PWD, 
			USER_NAME, 
			EMAIL, 
			PHONE, 
			ZIP_NUM, 
			ADDRESS1, 
			ADDRESS2,
			ENAVLED,
			REGDATE
		) 
		VALUES(
			SEQ_USERS.NEXTVAL, 
			'java1', 
			'$2a$10$9tP/ySoRzV.wYDwvhNbpnOW120BZM.1IOvFsx8Kboyj35.FQM1iYC', 
			'OH',
			'a@a.com', 
			'010-2222-3333', 
			'', 
			'', 
			'', 
			1 ,
			SYSDATE
		)

INSERT INTO USER_ROLE( USER_ROLE_ID, USER_ID, ROLE_ID ) 
VALUES( SEQ_USER_ROLE_ID.NEXTVAL, 'java1', 'ROLE_USER' )

COMMIT;



SELECT no, title, content, writer, hit, regdate
		FROM bbs
		WHERE 1 = 1
		ORDER BY no desc
        
SELECT H.INVOICE_ID, 
		H.CLIENT_ID, 
		C.CLIENT_NAME, 
		H.TOTAL_AMT, 
		TO_CHAR(H.INVOICE_DATE, 'YYYY-MM-DD HH24:MI:SS') AS INVOICE_DATE, 
		H.SHIPPING_ADDRESS ,
        D.PRODUCT_ID,
        P.CATEGORY_ID,
        P.BRAND
FROM INVOICEHEADER H
INNER JOIN INVOICEDETAIL D ON H.INVOICE_ID = D.INVOICE_ID
INNER JOIN CLIENT C ON H.CLIENT_ID = C.CLIENT_ID
INNER JOIN PRODUCT P ON D.PRODUCT_ID = P.PRODUCT_ID
WHERE 1 = 1
--AND H.INVOICE_ID = 24
AND H.CLIENT_ID = 64
AND D.PRODUCT_ID = 55
AND P.CATEGORY_ID = 4
AND H.INVOICE_DATE >= TO_DATE('20201208', 'yyyy-mm-dd')
AND H.INVOICE_DATE <= TO_DATE('20201209', 'yyyy-mm-dd')
ORDER BY H.INVOICE_ID DESC        


SELECT H.*
FROM INVOICEHEADER H
WHERE  1=1
AND H.INVOICE_DATE >= TO_DATE('2020-12-09', 'yyyy-mm-dd')
AND H.INVOICE_DATE <= TO_DATE('2020-12-09', 'yyyy-mm-dd')
ORDER BY INVOICE_ID DESC


  
 SELECT * FROM INVOICEDETAIL
 
  
  DESC INVOICEHEADER
  DESC PRODUCT
  
SELECT P.* FROM PRODUCT P 
WHERE 1=1
AND P.RECEIPT_DATE >= TO_DATE('2020-12-08', 'yyyy-mm-dd')
AND P.RECEIPT_DATE <= TO_DATE('2020-12-09', 'yyyy-mm-dd')
ORDER BY P.RECEIPT_DATE DESC

SELECT P.PRODUCT_ID, 
			P.PRODUCT_NAME, 
			P.BRAND, 
			P.UNIT_PRICE, 
			P.CATEGORY_ID, 
			P.IS_ACTIVE, 
			C.CATEGORY_NAME, 
			P.RECEIPT_DATE AS RECEIPT_DATE
		FROM PRODUCT P 
        INNER JOIN CATEGORY C ON P.CATEGORY_ID = C.CATEGORY_ID
		WHERE 1 = 1
		AND P.IS_ACTIVE = '1'
			AND P.RECEIPT_DATE >= TO_DATE('2020-12-08', 'yyyy-mm-dd')
			AND P.RECEIPT_DATE <= TO_DATE('2020-12-08', 'yyyy-mm-dd')
		ORDER BY P.PRODUCT_ID DESC        
        
SELECT Distinct H.INVOICE_ID, 
				H.CLIENT_ID, 
				C.CLIENT_NAME, 
				H.TOTAL_AMT,
				H.INVOICE_DATE AS INVOICE_DATE, 
				H.SHIPPING_ADDRESS 
		FROM INVOICEHEADER H
			INNER JOIN INVOICEDETAIL D ON H.INVOICE_ID = D.INVOICE_ID
			INNER JOIN CLIENT C ON H.CLIENT_ID = C.CLIENT_ID
			INNER JOIN PRODUCT P ON D.PRODUCT_ID = P.PRODUCT_ID
		WHERE 1 = 1
 			AND H.INVOICE_DATE >= TO_DATE('2020-12-01', 'yyyy-mm-dd') 
  			AND H.INVOICE_DATE <= TO_DATE('2020-12-09', 'yyyy-mm-dd')
        
/*
 * 보안 아이디 : java
 * 보안 비밀번호 : 1234
 * 
 * 
 */*/  			