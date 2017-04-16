--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- Name: fts test; Type: TEXT SEARCH CONFIGURATION; Schema: public; Owner: lbaw1621
--

CREATE TEXT SEARCH CONFIGURATION "fts test" (
    PARSER = pg_catalog."default" );

ALTER TEXT SEARCH CONFIGURATION "fts test"
    ADD MAPPING FOR asciiword WITH portuguese_stem;

ALTER TEXT SEARCH CONFIGURATION "fts test"
    ADD MAPPING FOR word WITH portuguese_stem;

ALTER TEXT SEARCH CONFIGURATION "fts test"
    ADD MAPPING FOR numword WITH simple;

ALTER TEXT SEARCH CONFIGURATION "fts test"
    ADD MAPPING FOR email WITH simple;

ALTER TEXT SEARCH CONFIGURATION "fts test"
    ADD MAPPING FOR url WITH simple;

ALTER TEXT SEARCH CONFIGURATION "fts test"
    ADD MAPPING FOR host WITH simple;

ALTER TEXT SEARCH CONFIGURATION "fts test"
    ADD MAPPING FOR sfloat WITH simple;

ALTER TEXT SEARCH CONFIGURATION "fts test"
    ADD MAPPING FOR version WITH simple;

ALTER TEXT SEARCH CONFIGURATION "fts test"
    ADD MAPPING FOR hword_numpart WITH simple;

ALTER TEXT SEARCH CONFIGURATION "fts test"
    ADD MAPPING FOR hword_part WITH portuguese_stem;

ALTER TEXT SEARCH CONFIGURATION "fts test"
    ADD MAPPING FOR hword_asciipart WITH portuguese_stem;

ALTER TEXT SEARCH CONFIGURATION "fts test"
    ADD MAPPING FOR numhword WITH simple;

ALTER TEXT SEARCH CONFIGURATION "fts test"
    ADD MAPPING FOR asciihword WITH portuguese_stem;

ALTER TEXT SEARCH CONFIGURATION "fts test"
    ADD MAPPING FOR hword WITH portuguese_stem;

ALTER TEXT SEARCH CONFIGURATION "fts test"
    ADD MAPPING FOR url_path WITH simple;

ALTER TEXT SEARCH CONFIGURATION "fts test"
    ADD MAPPING FOR file WITH simple;

ALTER TEXT SEARCH CONFIGURATION "fts test"
    ADD MAPPING FOR "float" WITH simple;

ALTER TEXT SEARCH CONFIGURATION "fts test"
    ADD MAPPING FOR "int" WITH simple;

ALTER TEXT SEARCH CONFIGURATION "fts test"
    ADD MAPPING FOR uint WITH simple;


ALTER TEXT SEARCH CONFIGURATION "fts test" OWNER TO lbaw1621;

--
-- Name: TEXT SEARCH CONFIGURATION "fts test"; Type: COMMENT; Schema: -; Owner: lbaw1621
--

COMMENT ON TEXT SEARCH CONFIGURATION "fts test" IS 'ver como isto funciona';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: address; Type: TABLE; Schema: public; Owner: lbaw1621; Tablespace: 
--

CREATE TABLE address (
    idaddress integer NOT NULL,
    city text NOT NULL,
    country text NOT NULL,
    doornum text NOT NULL,
    zipcode text NOT NULL,
    street text NOT NULL
);


ALTER TABLE address OWNER TO lbaw1621;

--
-- Name: address_idaddress_seq; Type: SEQUENCE; Schema: public; Owner: lbaw1621
--

CREATE SEQUENCE address_idaddress_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE address_idaddress_seq OWNER TO lbaw1621;

--
-- Name: address_idaddress_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lbaw1621
--

ALTER SEQUENCE address_idaddress_seq OWNED BY address.idaddress;


--
-- Name: billingaddress; Type: TABLE; Schema: public; Owner: lbaw1621; Tablespace: 
--

CREATE TABLE billingaddress (
    idaddress integer NOT NULL,
    nif text NOT NULL,
    phone text NOT NULL
);


ALTER TABLE billingaddress OWNER TO lbaw1621;

--
-- Name: brand; Type: TABLE; Schema: public; Owner: lbaw1621; Tablespace: 
--

CREATE TABLE brand (
    idbrand integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL
);


ALTER TABLE brand OWNER TO lbaw1621;

--
-- Name: brand_idbrand_seq; Type: SEQUENCE; Schema: public; Owner: lbaw1621
--

CREATE SEQUENCE brand_idbrand_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE brand_idbrand_seq OWNER TO lbaw1621;

--
-- Name: brand_idbrand_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lbaw1621
--

ALTER SEQUENCE brand_idbrand_seq OWNED BY brand.idbrand;


--
-- Name: category; Type: TABLE; Schema: public; Owner: lbaw1621; Tablespace: 
--

CREATE TABLE category (
    idcategory integer NOT NULL,
    name text NOT NULL,
    promopercentage integer NOT NULL,
    startdate date,
    enddate date,
    CONSTRAINT category_promopercentage_check CHECK (((promopercentage >= 0) AND (promopercentage <= 100)))
);


ALTER TABLE category OWNER TO lbaw1621;

--
-- Name: category_idcategory_seq; Type: SEQUENCE; Schema: public; Owner: lbaw1621
--

CREATE SEQUENCE category_idcategory_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE category_idcategory_seq OWNER TO lbaw1621;

--
-- Name: category_idcategory_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lbaw1621
--

ALTER SEQUENCE category_idcategory_seq OWNED BY category.idcategory;


--
-- Name: client; Type: TABLE; Schema: public; Owner: lbaw1621; Tablespace: 
--

CREATE TABLE client (
    iduser integer NOT NULL,
    name text NOT NULL,
    password text NOT NULL,
    email text NOT NULL,
    birthdate date NOT NULL,
    address text NOT NULL,
    nif text,
    active boolean,
    admin boolean,
    phonenr integer,
    CONSTRAINT client_password_check CHECK ((char_length(password) > 5))
);


ALTER TABLE client OWNER TO lbaw1621;

--
-- Name: client_iduser_seq; Type: SEQUENCE; Schema: public; Owner: lbaw1621
--

CREATE SEQUENCE client_iduser_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE client_iduser_seq OWNER TO lbaw1621;

--
-- Name: client_iduser_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lbaw1621
--

ALTER SEQUENCE client_iduser_seq OWNED BY client.iduser;


--
-- Name: complaint; Type: TABLE; Schema: public; Owner: lbaw1621; Tablespace: 
--

CREATE TABLE complaint (
    idcomplaint integer NOT NULL,
    createdate date NOT NULL,
    title text NOT NULL,
    description text NOT NULL,
    iduser integer NOT NULL,
    idproduct integer NOT NULL,
    idpurchase integer NOT NULL
);


ALTER TABLE complaint OWNER TO lbaw1621;

--
-- Name: complaint_idcomplaint_seq; Type: SEQUENCE; Schema: public; Owner: lbaw1621
--

CREATE SEQUENCE complaint_idcomplaint_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE complaint_idcomplaint_seq OWNER TO lbaw1621;

--
-- Name: complaint_idcomplaint_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lbaw1621
--

ALTER SEQUENCE complaint_idcomplaint_seq OWNED BY complaint.idcomplaint;


--
-- Name: image; Type: TABLE; Schema: public; Owner: lbaw1621; Tablespace: 
--

CREATE TABLE image (
    idimage integer NOT NULL,
    name text NOT NULL,
    url text NOT NULL
);


ALTER TABLE image OWNER TO lbaw1621;

--
-- Name: image_idimage_seq; Type: SEQUENCE; Schema: public; Owner: lbaw1621
--

CREATE SEQUENCE image_idimage_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE image_idimage_seq OWNER TO lbaw1621;

--
-- Name: image_idimage_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lbaw1621
--

ALTER SEQUENCE image_idimage_seq OWNED BY image.idimage;


--
-- Name: product; Type: TABLE; Schema: public; Owner: lbaw1621; Tablespace: 
--

CREATE TABLE product (
    idproduct integer NOT NULL,
    name text NOT NULL,
    idimage integer NOT NULL,
    idcategory integer NOT NULL,
    idbrand integer NOT NULL,
    price numeric NOT NULL,
    stock integer NOT NULL,
    weight numeric NOT NULL,
    width numeric NOT NULL,
    height numeric NOT NULL,
    description text NOT NULL,
    CONSTRAINT product_height_check CHECK ((height > (0)::numeric)),
    CONSTRAINT product_price_check CHECK ((price > (0)::numeric)),
    CONSTRAINT product_stock_check CHECK ((stock >= 0)),
    CONSTRAINT product_weight_check CHECK ((weight > (0)::numeric)),
    CONSTRAINT product_width_check CHECK ((width > (0)::numeric))
);


ALTER TABLE product OWNER TO lbaw1621;

--
-- Name: product_idproduct_seq; Type: SEQUENCE; Schema: public; Owner: lbaw1621
--

CREATE SEQUENCE product_idproduct_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE product_idproduct_seq OWNER TO lbaw1621;

--
-- Name: product_idproduct_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lbaw1621
--

ALTER SEQUENCE product_idproduct_seq OWNED BY product.idproduct;


--
-- Name: purchase; Type: TABLE; Schema: public; Owner: lbaw1621; Tablespace: 
--

CREATE TABLE purchase (
    idpurchase integer NOT NULL,
    checkoutdate date NOT NULL,
    iduser integer NOT NULL
);


ALTER TABLE purchase OWNER TO lbaw1621;

--
-- Name: purchase_idpurchase_seq; Type: SEQUENCE; Schema: public; Owner: lbaw1621
--

CREATE SEQUENCE purchase_idpurchase_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE purchase_idpurchase_seq OWNER TO lbaw1621;

--
-- Name: purchase_idpurchase_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lbaw1621
--

ALTER SEQUENCE purchase_idpurchase_seq OWNED BY purchase.idpurchase;


--
-- Name: purchaseproduct; Type: TABLE; Schema: public; Owner: lbaw1621; Tablespace: 
--

CREATE TABLE purchaseproduct (
    idproduct integer NOT NULL,
    idpurchase integer NOT NULL,
    price numeric NOT NULL,
    quantity integer,
    CONSTRAINT purchaseproduct_price_check CHECK ((price > (0)::numeric)),
    CONSTRAINT purchaseproduct_quantity_check CHECK ((quantity > 0))
);


ALTER TABLE purchaseproduct OWNER TO lbaw1621;

--
-- Name: review; Type: TABLE; Schema: public; Owner: lbaw1621; Tablespace: 
--

CREATE TABLE review (
    iduser integer NOT NULL,
    idproduct integer NOT NULL,
    date date NOT NULL,
    rating numeric NOT NULL,
    description text,
    CONSTRAINT review_rating_check CHECK (((rating >= (0)::numeric) AND (rating <= (5)::numeric)))
);


ALTER TABLE review OWNER TO lbaw1621;

--
-- Name: shippingaddress; Type: TABLE; Schema: public; Owner: lbaw1621; Tablespace: 
--

CREATE TABLE shippingaddress (
    idaddress integer NOT NULL
);


ALTER TABLE shippingaddress OWNER TO lbaw1621;

--
-- Name: shoppingcart; Type: TABLE; Schema: public; Owner: lbaw1621; Tablespace: 
--

CREATE TABLE shoppingcart (
    iduser integer NOT NULL,
    idproduct integer NOT NULL,
    quantity integer NOT NULL,
    CONSTRAINT shoppingcart_quantity_check CHECK ((quantity > 0))
);


ALTER TABLE shoppingcart OWNER TO lbaw1621;

--
-- Name: wishlist; Type: TABLE; Schema: public; Owner: lbaw1621; Tablespace: 
--

CREATE TABLE wishlist (
    iduser integer NOT NULL,
    idproduct integer NOT NULL,
    url text NOT NULL
);


ALTER TABLE wishlist OWNER TO lbaw1621;

--
-- Name: idaddress; Type: DEFAULT; Schema: public; Owner: lbaw1621
--

ALTER TABLE ONLY address ALTER COLUMN idaddress SET DEFAULT nextval('address_idaddress_seq'::regclass);


--
-- Name: idbrand; Type: DEFAULT; Schema: public; Owner: lbaw1621
--

ALTER TABLE ONLY brand ALTER COLUMN idbrand SET DEFAULT nextval('brand_idbrand_seq'::regclass);


--
-- Name: idcategory; Type: DEFAULT; Schema: public; Owner: lbaw1621
--

ALTER TABLE ONLY category ALTER COLUMN idcategory SET DEFAULT nextval('category_idcategory_seq'::regclass);


--
-- Name: iduser; Type: DEFAULT; Schema: public; Owner: lbaw1621
--

ALTER TABLE ONLY client ALTER COLUMN iduser SET DEFAULT nextval('client_iduser_seq'::regclass);


--
-- Name: idcomplaint; Type: DEFAULT; Schema: public; Owner: lbaw1621
--

