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
    sensors character varying(150),
    android_version character varying(30),
    ios_version character varying(30),
    frequency character varying(30)
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
41	IPhone 14 Pro Max Ultra Bdudx	Apple	4	500	8G	\N	IOS	1920-1260	60px	Touchable	\N	14.3.4	\N
42	Galaxy S21	Samsung	20	800	LTE	Wi-Fi	Android	6.20	108	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	11.0	\N	2.4GHz
43	Galaxy Note 20	Samsung	15	700	LTE	Wi-Fi	Android	6.70	64	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	10.0	\N	2.4GHz
44	iPhone 12 Pro Max	Apple	25	1300	LTE	Wi-Fi	iOS	6.70	12	Face ID, Accelerometer, Gyro, Proximity, Compass, Barometer	\N	14.3	2.4GHz
45	iPhone 12	Apple	30	1000	LTE	Wi-Fi	iOS	6.10	12	Face ID, Accelerometer, Gyro, Proximity, Compass, Barometer	\N	14.3	2.4GHz
46	P40 Pro	Huawei	25	700	LTE	Wi-Fi	Android	6.58	50	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	10.0	\N	2.4GHz
47	P40	Huawei	20	600	LTE	Wi-Fi	Android	6.10	48	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	10.0	\N	2.4GHz
48	Reno5 Pro	Oppo	15	500	LTE	Wi-Fi	Android	6.43	50	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	11.0	\N	2.4GHz
49	Disk Phone 1	Button Phones	5	100	2G	Wired	None	\N	0	None	\N	\N	\N
50	Disk Phone 2	Button Phones	10	150	2G	Wired	None	\N	0	None	\N	\N	\N
51	Radio Phone 1	Radio Phones	15	200	2G	Wired	None	\N	0	None	\N	\N	\N
52	Radio Phone 2	Radio Phones	20	250	2G	Wired	None	\N	0	None	\N	\N	\N
53	Galaxy S21 Ultra	Samsung	10	1400	LTE	Wi-Fi	Android	6.80	108	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	11.0	\N	2.4GHz
54	Galaxy S20	Samsung	20	800	LTE	Wi-Fi	Android	6.20	64	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	10.0	\N	2.4GHz
55	iPhone 11 Pro Max	Apple	30	1100	LTE	Wi-Fi	iOS	6.50	12	Face ID, Accelerometer, Gyro, Proximity, Compass, Barometer	\N	13.3	2.4GHz
56	iPhone 11	Apple	40	800	LTE	Wi-Fi	iOS	6.10	12	Face ID, Accelerometer, Gyro, Proximity, Compass, Barometer	\N	13.3	2.4GHz
57	Mate 40 Pro	Huawei	20	900	LTE	Wi-Fi	Android	6.76	50	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	10.0	\N	2.4GHz
58	Mate 40	Huawei	15	700	LTE	Wi-Fi	Android	6.40	48	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	10.0	\N	2.4GHz
59	Find X3 Pro	Oppo	10	1000	LTE	Wi-Fi	Android	6.70	50	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	11.0	\N	2.4GHz
60	Find X3	Oppo	15	800	LTE	Wi-Fi	Android	6.40	48	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	11.0	\N	2.4GHz
61	Pixel 6 Pro	Google	10	1000	LTE	Wi-Fi	Android	6.70	108	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	12.0	\N	2.4GHz
62	Pixel 6	Google	15	800	LTE	Wi-Fi	Android	6.40	64	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	12.0	\N	2.4GHz
63	Galaxy Note 20 Ultra	Samsung	20	1400	LTE	Wi-Fi	Android	6.90	108	S-Pen, Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	11.0	\N	2.4GHz
64	Galaxy Note 20	Samsung	25	1000	LTE	Wi-Fi	Android	6.70	64	S-Pen, Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	11.0	\N	2.4GHz
65	Galaxy S21	Samsung	20	800	LTE	Wi-Fi	Android	6.20	108	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	11.0	\N	2.4GHz
66	Galaxy Note 20	Samsung	15	700	LTE	Wi-Fi	Android	6.70	64	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	10.0	\N	2.4GHz
67	iPhone 12 Pro Max	Apple	25	1300	LTE	Wi-Fi	iOS	6.70	12	Face ID, Accelerometer, Gyro, Proximity, Compass, Barometer	\N	14.3	2.4GHz
68	iPhone 12	Apple	30	1000	LTE	Wi-Fi	iOS	6.10	12	Face ID, Accelerometer, Gyro, Proximity, Compass, Barometer	\N	14.3	2.4GHz
69	P40 Pro	Huawei	25	700	LTE	Wi-Fi	Android	6.58	50	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	10.0	\N	2.4GHz
70	P40	Huawei	20	600	LTE	Wi-Fi	Android	6.10	48	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	10.0	\N	2.4GHz
71	Reno5 Pro	Oppo	15	500	LTE	Wi-Fi	Android	6.43	50	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	11.0	\N	2.4GHz
72	Disk Phone 1	Button Phones	5	100	2G	Wired	None	\N	0	None	\N	\N	\N
73	Disk Phone 2	Button Phones	10	150	2G	Wired	None	\N	0	None	\N	\N	\N
74	Radio Phone 1	Radio Phones	15	200	2G	Wired	None	\N	0	None	\N	\N	\N
75	Radio Phone 2	Radio Phones	20	250	2G	Wired	None	\N	0	None	\N	\N	\N
76	Galaxy S21 Ultra	Samsung	10	1400	LTE	Wi-Fi	Android	6.80	108	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	11.0	\N	2.4GHz
77	Galaxy S20	Samsung	20	800	LTE	Wi-Fi	Android	6.20	64	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	10.0	\N	2.4GHz
78	iPhone 11 Pro Max	Apple	30	1100	LTE	Wi-Fi	iOS	6.50	12	Face ID, Accelerometer, Gyro, Proximity, Compass, Barometer	\N	13.3	2.4GHz
79	iPhone 11	Apple	40	800	LTE	Wi-Fi	iOS	6.10	12	Face ID, Accelerometer, Gyro, Proximity, Compass, Barometer	\N	13.3	2.4GHz
80	Mate 40 Pro	Huawei	20	900	LTE	Wi-Fi	Android	6.76	50	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	10.0	\N	2.4GHz
81	Mate 40	Huawei	15	700	LTE	Wi-Fi	Android	6.40	48	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	10.0	\N	2.4GHz
82	Find X3 Pro	Oppo	10	1000	LTE	Wi-Fi	Android	6.70	50	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	11.0	\N	2.4GHz
83	Find X3	Oppo	15	800	LTE	Wi-Fi	Android	6.40	48	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	11.0	\N	2.4GHz
84	Pixel 6 Pro	Google	10	1000	LTE	Wi-Fi	Android	6.70	108	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	12.0	\N	2.4GHz
85	Pixel 6	Google	15	800	LTE	Wi-Fi	Android	6.40	64	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	12.0	\N	2.4GHz
86	Galaxy Note 20 Ultra	Samsung	20	1400	LTE	Wi-Fi	Android	6.90	108	S-Pen, Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	11.0	\N	2.4GHz
87	Galaxy Note 20	Samsung	25	1000	LTE	Wi-Fi	Android	6.70	64	S-Pen, Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	11.0	\N	2.4GHz
88	Galaxy S21	Samsung	20	800	LTE	Wi-Fi	Android	6.20	108	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	11.0	\N	2.4GHz
89	Galaxy Note 20	Samsung	15	700	LTE	Wi-Fi	Android	6.70	64	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	10.0	\N	2.4GHz
90	iPhone 12 Pro Max	Apple	25	1300	LTE	Wi-Fi	iOS	6.70	12	Face ID, Accelerometer, Gyro, Proximity, Compass, Barometer	\N	14.3	2.4GHz
91	iPhone 12	Apple	30	1000	LTE	Wi-Fi	iOS	6.10	12	Face ID, Accelerometer, Gyro, Proximity, Compass, Barometer	\N	14.3	2.4GHz
92	P40 Pro	Huawei	25	700	LTE	Wi-Fi	Android	6.58	50	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	10.0	\N	2.4GHz
93	P40	Huawei	20	600	LTE	Wi-Fi	Android	6.10	48	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	10.0	\N	2.4GHz
94	Reno5 Pro	Oppo	15	500	LTE	Wi-Fi	Android	6.43	50	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	11.0	\N	2.4GHz
95	Disk Phone 1	Button Phones	5	100	2G	Wired	None	\N	0	None	\N	\N	\N
96	Disk Phone 2	Button Phones	10	150	2G	Wired	None	\N	0	None	\N	\N	\N
97	Radio Phone 1	Radio Phones	15	200	2G	Wired	None	\N	0	None	\N	\N	\N
98	Radio Phone 2	Radio Phones	20	250	2G	Wired	None	\N	0	None	\N	\N	\N
99	Galaxy S21 Ultra	Samsung	10	1400	LTE	Wi-Fi	Android	6.80	108	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	11.0	\N	2.4GHz
100	Galaxy S20	Samsung	20	800	LTE	Wi-Fi	Android	6.20	64	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	10.0	\N	2.4GHz
101	iPhone 11 Pro Max	Apple	30	1100	LTE	Wi-Fi	iOS	6.50	12	Face ID, Accelerometer, Gyro, Proximity, Compass, Barometer	\N	13.3	2.4GHz
102	iPhone 11	Apple	40	800	LTE	Wi-Fi	iOS	6.10	12	Face ID, Accelerometer, Gyro, Proximity, Compass, Barometer	\N	13.3	2.4GHz
103	Mate 40 Pro	Huawei	20	900	LTE	Wi-Fi	Android	6.76	50	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	10.0	\N	2.4GHz
104	Mate 40	Huawei	15	700	LTE	Wi-Fi	Android	6.40	48	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	10.0	\N	2.4GHz
105	Find X3 Pro	Oppo	10	1000	LTE	Wi-Fi	Android	6.70	50	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	11.0	\N	2.4GHz
106	Find X3	Oppo	15	800	LTE	Wi-Fi	Android	6.40	48	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	11.0	\N	2.4GHz
107	Pixel 6 Pro	Google	10	1000	LTE	Wi-Fi	Android	6.70	108	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	12.0	\N	2.4GHz
108	Pixel 6	Google	15	800	LTE	Wi-Fi	Android	6.40	64	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	12.0	\N	2.4GHz
109	Galaxy Note 20 Ultra	Samsung	20	1400	LTE	Wi-Fi	Android	6.90	108	S-Pen, Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	11.0	\N	2.4GHz
110	Galaxy Note 20	Samsung	25	1000	LTE	Wi-Fi	Android	6.70	64	S-Pen, Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	11.0	\N	2.4GHz
111	Galaxy S21	Samsung	20	800	LTE	Wi-Fi	Android	6.20	108	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	11.0	\N	2.4GHz
112	Galaxy Note 20	Samsung	15	700	LTE	Wi-Fi	Android	6.70	64	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	10.0	\N	2.4GHz
113	iPhone 12 Pro Max	Apple	25	1300	LTE	Wi-Fi	iOS	6.70	12	Face ID, Accelerometer, Gyro, Proximity, Compass, Barometer	\N	14.3	2.4GHz
114	iPhone 12	Apple	30	1000	LTE	Wi-Fi	iOS	6.10	12	Face ID, Accelerometer, Gyro, Proximity, Compass, Barometer	\N	14.3	2.4GHz
115	P40 Pro	Huawei	25	700	LTE	Wi-Fi	Android	6.58	50	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	10.0	\N	2.4GHz
116	P40	Huawei	20	600	LTE	Wi-Fi	Android	6.10	48	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	10.0	\N	2.4GHz
117	Reno5 Pro	Oppo	15	500	LTE	Wi-Fi	Android	6.43	50	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	11.0	\N	2.4GHz
118	Disk Phone 1	Button Phones	5	100	2G	Wired	None	\N	0	None	\N	\N	\N
119	Disk Phone 2	Button Phones	10	150	2G	Wired	None	\N	0	None	\N	\N	\N
120	Radio Phone 1	Radio Phones	15	200	2G	Wired	None	\N	0	None	\N	\N	\N
121	Radio Phone 2	Radio Phones	20	250	2G	Wired	None	\N	0	None	\N	\N	\N
122	Galaxy S21 Ultra	Samsung	10	1400	LTE	Wi-Fi	Android	6.80	108	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	11.0	\N	2.4GHz
123	Galaxy S20	Samsung	20	800	LTE	Wi-Fi	Android	6.20	64	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	10.0	\N	2.4GHz
124	iPhone 11 Pro Max	Apple	30	1100	LTE	Wi-Fi	iOS	6.50	12	Face ID, Accelerometer, Gyro, Proximity, Compass, Barometer	\N	13.3	2.4GHz
125	iPhone 11	Apple	40	800	LTE	Wi-Fi	iOS	6.10	12	Face ID, Accelerometer, Gyro, Proximity, Compass, Barometer	\N	13.3	2.4GHz
126	Mate 40 Pro	Huawei	20	900	LTE	Wi-Fi	Android	6.76	50	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	10.0	\N	2.4GHz
127	Mate 40	Huawei	15	700	LTE	Wi-Fi	Android	6.40	48	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	10.0	\N	2.4GHz
128	Find X3 Pro	Oppo	10	1000	LTE	Wi-Fi	Android	6.70	50	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	11.0	\N	2.4GHz
129	Find X3	Oppo	15	800	LTE	Wi-Fi	Android	6.40	48	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	11.0	\N	2.4GHz
130	Pixel 6 Pro	Google	10	1000	LTE	Wi-Fi	Android	6.70	108	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	12.0	\N	2.4GHz
131	Pixel 6	Google	15	800	LTE	Wi-Fi	Android	6.40	64	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	12.0	\N	2.4GHz
132	Galaxy Note 20 Ultra	Samsung	20	1400	LTE	Wi-Fi	Android	6.90	108	S-Pen, Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	11.0	\N	2.4GHz
133	Galaxy Note 20	Samsung	25	1000	LTE	Wi-Fi	Android	6.70	64	S-Pen, Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	11.0	\N	2.4GHz
134	Galaxy S21	Samsung	20	800	LTE	Wi-Fi	Android	6.20	108	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	11.0	\N	2.4GHz
135	Galaxy Note 20	Samsung	15	700	LTE	Wi-Fi	Android	6.70	64	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	10.0	\N	2.4GHz
136	iPhone 12 Pro Max	Apple	25	1300	LTE	Wi-Fi	iOS	6.70	12	Face ID, Accelerometer, Gyro, Proximity, Compass, Barometer	\N	14.3	2.4GHz
137	iPhone 12	Apple	30	1000	LTE	Wi-Fi	iOS	6.10	12	Face ID, Accelerometer, Gyro, Proximity, Compass, Barometer	\N	14.3	2.4GHz
138	P40 Pro	Huawei	25	700	LTE	Wi-Fi	Android	6.58	50	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	10.0	\N	2.4GHz
139	P40	Huawei	20	600	LTE	Wi-Fi	Android	6.10	48	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	10.0	\N	2.4GHz
140	Reno5 Pro	Oppo	15	500	LTE	Wi-Fi	Android	6.43	50	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	11.0	\N	2.4GHz
141	Disk Phone 1	Button Phones	5	100	2G	Wired	None	\N	0	None	\N	\N	\N
142	Disk Phone 2	Button Phones	10	150	2G	Wired	None	\N	0	None	\N	\N	\N
143	Radio Phone 1	Radio Phones	15	200	2G	Wired	None	\N	0	None	\N	\N	\N
144	Radio Phone 2	Radio Phones	20	250	2G	Wired	None	\N	0	None	\N	\N	\N
145	Galaxy S21 Ultra	Samsung	10	1400	LTE	Wi-Fi	Android	6.80	108	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	11.0	\N	2.4GHz
146	Galaxy S20	Samsung	20	800	LTE	Wi-Fi	Android	6.20	64	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	10.0	\N	2.4GHz
147	iPhone 11 Pro Max	Apple	30	1100	LTE	Wi-Fi	iOS	6.50	12	Face ID, Accelerometer, Gyro, Proximity, Compass, Barometer	\N	13.3	2.4GHz
148	iPhone 11	Apple	40	800	LTE	Wi-Fi	iOS	6.10	12	Face ID, Accelerometer, Gyro, Proximity, Compass, Barometer	\N	13.3	2.4GHz
149	Mate 40 Pro	Huawei	20	900	LTE	Wi-Fi	Android	6.76	50	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	10.0	\N	2.4GHz
150	Mate 40	Huawei	15	700	LTE	Wi-Fi	Android	6.40	48	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	10.0	\N	2.4GHz
151	Find X3 Pro	Oppo	10	1000	LTE	Wi-Fi	Android	6.70	50	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	11.0	\N	2.4GHz
152	Find X3	Oppo	15	800	LTE	Wi-Fi	Android	6.40	48	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	11.0	\N	2.4GHz
153	Pixel 6 Pro	Google	10	1000	LTE	Wi-Fi	Android	6.70	108	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	12.0	\N	2.4GHz
154	Pixel 6	Google	15	800	LTE	Wi-Fi	Android	6.40	64	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	12.0	\N	2.4GHz
155	Galaxy Note 20 Ultra	Samsung	20	1400	LTE	Wi-Fi	Android	6.90	108	S-Pen, Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	11.0	\N	2.4GHz
156	Galaxy Note 20	Samsung	25	1000	LTE	Wi-Fi	Android	6.70	64	S-Pen, Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	11.0	\N	2.4GHz
157	Galaxy S21	Samsung	20	800	LTE	Wi-Fi	Android	6.20	108	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	11.0	\N	2.4GHz
158	Galaxy Note 20	Samsung	15	700	LTE	Wi-Fi	Android	6.70	64	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	10.0	\N	2.4GHz
159	iPhone 12 Pro Max	Apple	25	1300	LTE	Wi-Fi	iOS	6.70	12	Face ID, Accelerometer, Gyro, Proximity, Compass, Barometer	\N	14.3	2.4GHz
160	iPhone 12	Apple	30	1000	LTE	Wi-Fi	iOS	6.10	12	Face ID, Accelerometer, Gyro, Proximity, Compass, Barometer	\N	14.3	2.4GHz
161	P40 Pro	Huawei	25	700	LTE	Wi-Fi	Android	6.58	50	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	10.0	\N	2.4GHz
162	P40	Huawei	20	600	LTE	Wi-Fi	Android	6.10	48	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	10.0	\N	2.4GHz
163	Reno5 Pro	Oppo	15	500	LTE	Wi-Fi	Android	6.43	50	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	11.0	\N	2.4GHz
164	Disk Phone 1	Button Phones	5	100	2G	Wired	None	\N	0	None	\N	\N	\N
165	Disk Phone 2	Button Phones	10	150	2G	Wired	None	\N	0	None	\N	\N	\N
166	Radio Phone 1	Radio Phones	15	200	2G	Wired	None	\N	0	None	\N	\N	\N
167	Radio Phone 2	Radio Phones	20	250	2G	Wired	None	\N	0	None	\N	\N	\N
168	Galaxy S21 Ultra	Samsung	10	1400	LTE	Wi-Fi	Android	6.80	108	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	11.0	\N	2.4GHz
169	Galaxy S20	Samsung	20	800	LTE	Wi-Fi	Android	6.20	64	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	10.0	\N	2.4GHz
170	iPhone 11 Pro Max	Apple	30	1100	LTE	Wi-Fi	iOS	6.50	12	Face ID, Accelerometer, Gyro, Proximity, Compass, Barometer	\N	13.3	2.4GHz
171	iPhone 11	Apple	40	800	LTE	Wi-Fi	iOS	6.10	12	Face ID, Accelerometer, Gyro, Proximity, Compass, Barometer	\N	13.3	2.4GHz
172	Mate 40 Pro	Huawei	20	900	LTE	Wi-Fi	Android	6.76	50	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	10.0	\N	2.4GHz
173	Mate 40	Huawei	15	700	LTE	Wi-Fi	Android	6.40	48	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	10.0	\N	2.4GHz
174	Find X3 Pro	Oppo	10	1000	LTE	Wi-Fi	Android	6.70	50	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	11.0	\N	2.4GHz
175	Find X3	Oppo	15	800	LTE	Wi-Fi	Android	6.40	48	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	11.0	\N	2.4GHz
176	Pixel 6 Pro	Google	10	1000	LTE	Wi-Fi	Android	6.70	108	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	12.0	\N	2.4GHz
177	Pixel 6	Google	15	800	LTE	Wi-Fi	Android	6.40	64	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	12.0	\N	2.4GHz
178	Galaxy Note 20 Ultra	Samsung	20	1400	LTE	Wi-Fi	Android	6.90	108	S-Pen, Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	11.0	\N	2.4GHz
179	Galaxy Note 20	Samsung	25	1000	LTE	Wi-Fi	Android	6.70	64	S-Pen, Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	11.0	\N	2.4GHz
180	Galaxy S21	Samsung	20	800	LTE	Wi-Fi	Android	6.20	108	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	11.0	\N	2.4GHz
181	Galaxy Note 20	Samsung	15	700	LTE	Wi-Fi	Android	6.70	64	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	10.0	\N	2.4GHz
182	iPhone 12 Pro Max	Apple	25	1300	LTE	Wi-Fi	iOS	6.70	12	Face ID, Accelerometer, Gyro, Proximity, Compass, Barometer	\N	14.3	2.4GHz
183	iPhone 12	Apple	30	1000	LTE	Wi-Fi	iOS	6.10	12	Face ID, Accelerometer, Gyro, Proximity, Compass, Barometer	\N	14.3	2.4GHz
184	P40 Pro	Huawei	25	700	LTE	Wi-Fi	Android	6.58	50	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	10.0	\N	2.4GHz
185	P40	Huawei	20	600	LTE	Wi-Fi	Android	6.10	48	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	10.0	\N	2.4GHz
186	Reno5 Pro	Oppo	15	500	LTE	Wi-Fi	Android	6.43	50	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	11.0	\N	2.4GHz
187	Disk Phone 1	Button Phones	5	100	2G	Wired	None	\N	0	None	\N	\N	\N
188	Disk Phone 2	Button Phones	10	150	2G	Wired	None	\N	0	None	\N	\N	\N
189	Radio Phone 1	Radio Phones	15	200	2G	Wired	None	\N	0	None	\N	\N	\N
190	Radio Phone 2	Radio Phones	20	250	2G	Wired	None	\N	0	None	\N	\N	\N
191	Galaxy S21 Ultra	Samsung	10	1400	LTE	Wi-Fi	Android	6.80	108	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	11.0	\N	2.4GHz
192	Galaxy S20	Samsung	20	800	LTE	Wi-Fi	Android	6.20	64	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	10.0	\N	2.4GHz
193	iPhone 11 Pro Max	Apple	30	1100	LTE	Wi-Fi	iOS	6.50	12	Face ID, Accelerometer, Gyro, Proximity, Compass, Barometer	\N	13.3	2.4GHz
194	iPhone 11	Apple	40	800	LTE	Wi-Fi	iOS	6.10	12	Face ID, Accelerometer, Gyro, Proximity, Compass, Barometer	\N	13.3	2.4GHz
195	Mate 40 Pro	Huawei	20	900	LTE	Wi-Fi	Android	6.76	50	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	10.0	\N	2.4GHz
196	Mate 40	Huawei	15	700	LTE	Wi-Fi	Android	6.40	48	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	10.0	\N	2.4GHz
197	Find X3 Pro	Oppo	10	1000	LTE	Wi-Fi	Android	6.70	50	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	11.0	\N	2.4GHz
198	Find X3	Oppo	15	800	LTE	Wi-Fi	Android	6.40	48	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	11.0	\N	2.4GHz
199	Pixel 6 Pro	Google	10	1000	LTE	Wi-Fi	Android	6.70	108	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	12.0	\N	2.4GHz
200	Pixel 6	Google	15	800	LTE	Wi-Fi	Android	6.40	64	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	12.0	\N	2.4GHz
201	Galaxy Note 20 Ultra	Samsung	20	1400	LTE	Wi-Fi	Android	6.90	108	S-Pen, Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	11.0	\N	2.4GHz
202	Galaxy Note 20	Samsung	25	1000	LTE	Wi-Fi	Android	6.70	64	S-Pen, Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	11.0	\N	2.4GHz
203	Galaxy S21	Samsung	20	800	LTE	Wi-Fi	Android	6.20	108	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	11.0	\N	2.4GHz
204	Galaxy Note 20	Samsung	15	700	LTE	Wi-Fi	Android	6.70	64	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	10.0	\N	2.4GHz
205	iPhone 12 Pro Max	Apple	25	1300	LTE	Wi-Fi	iOS	6.70	12	Face ID, Accelerometer, Gyro, Proximity, Compass, Barometer	\N	14.3	2.4GHz
206	iPhone 12	Apple	30	1000	LTE	Wi-Fi	iOS	6.10	12	Face ID, Accelerometer, Gyro, Proximity, Compass, Barometer	\N	14.3	2.4GHz
207	P40 Pro	Huawei	25	700	LTE	Wi-Fi	Android	6.58	50	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	10.0	\N	2.4GHz
208	P40	Huawei	20	600	LTE	Wi-Fi	Android	6.10	48	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	10.0	\N	2.4GHz
209	Reno5 Pro	Oppo	15	500	LTE	Wi-Fi	Android	6.43	50	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	11.0	\N	2.4GHz
210	Disk Phone 1	Button Phones	5	100	2G	Wired	None	\N	0	None	\N	\N	\N
211	Disk Phone 2	Button Phones	10	150	2G	Wired	None	\N	0	None	\N	\N	\N
212	Radio Phone 1	Radio Phones	15	200	2G	Wired	None	\N	0	None	\N	\N	\N
213	Radio Phone 2	Radio Phones	20	250	2G	Wired	None	\N	0	None	\N	\N	\N
214	Galaxy S21 Ultra	Samsung	10	1400	LTE	Wi-Fi	Android	6.80	108	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	11.0	\N	2.4GHz
215	Galaxy S20	Samsung	20	800	LTE	Wi-Fi	Android	6.20	64	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	10.0	\N	2.4GHz
216	iPhone 11 Pro Max	Apple	30	1100	LTE	Wi-Fi	iOS	6.50	12	Face ID, Accelerometer, Gyro, Proximity, Compass, Barometer	\N	13.3	2.4GHz
217	iPhone 11	Apple	40	800	LTE	Wi-Fi	iOS	6.10	12	Face ID, Accelerometer, Gyro, Proximity, Compass, Barometer	\N	13.3	2.4GHz
218	Mate 40 Pro	Huawei	20	900	LTE	Wi-Fi	Android	6.76	50	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	10.0	\N	2.4GHz
219	Mate 40	Huawei	15	700	LTE	Wi-Fi	Android	6.40	48	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	10.0	\N	2.4GHz
220	Find X3 Pro	Oppo	10	1000	LTE	Wi-Fi	Android	6.70	50	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	11.0	\N	2.4GHz
221	Find X3	Oppo	15	800	LTE	Wi-Fi	Android	6.40	48	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	11.0	\N	2.4GHz
222	Pixel 6 Pro	Google	10	1000	LTE	Wi-Fi	Android	6.70	108	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	12.0	\N	2.4GHz
223	Pixel 6	Google	15	800	LTE	Wi-Fi	Android	6.40	64	Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	12.0	\N	2.4GHz
224	Galaxy Note 20 Ultra	Samsung	20	1400	LTE	Wi-Fi	Android	6.90	108	S-Pen, Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	11.0	\N	2.4GHz
225	Galaxy Note 20	Samsung	25	1000	LTE	Wi-Fi	Android	6.70	64	S-Pen, Fingerprint, Accelerometer, Gyro, Proximity, Compass, Barometer	11.0	\N	2.4GHz
\.


--
-- Data for Name: purchases; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.purchases (id, phone_id, user_id, is_bought) FROM stdin;
1	6	1	t
2	36	1	t
3	39	5	t
4	41	6	t
5	4	2	t
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, user_name, password, balance) FROM stdin;
3	Aigeli	Aigali05	1000.00
1	Nuradil	root	700.00
5	Gol	lol	2700.00
6	Abay	abbay2994	2500.00
2	Kuat	pop	2300.00
\.


--
-- Name: phones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.phones_id_seq', 225, true);


--
-- Name: purchases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.purchases_id_seq', 5, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 6, true);


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

