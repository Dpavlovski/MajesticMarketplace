SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;
SET default_tablespace = '';
SET default_table_access_method = heap;


CREATE TABLE public.order_status (
    id integer primary key not null ,
    status_type varchar(255) not null
);

ALTER TABLE public."order_status" OWNER TO postgres;

CREATE SEQUENCE public."order_status_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public."order_status_id_seq" OWNER TO postgres;

ALTER SEQUENCE public."order_status_id_seq" OWNED BY public."order_status".id;

INSERT INTO public.order_status (id,status_type)
    VALUES (1,'Pending') ,(2,'Processing'),(3,'Shipped'),
    (4,'Delivered'), (5,'Canceled'),(6,'Returned'), (7,'Refunded');

CREATE TABLE public."Order" (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    total_cost real NOT NULL,
    created_timestamp timestamp without time zone NOT NULL,
    status_id bigint NOT NULL,
    shopping_cart_id bigint NOT NULL
);

ALTER TABLE public."Order" OWNER TO postgres;


CREATE SEQUENCE public."Order_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Order_id_seq" OWNER TO postgres;


ALTER SEQUENCE public."Order_id_seq" OWNED BY public."Order".id;

ALTER TABLE ONLY public."Order"
        ADD CONSTRAINT order_status_id FOREIGN KEY (status_id) REFERENCES public.order_status(id);

CREATE TABLE public."User" (
    id bigint NOT NULL,
    username character varying(20) NOT NULL,
    password character varying(20) NOT NULL,
    email character varying(64) NOT NULL,
    first_name character varying(20) NOT NULL,
    last_name character varying(20) NOT NULL,
    is_admin boolean NOT NULL
);


ALTER TABLE public."User" OWNER TO postgres;


CREATE SEQUENCE public."User_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."User_id_seq" OWNER TO postgres;


ALTER SEQUENCE public."User_id_seq" OWNED BY public."User".id;



CREATE TABLE public.address (
    id bigint NOT NULL,
    street character varying(30) NOT NULL,
    street_number integer NOT NULL,
    entry_number integer,
    floor integer
);


ALTER TABLE public.address OWNER TO postgres;



CREATE SEQUENCE public.address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.address_id_seq OWNER TO postgres;


ALTER SEQUENCE public.address_id_seq OWNED BY public.address.id;


CREATE TABLE public.adminreply (
    id bigint NOT NULL,
    review_id bigint NOT NULL,
    comment character varying(255) NOT NULL,
    created_timestamp timestamp without time zone NOT NULL
);


ALTER TABLE public.adminreply OWNER TO postgres;



CREATE SEQUENCE public.adminreply_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.adminreply_id_seq OWNER TO postgres;



ALTER SEQUENCE public.adminreply_id_seq OWNED BY public.adminreply.id;




CREATE TABLE public.category (
    id bigint NOT NULL,
    name character varying(20) NOT NULL
);


ALTER TABLE public.category OWNER TO postgres;



CREATE SEQUENCE public.category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_id_seq OWNER TO postgres;



ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;



CREATE TABLE public.discount (
    id bigint NOT NULL,
    amount integer NOT NULL,
    start_date timestamp without time zone NOT NULL,
    end_date timestamp without time zone NOT NULL
);


ALTER TABLE public.discount OWNER TO postgres;

CREATE SEQUENCE public.discount_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.discount_id_seq OWNER TO postgres;



ALTER SEQUENCE public.discount_id_seq OWNED BY public.discount.id;



CREATE TABLE public.discount_product (
    discountid bigint NOT NULL,
    productid bigint NOT NULL
);


ALTER TABLE public.discount_product OWNER TO postgres;



CREATE TABLE public.discountcode (
    id bigint NOT NULL,
    code character varying(5) NOT NULL,
    amount integer NOT NULL,
    is_active boolean NOT NULL,
    admin_id bigint NOT NULL
);


ALTER TABLE public.discountcode OWNER TO postgres;



CREATE SEQUENCE public.discountcode_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.discountcode_id_seq OWNER TO postgres;



ALTER SEQUENCE public.discountcode_id_seq OWNED BY public.discountcode.id;




CREATE TABLE public.discountcode_order (
    discountcodeid bigint NOT NULL,
    orderid bigint NOT NULL
);


ALTER TABLE public.discountcode_order OWNER TO postgres;



CREATE TABLE public.municipality (
    id bigint NOT NULL,
    name character varying(20) NOT NULL,
    postal_code smallint NOT NULL
);


ALTER TABLE public.municipality OWNER TO postgres;



CREATE SEQUENCE public.municipality_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.municipality_id_seq OWNER TO postgres;


ALTER SEQUENCE public.municipality_id_seq OWNED BY public.municipality.id;




CREATE TABLE public.orderitem (
    id bigint NOT NULL,
    order_id bigint NOT NULL,
    product_id bigint NOT NULL,
    quantity smallint NOT NULL,
    price real NOT NULL
);


ALTER TABLE public.orderitem OWNER TO postgres;