ALTER TABLE ONLY complaint ALTER COLUMN idcomplaint SET DEFAULT nextval('complaint_idcomplaint_seq'::regclass);


--
-- Name: idimage; Type: DEFAULT; Schema: public; Owner: lbaw1621
--

ALTER TABLE ONLY image ALTER COLUMN idimage SET DEFAULT nextval('image_idimage_seq'::regclass);


--
-- Name: idproduct; Type: DEFAULT; Schema: public; Owner: lbaw1621
--

ALTER TABLE ONLY product ALTER COLUMN idproduct SET DEFAULT nextval('product_idproduct_seq'::regclass);


--
-- Name: idpurchase; Type: DEFAULT; Schema: public; Owner: lbaw1621
--

ALTER TABLE ONLY purchase ALTER COLUMN idpurchase SET DEFAULT nextval('purchase_idpurchase_seq'::regclass);


--
-- Data for Name: address; Type: TABLE DATA; Schema: public; Owner: lbaw1621
--

COPY address (idaddress, city, country, doornum, zipcode, street) FROM stdin;
1	Guardia Perticara	Svalbard and Jan Mayen Islands	152	24665	729-4894 Orci Avenue
2	Nuraminis	Puerto Rico	46	87759	865 Libero St.
3	Sint-Pieters-Kapelle	Comoros	51	65-490	P.O. Box 883, 6457 Enim. Rd.
4	Neerglabbeek	Romania	5	7563	303-5552 Pellentesque, St.
5	Savannah	Niger	169	00360	P.O. Box 649, 9412 Pharetra Av.
6	Gosselies	Mauritania	138	918864	P.O. Box 151, 5124 Commodo Avenue
7	Villenave-d'Ornon	Honduras	26	04445	1043 Morbi St.
8	Ross-on-Wye	Yemen	154	6236	118-8212 Malesuada St.
9	Noisy-le-Grand	Liberia	45	98805	332 Nonummy Road
10	Sint-Pieters-Kapelle	Puerto Rico	120	876537	P.O. Box 151, 1484 Ligula. Street
11	Ternat	Taiwan	18	03-985	Ap #392-7333 Dictum Road
12	Liernu	Benin	109	1946	Ap #472-5909 Quam Av.
13	Rizes	Norfolk Island	50	41100	819-3755 Nisl. Av.
14	Soma	French Polynesia	14	70-674	P.O. Box 384, 369 Etiam Ave
15	Campos dos Goytacazes	Russian Federation	84	00994	102-6831 In, Avenue
16	Ukkel	French Polynesia	158	2237	593-8485 Eleifend Ave
17	Kerikeri	Nigeria	53	95844	Ap #559-5526 Semper, St.
18	Konin	Slovenia	187	66258	675 Id Rd.
19	Purranque	Saint Vincent and The Grenadines	141	650521	P.O. Box 233, 7741 Donec Road
20	Knokke	Western Sahara	112	23035	P.O. Box 640, 2250 Mollis. Road
21	Nobressart	Solomon Islands	36	1279RT	4623 Rutrum Av.
22	Merrickville-Wolford	Latvia	17	2573	1226 Risus. Road
23	Midlands	New Caledonia	84	3171OI	Ap #875-3161 Purus. Street
24	Vancouver	Mongolia	148	24182	797-853 At, St.
25	Ferlach	Holy See (Vatican City State)	154	64854	Ap #673-4357 Vel Rd.
26	Westmount	Cocos (Keeling) Islands	52	8497	989-6745 Nulla St.
27	Wanzele	United States	193	30702	4478 Non, Av.
28	Brye	Canada	151	14245	P.O. Box 574, 1717 Euismod Avenue
29	Tallahassee	Honduras	178	47-071	P.O. Box 874, 9452 Est, Rd.
30	Sart-Dames-Avelines	Nicaragua	157	K5A 9Z8	Ap #197-3023 Pharetra. Rd.
31	Montluçon	Latvia	118	90153	4994 Ullamcorper. Ave
32	Wenduine	Poland	32	93282	P.O. Box 626, 1601 Fermentum St.
33	Bredene	Wallis and Futuna	135	58641	Ap #868-8345 Nunc Avenue
34	Acquasanta Terme	Svalbard and Jan Mayen Islands	131	5236	7539 Nunc Road
35	Jerez de la Frontera	Wallis and Futuna	42	21715	Ap #273-7448 Congue. Ave
36	Wisbech	Macedonia	30	120946	P.O. Box 739, 9575 Id Ave
37	Kitscoty	Togo	173	467476	P.O. Box 590, 3897 Erat. Avenue
38	Lübeck	Saudi Arabia	79	8858	298-8732 Quisque Road
39	Suruç	Paraguay	127	44-342	Ap #529-1775 Lacinia Av.
40	Merritt	Belarus	50	113968	P.O. Box 510, 4765 Nulla Rd.
41	Maransart	Slovakia	92	LQ6S 2LD	325-2725 In Street
42	Albury	Aruba	173	68056	P.O. Box 231, 8036 Mi, Street
43	Kingston	Fiji	183	47158	Ap #114-7458 Magna Rd.
44	College	Armenia	40	445816	P.O. Box 821, 4752 Sit St.
45	Sens	Curaçao	182	257946	167-3951 Lorem Rd.
46	Lublin	India	133	4118	374-226 Magnis St.
47	Acquasanta Terme	Mauritania	59	817028	3052 Gravida Road
48	Vellore	Guernsey	3	3973JT	4396 Egestas. Street
49	Liverpool	Iran	96	033351	8192 Tristique St.
50	Zamora	Benin	115	964113	Ap #539-235 Amet Street
51	Viggiano	Singapore	169	6989	115-6843 Dui. Av.
52	Borchtlombeek	Trinidad and Tobago	50	9682	4204 Sociis Rd.
53	Clermont-Ferrand	Cook Islands	133	0117XY	Ap #428-9271 Nunc Rd.
54	Oteppe	Liberia	178	97251	P.O. Box 774, 7883 Praesent Rd.
55	Homburg	Papua New Guinea	134	9969	856-7391 Tempus, Street
56	Recanati	United Arab Emirates	183	20803	P.O. Box 737, 1653 Lectus St.
57	West Valley City	Serbia	12	51809	908-8999 Lectus Rd.
58	La Hulpe	New Zealand	22	7388	Ap #264-445 Parturient Ave
59	Rhayader	Saint Kitts and Nevis	187	245004	P.O. Box 112, 7028 Nec Ave
60	Abolens	Saint Helena, Ascension and Tristan da Cunha	17	04226	Ap #956-5404 Donec Av.
61	Boston	Mali	51	61804	Ap #666-7461 Posuere Road
62	Shillong	Korea, South	182	38482	Ap #732-4763 Est Ave
63	Bari	Jordan	142	09755	P.O. Box 443, 9418 Metus. St.
64	Kurnool	Georgia	35	90140	Ap #196-7802 Ac, Road
65	Vauda Canavese	Antigua and Barbuda	129	8756	Ap #440-3024 Rhoncus St.
66	Chiari	Rwanda	167	410959	303-8110 Tempor Avenue
67	Dubbo	Tonga	153	11814	307-972 Nunc Avenue
68	Mata de Plátano	Brazil	196	6702	P.O. Box 924, 4475 Sem Ave
69	Torgnon	Finland	158	8106WO	Ap #209-5906 Aliquam St.
70	Sint-Denijs	Cyprus	126	9529	P.O. Box 212, 6339 Arcu. Ave
71	İzmit	Puerto Rico	91	3085	Ap #520-2283 Euismod Road
72	Assen	Northern Mariana Islands	3	H2J 8B9	Ap #420-9208 Ligula. St.
73	Comblain-la-Tour	Rwanda	7	40017	Ap #772-4658 Velit Ave
74	Tumbler Ridge	Oman	108	13438	P.O. Box 823, 738 Diam Av.
75	Roux	Niue	42	46-461	7567 Molestie St.
76	Ohain	Congo (Brazzaville)	7	72254	604-7818 Est. Rd.
77	Amsterdam	Taiwan	183	3619	3979 Felis Rd.
78	Brora	Nigeria	114	56178	Ap #378-9967 Placerat St.
79	Saint-Mard	Uzbekistan	174	2788	P.O. Box 886, 9678 Nunc Avenue
80	Burdinne	Isle of Man	50	99874	Ap #911-7315 Varius. Rd.
81	South Burlington	Gibraltar	113	60406	9712 Duis St.
82	Serralunga d'Alba	Croatia	46	975767	P.O. Box 539, 3898 Nunc Road
83	Carbonear	Honduras	72	50816	P.O. Box 496, 2178 Dis Avenue
84	Buggenhout	Norfolk Island	84	84-457	4447 Justo. Rd.
85	Carmen	Antigua and Barbuda	162	2337	Ap #253-1015 Fringilla Av.
86	Indore	Malaysia	59	46561	Ap #348-8562 Non, Road
87	St. Veit an der Glan	Slovakia	141	83915	4679 Imperdiet Road
88	Avennes	United States Minor Outlying Islands	86	23473	P.O. Box 852, 9528 Non, St.
89	Essex	Kazakhstan	81	07168-234	P.O. Box 406, 7537 Ornare Ave
90	Kitscoty	Japan	191	08103-184	Ap #102-6624 Natoque Ave
91	Saint Paul	Brazil	150	576203	P.O. Box 232, 5753 Curabitur Road
92	Kingston	Mauritania	59	92-468	9735 Ut Avenue
93	Bath	France	104	9111	9556 Orci. Ave
94	Bellevue	Guatemala	77	19257	3989 Vel St.
95	Opprebais	French Guiana	73	1184	Ap #311-3543 Nonummy Ave
96	Opwijk	Bhutan	79	8389	P.O. Box 191, 1162 Nec, Rd.
97	Hamburg	Papua New Guinea	194	4727	P.O. Box 243, 6297 Diam. Ave
98	Bergen op Zoom	Gabon	143	2570TN	Ap #709-7805 Tempus Ave
99	Valbrevenna	Romania	102	23618	P.O. Box 959, 2968 Risus, St.
100	Bad Ischl	French Polynesia	154	20402	2128 Enim Ave
\.


--
-- Name: address_idaddress_seq; Type: SEQUENCE SET; Schema: public; Owner: lbaw1621
--

SELECT pg_catalog.setval('address_idaddress_seq', 1, false);


--
-- Data for Name: billingaddress; Type: TABLE DATA; Schema: public; Owner: lbaw1621
--

COPY billingaddress (idaddress, nif, phone) FROM stdin;
1	2348392326385	476-5439
2	5546438163146	732-8836
3	5096942977980	730-0728
4	4026583628729	882-1228
5	4348056730814	958-6138
6	2348275054246	1-292-844-0443
7	2086725262925	744-3596
8	9159239511936	1-435-264-3499
9	8370276591740	296-2448
10	9639148181304	936-1534
11	4917811043561	420-8924
12	8292347481474	993-5478
13	607745619491	1-824-140-2567
14	6250439942814	1-804-594-2366
15	7237987355329	489-2634
16	9236531890928	703-5444
17	5831219814718	1-833-730-2713
18	7601024117321	1-111-954-2055
19	1248131082394	1-973-876-6168
20	4131845170632	1-770-660-2549
21	3320994069800	1-974-307-8580
22	549479317852	730-1852
23	6252506230958	104-2359
24	9955710265785	1-133-557-6158
25	7393278521485	864-4826
26	6166329095140	935-4852
27	6516937818378	162-8605
28	6646125488914	1-817-363-6755
29	9971462609246	106-7025
30	7754224529490	1-444-662-2985
31	6581568727270	875-7705
32	9512211955152	978-3477
33	6442325515672	342-3114
34	9064109181054	1-471-170-6474
35	4309889357537	280-3602
36	519970976748	1-967-110-9527
37	6117458082735	489-7325
38	7675219480879	1-712-518-5442
39	5802746792324	1-304-781-0146
40	8408041121438	934-7491
41	26624538005	1-664-370-9683
42	3159003662877	587-9308
43	5654741972685	251-7465
44	2908950299025	187-7898
45	9800861570984	296-2365
46	2272097566165	842-0792
47	4530189190991	156-2331
48	4093667990528	1-377-311-3303
49	7692161886953	1-676-268-3650
50	4832310806960	179-8256
51	3273177687079	1-956-231-9158
52	1298273466528	1-583-143-4895
53	1238150410355	741-6883
54	6568059632554	669-0301
55	4124641525559	817-9247
56	1970614343882	850-1361
57	6320931040682	1-136-500-6239
58	7820909945294	1-873-732-4936
59	1488852547482	704-7607
60	4132743347436	819-9273
61	8882383196614	1-964-647-3496
62	6395206656307	1-229-537-6014
63	8289065500721	552-7608
64	3220610404387	1-629-622-2578
65	9017041316256	1-647-837-9517
66	7545424099080	1-590-109-7715
67	4987694453448	918-7528
68	138818589040	337-8551
69	2753545376472	667-4223
70	5893763555214	182-5972
71	4668165151961	864-4448
72	5001329570077	469-2095
73	6914962455630	897-2024
74	9734440040774	368-7594
75	6367250727489	1-846-171-0977
76	8686772780493	842-8245
77	5747569464147	1-711-392-4743
78	4206962883473	1-226-797-8751
79	9542207783088	228-5836
80	4401112380438	1-768-412-6763
81	181427118369	983-7597
82	4315915131010	355-4590
83	4336883542128	790-5109
84	4809007216245	393-9193
85	1908266926185	380-7804
86	3253907239996	367-0491
87	9321352848783	1-423-752-8453
88	2727571581491	1-469-444-3547
89	8387807724066	1-162-116-4726
90	9729708400554	1-649-786-2992
91	2724680393003	1-129-550-2638
92	5562941445969	1-195-474-5962
93	6884574727155	661-2431
94	5724712866358	1-627-214-6173
95	5899149831384	1-544-795-6667
96	5357437254861	1-746-622-8822
97	6704915678128	763-4827
98	4774126373231	1-512-224-1541
99	953697809019	307-5991
100	7319350158795	1-939-892-2014
\.


