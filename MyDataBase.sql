--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1
-- Dumped by pg_dump version 15.1

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

--
-- Name: phones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.phones (
                               id integer NOT NULL,
                               name character varying(30) NOT NULL,
                               company character varying(30) NOT NULL,
                               amount_left integer NOT NULL,
                               cost double precision NOT NULL,
                               network_type character varying(30),
                               connection_type character varying(30),
                               os character varying(30),
                               screen_size character varying(30),
                               camera_pixel character varying(30),
                               sensors character varying(30),
                               android_version character varying(30),
                               ios_version character varying(30),
                               frequency integer
);


ALTER TABLE public.phones OWNER TO postgres;

--
-- Name: phones_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.phones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.phones_id_seq OWNER TO postgres;

--
-- Name: phones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.phones_id_seq OWNED BY public.phones.id;


--
-- Name: purchases; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.purchases (
                                  id integer NOT NULL,
                                  phone_id integer NOT NULL,
                                  user_id integer NOT NULL,
                                  is_bought boolean NOT NULL
);


ALTER TABLE public.purchases OWNER TO postgres;

--
-- Name: purchases_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.purchases_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.purchases_id_seq OWNER TO postgres;

--
-- Name: purchases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.purchases_id_seq OWNED BY public.purchases.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
                              id integer NOT NULL,
                              user_name character varying(30) NOT NULL,
                              password character varying(30) NOT NULL,
                              balance numeric(10,2) DEFAULT 0.00
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: phones id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.phones ALTER COLUMN id SET DEFAULT nextval('public.phones_id_seq'::regclass);