CREATE SEQUENCE public.orderitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orderitem_id_seq OWNER TO postgres;



ALTER SEQUENCE public.orderitem_id_seq OWNED BY public.orderitem.id;




CREATE TABLE public.ordershipping (
    id bigint NOT NULL,
    order_id bigint NOT NULL,
    shipping_address_id bigint NOT NULL,
    shipping_option_id bigint NOT NULL
);


ALTER TABLE public.ordershipping OWNER TO postgres;


CREATE SEQUENCE public.ordershipping_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ordershipping_id_seq OWNER TO postgres;



ALTER SEQUENCE public.ordershipping_id_seq OWNED BY public.ordershipping.id;



CREATE TABLE public.payment (
    id bigint NOT NULL,
    order_id bigint NOT NULL,
    card_number character varying(16) NOT NULL,
    expiration_year smallint NOT NULL,
    expiration_month smallint NOT NULL,
    security_code integer NOT NULL,
    created_timestamp timestamp without time zone NOT NULL,
    caldholder_firstname character varying(20) NOT NULL,
    caldholder_lastname character varying(20) NOT NULL
);


ALTER TABLE public.payment OWNER TO postgres;


CREATE SEQUENCE public.payment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payment_id_seq OWNER TO postgres;



ALTER SEQUENCE public.payment_id_seq OWNED BY public.payment.id;



CREATE TABLE public.product (
    id bigint NOT NULL,
    name character varying(20) NOT NULL,
    description character varying(20) NOT NULL,
    image character varying(255),
    category_id bigint NOT NULL
);


ALTER TABLE public.product OWNER TO postgres;



CREATE SEQUENCE public.product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_id_seq OWNER TO postgres;


ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;




CREATE TABLE public.productprice (
    id bigint NOT NULL,
    price integer NOT NULL,
    valid_from timestamp without time zone NOT NULL,
    valid_till timestamp without time zone NOT NULL,
    productid bigint NOT NULL
);


ALTER TABLE public.productprice OWNER TO postgres;



CREATE SEQUENCE public.productprice_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.productprice_id_seq OWNER TO postgres;



ALTER SEQUENCE public.productprice_id_seq OWNED BY public.productprice.id;



CREATE TABLE public.review (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    product_id bigint NOT NULL,
    rating smallint NOT NULL,
    comment character varying(255) NOT NULL,
    created_timestamp integer NOT NULL
);


ALTER TABLE public.review OWNER TO postgres;


CREATE SEQUENCE public.review_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.review_id_seq OWNER TO postgres;



ALTER SEQUENCE public.review_id_seq OWNED BY public.review.id;




CREATE TABLE public.review_reaction (
    id bigint NOT NULL,
    review_id bigint NOT NULL,
    user_id bigint NOT NULL,
    reaction_type boolean NOT NULL
);


ALTER TABLE public.review_reaction OWNER TO postgres;



CREATE SEQUENCE public.review_reaction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.review_reaction_id_seq OWNER TO postgres;



ALTER SEQUENCE public.review_reaction_id_seq OWNED BY public.review_reaction.id;



CREATE TABLE public.shippingaddress (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    address_id bigint NOT NULL,
    city character varying(15) NOT NULL,
    country character varying(15) NOT NULL,
    municipality_id bigint NOT NULL
);


ALTER TABLE public.shippingaddress OWNER TO postgres;


CREATE SEQUENCE public.shippingaddress_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shippingaddress_id_seq OWNER TO postgres;



ALTER SEQUENCE public.shippingaddress_id_seq OWNED BY public.shippingaddress.id;




CREATE TABLE public.shippingoption (
    id bigint NOT NULL,
    name character varying(20) NOT NULL,
    price real NOT NULL,
    delivery_time smallint NOT NULL
);


ALTER TABLE public.shippingoption OWNER TO postgres;



CREATE SEQUENCE public.shippingoption_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shippingoption_id_seq OWNER TO postgres;


ALTER SEQUENCE public.shippingoption_id_seq OWNED BY public.shippingoption.id;




CREATE TABLE public.shoppingcart (
    id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.shoppingcart OWNER TO postgres;



CREATE SEQUENCE public.shoppingcart_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shoppingcart_id_seq OWNER TO postgres;


ALTER SEQUENCE public.shoppingcart_id_seq OWNED BY public.shoppingcart.id;




CREATE TABLE public.shoppingcartitem (
    id bigint NOT NULL,
    cart_id bigint NOT NULL,
    product_id bigint NOT NULL,
    quantity smallint NOT NULL
);


ALTER TABLE public.shoppingcartitem OWNER TO postgres;



CREATE SEQUENCE public.shoppingcartitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shoppingcartitem_id_seq OWNER TO postgres;



ALTER SEQUENCE public.shoppingcartitem_id_seq OWNED BY public.shoppingcartitem.id;




ALTER TABLE ONLY public."Order" ALTER COLUMN id SET DEFAULT nextval('public."Order_id_seq"'::regclass);




ALTER TABLE ONLY public."User" ALTER COLUMN id SET DEFAULT nextval('public."User_id_seq"'::regclass);


ALTER TABLE ONLY public.address ALTER COLUMN id SET DEFAULT nextval('public.address_id_seq'::regclass);




ALTER TABLE ONLY public.adminreply ALTER COLUMN id SET DEFAULT nextval('public.adminreply_id_seq'::regclass);




ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);