--
-- Data for Name: brand; Type: TABLE DATA; Schema: public; Owner: lbaw1621
--

COPY brand (idbrand, name, email) FROM stdin;
1	nisi.	rutrum
2	cursus	aliquet
3	Etiam	augue.
4	mus.	adipiscing.
5	mi.	arcu.
6	ultrices	vitae
7	amet	odio,
8	nec	ut
9	pharetra	dapibus
10	eros.	mauris
11	purus.	nisl.
12	Cum	orci
13	fermentum	placerat
14	libero	Aliquam
15	pretium	aliquet,
16	ante.	est.
17	odio	blandit
18	lorem,	tellus.
19	fermentum	Maecenas
20	tincidunt	nec
21	quam,	elit.
22	fermentum	et
23	non,	consectetuer
24	amet	ipsum
25	Maecenas	nulla
26	fringilla	eu,
27	sit	in
28	In	mi,
29	mauris	at
30	In	faucibus.
31	Phasellus	interdum
32	ac	volutpat
33	quam.	dui.
34	taciti	at
35	magna	quis,
36	amet	neque.
37	leo	amet,
38	erat	ipsum
39	erat	enim
40	pellentesque	Aliquam
41	Fusce	malesuada
42	Cras	at
43	tortor,	sit
44	dui	et
45	ultricies	odio.
46	tempus	purus.
47	in,	Nulla
48	dictum	amet
49	mi	eleifend
50	eget	blandit
51	enim.	ligula
52	ligula	nec
53	luctus	justo.
54	sit	dapibus
55	Donec	eleifend
56	eleifend,	cursus,
57	fermentum	non
58	imperdiet	montes,
59	non	dolor
60	eros.	feugiat.
61	Curabitur	blandit
62	venenatis	augue
63	sit	vitae
64	nec	et
65	purus	ligula
66	libero	Sed
67	Cras	Phasellus
68	sit	eu
69	molestie.	id,
70	Suspendisse	massa.
71	elit,	quis
72	leo	leo
73	lorem	malesuada
74	vestibulum,	mattis
75	luctus	Aliquam
76	Nulla	sagittis
77	at,	semper
78	mollis	primis
79	dictum	sed
80	Donec	Nunc
81	elit.	a
82	ipsum	Nunc
83	tellus	ad
84	litora	Aliquam
85	sollicitudin	lorem,
86	nascetur	enim
87	augue	auctor
88	Integer	luctus
89	nec,	Curabitur
90	ligula	dapibus
91	adipiscing	velit.
92	dui.	pellentesque
93	Cras	vulputate
94	quis	Mauris
95	et	vestibulum
96	Mauris	ultrices
97	auctor.	dolor
98	tincidunt	malesuada
99	cursus	amet,
100	Nullam	vel,
\.


--
-- Name: brand_idbrand_seq; Type: SEQUENCE SET; Schema: public; Owner: lbaw1621
--

SELECT pg_catalog.setval('brand_idbrand_seq', 1, true);


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: lbaw1621
--

COPY category (idcategory, name, promopercentage, startdate, enddate) FROM stdin;
1	orci.	40	2016-11-08	2017-11-29
2	lacus.	14	2016-07-03	2017-12-17
3	convallis	21	2017-01-24	2017-11-11
4	et	38	2016-10-06	2017-06-05
5	aliquet	9	2016-07-08	2017-11-15
6	erat	20	2016-06-15	2017-04-30
7	auctor	20	2016-06-04	2017-05-28
8	eu,	18	2016-05-14	2017-11-21
9	Suspendisse	38	2017-02-08	2017-08-05
10	arcu.	33	2016-04-29	2017-04-26
11	felis.	17	2017-01-10	2017-06-20
12	egestas	13	2017-01-28	2017-09-15
13	tempus	58	2016-07-27	2017-09-16
14	enim	44	2016-12-09	2017-10-01
15	ullamcorper.	44	2016-05-02	2017-07-15
16	rutrum	1	2016-11-12	2017-07-15
17	leo.	32	2016-11-02	2017-10-15
18	semper	4	2016-11-23	2018-01-22
19	Curae;	43	2016-08-27	2018-03-13
20	Donec	5	2016-03-26	2017-12-08
21	neque	16	2016-06-02	2017-05-18
22	lacus	7	2016-12-17	2017-04-13
23	ipsum	28	2016-10-06	2018-03-21
24	libero	32	2017-01-14	2017-10-28
25	nibh	7	2016-09-28	2017-08-04
26	urna.	39	2016-07-23	2017-08-27
27	auctor	59	2017-01-29	2018-01-04
28	in,	44	2016-09-03	2018-02-03
29	lorem	22	2016-05-15	2017-07-20
30	cursus	20	2017-03-12	2018-02-21
31	Sed	15	2016-09-23	2017-04-08
32	odio	38	2016-05-09	2018-03-01
33	nulla.	55	2016-10-24	2017-12-26
34	blandit	6	2016-07-21	2017-10-24
35	ut	30	2016-09-22	2017-08-06
36	iaculis	35	2016-08-31	2017-09-27
37	et	36	2016-11-22	2017-05-18
38	nibh	1	2016-08-16	2018-02-15
39	odio	18	2016-10-29	2017-09-19
40	magnis	16	2016-10-19	2017-11-15
41	aliquet,	36	2016-10-13	2018-01-21
42	metus	13	2016-07-17	2018-03-19
43	sem	59	2017-01-20	2017-12-12
44	ac	29	2016-07-25	2017-03-30
45	lobortis.	39	2016-11-19	2017-11-26
46	hendrerit	46	2016-12-07	2017-10-02
47	at	13	2016-11-03	2018-03-22
48	Sed	27	2016-03-27	2018-01-26
49	libero	51	2016-10-21	2017-07-23
50	augue	16	2016-12-18	2017-06-06
51	luctus	16	2017-03-13	2017-04-08
52	quis,	3	2016-12-18	2017-10-23
53	libero	9	2016-04-05	2017-09-12
54	aliquet,	53	2016-12-09	2018-03-07
55	vehicula	16	2016-08-11	2018-03-06
56	sagittis	30	2016-04-18	2017-09-12
57	ornare.	14	2017-02-14	2018-01-01
58	non,	0	2016-07-29	2018-03-18
59	Phasellus	30	2017-02-05	2018-02-24
60	cubilia	12	2016-06-17	2018-02-06
61	nec	27	2016-05-15	2017-09-05
62	ante	48	2016-09-03	2017-08-19
63	Aliquam	43	2017-01-10	2017-11-22
64	scelerisque	57	2017-03-05	2017-05-03
65	ut	33	2017-01-11	2017-11-11
66	aliquam,	57	2017-01-13	2018-02-23
67	ut,	41	2017-02-02	2017-10-11
68	Suspendisse	2	2016-11-21	2017-07-02
69	vel	13	2016-12-18	2018-01-01
70	Etiam	50	2017-01-03	2017-08-21
71	sit	20	2016-11-05	2017-04-04
72	non	60	2016-09-08	2017-11-14
73	erat	45	2016-07-22	2017-07-01
74	viverra.	19	2017-02-28	2017-07-06
75	Ut	60	2016-05-31	2017-03-26
76	nunc	49	2016-10-12	2017-06-09
77	ut,	44	2016-06-13	2017-06-18
78	metus.	13	2016-07-11	2017-06-04
79	enim,	3	2016-06-10	2017-04-23
80	ultrices,	0	2016-06-02	2017-07-15
81	nisl	23	2016-07-21	2018-01-28
82	Duis	23	2016-12-12	2017-05-04
83	neque.	6	2017-01-13	2017-11-05
84	vehicula.	58	2016-12-20	2017-12-18
85	dictum	30	2017-02-28	2017-11-01
86	Mauris	47	2016-04-16	2017-05-26
87	purus	1	2016-06-19	2017-04-26
88	enim.	26	2016-09-11	2018-02-12
89	convallis	40	2017-01-30	2017-08-31
90	Nam	41	2016-07-07	2018-01-24
91	Proin	41	2016-12-27	2018-03-16
92	pede,	17	2016-04-16	2017-12-03
93	nunc	10	2017-03-24	2017-04-21
94	semper.	31	2016-09-30	2017-10-15
95	Cras	2	2016-12-31	2017-11-04
96	a	34	2016-05-05	2017-08-02
97	volutpat	35	2016-09-16	2017-11-15
98	ac	47	2016-06-08	2017-11-22
99	eget	11	2016-10-08	2017-04-23
100	nascetur	19	2017-03-17	2017-07-28
\.


--
-- Name: category_idcategory_seq; Type: SEQUENCE SET; Schema: public; Owner: lbaw1621
--

SELECT pg_catalog.setval('category_idcategory_seq', 1, false);


--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: lbaw1621
--