--
-- Name: purchases id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchases ALTER COLUMN id SET DEFAULT nextval('public.purchases_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: phones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.phones (id, name, company, amount_left, cost, network_type, connection_type, os, screen_size, camera_pixel, sensors, android_version, ios_version, frequency) FROM stdin;
4	Oppo A1K	Oppo	14	1000	4g	\N	android	1260x1300	90px	touchable	20	\N	\N
5	iPhone 11	Apple	10	1000	4G	\N	iOS	6.1	18-12px	Fingerprint, Accelerometer	\N	13	\N
6	Samsung S21	Samsung	15	800	5G	\N	Android	6.2	12px	Fingerprint, Gyroscope	11	\N	\N
7	Google Pixel 5	Google	12	700	4G	\N	Android	6.0	12px	Fingerprint, Proximity	12	\N	\N
8	iPad Pro	Apple	10	1300	Wi-Fi	\N	iOS	12.9	12px	Face ID, Accelerometer	\N	13	\N
9	OnePlus 9 Pro	OnePlus	20	1000	5G	\N	Android	6.7	48px	Fingerprint, Gyroscope	11	\N	\N
10	Xiaomi Mi 11	Xiaomi	15	700	4G	\N	Android	6.4	48px	Fingerprint, Accelerometer	11	\N	\N
11	iPhone X	Apple	5	800	4G	\N	iOS	5.8	12px	Face ID, Proximity	\N	11	\N
12	Nokia 9	Nokia	8	500	4G	\N	Android	5.3	12px	Fingerprint, Gyroscope	10	\N	\N
13	Sony Xperia 1 III	Sony	10	900	4G	\N	Android	6.5	12px	Fingerprint, Accelerometer	11	\N	\N
14	Samsung Note 20	Samsung	5	700	4G	\N	Android	6.7	64px	Fingerprint, Proximity	10	\N	\N
15	Samsung Galaxy S21	Samsung	10	1000	4G	\N	Android	6.2	12px	Fingerprint, Accelerometer	11	\N	\N
16	Huawei P40 Pro	Huawei	5	1500	5G	\N	Android	6.5	50px	Fingerprint, Gyroscope	11	\N	\N
17	Oppo Find X3 Pro	Oppo	8	800	4G	\N	Android	6.7	48px	Fingerprint, Accelerometer	10	\N	\N
18	Samsung Galaxy Note 20	Samsung	7	900	4G	\N	Android	6.7	64px	Fingerprint, Proximity	11	\N	\N
19	Huawei Mate 40 Pro	Huawei	6	1300	5G	\N	Android	6.4	56px	Fingerprint, Gyroscope	11	\N	\N
20	Oppo Reno5 Pro	Oppo	9	700	4G	\N	Android	6.4	48px	Fingerprint, Accelerometer	10	\N	\N
21	Samsung Galaxy A52	Samsung	10	500	4G	\N	Android	6.5	64px	Fingerprint, Accelerometer	11	\N	\N
22	Huawei Nova 7 Pro	Huawei	5	1000	5G	\N	Android	6.5	64px	Fingerprint, Gyroscope	11	\N	\N
23	Oppo A53	Oppo	8	700	4G	\N	Android	6.4	48px	Fingerprint, Accelerometer	10	\N	\N
24	Samsung Galaxy S20	Samsung	7	800	4G	\N	Android	6.2	64px	Fingerprint, Proximity	10	\N	\N
25	Apple iPhone 12 Pro	Apple	10	1500	5G	\N	iOS	6.1	40-12px	Fingerprint, Accelerometer	\N	13	\N
26	Apple iPhone 11 Pro Max	Apple	5	1300	5G	\N	iOS	6.5	16-12px	Fingerprint, Gyroscope	\N	12	\N
27	Apple iPhone SE	Apple	8	400	4G	\N	iOS	4.7	12-12px	Fingerprint, Accelerometer	\N	13	\N
28	Samsung Galaxy S21	Samsung	10	1000	4G	\N	Android	6.2	12px	Fingerprint, Accelerometer	11	\N	\N
29	Huawei P40 Pro	Huawei	5	1500	5G	\N	Android	6.5	50px	Fingerprint, Gyroscope	11	\N	\N
30	Oppo Find X3 Pro	Oppo	8	800	4G	\N	Android	6.7	48px	Fingerprint, Accelerometer	10	\N	\N
31	Samsung Galaxy Note 20	Samsung	7	900	4G	\N	Android	6.7	64px	Fingerprint, Proximity	11	\N	\N
32	Huawei Mate 40 Pro	Huawei	6	1300	5G	\N	Android	6.4	56px	Fingerprint, Gyroscope	11	\N	\N
33	Oppo Reno5 Pro	Oppo	9	700	4G	\N	Android	6.4	48px	Fingerprint, Accelerometer	10	\N	\N
34	Samsung Galaxy A52	Samsung	10	500	4G	\N	Android	6.5	64px	Fingerprint, Accelerometer	11	\N	\N
35	Huawei Nova 7 Pro	Huawei	5	1000	5G	\N	Android	6.5	64px	Fingerprint, Gyroscope	11	\N	\N
36	Oppo A53	Oppo	8	700	4G	\N	Android	6.4	48px	Fingerprint, Accelerometer	10	\N	\N
37	Samsung Galaxy S20	Samsung	7	800	4G	\N	Android	6.2	64px	Fingerprint, Proximity	10	\N	\N
38	Apple iPhone 12 Pro	Apple	10	1500	5G	\N	iOS	6.1	40-12px	Fingerprint, Accelerometer	\N	13	\N
39	Apple iPhone 11 Pro Max	Apple	5	1300	5G	\N	iOS	6.5	16-12px	Fingerprint, Gyroscope	\N	12	\N
40	Apple iPhone SE	Apple	8	400	4G	\N	iOS	4.7	12-12px	Fingerprint, Accelerometer	\N	13	\N
\.


--
-- Data for Name: purchases; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.purchases (id, phone_id, user_id, is_bought) FROM stdin;
1	6	1	t
2	36	1	t
3	39	5	t
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, user_name, password, balance) FROM stdin;
2	Kuat	pop	300.00
3	Aigeli	Aigali05	1000.00
1	Nuradil	root	700.00
5	Gol	lol	2700.00
\.


--
-- Name: phones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.phones_id_seq', 40, true);


--
-- Name: purchases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.purchases_id_seq', 3, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 5, true);


--
-- Name: phones phones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.phones
    ADD CONSTRAINT phones_pkey PRIMARY KEY (id);


--
-- Name: purchases purchases_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchases
    ADD CONSTRAINT purchases_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: purchases purchases_phone_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchases
    ADD CONSTRAINT purchases_phone_id_fkey FOREIGN KEY (phone_id) REFERENCES public.phones(id);


--
-- Name: purchases purchases_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchases
    ADD CONSTRAINT purchases_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