ALTER TABLE ONLY public.discount ALTER COLUMN id SET DEFAULT nextval('public.discount_id_seq'::regclass);




ALTER TABLE ONLY public.discountcode ALTER COLUMN id SET DEFAULT nextval('public.discountcode_id_seq'::regclass);




ALTER TABLE ONLY public.municipality ALTER COLUMN id SET DEFAULT nextval('public.municipality_id_seq'::regclass);




ALTER TABLE ONLY public.orderitem ALTER COLUMN id SET DEFAULT nextval('public.orderitem_id_seq'::regclass);




ALTER TABLE ONLY public.ordershipping ALTER COLUMN id SET DEFAULT nextval('public.ordershipping_id_seq'::regclass);




ALTER TABLE ONLY public.payment ALTER COLUMN id SET DEFAULT nextval('public.payment_id_seq'::regclass);



ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);


ALTER TABLE ONLY public.productprice ALTER COLUMN id SET DEFAULT nextval('public.productprice_id_seq'::regclass);



ALTER TABLE ONLY public.review ALTER COLUMN id SET DEFAULT nextval('public.review_id_seq'::regclass);




ALTER TABLE ONLY public.review_reaction ALTER COLUMN id SET DEFAULT nextval('public.review_reaction_id_seq'::regclass);



ALTER TABLE ONLY public.shippingaddress ALTER COLUMN id SET DEFAULT nextval('public.shippingaddress_id_seq'::regclass);




ALTER TABLE ONLY public.shippingoption ALTER COLUMN id SET DEFAULT nextval('public.shippingoption_id_seq'::regclass);




ALTER TABLE ONLY public.shoppingcart ALTER COLUMN id SET DEFAULT nextval('public.shoppingcart_id_seq'::regclass);



ALTER TABLE ONLY public.shoppingcartitem ALTER COLUMN id SET DEFAULT nextval('public.shoppingcartitem_id_seq'::regclass);




-- COPY public."Order" (id, user_id, status_id, total_cost, created_timestamp, shopping_cart_id) FROM stdin;
-- \.
--
--
--
-- COPY public."User" (id, username, password, email, first_name, last_name, is_admin) FROM stdin;
-- \.
--
--
--
-- COPY public.address (id, street, street_number, entry_number, floor) FROM stdin;
-- \.
--
--
--
--
-- COPY public.adminreply (id, review_id, comment, created_timestamp) FROM stdin;
-- \.
--
--
--
-- COPY public.category (id, name) FROM stdin;
-- \.
--
--
--
--
-- COPY public.discount (id, amount, start_date, end_date) FROM stdin;
-- \.
--
--
--
--
-- COPY public.discount_product (discountid, productid) FROM stdin;
-- \.
--
--
--
--
-- COPY public.discountcode (id, code, amount, is_active, admin_id) FROM stdin;
-- \.
--
--
--
--
-- COPY public.discountcode_order (discountcodeid, orderid) FROM stdin;
-- \.
--
--
--
--
-- COPY public.municipality (id, name, postal_code) FROM stdin;
-- \.
--
--
--
--
-- COPY public.orderitem (id, order_id, product_id, quantity, price) FROM stdin;
-- \.
--
--
--
--
-- COPY public.ordershipping (id, order_id, shipping_address_id, shipping_option_id) FROM stdin;
-- \.
--
--
--
--
-- COPY public.payment (id, order_id, card_number, expiration_year, expiration_month, security_code, created_timestamp, caldholder_firstname, caldholder_lastname) FROM stdin;
-- \.
--
--
--
-- COPY public.product (id, name, description, image, category_id) FROM stdin;
-- \.
--
--
--
-- COPY public.productprice (id, price, valid_from, valid_till, productid) FROM stdin;
-- \.
--
--
--
--
-- COPY public.review (id, user_id, product_id, rating, comment, created_timestamp) FROM stdin;
-- \.
--
--
--
--
-- COPY public.review_reaction (id, review_id, user_id, reaction_type) FROM stdin;
-- \.
--
--
--
-- COPY public.shippingaddress (id, user_id, address_id, city, country, municipality_id) FROM stdin;
-- \.
--
--
--
--
-- COPY public.shippingoption (id, name, price, delivery_time) FROM stdin;
-- \.
--
--
--
-- COPY public.shoppingcart (id, user_id) FROM stdin;
-- \.
--
--
--
-- COPY public.shoppingcartitem (id, cart_id, product_id, quantity) FROM stdin;
-- \.



SELECT pg_catalog.setval('public."Order_id_seq"', 1, false);