COPY client (iduser, name, password, email, birthdate, address, nif, active, admin, phonenr) FROM stdin;
1	Leigh Chan	1691082564199	egestas@diamProindolor.net	1956-06-11	P.O. Box 970, 4234 Aliquam Rd.	1635011577699	t	t	895425201
2	Madison Wise	1636122400099	diam.Duis@sed.net	1929-11-21	343-2021 Malesuada Avenue	1602031325099	t	t	159530934
3	Holly Roy	1618030769899	volutpat.nunc@Aenean.edu	1985-10-01	Ap #696-1873 Quam Avenue	1624032297499	t	t	222391971
4	Emily Valdez	1611010826799	tristique.ac@ProindolorNulla.ca	1929-08-11	730-6654 Non St.	1668030837099	t	t	573280387
5	Judith Ford	1686010914899	at@malesuada.ca	1948-08-04	3862 Sit Rd.	1695031834099	t	t	301893155
6	Ima Quinn	1604122544899	sit@metussit.net	1987-12-10	9311 Proin St.	1632061330699	t	t	129462450
7	Lewis Alvarez	1657042015299	tempus.non.lacinia@mattisornarelectus.com	1911-12-20	Ap #238-5916 Nibh. Ave	1633120167899	t	t	757562043
8	Wade Mccoy	1639063032499	tortor.Nunc.commodo@anteVivamusnon.com	1982-01-23	9115 Et, Rd.	1660080688999	t	t	376445758
9	Erasmus Norman	1680122138899	Nullam.lobortis@nuncac.edu	1953-03-30	7948 Morbi Ave	1601122589499	t	t	235352312
10	Dahlia Conley	1662110731799	felis.ullamcorper.viverra@dapibusquamquis.net	1911-04-07	5428 Laoreet, Avenue	1603121708499	t	t	300597989
11	Meghan Austin	1611041461299	magna.a@egestas.net	1945-11-06	2278 Quis Road	1600091733399	t	t	193009768
12	Irma Hodges	1668082664999	sit.amet.massa@lorem.org	1930-06-30	5253 Erat, Ave	1628103083699	t	t	192548598
13	Jael Brock	1656121609999	urna.nec@MorbimetusVivamus.ca	1925-06-05	938-9656 Nonummy Road	1639122497799	t	t	108810588
14	Nissim Woodward	1660032607799	Donec.felis@massa.ca	1980-03-24	9335 Feugiat Rd.	1691072326099	t	t	784405282
15	Sade Holder	1618122775699	tortor.at@lectus.co.uk	1932-08-05	Ap #630-5309 At, Avenue	1653021872699	t	t	940063435
16	Nadine Noble	1649042309699	Proin@nequepellentesquemassa.edu	1927-10-06	720-8930 Pede Rd.	1652022517899	t	t	566464663
17	Quamar Mcbride	1685071342499	nunc@vehicula.com	1932-05-11	Ap #188-2204 Natoque St.	1645110115699	t	t	280448069
18	William Cash	1662031775599	tincidunt.pede@magnaSedeu.net	1945-02-04	Ap #861-1728 In Av.	1653010453999	t	t	233772166
19	Tallulah Melton	1696112090199	euismod.ac.fermentum@magnaa.com	1957-04-25	Ap #725-3732 Hendrerit St.	1658050981499	t	t	386404238
20	Skyler Mullen	1637083053399	hendrerit@facilisis.com	1939-07-20	P.O. Box 456, 3389 Mattis Road	1657011277699	t	t	654621357
21	Cade Dunn	1649061127599	Cras.dolor@ullamcorper.org	1915-09-23	Ap #453-2411 Velit St.	1649022045899	t	t	792836347
22	Ingrid Fitzgerald	1654042107899	eget.ipsum.Suspendisse@interdumNunc.ca	1949-03-12	1930 Tincidunt, Road	1635020805599	t	t	116888482
23	Nomlanga Decker	1612072867099	volutpat.Nulla.facilisis@musProin.org	1978-11-29	P.O. Box 166, 5516 Malesuada Rd.	1689022798499	t	t	952121775
24	Zachery Finley	1693050395699	sed@uterat.com	1946-10-24	Ap #108-8395 Magna Rd.	1639122978099	t	t	728896361
25	Desiree Rhodes	1636091444399	ipsum.Phasellus@Morbinonsapien.net	1975-11-05	Ap #774-7196 Tortor Avenue	1611040498099	t	t	786910580
26	Urielle Pennington	1601032051199	magna.a.neque@ataugue.org	1972-11-15	607-9932 Nec, Ave	1694081219899	t	t	717144767
27	Marsden Clark	1670110295299	dignissim.tempor@rutrummagna.ca	1952-02-01	6730 Diam. St.	1655060167399	t	t	778660887
28	Odessa Oneill	1688092209499	venenatis.lacus.Etiam@montesnasceturridiculus.com	1976-05-20	Ap #686-5584 Et Av.	1609031330099	t	t	807153961
29	Aurora Guerra	1689052795399	a.magna@Nuncquis.net	1913-02-20	Ap #823-3428 Commodo Street	1689042474599	t	t	736542089
30	Jeanette Johnson	1655111172999	varius.ultrices.mauris@necmaurisblandit.ca	1992-10-29	3387 Est, Road	1609102436699	t	t	302229801
31	Preston White	1629110142799	vel.quam@Morbimetus.co.uk	1917-04-24	P.O. Box 635, 6725 Sapien. St.	1678030782399	t	t	669822054
32	Fredericka Griffin	1671122310099	augue.porttitor@ligula.ca	1982-10-16	3965 Morbi Avenue	1646050368999	t	t	246431442
33	Ramona Fields	1694060258999	Sed@venenatisvel.com	1936-04-10	6919 Tristique Rd.	1655061899599	t	t	113611236
34	Carla Rivers	1672091225699	Duis@Cras.net	1971-03-17	299-2581 Ipsum Street	1612070356599	t	t	826043570
35	Nelle Fox	1677111087299	dapibus.rutrum.justo@ante.net	1945-05-12	Ap #172-5178 Tellus Road	1618043088999	t	t	605320948
36	Clio Jordan	1602100606999	eget.dictum.placerat@commodotincidunt.co.uk	1942-12-29	Ap #793-860 Hendrerit Av.	1659030421799	t	t	654815690
37	Maya Goff	1602070936899	sagittis.augue@cursusluctusipsum.org	1958-08-03	7093 Imperdiet Street	1670082971499	t	t	162822810
38	Lacey Myers	1658071136899	ante@nostraper.net	1959-12-28	600-8141 Risus Av.	1629041059199	t	t	826795048
39	Lillith Mccarty	1685072832399	consequat.lectus.sit@rhoncus.org	1942-01-31	P.O. Box 248, 9521 Amet Road	1684122406999	t	t	598778332
40	Dalton Cameron	1686030737699	mauris@adlitora.org	1920-04-13	867-9364 Euismod Ave	1681071557899	t	t	457352811
41	Thomas Austin	1665071923299	lobortis@Aeneansedpede.com	1945-09-03	Ap #624-6017 Erat, Ave	1668102978799	t	t	687190588
42	Samson Bradley	1655011802099	mus.Donec@velitPellentesqueultricies.org	1971-09-22	286-9263 Eu St.	1639122154399	t	t	687914522
43	Nissim Martin	1610012497799	in@magnisdisparturient.org	1987-11-05	P.O. Box 580, 4106 Donec Rd.	1698040379999	t	t	158577639
44	Lysandra Clarke	1699011264799	sapien@egetlacusMauris.org	1921-02-10	5890 Sed Ave	1613040627299	t	t	371422315
45	Odette Hurst	1656053057799	mollis.non.cursus@facilisisfacilisismagna.edu	1937-12-19	479-3117 Nam Avenue	1676091078299	t	t	379684212
46	Caldwell Miles	1617101374599	Aliquam.fringilla.cursus@velit.com	1919-04-12	P.O. Box 537, 4329 Dictum Avenue	1631112127099	t	t	656325729
47	Ann Marquez	1682061703299	pede.ac.urna@nonummyultriciesornare.ca	1917-08-17	2337 Nec St.	1611112616199	t	t	624606250
48	Jena Gallegos	1638040449299	ultricies.adipiscing@eratvitae.org	1965-04-09	Ap #127-2994 Non St.	1649032893599	t	t	213920180
49	Denise Hebert	1626092112099	tincidunt.dui@cubilia.edu	1957-10-06	Ap #613-2520 Pretium Rd.	1612042742499	t	t	422486099
50	Jack Heath	1634090423499	nascetur@atnisi.org	1934-11-07	Ap #997-4511 Sem, Av.	1631112109199	t	t	925001593
51	Demetrius Valencia	1633110119999	sem.ut.cursus@magna.edu	1990-09-06	392-4584 Nam St.	1681032232699	t	t	142047419
52	Kim Oconnor	1603120768399	pede.blandit@vestibulumMaurismagna.org	1943-08-28	176-8076 Nulla St.	1602091045099	t	t	423941903
53	Tara Kirby	1629082527399	turpis.nec@vestibulum.ca	1956-01-26	Ap #189-7807 Ipsum Avenue	1694050894899	t	t	353665692
54	Marshall Harper	1625030288599	Cras@CuraePhasellusornare.org	1927-04-15	308 Id St.	1631023010699	t	t	883814649
55	Althea Compton	1655060441499	auctor@tellus.org	1982-02-24	P.O. Box 698, 2213 Venenatis Street	1638112891099	t	t	278061126
56	Matthew Dean	1621011880699	rhoncus.Proin@Namnulla.edu	1987-08-20	Ap #300-8249 A Av.	1687081356299	t	t	316999430
57	Dane Harvey	1655091988599	Lorem@ametmassaQuisque.edu	1934-11-05	P.O. Box 124, 8834 Eget, Ave	1630122003499	t	t	771658532
58	Venus England	1611121783699	Phasellus.dapibus@arcu.com	1986-07-15	2713 Nunc St.	1683031326399	t	t	709499693
59	Zeph Stein	1697052863299	erat.vitae@Nunclectuspede.com	1919-08-13	P.O. Box 497, 9803 Duis Rd.	1681101139699	t	t	479449222
60	Jonah Solis	1683062083499	Donec@arcuac.org	1929-10-15	Ap #425-5510 Vulputate Ave	1619071021799	t	t	690825014
61	Jerome Garza	1624052611899	massa.Quisque@egetnisidictum.edu	1990-07-13	705-6243 Nulla Avenue	1667021778099	t	t	481754826
62	Yen Vaughn	1643081468799	arcu.eu@elitfermentum.net	1964-07-23	Ap #517-3353 Tempor Av.	1663040968399	t	t	697393844
63	Levi Chase	1602120732799	at.lacus@odioauctor.co.uk	1967-05-22	2776 Ornare Rd.	1693121117499	t	t	829607474
64	Lysandra Harrell	1661010247999	et.magnis@diam.edu	1952-04-13	Ap #717-7497 Ac Avenue	1694020928199	t	t	147025631
65	Ella Barnes	1632080762099	facilisi.Sed@estac.co.uk	1915-12-19	P.O. Box 994, 5388 Eu Rd.	1644040366899	t	t	887954489
66	Ori Burnett	1603061569299	ac.mi.eleifend@elementumloremut.co.uk	1958-10-30	P.O. Box 917, 6988 Nisl. Avenue	1603111032099	t	t	273692893
67	Jeremy Mullen	1629041645599	mi.eleifend@porttitoreros.org	1913-08-18	645-4625 Lectus Rd.	1677090374299	t	t	564470626
68	Idola Dixon	1648081206299	eget.metus@elit.net	1953-10-25	9221 Nibh. Rd.	1684080477399	t	t	319077687
69	Nayda Lee	1692122258499	non@sedsem.edu	1925-03-01	7954 Nunc St.	1614092977199	t	t	527324129
70	Axel Mckay	1651082120699	Nulla.semper@massaIntegervitae.com	1959-02-08	Ap #308-1642 Sed Road	1681100809999	t	t	649106802
71	Nicholas Lewis	1615062490099	vel.arcu@ornareFusce.org	1929-09-22	Ap #488-3632 Imperdiet St.	1627071621299	t	t	238038745
72	Sybil Sosa	1674060302099	Mauris.eu.turpis@magna.com	1977-03-27	Ap #923-3033 Fusce St.	1660010871499	t	t	539746111
73	Lila Duncan	1620111145899	enim.commodo.hendrerit@libero.net	1953-12-09	P.O. Box 676, 2656 Nulla. Av.	1662101114199	t	t	352201925
74	Mia Pierce	1642042582899	nulla.vulputate@ridiculus.edu	1913-12-20	Ap #480-6227 Neque. Rd.	1614110871299	t	t	593870510
75	Jaime Hansen	1684030300799	scelerisque.scelerisque.dui@sem.org	1955-03-25	P.O. Box 812, 8082 Cursus. Ave	1698052787399	t	t	938086929
76	Sawyer Sutton	1683040246899	felis.adipiscing@Sedid.org	1939-01-21	P.O. Box 174, 6645 Nascetur Ave	1667060762099	t	t	208462603
77	Isaac Sexton	1659112765799	blandit.at@Aliquam.edu	1987-03-20	P.O. Box 290, 6539 Rutrum Ave	1608032231999	t	t	755497531
78	Bell Moss	1629071526199	dui.Fusce@velit.net	1914-10-11	3802 Augue St.	1616072159099	t	t	462079620
79	Owen Blevins	1643051151099	non.dui.nec@hendrerit.org	1990-02-28	P.O. Box 307, 3055 Auctor. Avenue	1676050808299	t	t	781387545
80	Carolyn Bennett	1654021632499	at.libero@vulputaterisusa.ca	1927-10-08	140-4749 Ornare St.	1691061168199	t	t	369242185
81	Lyle Huff	1636052276999	porta.elit@nisl.net	1948-01-01	P.O. Box 367, 1500 Purus. Avenue	1676092638099	t	t	273111401
82	Isabelle Skinner	1679092197999	ornare@hendreritnequeIn.org	1926-05-12	3455 Lacinia Road	1696041104999	t	t	483330903
83	Tana Shields	1633121237699	Phasellus.dapibus@eu.com	1951-01-27	P.O. Box 682, 2613 Et Road	1620102033599	t	t	555004554
84	Idola Ray	1697121538599	diam.Sed@fringillaeuismodenim.org	1960-08-17	484-3309 Sit Ave	1634010540199	t	t	785930738
85	Hop Gonzalez	1696092549299	Nunc.mauris.Morbi@DonectinciduntDonec.co.uk	1949-10-02	994-9095 Elementum Street	1609060502399	t	t	186269417
86	Mary Blackburn	1632100635099	elementum.purus.accumsan@gravidamaurisut.org	1958-06-12	P.O. Box 630, 281 Ut Ave	1641081025899	t	t	376261563
87	Beck Osborne	1653071782399	Duis.cursus.diam@diam.net	1975-06-28	8786 Eu Ave	1630102051799	t	t	744069428
88	Rinah Henson	1660081884199	vitae.orci.Phasellus@ipsumDonecsollicitudin.ca	1936-05-29	Ap #549-6998 Vehicula Road	1603100674799	t	t	913956004
89	Alexa Jackson	1600092495899	at@ipsumCurabitur.edu	1955-03-07	Ap #942-377 Magna Rd.	1630041797999	t	t	529860716
90	Louis Glenn	1679080122599	montes.nascetur.ridiculus@antedictumcursus.org	1987-04-06	P.O. Box 550, 3571 Vivamus Street	1647122910199	t	t	250333039
91	Kiayada Gates	1655070914499	Nulla.dignissim@scelerisque.org	1993-11-01	P.O. Box 414, 4429 Natoque St.	1636102566199	t	t	639582009
92	Eaton Robertson	1600050814399	Duis.dignissim@leo.ca	1982-10-15	P.O. Box 478, 5703 Arcu. St.	1695103074999	t	t	424782099
93	Wyoming Ratliff	1619020518099	at@risusDuis.co.uk	1980-10-05	295-5580 Ac Avenue	1695032407699	t	t	611916153
94	Shad Boyd	1663092164499	accumsan.interdum.libero@idrisus.edu	1955-11-21	595-8424 Id, St.	1673072235199	t	t	530385703
95	Eve Griffith	1658070303299	in.consequat@nullaDonecnon.co.uk	1977-04-18	P.O. Box 738, 882 Sagittis Rd.	1657052782599	t	t	702895368
96	Kiara Hull	1617090448999	nulla.magna@elit.net	1944-03-17	P.O. Box 443, 975 Ornare. Avenue	1668010477599	t	t	167920950
97	Ariana Reilly	1668071520699	vitae@ultricesVivamusrhoncus.ca	1931-05-20	357-1434 Et St.	1643041931999	t	t	706553840
98	Celeste Mercer	1685080601499	elementum@pedeblanditcongue.co.uk	1971-01-15	3982 Nulla. Av.	1617032902399	t	t	406251013
99	Keefe Olsen	1670010182299	neque@acarcu.co.uk	1933-07-16	786-1614 Aliquam St.	1603123062699	t	t	194979391
100	Bell Joyner	1614031094199	neque@aliquetsem.org	1949-12-22	401-4253 Suscipit Rd.	1636041709699	t	t	962374354
\.


