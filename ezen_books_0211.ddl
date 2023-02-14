-- ������ Oracle SQL Developer Data Modeler 22.2.0.165.1149
--   ��ġ:        2023-02-11 10:34:14 KST
--   ����Ʈ:      Oracle Database 11g
--   ����:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE book_review (
    review_num            NUMBER NOT NULL,
    book_num              NUMBER NOT NULL,
    review_content        CLOB,
    review_writer         VARCHAR2(50) NOT NULL,
    review_reporting_date DATE NOT NULL
);

ALTER TABLE book_review ADD CONSTRAINT book_review_pk PRIMARY KEY ( review_num );

CREATE TABLE books (
    book_num       NUMBER NOT NULL,
    category_code  NUMBER,
    book_title     VARCHAR2(50) NOT NULL,
    book_author    VARCHAR2(50) NOT NULL,
    book_image     VARCHAR2(1000) NOT NULL,
    book_price     NUMBER NOT NULL,
    book_publisher VARCHAR2(50) NOT NULL,
    book_pubdate   VARCHAR2(50) NOT NULL,
    book_isbn      VARCHAR2(50) NOT NULL,
    book_desc      CLOB
);

ALTER TABLE books ADD CONSTRAINT product_pk PRIMARY KEY ( book_num );

CREATE TABLE delivery_address (
    user_id       NUMBER NOT NULL,
    user_address1 VARCHAR2(20) NOT NULL,
    user_address2 VARCHAR2(50) NOT NULL,
    user_address3 VARCHAR2(50) NOT NULL
);

COMMENT ON COLUMN delivery_address.user_address1 IS
    '�����ȣ';

COMMENT ON COLUMN delivery_address.user_address2 IS
    '�ּ�';

COMMENT ON COLUMN delivery_address.user_address3 IS
    '���ּ�';

CREATE TABLE product_category (
    category_code NUMBER NOT NULL,
    category_name VARCHAR2(50) NOT NULL
);

ALTER TABLE product_category ADD CONSTRAINT product_category_pk PRIMARY KEY ( category_code );

CREATE TABLE sns_info (
    users_id           NUMBER NOT NULL,
    sns_id             VARCHAR2(45) NOT NULL,
    sns_type           VARCHAR2(45) NOT NULL,
    sns_name           VARCHAR2(45) NOT NULL,
    sns_profile        VARCHAR2(45) NOT NULL,
    sns_connected_date DATE NOT NULL
);

CREATE TABLE user_log (
    user_id      NUMBER NOT NULL,
    login_date   DATE NOT NULL,
    login_status VARCHAR2(45) NOT NULL
);

CREATE TABLE user_order (
    order_num  NUMBER NOT NULL,
    user_id    NUMBER,
    order_date DATE NOT NULL,
    address1   VARCHAR2(20) NOT NULL,
    address2   VARCHAR2(50) NOT NULL,
    address3   VARCHAR2(50) NOT NULL
);

COMMENT ON COLUMN user_order.address1 IS
    '�����ȣ';

COMMENT ON COLUMN user_order.address2 IS
    '�ּ�';

COMMENT ON COLUMN user_order.address3 IS
    '���ּ�';

ALTER TABLE user_order ADD CONSTRAINT user_order_pk PRIMARY KEY ( order_num );

CREATE TABLE user_order_detail (
    order_detail_num    NUMBER NOT NULL,
    order_num           NUMBER,
    book_num            NUMBER,
    book_count          NUMBER NOT NULL,
    book_price          NUMBER,
    order_datail_status VARCHAR2(10) NOT NULL
);

ALTER TABLE user_order_detail ADD CONSTRAINT user_order_detail_pk PRIMARY KEY ( order_detail_num );

CREATE TABLE users (
    user_id       NUMBER NOT NULL,
    user_name     VARCHAR2(45) NOT NULL,
    user_pwd      VARCHAR2(45) NOT NULL,
    user_email    VARCHAR2(45) NOT NULL,
    user_nickname VARCHAR2(45),
    user_profile  VARCHAR2(45) NOT NULL,
    user_role     VARCHAR2(1) NOT NULL,
    create_date   DATE NOT NULL,
    modify_date   DATE NOT NULL
);

CREATE INDEX users_username_idx1 ON
    users (
        user_name
    ASC );

CREATE INDEX users_email__idx2 ON
    users (
        user_email
    ASC );

ALTER TABLE users ADD CONSTRAINT users_pk PRIMARY KEY ( user_id );

ALTER TABLE book_review
    ADD CONSTRAINT book_review_books_fk FOREIGN KEY ( book_num )
        REFERENCES books ( book_num );
        
alter table BOOK_REVIEW add review_rating  number(3);

alter table BOOK_REVIEW add user_id NUMBER not null; 

alter table BOOK_REVIEW
    add constraint "BOOK_REVIEW_USERS_FK"
        foreign key (user_id) references USERS;


ALTER TABLE books
    ADD CONSTRAINT books_product_category_fk FOREIGN KEY ( category_code )
        REFERENCES product_category ( category_code );

ALTER TABLE delivery_address
    ADD CONSTRAINT delivery_address_users_fk FOREIGN KEY ( user_id )
        REFERENCES users ( user_id );

ALTER TABLE sns_info
    ADD CONSTRAINT sns_info_users_fk FOREIGN KEY ( users_id )
        REFERENCES users ( user_id );

ALTER TABLE user_log
    ADD CONSTRAINT user_log_users_fk FOREIGN KEY ( user_id )
        REFERENCES users ( user_id );

ALTER TABLE user_order_detail
    ADD CONSTRAINT user_order_detail_books_fk FOREIGN KEY ( book_num )
        REFERENCES books ( book_num );

ALTER TABLE user_order_detail
    ADD CONSTRAINT user_order_detail_order_fk FOREIGN KEY ( order_num )
        REFERENCES user_order ( order_num );

ALTER TABLE user_order
    ADD CONSTRAINT user_order_users_fk FOREIGN KEY ( user_id )
        REFERENCES users ( user_id );

CREATE SEQUENCE book_review_review_num_seq START WITH 1 NOCACHE;

CREATE SEQUENCE books_book_num_seq START WITH 1 NOCACHE;

CREATE SEQUENCE user_order_order_num_seq START WITH 1 NOCACHE;

CREATE SEQUENCE user_order_detail_order_detail START WITH 1 NOCACHE;

CREATE SEQUENCE user_id_seq START WITH 1 NOCACHE;



-- Oracle SQL Developer Data Modeler ��� ����: 
-- 
-- CREATE TABLE                             9
-- CREATE INDEX                             2
-- ALTER TABLE                             14
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          5
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