SELECT pg_catalog.setval('public."User_id_seq"', 1, false);




SELECT pg_catalog.setval('public.address_id_seq', 1, false);



SELECT pg_catalog.setval('public.adminreply_id_seq', 1, false);




SELECT pg_catalog.setval('public.category_id_seq', 1, false);




SELECT pg_catalog.setval('public.discount_id_seq', 1, false);




SELECT pg_catalog.setval('public.discountcode_id_seq', 1, false);




SELECT pg_catalog.setval('public.municipality_id_seq', 1, false);


SELECT pg_catalog.setval('public.orderitem_id_seq', 1, false);




SELECT pg_catalog.setval('public.ordershipping_id_seq', 1, false);




SELECT pg_catalog.setval('public.payment_id_seq', 1, false);




SELECT pg_catalog.setval('public.product_id_seq', 1, false);




SELECT pg_catalog.setval('public.productprice_id_seq', 1, false);




SELECT pg_catalog.setval('public.review_id_seq', 1, false);




SELECT pg_catalog.setval('public.review_reaction_id_seq', 1, false);




SELECT pg_catalog.setval('public.shippingaddress_id_seq', 1, false);




SELECT pg_catalog.setval('public.shippingoption_id_seq', 1, false);




SELECT pg_catalog.setval('public.shoppingcart_id_seq', 1, false);



SELECT pg_catalog.setval('public.shoppingcartitem_id_seq', 1, false);



ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT "Order_pkey" PRIMARY KEY (id);



ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);



ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_username_key" UNIQUE (username);




ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_pkey PRIMARY KEY (id);



ALTER TABLE ONLY public.adminreply
    ADD CONSTRAINT adminreply_pkey PRIMARY KEY (id);



ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_name_key UNIQUE (name);


ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);



ALTER TABLE ONLY public.discount
    ADD CONSTRAINT discount_pkey PRIMARY KEY (id);




ALTER TABLE ONLY public.discount_product
    ADD CONSTRAINT discount_product_pkey PRIMARY KEY (discountid, productid);




ALTER TABLE ONLY public.discountcode_order
    ADD CONSTRAINT discountcode_order_pkey PRIMARY KEY (discountcodeid, orderid);



ALTER TABLE ONLY public.discountcode
    ADD CONSTRAINT discountcode_pkey PRIMARY KEY (id);




ALTER TABLE ONLY public.municipality
    ADD CONSTRAINT municipality_pkey PRIMARY KEY (id);



ALTER TABLE ONLY public.orderitem
    ADD CONSTRAINT orderitem_pkey PRIMARY KEY (id);


ALTER TABLE ONLY public.ordershipping
    ADD CONSTRAINT ordershipping_pkey PRIMARY KEY (id);



ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_card_number_key UNIQUE (card_number);



ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (id);




ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);



ALTER TABLE ONLY public.productprice
    ADD CONSTRAINT productprice_pkey PRIMARY KEY (id);



ALTER TABLE ONLY public.review
    ADD CONSTRAINT review_pkey PRIMARY KEY (id);



ALTER TABLE ONLY public.review_reaction
    ADD CONSTRAINT review_reaction_pkey PRIMARY KEY (id);



ALTER TABLE ONLY public.shippingaddress
    ADD CONSTRAINT shippingaddress_pkey PRIMARY KEY (id);




ALTER TABLE ONLY public.shippingoption
    ADD CONSTRAINT shippingoption_pkey PRIMARY KEY (id);



ALTER TABLE ONLY public.shoppingcart
    ADD CONSTRAINT shoppingcart_pkey PRIMARY KEY (id);



ALTER TABLE ONLY public.shoppingcartitem
    ADD CONSTRAINT shoppingcartitem_pkey PRIMARY KEY (id);



ALTER TABLE ONLY public.shippingaddress
    ADD CONSTRAINT address_details FOREIGN KEY (address_id) REFERENCES public.address(id);


ALTER TABLE ONLY public.discount_product
    ADD CONSTRAINT applies_to FOREIGN KEY (discountid) REFERENCES public.discount(id);




ALTER TABLE ONLY public.product
    ADD CONSTRAINT category_product FOREIGN KEY (category_id) REFERENCES public.category(id);




ALTER TABLE ONLY public.discountcode_order
    ADD CONSTRAINT discount_code FOREIGN KEY (orderid) REFERENCES public."Order"(id);



ALTER TABLE ONLY public.productprice
    ADD CONSTRAINT fkproductpri677864 FOREIGN KEY (productid) REFERENCES public.product(id);




ALTER TABLE ONLY public.review_reaction
    ADD CONSTRAINT fkreview_rea755259 FOREIGN KEY (user_id) REFERENCES public."User"(id);




ALTER TABLE ONLY public.shippingaddress
    ADD CONSTRAINT fkshippingad138045 FOREIGN KEY (municipality_id) REFERENCES public.municipality(id);