--
-- Name: client_iduser_seq; Type: SEQUENCE SET; Schema: public; Owner: lbaw1621
--

SELECT pg_catalog.setval('client_iduser_seq', 3, true);


--
-- Data for Name: complaint; Type: TABLE DATA; Schema: public; Owner: lbaw1621
--

COPY complaint (idcomplaint, createdate, title, description, iduser, idproduct, idpurchase) FROM stdin;
1	2018-02-15	tempor diam dictum sapien. Aenean	odio semper	1	1	1
2	2016-10-29	rutrum. Fusce dolor quam, elementum at, egestas a, scelerisque	vulputate velit eu sem. Pellentesque ut ipsum ac mi	2	2	2
3	2017-02-02	erat, eget tincidunt dui augue eu tellus. Phasellus elit pede,	enim consequat purus. Maecenas libero est, congue a,	3	3	3
4	2016-04-10	eros turpis non enim. Mauris quis	Praesent interdum ligula eu enim.	4	4	4
5	2016-07-27	tempor augue ac ipsum. Phasellus vitae mauris sit amet	non	5	5	5
6	2017-02-03	dis parturient montes, nascetur ridiculus mus. Proin vel nisl. Quisque	lectus, a sollicitudin orci sem	6	6	6
7	2017-05-26	nostra,	enim nec tempus scelerisque, lorem ipsum sodales purus, in molestie	7	7	7
8	2017-10-13	lacinia. Sed congue, elit sed consequat auctor,	neque. Nullam	8	8	8
9	2016-09-21	orci. Donec nibh. Quisque nonummy	luctus aliquet odio.	9	9	9
10	2018-02-01	placerat. Cras dictum	Vivamus non lorem vitae odio sagittis semper. Nam tempor	10	10	10
11	2017-07-01	In lorem. Donec elementum, lorem ut aliquam iaculis, lacus	eget, venenatis a, magna. Lorem	11	11	11
12	2017-08-01	ipsum primis in faucibus orci luctus et ultrices	eu arcu. Morbi sit amet	12	12	12
13	2017-03-02	ipsum sodales purus, in molestie tortor	mauris. Morbi non sapien	13	13	13
14	2017-01-14	dis	interdum. Nunc sollicitudin commodo ipsum.	14	14	14
15	2016-05-10	interdum ligula eu enim. Etiam imperdiet dictum	nec ante. Maecenas	15	15	15
16	2016-10-08	Mauris quis turpis vitae purus gravida sagittis. Duis gravida. Praesent	risus varius orci,	16	16	16
17	2017-07-10	eros. Proin ultrices.	ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy ac,	17	17	17
18	2017-02-09	egestas	arcu imperdiet ullamcorper. Duis at lacus. Quisque purus	18	18	18
19	2016-03-26	fringilla est. Mauris eu turpis. Nulla aliquet. Proin velit.	lobortis. Class aptent taciti sociosqu ad	19	19	19
20	2017-11-26	Cum sociis	at, velit. Pellentesque	20	20	20
21	2017-07-10	in magna. Phasellus dolor elit, pellentesque a, facilisis non,	mauris a nunc. In	21	21	21
22	2017-04-10	ac orci. Ut semper pretium neque. Morbi quis	dignissim pharetra. Nam ac nulla. In tincidunt congue	22	22	22
23	2017-09-21	placerat, augue. Sed molestie. Sed id risus quis diam	mollis nec,	23	23	23
24	2017-04-08	nec, mollis	leo. Cras vehicula aliquet libero.	24	24	24
25	2018-01-10	parturient montes,	ornare, lectus ante dictum mi, ac mattis	25	25	25
26	2018-03-24	Quisque ornare tortor at risus. Nunc ac sem ut dolor	Aenean euismod mauris eu elit.	26	26	26
27	2017-12-07	Curabitur consequat, lectus sit amet luctus	placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam	27	27	27
28	2017-06-26	nec luctus felis purus ac	Duis at	28	28	28
29	2017-04-09	euismod et, commodo at, libero.	quam. Curabitur vel lectus. Cum sociis natoque penatibus	29	29	29
30	2016-06-26	vitae sodales nisi magna sed dui. Fusce	Cum sociis natoque penatibus	30	30	30
31	2017-01-22	accumsan laoreet ipsum. Curabitur consequat, lectus sit	Nulla facilisi. Sed neque. Sed eget	31	31	31
32	2017-05-10	feugiat tellus lorem	adipiscing ligula. Aenean gravida nunc sed pede. Cum sociis natoque	32	32	32
33	2017-06-08	et magnis dis parturient montes, nascetur	enim. Sed nulla ante, iaculis nec,	33	33	33
34	2018-01-23	augue, eu tempor erat neque non quam.	at fringilla purus mauris a nunc. In at pede.	34	34	34
35	2017-03-30	accumsan sed,	non, lacinia at, iaculis	35	35	35
36	2016-08-19	amet massa. Quisque	fermentum convallis ligula. Donec luctus	36	36	36
37	2016-05-01	lorem ipsum sodales purus, in molestie tortor nibh sit	molestie arcu.	37	37	37
38	2016-04-01	eget, ipsum.	mus. Aenean eget magna. Suspendisse	38	38	38
39	2016-10-07	fringilla ornare placerat, orci	rhoncus. Donec est. Nunc	39	39	39
40	2017-12-25	semper. Nam tempor diam dictum sapien. Aenean massa. Integer	sollicitudin commodo ipsum. Suspendisse non	40	40	40
41	2017-04-23	natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.	imperdiet dictum magna. Ut	41	41	41
42	2017-06-02	semper auctor.	turpis egestas.	42	42	42
43	2016-06-09	nunc est, mollis non, cursus non, egestas	gravida.	43	43	43
44	2017-07-27	volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing	ac facilisis facilisis, magna tellus faucibus	44	44	44
45	2016-05-04	vitae aliquam eros turpis non enim.	neque. Sed eget lacus. Mauris	45	45	45
46	2016-05-12	tortor nibh sit amet orci. Ut sagittis	scelerisque neque sed sem egestas blandit. Nam nulla	46	46	46
47	2017-07-17	ut,	orci lobortis augue scelerisque	47	47	47
48	2018-03-22	sapien imperdiet ornare. In faucibus. Morbi vehicula. Pellentesque tincidunt	lacus. Nulla tincidunt, neque vitae semper egestas, urna justo	48	48	48
49	2018-01-28	egestas, urna justo faucibus lectus, a sollicitudin	sit amet nulla. Donec	49	49	49
50	2016-11-03	bibendum sed, est.	Proin nisl sem, consequat nec, mollis	50	50	50
51	2016-10-07	Donec egestas. Aliquam	tortor nibh sit amet orci. Ut sagittis lobortis mauris.	51	51	51
52	2016-11-27	Mauris magna. Duis dignissim tempor arcu. Vestibulum	dapibus quam quis diam.	52	52	52
53	2018-02-01	Donec egestas. Aliquam nec enim.	libero. Morbi accumsan laoreet ipsum.	53	53	53
54	2016-10-02	pede. Nunc sed orci lobortis augue scelerisque	non, sollicitudin a, malesuada id, erat. Etiam vestibulum massa rutrum	54	54	54
55	2016-08-10	Curae; Donec tincidunt. Donec vitae erat vel pede blandit congue.	ut, molestie	55	55	55
56	2016-09-11	mauris ipsum porta	nunc, ullamcorper eu, euismod ac, fermentum vel, mauris. Integer	56	56	56
57	2018-02-04	fermentum vel, mauris. Integer sem	eget lacus. Mauris non dui nec	57	57	57
58	2018-03-19	arcu. Nunc	Sed auctor odio a	58	58	58
59	2017-09-30	nonummy ultricies ornare, elit elit fermentum risus,	amet luctus vulputate,	59	59	59
60	2018-02-27	volutpat. Nulla facilisis. Suspendisse commodo tincidunt	et, magna.	60	60	60
61	2016-04-07	molestie dapibus ligula. Aliquam erat volutpat.	In condimentum.	61	61	61
62	2017-01-27	adipiscing elit.	a odio semper cursus. Integer mollis. Integer tincidunt aliquam	62	62	62
63	2016-12-18	Pellentesque ut ipsum ac	sodales elit erat vitae	63	63	63
64	2017-07-22	tempor bibendum. Donec felis orci,	mauris sapien, cursus in, hendrerit consectetuer, cursus et,	64	64	64
65	2016-11-04	Mauris non	massa lobortis ultrices.	65	65	65
66	2017-12-10	dolor dolor, tempus non, lacinia at, iaculis	Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet	66	66	66
67	2018-01-15	velit justo nec ante. Maecenas mi felis, adipiscing fringilla, porttitor	blandit viverra. Donec tempus, lorem fringilla	67	67	67
68	2017-08-10	consectetuer mauris id sapien. Cras dolor dolor, tempus non, lacinia	enim,	68	68	68
69	2016-08-06	neque. Nullam	Integer	69	69	69
70	2016-10-30	amet ornare lectus justo eu arcu.	dolor	70	70	70
71	2017-04-13	sodales nisi magna sed dui.	Class aptent	71	71	71
72	2016-06-10	Nulla semper tellus id	elit sed consequat	72	72	72
73	2017-07-03	euismod et, commodo at, libero. Morbi	Quisque purus sapien, gravida non, sollicitudin	73	73	73
74	2016-04-18	nisl. Nulla	gravida non, sollicitudin a, malesuada id, erat.	74	74	74
75	2017-08-18	penatibus et magnis dis parturient montes, nascetur ridiculus mus.	penatibus	75	75	75
76	2016-05-15	Class aptent taciti sociosqu ad litora torquent per conubia nostra,	vel pede blandit congue. In scelerisque	76	76	76
77	2016-08-24	imperdiet ullamcorper. Duis	lectus pede, ultrices a, auctor non, feugiat nec,	77	77	77
78	2017-01-11	turpis nec mauris	sit amet ultricies sem magna nec quam. Curabitur vel	78	78	78
79	2016-09-20	sociis natoque penatibus et magnis dis parturient	Phasellus	79	79	79
80	2016-06-26	egestas hendrerit neque. In ornare sagittis felis. Donec tempor, est	eget, ipsum.	80	80	80
81	2017-01-03	ut	Phasellus vitae mauris sit	81	81	81
82	2016-07-31	eros. Proin	a, malesuada id, erat. Etiam vestibulum massa rutrum magna.	82	82	82
83	2016-05-02	semper pretium neque.	vitae, aliquet	83	83	83
84	2017-04-13	Aliquam vulputate ullamcorper magna. Sed eu	elementum, dui quis accumsan convallis, ante lectus	84	84	84
85	2016-10-31	et, magna.	arcu et pede. Nunc sed orci lobortis	85	85	85
86	2017-07-04	dictum ultricies ligula. Nullam enim. Sed	nonummy ac, feugiat	86	86	86
87	2017-10-05	ac tellus. Suspendisse sed	nulla. In tincidunt congue turpis. In condimentum. Donec at arcu.	87	87	87
88	2017-04-21	mus.	eu, accumsan sed, facilisis vitae, orci.	88	88	88
89	2017-11-24	molestie arcu. Sed	Nullam ut nisi	89	89	89
90	2016-11-24	augue, eu	ullamcorper. Duis cursus, diam at pretium aliquet, metus urna	90	90	90
91	2016-04-18	cursus. Nunc mauris elit,	nec, imperdiet nec, leo. Morbi	91	91	91
92	2016-05-17	a nunc. In at pede. Cras	Curabitur consequat, lectus sit amet	92	92	92
93	2016-06-23	eu, ligula. Aenean euismod mauris eu elit.	vitae odio sagittis semper. Nam tempor diam dictum sapien. Aenean	93	93	93
94	2016-12-29	lobortis tellus justo sit amet nulla. Donec non justo. Proin	feugiat nec, diam. Duis mi enim,	94	94	94
95	2016-10-10	felis. Donec	imperdiet ullamcorper. Duis at lacus. Quisque purus	95	95	95
96	2017-04-30	dolor. Donec fringilla. Donec feugiat metus	rhoncus.	96	96	96
97	2016-06-09	lobortis, nisi nibh lacinia	in faucibus orci luctus et ultrices posuere cubilia	97	97	97
98	2016-07-11	tempus risus. Donec egestas.	mattis velit justo nec ante. Maecenas mi felis,	98	98	98
99	2017-10-19	ipsum dolor sit amet,	id, erat. Etiam vestibulum massa rutrum	99	99	99
100	2017-01-07	non, bibendum	nisl sem, consequat nec, mollis vitae, posuere at,	100	100	100
\.