ALTER TABLE ONLY public.discount_product
    ADD CONSTRAINT has_discount FOREIGN KEY (productid) REFERENCES public.product(id);



ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT order_for_cart FOREIGN KEY (shopping_cart_id) REFERENCES public.shoppingcart(id);




ALTER TABLE ONLY public.orderitem
    ADD CONSTRAINT order_items FOREIGN KEY (order_id) REFERENCES public."Order"(id);




ALTER TABLE ONLY public.payment
    ADD CONSTRAINT order_payment FOREIGN KEY (order_id) REFERENCES public."Order"(id);


ALTER TABLE ONLY public.ordershipping
    ADD CONSTRAINT order_shipping_details FOREIGN KEY (order_id) REFERENCES public."Order"(id);




ALTER TABLE ONLY public.ordershipping
    ADD CONSTRAINT orders_shipping_addresses FOREIGN KEY (shipping_address_id) REFERENCES public.shippingaddress(id);



ALTER TABLE ONLY public.ordershipping
    ADD CONSTRAINT orders_shipping_option FOREIGN KEY (shipping_option_id) REFERENCES public.shippingoption(id);



ALTER TABLE ONLY public.review
    ADD CONSTRAINT product_contains_review FOREIGN KEY (product_id) REFERENCES public.product(id);




ALTER TABLE ONLY public.orderitem
    ADD CONSTRAINT product_present_in_order FOREIGN KEY (product_id) REFERENCES public.product(id);




ALTER TABLE ONLY public.shoppingcartitem
    ADD CONSTRAINT product_present_in_shopping_cart FOREIGN KEY (product_id) REFERENCES public.product(id);




ALTER TABLE ONLY public.adminreply
    ADD CONSTRAINT review_contains_admin_reply FOREIGN KEY (review_id) REFERENCES public.review(id);



ALTER TABLE ONLY public.review_reaction
    ADD CONSTRAINT review_contains_reactions FOREIGN KEY (review_id) REFERENCES public.review(id);



ALTER TABLE ONLY public.shoppingcartitem
    ADD CONSTRAINT shopping_cart_items FOREIGN KEY (cart_id) REFERENCES public.shoppingcart(id);


ALTER TABLE ONLY public.review
    ADD CONSTRAINT user_insert_review FOREIGN KEY (user_id) REFERENCES public."User"(id);




ALTER TABLE ONLY public.shippingaddress
    ADD CONSTRAINT user_inserts_address FOREIGN KEY (user_id) REFERENCES public."User"(id);




ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT user_makes_order FOREIGN KEY (user_id) REFERENCES public."User"(id);


ALTER TABLE ONLY public.shoppingcart
    ADD CONSTRAINT user_shopping_cart FOREIGN KEY (user_id) REFERENCES public."User"(id);



ALTER TABLE ONLY public.discountcode_order
    ADD CONSTRAINT valid_for FOREIGN KEY (discountcodeid) REFERENCES public.discountcode(id);




CREATE INDEX shoppingcartitem_cart_id_idx ON shoppingcartitem (cart_id);



select count(*)from ordershipping;

---------
ALTER TABLE "User"
ADD CONSTRAINT email_check
CHECK (email LIKE '%@%');

ALTER TABLE Product
ADD CONSTRAINT fk_category
FOREIGN KEY (category_id)
REFERENCES Category(id)
ON DELETE CASCADE;

ALTER TABLE ProductPrice
ADD CONSTRAINT chk_valid_dates
CHECK (valid_from < valid_till);

ALTER TABLE productprice
ADD CONSTRAINT fk_product
FOREIGN KEY (productid)
REFERENCES product(id)
ON DELETE CASCADE;

ALTER TABLE review
ADD CONSTRAINT fk_user
FOREIGN KEY (user_id)
REFERENCES "User"(id)
ON DELETE CASCADE;

ALTER TABLE review
ADD CONSTRAINT fk_product
FOREIGN KEY (product_id)
REFERENCES product(id)
ON DELETE CASCADE;


ALTER TABLE review_reaction
ADD CONSTRAINT fk_review
FOREIGN KEY (review_id)
REFERENCES review(id)
ON DELETE CASCADE;

ALTER TABLE review_reaction
ADD CONSTRAINT fk_user
FOREIGN KEY (user_id)
REFERENCES "User"(id)
ON DELETE CASCADE;

ALTER TABLE shippingaddress
ADD CONSTRAINT fk_user
FOREIGN KEY (user_id)
REFERENCES "User"(id)
ON DELETE CASCADE;

ALTER TABLE shippingaddress
ADD CONSTRAINT fk_address
FOREIGN KEY (address_id)
REFERENCES address(id)
ON DELETE CASCADE;

ALTER TABLE shippingaddress
ADD CONSTRAINT fk_municipality
FOREIGN KEY (municipality_id)
REFERENCES municipality(id)
ON DELETE CASCADE;


------

--all products
CREATE VIEW product_view AS
    SELECT p.*,pp.price FROM product p
        JOIN productprice pp ON p.id=pp.productid ;


--all orders
CREATE VIEW order_view AS
    SELECT o.id, u.id as userId, u.first_name, u.last_name,o.total_cost, o.created_timestamp,os.status_type, o.shopping_cart_id FROM "Order" o
        JOIN "User" u ON o.user_id = u.id
        JOIN order_status os ON o.status_id = os.id;

--A view that lists all orders along with their user information:
CREATE VIEW order_user_view AS
    SELECT o.id, o.total_cost,product_id, p.name, o.created_timestamp, u.username, u.email
    FROM "Order" o
        JOIN "User" u ON o.user_id = u.id
        JOIN shoppingcart sc ON o.shopping_cart_id=sc.id
        JOIN shoppingcartitem si ON sc.id=si.cart_id
        JOIN product p ON si.product_id=p.id;

--shopping cart by user
CREATE VIEW shopping_cart_by_user_view AS
    SELECT c.id AS cart_id, c.user_id, ci.product_id, ci.quantity, p.name, pp.price
    FROM shoppingcart c
        JOIN shoppingcartitem ci ON c.id = ci.cart_id
        JOIN product p ON ci.product_id = p.id
        JOIN productprice pp ON p.id = pp.productid
    ORDER BY c.user_id, c.id;


--A view that lists all payments along with their associated order information:

CREATE VIEW payment_order_view AS
    SELECT p.id, p.created_timestamp, o.id as order_id, o.total_cost
    FROM payment p
        JOIN "Order" o ON p.order_id = o.id;

--A view that lists all products along with their prices and discount information:
CREATE VIEW product_price_discount_view AS
    SELECT p.id, p.name, pp.price, d.amount
    FROM product p
        JOIN productprice pp ON p.id = pp.productid
        LEFT JOIN discount_product dp ON p.id = dp.productid
        LEFT JOIN discount d ON dp.discountid = d.id;

--A view that lists all reviews along with the associated user and product information:
CREATE VIEW review_user_product_view AS
    SELECT r.id, r.rating, r.comment, u.username,p.id as productId,p.name
    FROM review r
        JOIN "User" u ON r.user_id = u.id
        JOIN product p ON r.product_id = p.id;

--A view that lists all orders along with the associated payment and user information:
CREATE VIEW order_payment_user_view AS
    SELECT o.id, o.total_cost, p.created_timestamp, u.username
    FROM "Order" o
        JOIN payment p ON o.id = p.order_id
        JOIN "User" u ON o.user_id = u.id;

--A view that lists all reviews along with the associated user and product information, and the corresponding admin replies:
CREATE VIEW review_user_product_adminreply_view AS
    SELECT r.id, r.rating, r.comment, u.username, p.name
    FROM review r
        JOIN "User" u ON r.user_id = u.id
        JOIN product p ON r.product_id = p.id
        LEFT JOIN adminreply ar ON r.id = ar.review_id;

----------------------------
select count(id) from order_user_view;--1b
select count(*) from order_payment_user_view;--1m
select count(*) from order_view;--1m
select count(*) from payment_order_view;--1m
select count(*) from product_view;--15k
select count(*) from order_view;
select count(*) from product_price_discount_view;--20k
select count(*) from review_user_product_view;--20k







select * from order_payment_user_view where username='nicolewilliams';
select * from order_user_view where username='james40';
select * from order_view where shopping_cart_id=2758;
select * from payment_order_view where id=58179;
select * from product_price_discount_view where amount=70;
select * from product_view where category_id=9;
select * from review_user_product_adminreply_view where username='vhardin';
select * from review_user_product_view where username='ricky82';
select * from shopping_cart_by_user_view where user_id=178;







----------------------------------------------------------------------------------



CREATE OR REPLACE PROCEDURE register_user(
  newUsername VARCHAR(20),
  newPassword VARCHAR(20),
  newEmail VARCHAR(64),
  newFirst_name VARCHAR(20),
  newLast_name VARCHAR(20)
) LANGUAGE plpgsql AS $$
DECLARE
  userId BIGINT;
BEGIN

  IF EXISTS (SELECT 1 FROM "User" u WHERE u.username = newUsername OR u.email = newEmail) THEN
   RAISE EXCEPTION 'User already exists';
  END IF;

  INSERT INTO "User" (username, password, email, first_name, last_name, is_admin)
  VALUES (newUsername, newPassword, newEmail, newFirst_name, newLast_name, false)
  RETURNING id INTO userId;

  INSERT INTO shoppingcart (user_id) VALUES (userId);

END;
$$ ;


CALL register_user('doe.john', 'pass', 'doe@example.com', 'Doe', 'John');


CREATE OR REPLACE PROCEDURE user_login(
  usernameInput VARCHAR(100),
  passwordInput VARCHAR(20)
) LANGUAGE plpgsql AS $$
DECLARE
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM "User" u
    WHERE (u.username = usernameInput)
      AND u.password = passwordInput
  ) THEN
    RAISE EXCEPTION 'Username and password do not match';
  END IF;
END
$$ ;