--
-- Name: complaint_idcomplaint_seq; Type: SEQUENCE SET; Schema: public; Owner: lbaw1621
--

SELECT pg_catalog.setval('complaint_idcomplaint_seq', 1, false);


--
-- Data for Name: image; Type: TABLE DATA; Schema: public; Owner: lbaw1621
--

COPY image (idimage, name, url) FROM stdin;
1	nulla	et
2	eget	mauris
3	consectetuer	quis
4	mauris	massa.
5	mauris.	massa.
6	malesuada	odio
7	odio	Ut
8	Mauris	dis
9	tellus	lorem,
10	turpis	tristique
11	magna.	adipiscing
12	Curabitur	Nullam
13	Donec	torquent
14	lobortis,	orci
15	eleifend	ligula.
16	massa	ullamcorper.
17	porttitor	eget,
18	nibh.	inceptos
19	Mauris	Nam
20	nulla	in
21	fermentum	sit
22	vitae	hendrerit
23	lorem	orci
24	at,	odio.
25	aliquet	euismod
26	placerat	Quisque
27	purus	Cum
28	sit	tempus
29	mus.	Quisque
30	Curae;	Donec
31	sit	eget
32	diam.	Cras
33	Morbi	nisi
34	convallis	amet,
35	Vivamus	hendrerit
36	eget,	magna
37	risus.	sodales
38	commodo	eu
39	quis	orci
40	dapibus	nisl.
41	tristique	a,
42	dui.	Quisque
43	cursus	posuere
44	felis	bibendum.
45	luctus	libero
46	eu,	a,
47	adipiscing,	enim.
48	massa	ipsum.
49	leo.	dis
50	ornare	Praesent
51	elementum	montes,
52	turpis.	amet,
53	lacinia	Cras
54	ac	non
55	Proin	sagittis.
56	libero	quis
57	et	at,
58	augue	at
59	Donec	vitae
60	vestibulum	Integer
61	Nullam	blandit.
62	dolor	malesuada
63	Sed	Vestibulum
64	cursus	ornare
65	molestie	sollicitudin
66	eget	amet
67	Cras	mi.
68	Nam	sed
69	non,	arcu.
70	ornare	morbi
71	Fusce	sociis
72	nibh	ut
73	tempus	dictum
74	est,	porttitor
75	dictum	molestie
76	ac	tempus
77	non	ligula
78	tincidunt	diam
79	vel	eget
80	in	Morbi
81	dignissim	Nunc
82	Nunc	arcu.
83	dui.	pede,
84	egestas	leo,
85	Donec	diam
86	nunc	nec
87	orci.	Duis
88	ornare	risus.
89	arcu	arcu.
90	magna.	laoreet
91	a,	eu
92	sit	sapien.
93	tempor	Mauris
94	fringilla,	pretium
95	eu,	nisi.
96	Integer	ac,
97	eget,	amet,
98	nec	dictum
99	sed	luctus
100	vel,	rutrum.
\.


--
-- Name: image_idimage_seq; Type: SEQUENCE SET; Schema: public; Owner: lbaw1621
--

SELECT pg_catalog.setval('image_idimage_seq', 4, true);


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: lbaw1621
--

COPY product (idproduct, name, idimage, idcategory, idbrand, price, stock, weight, width, height, description) FROM stdin;
1	natoque	31	30	89	47	13	9	107	144	semper auctor. Mauris vel turpis. Aliquam adipiscing
2	magna	9	49	87	125	5	8	148	142	arcu. Curabitur ut odio vel est tempor bibendum. Donec felis orci,
3	eu,	83	78	12	297	3	29	155	123	pede. Cras vulputate velit eu sem. Pellentesque ut ipsum ac mi eleifend egestas.
4	scelerisque,	58	58	6	270	14	13	108	65	lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis, nisi nibh
5	lorem.	70	91	17	279	15	10	123	190	eros. Nam consequat dolor vitae dolor. Donec fringilla. Donec feugiat metus sit amet ante.
6	vulputate	68	54	2	253	5	6	137	175	felis purus ac tellus. Suspendisse sed dolor. Fusce mi
7	est,	69	29	36	174	12	19	125	95	Donec egestas. Aliquam nec enim. Nunc ut erat. Sed nunc est, mollis non,
8	ultrices	81	77	88	29	8	1	189	187	eu elit. Nulla facilisi. Sed neque. Sed eget lacus.
9	nec,	92	42	4	163	9	21	142	155	cursus et, magna. Praesent interdum ligula eu
10	ullamcorper,	42	35	97	80	6	17	41	87	Donec tempus, lorem fringilla ornare placerat, orci
11	nec	42	27	95	209	5	20	50	98	Mauris eu turpis. Nulla aliquet. Proin velit. Sed malesuada augue ut
12	congue,	81	82	30	148	12	27	75	71	fringilla ornare placerat, orci lacus vestibulum lorem, sit amet
13	montes,	23	12	34	223	5	15	168	76	neque sed dictum eleifend, nunc
14	Praesent	2	24	84	164	13	7	106	207	gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus ante dictum mi, ac mattis velit
15	enim.	84	13	26	172	6	6	168	202	Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla tempor augue ac ipsum. Phasellus vitae mauris
16	turpis	5	8	48	59	12	5	65	107	dignissim lacus. Aliquam rutrum lorem ac risus. Morbi
17	Vivamus	40	10	65	151	9	21	107	134	ac urna. Ut tincidunt vehicula risus. Nulla eget
18	gravida	92	72	13	290	14	30	121	73	facilisi. Sed neque. Sed eget lacus. Mauris non dui nec urna
19	dui,	14	18	68	271	15	18	145	79	ut ipsum ac mi eleifend egestas. Sed pharetra, felis eget varius ultrices, mauris
20	rutrum	24	68	32	113	12	18	177	158	egestas. Duis ac arcu. Nunc mauris. Morbi non sapien molestie orci
21	netus	64	49	55	264	9	10	190	138	nec, malesuada ut, sem. Nulla interdum.
22	sed	99	5	55	128	8	5	103	102	Nunc ullamcorper, velit in aliquet
23	tempus	32	90	41	93	4	27	153	188	Donec at arcu. Vestibulum ante ipsum primis
24	ipsum	28	43	65	112	15	22	68	117	Proin eget odio. Aliquam vulputate ullamcorper magna. Sed eu eros. Nam consequat dolor vitae dolor.
25	mi,	17	9	55	190	2	24	23	42	at, iaculis quis, pede. Praesent eu
26	auctor	96	16	80	274	7	13	135	145	molestie dapibus ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas ornare
27	habitant	70	68	63	106	14	21	59	104	nec, mollis vitae, posuere at,
28	arcu	4	45	36	281	8	11	138	49	molestie pharetra nibh. Aliquam ornare, libero at auctor ullamcorper,
29	ridiculus	13	42	27	72	13	19	161	115	nec ligula consectetuer rhoncus. Nullam velit dui,
30	urna	54	72	6	129	6	18	93	107	a, arcu. Sed et libero. Proin mi. Aliquam
31	penatibus	65	92	22	261	2	9	29	187	ut mi. Duis risus odio, auctor
32	sodales	95	13	32	218	5	10	22	90	ultrices, mauris ipsum porta elit, a feugiat tellus lorem eu metus. In lorem. Donec
33	nibh.	31	1	82	230	11	1	127	154	sem ut cursus luctus, ipsum
34	sagittis.	43	10	77	103	12	21	103	156	et tristique pellentesque, tellus sem mollis dui, in sodales elit
35	amet	75	45	13	82	13	8	170	209	sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin
36	Fusce	21	21	90	83	8	3	31	151	non magna. Nam ligula elit, pretium et, rutrum non, hendrerit id,
37	lacus	24	97	55	243	1	3	80	136	nulla at sem molestie sodales. Mauris blandit enim
38	et,	10	53	52	261	1	4	34	134	eleifend vitae, erat. Vivamus nisi. Mauris
39	dolor	77	95	29	26	2	23	51	21	a ultricies adipiscing, enim mi tempor lorem, eget mollis lectus
40	mus.	69	20	12	59	5	28	178	62	metus urna convallis erat, eget tincidunt dui augue eu
41	metus	63	36	36	119	3	20	131	148	Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim
42	penatibus2	9	51	36	96	3	7	160	150	tristique senectus et netus et malesuada fames
43	Suspendisse	55	12	71	53	15	25	208	79	vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy
44	est1,	6	53	26	246	11	10	191	116	aliquet vel, vulputate eu, odio. Phasellus at augue id ante dictum cursus. Nunc mauris
45	dapibus	2	6	55	198	8	2	24	197	Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis,
46	neque.	93	4	82	251	9	15	88	54	dignissim pharetra. Nam ac nulla. In tincidunt congue turpis. In condimentum. Donec at
47	eget,	90	52	52	239	7	23	116	180	nulla. In tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum
48	placerat.	60	36	13	191	1	1	60	78	elementum, lorem ut aliquam iaculis, lacus pede sagittis augue, eu tempor erat neque
49	dictum.	2	45	70	89	11	24	59	74	In ornare sagittis felis. Donec tempor, est ac mattis semper,
50	non,	43	24	95	218	11	30	203	192	lorem eu metus. In lorem. Donec elementum, lorem ut aliquam iaculis, lacus
51	eget,1	51	27	69	105	11	26	97	170	lorem ac risus. Morbi metus. Vivamus euismod urna. Nullam lobortis quam a felis ullamcorper viverra.
52	Curae;	23	61	90	224	10	20	119	37	malesuada fames ac turpis egestas. Fusce aliquet
53	sociis	98	30	47	275	10	2	35	26	accumsan neque et nunc. Quisque ornare
54	tempus1	14	6	26	249	4	9	145	101	molestie tellus. Aenean egestas hendrerit neque. In ornare sagittis felis. Donec tempor, est ac
55	non	29	70	74	176	10	22	117	99	nunc, ullamcorper eu, euismod ac, fermentum vel, mauris. Integer sem elit,
56	semper.	95	58	2	50	15	23	26	93	Sed congue, elit sed consequat auctor, nunc nulla vulputate dui, nec tempus mauris erat eget
57	Donec	22	83	22	90	10	6	35	137	vulputate, nisi sem semper erat, in consectetuer ipsum nunc id enim. Curabitur
58	varius.	50	76	58	156	1	18	52	161	vulputate ullamcorper magna. Sed eu eros. Nam consequat dolor vitae dolor. Donec fringilla.
59	fermentum	25	40	31	193	2	27	134	121	lectus, a sollicitudin orci sem eget massa. Suspendisse
60	ultricies	27	86	48	239	14	26	45	73	imperdiet non, vestibulum nec, euismod in, dolor.
61	tristique	65	39	97	152	9	29	135	158	pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec
62	Lorem	47	78	84	137	6	19	190	194	molestie tortor nibh sit amet orci. Ut sagittis lobortis mauris. Suspendisse aliquet
63	nascetur	4	46	50	69	9	27	25	44	consequat auctor, nunc nulla vulputate dui, nec tempus mauris
64	eu	39	5	44	103	14	8	174	105	dolor. Quisque tincidunt pede ac urna. Ut tincidunt
65	ut	12	97	36	231	14	14	35	107	volutpat. Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus nulla. Integer
66	mauris	36	12	89	115	5	22	110	52	magna. Cras convallis convallis dolor. Quisque tincidunt pede ac urna. Ut tincidunt
67	dui.	86	69	21	225	9	27	194	179	est arcu ac orci. Ut semper pretium neque. Morbi
68	sit	76	26	47	170	1	30	136	148	sed libero. Proin sed turpis nec mauris
69	lacus.	81	29	44	165	10	29	138	25	sed orci lobortis augue scelerisque mollis. Phasellus libero mauris, aliquam eu,
70	egestas.	12	20	66	216	13	15	33	40	nulla ante, iaculis nec, eleifend non, dapibus rutrum, justo. Praesent luctus.
71	malesuada	96	8	50	30	2	29	34	148	Duis risus odio, auctor vitae, aliquet nec, imperdiet nec, leo. Morbi neque tellus, imperdiet
72	laoreet,	7	12	74	217	11	22	78	30	lectus. Nullam suscipit, est ac facilisis facilisis, magna tellus faucibus
73	ipsum.	85	25	90	135	1	30	158	101	nec orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet risus. Donec
74	ullamcorper	41	37	91	60	8	30	209	147	vitae odio sagittis semper. Nam tempor
75	varius	83	70	97	269	15	18	88	32	Sed id risus quis diam luctus lobortis.
76	eleifend	84	90	54	263	6	8	105	113	Phasellus dolor elit, pellentesque a, facilisis non, bibendum sed, est. Nunc
77	ipsum2	42	87	45	145	15	11	203	119	a, enim. Suspendisse aliquet, sem ut cursus luctus, ipsum leo
78	Integer	68	30	30	221	5	4	125	208	nec, imperdiet nec, leo. Morbi neque tellus, imperdiet non, vestibulum
79	Suspendisse1	78	73	18	201	2	5	171	192	Etiam gravida molestie arcu. Sed eu
80	urna1	99	18	10	274	1	13	198	97	non enim. Mauris quis turpis vitae
81	vel	66	50	55	282	10	19	109	155	non enim. Mauris quis turpis vitae purus gravida sagittis. Duis gravida. Praesent eu nulla at
82	augue	11	28	55	68	15	21	57	81	nec, mollis vitae, posuere at, velit. Cras lorem lorem, luctus ut, pellentesque eget, dictum
83	ac	95	31	6	82	9	30	39	22	Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec
84	In	70	46	26	187	14	20	135	83	semper tellus id nunc interdum feugiat. Sed nec metus facilisis lorem
85	mattis	76	73	15	52	6	5	115	57	vulputate ullamcorper magna. Sed eu eros. Nam
86	sem	2	91	24	53	5	13	166	68	amet nulla. Donec non justo. Proin non massa non ante bibendum ullamcorper. Duis cursus,
87	euismod	36	40	33	139	14	20	159	192	amet massa. Quisque porttitor eros nec tellus. Nunc lectus pede, ultrices a, auctor
88	molestie	84	9	81	223	12	28	64	39	est ac facilisis facilisis, magna tellus faucibus leo, in lobortis tellus justo sit
89	Aenean	76	13	62	144	2	24	77	76	Proin vel nisl. Quisque fringilla euismod enim.
90	Cras	79	31	97	191	6	11	132	134	justo. Proin non massa non ante bibendum ullamcorper. Duis cursus, diam at pretium
91	torquent	47	88	42	97	12	15	167	127	eget, volutpat ornare, facilisis eget, ipsum. Donec
92	arcu1	99	46	77	181	13	17	79	200	sem egestas blandit. Nam nulla magna,
93	fringilla,	23	54	83	169	15	4	90	31	tincidunt aliquam arcu. Aliquam ultrices
94	Vivamus1	2	98	20	223	13	30	150	133	pede, ultrices a, auctor non, feugiat nec, diam. Duis mi enim, condimentum eget,
95	diam	8	36	69	114	11	26	186	177	commodo tincidunt nibh. Phasellus nulla. Integer vulputate, risus a ultricies adipiscing, enim
96	urna2	55	64	35	20	11	17	54	70	Nunc lectus pede, ultrices a,
97	ante.	88	48	98	251	5	23	162	149	ac mattis ornare, lectus ante dictum mi, ac mattis velit justo
98	auctor,	33	38	26	229	11	16	198	153	consectetuer euismod est arcu ac orci. Ut semper pretium neque. Morbi
99	nunc.	21	20	98	30	8	4	201	190	Nunc lectus pede, ultrices a, auctor non, feugiat nec, diam. Duis mi enim, condimentum
100	elit.	54	66	88	102	9	16	125	121	orci. Phasellus dapibus quam quis diam. Pellentesque habitant morbi
\.