CREATE OR REPLACE FUNCTION process_payment(
  orderId BIGINT,
  cardNumber VARCHAR(25),
  expirationYear SMALLINT,
  expirationMonth SMALLINT,
  securityCode INTEGER,
  cardholderFirstName VARCHAR(40),
  cardholderLastName VARCHAR(40)
) RETURNS VARCHAR
LANGUAGE plpgsql
AS $$
DECLARE
  paymentId INTEGER;
BEGIN
  -- Insert payment details into the payment table
  INSERT INTO payment (order_id, card_number, expiration_year, expiration_month, security_code,created_timestamp, cardholder_firstname, cardholder_lastname)
  VALUES (orderId, cardNumber, expirationYear, expirationMonth, securityCode,CURRENT_TIMESTAMP, cardholderFirstName, cardholderLastName)
  RETURNING id INTO paymentId;

  -- Perform payment processing logic here
  -- You can add your own business logic for processing the payment

  -- Check if the payment was successful
  IF paymentId IS NOT NULL THEN
    -- Update the order status to indicate payment success
    SELECT update_order( orderId, 3);
    RETURN 'Payment successful'; -- Payment successful
  ELSE
    RETURN 'Payment failed'; -- Payment failed
  END IF;
END;
$$;

SELECT process_payment(123, '1234567890123456', '2025', '05', '123', 'John', 'Doe');



CREATE OR REPLACE FUNCTION show_products()
RETURNS SETOF product_view
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY
    SELECT *
    FROM product_view;
END;
$$;


SELECT show_products();



CREATE OR REPLACE FUNCTION details_product(productId BIGINT)
RETURNS SETOF product_view
LANGUAGE plpgsql
AS $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM product p WHERE id=productId) THEN
    RAISE EXCEPTION 'Product does not exists';
    END IF;
    RETURN QUERY
    SELECT *
    FROM product_view WHERE id=productId LIMIT 1;
END;
$$;

SELECT * FROM details_product(1);


CREATE OR REPLACE PROCEDURE add_product(new_name VARCHAR(100),new_description VARCHAR(255),new_image VARCHAR(255),new_category_id BIGINT,new_price FLOAT, new_valid_from timestamp without time zone,new_valid_to timestamp without time zone)
LANGUAGE plpgsql
AS $$
    DECLARE productId BIGINT;
BEGIN

    INSERT INTO product(name,description,image,category_id) VALUES
     (new_name,new_description,new_image,new_category_id)
    RETURNING id INTO productId;
    INSERT INTO productprice(price, valid_from, valid_till, productid) VALUES
     (new_price,new_valid_from,new_valid_to,productId);
END;
$$;

CALL add_product('banana','fruit','None',2,120,'2021-02-17 00:00:00.000000','9999-01-01 00:00:00.000000');


CREATE OR REPLACE PROCEDURE edit_product(productId BIGINT,new_name VARCHAR(100),new_description VARCHAR(255),new_image VARCHAR(255),new_category_id BIGINT)
LANGUAGE plpgsql
AS $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM product p WHERE id=productId) THEN
    RAISE EXCEPTION 'Product does not exists';
  END IF;
    UPDATE product SET name=new_name,description=new_description,image=new_image,category_id=new_category_id
    WHERE id=productId;
END;
$$;

CREATE OR REPLACE PROCEDURE delete_product(productId BIGINT)
LANGUAGE plpgsql
AS $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM product u WHERE id=productId) THEN
    RAISE EXCEPTION 'Product does not exists';
    END IF;
   DELETE FROM product where id=productId;
END;
$$;
CALL delete_product(10000);
CREATE OR REPLACE FUNCTION products_in_price_range(lowest INTEGER, highest INTEGER)
RETURNS SETOF product_view
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY
    SELECT *
    FROM product_view
    WHERE price BETWEEN lowest AND highest;
END;
$$;


SELECT * FROM products_in_price_range(100,1000);





CREATE OR REPLACE PROCEDURE add_review_reaction (reviewId BIGINT, userId BIGINT, newReaction_type BOOL)
LANGUAGE plpgsql
AS $$
DECLARE
	existing_reaction_type BOOL;

BEGIN

	SELECT r.reaction_type INTO existing_reaction_type
	FROM review_reaction r
	WHERE r.review_id = reviewId AND r.user_id = userId;

	IF existing_reaction_type IS NULL THEN

		INSERT INTO review_reaction(review_id, user_id, reaction_type)
		VALUES (reviewId, userId, newReaction_type);

	ELSEIF existing_reaction_type != newReaction_type THEN

		UPDATE review_reaction
		SET reaction_type = newReaction_type
		WHERE review_id = reviewId AND user_id = userId;
	END IF;

END;

$$;

CALL add_review_reaction(5,8,true);





CREATE OR REPLACE FUNCTION products_in_category (categoryId BIGINT)
RETURNS SETOF product_view
LANGUAGE plpgsql
AS $$

BEGIN
    RETURN QUERY
	SELECT * FROM product_view p
	WHERE p.category_id=categoryId;
	EXCEPTION
		WHEN no_data_found THEN
		RAISE EXCEPTION 'invalid category';
END;

$$;

SELECT * FROM products_in_category(3);




CREATE OR REPLACE FUNCTION reviews_with_rating (rating_value INTEGER)
RETURNS SETOF review_user_product_view
LANGUAGE plpgsql
AS $$

BEGIN
    RETURN QUERY
	SELECT * FROM review_user_product_view
	WHERE rating=rating_value;
	EXCEPTION
		WHEN no_data_found THEN
		RAISE EXCEPTION 'invalid rating value';

END;

$$;

SELECT * FROM reviews_with_rating(1);




CREATE OR REPLACE FUNCTION calculate_total_cost(order_id BIGINT)
RETURNS DECIMAL(10,2) LANGUAGE plpgsql
AS $$
    DECLARE total_cost DECIMAL(10,2);
BEGIN
    SELECT SUM(p2.price)
    INTO total_cost
    FROM "Order" o
    JOIN shoppingcart sc ON o.shopping_cart_id=sc.id
    JOIN shoppingcartitem s on sc.id = s.cart_id
    JOIN product p on p.id = s.product_id
    JOIN productprice p2 on p.id = p2.productid and p.id = p2.productid
    WHERE o.id = order_id;
    RETURN total_cost;
END;
$$;
SELECT calculate_total_cost(1) AS total_cost;



CREATE OR REPLACE FUNCTION user_shopping_cart_items()
RETURNS SETOF shopping_cart_by_user_view LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY
    SELECT * FROM shopping_cart_by_user_view
    where user_id=152;
END;
$$;

SELECT user_shopping_cart_items();

CREATE OR REPLACE PROCEDURE delete_shopping_cart_items(shoppingcart_id BIGINT)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM shoppingcartitem
    WHERE cart_id =shoppingcart_id;
END;
$$;

CALL delete_shopping_cart_items(100);



CREATE OR REPLACE PROCEDURE add_product_to_cart(product_id_input BIGINT,quantity_input SMALLINT)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO shoppingcartitem (cart_id, product_id, quantity) VALUES (2028,product_id_input,quantity_input);
END;
$$;
 CALL add_product_to_cart(1, '1');



CREATE OR REPLACE PROCEDURE delete_shopping_cart_item(shoppingcart_id BIGINT,shoppingcartitem_id BIGINT)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM shoppingcartitem
    WHERE cart_id =shoppingcart_id AND id=shoppingcartitem_id;
END;
$$;

CALL delete_shopping_cart_item(101,1);

CREATE OR REPLACE FUNCTION create_order(
  user_idInput BIGINT,
  status_idInput BIGINT,
  shoppingcart_idInput BIGINT
) RETURNS BOOLEAN
LANGUAGE plpgsql
AS $$
DECLARE
    totalCostInput REAL;
    orderId BIGINT;
BEGIN
  IF user_idInput IS NULL OR shoppingcart_idInput IS NULL OR status_idInput IS NULL THEN
     RETURN FALSE;
  ELSE
      INSERT INTO "Order" (user_id,total_cost,created_timestamp,status_id,shopping_cart_id)
      VALUES (user_idInput,0,CURRENT_TIMESTAMP,status_idInput,shoppingcart_idInput)
      RETURNING id into orderId;
      SELECT calculate_total_cost(orderId) INTO totalCostInput;
      UPDATE "Order" SET total_cost=totalCostInput WHERE id=orderId;
      INSERT INTO orderitem (order_id, product_id, quantity, price)
      SELECT orderId, sci.product_id, sci.quantity, p2.price
      FROM shoppingcartitem sci JOIN product p ON sci.product_id = p.id
      JOIN product p ON sci.product_id=p.id
      JOIN productprice p2 on p.id = p2.productid
      WHERE sci.cart_id = shoppingcart_idInput;
      CALL delete_shopping_cart_items(shoppingcart_idInput);
      RETURN TRUE;
  END IF;
END;
$$;

CREATE OR REPLACE FUNCTION update_order (order_idInput BIGINT,order_statusIdInput BIGINT)
RETURNS BOOLEAN
LANGUAGE plpgsql
AS $$
BEGIN
    IF order_idInput IS NULL OR order_statusIdInput IS NULL THEN RETURN FALSE;
    ELSE
    UPDATE "Order" SET status_id=order_statusIdInput WHERE id=order_idInput;
    RETURN TRUE;
    END IF;
END
$$;


CREATE OR REPLACE FUNCTION delete_order (order_idInput BIGINT)
RETURNS BOOLEAN
LANGUAGE plpgsql
AS $$
BEGIN
      IF order_idInput IS NULL THEN RETURN FALSE;
    ELSE
    DELETE FROM "Order" WHERE id=order_idInput;
    RETURN TRUE;
    END IF;
END
$$;


CREATE OR REPLACE FUNCTION show_categories ()
RETURNS SETOF category
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY
    SELECT * FROM category;
END
$$;