--
-- Name: product_idproduct_seq; Type: SEQUENCE SET; Schema: public; Owner: lbaw1621
--

SELECT pg_catalog.setval('product_idproduct_seq', 1, false);


--
-- Data for Name: purchase; Type: TABLE DATA; Schema: public; Owner: lbaw1621
--

COPY purchase (idpurchase, checkoutdate, iduser) FROM stdin;
1	2017-03-18	1
2	2018-03-06	2
3	2016-07-27	3
4	2016-07-11	4
5	2016-11-05	5
6	2016-05-20	6
7	2017-02-03	7
8	2016-08-20	8
9	2018-01-29	9
10	2017-05-26	10
11	2018-02-23	11
12	2016-09-22	12
13	2016-07-21	13
14	2018-01-07	14
15	2017-01-29	15
16	2016-08-08	16
17	2017-02-21	17
18	2017-06-24	18
19	2017-01-27	19
20	2017-05-24	20
21	2016-10-18	21
22	2017-03-10	22
23	2018-02-26	23
24	2017-11-23	24
25	2016-07-12	25
26	2017-02-13	26
27	2016-10-06	27
28	2016-06-25	28
29	2016-06-08	29
30	2017-10-13	30
31	2017-06-01	31
32	2016-12-25	32
33	2017-04-05	33
34	2017-05-03	34
35	2016-07-05	35
36	2018-03-07	36
37	2017-12-14	37
38	2017-01-25	38
39	2016-12-02	39
40	2017-09-03	40
41	2016-09-15	41
42	2017-02-28	42
43	2017-01-27	43
44	2017-10-12	44
45	2016-05-30	45
46	2016-08-08	46
47	2016-11-11	47
48	2017-06-15	48
49	2017-02-10	49
50	2016-09-10	50
51	2017-01-25	51
52	2016-10-22	52
53	2017-04-08	53
54	2017-01-27	54
55	2017-12-03	55
56	2016-04-02	56
57	2016-04-07	57
58	2017-04-08	58
59	2016-04-01	59
60	2017-10-15	60
61	2017-04-03	61
62	2017-11-21	62
63	2017-12-25	63
64	2017-10-16	64
65	2017-09-08	65
66	2018-01-19	66
67	2017-05-08	67
68	2017-09-10	68
69	2016-10-08	69
70	2016-10-31	70
71	2017-01-02	71
72	2018-02-10	72
73	2018-01-23	73
74	2017-01-21	74
75	2017-10-26	75
76	2016-11-21	76
77	2017-03-10	77
78	2018-03-10	78
79	2017-03-22	79
80	2017-07-06	80
81	2016-11-07	81
82	2016-12-30	82
83	2017-02-18	83
84	2017-03-29	84
85	2017-01-01	85
86	2017-05-03	86
87	2017-09-14	87
88	2016-07-27	88
89	2016-04-14	89
90	2016-05-21	90
91	2017-12-22	91
92	2017-09-11	92
93	2016-05-08	93
94	2016-10-10	94
95	2017-05-21	95
96	2017-08-03	96
97	2016-06-08	97
98	2016-11-03	98
99	2017-11-03	99
100	2018-02-04	100
\.


--
-- Name: purchase_idpurchase_seq; Type: SEQUENCE SET; Schema: public; Owner: lbaw1621
--

SELECT pg_catalog.setval('purchase_idpurchase_seq', 1, false);


--
-- Data for Name: purchaseproduct; Type: TABLE DATA; Schema: public; Owner: lbaw1621
--

COPY purchaseproduct (idproduct, idpurchase, price, quantity) FROM stdin;
1	1	51868797	7
2	2	28134364	3
3	3	32378378	3
4	4	18753905	10
5	5	12902029	8
6	6	48058324	1
7	7	68253179	6
8	8	60483608	2
9	9	33272410	9
10	10	54086746	1
11	11	64723052	7
12	12	69246120	7
13	13	54412807	9
14	14	61467620	8
15	15	37881088	7
16	16	8142069	2
17	17	66513967	2
18	18	82513209	9
19	19	50019132	9
20	20	12802970	5
21	21	79944950	9
22	22	21184736	1
23	23	80884648	8
24	24	6933064	8
25	25	1020326	5
26	26	96882078	6
27	27	95861950	1
28	28	82737224	1
29	29	11668401	2
30	30	79803217	7
31	31	28908313	7
32	32	58621689	9
33	33	51442190	3
34	34	2079402	3
35	35	4675168	10
36	36	4454738	5
37	37	57286658	4
38	38	9397873	7
39	39	59942948	4
40	40	29593905	6
41	41	16580099	3
42	42	46343797	3
43	43	65049763	7
44	44	48029723	10
45	45	58273412	9
46	46	64348169	7
47	47	98589452	10
48	48	41078842	3
49	49	69823772	5
50	50	91461343	5
51	51	26838944	8
52	52	50809942	6
53	53	90622003	4
54	54	5629916	5
55	55	74581972	3
56	56	50934014	2
57	57	44831265	2
58	58	5560983	3
59	59	81736135	6
60	60	37785084	6
61	61	40216551	10
62	62	67411755	6
63	63	97427373	10
64	64	6020694	10
65	65	15928454	2
66	66	39269344	7
67	67	91138094	7
68	68	33830955	2
69	69	41993571	2
70	70	51770701	7
71	71	91581341	4
72	72	27536853	6
73	73	7134029	8
74	74	54855247	1
75	75	32635875	7
76	76	79548760	7
77	77	73386348	3
78	78	90132237	9
79	79	9139831	3
80	80	13739355	7
81	81	50299204	6
82	82	35591498	6
83	83	1777239	2
84	84	62003761	1
85	85	86794650	8
86	86	7648617	9
87	87	78047290	7
88	88	76094391	10
89	89	14598507	4
90	90	19955977	10
91	91	66047253	6
92	92	24395451	5
93	93	85239828	2
94	94	79716454	5
95	95	37381698	2
96	96	14172650	5
97	97	14058632	10
98	98	49793469	10
99	99	95607358	4
100	100	93242362	1
\.


--
-- Data for Name: review; Type: TABLE DATA; Schema: public; Owner: lbaw1621
--

COPY review (iduser, idproduct, date, rating, description) FROM stdin;
1	1	2016-09-07	5	augue id ante dictum cursus. Nunc mauris elit,
2	2	2017-08-16	5	neque non quam. Pellentesque habitant morbi tristique
3	3	2017-08-10	3	venenatis vel, faucibus id, libero. Donec consectetuer
4	4	2017-07-08	1	ac
5	5	2017-01-18	4	convallis in, cursus et,
6	6	2018-03-02	4	placerat eget, venenatis a, magna. Lorem ipsum dolor sit
7	7	2018-02-16	1	odio, auctor vitae, aliquet nec, imperdiet nec, leo.
8	8	2017-04-24	3	vel pede blandit
9	9	2016-11-02	1	est, mollis non, cursus non, egestas a, dui. Cras pellentesque.
10	10	2017-01-22	4	enim non
11	11	2018-02-07	3	vehicula risus. Nulla eget metus eu erat semper
12	12	2017-05-12	2	arcu iaculis enim, sit amet ornare lectus justo eu
13	13	2017-11-03	3	accumsan neque et nunc. Quisque ornare
14	14	2017-04-13	3	enim. Curabitur
15	15	2017-11-01	3	lobortis quis, pede. Suspendisse dui. Fusce diam
16	16	2016-03-28	5	tellus. Aenean egestas hendrerit neque.
17	17	2016-09-25	3	sapien, cursus in, hendrerit consectetuer, cursus et, magna.
18	18	2017-09-13	1	lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet
19	19	2016-04-14	2	viverra. Donec
20	20	2016-06-26	5	ipsum
21	21	2017-12-20	5	tempus risus. Donec egestas. Duis ac arcu. Nunc mauris. Morbi
22	22	2017-04-30	3	penatibus et magnis
23	23	2017-10-20	2	tincidunt, neque vitae semper egestas, urna justo faucibus lectus, a
24	24	2016-08-19	5	tincidunt. Donec
25	25	2017-12-02	4	tincidunt pede ac urna. Ut
26	26	2017-08-09	2	Nam interdum enim non nisi.
27	27	2016-08-02	2	Nullam scelerisque neque sed
28	28	2017-09-26	1	nunc sit amet metus. Aliquam erat volutpat. Nulla facilisis. Suspendisse
29	29	2016-09-17	1	Nunc
30	30	2018-02-08	2	montes, nascetur
\.


--
-- Data for Name: shippingaddress; Type: TABLE DATA; Schema: public; Owner: lbaw1621
--

COPY shippingaddress (idaddress) FROM stdin;
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
46
47
48
49
50
51
52
53
54
55
56
57
58
59
60
61
62
63
64
65
66
67
68
69
70
71
72
73
74
75
76
77
78
79
80
81
82
83
84
85
86
87
88
89
90
91
92
93
94
95
96
97
98
99
100
\.


--
-- Data for Name: shoppingcart; Type: TABLE DATA; Schema: public; Owner: lbaw1621
--

COPY shoppingcart (iduser, idproduct, quantity) FROM stdin;
1	1	2
2	2	6
3	3	6
4	4	3
5	5	2
6	6	3
7	7	2
8	8	2
9	9	9
10	10	6
11	11	2
12	12	3
13	13	9
14	14	9
15	15	5
16	16	5
17	17	4
18	18	2
19	19	7
20	20	5
21	21	7
22	22	10
23	23	8
24	24	5
25	25	3
26	26	2
27	27	7
28	28	4
29	29	4
30	30	9
31	31	1
32	32	5
33	33	4
34	34	7
35	35	2
36	36	3
37	37	3
38	38	2
39	39	5
40	40	7
41	41	8
42	42	6
43	43	3
44	44	10
45	45	9
46	46	5
47	47	1
48	48	10
49	49	4
50	50	4
51	51	3
52	52	10
53	53	7
54	54	2
55	55	2
56	56	5
57	57	8
58	58	6
59	59	6
60	60	5
61	61	6
62	62	5
63	63	1
64	64	3
65	65	5
66	66	10
67	67	2
68	68	9
69	69	1
70	70	4
71	71	10
72	72	9
73	73	3
74	74	6
75	75	8
76	76	5
77	77	6
78	78	2
79	79	6
80	80	8
81	81	7
82	82	6
83	83	10
84	84	5
85	85	9
86	86	2
87	87	10
88	88	7
89	89	1
90	90	10
91	91	1
92	92	6
93	93	9
94	94	7
95	95	5
96	96	8
97	97	7
98	98	5
99	99	10
100	100	7
\.


--
-- Data for Name: wishlist; Type: TABLE DATA; Schema: public; Owner: lbaw1621
--

COPY wishlist (iduser, idproduct, url) FROM stdin;
1	1	1_1.com
2	2	2_2.com
3	3	3_3.com
4	4	4_4.com
5	5	5_5.com
6	6	6_6.com
7	7	7_7.com
8	8	8_8.com
9	9	9_9.com
10	10	10_10.com
11	11	11_11.com
12	12	12_12.com
13	13	13_13.com
14	14	14_14.com
15	15	15_15.com
16	16	16_16.com
17	17	17_17.com
18	18	18_18.com
19	19	19_19.com
20	20	20_20.com
21	21	21_21.com
22	22	22_22.com
23	23	23_23.com
24	24	24_24.com
25	25	25_25.com
26	26	26_26.com
27	27	27_27.com
28	28	28_28.com
29	29	29_29.com
30	30	30_30.com
31	31	31_31.com
32	32	32_32.com
33	33	33_33.com
34	34	34_34.com
35	35	35_35.com
36	36	36_36.com
37	37	37_37.com
38	38	38_38.com
39	39	39_39.com
40	40	40_40.com
41	41	41_41.com
42	42	42_42.com
43	43	43_43.com
44	44	44_44.com
45	45	45_45.com
46	46	46_46.com
47	47	47_47.com
48	48	48_48.com
49	49	49_49.com
50	50	50_50.com
51	51	51_51.com
52	52	52_52.com
53	53	53_53.com
54	54	54_54.com
55	55	55_55.com
56	56	56_56.com
57	57	57_57.com
58	58	58_58.com
59	59	59_59.com
60	60	60_60.com
61	61	61_61.com
62	62	62_62.com
63	63	63_63.com
64	64	64_64.com
65	65	65_65.com
66	66	66_66.com
67	67	67_67.com
68	68	68_68.com
69	69	69_69.com
70	70	70_70.com
71	71	71_71.com
72	72	72_72.com
73	73	73_73.com
74	74	74_74.com
75	75	75_75.com
76	76	76_76.com
77	77	77_77.com
78	78	78_78.com
79	79	79_79.com
80	80	80_80.com
81	81	81_81.com
82	82	82_82.com
83	83	83_83.com
84	84	84_84.com
85	85	85_85.com
86	86	86_86.com
87	87	87_87.com
88	88	88_88.com
89	89	89_89.com
90	90	90_90.com
91	91	91_91.com
92	92	92_92.com
93	93	93_93.com
94	94	94_94.com
95	95	95_95.com
96	96	96_96.com
97	97	97_97.com
98	98	98_98.com
99	99	99_99.com
100	100	100_100.com
\.


--
-- Name: address_pkey; Type: CONSTRAINT; Schema: public; Owner: lbaw1621; Tablespace: 
--

ALTER TABLE ONLY address
    ADD CONSTRAINT address_pkey PRIMARY KEY (idaddress);


--
-- Name: billingaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: lbaw1621; Tablespace: 
--

ALTER TABLE ONLY billingaddress
    ADD CONSTRAINT billingaddress_pkey PRIMARY KEY (idaddress);


--
-- Name: brand_pkey; Type: CONSTRAINT; Schema: public; Owner: lbaw1621; Tablespace: 
--

ALTER TABLE ONLY brand
    ADD CONSTRAINT brand_pkey PRIMARY KEY (idbrand);


--
-- Name: category_pkey; Type: CONSTRAINT; Schema: public; Owner: lbaw1621; Tablespace: 
--

ALTER TABLE ONLY category
    ADD CONSTRAINT category_pkey PRIMARY KEY (idcategory);


--
-- Name: client_email_key; Type: CONSTRAINT; Schema: public; Owner: lbaw1621; Tablespace: 
--

ALTER TABLE ONLY client
    ADD CONSTRAINT client_email_key UNIQUE (email);


--
-- Name: client_nif_key; Type: CONSTRAINT; Schema: public; Owner: lbaw1621; Tablespace: 
--

ALTER TABLE ONLY client
    ADD CONSTRAINT client_nif_key UNIQUE (nif);


--
-- Name: client_pkey; Type: CONSTRAINT; Schema: public; Owner: lbaw1621; Tablespace: 
--

ALTER TABLE ONLY client
    ADD CONSTRAINT client_pkey PRIMARY KEY (iduser);


--
-- Name: complaint_pkey; Type: CONSTRAINT; Schema: public; Owner: lbaw1621; Tablespace: 
--

ALTER TABLE ONLY complaint
    ADD CONSTRAINT complaint_pkey PRIMARY KEY (idcomplaint);


--
-- Name: image_pkey; Type: CONSTRAINT; Schema: public; Owner: lbaw1621; Tablespace: 
--

ALTER TABLE ONLY image
    ADD CONSTRAINT image_pkey PRIMARY KEY (idimage);


--
-- Name: pk_purchaseproduct; Type: CONSTRAINT; Schema: public; Owner: lbaw1621; Tablespace: 
--

ALTER TABLE ONLY purchaseproduct
    ADD CONSTRAINT pk_purchaseproduct PRIMARY KEY (idproduct, idpurchase);


--
-- Name: pk_review; Type: CONSTRAINT; Schema: public; Owner: lbaw1621; Tablespace: 
--

ALTER TABLE ONLY review
    ADD CONSTRAINT pk_review PRIMARY KEY (iduser, idproduct);


--
-- Name: pk_shoppingcart; Type: CONSTRAINT; Schema: public; Owner: lbaw1621; Tablespace: 
--

ALTER TABLE ONLY shoppingcart
    ADD CONSTRAINT pk_shoppingcart PRIMARY KEY (iduser, idproduct);


--
-- Name: pk_wishlist; Type: CONSTRAINT; Schema: public; Owner: lbaw1621; Tablespace: 
--

ALTER TABLE ONLY wishlist
    ADD CONSTRAINT pk_wishlist PRIMARY KEY (iduser, idproduct);


--
-- Name: product_name_key; Type: CONSTRAINT; Schema: public; Owner: lbaw1621; Tablespace: 
--

ALTER TABLE ONLY product
    ADD CONSTRAINT product_name_key UNIQUE (name);


--
-- Name: product_pkey; Type: CONSTRAINT; Schema: public; Owner: lbaw1621; Tablespace: 
--

ALTER TABLE ONLY product
    ADD CONSTRAINT product_pkey PRIMARY KEY (idproduct);


--
-- Name: purchase_pkey; Type: CONSTRAINT; Schema: public; Owner: lbaw1621; Tablespace: 
--

ALTER TABLE ONLY purchase
    ADD CONSTRAINT purchase_pkey PRIMARY KEY (idpurchase);


--
-- Name: shippingaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: lbaw1621; Tablespace: 
--

ALTER TABLE ONLY shippingaddress
    ADD CONSTRAINT shippingaddress_pkey PRIMARY KEY (idaddress);


--
-- Name: email; Type: INDEX; Schema: public; Owner: lbaw1621; Tablespace: 
--

CREATE INDEX email ON client USING btree (email);


--
-- Name: product_price; Type: INDEX; Schema: public; Owner: lbaw1621; Tablespace: 
--

CREATE INDEX product_price ON product USING btree (price);


--
-- Name: review_date; Type: INDEX; Schema: public; Owner: lbaw1621; Tablespace: 
--

CREATE INDEX review_date ON review USING btree (date);


--
-- Name: wish_list; Type: INDEX; Schema: public; Owner: lbaw1621; Tablespace: 
--

CREATE INDEX wish_list ON wishlist USING btree (iduser);


--
-- Name: billingaddress_idaddress_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lbaw1621
--

ALTER TABLE ONLY billingaddress
    ADD CONSTRAINT billingaddress_idaddress_fkey FOREIGN KEY (idaddress) REFERENCES address(idaddress);


--
-- Name: fk_brand; Type: FK CONSTRAINT; Schema: public; Owner: lbaw1621
--

ALTER TABLE ONLY product
    ADD CONSTRAINT fk_brand FOREIGN KEY (idbrand) REFERENCES brand(idbrand);


--
-- Name: fk_category; Type: FK CONSTRAINT; Schema: public; Owner: lbaw1621
--

ALTER TABLE ONLY product
    ADD CONSTRAINT fk_category FOREIGN KEY (idcategory) REFERENCES category(idcategory);


--
-- Name: fk_client; Type: FK CONSTRAINT; Schema: public; Owner: lbaw1621
--

ALTER TABLE ONLY purchase
    ADD CONSTRAINT fk_client FOREIGN KEY (iduser) REFERENCES client(iduser);


--
-- Name: fk_client; Type: FK CONSTRAINT; Schema: public; Owner: lbaw1621
--

ALTER TABLE ONLY complaint
    ADD CONSTRAINT fk_client FOREIGN KEY (iduser) REFERENCES client(iduser);


--
-- Name: fk_image; Type: FK CONSTRAINT; Schema: public; Owner: lbaw1621
--

ALTER TABLE ONLY product
    ADD CONSTRAINT fk_image FOREIGN KEY (idimage) REFERENCES image(idimage);


--
-- Name: fk_purchaseproduct; Type: FK CONSTRAINT; Schema: public; Owner: lbaw1621
--

ALTER TABLE ONLY complaint
    ADD CONSTRAINT fk_purchaseproduct FOREIGN KEY (idproduct, idpurchase) REFERENCES purchaseproduct(idproduct, idpurchase);


--
-- Name: purchaseproduct_idproduct_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lbaw1621
--

ALTER TABLE ONLY purchaseproduct
    ADD CONSTRAINT purchaseproduct_idproduct_fkey FOREIGN KEY (idproduct) REFERENCES product(idproduct);


--
-- Name: purchaseproduct_idpurchase_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lbaw1621
--

ALTER TABLE ONLY purchaseproduct
    ADD CONSTRAINT purchaseproduct_idpurchase_fkey FOREIGN KEY (idpurchase) REFERENCES purchase(idpurchase);


--
-- Name: review_idproduct_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lbaw1621
--

ALTER TABLE ONLY review
    ADD CONSTRAINT review_idproduct_fkey FOREIGN KEY (idproduct) REFERENCES product(idproduct);


--
-- Name: review_iduser_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lbaw1621
--

ALTER TABLE ONLY review
    ADD CONSTRAINT review_iduser_fkey FOREIGN KEY (iduser) REFERENCES client(iduser);


--
-- Name: shippingaddress_idaddress_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lbaw1621
--

ALTER TABLE ONLY shippingaddress
    ADD CONSTRAINT shippingaddress_idaddress_fkey FOREIGN KEY (idaddress) REFERENCES address(idaddress);


--
-- Name: shoppingcart_idproduct_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lbaw1621
--

ALTER TABLE ONLY shoppingcart
    ADD CONSTRAINT shoppingcart_idproduct_fkey FOREIGN KEY (idproduct) REFERENCES product(idproduct);


--
-- Name: shoppingcart_iduser_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lbaw1621
--

ALTER TABLE ONLY shoppingcart
    ADD CONSTRAINT shoppingcart_iduser_fkey FOREIGN KEY (iduser) REFERENCES client(iduser);


--
-- Name: wishlist_idproduct_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lbaw1621
--

ALTER TABLE ONLY wishlist
    ADD CONSTRAINT wishlist_idproduct_fkey FOREIGN KEY (idproduct) REFERENCES product(idproduct);


--
-- Name: wishlist_iduser_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lbaw1621
--

ALTER TABLE ONLY wishlist
    ADD CONSTRAINT wishlist_iduser_fkey FOREIGN KEY (iduser) REFERENCES client(iduser);


--
-- Name: public; Type: ACL; Schema: -; Owner: lbaw1621
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM lbaw1621;
GRANT ALL ON SCHEMA public TO lbaw1621;


--
-- PostgreSQL database dump complete
--

