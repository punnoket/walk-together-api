--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.14
-- Dumped by pg_dump version 10.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: answer_evaluation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE answer_evaluation (
    id bigint NOT NULL,
    answer character varying(255),
    question_evaluation_id bigint
);


ALTER TABLE answer_evaluation OWNER TO postgres;

--
-- Name: caretaker; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE caretaker (
    id bigint NOT NULL,
    address character varying(255),
    caretaker_number character varying(255),
    dob character varying(255),
    email character varying(255),
    first_name character varying(255),
    image character varying(255),
    last_name character varying(255),
    occupation character varying(255),
    password character varying(255),
    tell character varying(255),
    title_name character varying(255),
    user_name character varying(255),
    district_id bigint,
    province_id bigint,
    sex_id bigint,
    sub_district_id bigint
);


ALTER TABLE caretaker OWNER TO postgres;

--
-- Name: district; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE district (
    id bigint NOT NULL,
    code character varying(255),
    created timestamp without time zone,
    modified timestamp without time zone,
    name character varying(255),
    province_id bigint
);


ALTER TABLE district OWNER TO postgres;

--
-- Name: evaluation_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE evaluation_category (
    id bigint NOT NULL,
    evaluation_category_name character varying(255)
);


ALTER TABLE evaluation_category OWNER TO postgres;

--
-- Name: evaluation_test; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE evaluation_test (
    id bigint NOT NULL,
    frequency_patient character varying(255),
    result_score character varying(255),
    test_date timestamp without time zone
);


ALTER TABLE evaluation_test OWNER TO postgres;

--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hibernate_sequence OWNER TO postgres;

--
-- Name: history_evaluation_test; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE history_evaluation_test (
    id bigint NOT NULL,
    evaluation_test_id bigint,
    patient bigint
);


ALTER TABLE history_evaluation_test OWNER TO postgres;

--
-- Name: image_question_evaluation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE image_question_evaluation (
    id bigint NOT NULL,
    path character varying(255)
);


ALTER TABLE image_question_evaluation OWNER TO postgres;

--
-- Name: matching; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE matching (
    id bigint NOT NULL,
    caretaker_id bigint,
    patient_id bigint
);


ALTER TABLE matching OWNER TO postgres;

--
-- Name: number_evaluation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE number_evaluation (
    id bigint NOT NULL,
    no character varying(255),
    score character varying(255),
    evaluation_category bigint
);


ALTER TABLE number_evaluation OWNER TO postgres;

--
-- Name: patient; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE patient (
    id bigint NOT NULL,
    address character varying(255),
    dob character varying(255),
    email character varying(255),
    first_name character varying(255),
    frequency character varying(255),
    image character varying(255),
    last_name character varying(255),
    level character varying(255),
    occupation character varying(255),
    password character varying(255),
    patient_number character varying(255),
    tell character varying(255),
    title_name character varying(255),
    user_name character varying(255),
    district_id bigint,
    province_id bigint,
    sex_id bigint,
    sub_district_id bigint
);


ALTER TABLE patient OWNER TO postgres;

--
-- Name: patient_test; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE patient_test (
    id bigint NOT NULL,
    answer character varying(255),
    score character varying(255),
    answer_evaluation_id bigint,
    evaluation_test bigint,
    question_evaluation_id bigint
);


ALTER TABLE patient_test OWNER TO postgres;

--
-- Name: province; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE province (
    id bigint NOT NULL,
    code character varying(255),
    created timestamp without time zone,
    modified timestamp without time zone,
    name character varying(255)
);


ALTER TABLE province OWNER TO postgres;

--
-- Name: question_evaluation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE question_evaluation (
    id bigint NOT NULL,
    description character varying(255),
    image character varying(255),
    title character varying(255),
    number_evaluation bigint,
    audio character varying(255)
);


ALTER TABLE question_evaluation OWNER TO postgres;

--
-- Name: sex; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE sex (
    id bigint NOT NULL,
    code character varying(255),
    created timestamp without time zone,
    modified timestamp without time zone,
    name character varying(255)
);


ALTER TABLE sex OWNER TO postgres;

--
-- Name: sex_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sex_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sex_id_seq OWNER TO postgres;

--
-- Name: sex_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE sex_id_seq OWNED BY sex.id;


--
-- Name: subdistrict; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE subdistrict (
    id bigint NOT NULL,
    code character varying(255),
    created timestamp without time zone,
    modified timestamp without time zone,
    name character varying(255),
    zip_code character varying(255),
    district_id bigint,
    province_id bigint
);


ALTER TABLE subdistrict OWNER TO postgres;

--
-- Name: sex id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sex ALTER COLUMN id SET DEFAULT nextval('sex_id_seq'::regclass);


--
-- Data for Name: answer_evaluation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY answer_evaluation (id, answer, question_evaluation_id) FROM stdin;
100	aaa	67
101	bbb	67
102	bbb	68
103	bbb	68
104	bbb	68
105	bbb	69
106	dddd	69
107	dddd	69
108	dddd	69
109	dddd	70
110	rr	70
111	rr	71
112	r22r	72
113	r22r	73
114	34234	74
115	34234	76
116	34234	77
117	rtb	99
118	ferrf	98
119	ferrf	98
120	rfe	97
121	rfe	96
122	2342	97
123	2342	96
124	ewff	96
125	ewff	96
126	ewff	95
127	ewff	94
128	ewff	94
129	ewff	93
130	ewfeff	92
131	ewfeff	91
132	ewfeff	91
133	ewfeff	91
134	efve	90
135	efve	90
136	ervvev	89
137	ervvev	89
138	ervvev	89
139	rgevr	87
140	rgevr	87
141	rgevr	86
142	rgevr	85
143	rgevr	85
144	rgevr	85
145	rgevr	84
146	rgevr	84
147	rgevr	84
148	rgevr	83
149	rgevr	83
150	rgevr	83
151	rgevr	82
152	rgevr	82
153	rgevr	82
154	rgevr	81
155	rgevr	81
156	rgevr	81
157	rvrrr	80
158	rvrrr	80
159	rverv	79
160	rverv	79
161	rvvvverv	78
162	rvvvverv	88
163	rvvvverv	88
164	rvvvverv	88
\.


--
-- Data for Name: caretaker; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY caretaker (id, address, caretaker_number, dob, email, first_name, image, last_name, occupation, password, tell, title_name, user_name, district_id, province_id, sex_id, sub_district_id) FROM stdin;
39	60 หมู่ 8	C962395	21 กุมภาพันธ์ 2539	noe@gddfmail.com	ปัณวรรธน์	\N	นกเกตุ	นศ	1234	098270494858	นาย	CWddfWD	64	212	1	270
40	60 หมู่ 8	C168690	21 กุมภาพันธ์ 2539	noe@gdedfmail.com	ปัณวรรธน์	\N	นกเกตุ	นศ	1234	0982794858	นาย	CWdedfWD	64	212	1	270
41	60 หมู่ 8	C917690	21 กุมภาพันธ์ 2539	lnw@gdedfmail.com	พยาบาล	\N	นกเกตุ	นศ	1234	098272858	นาย	nuse	64	224	1	270
211	60 หมู่ 8	C205190	21 กุมภาพันธ์ 2539	lnw@gdemail.com	พยาบาล	\N	นกเกตุ	นศ	1234	09827283458	นาย	testcaretaker	64	\N	1	270
213	60 หมู่ 8	C768575	21 กุมภาพันธ์ 2539	lnwd@gdemail.com	พยาบาล	\N	นกเกตุ	นศ	1234	0983283458	นาย	testtaker	64	\N	1	270
216	60 หมู่ 8	C919401	21 กุมภาพันธ์ 2539	lnddssdwd@gdemail.com	พยาบาล	\N	นกเกตุ	นศ	1234	0983283434358	นาย	testpasadstyienr	64	\N	1	270
218	dsfdsf	C238788	04 กุมภาพันธ์ 2018		psf	\N	sdfds	sdf	qqqq	0885224525	mr	qsfsdfdsf	802	517	1	6376
219	60 mu 8	C537570	21 กุมภาพันธ์ 2539	ggg@zz.com	dev	\N	android	sale	1234	0834249027	Mr	android	64	212	1	270
220	213	C847823	22 กุมภาพันธ์ 2561	ddd@ddd.com	d	\N	d		1234	0982709825	ddd	punnokety	802	517	2	6376
\.


--
-- Data for Name: district; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY district (id, code, created, modified, name, province_id) FROM stdin;
802	d00001	\N	\N	คลองท่อม	517
804	d00002	\N	\N	ปลายพระยา	517
805	d00003	\N	\N	ลำทับ	517
803	d00004	\N	\N	อ่าวลึก	517
801	d00005	\N	\N	เกาะลันตา	517
800	d00006	\N	\N	เขาพนม	517
799	d00007	\N	\N	เมืองกระบี่	517
806	d00008	\N	\N	เหนือคลอง	517
17	d00009	\N	\N	คลองสาน	111
46	d00010	\N	\N	คลองสามวา	111
33	d00011	\N	\N	คลองเตย	111
43	d00012	\N	\N	คันนายาว	111
26	d00013	\N	\N	จตุจักร	111
36	d00014	\N	\N	จอมทอง	111
25	d00015	\N	\N	ดอนเมือง	111
37	d00016	\N	\N	ดินแดง	111
7	d00017	\N	\N	ดุสิต	111
20	d00018	\N	\N	ตลิ่งชัน	111
48	d00019	\N	\N	ทวีวัฒนา	111
49	d00020	\N	\N	ทุ่งครุ	111
16	d00021	\N	\N	ธนบุรี	111
19	d00022	\N	\N	บางกอกน้อย	111
18	d00023	\N	\N	บางกอกใหญ่	111
11	d00024	\N	\N	บางกะปิ	111
23	d00025	\N	\N	บางขุนเทียน	111
30	d00026	\N	\N	บางคอแหลม	111
31	d00027	\N	\N	บางซื่อ	111
47	d00028	\N	\N	บางนา	111
50	d00029	\N	\N	บางบอน	111
35	d00030	\N	\N	บางพลัด	111
4	d00031	\N	\N	บางรัก	111
12	d00032	\N	\N	บางเขน	111
40	d00033	\N	\N	บางแค	111
28	d00034	\N	\N	บึงกุ่ม	111
5	d00035	\N	\N	ปทุมวัน	111
34	d00036	\N	\N	ประเวศ	111
2	d00037	\N	\N	ป้อมปราบศัตรูพ่าย	111
8	d00038	\N	\N	พญาไท	111
1	d00039	\N	\N	พระนคร	111
10	d00040	\N	\N	พระโขนง	111
21	d00041	\N	\N	ภาษีเจริญ	111
13	d00042	\N	\N	มีนบุรี	111
6	d00043	\N	\N	ยานนาวา	111
32	d00044	\N	\N	ราชเทวี	111
24	d00045	\N	\N	ราษฎร์บูรณะ	111
14	d00046	\N	\N	ลาดกระบัง	111
27	d00047	\N	\N	ลาดพร้าว	111
45	d00048	\N	\N	วังทองหลาง	111
39	d00049	\N	\N	วัฒนา	111
38	d00050	\N	\N	สวนหลวง	111
44	d00051	\N	\N	สะพานสูง	111
3	d00052	\N	\N	สัมพันธวงศ์	111
29	d00053	\N	\N	สาทร	111
42	d00054	\N	\N	สายไหม	111
15	d00055	\N	\N	หนองจอก	111
22	d00056	\N	\N	หนองแขม	111
41	d00057	\N	\N	หลักสี่	111
9	d00058	\N	\N	ห้วยขวาง	111
727	d00059	\N	\N	ศรีสวัสดิ์	243
734	d00060	\N	\N	ด่านมะขามเตี้ย	243
730	d00061	\N	\N	ทองผาภูมิ	243
728	d00062	\N	\N	ท่ามะกา	243
729	d00063	\N	\N	ท่าม่วง	243
726	d00064	\N	\N	บ่อพลอย	243
732	d00065	\N	\N	พนมทวน	243
731	d00066	\N	\N	สังขละบุรี	243
735	d00067	\N	\N	หนองปรือ	243
736	d00068	\N	\N	ห้วยกระเจา	243
724	d00069	\N	\N	เมืองกาญจนบุรี	243
733	d00070	\N	\N	เลาขวัญ	243
725	d00071	\N	\N	ไทรโยค	243
466	d00072	\N	\N	กมลาไสย	327
468	d00073	\N	\N	กุฉินารายณ์	327
473	d00074	\N	\N	คำม่วง	327
481	d00075	\N	\N	ฆ้องชัย	327
480	d00076	\N	\N	ดอนจาน	327
474	d00077	\N	\N	ท่าคันโท	327
479	d00078	\N	\N	นาคู	327
465	d00079	\N	\N	นามน	327
470	d00080	\N	\N	ยางตลาด	327
467	d00081	\N	\N	ร่องคำ	327
476	d00082	\N	\N	สมเด็จ	327
472	d00083	\N	\N	สหัสขันธ์	327
478	d00084	\N	\N	สามชัย	327
475	d00085	\N	\N	หนองกุงศรี	327
477	d00086	\N	\N	ห้วยผึ้ง	327
471	d00087	\N	\N	ห้วยเม็ก	327
469	d00088	\N	\N	เขาวง	327
464	d00089	\N	\N	เมืองกาฬสินธุ์	327
656	d00090	\N	\N	ขาณุวรลักษบุรี	414
657	d00091	\N	\N	คลองขลุง	414
655	d00092	\N	\N	คลองลาน	414
660	d00093	\N	\N	ทรายทองวัฒนา	414
662	d00094	\N	\N	บึงสามัคคี	414
661	d00095	\N	\N	ปางศิลาทอง	414
658	d00096	\N	\N	พรานกระต่าย	414
659	d00097	\N	\N	ลานกระบือ	414
653	d00098	\N	\N	เมืองกำแพงเพชร	414
663	d00099	\N	\N	โกสัมพีนคร	414
654	d00100	\N	\N	ไทรงาม	414
363	d00101	\N	\N	กระนวน	321
372	d00102	\N	\N	ชนบท	321
359	d00103	\N	\N	ชุมแพ	321
375	d00104	\N	\N	ซำสูง	321
361	d00105	\N	\N	น้ำพอง	321
356	d00106	\N	\N	บ้านฝาง	321
378	d00107	\N	\N	บ้านแฮด	321
364	d00108	\N	\N	บ้านไผ่	321
357	d00109	\N	\N	พระยืน	321
366	d00110	\N	\N	พล	321
374	d00111	\N	\N	ภูผาม่าน	321
370	d00112	\N	\N	ภูเวียง	321
371	d00113	\N	\N	มัญจาคีรี	321
360	d00114	\N	\N	สีชมพู	321
377	d00115	\N	\N	หนองนาคำ	321
369	d00116	\N	\N	หนองสองห้อง	321
358	d00117	\N	\N	หนองเรือ	321
362	d00118	\N	\N	อุบลรัตน์	321
373	d00119	\N	\N	เขาสวนกวาง	321
365	d00120	\N	\N	เปือยน้อย	321
355	d00121	\N	\N	เมืองขอนแก่น	321
368	d00122	\N	\N	แวงน้อย	321
367	d00123	\N	\N	แวงใหญ่	321
376	d00124	\N	\N	โคกโพธิ์ไชย	321
379	d00125	\N	\N	โนนศิลา	321
151	d00126	\N	\N	ขลุง	235
152	d00127	\N	\N	ท่าใหม่	235
158	d00128	\N	\N	นายายอาม	235
154	d00129	\N	\N	มะขาม	235
156	d00130	\N	\N	สอยดาว	235
159	d00131	\N	\N	เขาคิชฌกูฏ	235
150	d00132	\N	\N	เมืองจันทบุรี	235
157	d00133	\N	\N	แก่งหางแมว	235
155	d00134	\N	\N	แหลมสิงห์	235
153	d00135	\N	\N	โป่งน้ำร้อน	235
177	d00136	\N	\N	คลองเขื่อน	232
176	d00137	\N	\N	ท่าตะเกียบ	232
168	d00138	\N	\N	บางคล้า	232
169	d00139	\N	\N	บางน้ำเปรี้ยว	232
170	d00140	\N	\N	บางปะกง	232
171	d00141	\N	\N	บ้านโพธิ์	232
172	d00142	\N	\N	พนมสารคาม	232
173	d00143	\N	\N	ราชสาส์น	232
174	d00144	\N	\N	สนามชัยเขต	232
167	d00145	\N	\N	เมืองฉะเชิงเทรา	232
175	d00146	\N	\N	แปลงยาว	232
134	d00147	\N	\N	บางละมุง	231
140	d00148	\N	\N	บ่อทอง	231
132	d00149	\N	\N	บ้านบึง	231
136	d00150	\N	\N	พนัสนิคม	231
135	d00151	\N	\N	พานทอง	231
137	d00152	\N	\N	ศรีราชา	231
139	d00153	\N	\N	สัตหีบ	231
133	d00154	\N	\N	หนองใหญ่	231
141	d00155	\N	\N	เกาะจันทร์	231
138	d00156	\N	\N	เกาะสีชัง	231
131	d00157	\N	\N	เมืองชลบุรี	231
111	d00158	\N	\N	มโนรมย์	224
112	d00159	\N	\N	วัดสิงห์	224
114	d00160	\N	\N	สรรคบุรี	224
113	d00161	\N	\N	สรรพยา	224
116	d00162	\N	\N	หนองมะโมง	224
115	d00163	\N	\N	หันคา	224
117	d00164	\N	\N	เนินขาม	224
110	d00165	\N	\N	เมืองชัยนาท	224
328	d00166	\N	\N	คอนสวรรค์	312
338	d00167	\N	\N	คอนสาร	312
331	d00168	\N	\N	จัตุรัส	312
341	d00169	\N	\N	ซับใหญ่	312
332	d00170	\N	\N	บำเหน็จณรงค์	312
327	d00171	\N	\N	บ้านเขว้า	312
336	d00172	\N	\N	บ้านแท่น	312
339	d00173	\N	\N	ภักดีชุมพล	312
335	d00174	\N	\N	ภูเขียว	312
333	d00175	\N	\N	หนองบัวระเหว	312
330	d00176	\N	\N	หนองบัวแดง	312
329	d00177	\N	\N	เกษตรสมบูรณ์	312
334	d00178	\N	\N	เทพสถิต	312
340	d00179	\N	\N	เนินสง่า	312
326	d00180	\N	\N	เมืองชัยภูมิ	312
337	d00181	\N	\N	แก้งคร้อ	312
849	d00182	\N	\N	ทุ่งตะโก	513
843	d00183	\N	\N	ท่าแซะ	513
844	d00184	\N	\N	ปะทิว	513
847	d00185	\N	\N	พะโต๊ะ	513
846	d00186	\N	\N	ละแม	513
848	d00187	\N	\N	สวี	513
845	d00188	\N	\N	หลังสวน	513
842	d00189	\N	\N	เมืองชุมพร	513
874	d00190	\N	\N	กันตัง	523
880	d00191	\N	\N	นาโยง	523
876	d00192	\N	\N	ปะเหลียน	523
875	d00193	\N	\N	ย่านตาขาว	523
881	d00194	\N	\N	รัษฎา	523
879	d00195	\N	\N	วังวิเศษ	523
877	d00196	\N	\N	สิเกา	523
882	d00197	\N	\N	หาดสำราญ	523
878	d00198	\N	\N	ห้วยยอด	523
873	d00199	\N	\N	เมืองตรัง	523
161	d00200	\N	\N	คลองใหญ่	234
163	d00201	\N	\N	บ่อไร่	234
165	d00202	\N	\N	เกาะกูด	234
166	d00203	\N	\N	เกาะช้าง	234
162	d00204	\N	\N	เขาสมิง	234
160	d00205	\N	\N	เมืองตราด	234
164	d00206	\N	\N	แหลมงอบ	234
668	d00207	\N	\N	ท่าสองยาง	413
665	d00208	\N	\N	บ้านตาก	413
670	d00209	\N	\N	พบพระ	413
672	d00210	\N	\N	วังเจ้า	413
666	d00211	\N	\N	สามเงา	413
671	d00212	\N	\N	อุ้มผาง	413
664	d00213	\N	\N	เมืองตาก	413
667	d00214	\N	\N	แม่ระมาด	413
669	d00215	\N	\N	แม่สอด	413
187	d00216	\N	\N	บ้านนา	225
186	d00217	\N	\N	ปากพลี	225
188	d00218	\N	\N	องครักษ์	225
185	d00219	\N	\N	เมืองนครนายก	225
748	d00220	\N	\N	กำแพงแสน	242
750	d00221	\N	\N	ดอนตูม	242
749	d00222	\N	\N	นครชัยศรี	242
751	d00223	\N	\N	บางเลน	242
753	d00224	\N	\N	พุทธมณฑล	242
752	d00225	\N	\N	สามพราน	242
747	d00226	\N	\N	เมืองนครปฐม	242
502	d00227	\N	\N	ท่าอุเทน	333
504	d00228	\N	\N	ธาตุพนม	333
510	d00229	\N	\N	นาทม	333
508	d00230	\N	\N	นาหว้า	333
506	d00231	\N	\N	นาแก	333
503	d00232	\N	\N	บ้านแพง	333
501	d00233	\N	\N	ปลาปาก	333
511	d00234	\N	\N	วังยาง	333
507	d00235	\N	\N	ศรีสงคราม	333
500	d00236	\N	\N	เมืองนครพนม	333
505	d00237	\N	\N	เรณูนคร	333
509	d00238	\N	\N	โพนสวรรค์	333
216	d00239	\N	\N	ขามทะเลสอ	311
208	d00240	\N	\N	ขามสะแกแสง	311
201	d00241	\N	\N	คง	311
199	d00242	\N	\N	ครบุรี	311
203	d00243	\N	\N	จักราช	311
214	d00244	\N	\N	ชุมพวง	311
205	d00245	\N	\N	ด่านขุนทด	311
227	d00246	\N	\N	บัวลาย	311
209	d00247	\N	\N	บัวใหญ่	311
202	d00248	\N	\N	บ้านเหลื่อม	311
210	d00249	\N	\N	ประทาย	311
211	d00250	\N	\N	ปักธงชัย	311
218	d00251	\N	\N	ปากช่อง	311
225	d00252	\N	\N	พระทองคำ	311
212	d00253	\N	\N	พิมาย	311
226	d00254	\N	\N	ลำทะเมนชัย	311
222	d00255	\N	\N	วังน้ำเขียว	311
217	d00256	\N	\N	สีคิ้ว	311
228	d00257	\N	\N	สีดา	311
215	d00258	\N	\N	สูงเนิน	311
219	d00259	\N	\N	หนองบุญมาก	311
213	d00260	\N	\N	ห้วยแถลง	311
229	d00261	\N	\N	เฉลิมพระเกียรติ	311
223	d00262	\N	\N	เทพารักษ์	311
198	d00263	\N	\N	เมืองนครราชสีมา	311
224	d00264	\N	\N	เมืองยาง	311
200	d00265	\N	\N	เสิงสาง	311
220	d00266	\N	\N	แก้งสนามนาง	311
204	d00267	\N	\N	โชคชัย	311
207	d00268	\N	\N	โนนสูง	311
221	d00269	\N	\N	โนนแดง	311
206	d00270	\N	\N	โนนไทย	311
790	d00271	\N	\N	ขนอม	511
794	d00272	\N	\N	จุฬาภรณ์	511
779	d00273	\N	\N	ฉวาง	511
782	d00274	\N	\N	ชะอวด	511
797	d00275	\N	\N	ช้างกลาง	511
793	d00276	\N	\N	ถ้ำพรรณรา	511
784	d00277	\N	\N	ทุ่งสง	511
786	d00278	\N	\N	ทุ่งใหญ่	511
783	d00279	\N	\N	ท่าศาลา	511
796	d00280	\N	\N	นบพิตำ	511
785	d00281	\N	\N	นาบอน	511
792	d00282	\N	\N	บางขัน	511
787	d00283	\N	\N	ปากพนัง	511
777	d00284	\N	\N	พรหมคีรี	511
795	d00285	\N	\N	พระพรหม	511
780	d00286	\N	\N	พิปูน	511
788	d00287	\N	\N	ร่อนพิบูลย์	511
778	d00288	\N	\N	ลานสกา	511
789	d00289	\N	\N	สิชล	511
791	d00290	\N	\N	หัวไทร	511
798	d00291	\N	\N	เฉลิมพระเกียรติ	511
781	d00292	\N	\N	เชียรใหญ่	511
776	d00293	\N	\N	เมืองนครศรีธรรมราช	511
644	d00294	\N	\N	ชุมตาบง	411
632	d00295	\N	\N	ชุมแสง	411
641	d00296	\N	\N	ตากฟ้า	411
636	d00297	\N	\N	ตาคลี	411
637	d00298	\N	\N	ท่าตะโก	411
634	d00299	\N	\N	บรรพตพิสัย	411
639	d00300	\N	\N	พยุหะคีรี	411
640	d00301	\N	\N	ลาดยาว	411
633	d00302	\N	\N	หนองบัว	411
635	d00303	\N	\N	เก้าเลี้ยว	411
630	d00304	\N	\N	เมืองนครสวรรค์	411
642	d00305	\N	\N	แม่วงก์	411
643	d00306	\N	\N	แม่เปิน	411
631	d00307	\N	\N	โกรกพระ	411
638	d00308	\N	\N	ไพศาลี	411
58	d00309	\N	\N	บางกรวย	211
60	d00310	\N	\N	บางบัวทอง	211
59	d00311	\N	\N	บางใหญ่	211
62	d00312	\N	\N	ปากเกร็ด	211
57	d00313	\N	\N	เมืองนนทบุรี	211
61	d00314	\N	\N	ไทรน้อย	211
925	d00315	\N	\N	จะแนะ	527
915	d00316	\N	\N	ตากใบ	527
916	d00317	\N	\N	บาเจาะ	527
917	d00318	\N	\N	ยี่งอ	527
918	d00319	\N	\N	ระแงะ	527
919	d00320	\N	\N	รือเสาะ	527
920	d00321	\N	\N	ศรีสาคร	527
922	d00322	\N	\N	สุคิริน	527
924	d00323	\N	\N	สุไหงปาดี	527
923	d00324	\N	\N	สุไหงโก-ลก	527
926	d00325	\N	\N	เจาะไอร้อง	527
914	d00326	\N	\N	เมืองนราธิวาส	527
921	d00327	\N	\N	แว้ง	527
588	d00328	\N	\N	ทุ่งช้าง	425
586	d00329	\N	\N	ท่าวังผา	425
584	d00330	\N	\N	นาน้อย	425
590	d00331	\N	\N	นาหมื่น	425
592	d00332	\N	\N	บ่อเกลือ	425
583	d00333	\N	\N	บ้านหลวง	425
585	d00334	\N	\N	ปัว	425
594	d00335	\N	\N	ภูเพียง	425
593	d00336	\N	\N	สองแคว	425
591	d00337	\N	\N	สันติสุข	425
595	d00338	\N	\N	เฉลิมพระเกียรติ	425
589	d00339	\N	\N	เชียงกลาง	425
581	d00340	\N	\N	เมืองน่าน	425
587	d00341	\N	\N	เวียงสา	425
582	d00342	\N	\N	แม่จริม	425
424	d00343	\N	\N	บึงโขงหลง	528
426	d00344	\N	\N	บุ่งคล้า	528
423	d00345	\N	\N	ปากคาด	528
417	d00346	\N	\N	พรเจริญ	528
425	d00347	\N	\N	ศรีวิไล	528
422	d00348	\N	\N	เซกา	528
416	d00349	\N	\N	เมืองบึงกาฬ	528
419	d00350	\N	\N	โซ่พิสัย	528
232	d00351	\N	\N	กระสัง	313
231	d00352	\N	\N	คูเมือง	313
247	d00353	\N	\N	ชำนิ	313
233	d00354	\N	\N	นางรอง	313
242	d00355	\N	\N	นาโพธิ์	313
237	d00356	\N	\N	บ้านกรวด	313
250	d00357	\N	\N	บ้านด่าน	313
248	d00358	\N	\N	บ้านใหม่ไชยพจน์	313
236	d00359	\N	\N	ประโคนชัย	313
241	d00360	\N	\N	ปะคำ	313
244	d00361	\N	\N	พลับพลาชัย	313
238	d00362	\N	\N	พุทไธสง	313
235	d00363	\N	\N	ละหานทราย	313
239	d00364	\N	\N	ลำปลายมาศ	313
240	d00365	\N	\N	สตึก	313
234	d00366	\N	\N	หนองกี่	313
243	d00367	\N	\N	หนองหงส์	313
245	d00368	\N	\N	ห้วยราช	313
252	d00369	\N	\N	เฉลิมพระเกียรติ	313
230	d00370	\N	\N	เมืองบุรีรัมย์	313
251	d00371	\N	\N	แคนดง	313
249	d00372	\N	\N	โนนดินแดง	313
246	d00373	\N	\N	โนนสุวรรณ	313
64	d00374	\N	\N	คลองหลวง	212
65	d00375	\N	\N	ธัญบุรี	212
67	d00376	\N	\N	ลาดหลุมแก้ว	212
68	d00377	\N	\N	ลำลูกกา	212
69	d00378	\N	\N	สามโคก	212
66	d00379	\N	\N	หนองเสือ	212
63	d00380	\N	\N	เมืองปทุมธานี	212
769	d00381	\N	\N	กุยบุรี	245
770	d00382	\N	\N	ทับสะแก	245
771	d00383	\N	\N	บางสะพาน	245
772	d00384	\N	\N	บางสะพานน้อย	245
773	d00385	\N	\N	ปราณบุรี	245
775	d00386	\N	\N	สามร้อยยอด	245
774	d00387	\N	\N	หัวหิน	245
768	d00388	\N	\N	เมืองประจวบคีรีขันธ์	245
179	d00389	\N	\N	กบินทร์บุรี	233
180	d00390	\N	\N	นาดี	233
181	d00391	\N	\N	บ้านสร้าง	233
182	d00392	\N	\N	ประจันตคาม	233
183	d00393	\N	\N	ศรีมหาโพธิ	233
902	d00394	\N	\N	ยะหริ่ง	526
184	d00395	\N	\N	ศรีมโหสถ	233
178	d00396	\N	\N	เมืองปราจีนบุรี	233
904	d00397	\N	\N	กะพ้อ	526
899	d00398	\N	\N	ทุ่งยางแดง	526
897	d00399	\N	\N	ปะนาเระ	526
898	d00400	\N	\N	มายอ	526
903	d00401	\N	\N	ยะรัง	526
900	d00402	\N	\N	สายบุรี	526
896	d00403	\N	\N	หนองจิก	526
894	d00404	\N	\N	เมืองปัตตานี	526
905	d00405	\N	\N	แม่ลาน	526
895	d00406	\N	\N	โคกโพธิ์	526
901	d00407	\N	\N	ไม้แก่น	526
71	d00408	\N	\N	ท่าเรือ	213
72	d00409	\N	\N	นครหลวง	213
82	d00410	\N	\N	บางซ้าย	213
74	d00411	\N	\N	บางบาล	213
76	d00412	\N	\N	บางปะหัน	213
75	d00413	\N	\N	บางปะอิน	213
73	d00414	\N	\N	บางไทร	213
596	d00415	\N	\N	เมืองพะเยา	435
85	d00416	\N	\N	บ้านแพรก	213
77	d00417	\N	\N	ผักไห่	213
70	d00418	\N	\N	พระนครศรีอยุธยา	213
78	d00419	\N	\N	ภาชี	213
84	d00420	\N	\N	มหาราช	213
79	d00421	\N	\N	ลาดบัวหลวง	213
80	d00422	\N	\N	วังน้อย	213
83	d00423	\N	\N	อุทัย	213
81	d00424	\N	\N	เสนา	213
597	d00425	\N	\N	จุน	435
600	d00426	\N	\N	ดอกคำใต้	435
601	d00427	\N	\N	ปง	435
604	d00428	\N	\N	ภูกามยาว	435
603	d00429	\N	\N	ภูซาง	435
598	d00430	\N	\N	เชียงคำ	435
599	d00431	\N	\N	เชียงม่วน	435
602	d00432	\N	\N	แม่ใจ	435
809	d00433	\N	\N	กะปง	515
812	d00434	\N	\N	คุระบุรี	515
810	d00435	\N	\N	ตะกั่วทุ่ง	515
811	d00436	\N	\N	ตะกั่วป่า	515
813	d00437	\N	\N	ทับปุด	515
814	d00438	\N	\N	ท้ายเหมือง	515
808	d00439	\N	\N	เกาะยาว	515
807	d00440	\N	\N	เมืองพังงา	515
884	d00441	\N	\N	กงหรา	522
887	d00442	\N	\N	ควนขนุน	522
886	d00443	\N	\N	ตะโหมด	522
891	d00444	\N	\N	บางแก้ว	522
888	d00445	\N	\N	ปากพะยูน	522
890	d00446	\N	\N	ป่าบอน	522
892	d00447	\N	\N	ป่าพะยอม	522
893	d00448	\N	\N	ศรีนครินทร์	522
889	d00449	\N	\N	ศรีบรรพต	522
885	d00450	\N	\N	เขาชัยสน	522
883	d00451	\N	\N	เมืองพัทลุง	522
701	d00452	\N	\N	ดงเจริญ	422
694	d00453	\N	\N	ตะพานหิน	422
698	d00454	\N	\N	ทับคล้อ	422
695	d00455	\N	\N	บางมูลนาก	422
700	d00456	\N	\N	บึงนาราง	422
702	d00457	\N	\N	วชิรบารมี	422
692	d00458	\N	\N	วังทรายพูน	422
699	d00459	\N	\N	สากเหล็ก	422
697	d00460	\N	\N	สามง่าม	422
691	d00461	\N	\N	เมืองพิจิตร	422
696	d00462	\N	\N	โพทะเล	422
693	d00463	\N	\N	โพธิ์ประทับช้าง	422
684	d00464	\N	\N	ชาติตระการ	421
683	d00465	\N	\N	นครไทย	421
686	d00466	\N	\N	บางกระทุ่ม	421
685	d00467	\N	\N	บางระกำ	421
687	d00468	\N	\N	พรหมพิราม	421
689	d00469	\N	\N	วังทอง	421
688	d00470	\N	\N	วัดโบสถ์	421
690	d00471	\N	\N	เนินมะปราง	421
682	d00472	\N	\N	เมืองพิษณุโลก	421
816	d00473	\N	\N	กะทู้	516
817	d00474	\N	\N	ถลาง	516
815	d00475	\N	\N	เมืองภูเก็ต	516
434	d00476	\N	\N	กันทรวิชัย	315
442	d00477	\N	\N	กุดรัง	315
443	d00478	\N	\N	ชื่นชม	315
440	d00479	\N	\N	นาดูน	315
437	d00480	\N	\N	นาเชือก	315
436	d00481	\N	\N	บรบือ	315
438	d00482	\N	\N	พยัคฆภูมิพิสัย	315
441	d00483	\N	\N	ยางสีสุราช	315
439	d00484	\N	\N	วาปีปทุม	315
435	d00485	\N	\N	เชียงยืน	315
431	d00486	\N	\N	เมืองมหาสารคาม	315
432	d00487	\N	\N	แกดำ	315
433	d00488	\N	\N	โกสุมพิสัย	315
516	d00489	\N	\N	คำชะอี	334
515	d00490	\N	\N	ดงหลวง	334
514	d00491	\N	\N	ดอนตาล	334
513	d00492	\N	\N	นิคมคำสร้อย	334
518	d00493	\N	\N	หนองสูง	334
517	d00494	\N	\N	หว้านใหญ่	334
512	d00495	\N	\N	เมืองมุกดาหาร	334
913	d00496	\N	\N	กรงปินัง	525
912	d00497	\N	\N	กาบัง	525
909	d00498	\N	\N	ธารโต	525
908	d00499	\N	\N	บันนังสตา	525
910	d00500	\N	\N	ยะหา	525
911	d00501	\N	\N	รามัน	525
907	d00502	\N	\N	เบตง	525
906	d00503	\N	\N	เมืองยะลา	525
319	d00504	\N	\N	กุดชุม	332
320	d00505	\N	\N	คำเขื่อนแก้ว	332
323	d00506	\N	\N	ค้อวัง	332
318	d00507	\N	\N	ทรายมูล	332
321	d00508	\N	\N	ป่าติ้ว	332
322	d00509	\N	\N	มหาชนะชัย	332
317	d00510	\N	\N	เมืองยโสธร	332
324	d00511	\N	\N	เลิงนกทา	332
325	d00512	\N	\N	ไทยเจริญ	332
840	d00513	\N	\N	กระบุรี	514
839	d00514	\N	\N	กะเปอร์	514
838	d00515	\N	\N	ละอุ่น	514
841	d00516	\N	\N	สุขสำราญ	514
837	d00517	\N	\N	เมืองระนอง	514
149	d00518	\N	\N	นิคมพัฒนา	236
146	d00519	\N	\N	บ้านค่าย	236
143	d00520	\N	\N	บ้านฉาง	236
147	d00521	\N	\N	ปลวกแดง	236
145	d00522	\N	\N	วังจันทร์	236
148	d00523	\N	\N	เขาชะเมา	236
142	d00524	\N	\N	เมืองระยอง	236
144	d00525	\N	\N	แกลง	236
715	d00526	\N	\N	จอมบึง	241
717	d00527	\N	\N	ดำเนินสะดวก	241
719	d00528	\N	\N	บางแพ	241
723	d00529	\N	\N	บ้านคา	241
718	d00530	\N	\N	บ้านโป่ง	241
721	d00531	\N	\N	ปากท่อ	241
722	d00532	\N	\N	วัดเพลง	241
716	d00533	\N	\N	สวนผึ้ง	241
714	d00534	\N	\N	เมืองราชบุรี	241
720	d00535	\N	\N	โพธาราม	241
447	d00536	\N	\N	จตุรพักตร์พิมาน	335
460	d00537	\N	\N	จังหาร	335
463	d00538	\N	\N	ทุ่งเขาหลวง	335
448	d00539	\N	\N	ธวัชบุรี	335
446	d00540	\N	\N	ปทุมรัตต์	335
449	d00541	\N	\N	พนมไพร	335
459	d00542	\N	\N	ศรีสมเด็จ	335
454	d00543	\N	\N	สุวรรณภูมิ	335
96	d00544	\N	\N	ชัยบาดาล	222
452	d00545	\N	\N	หนองพอก	335
462	d00546	\N	\N	หนองฮี	335
457	d00547	\N	\N	อาจสามารถ	335
445	d00548	\N	\N	เกษตรวิสัย	335
461	d00549	\N	\N	เชียงขวัญ	335
458	d00550	\N	\N	เมยวดี	335
444	d00551	\N	\N	เมืองร้อยเอ็ด	335
455	d00552	\N	\N	เมืองสรวง	335
453	d00553	\N	\N	เสลภูมิ	335
451	d00554	\N	\N	โพธิ์ชัย	335
456	d00555	\N	\N	โพนทราย	335
450	d00556	\N	\N	โพนทอง	335
97	d00557	\N	\N	ท่าวุ้ง	222
99	d00558	\N	\N	ท่าหลวง	222
98	d00559	\N	\N	บ้านหมี่	222
94	d00560	\N	\N	พัฒนานิคม	222
102	d00561	\N	\N	ลำสนธิ	222
100	d00562	\N	\N	สระโบสถ์	222
103	d00563	\N	\N	หนองม่วง	222
93	d00564	\N	\N	เมืองลพบุรี	222
95	d00565	\N	\N	โคกสำโรง	222
101	d00566	\N	\N	โคกเจริญ	222
555	d00567	\N	\N	งาว	431
557	d00568	\N	\N	วังเหนือ	431
561	d00569	\N	\N	สบปราบ	431
562	d00570	\N	\N	ห้างฉัตร	431
553	d00571	\N	\N	เกาะคา	431
558	d00572	\N	\N	เถิน	431
563	d00573	\N	\N	เมืองปาน	431
551	d00574	\N	\N	เมืองลำปาง	431
554	d00575	\N	\N	เสริมงาม	431
556	d00576	\N	\N	แจ้ห่ม	431
560	d00577	\N	\N	แม่ทะ	431
559	d00578	\N	\N	แม่พริก	431
552	d00579	\N	\N	แม่เมาะ	431
547	d00580	\N	\N	ทุ่งหัวช้าง	434
549	d00581	\N	\N	บ้านธิ	434
545	d00582	\N	\N	บ้านโฮ่ง	434
548	d00583	\N	\N	ป่าซาง	434
546	d00584	\N	\N	ลี้	434
543	d00585	\N	\N	เมืองลำพูน	434
550	d00586	\N	\N	เวียงหนองล่อง	434
544	d00587	\N	\N	แม่ทา	434
273	d00588	\N	\N	กันทรลักษ์	336
272	d00589	\N	\N	กันทรารมย์	336
274	d00590	\N	\N	ขุขันธ์	336
277	d00591	\N	\N	ขุนหาญ	336
284	d00592	\N	\N	น้ำเกลี้ยง	336
280	d00593	\N	\N	บึงบูรพ์	336
276	d00594	\N	\N	ปรางค์กู่	336
289	d00595	\N	\N	พยุห์	336
286	d00596	\N	\N	ภูสิงห์	336
271	d00597	\N	\N	ยางชุมน้อย	336
278	d00598	\N	\N	ราษีไศล	336
285	d00599	\N	\N	วังหิน	336
283	d00600	\N	\N	ศรีรัตนะ	336
291	d00601	\N	\N	ศิลาลาด	336
281	d00602	\N	\N	ห้วยทับทัน	336
279	d00603	\N	\N	อุทุมพรพิสัย	336
288	d00604	\N	\N	เบญจลักษ์	336
287	d00605	\N	\N	เมืองจันทร์	336
270	d00606	\N	\N	เมืองศรีสะเกษ	336
282	d00607	\N	\N	โนนคูณ	336
290	d00608	\N	\N	โพธิ์ศรีสุวรรณ	336
275	d00609	\N	\N	ไพรบึง	336
484	d00610	\N	\N	กุดบาก	325
483	d00611	\N	\N	กุสุมาลย์	325
490	d00612	\N	\N	คำตากล้า	325
488	d00613	\N	\N	นิคมน้ำอูน	325
491	d00614	\N	\N	บ้านม่วง	325
485	d00615	\N	\N	พรรณานิคม	325
486	d00616	\N	\N	พังโคน	325
499	d00617	\N	\N	ภูพาน	325
489	d00618	\N	\N	วานรนิวาส	325
487	d00619	\N	\N	วาริชภูมิ	325
493	d00620	\N	\N	สว่างแดนดิน	325
494	d00621	\N	\N	ส่องดาว	325
492	d00622	\N	\N	อากาศอำนวย	325
497	d00623	\N	\N	เจริญศิลป์	325
495	d00624	\N	\N	เต่างอย	325
482	d00625	\N	\N	เมืองสกลนคร	325
496	d00626	\N	\N	โคกศรีสุพรรณ	325
498	d00627	\N	\N	โพนนาแก้ว	325
857	d00628	\N	\N	กระแสสินธุ์	521
865	d00629	\N	\N	คลองหอยโข่ง	521
862	d00630	\N	\N	ควนเนียง	521
852	d00631	\N	\N	จะนะ	521
853	d00632	\N	\N	นาทวี	521
861	d00633	\N	\N	นาหม่อม	521
863	d00634	\N	\N	บางกล่ำ	521
856	d00635	\N	\N	ระโนด	521
858	d00636	\N	\N	รัตภูมิ	521
851	d00637	\N	\N	สทิงพระ	521
855	d00638	\N	\N	สะบ้าย้อย	521
859	d00639	\N	\N	สะเดา	521
864	d00640	\N	\N	สิงหนคร	521
860	d00641	\N	\N	หาดใหญ่	521
854	d00642	\N	\N	เทพา	521
850	d00643	\N	\N	เมืองสงขลา	521
868	d00644	\N	\N	ควนกาหลง	524
867	d00645	\N	\N	ควนโดน	524
871	d00646	\N	\N	ทุ่งหว้า	524
869	d00647	\N	\N	ท่าแพ	524
872	d00648	\N	\N	มะนัง	524
870	d00649	\N	\N	ละงู	524
866	d00650	\N	\N	เมืองสตูล	524
52	d00651	\N	\N	บางบ่อ	215
53	d00652	\N	\N	บางพลี	215
56	d00653	\N	\N	บางเสาธง	215
54	d00654	\N	\N	พระประแดง	215
55	d00655	\N	\N	พระสมุทรเจดีย์	215
51	d00656	\N	\N	เมืองสมุทรปราการ	215
755	d00657	\N	\N	กระทุ่มแบน	246
758	d00658	\N	\N	บางคนที	247
759	d00659	\N	\N	อัมพวา	247
757	d00660	\N	\N	เมืองสมุทรสงคราม	247
756	d00661	\N	\N	บ้านแพ้ว	246
754	d00662	\N	\N	เมืองสมุทรสาคร	246
124	d00663	\N	\N	ดอนพุด	221
123	d00664	\N	\N	บ้านหมอ	221
126	d00665	\N	\N	พระพุทธบาท	221
128	d00666	\N	\N	มวกเหล็ก	221
129	d00667	\N	\N	วังม่วง	221
121	d00668	\N	\N	วิหารแดง	221
120	d00669	\N	\N	หนองแค	221
122	d00670	\N	\N	หนองแซง	221
125	d00671	\N	\N	หนองโดน	221
130	d00672	\N	\N	เฉลิมพระเกียรติ	221
118	d00673	\N	\N	เมืองสระบุรี	221
127	d00674	\N	\N	เสาไห้	221
119	d00675	\N	\N	แก่งคอย	221
190	d00676	\N	\N	คลองหาด	237
191	d00677	\N	\N	ตาพระยา	237
192	d00678	\N	\N	วังน้ำเย็น	237
197	d00679	\N	\N	วังสมบูรณ์	237
193	d00680	\N	\N	วัฒนานคร	237
194	d00681	\N	\N	อรัญประเทศ	237
195	d00682	\N	\N	เขาฉกรรจ์	237
189	d00683	\N	\N	เมืองสระแก้ว	237
196	d00684	\N	\N	โคกสูง	237
106	d00685	\N	\N	ค่ายบางระจัน	223
108	d00686	\N	\N	ท่าช้าง	223
105	d00687	\N	\N	บางระจัน	223
107	d00688	\N	\N	พรหมบุรี	223
109	d00689	\N	\N	อินทร์บุรี	223
104	d00690	\N	\N	เมืองสิงห์บุรี	223
742	d00691	\N	\N	ดอนเจดีย์	226
739	d00692	\N	\N	ด่านช้าง	226
740	d00693	\N	\N	บางปลาม้า	226
741	d00694	\N	\N	ศรีประจันต์	226
743	d00695	\N	\N	สองพี่น้อง	226
255	d00696	\N	\N	ท่าตูม	314
744	d00697	\N	\N	สามชุก	226
746	d00698	\N	\N	หนองหญ้าไซ	226
745	d00699	\N	\N	อู่ทอง	226
738	d00700	\N	\N	เดิมบางนางบวช	226
737	d00701	\N	\N	เมืองสุพรรณบุรี	226
819	d00702	\N	\N	กาญจนดิษฐ์	512
825	d00703	\N	\N	คีรีรัฐนิคม	512
835	d00704	\N	\N	ชัยบุรี	512
820	d00705	\N	\N	ดอนสัก	512
828	d00706	\N	\N	ท่าฉาง	512
824	d00707	\N	\N	ท่าชนะ	512
826	d00708	\N	\N	บ้านตาขุน	512
829	d00709	\N	\N	บ้านนาสาร	512
830	d00710	\N	\N	บ้านนาเดิม	512
827	d00711	\N	\N	พนม	512
833	d00712	\N	\N	พระแสง	512
834	d00713	\N	\N	พุนพิน	512
836	d00714	\N	\N	วิภาวดี	512
822	d00715	\N	\N	เกาะพะงัน	512
821	d00716	\N	\N	เกาะสมุย	512
831	d00717	\N	\N	เคียนซา	512
818	d00718	\N	\N	เมืองสุราษฎร์ธานี	512
832	d00719	\N	\N	เวียงสระ	512
823	d00720	\N	\N	ไชยา	512
258	d00721	\N	\N	กาบเชิง	314
256	d00722	\N	\N	จอมพระ	314
254	d00723	\N	\N	ชุมพลบุรี	314
265	d00724	\N	\N	บัวเชด	314
257	d00725	\N	\N	ปราสาท	314
266	d00726	\N	\N	พนมดงรัก	314
259	d00727	\N	\N	รัตนบุรี	314
263	d00728	\N	\N	ลำดวน	314
267	d00729	\N	\N	ศรีณรงค์	314
261	d00730	\N	\N	ศีขรภูมิ	314
260	d00731	\N	\N	สนม	314
262	d00732	\N	\N	สังขะ	314
264	d00733	\N	\N	สำโรงทาบ	314
268	d00734	\N	\N	เขวาสินรินทร์	314
253	d00735	\N	\N	เมืองสุรินทร์	314
269	d00736	\N	\N	โนนนารายณ์	314
676	d00737	\N	\N	กงไกรลาศ	415
675	d00738	\N	\N	คีรีมาศ	415
681	d00739	\N	\N	ทุ่งเสลี่ยม	415
674	d00740	\N	\N	บ้านด่านลานหอย	415
680	d00741	\N	\N	ศรีนคร	415
677	d00742	\N	\N	ศรีสัชนาลัย	415
678	d00743	\N	\N	ศรีสำโรง	415
679	d00744	\N	\N	สวรรคโลก	415
673	d00745	\N	\N	เมืองสุโขทัย	415
415	d00746	\N	\N	ท่าบ่อ	323
429	d00747	\N	\N	รัตนวาปี	323
420	d00748	\N	\N	ศรีเชียงใหม่	323
427	d00749	\N	\N	สระใคร	323
421	d00750	\N	\N	สังคม	323
428	d00751	\N	\N	เฝ้าไร่	323
414	d00752	\N	\N	เมืองหนองคาย	323
430	d00753	\N	\N	โพธิ์ตาก	323
418	d00754	\N	\N	โพนพิสัย	323
350	d00755	\N	\N	นากลาง	326
354	d00756	\N	\N	นาวัง	326
352	d00757	\N	\N	ศรีบุญเรือง	326
353	d00758	\N	\N	สุวรรณคูหา	326
349	d00759	\N	\N	เมืองหนองบัวลำภู	326
351	d00760	\N	\N	โนนสัง	326
343	d00761	\N	\N	ชานุมาน	337
344	d00762	\N	\N	ปทุมราชวงศา	337
345	d00763	\N	\N	พนา	337
348	d00764	\N	\N	ลืออำนาจ	337
347	d00765	\N	\N	หัวตะพาน	337
342	d00766	\N	\N	เมืองอำนาจเจริญ	337
346	d00767	\N	\N	เสนางคนิคม	337
381	d00768	\N	\N	กุดจับ	324
383	d00769	\N	\N	กุมภวาปี	324
398	d00770	\N	\N	กู่แก้ว	324
386	d00771	\N	\N	ทุ่งฝน	324
396	d00772	\N	\N	นายูง	324
392	d00773	\N	\N	น้ำโสม	324
390	d00774	\N	\N	บ้านดุง	324
391	d00775	\N	\N	บ้านผือ	324
399	d00776	\N	\N	ประจักษ์ศิลปาคม	324
397	d00777	\N	\N	พิบูลย์รักษ์	324
389	d00778	\N	\N	วังสามหมอ	324
388	d00779	\N	\N	ศรีธาตุ	324
394	d00780	\N	\N	สร้างคอม	324
382	d00781	\N	\N	หนองวัวซอ	324
385	d00782	\N	\N	หนองหาน	324
395	d00783	\N	\N	หนองแสง	324
393	d00784	\N	\N	เพ็ญ	324
380	d00785	\N	\N	เมืองอุดรธานี	324
384	d00786	\N	\N	โนนสะอาด	324
387	d00787	\N	\N	ไชยวาน	324
565	d00788	\N	\N	ตรอน	426
572	d00789	\N	\N	ทองแสนขัน	426
566	d00790	\N	\N	ท่าปลา	426
567	d00791	\N	\N	น้ำปาด	426
569	d00792	\N	\N	บ้านโคก	426
570	d00793	\N	\N	พิชัย	426
568	d00794	\N	\N	ฟากท่า	426
571	d00795	\N	\N	ลับแล	426
564	d00796	\N	\N	เมืองอุตรดิตถ์	426
646	d00797	\N	\N	ทัพทัน	412
650	d00798	\N	\N	บ้านไร่	412
651	d00799	\N	\N	ลานสัก	412
647	d00800	\N	\N	สว่างอารมณ์	412
649	d00801	\N	\N	หนองขาหย่าง	412
648	d00802	\N	\N	หนองฉาง	412
652	d00803	\N	\N	ห้วยคต	412
645	d00804	\N	\N	เมืองอุทัยธานี	412
302	d00805	\N	\N	กุดข้าวปุ้น	331
309	d00806	\N	\N	ดอนมดแดง	331
301	d00807	\N	\N	ตระการพืชผล	331
306	d00808	\N	\N	ตาลสุม	331
311	d00809	\N	\N	ทุ่งศรีอุดม	331
298	d00810	\N	\N	นาจะหลวย	331
313	d00811	\N	\N	นาตาล	331
312	d00812	\N	\N	นาเยีย	331
316	d00813	\N	\N	น้ำขุ่น	331
299	d00814	\N	\N	น้ำยืน	331
300	d00815	\N	\N	บุณฑริก	331
305	d00816	\N	\N	พิบูลมังสาหาร	331
303	d00817	\N	\N	ม่วงสามสิบ	331
304	d00818	\N	\N	วารินชำราบ	331
293	d00819	\N	\N	ศรีเมืองใหม่	331
315	d00820	\N	\N	สว่างวีระวงศ์	331
308	d00821	\N	\N	สำโรง	331
310	d00822	\N	\N	สิรินธร	331
296	d00823	\N	\N	เขมราฐ	331
295	d00824	\N	\N	เขื่องใน	331
297	d00825	\N	\N	เดชอุดม	331
292	d00826	\N	\N	เมืองอุบลราชธานี	331
314	d00827	\N	\N	เหล่าเสือโก้ก	331
294	d00828	\N	\N	โขงเจียม	331
307	d00829	\N	\N	โพธิ์ไทร	331
88	d00830	\N	\N	ป่าโมก	214
91	d00831	\N	\N	วิเศษชัยชาญ	214
92	d00832	\N	\N	สามโก้	214
86	d00833	\N	\N	เมืองอ่างทอง	214
90	d00834	\N	\N	แสวงหา	214
89	d00835	\N	\N	โพธิ์ทอง	214
87	d00836	\N	\N	ไชโย	214
618	d00837	\N	\N	ขุนตาล	433
622	d00838	\N	\N	ดอยหลวง	433
610	d00839	\N	\N	ป่าแดด	433
616	d00840	\N	\N	พญาเม็งราย	433
609	d00841	\N	\N	พาน	433
607	d00842	\N	\N	เชียงของ	433
612	d00843	\N	\N	เชียงแสน	433
608	d00844	\N	\N	เทิง	433
605	d00845	\N	\N	เมืองเชียงราย	433
606	d00846	\N	\N	เวียงชัย	433
615	d00847	\N	\N	เวียงป่าเป้า	433
621	d00848	\N	\N	เวียงเชียงรุ้ง	433
617	d00849	\N	\N	เวียงแก่น	433
611	d00850	\N	\N	แม่จัน	433
619	d00851	\N	\N	แม่ฟ้าหลวง	433
620	d00852	\N	\N	แม่ลาว	433
614	d00853	\N	\N	แม่สรวย	433
613	d00854	\N	\N	แม่สาย	433
927	d00855	\N	\N	กัลยาณิวัฒนา	432
520	d00856	\N	\N	จอมทอง	432
523	d00857	\N	\N	ดอยสะเก็ด	432
542	d00858	\N	\N	ดอยหล่อ	432
535	d00859	\N	\N	ดอยเต่า	432
527	d00860	\N	\N	ฝาง	432
529	d00861	\N	\N	พร้าว	432
526	d00862	\N	\N	สะเมิง	432
531	d00863	\N	\N	สันกำแพง	432
532	d00864	\N	\N	สันทราย	432
530	d00865	\N	\N	สันป่าตอง	432
537	d00866	\N	\N	สารภี	432
533	d00867	\N	\N	หางดง	432
536	d00868	\N	\N	อมก๋อย	432
534	d00869	\N	\N	ฮอด	432
522	d00870	\N	\N	เชียงดาว	432
519	d00871	\N	\N	เมืองเชียงใหม่	432
538	d00872	\N	\N	เวียงแหง	432
525	d00873	\N	\N	แม่ริม	432
540	d00874	\N	\N	แม่วาง	432
541	d00875	\N	\N	แม่ออน	432
528	d00876	\N	\N	แม่อาย	432
521	d00877	\N	\N	แม่แจ่ม	432
524	d00878	\N	\N	แม่แตง	432
539	d00879	\N	\N	ไชยปราการ	432
763	d00880	\N	\N	ชะอำ	244
764	d00881	\N	\N	ท่ายาง	244
765	d00882	\N	\N	บ้านลาด	244
766	d00883	\N	\N	บ้านแหลม	244
762	d00884	\N	\N	หนองหญ้าปล้อง	244
761	d00885	\N	\N	เขาย้อย	244
760	d00886	\N	\N	เมืองเพชรบุรี	244
767	d00887	\N	\N	แก่งกระจาน	244
704	d00888	\N	\N	ชนแดน	423
711	d00889	\N	\N	น้ำหนาว	423
710	d00890	\N	\N	บึงสามพัน	423
712	d00891	\N	\N	วังโป่ง	423
707	d00892	\N	\N	วิเชียรบุรี	423
708	d00893	\N	\N	ศรีเทพ	423
709	d00894	\N	\N	หนองไผ่	423
705	d00895	\N	\N	หล่มสัก	423
706	d00896	\N	\N	หล่มเก่า	423
713	d00897	\N	\N	เขาค้อ	423
703	d00898	\N	\N	เมืองเพชรบูรณ์	423
404	d00899	\N	\N	ด่านซ้าย	322
407	d00900	\N	\N	ท่าลี่	322
401	d00901	\N	\N	นาด้วง	322
405	d00902	\N	\N	นาแห้ว	322
403	d00903	\N	\N	ปากชม	322
411	d00904	\N	\N	ผาขาว	322
409	d00905	\N	\N	ภูกระดึง	322
410	d00906	\N	\N	ภูหลวง	322
406	d00907	\N	\N	ภูเรือ	322
408	d00908	\N	\N	วังสะพุง	322
413	d00909	\N	\N	หนองหิน	322
402	d00910	\N	\N	เชียงคาน	322
400	d00911	\N	\N	เมืองเลย	322
412	d00912	\N	\N	เอราวัณ	322
574	d00913	\N	\N	ร้องกวาง	424
575	d00914	\N	\N	ลอง	424
579	d00915	\N	\N	วังชิ้น	424
578	d00916	\N	\N	สอง	424
576	d00917	\N	\N	สูงเม่น	424
580	d00918	\N	\N	หนองม่วงไข่	424
577	d00919	\N	\N	เด่นชัย	424
573	d00920	\N	\N	เมืองแพร่	424
624	d00921	\N	\N	ขุนยวม	436
629	d00922	\N	\N	ปางมะผ้า	436
625	d00923	\N	\N	ปาย	436
628	d00924	\N	\N	สบเมย	436
623	d00925	\N	\N	เมืองแม่ฮ่องสอน	436
627	d00926	\N	\N	แม่ลาน้อย	436
626	d00927	\N	\N	แม่สะเรียง	436
\.


--
-- Data for Name: evaluation_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY evaluation_category (id, evaluation_category_name) FROM stdin;
47	Orientation
48	Registration
49	Attention
50	Calculation
51	Language
52	Recall
\.


--
-- Data for Name: evaluation_test; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY evaluation_test (id, frequency_patient, result_score, test_date) FROM stdin;
165	\N	\N	\N
166	\N	\N	\N
180	\N	\N	\N
194	\N	0	2018-01-31 17:02:18.755
\.


--
-- Data for Name: history_evaluation_test; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY history_evaluation_test (id, evaluation_test_id, patient) FROM stdin;
208	194	35
\.


--
-- Data for Name: image_question_evaluation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY image_question_evaluation (id, path) FROM stdin;
\.


--
-- Data for Name: matching; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY matching (id, caretaker_id, patient_id) FROM stdin;
42	39	35
43	39	36
44	40	36
45	41	36
46	40	34
\.


--
-- Data for Name: number_evaluation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY number_evaluation (id, no, score, evaluation_category) FROM stdin;
53	1	3	47
54	2	1	47
55	3	1	47
56	4	1	47
57	5	3	48
58	6	5	49
59	7	3	50
60	8	2	51
61	9	1	51
62	10	1	51
63	11	1	51
64	12	1	51
65	13	1	51
66	14	3	52
\.


--
-- Data for Name: patient; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY patient (id, address, dob, email, first_name, frequency, image, last_name, level, occupation, password, patient_number, tell, title_name, user_name, district_id, province_id, sex_id, sub_district_id) FROM stdin;
35	60	21 กุมภาพันธ์ 2489	nogkwt@gmail.com	สมชาย	\N	\N	นกเกตุ	\N	นศ	1234	P952641	0981709858	นาย	qwer	64	231	1	270
36	60	22 สิงหาคม 2510	nogt@gmail.com	สมศักดิ์	\N	\N	เจียมสิน	\N	นศ	1234	P139175	0981709358	นาย	Somsak	64	231	1	270
34	60	21 กุมภาพันธ์ 2489	nogket@gmail.com	สมชาย	\N	\N	นกเกตุ	\N	นศ	1234	P334386	0982709858	นาย	punnoket	64	231	1	270
37	60	22 ตุลาคม 2499	nogt@gmfail.com	สิวิมล	\N	\N	รักดี	\N	นศ	1234	P787440	0981709458	นาง	siwimon	64	231	2	270
38	60	3 มีนาคม 2499	nogt@3mfail.com	เสาวลัก	\N	\N	สินชัย	\N	นศ	1234	P775039	0981709438	นาง	soawaluk	34	222	2	344
209	60	3 มีนาคม 2499	nogt@3mกfail.com	เสาวลัก	\N	\N	สินชัย	\N	นศ	1234	P459503	09817094438	นาง	soaกwaluk	34	222	2	344
210	60	3 มีนาคม 2499	nogt@3mกfaeeil.com	เสาวลัก	\N	\N	สินชัย	\N	นศ	1234	P489835	09894438	นาง	soawqewqwaluk	34	222	2	344
212	60	3 มีนาคม 2499	lnw@gdemail.com	เสาวลัก	\N	\N	สินชัย	\N	นศ	1234	P093575	09827283458	นาง	testcaeeretaker	34	222	2	344
214	60	3 มีนาคม 2499	lnwd@gdemail.com	เสาวลัก	\N	\N	สินชัย	\N	นศ	1234	P336145	0983283458	นาง	testeetaker	34	222	2	344
215	60	3 มีนาคม 2499	lndddwd@gdemail.com	เสาวลัก	\N	\N	สินชัย	\N	นศ	1234	P311956	0983280903458	นาง	testpatyienr	34	222	2	344
217	60	3 มีนาคม 2499	lnddssdwfd@gdemail.com	เสาวลัก	\N	\N	สินชัย	\N	นศ	1234	P945660	0983283434ff358	นาง	testpasadsftyienr	34	222	2	344
\.


--
-- Data for Name: patient_test; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY patient_test (id, answer, score, answer_evaluation_id, evaluation_test, question_evaluation_id) FROM stdin;
167	abcd	0	\N	166	67
168	asc	0	\N	166	70
169	a	0	\N	166	73
170		\N	\N	166	75
171		0	\N	166	80
172		0	\N	166	83
173		0	\N	166	87
174		0	\N	166	88
175		0	\N	166	90
176		0	\N	166	92
177		0	\N	166	93
178		0	\N	166	94
179		0	\N	166	99
181	abcd	0	\N	180	67
182	asc	0	\N	180	70
183	a	0	\N	180	73
184		\N	\N	180	75
185		0	\N	180	80
186		0	\N	180	83
187		0	\N	180	87
188		0	\N	180	88
189		0	\N	180	90
190		0	\N	180	92
191		0	\N	180	93
192		0	\N	180	94
193		0	\N	180	99
195	abcd	0	\N	194	67
196	asc	0	\N	194	70
197	a	0	\N	194	73
198		\N	\N	194	75
199		0	\N	194	80
200		0	\N	194	83
201		0	\N	194	87
202		0	\N	194	88
203		0	\N	194	90
204		0	\N	194	92
205		0	\N	194	93
206		0	\N	194	94
207		0	\N	194	99
\.


--
-- Data for Name: province; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY province (id, code, created, modified, name) FROM stdin;
517		\N	\N	กระบี่
111		\N	\N	กรุงเทพมหานคร
243		\N	\N	กาญจนบุรี
327		\N	\N	กาฬสินธุ์
414		\N	\N	กำแพงเพชร
321		\N	\N	ขอนแก่น
235		\N	\N	จันทบุรี
232		\N	\N	ฉะเชิงเทรา
231		\N	\N	ชลบุรี
224		\N	\N	ชัยนาท
312		\N	\N	ชัยภูมิ
513		\N	\N	ชุมพร
523		\N	\N	ตรัง
234		\N	\N	ตราด
413		\N	\N	ตาก
225		\N	\N	นครนายก
242		\N	\N	นครปฐม
333		\N	\N	นครพนม
311		\N	\N	นครราชสีมา
511		\N	\N	นครศรีธรรมราช
411		\N	\N	นครสวรรค์
211		\N	\N	นนทบุรี
527		\N	\N	นราธิวาส
425		\N	\N	น่าน
528		\N	\N	บึงกาฬ
313		\N	\N	บุรีรัมย์
212		\N	\N	ปทุมธานี
245		\N	\N	ประจวบคีรีขันธ์
233		\N	\N	ปราจีนบุรี
526		\N	\N	ปัตตานี
213		\N	\N	พระนครศรีอยุธยา
435		\N	\N	พะเยา
515		\N	\N	พังงา
522		\N	\N	พัทลุง
422		\N	\N	พิจิตร
421		\N	\N	พิษณุโลก
516		\N	\N	ภูเก็ต
315		\N	\N	มหาสารคาม
334		\N	\N	มุกดาหาร
525		\N	\N	ยะลา
332		\N	\N	ยโสธร
514		\N	\N	ระนอง
236		\N	\N	ระยอง
241		\N	\N	ราชบุรี
335		\N	\N	ร้อยเอ็ด
222		\N	\N	ลพบุรี
431		\N	\N	ลำปาง
434		\N	\N	ลำพูน
336		\N	\N	ศรีสะเกษ
325		\N	\N	สกลนคร
521		\N	\N	สงขลา
524		\N	\N	สตูล
215		\N	\N	สมุทรปราการ
246		\N	\N	สมุทรสาคร
247		\N	\N	สมุทรสงคราม
221		\N	\N	สระบุรี
237		\N	\N	สระแก้ว
223		\N	\N	สิงห์บุรี
226		\N	\N	สุพรรณบุรี
314		\N	\N	สุรินทร์
512		\N	\N	สุราษฎร์ธานี
415		\N	\N	สุโขทัย
323		\N	\N	หนองคาย
326		\N	\N	หนองบัวลำภู
337		\N	\N	อำนาจเจริญ
324		\N	\N	อุดรธานี
426		\N	\N	อุตรดิตถ์
412		\N	\N	อุทัยธานี
331		\N	\N	อุบลราชธานี
214		\N	\N	อ่างทอง
433		\N	\N	เชียงราย
432		\N	\N	เชียงใหม่
244		\N	\N	เพชรบุรี
423		\N	\N	เพชรบูรณ์
322		\N	\N	เลย
424		\N	\N	แพร่
436		\N	\N	แม่ฮ่องสอน
\.


--
-- Data for Name: question_evaluation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY question_evaluation (id, description, image, title, number_evaluation, audio) FROM stdin;
68		\N	คำถาม 2	53	\N
69		\N	คำถาม 3	53	\N
70		\N	คำถาม 4	54	\N
71	คำอธิบาย	\N	คำถาม 5	54	\N
72	คำอธิบาย	\N	คำถาม 6	55	\N
73	คำอธิบาย	\N	คำถาม 6	56	\N
74	คำอธิบาย	\N	คำถาม 7	56	\N
75	คำอธิบาย	\N	คำถาม 8	57	\N
76	คำอธิบาย	\N	คำถาม 8	57	\N
77	คำอธิบาย	\N	คำถาม 8	57	\N
78	คำอธิบาย	\N	คำถาม 8	57	\N
79	คำอธิบาย	\N	คำถาม 34324	57	\N
80	คำอธิบาย	\N	คำถาม 34324	58	\N
81	คำอธิบาย	\N	คำถาม 33r23rfd	58	\N
82	คำอธิบาย	\N	ferfe	58	\N
83	คำอธิบาย	\N	ferfe	59	\N
84	gfddfg	\N	fefgdfgrfe	59	\N
85	gfddfg	\N	question	60	\N
86	gfddfg	\N	question	60	\N
87	gfddfg	\N	question22	60	\N
88	gfddfg	\N	question22	61	\N
89	gfddfg	\N	question44	61	\N
90	gfddfg	\N	qu2e24	62	\N
91	gfddfg	\N	qu2e24	63	\N
92	gfddfg	\N	qu2e24	63	\N
93	gfddfg	\N	qu2err23r24	64	\N
94	gfddfg	\N	qu2erefewfr24	65	\N
95	gfddfg	\N	qu2erefewfr24	65	\N
96	gfdffdfg	\N	qu2erefff##ewfr24	65	\N
97	gfdffdfg	\N	qu2erefff##ewfr24	65	\N
98	gfdffdfg	\N	qu2erefff##ewfr24	65	\N
99	gfdffdfg	\N	recal	66	\N
67		image/question/orientation/1/67/1517685774367.m4a	คำถาม 1	53	audio/question/orientation/1/67/1517735978883.wav
\.


--
-- Data for Name: sex; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sex (id, code, created, modified, name) FROM stdin;
1	\N	\N	\N	ชาย
2	\N	\N	\N	หญิง
\.


--
-- Data for Name: subdistrict; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY subdistrict (id, code, created, modified, name, zip_code, district_id, province_id) FROM stdin;
7123		\N	\N	ไม้แก่น	94220	901	526
335		\N	\N	จำปา	13130	71	213
336		\N	\N	ท่าหลวง	18270	71	213
343		\N	\N	ท่าเจ้าสนุก	13130	71	213
334		\N	\N	ท่าเรือ	13130	71	213
337		\N	\N	บ้านร่อม	13130	71	213
341		\N	\N	ปากท่า	13130	71	213
339		\N	\N	วังแดง	13130	71	213
338		\N	\N	ศาลาลอย	13130	71	213
342		\N	\N	หนองขนาก	13130	71	213
340		\N	\N	โพธิ์เอน	13130	71	213
353		\N	\N	คลองสะแก	13260	72	213
345		\N	\N	ท่าช้าง	13260	72	213
344		\N	\N	นครหลวง	13260	72	213
350		\N	\N	บางพระครู	13260	72	213
349		\N	\N	บางระกำ	13260	72	213
346		\N	\N	บ่อโพง	13260	72	213
347		\N	\N	บ้านชุ้ง	13260	72	213
348		\N	\N	ปากจั่น	13260	72	213
355		\N	\N	พระนอน	13260	72	213
354		\N	\N	สามไถ	13260	72	213
352		\N	\N	หนองปลิง	13260	72	213
351		\N	\N	แม่ลา	13260	72	213
484		\N	\N	บางซ้าย	13270	82	213
487		\N	\N	ปลายกลัด	13270	82	213
489		\N	\N	วังพัฒนา	13270	82	213
486		\N	\N	เต่าเล่า	13270	82	213
488		\N	\N	เทพมงคล	13270	82	213
485		\N	\N	แก้วฟ้า	13270	82	213
383		\N	\N	กบเจา	13250	74	213
386		\N	\N	ทางช้าง	13250	74	213
505		\N	\N	น้ำเต้า	13250	74	213
391		\N	\N	บางชะนี	13250	74	213
377		\N	\N	บางบาล	13250	74	213
388		\N	\N	บางหลวง	13250	74	213
389		\N	\N	บางหลวงโดด	13250	74	213
390		\N	\N	บางหัก	13250	74	213
392		\N	\N	บ้านกุ่ม	13250	74	213
384		\N	\N	บ้านคลัง	13250	74	213
385		\N	\N	พระขาว	13250	74	213
382		\N	\N	มหาพราหมณ์	13250	74	213
387		\N	\N	วัดตะกู	13250	74	213
379		\N	\N	วัดยม	13250	74	213
381		\N	\N	สะพานไทย	13250	74	213
380		\N	\N	ไทรน้อย	13250	74	213
412		\N	\N	ขยาย	13220	76	213
421		\N	\N	ขวัญเมือง	13220	76	213
419		\N	\N	ตานิม	13220	76	213
425		\N	\N	ตาลเอน	13220	76	213
420		\N	\N	ทับน้ำ	13220	76	213
415		\N	\N	ทางกลาง	13220	76	213
418		\N	\N	บางนางร้า	13220	76	213
411		\N	\N	บางปะหัน	13220	76	213
413		\N	\N	บางเดื่อ	13220	76	213
416		\N	\N	บางเพลิง	13220	76	213
426		\N	\N	บ้านขล้อ	13220	76	213
372		\N	\N	บ้านม้า	13220	76	213
422		\N	\N	บ้านลี่	13220	76	213
7301		\N	\N	พุทเลา	13220	76	213
424		\N	\N	พุทเลา	13220	76	213
417		\N	\N	หันสัง	13220	76	213
414		\N	\N	เสาธง	13220	76	213
423		\N	\N	โพธิ์สามต้น	13220	76	213
410		\N	\N	ขนอนหลวง	13160	75	213
398		\N	\N	คลองจิก	13160	75	213
406		\N	\N	คุ้งลาน	13160	75	213
409		\N	\N	ตลาดเกรียบ	13160	75	213
407		\N	\N	ตลิ่งชัน	13160	75	213
397		\N	\N	บางกระสั้น	13160	75	213
400		\N	\N	บางประแดง	13160	75	213
396		\N	\N	บ้านกรด	13160	75	213
403		\N	\N	บ้านพลับ	13160	75	213
408		\N	\N	บ้านสร้าง	13170	75	213
399		\N	\N	บ้านหว้า	13160	75	213
393		\N	\N	บ้านเลน	13160	75	213
404		\N	\N	บ้านแป้ง	13160	75	213
395		\N	\N	บ้านโพ	13160	75	213
378		\N	\N	วัดยม	13160	75	213
401		\N	\N	สามเรือน	13160	75	213
402		\N	\N	เกาะเกิด	13160	75	213
394		\N	\N	เชียงรากน้อย	13180	75	213
369		\N	\N	กกแก้วบูรพา	13190	73	213
364		\N	\N	กระแชง	13190	73	213
363		\N	\N	ช่างเหล็ก	13190	73	213
366		\N	\N	ช้างน้อย	13190	73	213
374		\N	\N	ช้างใหญ่	13290	73	213
357		\N	\N	บางพลี	13190	73	213
360		\N	\N	บางยี่โท	13190	73	213
356		\N	\N	บางไทร	13190	73	213
365		\N	\N	บ้านกลึง	13190	73	213
371		\N	\N	บ้านม้า	13190	73	213
327		\N	\N	บ้านเกาะ	13190	73	213
405		\N	\N	บ้านแป้ง	13190	73	213
373		\N	\N	ราชคราม	13290	73	213
358		\N	\N	สนามชัย	13190	73	213
359		\N	\N	หน้าไม้	13190	73	213
367		\N	\N	ห่อหมก	13190	73	213
376		\N	\N	เชียงรากน้อย	13290	73	213
362		\N	\N	แคตก	13190	73	213
361		\N	\N	แคออก	13190	73	213
437		\N	\N	โคกช้าง	13190	73	213
4641		\N	\N	แม่ปืม	56000	596	435
375		\N	\N	โพแตง	13290	73	213
368		\N	\N	ไผ่พระ	13190	73	213
370		\N	\N	ไม้ตรา	13190	73	213
517		\N	\N	คลองน้อย	13240	85	213
514		\N	\N	บ้านแพรก	13240	85	213
515		\N	\N	บ้านใหม่	13240	85	213
518		\N	\N	สองห้อง	13240	85	213
516		\N	\N	สำพะเนียง	13240	85	213
435		\N	\N	กุฎี	13120	77	213
439		\N	\N	จักราช	13280	77	213
433		\N	\N	ดอนลาน	13280	77	213
431		\N	\N	ตาลาน	13120	77	213
432		\N	\N	ท่าดินแดง	13120	77	213
434		\N	\N	นาคู	13280	77	213
429		\N	\N	บ้านแค	13120	77	213
443		\N	\N	บ้านใหญ่	13120	77	213
427		\N	\N	ผักไห่	13120	77	213
441		\N	\N	ลาดชิด	13120	77	213
430		\N	\N	ลาดน้ำเค็ม	13120	77	213
436		\N	\N	ลำตะเคียน	13280	77	213
440		\N	\N	หนองน้ำใหญ่	13280	77	213
442		\N	\N	หน้าโคก	13120	77	213
428		\N	\N	อมฤต	13120	77	213
438		\N	\N	โคกช้าง	13120	77	213
7374		\N	\N	กะมัง	13000	70	213
322		\N	\N	คลองตะเคียน	13000	70	213
330		\N	\N	คลองสระบัว	13000	70	213
329		\N	\N	คลองสวนพลู	13000	70	213
7375		\N	\N	ท่าวาสุกรี	13000	70	213
332		\N	\N	บ้านป้อม	13000	70	213
333		\N	\N	บ้านรุน	13000	70	213
328		\N	\N	บ้านเกาะ	13000	70	213
326		\N	\N	บ้านใหม่	13000	70	213
7376		\N	\N	ประตูชัย	13000	70	213
318		\N	\N	ปากกราน	13000	70	213
319		\N	\N	ภูเขาทอง	13000	70	213
325		\N	\N	ลุมพลี	13000	70	213
323		\N	\N	วัดตูม	13000	70	213
321		\N	\N	สวนพริก	13000	70	213
320		\N	\N	สำเภาล่ม	13000	70	213
7377		\N	\N	หอรัตนไชย	13000	70	213
324		\N	\N	หันตรา	13000	70	213
7378		\N	\N	หัวรอ	13000	70	213
331		\N	\N	เกาะเรียน	13000	70	213
317		\N	\N	ไผ่ลิง	13000	70	213
450		\N	\N	กระจิว	13140	78	213
448		\N	\N	ดอนหญ้านาง	13140	78	213
451		\N	\N	พระแก้ว	13140	78	213
444		\N	\N	ภาชี	13140	78	213
446		\N	\N	ระโสม	13140	78	213
447		\N	\N	หนองน้ำใส	13140	78	213
445		\N	\N	โคกม่วง	13140	78	213
449		\N	\N	ไผ่ล้อม	13140	78	213
502		\N	\N	กะทุ่ม	13150	84	213
512		\N	\N	ท่าตอ	13150	84	213
504		\N	\N	น้ำเต้า	13150	84	213
506		\N	\N	บางนา	13150	84	213
511		\N	\N	บ้านขวาง	13150	84	213
510		\N	\N	บ้านนา	13150	84	213
513		\N	\N	บ้านใหม่	13150	84	213
509		\N	\N	พิตเพียน	13150	84	213
503		\N	\N	มหาราช	13150	84	213
501		\N	\N	หัวไผ่	13150	84	213
508		\N	\N	เจ้าปลุก	13150	84	213
507		\N	\N	โรงช้าง	13150	84	213
7380		\N	\N	คลองพระยาบันลือ	13230	79	213
457		\N	\N	คู้สลอด	13230	79	213
455		\N	\N	พระยาบันลือ	13230	79	213
452		\N	\N	ลาดบัวหลวง	13230	79	213
454		\N	\N	สามเมือง	13230	79	213
456		\N	\N	สิงหนาท	13230	79	213
453		\N	\N	หลักชัย	13230	79	213
466		\N	\N	ข้าวงาม	13170	80	213
467		\N	\N	ชะแมบ	13170	80	213
459		\N	\N	บ่อตาโล่	13170	80	213
463		\N	\N	พยอม	13170	80	213
458		\N	\N	ลำตาเสา	13170	80	213
461		\N	\N	ลำไทร	13170	80	213
465		\N	\N	วังจุฬา	13170	80	213
460		\N	\N	วังน้อย	13170	80	213
462		\N	\N	สนับทึบ	13170	80	213
464		\N	\N	หันตะเภา	13170	80	213
500		\N	\N	ข้าวเม่า	13210	83	213
490		\N	\N	คานหาม	13210	83	213
499		\N	\N	ธนู	13210	83	213
491		\N	\N	บ้านช้าง	13210	83	213
493		\N	\N	บ้านหีบ	13210	83	213
492		\N	\N	สามบัณฑิต	13210	83	213
497		\N	\N	หนองน้ำส้ม	13210	83	213
494		\N	\N	หนองไม้ซุง	13210	83	213
495		\N	\N	อุทัย	13210	83	213
496		\N	\N	เสนา	13210	83	213
498		\N	\N	โพสาวหาญ	13210	83	213
478		\N	\N	ชายนา	13110	81	213
481		\N	\N	ดอนทอง	13110	81	213
471		\N	\N	บางนมโค	13110	81	213
476		\N	\N	บ้านกระทุ่ม	13110	81	213
482		\N	\N	บ้านหลวง	13110	81	213
477		\N	\N	บ้านแถว	13110	81	213
468		\N	\N	บ้านแพน	13110	81	213
474		\N	\N	บ้านโพธิ์	13110	81	213
473		\N	\N	มารวิชัย	13110	81	213
475		\N	\N	รางจรเข้	13110	81	213
480		\N	\N	ลาดงา	13110	81	213
470		\N	\N	สามกอ	13110	81	213
479		\N	\N	สามตุ่ม	13110	81	213
472		\N	\N	หัวเวียง	13110	81	213
469		\N	\N	เจ้าเจ็ด	13110	81	213
483		\N	\N	เจ้าเสด็จ	13110	81	213
7379		\N	\N	เสนา	13110	81	213
4650		\N	\N	จุน	56150	597	435
4653		\N	\N	ทุ่งรวงทอง	56150	597	435
4655		\N	\N	พระธาตุขิงแกง	56150	597	435
4652		\N	\N	หงส์หิน	56150	597	435
4649		\N	\N	ห้วยข้าวก่ำ	56150	597	435
4654		\N	\N	ห้วยยางขาม	56150	597	435
7442		\N	\N	คือเวียง	56120	600	435
4677		\N	\N	ดงสุวรรณ	56120	600	435
4669		\N	\N	ดอกคำใต้	56120	600	435
4670		\N	\N	ดอนศรีชุม	56120	600	435
4678		\N	\N	บุญเกิด	56120	600	435
4671		\N	\N	บ้านถ้ำ	56120	600	435
4672		\N	\N	บ้านปิน	56120	600	435
4675		\N	\N	ป่าซาง	56120	600	435
4679		\N	\N	สว่างอารมณ์	56120	600	435
4674		\N	\N	สันโค้ง	56120	600	435
4676		\N	\N	หนองหล่ม	56120	600	435
4673		\N	\N	ห้วยลาน	56120	600	435
4686		\N	\N	ขุนควร	56140	601	435
4681		\N	\N	ควร	56140	601	435
4683		\N	\N	งิม	56140	601	435
4685		\N	\N	นาปรัง	56140	601	435
4680		\N	\N	ปง	56140	601	435
4684		\N	\N	ผาช้างน้อย	56140	601	435
4682		\N	\N	ออย	56140	601	435
4698		\N	\N	ดงเจน	56000	604	435
4697		\N	\N	ห้วยแก้ว	56000	604	435
4699		\N	\N	แม่อิง	56000	604	435
4694		\N	\N	ทุ่งกล้วย	56110	603	435
7441		\N	\N	ป่าสัก	56110	603	435
4693		\N	\N	ภูซาง	56110	603	435
4696		\N	\N	สบบง	56110	603	435
4695		\N	\N	เชียงแรง	56110	603	435
4665		\N	\N	ทุ่งผาสุข	56110	598	435
4657		\N	\N	น้ำแวน	56110	598	435
4659		\N	\N	ฝายกวาง	56110	598	435
4661		\N	\N	ร่มเย็น	56110	598	435
4656		\N	\N	หย่วน	56110	598	435
4664		\N	\N	อ่างทอง	56110	598	435
4660		\N	\N	เจดีย์คำ	56110	598	435
4662		\N	\N	เชียงบาน	56110	598	435
4658		\N	\N	เวียง	56110	598	435
4663		\N	\N	แม่ลาว	56110	598	435
4667		\N	\N	บ้านมาง	56160	599	435
4668		\N	\N	สระ	56160	599	435
4666		\N	\N	เชียงม่วน	56160	599	435
4644		\N	\N	จำป่าหวาย	56000	596	435
4648		\N	\N	ท่าจำปี	56000	596	435
4645		\N	\N	ท่าวังทอง	56000	596	435
4638		\N	\N	บ้านตุ่น	56000	596	435
4639		\N	\N	บ้านต๊ำ	56000	596	435
4640		\N	\N	บ้านต๋อม	56000	596	435
4647		\N	\N	บ้านสาง	56000	596	435
4643		\N	\N	บ้านใหม่	56000	596	435
7439		\N	\N	สันป่าม่วง	56000	596	435
4636		\N	\N	เวียง	56000	596	435
4642		\N	\N	แม่กา	56000	596	435
7440		\N	\N	แม่ต๋ำ	56000	596	435
4637		\N	\N	แม่นาเรือ	56000	596	435
4646		\N	\N	แม่ใส	56000	596	435
4691		\N	\N	บ้านเหล่า	56130	602	435
4690		\N	\N	ป่าแฝก	56130	602	435
4688		\N	\N	ศรีถ้อย	56130	602	435
4692		\N	\N	เจริญราษฎร์	56130	602	435
4689		\N	\N	แม่สุก	56130	602	435
4687		\N	\N	แม่ใจ	56130	602	435
6413		\N	\N	กะปง	82170	809	515
6414		\N	\N	ท่านา	82170	809	515
6417		\N	\N	รมณีย์	82170	809	515
6415		\N	\N	เหมาะ	82170	809	515
6416		\N	\N	เหล	82170	809	515
6433		\N	\N	คุระ	82150	812	515
6434		\N	\N	บางวัน	82150	812	515
6435		\N	\N	เกาะพระทอง	82150	812	515
6436		\N	\N	แม่นางขาว	82150	812	515
6419		\N	\N	กระโสม	82130	810	515
6420		\N	\N	กะไหล	82130	810	515
6424		\N	\N	คลองเคียน	82130	810	515
6418		\N	\N	ถ้ำ	82130	810	515
6421		\N	\N	ท่าอยู่	82130	810	515
6422		\N	\N	หล่อยูง	82140	810	515
6423		\N	\N	โคกกลอย	82140	810	515
6431		\N	\N	คึกคัก	82220	811	515
6425		\N	\N	ตะกั่วป่า	82110	811	515
6429		\N	\N	ตำตัว	82110	811	515
6426		\N	\N	บางนายสี	82110	811	515
6428		\N	\N	บางม่วง	82190	811	515
6427		\N	\N	บางไทร	82110	811	515
6432		\N	\N	เกาะคอเขา	82190	811	515
6430		\N	\N	โคกเคียน	82110	811	515
6440		\N	\N	ถ้ำทองหลาง	82180	813	515
6437		\N	\N	ทับปุด	82180	813	515
6442		\N	\N	บางเหรียง	82180	813	515
6439		\N	\N	บ่อแสน	82180	813	515
6438		\N	\N	มะรุ่ย	82180	813	515
6441		\N	\N	โคกเจริญ	82180	813	515
6446		\N	\N	ทุ่งมะพร้าว	82120	814	515
6443		\N	\N	ท้ายเหมือง	82120	814	515
6444		\N	\N	นาเตย	82120	814	515
6445		\N	\N	บางทอง	82120	814	515
6447		\N	\N	ลำภี	82120	814	515
6448		\N	\N	ลำแก่น	82210	814	515
6412		\N	\N	พรุใน	83000	808	515
6410		\N	\N	เกาะยาวน้อย	82160	808	515
6411		\N	\N	เกาะยาวใหญ่	82160	808	515
6405		\N	\N	ตากแดด	82000	807	515
6403		\N	\N	ถ้ำน้ำผุด	82000	807	515
6407		\N	\N	ทุ่งคาโงก	82000	807	515
7476		\N	\N	ท้ายช้าง	82000	807	515
6402		\N	\N	นบปริง	82000	807	515
6404		\N	\N	บางเตย	82000	807	515
6409		\N	\N	ป่ากอ	82000	807	515
6406		\N	\N	สองแพรก	82000	807	515
6408		\N	\N	เกาะปันหยี	82000	807	515
6999		\N	\N	กงหรา	93180	884	522
7002		\N	\N	คลองทรายขาว	93180	884	522
7001		\N	\N	คลองเฉลิม	93180	884	522
7000		\N	\N	ชะรัด	93000	884	522
7322		\N	\N	สมหวัง	93000	884	522
7011		\N	\N	ควนขนุน	93110	887	522
7021		\N	\N	ชะมวง	93110	887	522
7018		\N	\N	ดอนทราย	93110	887	522
7012		\N	\N	ทะเลน้อย	93150	887	522
7013		\N	\N	นาขยาด	93110	887	522
7016		\N	\N	ปันแต	93110	887	522
7014		\N	\N	พนมวังก์	93110	887	522
7020		\N	\N	พนางตุง	93150	887	522
7019		\N	\N	มะกอกเหนือ	93150	887	522
7022		\N	\N	แพรกหา	93110	887	522
7015		\N	\N	แหลมโตนด	93110	887	522
7017		\N	\N	โตนดด้วน	93110	887	522
7010		\N	\N	คลองใหญ่	93160	886	522
7009		\N	\N	ตะโหมด	93160	886	522
7008		\N	\N	แม่ขรี	93160	886	522
7038		\N	\N	ท่ามะเดื่อ	93140	891	522
7039		\N	\N	นาปะขอ	93140	891	522
7040		\N	\N	โคกสัก	93140	891	522
7029		\N	\N	ดอนทราย	93120	888	522
7024		\N	\N	ดอนประดู่	93120	888	522
7023		\N	\N	ปากพะยูน	93120	888	522
7027		\N	\N	ฝาละมี	93120	888	522
7028		\N	\N	หารเทา	93120	888	522
7025		\N	\N	เกาะนางคำ	93120	888	522
7026		\N	\N	เกาะหมาก	93120	888	522
7036		\N	\N	ทุ่งนารี	93170	890	522
7033		\N	\N	ป่าบอน	93170	890	522
7037		\N	\N	วังใหม่	93170	890	522
7035		\N	\N	หนองธง	93170	890	522
7034		\N	\N	โคกทราย	93170	890	522
7044		\N	\N	บ้านพร้าว	93210	892	522
7041		\N	\N	ป่าพะยอม	93210	892	522
7042		\N	\N	ลานข่อย	93210	892	522
7043		\N	\N	เกาะเต่า	93210	892	522
7045		\N	\N	ชุมพล	93000	893	522
7046		\N	\N	บ้านนา	93000	893	522
7048		\N	\N	ลำสินธุ์	93000	893	522
7047		\N	\N	อ่างทอง	93000	893	522
7032		\N	\N	ตะแพน	93190	889	522
7031		\N	\N	เขาปู่	93190	889	522
7030		\N	\N	เขาย่า	93190	889	522
7004		\N	\N	ควนขนุน	93130	885	522
7005		\N	\N	จองถนน	93130	885	522
7006		\N	\N	หานโพธิ์	93130	885	522
7003		\N	\N	เขาชัยสน	93130	885	522
7007		\N	\N	โคกม่วง	93130	885	522
6994		\N	\N	ควนมะพร้าว	93000	883	522
6985		\N	\N	คูหาสวรรค์	93000	883	522
6996		\N	\N	ชัยบุรี	93000	883	522
6993		\N	\N	ตำนาน	93000	883	522
6987		\N	\N	ท่ามิหรำ	93000	883	522
6991		\N	\N	ท่าแค	93000	883	522
6989		\N	\N	นาท่อม	93000	883	522
6997		\N	\N	นาโหนด	93000	883	522
6990		\N	\N	ปรางหมู่	93000	883	522
6998		\N	\N	พญาขัน	93000	883	522
6995		\N	\N	ร่มเมือง	93000	883	522
6992		\N	\N	ลำปำ	93000	883	522
6986		\N	\N	เขาเจียก	93000	883	522
6988		\N	\N	โคกชะงาย	93000	883	522
5457		\N	\N	วังงิ้ว	66210	701	422
5456		\N	\N	วังงิ้วใต้	66210	701	422
5460		\N	\N	สำนักขุนเณร	66210	701	422
5459		\N	\N	ห้วยพุก	66210	701	422
5458		\N	\N	ห้วยร่วม	66210	701	422
5410		\N	\N	คลองคูณ	66110	694	422
5404		\N	\N	งิ้วราย	66110	694	422
5409		\N	\N	ดงตะขบ	66110	694	422
5403		\N	\N	ตะพานหิน	66110	694	422
5414		\N	\N	ทับหมัน	66110	694	422
5408		\N	\N	ทุ่งโพธิ์	66150	694	422
5411		\N	\N	วังสำโรง	66110	694	422
5413		\N	\N	วังหลุม	66150	694	422
5412		\N	\N	วังหว้า	66110	694	422
5407		\N	\N	หนองพยอม	66110	694	422
5405		\N	\N	ห้วยเกตุ	66110	694	422
5406		\N	\N	ไทรโรงโขน	66110	694	422
5415		\N	\N	ไผ่หลวง	66110	694	422
5442		\N	\N	ทับคล้อ	66150	698	422
5445		\N	\N	ท้ายทุ่ง	66150	698	422
5443		\N	\N	เขาทราย	66230	698	422
5444		\N	\N	เขาเจ็ดลูก	66230	698	422
5416		\N	\N	บางมูลนาก	66120	695	422
5417		\N	\N	บางไผ่	66120	695	422
5421		\N	\N	ภูมิ	66120	695	422
5425		\N	\N	ลำประดา	66120	695	422
5422		\N	\N	วังกรด	66120	695	422
5424		\N	\N	วังตะกู	66210	695	422
5420		\N	\N	วังสำโรง	66120	695	422
5418		\N	\N	หอไกร	66120	695	422
5423		\N	\N	ห้วยเขน	66120	695	422
5419		\N	\N	เนินมะกอก	66120	695	422
5454		\N	\N	บางลาย	66130	700	422
5455		\N	\N	บึงนาราง	66130	700	422
5451		\N	\N	ห้วยแก้ว	66130	700	422
5453		\N	\N	แหลมรัง	66130	700	422
5452		\N	\N	โพธิ์ไทรงาม	66130	700	422
5462		\N	\N	บึงบัว	66140	702	422
5461		\N	\N	บ้านนา	66140	702	422
5463		\N	\N	วังโมกข์	66140	702	422
5464		\N	\N	หนองหลุม	66220	702	422
5392		\N	\N	วังทรายพูน	66180	692	422
5393		\N	\N	หนองปลาไหล	66180	692	422
5395		\N	\N	หนองปล้อง	66180	692	422
5394		\N	\N	หนองพระ	66180	692	422
5448		\N	\N	คลองทราย	66160	699	422
5447		\N	\N	ท่าเยี่ยม	66160	699	422
5450		\N	\N	วังทับไทร	66160	699	422
5446		\N	\N	สากเหล็ก	66160	699	422
5449		\N	\N	หนองหญ้าไทร	66160	699	422
5438		\N	\N	กำแพงดิน	66220	697	422
5439		\N	\N	รังนก	66140	697	422
5437		\N	\N	สามง่าม	66140	697	422
5441		\N	\N	หนองโสน	66140	697	422
5440		\N	\N	เนินปอ	66140	697	422
5381		\N	\N	คลองคะเชนทร์	66000	691	422
5386		\N	\N	ฆะมัง	66000	691	422
5391		\N	\N	ดงกลาง	66170	691	422
5387		\N	\N	ดงป่าคำ	66170	691	422
5384		\N	\N	ท่าหลวง	66000	691	422
5379		\N	\N	ท่าฬ่อ	66000	691	422
5385		\N	\N	บ้านบุ่ง	66000	691	422
5380		\N	\N	ปากทาง	66000	691	422
5389		\N	\N	ป่ามะคาบ	66000	691	422
5378		\N	\N	ย่านยาว	66000	691	422
5390		\N	\N	สายคำโห้	66000	691	422
5388		\N	\N	หัวดง	66170	691	422
5383		\N	\N	เมืองเก่า	66000	691	422
5382		\N	\N	โรงช้าง	66000	691	422
5376		\N	\N	ในเมือง	66000	691	422
5377		\N	\N	ไผ่ขวาง	66000	691	422
5428		\N	\N	ทะนง	66130	696	422
5430		\N	\N	ทุ่งน้อย	66130	696	422
5431		\N	\N	ท่าขมิ้น	66130	696	422
5434		\N	\N	ท่านั่ง	66130	696	422
5429		\N	\N	ท่าบัว	66130	696	422
5432		\N	\N	ท่าเสา	66130	696	422
5427		\N	\N	ท้ายน้ำ	66130	696	422
5433		\N	\N	บางคลาน	66130	696	422
5435		\N	\N	บ้านน้อย	66130	696	422
5436		\N	\N	วัดขวาง	66130	696	422
5426		\N	\N	โพทะเล	66130	696	422
5400		\N	\N	ดงเสือเหลือง	66190	693	422
5402		\N	\N	ทุ่งใหญ่	66190	693	422
5398		\N	\N	วังจิก	66190	693	422
5401		\N	\N	เนินสว่าง	66190	693	422
5396		\N	\N	โพธิ์ประทับช้าง	66190	693	422
5397		\N	\N	ไผ่ท่าโพ	66190	693	422
5399		\N	\N	ไผ่รอบ	66190	693	422
5315		\N	\N	ชาติตระการ	65170	684	421
5319		\N	\N	ท่าสะแก	65170	684	421
5318		\N	\N	บ่อภาค	65170	684	421
5317		\N	\N	บ้านดง	65170	684	421
5314		\N	\N	ป่าแดง	65170	684	421
5316		\N	\N	สวนเมี่ยง	65170	684	421
5308		\N	\N	นครชุม	65120	683	421
5303		\N	\N	นครไทย	65120	683	421
5307		\N	\N	นาบัว	65120	683	421
5309		\N	\N	น้ำกุ่ม	65120	683	421
5311		\N	\N	บ่อโพธิ์	65120	683	421
5312		\N	\N	บ้านพร้าว	65120	683	421
5305		\N	\N	บ้านแยง	65120	683	421
5310		\N	\N	ยางโกลน	65120	683	421
5304		\N	\N	หนองกะท้าว	65120	683	421
5313		\N	\N	ห้วยเฮี้ย	65120	683	421
5306		\N	\N	เนินเพิ่ม	65120	683	421
5335		\N	\N	ท่าตาล	65110	686	421
5337		\N	\N	นครป่าหมาก	65110	686	421
5331		\N	\N	บางกระทุ่ม	65110	686	421
5332		\N	\N	บ้านไร่	65110	686	421
5339		\N	\N	วัดตายม	65210	686	421
5334		\N	\N	สนามคลี	65110	686	421
5338		\N	\N	เนินกุ่ม	65210	686	421
5333		\N	\N	โคกสลุด	65110	686	421
5336		\N	\N	ไผ่ล้อม	65110	686	421
5330		\N	\N	คุยม่วง	65240	685	421
5326		\N	\N	ชุมแสงสงคราม	65240	685	421
5329		\N	\N	ท่านางงาม	65140	685	421
5327		\N	\N	นิคมพัฒนา	65140	685	421
5320		\N	\N	บางระกำ	65140	685	421
5324		\N	\N	บึงกอก	65140	685	421
203		\N	\N	ศีรษะจรเข้น้อย	10540	56	215
204		\N	\N	ศีรษะจรเข้ใหญ่	10540	56	215
182		\N	\N	ตลาด	10130	54	215
194		\N	\N	ทรงคนอง	10130	54	215
192		\N	\N	บางกระสอบ	10130	54	215
193		\N	\N	บางกอบัว	10130	54	215
190		\N	\N	บางกะเจ้า	10130	54	215
185		\N	\N	บางครุ	10130	54	215
184		\N	\N	บางจาก	10130	54	215
191		\N	\N	บางน้ำผึ้ง	10130	54	215
183		\N	\N	บางพึ่ง	10130	54	215
189		\N	\N	บางยอ	10130	54	215
186		\N	\N	บางหญ้าแพรก	10130	54	215
187		\N	\N	บางหัวเสือ	10130	54	215
195		\N	\N	สำโรง	10130	54	215
196		\N	\N	สำโรงกลาง	10130	54	215
188		\N	\N	สำโรงใต้	10130	54	215
197		\N	\N	นาเกลือ	10290	55	215
198		\N	\N	บ้านคลองสวน	10290	55	215
200		\N	\N	ปากคลองบางปลากด	10290	55	215
199		\N	\N	แหลมฟ้าผ่า	10290	55	215
201		\N	\N	ในคลองบางปลากด	10290	55	215
158		\N	\N	ท้ายบ้าน	10280	51	215
166		\N	\N	ท้ายบ้านใหม่	10280	51	215
163		\N	\N	บางด้วน	10270	51	215
162		\N	\N	บางปู	10280	51	215
159		\N	\N	บางปูใหม่	10280	51	215
6003		\N	\N	แคราย	74110	755	246
157		\N	\N	บางเมือง	10270	51	215
164		\N	\N	บางเมืองใหม่	10270	51	215
161		\N	\N	บางโปรง	10270	51	215
155		\N	\N	ปากน้ำ	10270	51	215
156		\N	\N	สำโรงเหนือ	10270	51	215
165		\N	\N	เทพารักษ์	10270	51	215
160		\N	\N	แพรกษา	10280	51	215
167		\N	\N	แพรกษาใหม่	10280	51	215
6028		\N	\N	กระดังงา	75120	758	247
6036		\N	\N	จอมปลวก	75120	758	247
6033		\N	\N	ดอนมะโนรา	75120	758	247
6039		\N	\N	บางกระบือ	75120	758	247
6035		\N	\N	บางกุ้ง	75120	758	247
6032		\N	\N	บางคนที	75120	758	247
6037		\N	\N	บางนกแขวก	75120	758	247
6034		\N	\N	บางพรม	75120	758	247
6030		\N	\N	บางยี่รงค์	75120	758	247
6029		\N	\N	บางสะแก	75120	758	247
6040		\N	\N	บ้านปราโมทย์	75120	758	247
6038		\N	\N	ยายแพง	75120	758	247
6031		\N	\N	โรงหีบ	75120	758	247
6043		\N	\N	ท่าคา	75110	759	247
6046		\N	\N	บางช้าง	75110	759	247
6052		\N	\N	บางนางลี่	75110	759	247
6049		\N	\N	บางแค	75110	759	247
6048		\N	\N	ปลายโพงพาง	75110	759	247
6051		\N	\N	ยี่สาร	75110	759	247
6044		\N	\N	วัดประดู่	75110	759	247
6042		\N	\N	สวนหลวง	75110	759	247
6041		\N	\N	อัมพวา	75110	759	247
6045		\N	\N	เหมืองใหม่	75110	759	247
6047		\N	\N	แควอ้อม	75110	759	247
6050		\N	\N	แพรกหนามแดง	75110	759	247
6024		\N	\N	คลองเขิน	75000	757	247
6025		\N	\N	คลองโคน	75000	757	247
6022		\N	\N	ท้ายหาด	75000	757	247
6026		\N	\N	นางตะเคียน	75000	757	247
6018		\N	\N	บางขันแตก	75000	757	247
6027		\N	\N	บางจะเกร็ง	75000	757	247
6021		\N	\N	บางแก้ว	75000	757	247
6020		\N	\N	บ้านปรก	75000	757	247
6019		\N	\N	ลาดใหญ่	75000	757	247
6017		\N	\N	แม่กลอง	75000	757	247
6023		\N	\N	แหลมใหญ่	75000	757	247
6000		\N	\N	คลองมะเดื่อ	74110	755	246
6002		\N	\N	ดอนไก่ดี	74110	755	246
5995		\N	\N	ตลาดกระทุ่มแบน	74110	755	246
6004		\N	\N	ท่าเสา	74110	755	246
5997		\N	\N	ท่าไม้	74110	755	246
5999		\N	\N	บางยาง	74110	755	246
5998		\N	\N	สวนหลวง	74110	755	246
6001		\N	\N	หนองนกไข่	74110	755	246
5328		\N	\N	บ่อทอง	65140	685	421
5321		\N	\N	ปลักแรด	65140	685	421
5322		\N	\N	พันเสา	65140	685	421
5323		\N	\N	วังอิทก	65140	685	421
5325		\N	\N	หนองกุลา	65140	685	421
5351		\N	\N	ดงประคำ	65180	687	421
5346		\N	\N	ตลุกเทียม	65180	687	421
5350		\N	\N	ทับยายเชียง	65150	687	421
5341		\N	\N	ท่าช้าง	65150	687	421
5340		\N	\N	พรหมพิราม	65150	687	421
5343		\N	\N	มะตูม	65150	687	421
5349		\N	\N	มะต้อง	65180	687	421
5342		\N	\N	วงฆ้อง	65180	687	421
5347		\N	\N	วังวน	65150	687	421
5345		\N	\N	ศรีภิรมย์	65180	687	421
5348		\N	\N	หนองแขม	65150	687	421
5344		\N	\N	หอกลอง	65150	687	421
5367		\N	\N	ชัยนาม	65130	689	421
5368		\N	\N	ดินทอง	65130	689	421
5364		\N	\N	ท่าหมื่นราม	65130	689	421
5361		\N	\N	บ้านกลาง	65220	689	421
5359		\N	\N	พันชาลี	65130	689	421
5358		\N	\N	วังทอง	65130	689	421
5365		\N	\N	วังนกแอ่น	65130	689	421
5362		\N	\N	วังพิกุล	65130	689	421
5366		\N	\N	หนองพระ	65130	689	421
5363		\N	\N	แก่งโสภา	65220	689	421
5360		\N	\N	แม่ระกา	65130	689	421
5357		\N	\N	คันโช้ง	65160	688	421
5353		\N	\N	ท่างาม	65160	688	421
5354		\N	\N	ท้อแท้	65160	688	421
5355		\N	\N	บ้านยาง	65160	688	421
5352		\N	\N	วัดโบสถ์	65160	688	421
5356		\N	\N	หินลาด	65160	688	421
5369		\N	\N	ชมพู	65190	690	421
5373		\N	\N	บ้านน้อยซุ้มขี้เหล็ก	65190	690	421
5370		\N	\N	บ้านมุง	65190	690	421
5375		\N	\N	วังยาง	65190	690	421
5372		\N	\N	วังโพรง	65190	690	421
5374		\N	\N	เนินมะปราง	65190	690	421
5371		\N	\N	ไทรย้อย	65190	690	421
5302		\N	\N	งิ้วงาม	65230	682	421
5294		\N	\N	จอมทอง	65000	682	421
5290		\N	\N	ดอนทอง	65000	682	421
5287		\N	\N	ท่าทอง	65000	682	421
5288		\N	\N	ท่าโพธิ์	65000	682	421
5300		\N	\N	บึงพระ	65000	682	421
5295		\N	\N	บ้านกร่าง	65000	682	421
5296		\N	\N	บ้านคลอง	65000	682	421
5291		\N	\N	บ้านป่า	65000	682	421
5292		\N	\N	ปากโทก	65000	682	421
5297		\N	\N	พลายชุมพล	65000	682	421
5298		\N	\N	มะขามสูง	65000	682	421
5284		\N	\N	วังน้ำคู้	65230	682	421
5285		\N	\N	วัดจันทร์	65000	682	421
5286		\N	\N	วัดพริก	65230	682	421
5289		\N	\N	สมอแข	65000	682	421
5293		\N	\N	หัวรอ	65000	682	421
5299		\N	\N	อรัญญิก	65000	682	421
5283		\N	\N	ในเมือง	65000	682	421
5301		\N	\N	ไผ่ขอดอน	65000	682	421
6459		\N	\N	กมลา	83120	816	516
6457		\N	\N	กะทู้	83120	816	516
6458		\N	\N	ป่าตอง	83150	816	516
6463		\N	\N	ป่าคลอก	83110	817	516
6461		\N	\N	ศรีสุนทร	83110	817	516
6465		\N	\N	สาคู	83110	817	516
6462		\N	\N	เชิงทะเล	83110	817	516
6460		\N	\N	เทพกระษัตรี	83110	817	516
6464		\N	\N	ไม้ขาว	83110	817	516
6456		\N	\N	กะรน	83100	815	516
6454		\N	\N	ฉลอง	83000	815	516
6450		\N	\N	ตลาดเหนือ	83000	815	516
6449		\N	\N	ตลาดใหญ่	83000	815	516
6452		\N	\N	รัษฎา	83000	815	516
6455		\N	\N	ราไวย์	83100	815	516
6453		\N	\N	วิชิต	83000	815	516
6451		\N	\N	เกาะแก้ว	83000	815	516
3387		\N	\N	กุดใส้จ่อ	44150	434	315
3388		\N	\N	ขามเฒ่าพัฒนา	44150	434	315
3384		\N	\N	ขามเรียง	44150	434	315
3380		\N	\N	คันธารราษฎร์	44150	434	315
3382		\N	\N	ท่าขอนยาง	44150	434	315
3383		\N	\N	นาสีนวน	44150	434	315
3381		\N	\N	มะค่า	44150	434	315
3386		\N	\N	ศรีสุข	44150	434	315
3385		\N	\N	เขวาใหญ่	44150	434	315
3379		\N	\N	โคกพระ	44150	434	315
3467		\N	\N	กุดรัง	44130	442	315
3468		\N	\N	นาโพธิ์	44130	442	315
3470		\N	\N	หนองแวง	44130	442	315
3471		\N	\N	ห้วยเตย	44130	442	315
3469		\N	\N	เลิงแฝก	44130	442	315
3473		\N	\N	กุดปลาดุก	44160	443	315
3472		\N	\N	ชื่นชม	44160	443	315
3475		\N	\N	หนองกุง	44160	443	315
3474		\N	\N	เหล่าดอกไม้	44160	443	315
3458		\N	\N	กู่สันตรัตน์	44180	440	315
3455		\N	\N	ดงดวน	44180	440	315
3454		\N	\N	ดงบัง	44180	440	315
3457		\N	\N	ดงยาง	44180	440	315
3451		\N	\N	นาดูน	44180	440	315
3459		\N	\N	พระธาตุ	44180	440	315
3453		\N	\N	หนองคู	44180	440	315
3452		\N	\N	หนองไผ่	44180	440	315
3456		\N	\N	หัวดง	44180	440	315
3412		\N	\N	นาเชือก	44170	437	315
3417		\N	\N	ปอพาน	44170	437	315
3421		\N	\N	สันป่าตอง	44170	437	315
3413		\N	\N	สำโรง	44170	437	315
3420		\N	\N	หนองกุง	44170	437	315
3418		\N	\N	หนองเม็ก	44170	437	315
3419		\N	\N	หนองเรือ	44170	437	315
3414		\N	\N	หนองแดง	44170	437	315
3416		\N	\N	หนองโพธิ์	44170	437	315
3415		\N	\N	เขวาไร่	44170	437	315
3401		\N	\N	กำพี้	44130	436	315
3411		\N	\N	ดอนงัว	44130	436	315
3397		\N	\N	บรบือ	44130	436	315
3405		\N	\N	บัวมาศ	44130	436	315
3398		\N	\N	บ่อใหญ่	44130	436	315
3408		\N	\N	ยาง	44130	436	315
3407		\N	\N	วังใหม่	44130	436	315
3399		\N	\N	วังไชย	44130	436	315
3406		\N	\N	หนองคูขาด	44130	436	315
3404		\N	\N	หนองจิก	44130	436	315
3400		\N	\N	หนองม่วง	44130	436	315
3409		\N	\N	หนองสิม	44130	436	315
3410		\N	\N	หนองโก	44130	436	315
3402		\N	\N	โนนราษี	44130	436	315
3403		\N	\N	โนนแดง	44130	436	315
3423		\N	\N	ก้ามปู	44110	438	315
3426		\N	\N	นาสีนวล	44110	438	315
3422		\N	\N	ปะหลาน	44110	438	315
3435		\N	\N	ภารแอ่น	44110	438	315
3433		\N	\N	ราษฎร์พัฒนา	44110	438	315
3427		\N	\N	ราษฎร์เจริญ	44110	438	315
3430		\N	\N	ลานสะแก	44110	438	315
3432		\N	\N	หนองบัว	44110	438	315
3428		\N	\N	หนองบัวแก้ว	44110	438	315
3429		\N	\N	เมืองเตา	44110	438	315
3434		\N	\N	เมืองเสือ	44110	438	315
3425		\N	\N	เม็กดำ	44110	438	315
3431		\N	\N	เวียงชัย	44110	438	315
3424		\N	\N	เวียงสะอาด	44110	438	315
3465		\N	\N	ขามเรียน	44210	441	315
3464		\N	\N	ดงเมือง	44210	441	315
3461		\N	\N	นาภู	44210	441	315
3463		\N	\N	บ้านกู่	44210	441	315
3460		\N	\N	ยางสีสุราช	44210	441	315
3466		\N	\N	หนองบัวสันตุ	44210	441	315
3462		\N	\N	แวงดง	44210	441	315
3437		\N	\N	ขามป้อม	44120	439	315
3443		\N	\N	งัวบา	44120	439	315
3439		\N	\N	ดงใหญ่	44120	439	315
3444		\N	\N	นาข่า	44120	439	315
3445		\N	\N	บ้านหวาย	44120	439	315
3447		\N	\N	ประชาพัฒนา	44120	439	315
3448		\N	\N	หนองทุ่ม	44120	439	315
3436		\N	\N	หนองแสง	44120	439	315
3449		\N	\N	หนองแสน	44120	439	315
3446		\N	\N	หนองไฮ	44120	439	315
3441		\N	\N	หัวเรือ	44120	439	315
3438		\N	\N	เสือโก้ก	44120	439	315
3442		\N	\N	แคน	44120	439	315
3450		\N	\N	โคกสีทองหลาง	44120	439	315
3440		\N	\N	โพธิ์ชัย	44120	439	315
3392		\N	\N	กู่ทอง	44160	435	315
3391		\N	\N	ดอนเงิน	44160	435	315
3393		\N	\N	นาทอง	44160	435	315
3390		\N	\N	หนองซอน	44160	435	315
3389		\N	\N	เชียงยืน	44160	435	315
3394		\N	\N	เสือเฒ่า	44160	435	315
3396		\N	\N	เหล่าบัวบาน	44160	435	315
3395		\N	\N	โพนทอง	44160	435	315
3348		\N	\N	ดอนหว่าน	44000	431	315
3343		\N	\N	ตลาด	44000	431	315
3345		\N	\N	ท่าตูม	44000	431	315
3351		\N	\N	ท่าสองคอน	44000	431	315
3356		\N	\N	บัวค้อ	44000	431	315
3352		\N	\N	ลาดพัฒนา	44000	431	315
3353		\N	\N	หนองปลิง	44000	431	315
3355		\N	\N	หนองโน	44000	431	315
3354		\N	\N	ห้วยแอ่ง	44000	431	315
3349		\N	\N	เกิ้ง	44000	431	315
3344		\N	\N	เขวา	44000	431	315
3350		\N	\N	แก่งเลิงจาน	44000	431	315
3346		\N	\N	แวงน่าง	44000	431	315
3347		\N	\N	โคกก่อ	44000	431	315
3359		\N	\N	มิตรภาพ	44190	432	315
3358		\N	\N	วังแสง	44190	432	315
3360		\N	\N	หนองกุง	44190	432	315
3357		\N	\N	แกดำ	44190	432	315
3361		\N	\N	โนนภิบาล	44190	432	315
3378		\N	\N	ดอนกลาง	44140	433	315
3374		\N	\N	ยางท่าแจ้ง	44140	433	315
3363		\N	\N	ยางน้อย	44140	433	315
3364		\N	\N	วังยาว	44140	433	315
3376		\N	\N	หนองกุงสวรรค์	44140	433	315
3372		\N	\N	หนองบอน	44140	433	315
3369		\N	\N	หนองบัว	44140	433	315
3368		\N	\N	หนองเหล็ก	44140	433	315
3362		\N	\N	หัวขวาง	44140	433	315
3365		\N	\N	เขวาไร่	44140	433	315
3371		\N	\N	เขื่อน	44140	433	315
3377		\N	\N	เลิงใต้	44140	433	315
3370		\N	\N	เหล่า	44140	433	315
3367		\N	\N	แก้งแก	44140	433	315
3366		\N	\N	แพง	44140	433	315
3375		\N	\N	แห่ใต้	44140	433	315
3373		\N	\N	โพนงาม	44140	433	315
4051		\N	\N	คำชะอี	49110	516	334
4057		\N	\N	คำบก	49110	516	334
4058		\N	\N	น้ำเที่ยง	49110	516	334
4053		\N	\N	บ้านค้อ	49110	516	334
4050		\N	\N	บ้านซ่ง	49110	516	334
4054		\N	\N	บ้านเหล่า	49110	516	334
4052		\N	\N	หนองเอี่ยน	49110	516	334
4056		\N	\N	เหล่าสร้างถ่อ	49110	516	334
4055		\N	\N	โพนงาม	49110	516	334
4046		\N	\N	กกตูม	49140	515	334
4048		\N	\N	ชะโนดน้อย	49140	515	334
4044		\N	\N	ดงหลวง	49140	515	334
4049		\N	\N	พังแดง	49140	515	334
4045		\N	\N	หนองบัว	49140	515	334
4047		\N	\N	หนองแคน	49140	515	334
4037		\N	\N	ดอนตาล	49120	514	334
4042		\N	\N	นาสะเม็ง	49120	514	334
4041		\N	\N	บ้านบาก	49120	514	334
4043		\N	\N	บ้านแก้ง	49120	514	334
4039		\N	\N	ป่าไร่	49120	514	334
4040		\N	\N	เหล่าหมี	49120	514	334
4038		\N	\N	โพธิ์ไทร	49120	514	334
4033		\N	\N	กกแดง	49130	513	334
4031		\N	\N	นากอก	49130	513	334
4034		\N	\N	นาอุดม	49130	513	334
4030		\N	\N	นิคมคำสร้อย	49130	513	334
4036		\N	\N	ร่มเกล้า	49130	513	334
4032		\N	\N	หนองแวง	49130	513	334
4035		\N	\N	โชคชัย	49130	513	334
4067		\N	\N	บ้านเป้า	49160	518	334
4066		\N	\N	ภูวง	49160	518	334
4064		\N	\N	หนองสูง	49160	518	334
4069		\N	\N	หนองสูงเหนือ	49160	518	334
4068		\N	\N	หนองสูงใต้	49160	518	334
4065		\N	\N	โนนยาง	49160	518	334
4062		\N	\N	ชะโนด	49150	517	334
4063		\N	\N	ดงหมู	49150	517	334
4061		\N	\N	บางทรายน้อย	49150	517	334
4060		\N	\N	ป่งขาม	49150	517	334
4059		\N	\N	หว้านใหญ่	49150	517	334
4029		\N	\N	กุดแข้	49000	512	334
4025		\N	\N	คำป่าหลาย	49000	512	334
4026		\N	\N	คำอาฮวน	49000	512	334
4028		\N	\N	ดงมอน	49000	512	334
4027		\N	\N	ดงเย็น	49000	512	334
4024		\N	\N	นาสีนวน	49000	512	334
4023		\N	\N	นาโสก	49000	512	334
4020		\N	\N	บางทรายใหญ่	49000	512	334
4019		\N	\N	บ้านโคก	49000	512	334
4022		\N	\N	ผึ่งแดด	49000	512	334
4017		\N	\N	มุกดาหาร	49000	512	334
4018		\N	\N	ศรีบุญเรือง	49000	512	334
4021		\N	\N	โพนทราย	49000	512	334
7216		\N	\N	กรงปินัง	95000	913	525
7219		\N	\N	ปุโรง	95000	913	525
7217		\N	\N	สะเอะ	95000	913	525
7218		\N	\N	ห้วยกระทิง	95000	913	525
7214		\N	\N	กาบัง	95120	912	525
7215		\N	\N	บาละ	95120	912	525
7190		\N	\N	คีรีเขต	95150	909	525
7187		\N	\N	ธารโต	95150	909	525
7188		\N	\N	บ้านแหร	95150	909	525
7189		\N	\N	แม่หวาด	95170	909	525
7185		\N	\N	ตลิ่งชัน	95130	908	525
7183		\N	\N	ตาเนาะปูเต๊ะ	95130	908	525
7184		\N	\N	ถ้ำทะลุ	95130	908	525
7181		\N	\N	บันนังสตา	95130	908	525
7182		\N	\N	บาเจาะ	95130	908	525
7186		\N	\N	เขื่อนบางลาง	95130	908	525
7197		\N	\N	กาตอง	95120	910	525
7195		\N	\N	ตาชี	95120	910	525
7196		\N	\N	บาโงยซิแน	95120	910	525
7194		\N	\N	บาโร๊ะ	95120	910	525
7193		\N	\N	ปะแต	95120	910	525
7191		\N	\N	ยะหา	95120	910	525
7192		\N	\N	ละแอ	95120	910	525
7201		\N	\N	กอตอตือร๊ะ	95140	911	525
7198		\N	\N	กายูบอเกาะ	95140	911	525
7200		\N	\N	กาลอ	95140	911	525
7199		\N	\N	กาลูปัง	95140	911	525
7204		\N	\N	จะกว๊ะ	95140	911	525
7213		\N	\N	ตะโล๊ะหะลอ	95140	911	525
7205		\N	\N	ท่าธง	95140	911	525
7207		\N	\N	บาลอ	95140	911	525
7208		\N	\N	บาโงย	95140	911	525
7209		\N	\N	บือมัง	95140	911	525
7210		\N	\N	ยะต๊ะ	95140	911	525
7211		\N	\N	วังพญา	95140	911	525
7212		\N	\N	อาซ่อง	95140	911	525
7203		\N	\N	เกะรอ	95140	911	525
7206		\N	\N	เนินงาม	95140	911	525
7202		\N	\N	โกตาบารู	95140	911	525
7178		\N	\N	ตาเนาะแมเราะ	95110	907	525
7180		\N	\N	ธารน้ำทิพย์	95110	907	525
7177		\N	\N	ยะรม	95110	907	525
7179		\N	\N	อัยเยอร์เวง	95110	907	525
7176		\N	\N	เบตง	95110	907	525
7175		\N	\N	ตาเซะ	95000	906	525
7167		\N	\N	ท่าสาป	95000	906	525
7173		\N	\N	บันนังสาเรง	95000	906	525
7163		\N	\N	บุดี	95000	906	525
7172		\N	\N	พร่อน	95160	906	525
7166		\N	\N	ยะลา	95000	906	525
7164		\N	\N	ยุโป	95000	906	525
7170		\N	\N	ลำพะยา	95160	906	525
7168		\N	\N	ลำใหม่	95160	906	525
7165		\N	\N	ลิดล	95160	906	525
7162		\N	\N	สะเตง	95000	906	525
7174		\N	\N	สะเตงนอก	95000	906	525
7169		\N	\N	หน้าถ้ำ	95000	906	525
7171		\N	\N	เปาะเส้ง	95000	906	525
2498		\N	\N	กำแมด	35140	319	332
2496		\N	\N	กุดชุม	35140	319	332
2503		\N	\N	คำน้ำสร้าง	35140	319	332
2499		\N	\N	นาโส่	35140	319	332
2501		\N	\N	หนองหมี	35140	319	332
2504		\N	\N	หนองแหน	35140	319	332
2500		\N	\N	ห้วยแก้ง	35140	319	332
2497		\N	\N	โนนเปือย	35140	319	332
2502		\N	\N	โพนงาม	35140	319	332
2514		\N	\N	กุดกุง	35110	320	332
2512		\N	\N	กู่จาน	35110	320	332
2517		\N	\N	ดงเจริญ	35110	320	332
2511		\N	\N	ดงแคนใหญ่	35180	320	332
2509		\N	\N	ทุ่งมน	35110	320	332
2510		\N	\N	นาคำ	35180	320	332
2513		\N	\N	นาแก	35180	320	332
2506		\N	\N	ย่อ	35110	320	332
2505		\N	\N	ลุมพุก	35110	320	332
2507		\N	\N	สงเปือย	35110	320	332
2515		\N	\N	เหล่าไฮ	35110	320	332
2516		\N	\N	แคนน้อย	35180	320	332
2508		\N	\N	โพนทัน	35110	320	332
2534		\N	\N	กุดน้ำใส	35160	323	332
2536		\N	\N	ค้อวัง	35160	323	332
2535		\N	\N	น้ำอ้อม	35160	323	332
2533		\N	\N	ฟ้าห่วน	35160	323	332
2493		\N	\N	ดงมะไฟ	35170	318	332
2492		\N	\N	ดู่ลาด	35170	318	332
2491		\N	\N	ทรายมูล	35170	318	332
2494		\N	\N	นาเวียง	35170	318	332
2495		\N	\N	ไผ่	35170	318	332
2519		\N	\N	กระจาย	35150	321	332
2522		\N	\N	ศรีฐาน	35150	321	332
2521		\N	\N	เชียงเพ็ง	35150	321	332
2520		\N	\N	โคกนาโก	35150	321	332
2518		\N	\N	โพธิ์ไทร	35150	321	332
2525		\N	\N	คูเมือง	35130	322	332
2527		\N	\N	บากเรือ	35130	322	332
2530		\N	\N	บึงแก	35130	322	332
2526		\N	\N	ผือฮี	35130	322	332
2531		\N	\N	พระเสาร์	35130	322	332
2523		\N	\N	ฟ้าหยาด	35130	322	332
2528		\N	\N	ม่วง	35130	322	332
2532		\N	\N	สงยาง	35130	322	332
2524		\N	\N	หัวเมือง	35130	322	332
2529		\N	\N	โนนทราย	35130	322	332
2480		\N	\N	ขั้นไดใหญ่	35000	317	332
2487		\N	\N	ขุมเงิน	35000	317	332
2477		\N	\N	ค้อเหนือ	35000	317	332
2478		\N	\N	ดู่ทุ่ง	35000	317	332
2475		\N	\N	ตาดทอง	35000	317	332
2488		\N	\N	ทุ่งนางโอก	35000	317	332
2481		\N	\N	ทุ่งแต้	35000	317	332
2483		\N	\N	นาสะไมย์	35000	317	332
2474		\N	\N	น้ำคำใหญ่	35000	317	332
2476		\N	\N	สำราญ	35000	317	332
2482		\N	\N	สิงห์	35000	317	332
2486		\N	\N	หนองคู	35000	317	332
2485		\N	\N	หนองหิน	35000	317	332
2490		\N	\N	หนองเป็ด	35000	317	332
2489		\N	\N	หนองเรือ	35000	317	332
2484		\N	\N	เขื่องคำ	35000	317	332
2479		\N	\N	เดิด	35000	317	332
2473		\N	\N	ในเมือง	35000	317	332
2541		\N	\N	กุดเชียงหมี	35120	324	332
2543		\N	\N	กุดแห่	35120	324	332
2537		\N	\N	บุ่งค้า	35120	324	332
2546		\N	\N	ศรีแก้ว	35120	324	332
2545		\N	\N	สร้างมิ่ง	35120	324	332
2538		\N	\N	สวาท	35120	324	332
2540		\N	\N	สามัคคี	35120	324	332
2542		\N	\N	สามแยก	35120	324	332
2539		\N	\N	ห้องแซง	35120	324	332
2544		\N	\N	โคกสำราญ	35120	324	332
2550		\N	\N	คำเตย	35120	325	332
2551		\N	\N	คำไผ่	35120	325	332
2548		\N	\N	น้ำคำ	35120	325	332
2549		\N	\N	ส้มผ่อ	35120	325	332
2547		\N	\N	ไทยเจริญ	35120	325	332
6621		\N	\N	จ.ป.ร.	85110	840	514
6616		\N	\N	น้ำจืด	85110	840	514
6617		\N	\N	น้ำจืดน้อย	85110	840	514
6622		\N	\N	บางใหญ่	85110	840	514
6619		\N	\N	ปากจั่น	85110	840	514
6618		\N	\N	มะมุ	85110	840	514
6620		\N	\N	ลำเลียง	85110	840	514
6612		\N	\N	กะเปอร์	85120	839	514
6615		\N	\N	บางหิน	85120	839	514
6614		\N	\N	บ้านนา	85120	839	514
6611		\N	\N	ม่วงกลวง	85120	839	514
6613		\N	\N	เชี่ยวเหลียง	85120	839	514
6609		\N	\N	บางพระเหนือ	85130	838	514
6608		\N	\N	บางพระใต้	85130	838	514
6610		\N	\N	บางแก้ว	85130	838	514
6607		\N	\N	ละอุ่นเหนือ	85130	838	514
6606		\N	\N	ละอุ่นใต้	85130	838	514
7477		\N	\N	ในวงเหนือ	85130	838	514
7478		\N	\N	ในวงใต้	85130	838	514
6624		\N	\N	กำพวน	85120	841	514
6623		\N	\N	นาคา	85120	841	514
6604		\N	\N	ทรายแดง	85130	837	514
6602		\N	\N	บางนอน	85000	837	514
6600		\N	\N	บางริ้น	85000	837	514
6601		\N	\N	ปากน้ำ	85000	837	514
6598		\N	\N	ราชกรูด	85000	837	514
6599		\N	\N	หงาว	85000	837	514
6603		\N	\N	หาดส้มแป้น	85000	837	514
6605		\N	\N	เกาะพยาม	85000	837	514
6597		\N	\N	เขานิเวศน์	85000	837	514
1051		\N	\N	นิคมพัฒนา	21180	149	236
1053		\N	\N	พนานิคม	21180	149	236
1054		\N	\N	มะขามคู่	21180	149	236
1052		\N	\N	มาบข่า	21180	149	236
1040		\N	\N	ชากบก	21120	146	236
1037		\N	\N	ตาขัน	21120	146	236
1038		\N	\N	บางบุตร	21120	146	236
1034		\N	\N	บ้านค่าย	21120	146	236
1036		\N	\N	หนองตะพาน	21120	146	236
1039		\N	\N	หนองบัว	21120	146	236
1035		\N	\N	หนองละลอก	21120	146	236
1014		\N	\N	บ้านฉาง	21130	143	236
1013		\N	\N	พลา	21130	143	236
1012		\N	\N	สำนักท้อน	21130	143	236
1042		\N	\N	ตาสิทธิ์	21140	147	236
1041		\N	\N	ปลวกแดง	21140	147	236
1045		\N	\N	มาบยางพร	21140	147	236
1043		\N	\N	ละหาร	21140	147	236
1046		\N	\N	หนองไร่	21140	147	236
1044		\N	\N	แม่น้ำคู้	21140	147	236
1031		\N	\N	ชุมแสง	21210	145	236
1032		\N	\N	ป่ายุบใน	21210	145	236
1033		\N	\N	พลงตาเอี่ยม	21210	145	236
1030		\N	\N	วังจันทร์	21210	145	236
1049		\N	\N	ชำฆ้อ	21110	148	236
1047		\N	\N	น้ำเป็น	21110	148	236
1048		\N	\N	ห้วยทับมอญ	21110	148	236
1050		\N	\N	เขาน้อย	21110	148	236
1006		\N	\N	กะเฉด	21100	142	236
1000		\N	\N	ตะพง	21000	142	236
1007		\N	\N	ทับมา	21000	142	236
998		\N	\N	ท่าประดู่	21000	142	236
1004		\N	\N	นาตาขวัญ	21000	142	236
1008		\N	\N	น้ำคอก	21000	142	236
1003		\N	\N	บ้านแลง	21000	142	236
7323		\N	\N	ปากน้ำ	21000	142	236
1010		\N	\N	มาบตาพุด	21150	142	236
1011		\N	\N	สำนักทอง	21100	142	236
1009		\N	\N	ห้วยโป่ง	21150	142	236
999		\N	\N	เชิงเนิน	21000	142	236
1005		\N	\N	เนินพระ	21000	142	236
1001		\N	\N	เพ	21160	142	236
1002		\N	\N	แกลง	21160	142	236
1021		\N	\N	กระแสบน	21110	144	236
1019		\N	\N	กร่ำ	21190	144	236
1024		\N	\N	กองดิน	22160	144	236
1025		\N	\N	คลองปูน	21170	144	236
1020		\N	\N	ชากพง	21190	144	236
1017		\N	\N	ชากโดน	21110	144	236
1015		\N	\N	ทางเกวียน	21110	144	236
1023		\N	\N	ทุ่งควายกิน	21110	144	236
1022		\N	\N	บ้านนา	21110	144	236
1027		\N	\N	ปากน้ำกระแส	21170	144	236
1026		\N	\N	พังราด	21170	144	236
1016		\N	\N	วังหว้า	21110	144	236
1029		\N	\N	สองสลึง	21110	144	236
1028		\N	\N	ห้วยยาง	21110	144	236
1018		\N	\N	เนินฆ้อ	21110	144	236
5596		\N	\N	จอมบึง	70150	715	241
5599		\N	\N	ด่านทับตะโก	70150	715	241
5597		\N	\N	ปากช่อง	70150	715	241
5601		\N	\N	รางบัว	70150	715	241
5598		\N	\N	เบิกไพร	70150	715	241
5600		\N	\N	แก้มอ้น	70150	715	241
5617		\N	\N	ขุนพิทักษ์	70130	717	241
5610		\N	\N	ดอนกรวย	70130	717	241
5611		\N	\N	ดอนคลัง	70130	717	241
5618		\N	\N	ดอนไผ่	70130	717	241
5606		\N	\N	ดำเนินสะดวก	70130	717	241
5609		\N	\N	ตาหลวง	70130	717	241
5616		\N	\N	ท่านัด	70130	717	241
5612		\N	\N	บัวงาม	70210	717	241
5613		\N	\N	บ้านไร่	70130	717	241
5607		\N	\N	ประสาทสิทธิ์	70210	717	241
5608		\N	\N	ศรีสุราษฎร์	70130	717	241
5615		\N	\N	สี่หมื่น	70130	717	241
5614		\N	\N	แพงพวย	70130	717	241
5638		\N	\N	ดอนคา	70160	719	241
5637		\N	\N	ดอนใหญ่	70160	719	241
5633		\N	\N	บางแพ	70160	719	241
5634		\N	\N	วังเย็น	70160	719	241
5636		\N	\N	วัดแก้ว	70160	719	241
5635		\N	\N	หัวโพ	70160	719	241
5639		\N	\N	โพหัก	70160	719	241
5673		\N	\N	บ้านคา	70180	723	241
5674		\N	\N	บ้านบึง	70180	723	241
5675		\N	\N	หนองพันจันทร์	70180	723	241
5621		\N	\N	กรับใหญ่	70190	718	241
5628		\N	\N	คุ้งพยอม	70110	718	241
5624		\N	\N	ดอนกระเบื้อง	70110	718	241
5620		\N	\N	ท่าผา	70110	718	241
5626		\N	\N	นครชุมน์	70110	718	241
5627		\N	\N	บ้านม่วง	70110	718	241
5619		\N	\N	บ้านโป่ง	70110	718	241
7324		\N	\N	ปากแรต	70110	718	241
5632		\N	\N	ลาดบัวขาว	70110	718	241
5625		\N	\N	สวนกล้วย	70110	718	241
5622		\N	\N	หนองกบ	70110	718	241
5629		\N	\N	หนองปลาหมอ	70110	718	241
5623		\N	\N	หนองอ้อ	70110	718	241
5630		\N	\N	เขาขลุง	70110	718	241
5631		\N	\N	เบิกไพร	70110	718	241
5660		\N	\N	ดอนทราย	70140	721	241
5658		\N	\N	ทุ่งหลวง	70140	721	241
5666		\N	\N	บ่อกระดาน	70140	721	241
5662		\N	\N	ปากท่อ	70140	721	241
5663		\N	\N	ป่าไก่	70140	721	241
5667		\N	\N	ยางหัก	70140	721	241
5659		\N	\N	วังมะนาว	70140	721	241
5664		\N	\N	วัดยางงาม	70140	721	241
5668		\N	\N	วันดาว	70140	721	241
5661		\N	\N	หนองกระทุ่ม	70140	721	241
5669		\N	\N	ห้วยยางโทน	70140	721	241
5665		\N	\N	อ่างหิน	70140	721	241
5671		\N	\N	จอมประทัด	70170	722	241
5672		\N	\N	วัดเพลง	70170	722	241
5670		\N	\N	เกาะศาลพระ	70170	722	241
5605		\N	\N	ตะนาวศรี	70180	716	241
5604		\N	\N	ท่าเคย	70180	716	241
5603		\N	\N	ป่าหวาย	70180	716	241
5602		\N	\N	สวนผึ้ง	70180	716	241
5580		\N	\N	คุ้งกระถิน	70000	714	241
5579		\N	\N	คุ้งน้ำวน	70000	714	241
5593		\N	\N	คูบัว	70000	714	241
5576		\N	\N	ดอนตะโก	70000	714	241
5586		\N	\N	ดอนแร่	70000	714	241
5594		\N	\N	ท่าราบ	70000	714	241
5585		\N	\N	น้ำพุ	70000	714	241
5591		\N	\N	บางป่า	70000	714	241
5595		\N	\N	บ้านไร่	70000	714	241
5592		\N	\N	พงสวาย	70000	714	241
5584		\N	\N	พิกุลทอง	70000	714	241
5583		\N	\N	สามเรือน	70000	714	241
5577		\N	\N	หนองกลางนา	70000	714	241
5574		\N	\N	หน้าเมือง	70000	714	241
5590		\N	\N	หลุมดิน	70000	714	241
5587		\N	\N	หินกอง	70000	714	241
5578		\N	\N	ห้วยไผ่	70000	714	241
5581		\N	\N	อ่างทอง	70000	714	241
5589		\N	\N	เกาะพลับพลา	70000	714	241
5588		\N	\N	เขาแร้ง	70000	714	241
5575		\N	\N	เจดีย์หัก	70000	714	241
5582		\N	\N	โคกหม้อ	70000	714	241
5648		\N	\N	คลองข่อย	70120	720	241
7457		\N	\N	คลองตาคต	70120	720	241
5649		\N	\N	ชำแระ	70120	720	241
5641		\N	\N	ดอนกระเบื้อง	70120	720	241
5646		\N	\N	ดอนทราย	70120	720	241
5651		\N	\N	ท่าชุมพล	70120	720	241
5655		\N	\N	ธรรมเสน	70120	720	241
5654		\N	\N	นางแก้ว	70120	720	241
5652		\N	\N	บางโตนด	70120	720	241
5644		\N	\N	บ้านฆ้อง	70120	720	241
5645		\N	\N	บ้านสิงห์	70120	720	241
5643		\N	\N	บ้านเลือก	70120	720	241
5650		\N	\N	สร้อยฟ้า	70120	720	241
5657		\N	\N	หนองกวาง	70120	720	241
5642		\N	\N	หนองโพ	70120	720	241
5656		\N	\N	เขาชะงุ้ม	70120	720	241
5647		\N	\N	เจ็ดเสมียน	70120	720	241
5653		\N	\N	เตาปูน	70120	720	241
5640		\N	\N	โพธาราม	70120	720	241
3518		\N	\N	ดงกลาง	45180	447	335
3517		\N	\N	ดงแดง	45180	447	335
3522		\N	\N	ดู่น้อย	45180	447	335
3516		\N	\N	น้ำใส	45180	447	335
3519		\N	\N	ป่าสังข์	45180	447	335
3521		\N	\N	ลิ้นฟ้า	45180	447	335
3523		\N	\N	ศรีโคตร	45180	447	335
3513		\N	\N	หนองผือ	45180	447	335
3512		\N	\N	หัวช้าง	45180	447	335
3520		\N	\N	อีง่อง	45180	447	335
3514		\N	\N	เมืองหงส์	45180	447	335
3515		\N	\N	โคกล่าม	45180	447	335
3649		\N	\N	จังหาร	45000	460	335
3650		\N	\N	ดงสิงห์	45000	460	335
3646		\N	\N	ดินดำ	45000	460	335
3647		\N	\N	ปาฝา	45000	460	335
3652		\N	\N	ผักแว่น	45000	460	335
3648		\N	\N	ม่วงลาด	45000	460	335
3651		\N	\N	ยางใหญ่	45000	460	335
3653		\N	\N	แสนชาติ	45000	460	335
3664		\N	\N	ทุ่งเขาหลวง	45170	463	335
3666		\N	\N	บึงงาม	45170	463	335
3667		\N	\N	มะบ้า	45170	463	335
3665		\N	\N	เทอดไทย	45170	463	335
3668		\N	\N	เหล่า	45170	463	335
3525		\N	\N	ธงธานี	45170	448	335
3527		\N	\N	ธวัชบุรี	45170	448	335
3524		\N	\N	นิเวศน์	45170	448	335
3533		\N	\N	บึงนคร	45170	448	335
3529		\N	\N	มะอึ	45170	448	335
3534		\N	\N	ราชธานี	45170	448	335
3535		\N	\N	หนองพอก	45170	448	335
3526		\N	\N	หนองไผ่	45170	448	335
3528		\N	\N	อุ่มเม้า	45170	448	335
3530		\N	\N	เขวาทุ่ง	45170	448	335
3532		\N	\N	เมืองน้อย	45170	448	335
3531		\N	\N	ไพศาล	45170	448	335
3511		\N	\N	ขี้เหล็ก	45190	446	335
3505		\N	\N	ดอกล้ำ	45190	446	335
3504		\N	\N	บัวแดง	45190	446	335
3509		\N	\N	สระบัว	45190	446	335
3506		\N	\N	หนองแคน	45190	446	335
3510		\N	\N	โนนสง่า	45190	446	335
3508		\N	\N	โนนสวรรค์	45190	446	335
3507		\N	\N	โพนสูง	45190	446	335
3538		\N	\N	กุดน้ำใส	45140	449	335
3545		\N	\N	คำไฮ	45140	449	335
3547		\N	\N	ค้อใหญ่	45140	449	335
3548		\N	\N	ชานุวรรณ	45140	449	335
3544		\N	\N	นานวล	45140	449	335
3536		\N	\N	พนมไพร	45140	449	335
3541		\N	\N	วารีสวัสดิ์	45140	449	335
3546		\N	\N	สระแก้ว	45140	449	335
3539		\N	\N	หนองทัพไทย	45140	449	335
3537		\N	\N	แสนสุข	45140	449	335
3542		\N	\N	โคกสว่าง	45140	449	335
3543		\N	\N	โพธิ์ชัย	45140	449	335
3540		\N	\N	โพธิ์ใหญ่	45140	449	335
3645		\N	\N	บ้านบาก	45000	459	335
3639		\N	\N	ศรีสมเด็จ	45000	459	335
3642		\N	\N	สวนจิก	45280	459	335
3644		\N	\N	หนองแวงควง	45000	459	335
3641		\N	\N	หนองใหญ่	45000	459	335
3640		\N	\N	เมืองเปลือย	45000	459	335
3638		\N	\N	โพธิ์ทอง	45000	459	335
3643		\N	\N	โพธิ์สัย	45280	459	335
3613		\N	\N	จำปาขัน	45130	454	335
3610		\N	\N	ช้างเผือก	45130	454	335
3600		\N	\N	ดอกไม้	45130	454	335
3611		\N	\N	ทุ่งกุลา	45130	454	335
3612		\N	\N	ทุ่งศรีเมือง	45130	454	335
3606		\N	\N	ทุ่งหลวง	45130	454	335
3601		\N	\N	นาใหญ่	45130	454	335
3608		\N	\N	น้ำคำ	45130	454	335
3605		\N	\N	บ่อพันขัน	45130	454	335
3599		\N	\N	สระคู	45130	454	335
3607		\N	\N	หัวช้าง	45130	454	335
3604		\N	\N	หัวโทน	45130	454	335
3602		\N	\N	หินกอง	45130	454	335
3609		\N	\N	ห้วยหินลาด	45130	454	335
645		\N	\N	ท่ามะนาว	15130	96	222
3603		\N	\N	เมืองทุ่ง	45130	454	335
3575		\N	\N	กกโพธิ์	45210	452	335
3580		\N	\N	ท่าสีดา	45210	452	335
3573		\N	\N	บึงงาม	45210	452	335
3579		\N	\N	ผาน้ำย้อย	45210	452	335
3574		\N	\N	ภูเขาทอง	45210	452	335
3578		\N	\N	รอบเมือง	45210	452	335
3577		\N	\N	หนองขุ่นใหญ่	45210	452	335
3572		\N	\N	หนองพอก	45210	452	335
3576		\N	\N	โคกสว่าง	45210	452	335
3662		\N	\N	ดูกอึ่ง	45140	462	335
3661		\N	\N	สาวแห	45140	462	335
3660		\N	\N	หนองฮี	45140	462	335
3663		\N	\N	เด่นราษฎร์	45140	462	335
3632		\N	\N	ขี้เหล็ก	45160	457	335
3633		\N	\N	บ้านดู่	45160	457	335
3626		\N	\N	บ้านแจ้ง	45160	457	335
3629		\N	\N	หนองขาม	45160	457	335
3631		\N	\N	หนองบัว	45160	457	335
3628		\N	\N	หนองหมื่นถ่าน	45160	457	335
3627		\N	\N	หน่อม	45160	457	335
3624		\N	\N	อาจสามารถ	45160	457	335
3625		\N	\N	โพนเมือง	45160	457	335
3630		\N	\N	โหรา	45160	457	335
3498		\N	\N	กำแพง	45150	445	335
3499		\N	\N	กู่กาสิงห์	45150	445	335
3503		\N	\N	ดงครั่งน้อย	45150	445	335
3495		\N	\N	ดงครั่งใหญ่	45150	445	335
3502		\N	\N	ทุ่งทอง	45150	445	335
3500		\N	\N	น้ำอ้อม	45150	445	335
3496		\N	\N	บ้านฝาง	45150	445	335
3494		\N	\N	สิงห์โคก	45150	445	335
3497		\N	\N	หนองแวง	45150	445	335
3491		\N	\N	เกษตรวิสัย	45150	445	335
3492		\N	\N	เมืองบัว	45150	445	335
3493		\N	\N	เหล่าหลวง	45150	445	335
3501		\N	\N	โนนสว่าง	45150	445	335
3659		\N	\N	บ้านเขือง	45000	461	335
3656		\N	\N	พระธาตุ	45000	461	335
3657		\N	\N	พระเจ้า	45000	461	335
3655		\N	\N	พลับพลา	45170	461	335
3658		\N	\N	หมูม้น	45170	461	335
3654		\N	\N	เชียงขวัญ	45000	461	335
3637		\N	\N	ชมสะอาด	45250	458	335
3635		\N	\N	ชุมพร	45250	458	335
3636		\N	\N	บุ่งเลิศ	45250	458	335
3634		\N	\N	เมยวดี	45250	458	335
3479		\N	\N	ขอนแก่น	45000	444	335
3487		\N	\N	ดงลาน	45000	444	335
3480		\N	\N	นาโพธิ์	45000	444	335
3483		\N	\N	ปอภาร	45000	444	335
3477		\N	\N	รอบเมือง	45000	444	335
3481		\N	\N	สะอาดสมบูรณ์	45000	444	335
3482		\N	\N	สีแก้ว	45000	444	335
3485		\N	\N	หนองแก้ว	45000	444	335
3486		\N	\N	หนองแวง	45000	444	335
3490		\N	\N	เมืองทอง	45000	444	335
3478		\N	\N	เหนือเมือง	45000	444	335
3488		\N	\N	แคนใหญ่	45000	444	335
3489		\N	\N	โนนตาล	45000	444	335
3484		\N	\N	โนนรัง	45000	444	335
3476		\N	\N	ในเมือง	45000	444	335
3617		\N	\N	กกกุง	45220	455	335
3616		\N	\N	คูเมือง	45220	455	335
3614		\N	\N	หนองผือ	45220	455	335
3615		\N	\N	หนองหิน	45220	455	335
3618		\N	\N	เมืองสรวง	45220	455	335
3581		\N	\N	กลาง	45120	453	335
3597		\N	\N	ขวัญเมือง	45120	453	335
3588		\N	\N	ขวาว	45120	453	335
3587		\N	\N	ท่าม่วง	45120	453	335
3582		\N	\N	นางาม	45120	453	335
3585		\N	\N	นาเมือง	45120	453	335
3592		\N	\N	นาเลิง	45120	453	335
3584		\N	\N	นาแซง	45120	453	335
3598		\N	\N	บึงเกลือ	45120	453	335
3596		\N	\N	พรสวรรค์	45120	453	335
3590		\N	\N	ภูเงิน	45120	453	335
3586		\N	\N	วังหลวง	45120	453	335
3594		\N	\N	ศรีวิลัย	45120	453	335
3595		\N	\N	หนองหลวง	45120	453	335
3591		\N	\N	เกาะแก้ว	45120	453	335
3583		\N	\N	เมืองไพร	45120	453	335
3593		\N	\N	เหล่าน้อย	45120	453	335
3589		\N	\N	โพธิ์ทอง	45120	453	335
3563		\N	\N	ขามเปี้ย	45230	451	335
3568		\N	\N	คำพอุง	45230	451	335
3570		\N	\N	ดอนโอง	45230	451	335
3565		\N	\N	บัวคำ	45230	451	335
3567		\N	\N	สะอาด	45230	451	335
3569		\N	\N	หนองตาไก้	45230	451	335
3566		\N	\N	อัคคะคำ	45230	451	335
3564		\N	\N	เชียงใหม่	45230	451	335
3571		\N	\N	โพธิ์ศรี	45230	451	335
3623		\N	\N	ท่าหาดยาว	45240	456	335
3622		\N	\N	ยางคำ	45240	456	335
3621		\N	\N	ศรีสว่าง	45240	456	335
3620		\N	\N	สามขา	45240	456	335
3619		\N	\N	โพนทราย	45240	456	335
3558		\N	\N	คำนาดี	45110	450	335
3551		\N	\N	นาอุดม	45110	450	335
3559		\N	\N	พรมสวรรค์	45110	450	335
3561		\N	\N	วังสามัคคี	45110	450	335
3560		\N	\N	สระนกแก้ว	45110	450	335
3552		\N	\N	สว่าง	45110	450	335
3553		\N	\N	หนองใหญ่	45110	450	335
3557		\N	\N	อุ่มเม่า	45110	450	335
3549		\N	\N	แวง	45110	450	335
3550		\N	\N	โคกกกม่วง	45110	450	335
3562		\N	\N	โคกสูง	45110	450	335
3555		\N	\N	โนนชัยศรี	45110	450	335
3554		\N	\N	โพธิ์ทอง	45110	450	335
3556		\N	\N	โพธิ์ศรีสว่าง	45110	450	335
634		\N	\N	ชัยนารายณ์	15130	96	222
647		\N	\N	ชัยบาดาล	15230	96	222
641		\N	\N	ซับตะเคียน	15130	96	222
639		\N	\N	ท่าดินดำ	15130	96	222
642		\N	\N	นาโสม	15190	96	222
646		\N	\N	นิคมลำนารายณ์	15130	96	222
638		\N	\N	บัวชุม	15130	96	222
648		\N	\N	บ้านใหม่สามัคคี	15130	96	222
640		\N	\N	มะกอกหวาน	15230	96	222
637		\N	\N	ม่วงค่อม	15230	96	222
633		\N	\N	ลำนารายณ์	15130	96	222
635		\N	\N	ศิลาทิพย์	15130	96	222
643		\N	\N	หนองยายโต๊ะ	15130	96	222
636		\N	\N	ห้วยหิน	15130	96	222
644		\N	\N	เกาะรัง	15130	96	222
7325		\N	\N	เขาแหลม	15130	96	222
649		\N	\N	ท่าวุ้ง	15150	97	222
650		\N	\N	บางคู้	15150	97	222
653		\N	\N	บางงา	15150	97	222
652		\N	\N	บางลี่	15150	97	222
658		\N	\N	บ้านเบิก	15150	97	222
659		\N	\N	มุจลินท์	15150	97	222
657		\N	\N	ลาดสาลี่	15150	97	222
656		\N	\N	หัวสำโรง	15150	97	222
655		\N	\N	เขาสมอคอน	15180	97	222
654		\N	\N	โคกสลุด	15150	97	222
651		\N	\N	โพตลาดแก้ว	15150	97	222
683		\N	\N	ซับจำปา	15230	99	222
685		\N	\N	ทะเลวังวัด	15230	99	222
681		\N	\N	ท่าหลวง	15230	99	222
684		\N	\N	หนองผักแว่น	15230	99	222
686		\N	\N	หัวลำ	15230	99	222
682		\N	\N	แก่งผักกูด	15230	99	222
674		\N	\N	ชอนม่วง	15110	98	222
663		\N	\N	ดงพลับ	15110	98	222
673		\N	\N	ดอนดึง	15110	98	222
669		\N	\N	บางกะพี้	15110	98	222
672		\N	\N	บางขาม	15180	98	222
667		\N	\N	บางพึ่ง	15110	98	222
662		\N	\N	บ้านกล้วย	15110	98	222
664		\N	\N	บ้านชี	15180	98	222
661		\N	\N	บ้านทราย	15110	98	222
7326		\N	\N	บ้านหมี่	15110	98	222
665		\N	\N	พุคา	15110	98	222
677		\N	\N	มหาสอน	15110	98	222
680		\N	\N	สนามแจง	15110	98	222
676		\N	\N	สายห้วยแก้ว	15110	98	222
675		\N	\N	หนองกระเบียน	15110	98	222
668		\N	\N	หนองทรายขาว	15110	98	222
670		\N	\N	หนองเต่า	15110	98	222
679		\N	\N	หนองเมือง	15110	98	222
666		\N	\N	หินปัก	15110	98	222
678		\N	\N	เชียงงา	15110	98	222
671		\N	\N	โพนทอง	15110	98	222
660		\N	\N	ไผ่ใหญ่	15110	98	222
7327		\N	\N	ชอนน้อย	15140	94	222
613		\N	\N	ช่องสาริกา	15220	94	222
615		\N	\N	ดีลัง	15220	94	222
619		\N	\N	น้ำสุด	15140	94	222
612		\N	\N	พัฒนานิคม	15140	94	222
614		\N	\N	มะนาวหวาน	15140	94	222
617		\N	\N	หนองบัว	15140	94	222
618		\N	\N	ห้วยขุนราม	18220	94	222
616		\N	\N	โคกสลุง	15140	94	222
700		\N	\N	กุดตาเพชร	15190	102	222
698		\N	\N	ซับสมบูรณ์	15190	102	222
697		\N	\N	ลำสนธิ	15190	102	222
699		\N	\N	หนองรี	15190	102	222
7328		\N	\N	เขาน้อย	15130	102	222
701		\N	\N	เขารวก	15190	102	222
689		\N	\N	ทุ่งท่าช้าง	15240	100	222
691		\N	\N	นิยมชัย	15240	100	222
688		\N	\N	มหาโพธิ	15240	100	222
687		\N	\N	สระโบสถ์	15240	100	222
690		\N	\N	ห้วยใหญ่	15240	100	222
705		\N	\N	ชอนสมบูรณ์	15170	103	222
707		\N	\N	ชอนสารเดช	15170	103	222
704		\N	\N	ดงดินแดง	15170	103	222
703		\N	\N	บ่อทอง	15170	103	222
706		\N	\N	ยางโทน	15170	103	222
702		\N	\N	หนองม่วง	15170	103	222
591		\N	\N	กกโก	15000	93	222
598		\N	\N	งิ้วราย	15000	93	222
7329		\N	\N	ดอนโพธิ์	15000	93	222
599		\N	\N	ตะลุง	15000	93	222
611		\N	\N	ถนนใหญ่	15000	93	222
590		\N	\N	ทะเลชุบศร	15000	93	222
601		\N	\N	ท่าศาลา	15000	93	222
7330		\N	\N	ท่าหิน	15000	93	222
600		\N	\N	ท่าแค	15000	93	222
605		\N	\N	ท้ายตลาด	15000	93	222
602		\N	\N	นิคมสร้างตนเอง	15000	93	222
603		\N	\N	บางขันหมาก	15000	93	222
604		\N	\N	บ้านข่อย	15000	93	222
606		\N	\N	ป่าตาล	15000	93	222
607		\N	\N	พรหมมาสตร์	15000	93	222
610		\N	\N	สี่คลอง	15000	93	222
593		\N	\N	เขาพระงาม	15160	93	222
594		\N	\N	เขาสามยอด	15000	93	222
592		\N	\N	โก่งธนู	13240	93	222
595		\N	\N	โคกกะเทียม	15160	93	222
597		\N	\N	โคกตูม	15210	93	222
596		\N	\N	โคกลำพาน	15000	93	222
609		\N	\N	โพธิ์ตรุ	15000	93	222
608		\N	\N	โพธิ์เก้าต้น	15000	93	222
625		\N	\N	คลองเกตุ	15120	95	222
629		\N	\N	ดงมะรุม	15120	95	222
622		\N	\N	ถลุงเหล็ก	15120	95	222
630		\N	\N	วังขอนขว้าง	15120	95	222
631		\N	\N	วังจั่น	15120	95	222
628		\N	\N	วังเพลิง	15120	95	222
626		\N	\N	สะแกราบ	15120	95	222
632		\N	\N	หนองแขม	15120	95	222
623		\N	\N	หลุมข้าว	15120	95	222
624		\N	\N	ห้วยโป่ง	15120	95	222
621		\N	\N	เกาะแก้ว	15120	95	222
627		\N	\N	เพนียด	15120	95	222
620		\N	\N	โคกสำโรง	15120	95	222
693		\N	\N	ยางราก	15250	101	222
695		\N	\N	วังทอง	15250	101	222
694		\N	\N	หนองมะค่า	15250	101	222
692		\N	\N	โคกเจริญ	15250	101	222
696		\N	\N	โคกแสมสาร	15250	101	222
4346		\N	\N	นาแก	52110	555	431
4344		\N	\N	บ้านร้อง	52110	555	431
4349		\N	\N	บ้านหวด	52110	555	431
4347		\N	\N	บ้านอ้อน	52110	555	431
4348		\N	\N	บ้านแหง	52110	555	431
4343		\N	\N	บ้านโป่ง	52110	555	431
4345		\N	\N	ปงเตา	52110	555	431
4341		\N	\N	หลวงเหนือ	52110	555	431
4342		\N	\N	หลวงใต้	52110	555	431
4350		\N	\N	แม่ตีบ	52110	555	431
4357		\N	\N	ทุ่งฮั้ว	52140	557	431
4360		\N	\N	ร่องเคาะ	52140	557	431
4362		\N	\N	วังซ้าย	52140	557	431
7429		\N	\N	วังทรายคำ	52140	557	431
4361		\N	\N	วังทอง	52140	557	431
4358		\N	\N	วังเหนือ	52140	557	431
4363		\N	\N	วังแก้ว	52140	557	431
4359		\N	\N	วังใต้	52140	557	431
4389		\N	\N	นายาง	52170	561	431
4386		\N	\N	สบปราบ	52170	561	431
4387		\N	\N	สมัย	52170	561	431
4388		\N	\N	แม่กัวะ	52170	561	431
4393		\N	\N	ปงยางคก	52190	562	431
4396		\N	\N	วอแก้ว	52190	562	431
4391		\N	\N	หนองหล่ม	52190	562	431
4390		\N	\N	ห้างฉัตร	52190	562	431
4392		\N	\N	เมืองยาว	52190	562	431
4394		\N	\N	เวียงตาล	52190	562	431
4395		\N	\N	แม่สัน	52190	562	431
4336		\N	\N	ท่าผา	52130	553	431
4330		\N	\N	นาแก้ว	52130	553	431
4335		\N	\N	นาแส่ง	52130	553	431
4329		\N	\N	ลำปางหลวง	52130	553	431
4332		\N	\N	วังพร้าว	52130	553	431
4333		\N	\N	ศาลา	52130	553	431
4334		\N	\N	เกาะคา	52130	553	431
7428		\N	\N	ใหม่พัฒนา	52130	553	431
4331		\N	\N	ไหล่หิน	52130	553	431
4369		\N	\N	นาโป่ง	52160	558	431
4364		\N	\N	ล้อมแรด	52160	558	431
4371		\N	\N	เถินบุรี	52160	558	431
4368		\N	\N	เวียงมอก	52160	558	431
4370		\N	\N	แม่ถอด	52160	558	431
4366		\N	\N	แม่ปะ	52160	558	431
4367		\N	\N	แม่มอก	52160	558	431
4365		\N	\N	แม่วะ	52230	558	431
4399		\N	\N	ทุ่งกว๋าว	52240	563	431
4398		\N	\N	บ้านขอ	52240	563	431
4401		\N	\N	หัวเมือง	52240	563	431
4397		\N	\N	เมืองปาน	52240	563	431
4400		\N	\N	แจ้ซ้อน	52240	563	431
4312		\N	\N	กล้วยแพะ	52000	551	431
4311		\N	\N	ชมพู	52100	551	431
4322		\N	\N	ต้นธงชัย	52000	551	431
4317		\N	\N	ทุ่งฝาย	52000	551	431
7331		\N	\N	นิคมพัฒนา	52000	551	431
7332		\N	\N	บุญนาคพัฒนา	52000	551	431
4321		\N	\N	บ่อแฮ้ว	52100	551	431
4320		\N	\N	บ้านค่า	52100	551	431
4319		\N	\N	บ้านเป้า	52100	551	431
4315		\N	\N	บ้านเสด็จ	52000	551	431
4318		\N	\N	บ้านเอื้อม	52100	551	431
4314		\N	\N	บ้านแลง	52000	551	431
4313		\N	\N	ปงแสนทอง	52100	551	431
4310		\N	\N	พระบาท	52000	551	431
4316		\N	\N	พิชัย	52000	551	431
7335		\N	\N	สบตุ๋ย	52100	551	431
7336		\N	\N	สวนดอก	52100	551	431
7334		\N	\N	หัวเวียง	52000	551	431
7333		\N	\N	เวียงเหนือ	52000	551	431
4337		\N	\N	ทุ่งงาม	52210	554	431
4340		\N	\N	เสริมกลาง	52210	554	431
4338		\N	\N	เสริมขวา	52210	554	431
4339		\N	\N	เสริมซ้าย	52210	554	431
4356		\N	\N	ทุ่งผึ้ง	52120	556	431
4352		\N	\N	บ้านสา	52120	556	431
4353		\N	\N	ปงดอน	52120	556	431
7427		\N	\N	วิเชตนคร	52120	556	431
4355		\N	\N	เมืองมาย	52120	556	431
4351		\N	\N	แจ้ห่ม	52120	556	431
4354		\N	\N	แม่สุก	52120	556	431
4382		\N	\N	ดอนไฟ	52150	560	431
4377		\N	\N	นาครัว	52150	560	431
4381		\N	\N	น้ำโจ้	52150	560	431
4379		\N	\N	บ้านกิ่ว	52150	560	431
4380		\N	\N	บ้านบอม	52150	560	431
4378		\N	\N	ป่าตัน	52150	560	431
4384		\N	\N	วังเงิน	52150	560	431
4385		\N	\N	สันดอนแก้ว	52150	560	431
4383		\N	\N	หัวเสือ	52150	560	431
4376		\N	\N	แม่ทะ	52150	560	431
4373		\N	\N	ผาปัง	52180	559	431
4375		\N	\N	พระบาทวังตวง	52230	559	431
4374		\N	\N	แม่ปุ	52180	559	431
4372		\N	\N	แม่พริก	52180	559	431
4326		\N	\N	จางเหนือ	52220	552	431
4325		\N	\N	นาสัก	52220	552	431
4323		\N	\N	บ้านดง	52220	552	431
4328		\N	\N	สบป้าด	52220	552	431
4327		\N	\N	แม่เมาะ	52220	552	431
4295		\N	\N	ตะเคียนปม	51160	547	434
4293		\N	\N	ทุ่งหัวช้าง	51160	547	434
4294		\N	\N	บ้านปวง	51160	547	434
4305		\N	\N	บ้านธิ	51180	549	434
4306		\N	\N	ห้วยยาบ	51180	549	434
4280		\N	\N	บ้านโฮ่ง	51130	545	434
4281		\N	\N	ป่าพลู	51130	545	434
4283		\N	\N	ศรีเตี้ย	51130	545	434
4284		\N	\N	หนองปลาสะวาย	51130	545	434
4282		\N	\N	เหล่ายาว	51130	545	434
4302		\N	\N	ท่าตุ้ม	51120	548	434
4304		\N	\N	นครเจดีย์	51120	548	434
4303		\N	\N	น้ำดิบ	51120	548	434
4300		\N	\N	บ้านเรือน	51120	548	434
4296		\N	\N	ปากบ่อง	51120	548	434
4297		\N	\N	ป่าซาง	51120	548	434
4301		\N	\N	มะกอก	51120	548	434
4299		\N	\N	ม่วงน้อย	51120	548	434
4298		\N	\N	แม่แรง	51120	548	434
4289		\N	\N	ก้อ	51110	546	434
4288		\N	\N	ดงดำ	51110	546	434
4287		\N	\N	นาทราย	51110	546	434
4291		\N	\N	ป่าไผ่	51110	546	434
4285		\N	\N	ลี้	51110	546	434
4292		\N	\N	ศรีวิชัย	51110	546	434
4286		\N	\N	แม่ตืน	51110	546	434
4290		\N	\N	แม่ลาน	51110	546	434
4266		\N	\N	ต้นธง	51000	543	434
4271		\N	\N	บ้านกลาง	51000	543	434
4267		\N	\N	บ้านแป้น	51000	543	434
4264		\N	\N	ประตูป่า	51000	543	434
4269		\N	\N	ป่าสัก	51000	543	434
4272		\N	\N	มะเขือแจ้	51000	543	434
4265		\N	\N	ริมปิง	51000	543	434
4273		\N	\N	ศรีบัวบาน	51000	543	434
4263		\N	\N	หนองช้างคืน	51150	543	434
4274		\N	\N	หนองหนาม	51000	543	434
4262		\N	\N	อุโมงค์	51150	543	434
4270		\N	\N	เวียงยอง	51000	543	434
4261		\N	\N	เหมืองง่า	51000	543	434
4268		\N	\N	เหมืองจี้	51000	543	434
4260		\N	\N	ในเมือง	51000	543	434
4309		\N	\N	วังผาง	51120	550	434
4308		\N	\N	หนองยวง	51120	550	434
4307		\N	\N	หนองล่อง	51120	550	434
4277		\N	\N	ทากาศ	51170	544	434
4278		\N	\N	ทาขุมเงิน	51170	544	434
4279		\N	\N	ทาทุ่งหลวง	51170	544	434
4275		\N	\N	ทาปลาดุก	51140	544	434
4276		\N	\N	ทาสบเส้า	51140	544	434
7337		\N	\N	ทาแม่ลอบ	51170	544	434
2106		\N	\N	กระแชง	33110	273	336
2096		\N	\N	กุดเสลา	33110	273	336
2110		\N	\N	ขนุน	33110	273	336
2103		\N	\N	จานใหญ่	33110	273	336
2105		\N	\N	ชำ	33110	273	336
2102		\N	\N	ตระกาจ	33110	273	336
2113		\N	\N	ทุ่งใหญ่	33110	273	336
2099		\N	\N	น้ำอ้อม	33110	273	336
2095		\N	\N	บึงมะลู	33110	273	336
2114		\N	\N	ภูผาหมอก	33110	273	336
2104		\N	\N	ภูเงิน	33110	273	336
2101		\N	\N	รุง	33110	273	336
2100		\N	\N	ละลาย	33110	273	336
2111		\N	\N	สวนกล้วย	33110	273	336
2098		\N	\N	สังเม็ก	33110	273	336
2108		\N	\N	หนองหญ้าลาด	33110	273	336
2097		\N	\N	เมือง	33110	273	336
2112		\N	\N	เวียงเหนือ	33110	273	336
2109		\N	\N	เสาธงชัย	33110	273	336
2107		\N	\N	โนนสำราญ	33110	273	336
2094		\N	\N	คำเนียม	33130	272	336
2093		\N	\N	จาน	33130	272	336
2079		\N	\N	ดูน	33130	272	336
2091		\N	\N	ดู่	33130	272	336
2085		\N	\N	ทาม	33130	272	336
2089		\N	\N	บัวน้อย	33130	272	336
2092		\N	\N	ผักแพว	33130	272	336
2082		\N	\N	ยาง	33130	272	336
2086		\N	\N	ละทาย	33130	272	336
2090		\N	\N	หนองบัว	33130	272	336
2081		\N	\N	หนองหัวช้าง	33130	272	336
2084		\N	\N	หนองแก้ว	33130	272	336
2083		\N	\N	หนองแวง	33130	272	336
2088		\N	\N	อีปาด	33130	272	336
2087		\N	\N	เมืองน้อย	33130	272	336
2080		\N	\N	โนนสัง	33130	272	336
2132		\N	\N	กฤษณา	33140	274	336
2115		\N	\N	กันทรารมย์	33140	274	336
2116		\N	\N	จะกง	33140	274	336
2118		\N	\N	ดองกำเม็ด	33140	274	336
2126		\N	\N	ตะเคียน	33140	274	336
2122		\N	\N	ตาอุด	33140	274	336
2127		\N	\N	นิคมพัฒนา	33140	274	336
2129		\N	\N	ปราสาท	33140	274	336
2120		\N	\N	ปรือใหญ่	33140	274	336
2133		\N	\N	ลมศักดิ์	33140	274	336
2135		\N	\N	ศรีตระกูล	33140	274	336
2136		\N	\N	ศรีสะอาด	33140	274	336
2121		\N	\N	สะเดาใหญ่	33140	274	336
2130		\N	\N	สำโรงตาเจ็น	33140	274	336
2134		\N	\N	หนองฉลอง	33140	274	336
2125		\N	\N	หัวเสือ	33140	274	336
2131		\N	\N	ห้วยสำราญ	33140	274	336
2123		\N	\N	ห้วยเหนือ	33140	274	336
2124		\N	\N	ห้วยใต้	33140	274	336
2128		\N	\N	โคกเพชร	33140	274	336
2119		\N	\N	โสน	33140	274	336
2117		\N	\N	ใจดี	33140	274	336
2158		\N	\N	กระหวัน	33150	277	336
2161		\N	\N	กันทรอม	33150	277	336
2159		\N	\N	ขุนหาญ	33150	277	336
2154		\N	\N	บักดอง	33150	277	336
2155		\N	\N	พราน	33150	277	336
2162		\N	\N	ภูฝ้าย	33150	277	336
2153		\N	\N	สิ	33150	277	336
2164		\N	\N	ห้วยจันทร์	33150	277	336
2160		\N	\N	โนนสูง	33150	277	336
2163		\N	\N	โพธิ์กระสังข์	33150	277	336
2156		\N	\N	โพธิ์วงศ์	33150	277	336
2157		\N	\N	ไพร	33150	277	336
2221		\N	\N	คูบ	33130	284	336
2218		\N	\N	ตองปิด	33130	284	336
2216		\N	\N	น้ำเกลี้ยง	33130	284	336
2220		\N	\N	รุ่งระวี	33130	284	336
2217		\N	\N	ละเอาะ	33130	284	336
2219		\N	\N	เขิน	33130	284	336
2198		\N	\N	บึงบูรพ์	33220	280	336
2197		\N	\N	เป๊าะ	33220	280	336
2144		\N	\N	กู่	33170	276	336
2150		\N	\N	ดู่	33170	276	336
2146		\N	\N	ตูม	33170	276	336
2143		\N	\N	พิมาย	33170	276	336
2152		\N	\N	พิมายเหนือ	33170	276	336
2147		\N	\N	สมอ	33170	276	336
2151		\N	\N	สวาย	33170	276	336
2149		\N	\N	สำโรงปราสาท	33170	276	336
2145		\N	\N	หนองเชียงทูน	33170	276	336
2148		\N	\N	โพธิ์ศรี	33170	276	336
2247		\N	\N	ตำแย	33230	289	336
2245		\N	\N	พยุห์	33230	289	336
2246		\N	\N	พรหมสวัสดิ์	33230	289	336
2249		\N	\N	หนองค้า	33230	289	336
2248		\N	\N	โนนเพ็ก	33230	289	336
2235		\N	\N	ดงรัก	33140	286	336
2234		\N	\N	ตะเคียนราม	33140	286	336
2233		\N	\N	ละลม	33140	286	336
2231		\N	\N	ห้วยตามอญ	33140	286	336
2232		\N	\N	ห้วยตึ๊กชู	33140	286	336
2230		\N	\N	โคกตาล	33140	286	336
2236		\N	\N	ไพรพัฒนา	33140	286	336
2076		\N	\N	กุดเมืองฮาม	33190	271	336
2074		\N	\N	คอนกาม	33190	271	336
2077		\N	\N	บึงบอน	33190	271	336
2072		\N	\N	ยางชุมน้อย	33190	271	336
2078		\N	\N	ยางชุมใหญ่	33190	271	336
2073		\N	\N	ลิ้นฟ้า	33190	271	336
2075		\N	\N	โนนคูณ	33190	271	336
2168		\N	\N	จิกสังข์ทอง	33160	278	336
2170		\N	\N	ดู่	33160	278	336
2169		\N	\N	ด่าน	33160	278	336
2172		\N	\N	บัวหุ่ง	33160	278	336
2177		\N	\N	สร้างปี่	33160	278	336
2174		\N	\N	ส้มป่อย	33160	278	336
2175		\N	\N	หนองหมี	33160	278	336
2171		\N	\N	หนองอึ่ง	33160	278	336
2167		\N	\N	หนองแค	33160	278	336
2176		\N	\N	หว้านคำ	33160	278	336
2165		\N	\N	เมืองคง	33160	278	336
2166		\N	\N	เมืองแคน	33160	278	336
2173		\N	\N	ไผ่	33160	278	336
2224		\N	\N	ดวนใหญ่	33270	285	336
2227		\N	\N	ทุ่งสว่าง	33270	285	336
2223		\N	\N	ธาตุ	33270	285	336
2222		\N	\N	บุสูง	33270	285	336
2225		\N	\N	บ่อแก้ว	33270	285	336
2228		\N	\N	วังหิน	33270	285	336
2226		\N	\N	ศรีสำราญ	33270	285	336
2229		\N	\N	โพนยาง	33270	285	336
7397		\N	\N	ตูม	33240	283	336
2211		\N	\N	พิงพวย	33240	283	336
2210		\N	\N	ศรีแก้ว	33240	283	336
2214		\N	\N	ศรีโนนงาม	33240	283	336
2212		\N	\N	สระเยาว์	33240	283	336
2215		\N	\N	สะพุง	33240	283	336
2213		\N	\N	เสื่องข้าว	33240	283	336
2255		\N	\N	กุง	33160	291	336
2256		\N	\N	คลีกลิ้ง	33160	291	336
2257		\N	\N	หนองบัวดง	33160	291	336
2258		\N	\N	โจดม่วง	33160	291	336
2201		\N	\N	กล้วยกว้าง	33210	281	336
2203		\N	\N	จานแสนไชย	33210	281	336
2204		\N	\N	ปราสาท	33210	281	336
2202		\N	\N	ผักไหม	33210	281	336
2199		\N	\N	ห้วยทับทัน	33210	281	336
2200		\N	\N	เมืองหลวง	33210	281	336
2178		\N	\N	กำแพง	33120	279	336
2180		\N	\N	ก้านเหลือง	33120	279	336
2185		\N	\N	ขะยูง	33120	279	336
2186		\N	\N	ตาเกษ	33120	279	336
2181		\N	\N	ทุ่งไชย	33120	279	336
2192		\N	\N	ปะอาว	33120	279	336
2188		\N	\N	รังแร้ง	33120	279	336
2194		\N	\N	สระกำแพงใหญ่	33120	279	336
2182		\N	\N	สำโรง	33120	279	336
2193		\N	\N	หนองห้าง	33120	279	336
2184		\N	\N	หนองไฮ	33120	279	336
2187		\N	\N	หัวช้าง	33120	279	336
2179		\N	\N	อี่หล่ำ	33120	279	336
2183		\N	\N	แขม	33120	279	336
2190		\N	\N	แข้	33120	279	336
2189		\N	\N	แต้	33120	279	336
2196		\N	\N	โคกจาน	33120	279	336
2195		\N	\N	โคกหล่าม	33120	279	336
2191		\N	\N	โพธิ์ชัย	33120	279	336
2244		\N	\N	ท่าคล้อ	33110	288	336
2242		\N	\N	หนองงูเหลือม	33110	288	336
2241		\N	\N	หนองหว้า	33110	288	336
2243		\N	\N	หนองฮาง	33110	288	336
2240		\N	\N	เสียว	33110	288	336
2238		\N	\N	ตาโกน	33120	287	336
2239		\N	\N	หนองใหญ่	33120	287	336
2237		\N	\N	เมืองจันทร์	33120	287	336
2056		\N	\N	คูซอด	33000	270	336
2058		\N	\N	จาน	33000	270	336
2057		\N	\N	ซำ	33000	270	336
2059		\N	\N	ตะดอบ	33000	270	336
2065		\N	\N	ทุ่ม	33000	270	336
2068		\N	\N	น้ำคำ	33000	270	336
2064		\N	\N	หญ้าปล้อง	33000	270	336
2060		\N	\N	หนองครก	33000	270	336
2067		\N	\N	หนองแก้ว	33000	270	336
2071		\N	\N	หนองไผ่	33000	270	336
2066		\N	\N	หนองไฮ	33000	270	336
2070		\N	\N	หมากเขียบ	33000	270	336
2055		\N	\N	เมืองเหนือ	33000	270	336
7396		\N	\N	เมืองใต้	33000	270	336
2069		\N	\N	โพธิ์	33000	270	336
2061		\N	\N	โพนข่า	33000	270	336
2062		\N	\N	โพนค้อ	33000	270	336
2063		\N	\N	โพนเขวา	33000	270	336
2206		\N	\N	บก	33250	282	336
2208		\N	\N	หนองกุง	33250	282	336
2209		\N	\N	เหล่ากวาง	33250	282	336
2205		\N	\N	โนนค้อ	33250	282	336
2207		\N	\N	โพธิ์	33250	282	336
2253		\N	\N	ผือใหญ่	33120	290	336
2252		\N	\N	หนองม้า	33120	290	336
2254		\N	\N	อีเซ	33120	290	336
2251		\N	\N	เสียว	33120	290	336
2250		\N	\N	โดด	33120	290	336
2138		\N	\N	ดินแดง	33180	275	336
2139		\N	\N	ปราสาทเยอ	33180	275	336
2140		\N	\N	สำโรงพลัน	33180	275	336
2141		\N	\N	สุขสวัสดิ์	33180	275	336
2142		\N	\N	โนนปูน	33180	275	336
2137		\N	\N	ไพรบึง	33180	275	336
3826		\N	\N	กุดบาก	47180	484	325
3828		\N	\N	กุดไห	47180	484	325
3827		\N	\N	นาม่อง	47180	484	325
3821		\N	\N	กุสุมาลย์	47210	483	325
3823		\N	\N	นาเพียง	47230	483	325
3822		\N	\N	นาโพธิ์	47210	483	325
3825		\N	\N	อุ่มจาน	47230	483	325
3824		\N	\N	โพธิ์ไพศาล	47210	483	325
3867		\N	\N	คำตากล้า	47250	490	325
3869		\N	\N	นาแต้	47250	490	325
3868		\N	\N	หนองบัวสิม	47250	490	325
3870		\N	\N	แพด	47250	490	325
3849		\N	\N	นิคมน้ำอูน	47270	488	325
3852		\N	\N	สุวรรณคาม	47270	488	325
3851		\N	\N	หนองบัว	47270	488	325
3850		\N	\N	หนองปลิง	47270	488	325
3873		\N	\N	ดงหม้อทอง	47140	491	325
3875		\N	\N	ดงหม้อทองใต้	47140	491	325
3874		\N	\N	ดงเหนือ	47140	491	325
3879		\N	\N	บ่อแก้ว	47140	491	325
3872		\N	\N	มาย	47140	491	325
3871		\N	\N	ม่วง	47140	491	325
3878		\N	\N	หนองกวั่ง	47140	491	325
3876		\N	\N	ห้วยหลัว	47140	491	325
3877		\N	\N	โนนสะอาด	47140	491	325
3834		\N	\N	ช้างมิ่ง	47130	485	325
3832		\N	\N	นาหัวบ่อ	47220	485	325
3835		\N	\N	นาใน	47130	485	325
3837		\N	\N	บะฮี	47130	485	325
3829		\N	\N	พรรณา	47130	485	325
3831		\N	\N	พอกน้อย	47220	485	325
3830		\N	\N	วังยาง	47130	485	325
3836		\N	\N	สว่าง	47130	485	325
3838		\N	\N	เชิงชุม	47130	485	325
3833		\N	\N	ไร่	47130	485	325
3843		\N	\N	ต้นผึ้ง	47160	486	325
3839		\N	\N	พังโคน	47160	486	325
3840		\N	\N	ม่วงไข่	47160	486	325
3841		\N	\N	แร่	47160	486	325
3842		\N	\N	ไฮหย่อง	47160	486	325
3929		\N	\N	กกปลาซิว	47180	499	325
3926		\N	\N	สร้างค้อ	47180	499	325
3927		\N	\N	หลุบเลา	47180	499	325
3928		\N	\N	โคกภู	47180	499	325
3865		\N	\N	กุดเรือคำ	47120	489	325
3855		\N	\N	ขัวก่าย	47120	489	325
3864		\N	\N	คอนสวรรค์	47120	489	325
3857		\N	\N	คูสะคาม	47120	489	325
3858		\N	\N	ธาตุ	47120	489	325
3863		\N	\N	นาคำ	47120	489	325
3861		\N	\N	นาซอ	47120	489	325
3853		\N	\N	วานรนิวาส	47120	489	325
3860		\N	\N	ศรีวิชัย	47120	489	325
3856		\N	\N	หนองสนม	47120	489	325
3859		\N	\N	หนองแวง	47120	489	325
3866		\N	\N	หนองแวงใต้	47120	489	325
3862		\N	\N	อินทร์แปลง	47120	489	325
3854		\N	\N	เดื่อศรีคันไชย	47120	489	325
3847		\N	\N	คำบ่อ	47150	487	325
3848		\N	\N	ค้อเขียว	47150	487	325
3845		\N	\N	ปลาโหล	47150	487	325
3844		\N	\N	วาริชภูมิ	47150	487	325
3846		\N	\N	หนองลาด	47150	487	325
3889		\N	\N	คำสะอาด	47110	493	325
3896		\N	\N	ค้อใต้	47110	493	325
3901		\N	\N	ตาลเนิ้ง	47240	493	325
3900		\N	\N	ตาลโกน	47240	493	325
3899		\N	\N	ทรายมูล	47110	493	325
3902		\N	\N	ธาตุทอง	47240	493	325
3891		\N	\N	บงเหนือ	47110	493	325
3895		\N	\N	บงใต้	47110	493	325
3890		\N	\N	บ้านต้าย	47110	493	325
3903		\N	\N	บ้านถ่อน	47110	493	325
3897		\N	\N	พันนา	47240	493	325
3888		\N	\N	สว่างแดนดิน	47110	493	325
3894		\N	\N	หนองหลวง	47110	493	325
3898		\N	\N	แวง	47240	493	325
3893		\N	\N	โคกสี	47110	493	325
3892		\N	\N	โพนสูง	47110	493	325
3905		\N	\N	ท่าศิลา	47190	494	325
3907		\N	\N	ปทุมวาปี	47190	494	325
3906		\N	\N	วัฒนา	47190	494	325
3904		\N	\N	ส่องดาว	47190	494	325
3884		\N	\N	ท่าก้อน	47170	492	325
3885		\N	\N	นาฮี	47170	492	325
3886		\N	\N	บะหว้า	47170	492	325
3882		\N	\N	วาใหญ่	47170	492	325
3887		\N	\N	สามัคคีพัฒนา	47170	492	325
3880		\N	\N	อากาศ	47170	492	325
3883		\N	\N	โพนงาม	47170	492	325
3881		\N	\N	โพนแพง	47170	492	325
3918		\N	\N	ทุ่งแก	47290	497	325
3916		\N	\N	บ้านเหล่า	47290	497	325
3920		\N	\N	หนองแปน	47290	497	325
3917		\N	\N	เจริญศิลป์	47290	497	325
3919		\N	\N	โคกศิลา	47290	497	325
3911		\N	\N	จันทร์เพ็ญ	47260	495	325
3910		\N	\N	นาตาล	47260	495	325
3909		\N	\N	บึงทวาย	47260	495	325
3908		\N	\N	เต่างอย	47260	495	325
3806		\N	\N	ขมิ้น	47220	482	325
3807		\N	\N	งิ้วด่อน	47000	482	325
3812		\N	\N	ดงชน	47000	482	325
3815		\N	\N	ดงมะไฟ	47000	482	325
3810		\N	\N	ท่าแร่	47230	482	325
3816		\N	\N	ธาตุนาเวง	47000	482	325
3805		\N	\N	ธาตุเชิงชุม	47000	482	325
3814		\N	\N	พังขว้าง	47000	482	325
3811		\N	\N	ม่วงลาย	47000	482	325
3818		\N	\N	หนองลาด	47220	482	325
3813		\N	\N	ห้วยยาง	47000	482	325
3819		\N	\N	ฮางโฮง	47000	482	325
3809		\N	\N	เชียงเครือ	47000	482	325
3817		\N	\N	เหล่าปอแดง	47000	482	325
3820		\N	\N	โคกก่อง	47000	482	325
3808		\N	\N	โนนหอม	47000	482	325
3914		\N	\N	ด่านม่วงคำ	47280	496	325
3912		\N	\N	ตองโขบ	47280	496	325
3913		\N	\N	เหล่าโพนค้อ	47280	496	325
3915		\N	\N	แมดนาท่ม	47280	496	325
3923		\N	\N	นาตงวัฒนา	47230	498	325
3922		\N	\N	นาแก้ว	47230	498	325
3924		\N	\N	บ้านแป้น	47230	498	325
3921		\N	\N	บ้านโพน	47230	498	325
3925		\N	\N	เชียงสือ	47230	498	325
7479		\N	\N	กระแสสินธุ์	90270	857	521
6807		\N	\N	เกาะใหญ่	90270	857	521
6809		\N	\N	เชิงแส	90270	857	521
6808		\N	\N	โรง	90270	857	521
7338		\N	\N	คลองหลา	90115	865	521
6860		\N	\N	คลองหอยโข่ง	90230	865	521
6861		\N	\N	ทุ่งลาน	90230	865	521
6862		\N	\N	โคกม่วง	90230	865	521
6842		\N	\N	ควนโส	90220	862	521
6844		\N	\N	บางเหรียง	90220	862	521
6841		\N	\N	รัตภูมิ	90220	862	521
6843		\N	\N	ห้วยลึก	90220	862	521
6762		\N	\N	ขุนตัดหวาย	90130	852	521
6767		\N	\N	คลองเปียะ	90130	852	521
6765		\N	\N	คู	90130	852	521
6764		\N	\N	จะโหนง	90130	852	521
6768		\N	\N	ตลิ่งชัน	90130	852	521
6763		\N	\N	ท่าหมอไทร	90130	852	521
6760		\N	\N	นาทับ	90130	852	521
6759		\N	\N	นาหว้า	90130	852	521
6761		\N	\N	น้ำขาว	90130	852	521
6755		\N	\N	บ้านนา	90130	852	521
6756		\N	\N	ป่าชิง	90130	852	521
6758		\N	\N	สะกอม	90130	852	521
6757		\N	\N	สะพานไม้แก่น	90130	852	521
6766		\N	\N	แค	90130	852	521
6778		\N	\N	คลองกวาง	90160	853	521
6772		\N	\N	คลองทราย	90160	853	521
6770		\N	\N	ฉาง	90160	853	521
6776		\N	\N	ทับช้าง	90160	853	521
6774		\N	\N	ท่าประดู่	90160	853	521
6769		\N	\N	นาทวี	90160	853	521
6771		\N	\N	นาหมอศรี	90160	853	521
6777		\N	\N	ประกอบ	90160	853	521
6773		\N	\N	ปลักหนู	90160	853	521
6775		\N	\N	สะท้อน	90160	853	521
6840		\N	\N	คลองหรัง	90310	861	521
6839		\N	\N	ทุ่งขมิ้น	90310	861	521
6837		\N	\N	นาหม่อม	90310	861	521
6838		\N	\N	พิจิตร	90310	861	521
6846		\N	\N	ท่าช้าง	90110	863	521
6845		\N	\N	บางกล่ำ	90110	863	521
6848		\N	\N	บ้านหาร	90110	863	521
6847		\N	\N	แม่ทอม	90110	863	521
6796		\N	\N	คลองแดน	90140	856	521
6797		\N	\N	ตะเครียะ	90140	856	521
6798		\N	\N	ท่าบอน	90140	856	521
6800		\N	\N	บ่อตรุ	90140	856	521
6805		\N	\N	บ้านขาว	90140	856	521
6799		\N	\N	บ้านใหม่	90140	856	521
6801		\N	\N	ปากแตระ	90140	856	521
6802		\N	\N	พังยาง	90140	856	521
6803		\N	\N	ระวะ	90140	856	521
6795		\N	\N	ระโนด	90140	856	521
6804		\N	\N	วัดสน	90140	856	521
6806		\N	\N	แดนสงวน	90140	856	521
6810		\N	\N	กำแพงเพชร	90180	858	521
6813		\N	\N	ควนรู	90220	858	521
6812		\N	\N	คูหาใต้	90180	858	521
6811		\N	\N	ท่าชะมวง	90180	858	521
6814		\N	\N	เขาพระ	90180	858	521
6745		\N	\N	กระดังงา	90190	851	521
6749		\N	\N	คลองรี	90190	851	521
6750		\N	\N	คูขุด	90190	851	521
6744		\N	\N	จะทิ้งพระ	90190	851	521
6748		\N	\N	ชุมพล	90190	851	521
6747		\N	\N	ดีหลวง	90190	851	521
6751		\N	\N	ท่าหิน	90190	851	521
6754		\N	\N	บ่อดาน	90190	851	521
6753		\N	\N	บ่อแดง	90190	851	521
6752		\N	\N	วัดจันทร์	90190	851	521
6746		\N	\N	สนามชัย	90190	851	521
6791		\N	\N	คูหา	90210	855	521
6790		\N	\N	จะแหน	90210	855	521
6787		\N	\N	ทุ่งพอ	90210	855	521
6794		\N	\N	ธารคีรี	90210	855	521
6793		\N	\N	บาโหย	90210	855	521
6789		\N	\N	บ้านโหนด	90210	855	521
6786		\N	\N	สะบ้าย้อย	90210	855	521
6792		\N	\N	เขาแดง	90210	855	521
6788		\N	\N	เปียน	90210	855	521
6819		\N	\N	ทุ่งหมอ	90240	859	521
6820		\N	\N	ท่าโพธิ์	90170	859	521
6816		\N	\N	ปริก	90120	859	521
6821		\N	\N	ปาดังเบซาร์	90240	859	521
6817		\N	\N	พังลา	90170	859	521
6815		\N	\N	สะเดา	90120	859	521
6822		\N	\N	สำนักขาม	90320	859	521
6818		\N	\N	สำนักแต้ว	90120	859	521
6823		\N	\N	เขามีเกียรติ	90170	859	521
6854		\N	\N	ชะแล้	90330	864	521
6849		\N	\N	ชิงโค	90280	864	521
6851		\N	\N	ทำนบ	90280	864	521
6858		\N	\N	บางเขียด	90330	864	521
6855		\N	\N	ปากรอ	90330	864	521
6856		\N	\N	ป่าขาด	90330	864	521
6859		\N	\N	ม่วงงาม	90330	864	521
6852		\N	\N	รำแดง	90330	864	521
6853		\N	\N	วัดขนุน	90330	864	521
6850		\N	\N	สทิงหม้อ	90280	864	521
6857		\N	\N	หัวเขา	90280	864	521
6829		\N	\N	คลองอู่ตะเภา	90110	860	521
6828		\N	\N	คลองแห	90110	860	521
6825		\N	\N	ควนลัง	90110	860	521
6827		\N	\N	คอหงส์	90110	860	521
6826		\N	\N	คูเต่า	90110	860	521
6830		\N	\N	ฉลุง	90110	860	521
6832		\N	\N	ทุ่งตำเสา	90110	860	521
6831		\N	\N	ทุ่งใหญ่	90110	860	521
6833		\N	\N	ท่าข้าม	90110	860	521
6834		\N	\N	น้ำน้อย	90110	860	521
6835		\N	\N	บ้านพรุ	90250	860	521
6836		\N	\N	พะตง	90230	860	521
6824		\N	\N	หาดใหญ่	90110	860	521
6783		\N	\N	ท่าม่วง	90150	854	521
6780		\N	\N	ปากบาง	90150	854	521
6782		\N	\N	ลำไพล	90260	854	521
6784		\N	\N	วังใหญ่	90260	854	521
6785		\N	\N	สะกอม	90150	854	521
6781		\N	\N	เกาะสะบ้า	90150	854	521
6779		\N	\N	เทพา	90150	854	521
6742		\N	\N	ทุ่งหวัง	90000	850	521
6738		\N	\N	บ่อยาง	90000	850	521
6741		\N	\N	พะวง	90100	850	521
6743		\N	\N	เกาะยอ	90100	850	521
6740		\N	\N	เกาะแต้ว	90000	850	521
6739		\N	\N	เขารูปช้าง	90000	850	521
6879		\N	\N	ควนกาหลง	91130	868	524
6878		\N	\N	ทุ่งนุ้ย	91130	868	524
6880		\N	\N	อุไดเจริญ	91130	868	524
6876		\N	\N	ควนสตอ	91160	867	524
6875		\N	\N	ควนโดน	91160	867	524
6877		\N	\N	ย่านซื่อ	91160	867	524
7480		\N	\N	วังประจัน	91160	867	524
6893		\N	\N	ขอนคลาน	91120	871	524
6894		\N	\N	ทุ่งบุหลัง	91120	871	524
6891		\N	\N	ทุ่งหว้า	91120	871	524
6892		\N	\N	นาทอน	91120	871	524
6895		\N	\N	ป่าแก่บ่อหิน	91120	871	524
6884		\N	\N	ท่าเรือ	91150	869	524
6881		\N	\N	ท่าแพ	91150	869	524
6883		\N	\N	สาคร	91150	869	524
6882		\N	\N	แป-ระ	91150	869	524
6897		\N	\N	นิคมพัฒนา	91130	872	524
6896		\N	\N	ปาล์มพัฒนา	91130	872	524
6885		\N	\N	กำแพง	91110	870	524
6889		\N	\N	น้ำผุด	91110	870	524
6888		\N	\N	ปากน้ำ	91110	870	524
6886		\N	\N	ละงู	91110	870	524
6887		\N	\N	เขาขาว	91110	870	524
6890		\N	\N	แหลมสน	91110	870	524
6864		\N	\N	คลองขุด	91000	866	524
6865		\N	\N	ควนขัน	91000	866	524
6873		\N	\N	ควนโพธิ์	91140	866	524
6867		\N	\N	ฉลุง	91140	866	524
6869		\N	\N	ตันหยงโป	91000	866	524
6871		\N	\N	ตำมะลัง	91000	866	524
6866		\N	\N	บ้านควน	91140	866	524
6872		\N	\N	ปูยู	91000	866	524
6863		\N	\N	พิมาน	91000	866	524
6874		\N	\N	เกตรี	91140	866	524
6868		\N	\N	เกาะสาหร่าย	91000	866	524
6870		\N	\N	เจ๊ะบิลัง	91000	866	524
172		\N	\N	คลองด่าน	10550	52	215
175		\N	\N	คลองนิยมยาตรา	10560	52	215
173		\N	\N	คลองสวน	10560	52	215
168		\N	\N	บางบ่อ	10560	52	215
170		\N	\N	บางพลีน้อย	10560	52	215
171		\N	\N	บางเพรียง	10560	52	215
169		\N	\N	บ้านระกาศ	10560	52	215
174		\N	\N	เปร็ง	10560	52	215
178		\N	\N	บางปลา	10540	53	215
176		\N	\N	บางพลีใหญ่	10540	53	215
177		\N	\N	บางแก้ว	10540	53	215
179		\N	\N	บางโฉลง	10540	53	215
6371		\N	\N	คลองท่อมเหนือ	81120	802	517
6370		\N	\N	คลองท่อมใต้	81120	802	517
6372		\N	\N	คลองพน	81170	802	517
6373		\N	\N	ทรายขาว	81170	802	517
6375		\N	\N	พรุดินนา	81120	802	517
6374		\N	\N	ห้วยน้ำขาว	81120	802	517
6376		\N	\N	เพหลา	81120	802	517
6389		\N	\N	คีรีวง	81160	804	517
6386		\N	\N	ปลายพระยา	81160	804	517
6388		\N	\N	เขาต่อ	81160	804	517
6387		\N	\N	เขาเขน	81160	804	517
6391		\N	\N	ดินอุดม	81190	805	517
6393		\N	\N	ดินแดง	81190	805	517
6392		\N	\N	ทุ่งไทรทอง	81190	805	517
6390		\N	\N	ลำทับ	81190	805	517
6384		\N	\N	คลองยา	81110	803	517
6380		\N	\N	คลองหิน	81110	803	517
6379		\N	\N	นาเหนือ	81110	803	517
6385		\N	\N	บ้านกลาง	81110	803	517
6381		\N	\N	อ่าวลึกน้อย	81110	803	517
6382		\N	\N	อ่าวลึกเหนือ	81110	803	517
6377		\N	\N	อ่าวลึกใต้	81110	803	517
6383		\N	\N	เขาใหญ่	81110	803	517
6378		\N	\N	แหลมสัก	81110	803	517
6368		\N	\N	คลองยาง	81120	801	517
6369		\N	\N	ศาลาด่าน	81150	801	517
6367		\N	\N	เกาะกลาง	81120	801	517
6366		\N	\N	เกาะลันตาน้อย	81150	801	517
6365		\N	\N	เกาะลันตาใหญ่	81150	801	517
6362		\N	\N	พรุเตียว	81140	800	517
6361		\N	\N	สินปุน	80240	800	517
6363		\N	\N	หน้าเขา	81140	800	517
6360		\N	\N	เขาดิน	81140	800	517
6359		\N	\N	เขาพนม	81140	800	517
6364		\N	\N	โคกหาร	80240	800	517
6351		\N	\N	กระบี่น้อย	81000	799	517
7474		\N	\N	กระบี่ใหญ่	81000	799	517
6358		\N	\N	คลองประสงค์	81000	799	517
6354		\N	\N	ทับปริก	81000	799	517
7475		\N	\N	ปากน้ำ	81000	799	517
6357		\N	\N	หนองทะเล	81180	799	517
6356		\N	\N	อ่าวนาง	81180	799	517
6352		\N	\N	เขาคราม	81000	799	517
6353		\N	\N	เขาทอง	81000	799	517
6355		\N	\N	ไสไทย	81000	799	517
6396		\N	\N	คลองขนาน	81130	806	517
6397		\N	\N	คลองเขม้า	81130	806	517
6399		\N	\N	ตลิ่งชัน	81130	806	517
6400		\N	\N	ปกาสัย	81130	806	517
6401		\N	\N	ห้วยยูง	81130	806	517
6395		\N	\N	เกาะศรีบอยา	81130	806	517
6394		\N	\N	เหนือคลอง	81130	806	517
6398		\N	\N	โคกยาง	81130	806	517
69		\N	\N	คลองต้นไทร	10600	17	111
68		\N	\N	คลองสาน	10600	17	111
70		\N	\N	บางลำภูล่าง	10600	17	111
67		\N	\N	สมเด็จเจ้าพระยา	10600	17	111
147		\N	\N	ทรายกองดิน	10510	46	111
148		\N	\N	ทรายกองดินใต้	10510	46	111
146		\N	\N	บางชัน	10510	46	111
144		\N	\N	สามวาตะวันตก	10510	46	111
145		\N	\N	สามวาตะวันออก	10510	46	111
114		\N	\N	คลองตัน	10110	33	111
113		\N	\N	คลองเตย	10110	33	111
115		\N	\N	พระโขนง	10110	33	111
141		\N	\N	คันนายาว	10230	43	111
7360		\N	\N	รามอินทรา	10230	43	111
7369		\N	\N	จตุจักร	10900	26	111
7370		\N	\N	จอมพล	10900	26	111
7371		\N	\N	จันทรเกษม	10900	26	111
98		\N	\N	ลาดยาว	10900	26	111
7372		\N	\N	เสนานิคม	10900	26	111
126		\N	\N	จอมทอง	10150	36	111
123		\N	\N	บางขุนเทียน	10150	36	111
124		\N	\N	บางค้อ	10150	36	111
125		\N	\N	บางมด	10150	36	111
7358		\N	\N	ดอนเมือง	10210	25	111
7359		\N	\N	สนามบิน	10210	25	111
97		\N	\N	สีกัน	10210	25	111
127		\N	\N	ดินแดง	10400	37	111
32		\N	\N	ดุสิต	10300	7	111
36		\N	\N	ถนนนครไชยศรี	10300	7	111
33		\N	\N	วชิรพยาบาล	10300	7	111
34		\N	\N	สวนจิตรลดา	10300	7	111
35		\N	\N	สี่แยกมหานาค	10300	7	111
78		\N	\N	คลองชักพระ	10170	20	111
80		\N	\N	ฉิมพลี	10170	20	111
79		\N	\N	ตลิ่งชัน	10170	20	111
83		\N	\N	บางพรม	10170	20	111
81		\N	\N	บางระมาด	10170	20	111
4651		\N	\N	ลอ	56150	597	435
82		\N	\N	บางเชือกหนัง	10170	20	111
150		\N	\N	ทวีวัฒนา	10170	48	111
151		\N	\N	ศาลาธรรมสพน์	10170	48	111
152		\N	\N	ทุ่งครุ	10140	49	111
153		\N	\N	บางมด	10140	49	111
7366		\N	\N	ดาวคะนอง	10600	16	111
66		\N	\N	ตลาดพลู	10600	16	111
64		\N	\N	บางยี่เรือ	10600	16	111
65		\N	\N	บุคคโล	10600	16	111
62		\N	\N	วัดกัลยาณ์	10600	16	111
7367		\N	\N	สำเหร่	10600	16	111
63		\N	\N	หิรัญรูจี	10600	16	111
75		\N	\N	บางขุนนนท์	10700	19	111
76		\N	\N	บางขุนศรี	10700	19	111
74		\N	\N	บ้านช่างหล่อ	10700	19	111
73		\N	\N	ศิริราช	10700	19	111
77		\N	\N	อรุณอัมรินทร์	10700	19	111
72		\N	\N	วัดท่าพระ	10600	18	111
71		\N	\N	วัดอรุณ	10600	18	111
43		\N	\N	คลองจั่น	10240	11	111
42		\N	\N	หัวหมาก	10240	11	111
93		\N	\N	ท่าข้าม	10150	23	111
94		\N	\N	แสมดำ	10150	23	111
105		\N	\N	บางคอแหลม	10120	30	111
107		\N	\N	บางโคล่	10120	30	111
106		\N	\N	วัดพระยาไกร	10120	30	111
108		\N	\N	บางซื่อ	10800	31	111
7368		\N	\N	วงศ์สว่าง	10800	31	111
149		\N	\N	บางนา	10260	47	111
154		\N	\N	บางบอน	10150	50	111
121		\N	\N	บางบำหรุ	10700	35	111
119		\N	\N	บางพลัด	10700	35	111
122		\N	\N	บางยี่ขัน	10700	35	111
120		\N	\N	บางอ้อ	10700	35	111
24		\N	\N	บางรัก	10500	4	111
21		\N	\N	มหาพฤฒาราม	10500	4	111
22		\N	\N	สีลม	10500	4	111
25		\N	\N	สี่พระยา	10500	4	111
23		\N	\N	สุริยวงศ์	10500	4	111
45		\N	\N	ท่าแร้ง	10220	12	111
44		\N	\N	อนุสาวรีย์	10220	12	111
132		\N	\N	บางแค	10160	40	111
133		\N	\N	บางแคเหนือ	10160	40	111
134		\N	\N	บางไผ่	10160	40	111
135		\N	\N	หลักสอง	10160	40	111
101		\N	\N	คลองกุ่ม	10230	28	111
7361		\N	\N	นวมินทร์	10230	28	111
7362		\N	\N	นวลจันทร์	10230	28	111
28		\N	\N	ปทุมวัน	10330	5	111
26		\N	\N	รองเมือง	10330	5	111
29		\N	\N	ลุมพินี	10330	5	111
27		\N	\N	วังใหม่	10330	5	111
118		\N	\N	ดอกไม้	10250	34	111
116		\N	\N	ประเวศ	10250	34	111
117		\N	\N	หนองบอน	10250	34	111
15		\N	\N	คลองมหานาค	10100	2	111
16		\N	\N	บ้านบาตร	10100	2	111
13		\N	\N	ป้อมปราบ	10100	2	111
14		\N	\N	วัดเทพศิรินทร์	10100	2	111
17		\N	\N	วัดโสมนัส	10100	2	111
37		\N	\N	สามเสนใน	10400	8	111
9		\N	\N	ชนะสงคราม	10200	1	111
8		\N	\N	ตลาดยอด	10200	1	111
7		\N	\N	บวรนิเวศ	10200	1	111
11		\N	\N	บางขุนพรหม	10200	1	111
10		\N	\N	บ้านพานถม	10200	1	111
1		\N	\N	พระบรมมหาราชวัง	10200	1	111
2		\N	\N	วังบูรพาภิรมย์	10200	1	111
3		\N	\N	วัดราชบพิธ	10200	1	111
12		\N	\N	วัดสามพระยา	10200	1	111
5		\N	\N	ศาลเจ้าพ่อเสือ	10200	1	111
4		\N	\N	สำราญราษฎร์	10200	1	111
6		\N	\N	เสาชิงช้า	10200	1	111
41		\N	\N	บางจาก	10260	10	111
88		\N	\N	คลองขวาง	10160	21	111
90		\N	\N	คูหาสวรรค์	10160	21	111
86		\N	\N	บางจาก	10160	21	111
85		\N	\N	บางด้วน	10160	21	111
84		\N	\N	บางหว้า	10160	21	111
87		\N	\N	บางแวก	10160	21	111
89		\N	\N	ปากคลองภาษีเจริญ	10160	21	111
46		\N	\N	มีนบุรี	10510	13	111
47		\N	\N	แสนแสบ	10510	13	111
30		\N	\N	ช่องนนทรี	10120	6	111
31		\N	\N	บางโพงพาง	10120	6	111
110		\N	\N	ถนนพญาไท	10400	32	111
111		\N	\N	ถนนเพชรบุรี	10400	32	111
109		\N	\N	ทุ่งพญาไท	10400	32	111
112		\N	\N	มักกะสัน	10400	32	111
96		\N	\N	บางปะกอก	10140	24	111
95		\N	\N	ราษฎร์บูรณะ	10140	24	111
53		\N	\N	ขุมทอง	10520	14	111
49		\N	\N	คลองสองต้นนุ่น	10520	14	111
50		\N	\N	คลองสามประเวศ	10520	14	111
52		\N	\N	ทับยาว	10520	14	111
48		\N	\N	ลาดกระบัง	10520	14	111
51		\N	\N	ลำปลาทิว	10520	14	111
100		\N	\N	จรเข้บัว	10230	27	111
99		\N	\N	ลาดพร้าว	10230	27	111
7363		\N	\N	คลองเจ้าคุณสิงห์	10310	45	111
7364		\N	\N	พลับพลา	10310	45	111
143		\N	\N	วังทองหลาง	10310	45	111
7365		\N	\N	สะพานสอง	10310	45	111
130		\N	\N	คลองตันเหนือ	10110	39	111
129		\N	\N	คลองเตยเหนือ	10110	39	111
131		\N	\N	พระโขนงเหนือ	10110	39	111
128		\N	\N	สวนหลวง	10250	38	111
142		\N	\N	สะพานสูง	10240	44	111
18		\N	\N	จักรวรรดิ์	10100	3	111
20		\N	\N	ตลาดน้อย	10100	3	111
19		\N	\N	สัมพันธวงศ์	10100	3	111
104		\N	\N	ทุ่งมหาเมฆ	10120	29	111
102		\N	\N	ทุ่งวัดดอน	10120	29	111
103		\N	\N	ยานนาวา	10120	29	111
140		\N	\N	คลองถนน	10220	42	111
138		\N	\N	สายไหม	10220	42	111
139		\N	\N	ออเงิน	10220	42	111
54		\N	\N	กระทุ่มราย	10530	15	111
56		\N	\N	คลองสิบ	10530	15	111
57		\N	\N	คลองสิบสอง	10530	15	111
59		\N	\N	คู้ฝั่งเหนือ	10530	15	111
61		\N	\N	ลำต้อยติ่ง	10530	15	111
60		\N	\N	ลำผักชี	10530	15	111
55		\N	\N	หนองจอก	10530	15	111
58		\N	\N	โคกแฝด	10530	15	111
92		\N	\N	หนองค้างพลู	10160	22	111
91		\N	\N	หนองแขม	10160	22	111
137		\N	\N	ตลาดบางเขน	10210	41	111
136		\N	\N	ทุ่งสองห้อง	10210	41	111
39		\N	\N	บางกะปิ	10310	9	111
5700		\N	\N	นาสวน	71250	727	243
40		\N	\N	สามเสนนอก	10310	9	111
38		\N	\N	ห้วยขวาง	10310	9	111
5760		\N	\N	กลอนโด	71260	734	243
5761		\N	\N	จรเข้เผือก	71260	734	243
5759		\N	\N	ด่านมะขามเตี้ย	71260	734	243
5762		\N	\N	หนองไผ่	71260	734	243
5740		\N	\N	ชะแล	71180	730	243
5736		\N	\N	ท่าขนุน	71180	730	243
5737		\N	\N	ปิล๊อก	71180	730	243
5739		\N	\N	ลิ่นถิ่น	71180	730	243
5742		\N	\N	สหกรณ์นิคม	71180	730	243
5738		\N	\N	หินดาด	71180	730	243
5741		\N	\N	ห้วยเขย่ง	71180	730	243
5714		\N	\N	ดอนขมิ้น	71120	728	243
5708		\N	\N	ดอนชะเอม	71130	728	243
5710		\N	\N	ตะคร้ำเอน	71130	728	243
5711		\N	\N	ท่ามะกา	71120	728	243
5712		\N	\N	ท่าเรือ	71130	728	243
5721		\N	\N	ท่าเสา	71120	728	243
5709		\N	\N	ท่าไม้	71120	728	243
5706		\N	\N	พงตึก	71120	728	243
5717		\N	\N	พระแท่น	71130	728	243
5707		\N	\N	ยางม่วง	71120	728	243
5720		\N	\N	สนามแย้	70190	728	243
5722		\N	\N	หนองลาน	71130	728	243
5718		\N	\N	หวายเหนียว	71120	728	243
5715		\N	\N	อุโลกสี่หมื่น	71130	728	243
5716		\N	\N	เขาสามสิบหาบ	71120	728	243
5719		\N	\N	แสนตอ	71130	728	243
5713		\N	\N	โคกตะบอง	71120	728	243
5728		\N	\N	ทุ่งทอง	71110	729	243
5733		\N	\N	ท่าตะคร้อ	71130	729	243
5723		\N	\N	ท่าม่วง	71110	729	243
5726		\N	\N	ท่าล้อ	71000	729	243
5731		\N	\N	บ้านใหม่	71110	729	243
5732		\N	\N	พังตรุ	71110	729	243
5730		\N	\N	ม่วงชุม	71110	729	243
5734		\N	\N	รางสาลี่	71110	729	243
5724		\N	\N	วังขนาย	71110	729	243
5725		\N	\N	วังศาลา	71110	729	243
5727		\N	\N	หนองขาว	71110	729	243
5735		\N	\N	หนองตากยา	71110	729	243
5729		\N	\N	เขาน้อย	71110	729	243
5698		\N	\N	ช่องด่าน	71160	726	243
5694		\N	\N	บ่อพลอย	71160	726	243
5699		\N	\N	หนองกร่าง	71220	726	243
5695		\N	\N	หนองกุ่ม	71160	726	243
5696		\N	\N	หนองรี	71220	726	243
5697		\N	\N	หลุมรัง	71160	726	243
7460		\N	\N	ดอนตาเพชร	71140	732	243
5749		\N	\N	ดอนเจดีย์	71140	732	243
5748		\N	\N	ทุ่งสมอ	71140	732	243
5746		\N	\N	พนมทวน	71140	732	243
7461		\N	\N	พังตรุ	71140	732	243
5750		\N	\N	รางหวาย	71170	732	243
5751		\N	\N	หนองสาหร่าย	71140	732	243
5747		\N	\N	หนองโรง	71140	732	243
5701		\N	\N	ด่านแม่แฉลบ	71250	727	243
5703		\N	\N	ท่ากระดาน	71250	727	243
5702		\N	\N	หนองเป็ด	71250	727	243
5704		\N	\N	เขาโจด	71220	727	243
5705		\N	\N	แม่กระบุง	71250	727	243
5744		\N	\N	ปรังเผล	71240	731	243
5743		\N	\N	หนองลู	71240	731	243
5745		\N	\N	ไล่โว่	71240	731	243
5765		\N	\N	สมเด็จเจริญ	71220	735	243
5763		\N	\N	หนองปรือ	71220	735	243
5764		\N	\N	หนองปลาไหล	71220	735	243
5768		\N	\N	ดอนแสลบ	71170	736	243
5767		\N	\N	วังไผ่	71170	736	243
5769		\N	\N	สระลงเรือ	71170	736	243
5766		\N	\N	ห้วยกระเจา	71170	736	243
5682		\N	\N	ช่องสะเดา	71190	724	243
5677		\N	\N	ท่ามะขาม	71000	724	243
5685		\N	\N	บ้านเก่า	71000	724	243
7458		\N	\N	บ้านเหนือ	71000	724	243
7459		\N	\N	บ้านใต้	71000	724	243
5676		\N	\N	ปากแพรก	71000	724	243
5680		\N	\N	ลาดหญ้า	71190	724	243
5681		\N	\N	วังด้ง	71190	724	243
5686		\N	\N	วังเย็น	71000	724	243
5679		\N	\N	หนองบัว	71190	724	243
5683		\N	\N	หนองหญ้า	71000	724	243
5684		\N	\N	เกาะสำโรง	71000	724	243
5678		\N	\N	แก่งเสี้ยน	71000	724	243
5757		\N	\N	ทุ่งกระบ่ำ	71210	733	243
5756		\N	\N	หนองนกแก้ว	71210	733	243
5754		\N	\N	หนองประดู่	71210	733	243
5755		\N	\N	หนองปลิง	71210	733	243
5758		\N	\N	หนองฝ้าย	71210	733	243
5753		\N	\N	หนองโสน	71210	733	243
5752		\N	\N	เลาขวัญ	71210	733	243
5688		\N	\N	ท่าเสา	71150	725	243
5693		\N	\N	บ้องตี้	71150	725	243
5687		\N	\N	ลุ่มสุ่ม	71150	725	243
5691		\N	\N	วังกระแจะ	71150	725	243
5692		\N	\N	ศรีมงคล	71150	725	243
5689		\N	\N	สิงห์	71150	725	243
5690		\N	\N	ไทรโยค	71150	725	243
3692		\N	\N	กมลาไสย	46130	466	327
3695		\N	\N	ดงลิง	46130	466	327
3696		\N	\N	ธัญญา	46130	466	327
3697		\N	\N	หนองแปน	46130	466	327
3693		\N	\N	หลักเมือง	46130	466	327
3698		\N	\N	เจ้าท่า	46130	466	327
3699		\N	\N	โคกสมบูรณ์	46130	466	327
3694		\N	\N	โพนงาม	46130	466	327
3715		\N	\N	กุดค้าว	46110	468	327
3708		\N	\N	กุดหว้า	46110	468	327
3706		\N	\N	จุมจัง	46110	468	327
3710		\N	\N	นาขาม	46110	468	327
3713		\N	\N	นาโก	46110	468	327
3703		\N	\N	บัวขาว	46110	468	327
3714		\N	\N	สมสะอาด	46110	468	327
3709		\N	\N	สามขา	46110	468	327
3712		\N	\N	หนองห้าง	46110	468	327
3705		\N	\N	เหล่าใหญ่	46110	468	327
3707		\N	\N	เหล่าไฮงาม	46110	468	327
3704		\N	\N	แจนแลน	46110	468	327
3755		\N	\N	ดินจี่	46180	473	327
3753		\N	\N	ทุ่งคลอง	46180	473	327
3757		\N	\N	นาทัน	46180	473	327
3756		\N	\N	นาบอน	46180	473	327
3758		\N	\N	เนินยาง	46180	473	327
3754		\N	\N	โพน	46180	473	327
3800		\N	\N	ฆ้องชัยพัฒนา	46130	481	327
3804		\N	\N	ลำชี	46130	481	327
3801		\N	\N	เหล่ากลาง	46130	481	327
3802		\N	\N	โคกสะอาด	46130	481	327
3803		\N	\N	โนนศิลาเลิง	46130	481	327
3797		\N	\N	ดงพยุง	46000	480	327
3795		\N	\N	ดอนจาน	46000	480	327
3799		\N	\N	นาจำปา	46000	480	327
3798		\N	\N	ม่วงนา	46000	480	327
3796		\N	\N	สะอาดไชยศรี	46000	480	327
3760		\N	\N	กุงเก่า	46190	474	327
3762		\N	\N	กุดจิก	46190	474	327
3764		\N	\N	ดงสมบูรณ์	46190	474	327
3759		\N	\N	ท่าคันโท	46190	474	327
3763		\N	\N	นาตาล	46190	474	327
3761		\N	\N	ยางอู้ม	46190	474	327
3790		\N	\N	นาคู	46160	479	327
3793		\N	\N	บ่อแก้ว	46160	479	327
3794		\N	\N	ภูแล่นช้าง	46160	479	327
3791		\N	\N	สายนาวัง	46160	479	327
3792		\N	\N	โนนนาจาน	46160	479	327
3686		\N	\N	นามน	46230	465	327
3687		\N	\N	ยอดแกง	46230	465	327
3688		\N	\N	สงเปลือย	46230	465	327
3691		\N	\N	หนองบัว	46230	465	327
3690		\N	\N	หลักเหลี่ยม	46230	465	327
3731		\N	\N	คลองขาม	46120	470	327
3729		\N	\N	ดอนสมบูรณ์	46120	470	327
3733		\N	\N	นาดี	46120	470	327
3730		\N	\N	นาเชือก	46120	470	327
3724		\N	\N	บัวบาน	46120	470	327
3721		\N	\N	ยางตลาด	46120	470	327
3735		\N	\N	หนองตอกแป้น	46120	470	327
3728		\N	\N	หนองอิเฒ่า	46120	470	327
3722		\N	\N	หัวงัว	46120	470	327
3727		\N	\N	หัวนาคำ	46120	470	327
3726		\N	\N	อิตื้อ	46120	470	327
3723		\N	\N	อุ่มเม่า	46120	470	327
3732		\N	\N	เขาพระนอน	46120	470	327
3725		\N	\N	เว่อ	46120	470	327
3734		\N	\N	โนนสูง	46120	470	327
3700		\N	\N	ร่องคำ	46210	467	327
3701		\N	\N	สามัคคี	46210	467	327
3702		\N	\N	เหล่าอ้อย	46210	467	327
3779		\N	\N	ผาเสวย	46150	476	327
3777		\N	\N	มหาไชย	46150	476	327
3781		\N	\N	ลำห้วยหลัว	46150	476	327
3780		\N	\N	ศรีสมเด็จ	46150	476	327
3774		\N	\N	สมเด็จ	46150	476	327
3775		\N	\N	หนองแวง	46150	476	327
3778		\N	\N	หมูม่น	46150	476	327
3776		\N	\N	แซงบาดาล	46150	476	327
3747		\N	\N	นามะเขือ	46140	472	327
3749		\N	\N	นิคม	46140	472	327
3745		\N	\N	ภูสิงห์	46140	472	327
3746		\N	\N	สหัสขันธ์	46140	472	327
3752		\N	\N	โนนน้ำเกลี้ยง	46140	472	327
3751		\N	\N	โนนบุรี	46140	472	327
3748		\N	\N	โนนศิลา	46140	472	327
3750		\N	\N	โนนแหลมทอง	46140	472	327
3788		\N	\N	คำสร้างเที่ยง	46180	478	327
3786		\N	\N	สำราญ	46180	478	327
3787		\N	\N	สำราญใต้	46180	478	327
3789		\N	\N	หนองช้าง	46180	478	327
3771		\N	\N	ดงมูล	46220	475	327
3772		\N	\N	ลำหนองแสน	46220	475	327
3765		\N	\N	หนองกุงศรี	46220	475	327
3766		\N	\N	หนองบัว	46220	475	327
3768		\N	\N	หนองสรวง	46220	475	327
3773		\N	\N	หนองหิน	46220	475	327
3770		\N	\N	หนองใหญ่	46220	475	327
3769		\N	\N	เสาเล้า	46220	475	327
3767		\N	\N	โคกเครือ	46220	475	327
3782		\N	\N	คำบง	46240	477	327
3784		\N	\N	นิคมห้วยผึ้ง	46240	477	327
3785		\N	\N	หนองอีบุตร	46240	477	327
3783		\N	\N	ไค้นุ่น	46240	477	327
3738		\N	\N	กุดโดน	46170	471	327
3742		\N	\N	คำเหมือดแก้ว	46170	471	327
3737		\N	\N	คำใหญ่	46170	471	327
3744		\N	\N	ทรายทอง	46170	471	327
3739		\N	\N	บึงนาเรียง	46170	471	327
3741		\N	\N	พิมูล	46170	471	327
3740		\N	\N	หัวหิน	46170	471	327
3736		\N	\N	ห้วยเม็ก	46170	471	327
3743		\N	\N	โนนสะอาด	46170	471	327
3720		\N	\N	กุดปลาค้าว	46160	469	327
3718		\N	\N	กุดสิมคุ้มใหม่	46160	469	327
3716		\N	\N	คุ้มเก่า	46160	469	327
3689		\N	\N	สงเปลือย	46160	469	327
3719		\N	\N	สระพังทอง	46160	469	327
3717		\N	\N	หนองผือ	46160	469	327
3681		\N	\N	กลางหมื่น	46000	464	327
3669		\N	\N	กาฬสินธุ์	46000	464	327
3682		\N	\N	ขมิ้น	46000	464	327
3684		\N	\N	นาจารย์	46000	464	327
3676		\N	\N	บึงวิชัย	46000	464	327
3679		\N	\N	ภูดิน	46000	464	327
3678		\N	\N	ภูปอ	46000	464	327
3685		\N	\N	ลำคลอง	46000	464	327
3673		\N	\N	ลำปาว	46000	464	327
3674		\N	\N	ลำพาน	46000	464	327
3680		\N	\N	หนองกุง	46000	464	327
3671		\N	\N	หลุบ	46000	464	327
3677		\N	\N	ห้วยโพธิ์	46000	464	327
3675		\N	\N	เชียงเครือ	46000	464	327
3670		\N	\N	เหนือ	46000	464	327
3683		\N	\N	โพนทอง	46000	464	327
3672		\N	\N	ไผ่	46000	464	327
5093		\N	\N	ดอนแตง	62140	656	414
5092		\N	\N	บ่อถ้ำ	62140	656	414
5096		\N	\N	ปางมะค่า	62140	656	414
5089		\N	\N	ป่าพุทรา	62130	656	414
5088		\N	\N	ยางสูง	62130	656	414
5094		\N	\N	วังชะพลู	62140	656	414
5097		\N	\N	วังหามแห	62140	656	414
5091		\N	\N	สลกบาตร	62140	656	414
5098		\N	\N	เกาะตาล	62130	656	414
5090		\N	\N	แสนตอ	62130	656	414
5095		\N	\N	โค้งไผ่	62140	656	414
5099		\N	\N	คลองขลุง	62120	657	414
5108		\N	\N	คลองสมบูรณ์	62120	657	414
5101		\N	\N	ท่าพุทรา	62120	657	414
5100		\N	\N	ท่ามะเขือ	62120	657	414
5107		\N	\N	วังบัว	62120	657	414
5103		\N	\N	วังยาง	62120	657	414
5104		\N	\N	วังแขม	62120	657	414
5106		\N	\N	วังไทร	62120	657	414
5105		\N	\N	หัวถนน	62120	657	414
5102		\N	\N	แม่ลาด	62120	657	414
5085		\N	\N	คลองน้ำไหล	62180	655	414
5087		\N	\N	คลองลานพัฒนา	62180	655	414
7450		\N	\N	สักงาม	62180	655	414
5086		\N	\N	โป่งน้ำร้อน	62180	655	414
5125		\N	\N	ถาวรวัฒนา	62190	660	414
5123		\N	\N	ทุ่งทราย	62190	660	414
5124		\N	\N	ทุ่งทอง	62190	660	414
5129		\N	\N	บึงสามัคคี	62210	662	414
5131		\N	\N	ระหาน	62210	662	414
5130		\N	\N	วังชะโอน	62210	662	414
7451		\N	\N	เทพนิมิต	62210	662	414
5128		\N	\N	ปางตาไว	62120	661	414
5127		\N	\N	หินดาต	62120	661	414
5126		\N	\N	โพธิ์ทอง	62120	661	414
7447		\N	\N	คลองพิไกร	62110	658	414
5115		\N	\N	คุยบ้านโอง	62110	658	414
5116		\N	\N	ถ้ำกระต่ายทอง	62110	658	414
5111		\N	\N	ท่าไม้	62110	658	414
5109		\N	\N	พรานกระต่าย	62110	658	414
5112		\N	\N	วังควง	62110	658	414
5113		\N	\N	วังตะแบก	62110	658	414
5110		\N	\N	หนองหัววัว	62110	658	414
7448		\N	\N	ห้วยยั้ง	62110	658	414
5114		\N	\N	เขาคีริส	62110	658	414
7449		\N	\N	จันทิมา	62170	659	414
5118		\N	\N	ช่องลม	62170	659	414
5122		\N	\N	บึงทับแรต	62170	659	414
5121		\N	\N	ประชาสุขสันต์	62170	659	414
5117		\N	\N	ลานกระบือ	62170	659	414
5119		\N	\N	หนองหลวง	62170	659	414
5120		\N	\N	โนนพลวง	62170	659	414
5072		\N	\N	คณฑี	62000	653	414
5077		\N	\N	คลองแม่ลาย	62000	653	414
5069		\N	\N	ทรงธรรม	62000	653	414
5076		\N	\N	ท่าขุนราม	62000	653	414
7304		\N	\N	ธำมรงค์	62160	653	414
5068		\N	\N	นครชุม	62000	653	414
5067		\N	\N	นาบ่อคำ	62000	653	414
5073		\N	\N	นิคมทุ่งโพธิ์ทะเล	62000	653	414
5070		\N	\N	ลานดอกไม้	62000	653	414
5075		\N	\N	วังทอง	62000	653	414
7446		\N	\N	สระแก้ว	62000	653	414
5071		\N	\N	หนองปลิง	62000	653	414
5066		\N	\N	อ่างทอง	62000	653	414
5074		\N	\N	เทพนคร	62000	653	414
5064		\N	\N	ในเมือง	62000	653	414
5065		\N	\N	ไตรตรึงษ์	62160	653	414
5134		\N	\N	ลานดอกไม้ตก	62000	663	414
5133		\N	\N	เพชรชมภู	62000	663	414
5132		\N	\N	โกสัมพี	62000	663	414
5083		\N	\N	พานทอง	62150	654	414
5082		\N	\N	มหาชัย	62150	654	414
5079		\N	\N	หนองคล้า	62150	654	414
5080		\N	\N	หนองทอง	62150	654	414
5084		\N	\N	หนองแม่แตง	62150	654	414
5081		\N	\N	หนองไม้กอง	62150	654	414
5078		\N	\N	ไทรงาม	62150	654	414
2870		\N	\N	ดูนสาด	40170	363	321
2872		\N	\N	น้ำอ้อม	40170	363	321
2869		\N	\N	บ้านฝาง	40170	363	321
2866		\N	\N	หนองกุงใหญ่	40170	363	321
2865		\N	\N	หนองโก	40170	363	321
2871		\N	\N	หนองโน	40170	363	321
2873		\N	\N	หัวนาคำ	40170	363	321
2868		\N	\N	ห้วยยาง	40170	363	321
2867		\N	\N	ห้วยโจด	40170	363	321
2947		\N	\N	กุดเพียขอม	40180	372	321
2946		\N	\N	ชนบท	40180	372	321
2950		\N	\N	บ้านแท่น	40180	372	321
2953		\N	\N	ปอแดง	40180	372	321
2948		\N	\N	วังแสง	40180	372	321
2951		\N	\N	ศรีบุญเรือง	40180	372	321
2949		\N	\N	ห้วยแก	40180	372	321
2952		\N	\N	โนนพะยอม	40180	372	321
2829		\N	\N	ขัวเรียง	40130	359	321
2825		\N	\N	ชุมแพ	40130	359	321
2827		\N	\N	นาหนองทุ่ม	40290	359	321
2833		\N	\N	นาเพียง	40130	359	321
2832		\N	\N	วังหินลาด	40130	359	321
2834		\N	\N	หนองเขียด	40290	359	321
2835		\N	\N	หนองเสาเล้า	40130	359	321
2830		\N	\N	หนองไผ่	40130	359	321
2836		\N	\N	โนนสะอาด	40290	359	321
2826		\N	\N	โนนหัน	40290	359	321
2828		\N	\N	โนนอุดม	40130	359	321
2831		\N	\N	ไชยสอ	40130	359	321
2964		\N	\N	กระนวน	40170	375	321
2965		\N	\N	คำแมด	40170	375	321
2967		\N	\N	คูคำ	40170	375	321
2966		\N	\N	บ้านโนน	40170	375	321
2968		\N	\N	ห้วยเตย	40170	375	321
2858		\N	\N	กุดน้ำใส	40310	361	321
2855		\N	\N	ทรายมูล	40140	361	321
2856		\N	\N	ท่ากระเสริม	40140	361	321
2847		\N	\N	น้ำพอง	40140	361	321
2854		\N	\N	บัวเงิน	40140	361	321
2850		\N	\N	บัวใหญ่	40140	361	321
2853		\N	\N	บ้านขาม	40140	361	321
2857		\N	\N	พังทุย	40140	361	321
2852		\N	\N	ม่วงหวาน	40310	361	321
2848		\N	\N	วังชัย	40140	361	321
2851		\N	\N	สะอาด	40310	361	321
2849		\N	\N	หนองกุง	40140	361	321
2808		\N	\N	บ้านฝาง	40270	356	321
2806		\N	\N	บ้านเหล่า	40270	356	321
2807		\N	\N	ป่ามะนาว	40270	356	321
2804		\N	\N	ป่าหวายนั่ง	40270	356	321
2803		\N	\N	หนองบัว	40270	356	321
2809		\N	\N	โคกงาม	40270	356	321
2805		\N	\N	โนนฆ้อง	40270	356	321
2976		\N	\N	บ้านแฮด	40110	378	321
2979		\N	\N	หนองแซง	40110	378	321
2977		\N	\N	โคกสำราญ	40110	378	321
2978		\N	\N	โนนสมบูรณ์	40110	378	321
2877		\N	\N	บ้านลาน	40110	364	321
2884		\N	\N	บ้านไผ่	40110	364	321
2874		\N	\N	บ้านไผ่	40110	364	321
2880		\N	\N	ป่าปอ	40110	364	321
2879		\N	\N	ภูเหล็ก	40110	364	321
2882		\N	\N	หนองน้ำใส	40110	364	321
2883		\N	\N	หัวหนอง	40110	364	321
2881		\N	\N	หินตั้ง	40110	364	321
2876		\N	\N	เมืองเพีย	40110	364	321
2878		\N	\N	แคนเหนือ	40110	364	321
2875		\N	\N	ในเมือง	40110	364	321
2814		\N	\N	ขามป้อม	40320	357	321
2812		\N	\N	บ้านโต้น	40320	357	321
2811		\N	\N	พระบุ	40320	357	321
2810		\N	\N	พระยืน	40320	357	321
2813		\N	\N	หนองแวง	40320	357	321
2897		\N	\N	ลอมคอม	40120	366	321
2892		\N	\N	หนองมะเขือ	40120	366	321
2896		\N	\N	หนองแวงนางเบ้า	40120	366	321
2893		\N	\N	หนองแวงโสกพระ	40120	366	321
2900		\N	\N	หัวทุ่ง	40120	366	321
2891		\N	\N	เก่างิ้ว	40120	366	321
2894		\N	\N	เพ็กใหญ่	40120	366	321
2889		\N	\N	เมืองพล	40120	366	321
2895		\N	\N	โคกสง่า	40120	366	321
2890		\N	\N	โจดหนองแก	40120	366	321
2898		\N	\N	โนนข่า	40120	366	321
2899		\N	\N	โสกนกเต็น	40120	366	321
2960		\N	\N	นาฝาย	40350	374	321
2961		\N	\N	ภูผาม่าน	40350	374	321
2962		\N	\N	วังสวาบ	40350	374	321
2963		\N	\N	ห้วยม่วง	40350	374	321
2959		\N	\N	โนนคอม	40350	374	321
2927		\N	\N	กุดขอนแก่น	40150	370	321
2936		\N	\N	ดินดำ	40150	370	321
2934		\N	\N	ทุ่งชมพู	40150	370	321
2928		\N	\N	นาชุมแสง	40150	370	321
2929		\N	\N	นาหว้า	40150	370	321
2924		\N	\N	บ้านเรือ	40150	370	321
2937		\N	\N	ภูเวียง	40150	370	321
2933		\N	\N	สงเปือย	40150	370	321
2931		\N	\N	หนองกุงธนสาร	40150	370	321
2932		\N	\N	หนองกุงเซิน	40150	370	321
2926		\N	\N	หว้าทอง	40150	370	321
2930		\N	\N	เขาน้อย	40150	370	321
2935		\N	\N	เมืองเก่าพัฒนา	40150	370	321
2925		\N	\N	ในเมือง	40150	370	321
2938		\N	\N	กุดเค้า	40160	371	321
2942		\N	\N	คำแคน	40160	371	321
2945		\N	\N	ท่าศาลา	40160	371	321
2943		\N	\N	นาข่า	40160	371	321
2944		\N	\N	นางาม	40160	371	321
2939		\N	\N	สวนหม่อน	40160	371	321
2940		\N	\N	หนองแปน	40160	371	321
2941		\N	\N	โพนเพ็ก	40160	371	321
2841		\N	\N	ซำยาง	40220	360	321
2843		\N	\N	ดงลาน	40220	360	321
2839		\N	\N	นาจาน	40220	360	321
2844		\N	\N	บริบูรณ์	40220	360	321
2845		\N	\N	บ้านใหม่	40220	360	321
2846		\N	\N	ภูห่าน	40220	360	321
2840		\N	\N	วังเพิ่ม	40220	360	321
2838		\N	\N	ศรีสุข	40220	360	321
2837		\N	\N	สีชมพู	40220	360	321
2842		\N	\N	หนองแดง	40220	360	321
2973		\N	\N	กุดธาตุ	40150	377	321
2975		\N	\N	ขนวน	40150	377	321
2974		\N	\N	บ้านโคก	40150	377	321
2913		\N	\N	คึมชาด	40190	369	321
2919		\N	\N	ดงเค็ง	40190	369	321
2921		\N	\N	ดอนดั่ง	40190	369	321
2918		\N	\N	ดอนดู่	40190	369	321
2915		\N	\N	ตะกั่วป่า	40190	369	321
2922		\N	\N	วังหิน	40190	369	321
2916		\N	\N	สำโรง	40190	369	321
2912		\N	\N	หนองสองห้อง	40190	369	321
2917		\N	\N	หนองเม็ก	40190	369	321
2923		\N	\N	หนองไผ่ล้อม	40190	369	321
2920		\N	\N	หันโจด	40190	369	321
2914		\N	\N	โนนธาตุ	40190	369	321
2821		\N	\N	กุดกว้าง	40210	358	321
2819		\N	\N	จระเข้	40240	358	321
2817		\N	\N	บ้านกง	40240	358	321
2824		\N	\N	บ้านผือ	40240	358	321
2816		\N	\N	บ้านเม็ง	40210	358	321
2818		\N	\N	ยางคำ	40240	358	321
2815		\N	\N	หนองเรือ	40210	358	321
2820		\N	\N	โนนทอง	40210	358	321
2822		\N	\N	โนนทัน	40210	358	321
2823		\N	\N	โนนสะอาด	40210	358	321
2864		\N	\N	ทุ่งโป่ง	40250	362	321
2862		\N	\N	นาคำ	40250	362	321
2860		\N	\N	บ้านดง	40250	362	321
2863		\N	\N	ศรีสุขสำราญ	40250	362	321
2861		\N	\N	เขื่อนอุบลรัตน์	40250	362	321
2859		\N	\N	โคกสูง	40250	362	321
2958		\N	\N	คำม่วง	40280	373	321
2955		\N	\N	ดงเมืองแอม	40280	373	321
2956		\N	\N	นางิ้ว	40280	373	321
2954		\N	\N	เขาสวนกวาง	40280	373	321
2957		\N	\N	โนนสมบูรณ์	40280	373	321
2887		\N	\N	ขามป้อม	40340	365	321
2886		\N	\N	วังม่วง	40340	365	321
2888		\N	\N	สระแก้ว	40340	365	321
2885		\N	\N	เปือยน้อย	40340	365	321
2796		\N	\N	ดอนช้าง	40000	355	321
2797		\N	\N	ดอนหัน	40260	355	321
2788		\N	\N	ท่าพระ	40260	355	321
2801		\N	\N	บึงเนียม	40000	355	321
2794		\N	\N	บ้านค้อ	40000	355	321
2789		\N	\N	บ้านทุ่ม	40000	355	321
2793		\N	\N	บ้านหว้า	40000	355	321
2799		\N	\N	บ้านเป็ด	40000	355	321
2791		\N	\N	พระลับ	40000	355	321
2798		\N	\N	ศิลา	40000	355	321
2792		\N	\N	สาวะถี	40000	355	321
2786		\N	\N	สำราญ	40000	355	321
2800		\N	\N	หนองตูม	40000	355	321
2790		\N	\N	เมืองเก่า	40000	355	321
2795		\N	\N	แดงใหญ่	40000	355	321
2787		\N	\N	โคกสี	40000	355	321
2802		\N	\N	โนนท่อน	40000	355	321
2785		\N	\N	ในเมือง	40000	355	321
2907		\N	\N	ก้านเหลือง	40230	368	321
2911		\N	\N	ทางขวาง	40230	368	321
2908		\N	\N	ท่านางแนว	40230	368	321
2910		\N	\N	ท่าวัด	40230	368	321
2909		\N	\N	ละหานนา	40230	368	321
2906		\N	\N	แวงน้อย	40230	368	321
2901		\N	\N	คอนฉิม	40330	367	321
2904		\N	\N	แวงใหญ่	40330	367	321
2903		\N	\N	โนนทอง	40330	367	321
2905		\N	\N	โนนสะอาด	40330	367	321
2902		\N	\N	ใหม่นาเพียง	40330	367	321
2971		\N	\N	ซับสมบูรณ์	40160	376	321
2972		\N	\N	นาแพง	40160	376	321
2969		\N	\N	บ้านโคก	40160	376	321
2970		\N	\N	โพธิ์ไชย	40160	376	321
2982		\N	\N	บ้านหัน	40110	379	321
2981		\N	\N	หนองปลาหมอ	40110	379	321
2983		\N	\N	เปือยใหญ่	40110	379	321
2980		\N	\N	โนนศิลา	40110	379	321
2984		\N	\N	โนนแดง	40110	379	321
1065		\N	\N	ขลุง	22110	151	235
1071		\N	\N	ซึ้ง	22110	151	235
1075		\N	\N	ตกพรม	22110	151	235
1074		\N	\N	ตรอกนอง	22110	151	235
1068		\N	\N	ตะปอน	22110	151	235
1069		\N	\N	บางชัน	22110	151	235
1066		\N	\N	บ่อ	22110	151	235
1076		\N	\N	บ่อเวฬุ	22150	151	235
1072		\N	\N	มาบไพ	22110	151	235
1073		\N	\N	วังสรรพรส	22110	151	235
1070		\N	\N	วันยาว	22110	151	235
1067		\N	\N	เกวียนหัก	22110	151	235
1088		\N	\N	คลองขุด	22120	152	235
1087		\N	\N	ตะกาดเง้า	22120	152	235
1084		\N	\N	ทุ่งเบญจา	22170	152	235
1077		\N	\N	ท่าใหม่	22120	152	235
1079		\N	\N	บ่อพุ	22120	152	235
1080		\N	\N	พลอยแหวน	22120	152	235
7389		\N	\N	ยายร้า	22120	152	235
1085		\N	\N	รำพัน	22170	152	235
1083		\N	\N	สองพี่น้อง	22120	152	235
1078		\N	\N	สีพยา	22120	152	235
1082		\N	\N	เขาบายศรี	22120	152	235
1081		\N	\N	เขาวัว	22120	152	235
1089		\N	\N	เขาแก้ว	22170	152	235
1086		\N	\N	โขมง	22170	152	235
1120		\N	\N	กระแจะ	22170	158	235
1122		\N	\N	ช้างข้าม	22160	158	235
1118		\N	\N	นายายอาม	22160	158	235
1119		\N	\N	วังโตนด	22170	158	235
1123		\N	\N	วังใหม่	22170	158	235
1121		\N	\N	สนามไชย	22170	158	235
1099		\N	\N	ฉมัน	22150	154	235
1096		\N	\N	ท่าหลวง	22150	154	235
1097		\N	\N	ปัถวี	22150	154	235
1095		\N	\N	มะขาม	22150	154	235
1098		\N	\N	วังแซ้ม	22150	154	235
1100		\N	\N	อ่างคีรี	22150	154	235
1111		\N	\N	ทรายขาว	22180	156	235
1110		\N	\N	ทับช้าง	22180	156	235
1109		\N	\N	ทุ่งขนาน	22180	156	235
1108		\N	\N	ปะตง	22180	156	235
1112		\N	\N	สะตอน	22180	156	235
1127		\N	\N	คลองพลู	22210	159	235
1128		\N	\N	จันทเขลม	22210	159	235
1124		\N	\N	ชากไทย	22210	159	235
1126		\N	\N	ตะเคียนทอง	22210	159	235
1125		\N	\N	พลวง	22210	159	235
1058		\N	\N	คมบาง	22000	150	235
1056		\N	\N	คลองนารายณ์	22000	150	235
1060		\N	\N	จันทนิมิต	22000	150	235
7387		\N	\N	ตลาด	22000	150	235
1059		\N	\N	ท่าช้าง	22000	150	235
1061		\N	\N	บางกะจะ	22000	150	235
1064		\N	\N	พลับพลา	22000	150	235
7388		\N	\N	วัดใหม่	22000	150	235
1063		\N	\N	หนองบัว	22000	150	235
1057		\N	\N	เกาะขวาง	22000	150	235
1062		\N	\N	แสลง	22000	150	235
1114		\N	\N	ขุนซ่อง	22220	157	235
1116		\N	\N	พวา	22220	157	235
1115		\N	\N	สามพี่น้อง	22220	157	235
1117		\N	\N	เขาวงกต	22220	157	235
1113		\N	\N	แก่งหางแมว	22220	157	235
1105		\N	\N	คลองน้ำเค็ม	22190	155	235
1107		\N	\N	บางกะไชย	22120	155	235
1106		\N	\N	บางสระเก้า	22190	155	235
1101		\N	\N	ปากน้ำแหลมสิงห์	22130	155	235
1104		\N	\N	พลิ้ว	22190	155	235
1103		\N	\N	หนองชิ่ม	22130	155	235
1102		\N	\N	เกาะเปริด	22130	155	235
1094		\N	\N	คลองใหญ่	22140	153	235
1090		\N	\N	ทับไทร	22140	153	235
1092		\N	\N	หนองตาคง	22140	153	235
1093		\N	\N	เทพนิมิต	22140	153	235
1091		\N	\N	โป่งน้ำร้อน	22140	153	235
1255		\N	\N	ก้อนแก้ว	24000	177	232
1256		\N	\N	คลองเขื่อน	24000	177	232
1259		\N	\N	บางตลาด	24110	177	232
1257		\N	\N	บางเล่า	24000	177	232
1258		\N	\N	บางโรง	24000	177	232
1254		\N	\N	คลองตะเกรา	24160	176	232
1253		\N	\N	ท่าตะเกียบ	24160	176	232
1190		\N	\N	ท่าทองหลาง	24110	168	232
1188		\N	\N	บางกระเจ็ด	24110	168	232
1186		\N	\N	บางคล้า	24110	168	232
1187		\N	\N	บางสวน	24110	168	232
1189		\N	\N	ปากน้ำ	24110	168	232
1191		\N	\N	สาวชะโงก	24110	168	232
1194		\N	\N	หัวไทร	24110	168	232
1192		\N	\N	เสม็ดเหนือ	24110	168	232
1193		\N	\N	เสม็ดใต้	24110	168	232
1202		\N	\N	ดอนฉิมพลี	24170	169	232
1200		\N	\N	ดอนเกาะกา	24170	169	232
1196		\N	\N	บางขนาก	24150	169	232
1195		\N	\N	บางน้ำเปรี้ยว	24150	169	232
1199		\N	\N	บึงน้ำรักษ์	24170	169	232
1203		\N	\N	ศาลาแดง	24000	169	232
1197		\N	\N	สิงโตทอง	24150	169	232
1198		\N	\N	หมอนทอง	24150	169	232
1204		\N	\N	โพรงอากาศ	24150	169	232
1201		\N	\N	โยธะกา	24150	169	232
1214		\N	\N	ท่าข้าม	24130	170	232
1206		\N	\N	ท่าสะอ้าน	24130	170	232
1205		\N	\N	บางปะกง	24130	170	232
1209		\N	\N	บางผึ้ง	24130	170	232
1207		\N	\N	บางวัว	24180	170	232
1208		\N	\N	บางสมัคร	24180	170	232
1210		\N	\N	บางเกลือ	24180	170	232
1213		\N	\N	พิมพา	24180	170	232
1211		\N	\N	สองคลอง	24130	170	232
1212		\N	\N	หนองจอก	24130	170	232
1215		\N	\N	หอมศีล	24180	170	232
1216		\N	\N	เขาดิน	24130	170	232
1219		\N	\N	คลองขุด	24140	171	232
1220		\N	\N	คลองบ้านโพธิ์	24140	171	232
1221		\N	\N	คลองประเวศ	24140	171	232
1222		\N	\N	ดอนทราย	24140	171	232
1224		\N	\N	ท่าพลับ	24140	171	232
1228		\N	\N	บางกรูด	24140	171	232
1227		\N	\N	บางซ่อน	24140	171	232
1217		\N	\N	บ้านโพธิ์	24140	171	232
1230		\N	\N	ลาดขวาง	24140	171	232
1231		\N	\N	สนามจันทร์	24140	171	232
1233		\N	\N	สิบเอ็ดศอก	24140	171	232
1225		\N	\N	หนองตีนนก	24140	171	232
1226		\N	\N	หนองบัว	24140	171	232
1218		\N	\N	เกาะไร่	24140	171	232
1223		\N	\N	เทพราช	24140	171	232
1232		\N	\N	แสนภูดาษ	24140	171	232
1229		\N	\N	แหลมประดู่	24140	171	232
1239		\N	\N	ท่าถ่าน	24120	172	232
1235		\N	\N	บ้านซ่อง	24120	172	232
1236		\N	\N	พนมสารคาม	24120	172	232
1238		\N	\N	หนองยาว	24120	172	232
1240		\N	\N	หนองแหน	24120	172	232
1234		\N	\N	เกาะขนุน	24120	172	232
1241		\N	\N	เขาหินซ้อน	24120	172	232
1237		\N	\N	เมืองเก่า	24120	172	232
1244		\N	\N	ดงน้อย	24120	173	232
1242		\N	\N	บางคา	24120	173	232
1243		\N	\N	เมืองใหม่	24120	173	232
1245		\N	\N	คู้ยายหมี	24160	174	232
1247		\N	\N	ทุ่งพระยา	24160	174	232
1246		\N	\N	ท่ากระดาน	24160	174	232
1248		\N	\N	ลาดกระทิง	24160	174	232
1173		\N	\N	คลองจุกกระเฌอ	24000	167	232
1176		\N	\N	คลองนครเนื่องเขต	24000	167	232
1170		\N	\N	คลองนา	24000	167	232
1184		\N	\N	คลองหลวงแพ่ง	24000	167	232
1183		\N	\N	คลองอุดมชลจร	24000	167	232
1182		\N	\N	คลองเปรง	24000	167	232
1168		\N	\N	ท่าไข่	24000	167	232
1180		\N	\N	บางกะไห	24000	167	232
1175		\N	\N	บางขวัญ	24000	167	232
1171		\N	\N	บางตีนเป็ด	24000	167	232
1179		\N	\N	บางพระ	24000	167	232
1185		\N	\N	บางเตย	24000	167	232
1174		\N	\N	บางแก้ว	24000	167	232
1172		\N	\N	บางไผ่	24000	167	232
1169		\N	\N	บ้านใหม่	24000	167	232
1177		\N	\N	วังตะเคียน	24000	167	232
1181		\N	\N	หนามแดง	24000	167	232
1167		\N	\N	หน้าเมือง	24000	167	232
1178		\N	\N	โสธร	24000	167	232
1250		\N	\N	วังเย็น	24190	175	232
1252		\N	\N	หนองไม้แก่น	24190	175	232
1251		\N	\N	หัวสำโรง	24190	175	232
1249		\N	\N	แปลงยาว	24190	175	232
942		\N	\N	ตะเคียนเตี้ย	20150	134	231
943		\N	\N	นาเกลือ	20150	134	231
936		\N	\N	บางละมุง	20150	134	231
937		\N	\N	หนองปรือ	20150	134	231
966		\N	\N	หนองปรือ	20150	134	231
938		\N	\N	หนองปลาไหล	20150	134	231
941		\N	\N	ห้วยใหญ่	20150	134	231
940		\N	\N	เขาไม้แก้ว	20150	134	231
939		\N	\N	โป่ง	20150	134	231
993		\N	\N	ธาตุทอง	20270	140	231
992		\N	\N	บ่อกวางทอง	20270	140	231
990		\N	\N	บ่อทอง	20270	140	231
995		\N	\N	พลวงทอง	20270	140	231
991		\N	\N	วัดสุวรรณ	20270	140	231
994		\N	\N	เกษตรสุวรรณ	20270	140	231
925		\N	\N	คลองกิ่ว	20220	132	231
924		\N	\N	บ้านบึง	20170	132	231
926		\N	\N	มาบไผ่	20170	132	231
7305		\N	\N	หนองชาก	20170	132	231
927		\N	\N	หนองซ้ำซาก	20170	132	231
928		\N	\N	หนองบอนแดง	20170	132	231
929		\N	\N	หนองอิรุณ	20220	132	231
930		\N	\N	หนองไผ่แก้ว	20220	132	231
963		\N	\N	กุฎโง้ง	20140	136	231
969		\N	\N	ทุ่งขวาง	20140	136	231
965		\N	\N	ท่าข้าม	20140	136	231
975		\N	\N	นามะตูม	20140	136	231
971		\N	\N	นาวังหิน	20140	136	231
959		\N	\N	นาเริก	20140	136	231
972		\N	\N	บ้านช้าง	20140	136	231
958		\N	\N	บ้านเซิด	20140	136	231
955		\N	\N	พนัสนิคม	20140	136	231
957		\N	\N	วัดหลวง	20140	136	231
962		\N	\N	วัดโบสถ์	20140	136	231
961		\N	\N	สระสี่เหลี่ยม	20140	136	231
968		\N	\N	หนองขยาด	20140	136	231
967		\N	\N	หนองปรือ	20140	136	231
970		\N	\N	หนองเหียง	20140	136	231
956		\N	\N	หน้าพระธาตุ	20140	136	231
960		\N	\N	หมอนนาง	20140	136	231
964		\N	\N	หัวถนน	20140	136	231
973		\N	\N	โคกเพลาะ	20140	136	231
974		\N	\N	ไร่หลักทอง	20140	136	231
952		\N	\N	บางนาง	20160	135	231
954		\N	\N	บางหัก	20160	135	231
950		\N	\N	บ้านเก่า	20160	135	231
944		\N	\N	พานทอง	20160	135	231
946		\N	\N	มาบโป่ง	20160	135	231
947		\N	\N	หนองกะขะ	20160	135	231
945		\N	\N	หนองตำลึง	20160	135	231
948		\N	\N	หนองหงษ์	20160	135	231
951		\N	\N	หน้าประดู่	20160	135	231
953		\N	\N	เกาะลอย	20160	135	231
949		\N	\N	โคกขี้หนอน	20160	135	231
978		\N	\N	ทุ่งสุขลา	20230	137	231
982		\N	\N	บางพระ	20110	137	231
979		\N	\N	บึง	20230	137	231
983		\N	\N	บ่อวิน	20230	137	231
976		\N	\N	ศรีราชา	20110	137	231
977		\N	\N	สุรศักดิ์	20110	137	231
980		\N	\N	หนองขาม	20230	137	231
981		\N	\N	เขาคันทรง	20110	137	231
986		\N	\N	นาจอมเทียน	20250	139	231
988		\N	\N	บางเสร่	20250	139	231
987		\N	\N	พลูตาหลวง	20180	139	231
985		\N	\N	สัตหีบ	20180	139	231
989		\N	\N	แสมสาร	20180	139	231
932		\N	\N	คลองพลู	20190	133	231
933		\N	\N	หนองเสือช้าง	20190	133	231
931		\N	\N	หนองใหญ่	20190	133	231
934		\N	\N	ห้างสูง	20190	133	231
935		\N	\N	เขาซก	20190	133	231
997		\N	\N	ท่าบุญมี	20240	141	231
996		\N	\N	เกาะจันทร์	20240	141	231
984		\N	\N	ท่าเทววงษ์	20120	138	231
917		\N	\N	คลองตำหรุ	20000	131	231
915		\N	\N	ดอนหัวฬ่อ	20000	131	231
913		\N	\N	นาป่า	20000	131	231
7306		\N	\N	บางทราย	20000	131	231
909		\N	\N	บางปลาสร้อย	20000	131	231
919		\N	\N	บ้านปึก	20130	131	231
911		\N	\N	บ้านสวน	20000	131	231
7307		\N	\N	บ้านโขด	20000	131	231
7308		\N	\N	มะขามหย่ง	20000	131	231
923		\N	\N	สำนักบก	20000	131	231
914		\N	\N	หนองข้างคอก	20000	131	231
912		\N	\N	หนองรี	20000	131	231
916		\N	\N	หนองไม้แดง	20000	131	231
920		\N	\N	ห้วยกะปิ	20000	131	231
922		\N	\N	อ่างศิลา	20000	131	231
921		\N	\N	เสม็ด	20000	131	231
918		\N	\N	เหมือง	20130	131	231
910		\N	\N	แสนสุข	20130	131	231
758		\N	\N	คุ้งสำเภา	17110	111	224
761		\N	\N	ท่าฉนวน	17110	111	224
759		\N	\N	วัดโคก	17110	111	224
760		\N	\N	ศิลาดาน	17110	111	224
762		\N	\N	หางน้ำสาคร	17170	111	224
764		\N	\N	อู่ตะเภา	17170	111	224
763		\N	\N	ไร่พัฒนา	17170	111	224
770		\N	\N	บ่อแร่	17120	112	224
766		\N	\N	มะขามเฒ่า	17120	112	224
771		\N	\N	วังหมัน	17120	112	224
765		\N	\N	วัดสิงห์	17120	112	224
769		\N	\N	หนองขุ่น	17120	112	224
767		\N	\N	หนองน้อย	17120	112	224
768		\N	\N	หนองบัว	17120	112	224
784		\N	\N	ดงคอน	17140	114	224
785		\N	\N	ดอนกำ	17140	114	224
783		\N	\N	บางขุด	17140	114	224
781		\N	\N	ห้วยกรด	17140	114	224
786		\N	\N	ห้วยกรดพัฒนา	17140	114	224
780		\N	\N	เที่ยงแท้	17140	114	224
779		\N	\N	แพรกศรีราชา	17140	114	224
782		\N	\N	โพงาม	17140	114	224
773		\N	\N	ตลุก	17150	113	224
777		\N	\N	บางหลวง	17150	113	224
772		\N	\N	สรรพยา	17150	113	224
778		\N	\N	หาดอาษา	17150	113	224
774		\N	\N	เขาแก้ว	17150	113	224
775		\N	\N	โพนางดำตก	17150	113	224
776		\N	\N	โพนางดำออก	17150	113	224
7309		\N	\N	กุดจอก	17120	116	224
796		\N	\N	วังตะเคียน	17120	116	224
797		\N	\N	สะพานหิน	17120	116	224
795		\N	\N	หนองมะโมง	17120	116	224
788		\N	\N	บ้านเชี่ยน	17130	115	224
792		\N	\N	วังไก่เถื่อน	17130	115	224
794		\N	\N	สามง่ามท่าโบสถ์	17160	115	224
790		\N	\N	หนองแซง	17160	115	224
787		\N	\N	หันคา	17130	115	224
791		\N	\N	ห้วยงู	17160	115	224
793		\N	\N	เด่นใหญ่	17130	115	224
789		\N	\N	ไพรนกยูง	17130	115	224
800		\N	\N	กะบกเตี้ย	17130	117	224
801		\N	\N	สุขเดือนห้า	17130	117	224
799		\N	\N	เนินขาม	17130	117	224
752		\N	\N	ชัยนาท	17000	110	224
751		\N	\N	ท่าชัย	17000	110	224
755		\N	\N	ธรรมามูล	17000	110	224
757		\N	\N	นางลือ	17000	110	224
750		\N	\N	บ้านกล้วย	17000	110	224
754		\N	\N	หาดท่าเสา	17120	110	224
753		\N	\N	เขาท่าพระ	17000	110	224
756		\N	\N	เสือโฮก	17000	110	224
749		\N	\N	ในเมือง	17000	110	224
2577		\N	\N	คอนสวรรค์	36140	328	312
2647		\N	\N	ช่องสามหมอ	36140	328	312
2581		\N	\N	บ้านโสก	36140	328	312
2578		\N	\N	ยางหวาย	36140	328	312
2585		\N	\N	ศรีสำราญ	36140	328	312
2583		\N	\N	หนองขาม	36140	328	312
2580		\N	\N	ห้วยไร่	36140	328	312
2582		\N	\N	โคกมั่งงอย	36140	328	312
2579		\N	\N	โนนสะอาด	36140	328	312
2656		\N	\N	คอนสาร	36180	338	312
2662		\N	\N	ดงกลาง	36180	338	312
2661		\N	\N	ดงบัง	36180	338	312
7403		\N	\N	ทุ่งนาเลา	36180	338	312
2657		\N	\N	ทุ่งพระ	36180	338	312
2660		\N	\N	ทุ่งลุยลาย	36180	338	312
2659		\N	\N	ห้วยยาง	36180	338	312
2658		\N	\N	โนนคูณ	36180	338	312
2608		\N	\N	กุดน้ำใส	36130	331	312
2605		\N	\N	บ้านกอก	36130	331	312
2607		\N	\N	บ้านขาม	36130	331	312
2610		\N	\N	ละหาน	36130	331	312
2613		\N	\N	ส้มป่อย	36130	331	312
2606		\N	\N	หนองบัวบาน	36130	331	312
2612		\N	\N	หนองบัวโคก	36220	331	312
2611		\N	\N	หนองบัวใหญ่	36130	331	312
2609		\N	\N	หนองโดน	36130	331	312
2671		\N	\N	ซับใหญ่	36130	341	312
2673		\N	\N	ตะโกทอง	36130	341	312
2672		\N	\N	ท่ากูบ	36130	341	312
2614		\N	\N	บ้านชวน	36160	332	312
2615		\N	\N	บ้านตาล	36220	332	312
2634		\N	\N	บ้านเพชร	36160	332	312
2616		\N	\N	หัวทะเล	36220	332	312
2617		\N	\N	เกาะมะนาว	36160	332	312
2618		\N	\N	โคกเพชรพัฒนา	36160	332	312
7402		\N	\N	โคกเริงรมย์	36160	332	312
2574		\N	\N	ชีบน	36170	327	312
2572		\N	\N	ตลาดแร้ง	36170	327	312
2571		\N	\N	บ้านเขว้า	36170	327	312
2575		\N	\N	ภูแลนคา	36170	327	312
2573		\N	\N	ลุ่มลำชี	36170	327	312
2576		\N	\N	โนนแดง	36170	327	312
2644		\N	\N	บ้านเต่า	36190	336	312
2641		\N	\N	บ้านแท่น	36190	336	312
2643		\N	\N	สระพัง	36190	336	312
2642		\N	\N	สามสวน	36190	336	312
2645		\N	\N	หนองคู	36190	336	312
2663		\N	\N	บ้านเจียง	36260	339	312
2665		\N	\N	วังทอง	36260	339	312
2664		\N	\N	เจาทอง	36260	339	312
2666		\N	\N	แหลมทอง	36260	339	312
2630		\N	\N	กวางโจน	36110	335	312
2633		\N	\N	กุดยม	36110	335	312
2639		\N	\N	ธาตุทอง	36110	335	312
2640		\N	\N	บ้านดอน	36110	335	312
2635		\N	\N	บ้านเพชร	36110	335	312
2632		\N	\N	บ้านแก้ง	36110	335	312
2629		\N	\N	ผักปัง	36110	335	312
2631		\N	\N	หนองคอนไทย	36110	335	312
2637		\N	\N	หนองตูม	36110	335	312
2636		\N	\N	โคกสะอาด	36110	335	312
2638		\N	\N	โอโล	36110	335	312
2620		\N	\N	วังตะเฆ่	36250	333	312
2619		\N	\N	หนองบัวระเหว	36250	333	312
2621		\N	\N	ห้วยแย้	36250	333	312
2622		\N	\N	โคกสะอาด	36250	333	312
2623		\N	\N	โสกปลาดุก	36250	333	312
2598		\N	\N	กุดชุมแสง	36210	330	312
2602		\N	\N	คูเมือง	36210	330	312
2599		\N	\N	ถ้ำวัวแดง	36210	330	312
2603		\N	\N	ท่าใหญ่	36210	330	312
2600		\N	\N	นางแดด	36210	330	312
2604		\N	\N	วังชมภู	36210	330	312
2597		\N	\N	หนองบัวแดง	36210	330	312
2601		\N	\N	หนองแวง	36210	330	312
2590		\N	\N	กุดเลาะ	36120	329	312
2595		\N	\N	บ้านบัว	36120	329	312
2586		\N	\N	บ้านยาง	36120	329	312
2587		\N	\N	บ้านหัน	36120	329	312
2588		\N	\N	บ้านเดื่อ	36120	329	312
2589		\N	\N	บ้านเป้า	36120	329	312
2592		\N	\N	สระโพนทอง	36120	329	312
2593		\N	\N	หนองข่า	36120	329	312
2594		\N	\N	หนองโพนงาม	36120	329	312
2591		\N	\N	โนนกอก	36120	329	312
2596		\N	\N	โนนทอง	36120	329	312
2626		\N	\N	นายางกลัก	36230	334	312
2627		\N	\N	บ้านไร่	36230	334	312
2624		\N	\N	วะตะแบก	36230	334	312
2625		\N	\N	ห้วยยายจิ๋ว	36230	334	312
2628		\N	\N	โป่งนก	36230	334	312
2669		\N	\N	กะฮาด	36130	340	312
2668		\N	\N	ตาเนิน	36130	340	312
2670		\N	\N	รังงาม	36130	340	312
2667		\N	\N	หนองฉิม	36130	340	312
2557		\N	\N	กุดตุ้ม	36000	326	312
2558		\N	\N	ชีลอง	36000	326	312
2570		\N	\N	ซับสีทอง	36000	326	312
2564		\N	\N	ท่าหินโงม	36000	326	312
2555		\N	\N	นาฝาย	36000	326	312
2560		\N	\N	นาเสียว	36000	326	312
2569		\N	\N	บุ่งคล้า	36000	326	312
2556		\N	\N	บ้านค่าย	36240	326	312
2559		\N	\N	บ้านเล่า	36000	326	312
2553		\N	\N	รอบเมือง	36000	326	312
2562		\N	\N	ลาดใหญ่	36000	326	312
2561		\N	\N	หนองนาแซง	36000	326	312
2563		\N	\N	หนองไผ่	36240	326	312
2565		\N	\N	ห้วยต้อน	36000	326	312
2566		\N	\N	ห้วยบง	36000	326	312
2568		\N	\N	โคกสูง	36000	326	312
2567		\N	\N	โนนสำราญ	36240	326	312
2554		\N	\N	โพนทอง	36000	326	312
2552		\N	\N	ในเมือง	36000	326	312
2646		\N	\N	ช่องสามหมอ	36150	337	312
2654		\N	\N	ท่ามะไฟหวาน	36150	337	312
2648		\N	\N	นาหนองทุ่ม	36150	337	312
2649		\N	\N	บ้านแก้ง	36150	337	312
2584		\N	\N	หนองขาม	36150	337	312
2650		\N	\N	หนองสังข์	36150	337	312
2655		\N	\N	หนองไผ่	36150	337	312
2651		\N	\N	หลุบคา	36150	337	312
2653		\N	\N	เก่าย่าดี	36150	337	312
2652		\N	\N	โคกกุง	36150	337	312
6737		\N	\N	ช่องไม้แก้ว	86220	849	513
6736		\N	\N	ตะโก	86220	849	513
6735		\N	\N	ทุ่งตะไคร	86220	849	513
6726		\N	\N	ปากตะโก	86220	849	513
6657		\N	\N	คุริง	86140	843	513
7310		\N	\N	ทรัพย์อนันต์	86140	843	513
6660		\N	\N	ท่าข้าม	86140	843	513
6656		\N	\N	ท่าแซะ	86140	843	513
7311		\N	\N	นากระตาม	86140	843	513
6659		\N	\N	รับร่อ	86190	843	513
6658		\N	\N	สลุย	86140	843	513
6663		\N	\N	สองพี่น้อง	86140	843	513
6661		\N	\N	หงษ์เจริญ	86140	843	513
6662		\N	\N	หินแก้ว	86190	843	513
6668		\N	\N	ชุมโค	86160	844	513
6669		\N	\N	ดอนยาง	86210	844	513
6665		\N	\N	ทะเลทรัพย์	86160	844	513
6664		\N	\N	บางสน	86160	844	513
6677		\N	\N	ปากคลอง	86210	844	513
6666		\N	\N	สะพลี	86230	844	513
6678		\N	\N	เขาไชยราช	86210	844	513
6703		\N	\N	ปังหวาน	86180	847	513
6702		\N	\N	ปากทรง	86180	847	513
6704		\N	\N	พระรักษ์	86180	847	513
6701		\N	\N	พะโต๊ะ	86180	847	513
6700		\N	\N	ทุ่งคาวัด	86170	846	513
6698		\N	\N	ทุ่งหลวง	86170	846	513
6697		\N	\N	ละแม	86170	846	513
6699		\N	\N	สวนแตง	86170	846	513
6721		\N	\N	ครน	86130	848	513
6711		\N	\N	ด่านสวี	86130	848	513
6707		\N	\N	ทุ่งระยะ	86130	848	513
6708		\N	\N	ท่าหิน	86130	848	513
6723		\N	\N	นาสัก	86130	848	513
6705		\N	\N	นาโพธิ์	86130	848	513
6709		\N	\N	ปากแพรก	86130	848	513
6722		\N	\N	วิสัยใต้	86130	848	513
6706		\N	\N	สวี	86130	848	513
6725		\N	\N	เขาค่าย	86130	848	513
6724		\N	\N	เขาทะลุ	86130	848	513
6680		\N	\N	ขันเงิน	86110	845	513
6681		\N	\N	ท่ามะพลา	86110	845	513
6682		\N	\N	นาขา	86110	845	513
6683		\N	\N	นาพญา	86110	845	513
6686		\N	\N	บางน้ำจืด	86150	845	513
6685		\N	\N	บางมะพร้าว	86110	845	513
6684		\N	\N	บ้านควน	86110	845	513
6689		\N	\N	ปากน้ำ	86150	845	513
6693		\N	\N	พ้อแดง	86110	845	513
6695		\N	\N	วังตะกอ	86110	845	513
6679		\N	\N	หลังสวน	86110	845	513
6696		\N	\N	หาดยาย	86110	845	513
6694		\N	\N	แหลมทราย	86110	845	513
6642		\N	\N	ขุนกระทิง	86190	842	513
6636		\N	\N	ตากแดด	86000	842	513
6655		\N	\N	ถ้ำสิงห์	86100	842	513
6643		\N	\N	ทุ่งคา	86100	842	513
6626		\N	\N	ท่าตะเภา	86000	842	513
6627		\N	\N	ท่ายาง	86000	842	513
6634		\N	\N	นาชะอัง	86000	842	513
6633		\N	\N	นาทุ่ง	86000	842	513
6637		\N	\N	บางลึก	86000	842	513
6632		\N	\N	บางหมาก	86000	842	513
6641		\N	\N	บ้านนา	86190	842	513
6691		\N	\N	ปากน้ำ	86120	842	513
6640		\N	\N	วังใหม่	86190	842	513
6639		\N	\N	วังไผ่	86000	842	513
6644		\N	\N	วิสัยเหนือ	86100	842	513
6652		\N	\N	หาดทรายรี	86120	842	513
6638		\N	\N	หาดพันไกร	86000	842	513
6913		\N	\N	กันตัง	92110	874	523
6918		\N	\N	กันตังใต้	92110	874	523
6926		\N	\N	คลองชีล้อม	92110	874	523
6920		\N	\N	คลองลุ	92110	874	523
6914		\N	\N	ควนธานี	92110	874	523
6924		\N	\N	นาเกลือ	92110	874	523
6923		\N	\N	บางสัก	92110	874	523
6915		\N	\N	บางหมาก	92110	874	523
6916		\N	\N	บางเป้า	92110	874	523
6922		\N	\N	บ่อน้ำร้อน	92110	874	523
6921		\N	\N	ย่านซื่อ	92110	874	523
6917		\N	\N	วังวน	92110	874	523
6925		\N	\N	เกาะลิบง	92110	874	523
6919		\N	\N	โคกยาง	92110	874	523
6972		\N	\N	ช่อง	92170	880	523
6976		\N	\N	นาข้าวเสีย	92170	880	523
6975		\N	\N	นาหมื่นศรี	92170	880	523
6971		\N	\N	นาโยงเหนือ	92170	880	523
6973		\N	\N	ละมอ	92170	880	523
6974		\N	\N	โคกสะบ้า	92170	880	523
6936		\N	\N	ทุ่งยาว	92180	876	523
6935		\N	\N	ท่าข้าม	92120	876	523
6943		\N	\N	ท่าพญา	92140	876	523
6938		\N	\N	บางด้วน	92140	876	523
6939		\N	\N	บ้านนา	92140	876	523
6937		\N	\N	ปะเหลียน	92180	876	523
6941		\N	\N	ลิพัง	92180	876	523
6940		\N	\N	สุโสะ	92120	876	523
6942		\N	\N	เกาะสุกร	92120	876	523
6944		\N	\N	แหลมสอม	92180	876	523
6932		\N	\N	ทุ่งกระบือ	92140	875	523
6933		\N	\N	ทุ่งค่าย	92140	875	523
6929		\N	\N	นาชุมเห็ด	92140	875	523
6927		\N	\N	ย่านตาขาว	92140	875	523
6928		\N	\N	หนองบ่อ	92140	875	523
6934		\N	\N	เกาะเปียะ	92140	875	523
6931		\N	\N	โพรงจระเข้	92140	875	523
6930		\N	\N	ในควน	92140	875	523
6978		\N	\N	คลองปาง	92160	881	523
6977		\N	\N	ควนเมา	92160	881	523
6979		\N	\N	หนองบัว	92160	881	523
6980		\N	\N	หนองปรือ	92130	881	523
6981		\N	\N	เขาไพร	92160	881	523
6969		\N	\N	ท่าสะบ้า	92000	879	523
6967		\N	\N	วังมะปราง	92220	879	523
6970		\N	\N	วังมะปรางเหนือ	92220	879	523
6968		\N	\N	อ่าวตง	92220	879	523
6966		\N	\N	เขาวิเศษ	92220	879	523
6947		\N	\N	กะลาเส	92150	877	523
6949		\N	\N	นาเมืองเพชร	92000	877	523
6945		\N	\N	บ่อหิน	92150	877	523
6946		\N	\N	เขาไม้แก้ว	92150	877	523
6948		\N	\N	ไม้ฝาด	92150	877	523
6984		\N	\N	ตะเสะ	92120	882	523
6983		\N	\N	บ้าหวี	92120	882	523
6982		\N	\N	หาดสำราญ	92120	882	523
6964		\N	\N	ทุ่งต่อ	92130	878	523
6959		\N	\N	ท่างิ้ว	92130	878	523
6961		\N	\N	นาวง	92210	878	523
6953		\N	\N	บางกุ้ง	92210	878	523
6952		\N	\N	บางดี	92210	878	523
6958		\N	\N	ปากคม	92130	878	523
6957		\N	\N	ปากแจ่ม	92190	878	523
6960		\N	\N	ลำภูรา	92190	878	523
6965		\N	\N	วังคีรี	92210	878	523
6951		\N	\N	หนองช้างแล่น	92130	878	523
6962		\N	\N	ห้วยนาง	92130	878	523
6950		\N	\N	ห้วยยอด	92130	878	523
6954		\N	\N	เขากอบ	92130	878	523
6955		\N	\N	เขาขาว	92130	878	523
6956		\N	\N	เขาปูน	92130	878	523
6963		\N	\N	ในเตา	92130	878	523
6902		\N	\N	ควนปริง	92000	873	523
6898		\N	\N	ทับเที่ยง	92000	873	523
6909		\N	\N	นาตาล่วง	92000	873	523
6911		\N	\N	นาท่ามเหนือ	92190	873	523
6912		\N	\N	นาท่ามใต้	92190	873	523
6901		\N	\N	นาบินหลา	92170	873	523
6899		\N	\N	นาพละ	92000	873	523
6906		\N	\N	นาโต๊ะหมิง	92000	873	523
6903		\N	\N	นาโยงใต้	92170	873	523
6908		\N	\N	น้ำผุด	92000	873	523
6904		\N	\N	บางรัก	92000	873	523
6900		\N	\N	บ้านควน	92000	873	523
6910		\N	\N	บ้านโพธิ์	92000	873	523
6907		\N	\N	หนองตรุด	92000	873	523
6905		\N	\N	โคกหล่อ	92000	873	523
1143		\N	\N	คลองใหญ่	23110	161	234
1145		\N	\N	หาดเล็ก	23110	161	234
1144		\N	\N	ไม้รูด	23110	161	234
1155		\N	\N	ช้างทูน	23140	163	234
1156		\N	\N	ด่านชุมพล	23140	163	234
1158		\N	\N	นนทรีย์	23140	163	234
1154		\N	\N	บ่อพลอย	23140	163	234
1157		\N	\N	หนองบอน	23140	163	234
1164		\N	\N	เกาะกูด	23000	165	234
1163		\N	\N	เกาะหมาก	23000	165	234
1165		\N	\N	เกาะช้าง	23170	166	234
1166		\N	\N	เกาะช้างใต้	23170	166	234
1153		\N	\N	ทุ่งนนทรี	23130	162	234
1149		\N	\N	ท่าโสม	23150	162	234
1151		\N	\N	ประณีต	23150	162	234
1148		\N	\N	วังตะเคียน	23130	162	234
1150		\N	\N	สะตอ	23150	162	234
1146		\N	\N	เขาสมิง	23130	162	234
1152		\N	\N	เทพนิมิต	23150	162	234
1147		\N	\N	แสนตุ้ง	23150	162	234
1141		\N	\N	ชำราก	23000	160	234
1140		\N	\N	ตะกาง	23000	160	234
1139		\N	\N	ท่ากุ่ม	23000	160	234
1138		\N	\N	ท่าพริก	23000	160	234
1129		\N	\N	บางพระ	23000	160	234
1135		\N	\N	วังกระแจะ	23000	160	234
1132		\N	\N	หนองคันทรง	23000	160	234
1130		\N	\N	หนองเสม็ด	23000	160	234
1131		\N	\N	หนองโสน	23000	160	234
1133		\N	\N	ห้วงน้ำขาว	23000	160	234
1136		\N	\N	ห้วยแร้ง	23000	160	234
1134		\N	\N	อ่าวใหญ่	23000	160	234
1137		\N	\N	เนินทราย	23000	160	234
1142		\N	\N	แหลมกลัด	23000	160	234
1162		\N	\N	คลองใหญ่	23120	164	234
1160		\N	\N	น้ำเชี่ยว	23120	164	234
1161		\N	\N	บางปิด	23120	164	234
1159		\N	\N	แหลมงอบ	23120	164	234
5168		\N	\N	ท่าสองยาง	63150	668	413
5169		\N	\N	แม่ต้าน	63150	668	413
5172		\N	\N	แม่วะหลวง	63150	668	413
5170		\N	\N	แม่สอง	63150	668	413
5171		\N	\N	แม่หละ	63150	668	413
5173		\N	\N	แม่อุสุ	63150	668	413
5152		\N	\N	ตากตก	63120	665	413
5149		\N	\N	ตากออก	63120	665	413
5154		\N	\N	ทุ่งกระเชาะ	63120	665	413
5155		\N	\N	ท้องฟ้า	63120	665	413
5150		\N	\N	สมอโคน	63120	665	413
5153		\N	\N	เกาะตะเภา	63120	665	413
5151		\N	\N	แม่สลิด	63120	665	413
5186		\N	\N	คีรีราษฎร์	63160	670	413
5185		\N	\N	ช่องแคบ	63160	670	413
5184		\N	\N	พบพระ	63160	670	413
5188		\N	\N	รวมไทยพัฒนา	63160	670	413
5187		\N	\N	วาเล่ย์	63160	670	413
5196		\N	\N	นาโบสถ์	63000	672	413
5197		\N	\N	ประดาง	63000	672	413
5195		\N	\N	เชียงทอง	63000	672	413
5160		\N	\N	บ้านนา	63130	666	413
5158		\N	\N	ยกกระบัตร	63130	666	413
5159		\N	\N	ย่านรี	63130	666	413
5161		\N	\N	วังจันทร์	63130	666	413
5157		\N	\N	วังหมัน	63130	666	413
5156		\N	\N	สามเงา	63130	666	413
5190		\N	\N	หนองหลวง	63170	671	413
5189		\N	\N	อุ้มผาง	63170	671	413
5194		\N	\N	แม่กลอง	63170	671	413
5192		\N	\N	แม่จัน	63170	671	413
5193		\N	\N	แม่ละมุ้ง	63170	671	413
5191		\N	\N	โมโกร	63170	671	413
5148		\N	\N	ตลุกกลางทุ่ง	63000	664	413
5142		\N	\N	น้ำรึม	63000	664	413
5145		\N	\N	ป่ามะม่วง	63000	664	413
5135		\N	\N	ระแหง	63000	664	413
5147		\N	\N	วังประจบ	63000	664	413
5143		\N	\N	วังหิน	63000	664	413
5139		\N	\N	หนองบัวเหนือ	63000	664	413
5146		\N	\N	หนองบัวใต้	63000	664	413
5136		\N	\N	หนองหลวง	63000	664	413
5138		\N	\N	หัวเดียด	63000	664	413
5137		\N	\N	เชียงเงิน	63000	664	413
5144		\N	\N	แม่ท้อ	63000	664	413
5141		\N	\N	โป่งแดง	63000	664	413
5140		\N	\N	ไม้งาม	63000	664	413
5164		\N	\N	ขะเนจื้อ	63140	667	413
5167		\N	\N	พระธาตุ	63140	667	413
5166		\N	\N	สามหมื่น	63140	667	413
5163		\N	\N	แม่จะเรา	63140	667	413
5165		\N	\N	แม่ตื่น	63140	667	413
5162		\N	\N	แม่ระมาด	63140	667	413
5182		\N	\N	ด่านแม่ละเมา	63110	669	413
5179		\N	\N	ท่าสายลวด	63110	669	413
5183		\N	\N	พระธาตุผาแดง	63110	669	413
5176		\N	\N	พะวอ	63110	669	413
5181		\N	\N	มหาวัน	63110	669	413
5178		\N	\N	แม่กาษา	63110	669	413
5175		\N	\N	แม่กุ	63110	669	413
5177		\N	\N	แม่ตาว	63110	669	413
5180		\N	\N	แม่ปะ	63110	669	413
5174		\N	\N	แม่สอด	63110	669	413
1349		\N	\N	ทองหลาง	26110	187	225
1350		\N	\N	บางอ้อ	26110	187	225
1345		\N	\N	บ้านนา	26110	187	225
1347		\N	\N	บ้านพริก	26110	187	225
1346		\N	\N	บ้านพร้าว	26110	187	225
1352		\N	\N	ป่าขะ	26110	187	225
1351		\N	\N	พิกุลออก	26110	187	225
1354		\N	\N	ศรีกะอาง	26110	187	225
1348		\N	\N	อาษา	26110	187	225
1353		\N	\N	เขาเพิ่ม	26110	187	225
1342		\N	\N	ท่าเรือ	26130	186	225
1344		\N	\N	นาหินลาด	26130	186	225
1340		\N	\N	ปากพลี	26130	186	225
1343		\N	\N	หนองแสง	26130	186	225
1338		\N	\N	เกาะหวาย	26130	186	225
1339		\N	\N	เกาะโพธิ์	26130	186	225
1341		\N	\N	โคกกรวด	26130	186	225
1365		\N	\N	คลองใหญ่	26120	188	225
1364		\N	\N	ชุมพล	26120	188	225
1360		\N	\N	ทรายมูล	26120	188	225
1361		\N	\N	บางปลากด	26120	188	225
1362		\N	\N	บางลูกเสือ	26120	188	225
1359		\N	\N	บางสมบูรณ์	26120	188	225
1356		\N	\N	บึงศาล	26120	188	225
1355		\N	\N	พระอาจารย์	26120	188	225
1357		\N	\N	ศีรษะกระบือ	26120	188	225
1363		\N	\N	องครักษ์	26120	188	225
1358		\N	\N	โพธิ์แทน	26120	188	225
1332		\N	\N	ดงละคร	26000	185	225
1330		\N	\N	ดอนยอ	26000	185	225
1326		\N	\N	ท่าช้าง	26000	185	225
1329		\N	\N	ท่าทราย	26000	185	225
1325		\N	\N	นครนายก	26000	185	225
1327		\N	\N	บ้านใหญ่	26000	185	225
1337		\N	\N	พรหมณี	26000	185	225
1328		\N	\N	วังกระโจม	26000	185	225
1331		\N	\N	ศรีจุฬา	26000	185	225
1333		\N	\N	ศรีนาวา	26000	185	225
1334		\N	\N	สาริกา	26000	185	225
1335		\N	\N	หินตั้ง	26000	185	225
1336		\N	\N	เขาพระ	26000	185	225
5900		\N	\N	กระตีบ	73180	748	242
5910		\N	\N	กำแพงแสน	73140	748	242
5906		\N	\N	ดอนข่อย	73140	748	242
7468		\N	\N	ทุ่งกระพังโหม	73140	748	242
5903		\N	\N	ทุ่งขวาง	73140	748	242
5905		\N	\N	ทุ่งบัว	73140	748	242
5901		\N	\N	ทุ่งลูกนก	73140	748	242
5911		\N	\N	รางพิกุล	73140	748	242
5913		\N	\N	วังน้ำเขียว	73140	748	242
5907		\N	\N	สระพัฒนา	73180	748	242
5904		\N	\N	สระสี่มุม	73140	748	242
5912		\N	\N	หนองกระทุ่ม	73140	748	242
5902		\N	\N	ห้วยขวาง	73140	748	242
5909		\N	\N	ห้วยม่วง	73180	748	242
5908		\N	\N	ห้วยหมอนทอง	73140	748	242
5941		\N	\N	ดอนพุทรา	73150	750	242
5943		\N	\N	ดอนรวก	73150	750	242
5942		\N	\N	บ้านหลวง	73150	750	242
5945		\N	\N	ลำลูกบัว	73150	750	242
5940		\N	\N	ลำเหย	73150	750	242
5938		\N	\N	สามง่าม	73150	750	242
5944		\N	\N	ห้วยด้วน	73150	750	242
5939		\N	\N	ห้วยพระ	73150	750	242
5920		\N	\N	ขุนแก้ว	73120	749	242
5936		\N	\N	งิ้วราย	73120	749	242
5930		\N	\N	ดอนแฝก	73120	749	242
5919		\N	\N	ท่ากระชับ	73120	749	242
5917		\N	\N	ท่าตำหนัก	73120	749	242
5921		\N	\N	ท่าพระยา	73120	749	242
5914		\N	\N	นครชัยศรี	73120	749	242
5915		\N	\N	บางกระเบา	73120	749	242
5933		\N	\N	บางพระ	73120	749	242
5923		\N	\N	บางระกำ	73120	749	242
5918		\N	\N	บางแก้ว	73120	749	242
5934		\N	\N	บางแก้วฟ้า	73120	749	242
5922		\N	\N	พะเนียด	73120	749	242
5935		\N	\N	ลานตากฟ้า	73120	749	242
5932		\N	\N	วัดละมุด	73120	749	242
5929		\N	\N	วัดสำโรง	73120	749	242
5916		\N	\N	วัดแค	73120	749	242
5927		\N	\N	ศรีมหาโพธิ์	73120	749	242
5925		\N	\N	ศรีษะทอง	73120	749	242
5928		\N	\N	สัมปทวน	73120	749	242
5931		\N	\N	ห้วยพลู	73120	749	242
5926		\N	\N	แหลมบัว	73120	749	242
5924		\N	\N	โคกพระเจดีย์	73120	749	242
5937		\N	\N	ไทยาวาส	73120	749	242
5957		\N	\N	คลองนกกระทุง	73130	751	242
5954		\N	\N	ดอนตูม	73130	751	242
7467		\N	\N	นราภิรมย์	73130	751	242
5955		\N	\N	นิลเพชร	73130	751	242
5956		\N	\N	บัวปากท่า	73130	751	242
5947		\N	\N	บางปลา	73130	751	242
5949		\N	\N	บางภาษี	73130	751	242
5950		\N	\N	บางระกำ	73130	751	242
5948		\N	\N	บางหลวง	73190	751	242
5946		\N	\N	บางเลน	73130	751	242
5951		\N	\N	บางไทรป่า	73130	751	242
5958		\N	\N	ลำพญา	73130	751	242
5952		\N	\N	หินมูล	73190	751	242
5953		\N	\N	ไทรงาม	73130	751	242
5959		\N	\N	ไผ่หูช้าง	73130	751	242
5977		\N	\N	คลองโยง	73170	753	242
5978		\N	\N	มหาสวัสดิ์	73170	753	242
5976		\N	\N	ศาลายา	73170	753	242
5969		\N	\N	กระทุ่มล้ม	73220	752	242
5972		\N	\N	คลองจินดา	73110	752	242
5970		\N	\N	คลองใหม่	73110	752	242
5971		\N	\N	ตลาดจินดา	73110	752	242
5961		\N	\N	ทรงคนอง	73210	752	242
5960		\N	\N	ท่าข้าม	73110	752	242
5968		\N	\N	ท่าตลาด	73110	752	242
5963		\N	\N	บางกระทึก	73210	752	242
5966		\N	\N	บางช้าง	73110	752	242
5964		\N	\N	บางเตย	73210	752	242
5974		\N	\N	บ้านใหม่	73110	752	242
5973		\N	\N	ยายชา	73110	752	242
5965		\N	\N	สามพราน	73110	752	242
5962		\N	\N	หอมเกร็ด	73110	752	242
5975		\N	\N	อ้อมใหญ่	73160	752	242
5967		\N	\N	ไร่ขิง	73210	752	242
5882		\N	\N	ดอนยายหอม	73000	747	242
5879		\N	\N	ตาก้อง	73000	747	242
5883		\N	\N	ถนนขาด	73000	747	242
5897		\N	\N	ทัพหลวง	73000	747	242
5889		\N	\N	ทุ่งน้อย	73000	747	242
5878		\N	\N	ธรรมศาลา	73000	747	242
5885		\N	\N	นครปฐม	73000	747	242
5876		\N	\N	บางแขม	73000	747	242
5884		\N	\N	บ่อพลับ	73000	747	242
5899		\N	\N	บ้านยาง	73000	747	242
5875		\N	\N	พระปฐมเจดีย์	73000	747	242
5877		\N	\N	พระประโทน	73000	747	242
5880		\N	\N	มาบแค	73000	747	242
5893		\N	\N	ลำพยา	73000	747	242
5886		\N	\N	วังตะกู	73000	747	242
5891		\N	\N	วังเย็น	73000	747	242
5881		\N	\N	สนามจันทร์	73000	747	242
5894		\N	\N	สระกะเทียม	73000	747	242
5895		\N	\N	สวนป่าน	73000	747	242
5888		\N	\N	สามควายเผือก	73000	747	242
5898		\N	\N	หนองงูเหลือม	73000	747	242
5890		\N	\N	หนองดินแดง	73000	747	242
5887		\N	\N	หนองปากโลง	73000	747	242
5896		\N	\N	ห้วยจรเข้	73000	747	242
5892		\N	\N	โพรงมะเดื่อ	73000	747	242
3951		\N	\N	ท่าจำปา	48120	502	333
3949		\N	\N	ท่าอุเทน	48120	502	333
3953		\N	\N	พนอม	48120	502	333
3954		\N	\N	พะทาย	48120	502	333
3956		\N	\N	รามราช	48120	502	333
7412		\N	\N	หนองเทา	48120	502	333
3955		\N	\N	เวินพระบาท	48120	502	333
3950		\N	\N	โนนตาล	48120	502	333
3952		\N	\N	ไชยบุรี	48120	502	333
3970		\N	\N	กุดฉิม	48110	504	333
3966		\N	\N	ดอนนางหงส์	48110	504	333
3960		\N	\N	ธาตุพนม	48110	504	333
7411		\N	\N	ธาตุพนมเหนือ	48110	504	333
3964		\N	\N	นาถ่อน	48110	504	333
3969		\N	\N	นาหนาด	48110	504	333
3967		\N	\N	น้ำก่ำ	48110	504	333
3961		\N	\N	ฝั่งแดง	48110	504	333
3963		\N	\N	พระกลางทุ่ง	48110	504	333
3968		\N	\N	อุ่มเหม้า	48110	504	333
3965		\N	\N	แสนพัน	48110	504	333
3962		\N	\N	โพนแพง	48110	504	333
4013		\N	\N	ดอนเตย	48140	510	333
4011		\N	\N	นาทม	48140	510	333
4012		\N	\N	หนองซน	48140	510	333
7417		\N	\N	ท่าเรือ	48180	508	333
4002		\N	\N	นาคูณใหญ่	48180	508	333
3999		\N	\N	นางัว	48180	508	333
3998		\N	\N	นาหว้า	48180	508	333
4001		\N	\N	บ้านเสียว	48180	508	333
4003		\N	\N	เหล่าพัฒนา	48180	508	333
3983		\N	\N	ก้านเหลือง	48130	506	333
3987		\N	\N	คำพี้	48130	506	333
3980		\N	\N	นาคู่	48130	506	333
3985		\N	\N	นาเลียง	48130	506	333
3977		\N	\N	นาแก	48130	506	333
3986		\N	\N	บ้านแก้ง	48130	506	333
3978		\N	\N	พระซอง	48130	506	333
3981		\N	\N	พิมาน	48130	506	333
3982		\N	\N	พุ่มแก	48130	506	333
3988		\N	\N	สีชมพู	48130	506	333
3984		\N	\N	หนองบ่อ	48130	506	333
3979		\N	\N	หนองสังข์	48130	506	333
4000		\N	\N	นางัว	48140	503	333
7414		\N	\N	นาเข	48140	503	333
7415		\N	\N	บ้านแพง	48140	503	333
3959		\N	\N	หนองแวง	48140	503	333
3958		\N	\N	โพนทอง	48140	503	333
3957		\N	\N	ไผ่ล้อม	48140	503	333
3943		\N	\N	กุตาไก้	48160	501	333
3947		\N	\N	นามะเขือ	48160	501	333
3941		\N	\N	ปลาปาก	48160	501	333
3946		\N	\N	มหาชัย	48160	501	333
3942		\N	\N	หนองฮี	48160	501	333
3948		\N	\N	หนองเทาใหญ่	48160	501	333
3944		\N	\N	โคกสว่าง	48160	501	333
3945		\N	\N	โคกสูง	48160	501	333
4016		\N	\N	ยอดชาด	48130	511	333
4014		\N	\N	วังยาง	48130	511	333
7413		\N	\N	หนองโพธิ์	48130	511	333
4015		\N	\N	โคกสี	48130	511	333
3993		\N	\N	ท่าบ่อสงคราม	48150	507	333
3995		\N	\N	นาคำ	48150	507	333
3990		\N	\N	นาเดื่อ	48150	507	333
3994		\N	\N	บ้านข่า	48150	507	333
3991		\N	\N	บ้านเอื้อง	48150	507	333
3989		\N	\N	ศรีสงคราม	48150	507	333
3992		\N	\N	สามผง	48150	507	333
3997		\N	\N	หาดแพง	48150	507	333
3996		\N	\N	โพนสว่าง	48150	507	333
3932		\N	\N	กุรุคุ	48000	500	333
3935		\N	\N	ขามเฒ่า	48000	500	333
3938		\N	\N	คำเตย	48000	500	333
3940		\N	\N	ดงขวาง	48000	500	333
3937		\N	\N	ท่าค้อ	48000	500	333
3930		\N	\N	นาทราย	48000	500	333
3931		\N	\N	นาราชควาย	48000	500	333
3936		\N	\N	บ้านกลาง	48000	500	333
3933		\N	\N	บ้านผึ้ง	48000	500	333
7408		\N	\N	วังตามัว	48000	500	333
3939		\N	\N	หนองญาติ	48000	500	333
7409		\N	\N	หนองแสง	48000	500	333
3934		\N	\N	อาจสามารถ	48000	500	333
7410		\N	\N	โพธิ์ตาก	48000	500	333
7300		\N	\N	ในเมือง	48000	500	333
3972		\N	\N	ท่าลาด	48170	505	333
3711		\N	\N	นาขาม	48170	505	333
3973		\N	\N	นางาม	48170	505	333
3975		\N	\N	หนองย่างชิ้น	48170	505	333
3971		\N	\N	เรณู	48170	505	333
3976		\N	\N	เรณูใต้	48170	505	333
3974		\N	\N	โคกหินแฮ่	48170	505	333
7416		\N	\N	โพนทอง	48170	505	333
4006		\N	\N	นาขมิ้น	48190	509	333
4005		\N	\N	นาหัวบ่อ	48190	509	333
4010		\N	\N	นาใน	48190	509	333
4008		\N	\N	บ้านค้อ	48190	509	333
4009		\N	\N	โพนจาน	48190	509	333
4007		\N	\N	โพนบก	48190	509	333
4004		\N	\N	โพนสวรรค์	48190	509	333
1630		\N	\N	ขามทะเลสอ	30280	216	311
1634		\N	\N	บึงอ้อ	30280	216	311
1632		\N	\N	พันดุง	30280	216	311
1633		\N	\N	หนองสรวง	30280	216	311
1631		\N	\N	โป่งแดง	30280	216	311
1542		\N	\N	ขามสะแกแสง	30290	208	311
1545		\N	\N	ชีวึก	30290	208	311
1546		\N	\N	พะงาด	30290	208	311
1547		\N	\N	หนองหัวฟาน	30290	208	311
1544		\N	\N	เมืองนาท	30290	208	311
1548		\N	\N	เมืองเกษตร	30290	208	311
1543		\N	\N	โนนเมือง	30290	208	311
1477		\N	\N	ขามสมบูรณ์	30260	201	311
1469		\N	\N	คูขาด	30260	201	311
1476		\N	\N	ดอนใหญ่	30260	201	311
1471		\N	\N	ตาจั่น	30260	201	311
1472		\N	\N	บ้านปรางค์	30260	201	311
1474		\N	\N	หนองบัว	30260	201	311
1473		\N	\N	หนองมะนาว	30260	201	311
1470		\N	\N	เทพาลัย	30260	201	311
1468		\N	\N	เมืองคง	30260	201	311
1475		\N	\N	โนนเต็ง	30260	201	311
1452		\N	\N	ครบุรี	30250	199	311
1459		\N	\N	ครบุรีใต้	30250	199	311
1454		\N	\N	จระเข้หิน	30250	199	311
1460		\N	\N	ตะแบกบาน	30250	199	311
1457		\N	\N	บ้านใหม่	30250	199	311
1455		\N	\N	มาบตะโกเอน	30250	199	311
1458		\N	\N	ลำเพียก	30250	199	311
1461		\N	\N	สระว่านพระยา	30250	199	311
1456		\N	\N	อรพิมพ์	30250	199	311
1451		\N	\N	เฉลียง	30250	199	311
1450		\N	\N	แชะ	30250	199	311
1453		\N	\N	โคกกระชาย	30250	199	311
1488		\N	\N	คลองเมือง	30230	203	311
1482		\N	\N	จักราช	30230	203	311
1483		\N	\N	ทองหลาง	30230	203	311
1487		\N	\N	ศรีละกอ	30230	203	311
1484		\N	\N	สีสุก	30230	203	311
1485		\N	\N	หนองขาม	30230	203	311
1486		\N	\N	หนองพลวง	30230	203	311
1489		\N	\N	หินโคน	30230	203	311
1610		\N	\N	ชุมพวง	30270	214	311
1614		\N	\N	ตลาดไทร	30270	214	311
1612		\N	\N	ท่าลาด	30270	214	311
1611		\N	\N	ประสุข	30270	214	311
1613		\N	\N	สาหร่าย	30270	214	311
1616		\N	\N	หนองหลัก	30270	214	311
1617		\N	\N	โนนตูม	30270	214	311
1618		\N	\N	โนนยอ	30270	214	311
1615		\N	\N	โนนรัง	30270	214	311
1500		\N	\N	กุดพิมาน	30210	205	311
1501		\N	\N	ด่านขุนทด	30210	205	311
1502		\N	\N	ด่านนอก	30210	205	311
1503		\N	\N	ด่านใน	30210	205	311
1504		\N	\N	ตะเคียน	30210	205	311
1505		\N	\N	บ้านเก่า	30210	205	311
1506		\N	\N	บ้านแปรง	36220	205	311
1507		\N	\N	พันชนะ	30210	205	311
1508		\N	\N	สระจรเข้	30210	205	311
1509		\N	\N	หนองกราด	30210	205	311
1510		\N	\N	หนองบัวตะเกียด	30210	205	311
1511		\N	\N	หนองบัวละคร	30210	205	311
1515		\N	\N	หนองไทร	36220	205	311
1512		\N	\N	หินดาด	30210	205	311
1513		\N	\N	ห้วยบง	30210	205	311
1514		\N	\N	โนนเมืองพัฒนา	30210	205	311
1702		\N	\N	บัวลาย	30120	227	311
1703		\N	\N	หนองหว้า	30120	227	311
1700		\N	\N	เมืองพะไล	30120	227	311
1701		\N	\N	โนนจาน	30120	227	311
1555		\N	\N	กุดจอก	30120	209	311
1557		\N	\N	ขุนทอง	30120	209	311
1552		\N	\N	ดอนตะหนิน	30120	209	311
1556		\N	\N	ด่านช้าง	30120	209	311
1549		\N	\N	บัวใหญ่	30120	209	311
1553		\N	\N	หนองบัวสะอาด	30120	209	311
1558		\N	\N	หนองแจ้งใหญ่	30120	209	311
1550		\N	\N	ห้วยยาง	30120	209	311
1551		\N	\N	เสมาใหญ่	30120	209	311
1554		\N	\N	โนนทองหลาง	30120	209	311
1481		\N	\N	ช่อระกา	30350	202	311
1478		\N	\N	บ้านเหลื่อม	30350	202	311
1479		\N	\N	วังโพธิ์	30350	202	311
1480		\N	\N	โคกกระเบื้อง	30350	202	311
1560		\N	\N	กระทุ่มราย	30180	210	311
1566		\N	\N	ดอนมัน	30180	210	311
1562		\N	\N	ตลาดไทร	30180	210	311
1569		\N	\N	ทุ่งสว่าง	30180	210	311
1567		\N	\N	นางรำ	30180	210	311
1559		\N	\N	ประทาย	30180	210	311
1561		\N	\N	วังไม้แดง	30180	210	311
1564		\N	\N	หนองค่าย	30180	210	311
1563		\N	\N	หนองพลวง	30180	210	311
1565		\N	\N	หันห้วยทราย	30180	210	311
1571		\N	\N	เมืองโดน	30180	210	311
1570		\N	\N	โคกกลาง	30180	210	311
1568		\N	\N	โนนเพ็ด	30180	210	311
1580		\N	\N	งิ้ว	30150	211	311
1578		\N	\N	ดอน	30150	211	311
1576		\N	\N	ตะขบ	30150	211	311
1573		\N	\N	ตะคุ	30150	211	311
1579		\N	\N	ตูม	30150	211	311
1584		\N	\N	ธงชัยเหนือ	30150	211	311
1577		\N	\N	นกออก	30150	211	311
1587		\N	\N	บ่อปลาทอง	30150	211	311
1583		\N	\N	ภูหลวง	30150	211	311
1582		\N	\N	ลำนางแก้ว	30150	211	311
1581		\N	\N	สะแกราช	30150	211	311
1575		\N	\N	สำโรง	30150	211	311
1585		\N	\N	สุขเกษม	30150	211	311
1586		\N	\N	เกษมทรัพย์	30150	211	311
1572		\N	\N	เมืองปัก	30150	211	311
1574		\N	\N	โคกไทย	30150	211	311
1648		\N	\N	กลางดง	30320	218	311
1653		\N	\N	ขนงพระ	30130	218	311
1655		\N	\N	คลองม่วง	30130	218	311
1649		\N	\N	จันทึก	30130	218	311
1647		\N	\N	ปากช่อง	30130	218	311
1658		\N	\N	พญาเย็น	30320	218	311
1650		\N	\N	วังกะทะ	30130	218	311
1657		\N	\N	วังไทร	30130	218	311
1656		\N	\N	หนองน้ำแดง	30130	218	311
1652		\N	\N	หนองสาหร่าย	30130	218	311
1651		\N	\N	หมูสี	30130	218	311
1654		\N	\N	โป่งตาลอง	30130	218	311
1694		\N	\N	ทัพรั้ง	30220	225	311
1693		\N	\N	พังเทียม	30220	225	311
1692		\N	\N	มาบกราด	30220	225	311
1691		\N	\N	สระพระ	30220	225	311
1695		\N	\N	หนองหอย	30220	225	311
1596		\N	\N	กระชอน	30110	212	311
1591		\N	\N	กระเบื้องใหญ่	30110	212	311
1594		\N	\N	ชีวาน	30110	212	311
1597		\N	\N	ดงใหญ่	30110	212	311
1592		\N	\N	ท่าหลวง	30110	212	311
1598		\N	\N	ธารละหลอด	30110	212	311
1595		\N	\N	นิคมสร้างตนเอง	30110	212	311
1593		\N	\N	รังกาใหญ่	30110	212	311
1589		\N	\N	สัมฤทธิ์	30110	212	311
1599		\N	\N	หนองระเวียง	30110	212	311
1590		\N	\N	โบสถ์	30110	212	311
1588		\N	\N	ในเมือง	30110	212	311
1696		\N	\N	ขุย	30270	226	311
1698		\N	\N	ช่องแมว	30270	226	311
1697		\N	\N	บ้านยาง	30270	226	311
1699		\N	\N	ไพล	30270	226	311
1680		\N	\N	ระเริง	30150	222	311
1678		\N	\N	วังน้ำเขียว	30370	222	311
1679		\N	\N	วังหมี	30370	222	311
1681		\N	\N	อุดมทรัพย์	30370	222	311
1682		\N	\N	ไทยสามัคคี	30370	222	311
1637		\N	\N	กฤษณา	30140	217	311
1640		\N	\N	กุดน้อย	30140	217	311
1644		\N	\N	คลองไผ่	30340	217	311
1645		\N	\N	ดอนเมือง	30140	217	311
1636		\N	\N	บ้านหัน	30140	217	311
1643		\N	\N	มิตรภาพ	30140	217	311
1638		\N	\N	ลาดบัวขาว	30340	217	311
1642		\N	\N	วังโรงใหญ่	30140	217	311
1635		\N	\N	สีคิ้ว	30140	217	311
1641		\N	\N	หนองน้ำใส	30140	217	311
1646		\N	\N	หนองบัวน้อย	30140	217	311
1639		\N	\N	หนองหญ้าขาว	30140	217	311
1707		\N	\N	สามเมือง	30430	228	311
1704		\N	\N	สีดา	30430	228	311
1708		\N	\N	หนองตาดใหญ่	30430	228	311
1706		\N	\N	โนนประดู่	30430	228	311
1705		\N	\N	โพนทอง	30430	228	311
1629		\N	\N	กุดจิก	30380	215	311
1627		\N	\N	นากลาง	30380	215	311
1622		\N	\N	บุ่งขี้เหล็ก	30170	215	311
1625		\N	\N	มะเกลือเก่า	30170	215	311
1626		\N	\N	มะเกลือใหม่	30170	215	311
1619		\N	\N	สูงเนิน	30170	215	311
1628		\N	\N	หนองตะไก้	30380	215	311
1620		\N	\N	เสมา	30170	215	311
1621		\N	\N	โคราช	30170	215	311
1624		\N	\N	โค้งยาง	30170	215	311
1623		\N	\N	โนนค่า	30170	215	311
1667		\N	\N	บ้านใหม่	30410	219	311
1665		\N	\N	ลุงเขว้า	30410	219	311
1660		\N	\N	สารภี	30410	219	311
1664		\N	\N	หนองตะไก้	30410	219	311
1659		\N	\N	หนองบุนนาก	30410	219	311
1662		\N	\N	หนองหัวแรต	30410	219	311
1666		\N	\N	หนองไม้ไผ่	30410	219	311
1663		\N	\N	แหลมทอง	30410	219	311
1661		\N	\N	ไทยเจริญ	30410	219	311
1606		\N	\N	กงรถ	30240	213	311
1605		\N	\N	งิ้ว	30240	213	311
1608		\N	\N	ตะโก	30240	213	311
1601		\N	\N	ทับสวาย	30240	213	311
1603		\N	\N	หลุ่งตะเคียน	30240	213	311
1607		\N	\N	หลุ่งประดู่	30240	213	311
1604		\N	\N	หินดาด	30240	213	311
1609		\N	\N	ห้วยแคน	30240	213	311
1600		\N	\N	ห้วยแถลง	30240	213	311
1602		\N	\N	เมืองพลับพลา	30240	213	311
1709		\N	\N	ช้างทอง	30230	229	311
1710		\N	\N	ท่าช้าง	30230	229	311
1711		\N	\N	พระพุทธ	30230	229	311
1712		\N	\N	หนองงูเหลือม	30000	229	311
1713		\N	\N	หนองยาง	30230	229	311
1685		\N	\N	บึงปรือ	30210	223	311
1686		\N	\N	วังยายทอง	30210	223	311
1683		\N	\N	สำนักตะคร้อ	30210	223	311
1684		\N	\N	หนองแวง	30210	223	311
1440		\N	\N	จอหอ	30310	198	311
1446		\N	\N	ตลาด	30310	198	311
1436		\N	\N	บ้านเกาะ	30000	198	311
1439		\N	\N	บ้านโพธิ์	30310	198	311
1437		\N	\N	บ้านใหม่	30000	198	311
1431		\N	\N	ปรุใหญ่	30000	198	311
1433		\N	\N	พลกรัง	30000	198	311
1447		\N	\N	พะเนา	30000	198	311
1438		\N	\N	พุดซา	30000	198	311
1429		\N	\N	มะเริง	30000	198	311
1445		\N	\N	สีมุม	30000	198	311
1444		\N	\N	สุรนารี	30000	198	311
1448		\N	\N	หนองกระทุ่ม	30000	198	311
1427		\N	\N	หนองจะบก	30000	198	311
1443		\N	\N	หนองบัวศาลา	30000	198	311
1430		\N	\N	หนองระเวียง	30000	198	311
1449		\N	\N	หนองไข่น้ำ	30310	198	311
1434		\N	\N	หนองไผ่ล้อม	30000	198	311
1432		\N	\N	หมื่นไวย	30000	198	311
1435		\N	\N	หัวทะเล	30000	198	311
1441		\N	\N	โคกกรวด	30280	198	311
1428		\N	\N	โคกสูง	30310	198	311
1426		\N	\N	โพธิ์กลาง	30000	198	311
1425		\N	\N	ในเมือง	30000	198	311
1442		\N	\N	ไชยมงคล	30000	198	311
1688		\N	\N	กระเบื้องนอก	30270	224	311
1689		\N	\N	ละหานปลาค้าว	30270	224	311
1687		\N	\N	เมืองยาง	30270	224	311
1690		\N	\N	โนนอุดม	30270	224	311
1465		\N	\N	กุดโบสถ์	30330	200	311
1467		\N	\N	บ้านราษฎร์	30330	200	311
1463		\N	\N	สระตะเคียน	30330	200	311
1466		\N	\N	สุขไพบูลย์	30330	200	311
1462		\N	\N	เสิงสาง	30330	200	311
1464		\N	\N	โนนสมบูรณ์	30330	200	311
1670		\N	\N	บึงพะไล	30440	220	311
1672		\N	\N	บึงสำโรง	30440	220	311
1671		\N	\N	สีสุก	30440	220	311
1668		\N	\N	แก้งสนามนาง	30440	220	311
1669		\N	\N	โนนสำราญ	30440	220	311
1490		\N	\N	กระโทก	30190	204	311
1499		\N	\N	ด่านเกวียน	30190	204	311
1493		\N	\N	ทุ่งอรุณ	30190	204	311
1495		\N	\N	ท่าจะหลุง	30190	204	311
1494		\N	\N	ท่าลาดขาว	30190	204	311
1492		\N	\N	ท่าอ่าง	30190	204	311
1496		\N	\N	ท่าเยี่ยม	30190	204	311
1491		\N	\N	พลับพลา	30190	204	311
1498		\N	\N	ละลมใหม่พัฒนา	30190	204	311
1497		\N	\N	โชคชัย	30190	204	311
1536		\N	\N	ขามเฒ่า	30160	207	311
1535		\N	\N	จันอัด	30160	207	311
1530		\N	\N	ดอนชมพู	30160	207	311
1540		\N	\N	ดอนหวาย	30160	207	311
1537		\N	\N	ด่านคล้า	30160	207	311
1531		\N	\N	ธารปราสาท	30420	207	311
1529		\N	\N	บิง	30160	207	311
1534		\N	\N	พลสงคราม	30160	207	311
1533		\N	\N	มะค่า	30160	207	311
1538		\N	\N	ลำคอหงษ์	30160	207	311
1541		\N	\N	ลำมูล	30160	207	311
1532		\N	\N	หลุมข้าว	30160	207	311
1539		\N	\N	เมืองปราสาท	30160	207	311
1528		\N	\N	โตนด	30160	207	311
1526		\N	\N	โนนสูง	30160	207	311
1527		\N	\N	ใหม่	30160	207	311
1677		\N	\N	ดอนยาวใหญ่	30360	221	311
1676		\N	\N	วังหิน	30360	221	311
1675		\N	\N	สำพะเนียง	30360	221	311
1674		\N	\N	โนนตาเถร	30360	221	311
1673		\N	\N	โนนแดง	30360	221	311
1518		\N	\N	กำปัง	30220	206	311
1520		\N	\N	ค้างพลู	30220	206	311
1517		\N	\N	ด่านจาก	30220	206	311
1524		\N	\N	ถนนโพธิ์	30220	206	311
1522		\N	\N	บัลลังก์	30220	206	311
1521		\N	\N	บ้านวัง	30220	206	311
1525		\N	\N	มะค่า	30220	206	311
1523		\N	\N	สายออ	30220	206	311
1519		\N	\N	สำโรง	30220	206	311
1516		\N	\N	โนนไทย	30220	206	311
6313		\N	\N	ขนอม	80210	790	511
6314		\N	\N	ควนทอง	80210	790	511
6315		\N	\N	ท้องเนียน	80210	790	511
7312		\N	\N	ควนหนองคว้า	80130	794	511
7313		\N	\N	ทุ่งโพธิ์	80130	794	511
7314		\N	\N	นาหมอบุญ	80130	794	511
7315		\N	\N	บ้านควนมุด	80180	794	511
7316		\N	\N	บ้านชะอวด	80180	794	511
6335		\N	\N	สามตำบล	80130	794	511
6218		\N	\N	กะเปียด	80260	779	511
6223		\N	\N	จันดี	80250	779	511
6214		\N	\N	ฉวาง	80150	779	511
6219		\N	\N	นากะชะ	80150	779	511
6222		\N	\N	นาเขลียง	80260	779	511
6216		\N	\N	นาแว	80260	779	511
6215		\N	\N	ละอาย	80250	779	511
6220		\N	\N	ห้วยปริก	80260	779	511
6217		\N	\N	ไม้เรียง	80260	779	511
6221		\N	\N	ไสหร้า	80150	779	511
6245		\N	\N	ขอนหาด	80180	782	511
6336		\N	\N	ควนหนองหงษ์	80180	782	511
6239		\N	\N	ชะอวด	80180	782	511
6241		\N	\N	ท่าประจะ	80180	782	511
6240		\N	\N	ท่าเสม็ด	80180	782	511
6248		\N	\N	นางหลง	80180	782	511
6244		\N	\N	บ้านตูล	80180	782	511
6243		\N	\N	วังอ่าง	80180	782	511
6246		\N	\N	เกาะขันธ์	80180	782	511
6247		\N	\N	เขาพระทอง	80180	782	511
6242		\N	\N	เคร็ง	80180	782	511
6344		\N	\N	ช้างกลาง	80250	797	511
6346		\N	\N	สวนขัน	80250	797	511
6345		\N	\N	หลักช้าง	80250	797	511
6332		\N	\N	คลองเส	80260	793	511
6333		\N	\N	ดุสิต	80260	793	511
6331		\N	\N	ถ้ำพรรณรา	80260	793	511
6266		\N	\N	กะปาง	80310	784	511
6262		\N	\N	ควนกรด	80110	784	511
6260		\N	\N	ชะมาย	80110	784	511
6269		\N	\N	ถ้ำใหญ่	80110	784	511
6267		\N	\N	ที่วัง	80110	784	511
6264		\N	\N	นาหลวงเสน	80110	784	511
6270		\N	\N	นาโพธิ์	80110	784	511
6263		\N	\N	นาไม้ไผ่	80110	784	511
6268		\N	\N	น้ำตก	80110	784	511
6259		\N	\N	ปากแพรก	80110	784	511
6261		\N	\N	หนองหงส์	80110	784	511
6271		\N	\N	เขาขาว	80110	784	511
6265		\N	\N	เขาโร	80110	784	511
6281		\N	\N	กรุงหยัน	80240	786	511
6278		\N	\N	กุแหระ	80240	786	511
6276		\N	\N	ทุ่งสัง	80240	786	511
6277		\N	\N	ทุ่งใหญ่	80240	786	511
6275		\N	\N	ท่ายาง	80240	786	511
6280		\N	\N	บางรูป	80240	786	511
6279		\N	\N	ปริก	80240	786	511
6250		\N	\N	กลาย	80160	783	511
6256		\N	\N	ดอนตะโก	80160	783	511
6257		\N	\N	ตลิ่งชัน	80160	783	511
6251		\N	\N	ท่าขึ้น	80160	783	511
6249		\N	\N	ท่าศาลา	80160	783	511
6253		\N	\N	สระแก้ว	80160	783	511
6252		\N	\N	หัวตะพาน	80160	783	511
6258		\N	\N	โพธิ์ทอง	80160	783	511
6254		\N	\N	โมคลาน	80160	783	511
6255		\N	\N	ไทยบุรี	80160	783	511
7472		\N	\N	กรุงชิง	80160	796	511
6342		\N	\N	กะหรอ	80160	796	511
6341		\N	\N	นบพิตำ	80160	796	511
6343		\N	\N	นาเหรง	80160	796	511
6273		\N	\N	ทุ่งสง	80220	785	511
6272		\N	\N	นาบอน	80220	785	511
6274		\N	\N	แก้วแสน	80220	785	511
6327		\N	\N	บางขัน	80360	792	511
6330		\N	\N	บ้านนิคม	80360	792	511
6328		\N	\N	บ้านลำนาว	80360	792	511
6329		\N	\N	วังหิน	80360	792	511
6299		\N	\N	ขนาบนาก	80140	787	511
6286		\N	\N	คลองกระบือ	80370	787	511
6283		\N	\N	คลองน้อย	80330	787	511
6285		\N	\N	ชะเมา	80330	787	511
6297		\N	\N	ท่าพยา	80140	787	511
6294		\N	\N	บางตะพง	80370	787	511
6293		\N	\N	บางพระ	80140	787	511
6292		\N	\N	บางศาลา	80370	787	511
6296		\N	\N	บ้านเพิง	80140	787	511
6288		\N	\N	บ้านใหม่	80370	787	511
6282		\N	\N	ปากพนัง	80140	787	511
6291		\N	\N	ปากพนังฝั่งตะวันตก	80370	787	511
6295		\N	\N	ปากพนังฝั่งตะวันออก	80140	787	511
6298		\N	\N	ปากแพรก	80140	787	511
6284		\N	\N	ป่าระกำ	80370	787	511
6289		\N	\N	หูล่อง	80370	787	511
6287		\N	\N	เกาะทวด	80330	787	511
6290		\N	\N	แหลมตะลุมพุก	80140	787	511
6208		\N	\N	ทอนหงส์	80320	777	511
7473		\N	\N	นาเรียง	80320	777	511
6206		\N	\N	บ้านเกาะ	80320	777	511
6205		\N	\N	พรหมโลก	80320	777	511
6207		\N	\N	อินคีรี	80320	777	511
6340		\N	\N	ช้างซ้าย	80000	795	511
6339		\N	\N	ท้ายสำเภา	80000	795	511
6337		\N	\N	นาพรุ	80000	795	511
6338		\N	\N	นาสาร	80000	795	511
6225		\N	\N	กะทูน	80270	780	511
6228		\N	\N	ควนกลาง	80270	780	511
6224		\N	\N	พิปูน	80270	780	511
6227		\N	\N	ยางค้อม	80270	780	511
6226		\N	\N	เขาพระ	80270	780	511
6304		\N	\N	ควนชุม	80130	788	511
6303		\N	\N	ควนพัง	80130	788	511
6334		\N	\N	ควนเกย	80130	788	511
6300		\N	\N	ร่อนพิบูลย์	80130	788	511
6301		\N	\N	หินตก	80350	788	511
6302		\N	\N	เสาธง	80350	788	511
6212		\N	\N	กำโลน	80230	778	511
6213		\N	\N	ขุนทะเล	80230	778	511
6211		\N	\N	ท่าดี	80230	778	511
6210		\N	\N	ลานสกา	80230	778	511
6209		\N	\N	เขาแก้ว	80230	778	511
6307		\N	\N	ฉลอง	80120	789	511
6306		\N	\N	ทุ่งปรัง	80120	789	511
7317		\N	\N	ทุ่งใส	80120	789	511
6305		\N	\N	สิชล	80120	789	511
6310		\N	\N	สี่ขีด	80120	789	511
6312		\N	\N	เขาน้อย	80120	789	511
6311		\N	\N	เทพราช	80340	789	511
6309		\N	\N	เปลี่ยน	80120	789	511
6308		\N	\N	เสาเภา	80340	789	511
6324		\N	\N	ควนชะลิก	80170	791	511
6318		\N	\N	ทรายขาว	80170	791	511
6323		\N	\N	ท่าซอม	80170	791	511
6322		\N	\N	บางนบ	80170	791	511
6321		\N	\N	บ้านราม	80170	791	511
6325		\N	\N	รามแก้ว	80170	791	511
6317		\N	\N	หน้าสตน	80170	791	511
6316		\N	\N	หัวไทร	80170	791	511
6326		\N	\N	เกาะเพชร	80170	791	511
6320		\N	\N	เขาพังไกร	80170	791	511
6319		\N	\N	แหลม	80170	791	511
6348		\N	\N	ดอนตรอ	80290	798	511
6350		\N	\N	ทางพูน	80290	798	511
6349		\N	\N	สวนหลวง	80190	798	511
6347		\N	\N	เชียรเขา	80190	798	511
6236		\N	\N	การะเกด	80190	781	511
6230		\N	\N	ท่าขนาน	80190	781	511
6234		\N	\N	ท้องลำเจียก	80190	781	511
6231		\N	\N	บ้านกลาง	80190	781	511
6232		\N	\N	บ้านเนิน	80190	781	511
6237		\N	\N	เขาพระบาท	80190	781	511
6229		\N	\N	เชียรใหญ่	80190	781	511
6235		\N	\N	เสือหึง	80190	781	511
6238		\N	\N	แม่เจ้าอยู่หัว	80190	781	511
6233		\N	\N	ไสหมาก	80190	781	511
6195		\N	\N	กำแพงเซา	80280	776	511
7318		\N	\N	คลัง	80000	776	511
6199		\N	\N	ท่างิ้ว	80280	776	511
6203		\N	\N	ท่าซัก	80000	776	511
7319		\N	\N	ท่าวัง	80000	776	511
6204		\N	\N	ท่าเรือ	80000	776	511
6192		\N	\N	ท่าไร่	80000	776	511
6194		\N	\N	นาทราย	80280	776	511
6198		\N	\N	นาเคียน	80000	776	511
6201		\N	\N	บางจาก	80330	776	511
6193		\N	\N	ปากนคร	80000	776	511
6202		\N	\N	ปากพูน	80000	776	511
6197		\N	\N	มะม่วงสองต้น	80000	776	511
6200		\N	\N	โพธิ์เสด็จ	80000	776	511
7302		\N	\N	ในเมือง	80000	776	511
6196		\N	\N	ไชยมนตรี	80000	776	511
4992		\N	\N	ชุมตาบง	60150	644	411
4993		\N	\N	ปางสวรรค์	60150	644	411
4901		\N	\N	ฆะมัง	60120	632	411
4891		\N	\N	ชุมแสง	60120	632	411
4892		\N	\N	ทับกฤช	60250	632	411
4902		\N	\N	ทับกฤชใต้	60250	632	411
4895		\N	\N	ท่าไม้	60120	632	411
4896		\N	\N	บางเคียน	60120	632	411
4898		\N	\N	พันลาน	60250	632	411
4893		\N	\N	พิกุล	60120	632	411
4897		\N	\N	หนองกระเจา	60120	632	411
4894		\N	\N	เกยไชย	60120	632	411
4899		\N	\N	โคกหม้อ	60120	632	411
4900		\N	\N	ไผ่สิงห์	60120	632	411
4980		\N	\N	ตากฟ้า	60190	641	411
4984		\N	\N	พุนกยูง	60190	641	411
4981		\N	\N	ลำพยนต์	60190	641	411
4982		\N	\N	สุขสำราญ	60190	641	411
4983		\N	\N	หนองพิกุล	60190	641	411
4985		\N	\N	อุดมธัญญา	60190	641	411
4986		\N	\N	เขาชายธง	60190	641	411
4931		\N	\N	จันเสน	60260	636	411
4930		\N	\N	ช่องแค	60210	636	411
4929		\N	\N	ตาคลี	60140	636	411
4938		\N	\N	พรหมนิมิต	60210	636	411
4937		\N	\N	ลาดทิพรส	60260	636	411
4936		\N	\N	สร้อยทอง	60210	636	411
4935		\N	\N	หนองหม้อ	60140	636	411
4934		\N	\N	หนองโพ	60140	636	411
4933		\N	\N	หัวหวาย	60140	636	411
4932		\N	\N	ห้วยหอม	60210	636	411
4944		\N	\N	ดอนคา	60160	637	411
4945		\N	\N	ทำนบ	60160	637	411
4939		\N	\N	ท่าตะโก	60160	637	411
4940		\N	\N	พนมรอก	60160	637	411
4947		\N	\N	พนมเศษ	60160	637	411
4943		\N	\N	วังมหากร	60160	637	411
4946		\N	\N	วังใหญ่	60160	637	411
4942		\N	\N	สายลำโพง	60160	637	411
4948		\N	\N	หนองหลวง	60160	637	411
4941		\N	\N	หัวถนน	60160	637	411
4920		\N	\N	ด่านช้าง	60180	634	411
4918		\N	\N	ตาขีด	60180	634	411
4919		\N	\N	ตาสัง	60180	634	411
4912		\N	\N	ท่างิ้ว	60180	634	411
4913		\N	\N	บางตาหงาย	60180	634	411
4917		\N	\N	บางแก้ว	60180	634	411
4923		\N	\N	บึงปลาทู	60180	634	411
4916		\N	\N	บ้านแดน	60180	634	411
4921		\N	\N	หนองกรด	60180	634	411
4922		\N	\N	หนองตางู	60180	634	411
4914		\N	\N	หูกวาง	60180	634	411
4915		\N	\N	อ่างทอง	60180	634	411
4924		\N	\N	เจริญผล	60180	634	411
4964		\N	\N	ท่าน้ำอ้อย	60130	639	411
4959		\N	\N	นิคมเขาบ่อแก้ว	60130	639	411
4965		\N	\N	น้ำทรง	60130	639	411
4957		\N	\N	พยุหะ	60130	639	411
4960		\N	\N	ม่วงหัก	60130	639	411
4961		\N	\N	ยางขาว	60130	639	411
4962		\N	\N	ย่านมัทรี	60130	639	411
4967		\N	\N	สระทะเล	60130	639	411
4966		\N	\N	เขากะลา	60130	639	411
4963		\N	\N	เขาทอง	60130	639	411
4958		\N	\N	เนินมะกอก	60130	639	411
4976		\N	\N	บ้านไร่	60150	640	411
4973		\N	\N	มาบแก	60150	640	411
4968		\N	\N	ลาดยาว	60150	640	411
4970		\N	\N	วังม้า	60150	640	411
4971		\N	\N	วังเมือง	60150	640	411
4978		\N	\N	ศาลเจ้าไก่ต่อ	60150	640	411
4979		\N	\N	สระแก้ว	60150	640	411
4972		\N	\N	สร้อยละคร	60150	640	411
4975		\N	\N	หนองนมวัว	60150	640	411
4974		\N	\N	หนองยาว	60150	640	411
4969		\N	\N	ห้วยน้ำหอม	60150	640	411
4977		\N	\N	เนินขี้เหล็ก	60150	640	411
4910		\N	\N	ทุ่งทอง	60110	633	411
4905		\N	\N	ธารทหาร	60110	633	411
4911		\N	\N	วังบ่อ	60110	633	411
4904		\N	\N	หนองกลับ	60110	633	411
4903		\N	\N	หนองบัว	60110	633	411
4908		\N	\N	ห้วยถั่วเหนือ	60110	633	411
4907		\N	\N	ห้วยถั่วใต้	60110	633	411
4906		\N	\N	ห้วยร่วม	60110	633	411
4909		\N	\N	ห้วยใหญ่	60110	633	411
4925		\N	\N	มหาโพธิ	60230	635	411
4926		\N	\N	หนองเต่า	60230	635	411
4928		\N	\N	หัวดง	60230	635	411
7445		\N	\N	เก้าเลี้ยว	60230	635	411
4927		\N	\N	เขาดิน	60230	635	411
4866		\N	\N	กลางแดด	60000	630	411
4869		\N	\N	ตะเคียนเลื่อน	60000	630	411
4870		\N	\N	นครสวรรค์ตก	60000	630	411
4871		\N	\N	นครสวรรค์ออก	60000	630	411
4872		\N	\N	บางพระหลวง	60000	630	411
4873		\N	\N	บางม่วง	60000	630	411
4881		\N	\N	บึงเสนาท	60000	630	411
4874		\N	\N	บ้านมะเกลือ	60000	630	411
4875		\N	\N	บ้านแก่ง	60000	630	411
4865		\N	\N	ปากน้ำโพ	60000	630	411
4876		\N	\N	พระนอน	60000	630	411
4877		\N	\N	วัดไทรย์	60000	630	411
4878		\N	\N	หนองกรด	60240	630	411
4879		\N	\N	หนองกระโดน	60240	630	411
4880		\N	\N	หนองปลิง	60000	630	411
4867		\N	\N	เกรียงไกร	60000	630	411
4868		\N	\N	แควใหญ่	60000	630	411
4989		\N	\N	วังซ่าน	60150	642	411
4990		\N	\N	เขาชนกัน	60150	642	411
4987		\N	\N	แม่วงก์	60150	642	411
4988		\N	\N	แม่เล่ย์	60150	642	411
4991		\N	\N	แม่เปิน	60150	643	411
4886		\N	\N	นากลาง	60170	631	411
4885		\N	\N	บางประมุง	60170	631	411
4884		\N	\N	บางมะฝ่อ	60170	631	411
4883		\N	\N	ยางตาล	60170	631	411
4887		\N	\N	ศาลาแดง	60170	631	411
4890		\N	\N	หาดสูง	60170	631	411
4888		\N	\N	เนินกว้าว	60170	631	411
4889		\N	\N	เนินศาลา	60170	631	411
4882		\N	\N	โกรกพระ	60170	631	411
4952		\N	\N	ตะคร้อ	60220	638	411
4955		\N	\N	นาขอม	60220	638	411
4954		\N	\N	วังข่อย	60220	638	411
4951		\N	\N	วังน้ำลัด	60220	638	411
4950		\N	\N	สำโรงชัย	60220	638	411
4949		\N	\N	โคกเดื่อ	60220	638	411
4953		\N	\N	โพธิ์ประสาท	60220	638	411
4956		\N	\N	ไพศาลี	60220	638	411
216		\N	\N	บางกรวย	11130	58	211
218		\N	\N	บางขนุน	11130	58	211
219		\N	\N	บางขุนกอง	11130	58	211
220		\N	\N	บางคูเวียง	11130	58	211
217		\N	\N	บางสีทอง	11130	58	211
222		\N	\N	ปลายบาง	11130	58	211
221		\N	\N	มหาสวัสดิ์	11130	58	211
215		\N	\N	วัดชลอ	11130	58	211
223		\N	\N	ศาลากลาง	11130	58	211
233		\N	\N	บางคูรัด	11110	60	211
231		\N	\N	บางบัวทอง	11110	60	211
237		\N	\N	บางรักพัฒนา	11110	60	211
232		\N	\N	บางรักใหญ่	11110	60	211
236		\N	\N	พิมลราช	11110	60	211
234		\N	\N	ละหาร	11110	60	211
235		\N	\N	ลำโพ	11110	60	211
230		\N	\N	โสนลอย	11110	60	211
224		\N	\N	บางม่วง	11140	59	211
226		\N	\N	บางเลน	11140	59	211
225		\N	\N	บางแม่นาง	11140	59	211
228		\N	\N	บางใหญ่	11140	59	211
229		\N	\N	บ้านใหม่	11140	59	211
227		\N	\N	เสาธงหิน	11140	59	211
7373		\N	\N	คลองข่อย	11120	62	211
250		\N	\N	คลองพระอุดม	11120	62	211
255		\N	\N	คลองเกลือ	11120	62	211
251		\N	\N	ท่าอิฐ	11120	62	211
246		\N	\N	บางตลาด	11120	62	211
249		\N	\N	บางตะไนย์	11120	62	211
254		\N	\N	บางพลับ	11120	62	211
248		\N	\N	บางพูด	11120	62	211
247		\N	\N	บ้านใหม่	11120	62	211
245		\N	\N	ปากเกร็ด	11120	62	211
253		\N	\N	อ้อมเกร็ด	11120	62	211
252		\N	\N	เกาะเกร็ด	11120	62	211
206		\N	\N	ตลาดขวัญ	11000	57	211
209		\N	\N	ท่าทราย	11000	57	211
208		\N	\N	บางกระสอ	11000	57	211
212		\N	\N	บางกร่าง	11000	57	211
214		\N	\N	บางรักน้อย	11000	57	211
211		\N	\N	บางศรีเมือง	11000	57	211
207		\N	\N	บางเขน	11000	57	211
210		\N	\N	บางไผ่	11000	57	211
205		\N	\N	สวนใหญ่	11000	57	211
213		\N	\N	ไทรม้า	11000	57	211
242		\N	\N	ขุนศรี	11150	61	211
243		\N	\N	คลองขวาง	11150	61	211
244		\N	\N	ทวีวัฒนา	11150	61	211
239		\N	\N	ราษฎร์นิยม	11150	61	211
240		\N	\N	หนองเพรางาย	11150	61	211
238		\N	\N	ไทรน้อย	11150	61	211
241		\N	\N	ไทรใหญ่	11150	61	211
7289		\N	\N	จะแนะ	96220	925	527
7292		\N	\N	ช้างเผือก	96220	925	527
7290		\N	\N	ดุซงญอ	96220	925	527
7291		\N	\N	ผดุงมาตร	96220	925	527
7233		\N	\N	นานาค	96110	915	527
7231		\N	\N	บางขุนทอง	96110	915	527
7229		\N	\N	พร่อน	96110	915	527
7230		\N	\N	ศาลาใหม่	96110	915	527
7232		\N	\N	เกาะสะท้อน	96110	915	527
7227		\N	\N	เจ๊ะเห	96110	915	527
7234		\N	\N	โฆษิต	96110	915	527
7228		\N	\N	ไพรวัน	96110	915	527
7237		\N	\N	กาเยาะมาตี	96170	916	527
7235		\N	\N	บาเจาะ	96170	916	527
7239		\N	\N	บาเระเหนือ	96170	916	527
7483		\N	\N	บาเระใต้	96170	916	527
7238		\N	\N	ปะลุกาสาเมาะ	96170	916	527
7236		\N	\N	ลุโบะสาวอ	96170	916	527
7242		\N	\N	จอเบาะ	96180	917	527
7245		\N	\N	ตะปอเยาะ	96180	917	527
7240		\N	\N	ยี่งอ	96180	917	527
7241		\N	\N	ละหาร	96180	917	527
7243		\N	\N	ลุโบะบายะ	96180	917	527
7244		\N	\N	ลุโบะบือซา	96180	917	527
7249		\N	\N	กาลิซา	96130	918	527
7246		\N	\N	ตันหยงมัส	96130	918	527
7247		\N	\N	ตันหยงลิมอ	96130	918	527
7248		\N	\N	บองอ	96220	918	527
7250		\N	\N	บาโงสะโต	96130	918	527
7252		\N	\N	มะรือโบตก	96130	918	527
7251		\N	\N	เฉลิม	96130	918	527
7257		\N	\N	บาตง	96150	919	527
7253		\N	\N	รือเสาะ	96150	919	527
7259		\N	\N	รือเสาะออก	96150	919	527
7258		\N	\N	ลาโละ	96150	919	527
7256		\N	\N	สามัคคี	96150	919	527
7254		\N	\N	สาวอ	96150	919	527
7261		\N	\N	สุวารี	96150	919	527
7255		\N	\N	เรียง	96150	919	527
7260		\N	\N	โคกสะตอ	96150	919	527
7266		\N	\N	กาหลง	96210	920	527
7262		\N	\N	ซากอ	96210	920	527
7263		\N	\N	ตะมะยูง	96210	920	527
7267		\N	\N	ศรีบรรพต	96210	920	527
7264		\N	\N	ศรีสาคร	96210	920	527
7265		\N	\N	เชิงคีรี	96210	920	527
7277		\N	\N	ภูเขาทอง	96190	922	527
7274		\N	\N	มาโมง	96190	922	527
7278		\N	\N	ร่มไทร	96190	922	527
7275		\N	\N	สุคิริน	96190	922	527
7276		\N	\N	เกียร์	96190	922	527
7288		\N	\N	กาวะ	96140	924	527
7283		\N	\N	ปะลุรู	96140	924	527
7287		\N	\N	ริโก๋	96140	924	527
7286		\N	\N	สากอ	96140	924	527
7284		\N	\N	สุไหงปาดี	96140	924	527
7285		\N	\N	โต๊ะเด็ง	96140	924	527
7280		\N	\N	ปาเสมัส	96120	923	527
7282		\N	\N	ปูโยะ	96120	923	527
7281		\N	\N	มูโนะ	96120	923	527
7279		\N	\N	สุไหงโก-ลก	96120	923	527
7293		\N	\N	จวบ	96130	926	527
7294		\N	\N	บูกิต	96130	926	527
7295		\N	\N	มะรือโบออก	96130	926	527
7224		\N	\N	กะลุวอ	96000	914	527
7225		\N	\N	กะลุวอเหนือ	96000	914	527
7220		\N	\N	บางนาค	96000	914	527
7223		\N	\N	บางปอ	96000	914	527
7222		\N	\N	มะนังตายอ	96000	914	527
7221		\N	\N	ลำภู	96000	914	527
7226		\N	\N	โคกเคียน	96000	914	527
7269		\N	\N	กายูคละ	96160	921	527
7270		\N	\N	ฆอเลาะ	96160	921	527
7273		\N	\N	เอราวัณ	96160	921	527
7272		\N	\N	แม่ดง	96160	921	527
7268		\N	\N	แว้ง	96160	921	527
7271		\N	\N	โละจูด	96160	921	527
4604		\N	\N	งอบ	55130	588	425
4606		\N	\N	ทุ่งช้าง	55130	588	425
4603		\N	\N	ปอน	55130	588	425
4605		\N	\N	และ	55130	588	425
4582		\N	\N	จอมพระ	55140	586	425
4580		\N	\N	ตาลชุม	55140	586	425
4584		\N	\N	ท่าวังผา	55140	586	425
4577		\N	\N	ป่าคา	55140	586	425
4578		\N	\N	ผาตอ	55140	586	425
4585		\N	\N	ผาทอง	55140	586	425
4579		\N	\N	ยม	55140	586	425
4576		\N	\N	ริม	55140	586	425
4581		\N	\N	ศรีภูมิ	55140	586	425
4583		\N	\N	แสนทอง	55140	586	425
4558		\N	\N	นาน้อย	55150	584	425
4564		\N	\N	น้ำตก	55150	584	425
4563		\N	\N	บัวใหญ่	55150	584	425
4560		\N	\N	ศรีษะเกษ	55150	584	425
4561		\N	\N	สถาน	55150	584	425
4562		\N	\N	สันทะ	55150	584	425
4559		\N	\N	เชียงของ	55150	584	425
4613		\N	\N	นาทะนุง	55180	590	425
4614		\N	\N	บ่อแก้ว	55180	590	425
4616		\N	\N	ปิงหลวง	55180	590	425
4615		\N	\N	เมืองลี	55180	590	425
4623		\N	\N	ดงพญา	55220	592	425
4620		\N	\N	บ่อเกลือเหนือ	55220	592	425
4621		\N	\N	บ่อเกลือใต้	55220	592	425
4622		\N	\N	ภูฟ้า	55220	592	425
4557		\N	\N	บ้านพี้	55190	583	425
4554		\N	\N	บ้านฟ้า	55190	583	425
4555		\N	\N	ป่าคาหลวง	55190	583	425
4556		\N	\N	สวด	55190	583	425
4565		\N	\N	ปัว	55120	585	425
4575		\N	\N	ป่ากลาง	55120	585	425
4573		\N	\N	ภูคา	55120	585	425
7438		\N	\N	วรนคร	55120	585	425
4569		\N	\N	ศิลาเพชร	55120	585	425
4568		\N	\N	ศิลาแลง	55120	585	425
4574		\N	\N	สกาด	55120	585	425
4567		\N	\N	สถาน	55120	585	425
4570		\N	\N	อวน	55120	585	425
4572		\N	\N	เจดีย์ชัย	55120	585	425
4566		\N	\N	แงง	55120	585	425
4571		\N	\N	ไชยวัฒนา	55120	585	425
4632		\N	\N	ท่าน้าว	55000	594	425
4628		\N	\N	นาปัง	55000	594	425
4630		\N	\N	น้ำเกี๋ยน	55000	594	425
4629		\N	\N	น้ำแก่น	55000	594	425
4633		\N	\N	ฝายแก้ว	55000	594	425
4627		\N	\N	ม่วงตึ๊ด	55000	594	425
4631		\N	\N	เมืองจัง	55000	594	425
4625		\N	\N	ชนแดน	55160	593	425
4624		\N	\N	นาไร่หลวง	55160	593	425
4626		\N	\N	ยอด	55160	593	425
4617		\N	\N	ดู่พงษ์	55210	591	425
4618		\N	\N	ป่าแลวหลวง	55210	591	425
4619		\N	\N	พงษ์	55210	591	425
4635		\N	\N	ขุนน่าน	55130	595	425
4634		\N	\N	ห้วยโก๋น	55130	595	425
4611		\N	\N	พญาแก้ว	55160	589	425
4610		\N	\N	พระธาตุ	55160	589	425
4612		\N	\N	พระพุทธบาท	55160	589	425
4607		\N	\N	เชียงกลาง	55160	589	425
4609		\N	\N	เชียงคาน	55160	589	425
4608		\N	\N	เปือ	55160	589	425
4546		\N	\N	กองควาย	55000	581	425
4545		\N	\N	ดู่ใต้	55000	581	425
4542		\N	\N	ถืมตอง	55000	581	425
4544		\N	\N	นาซาว	55000	581	425
4539		\N	\N	บ่อ	55000	581	425
4540		\N	\N	ผาสิงห์	55000	581	425
4547		\N	\N	สวก	55000	581	425
4548		\N	\N	สะเนียน	55000	581	425
4543		\N	\N	เรือง	55000	581	425
4538		\N	\N	ในเวียง	55000	581	425
4541		\N	\N	ไชยสถาน	55000	581	425
4586		\N	\N	กลางเวียง	55110	587	425
4587		\N	\N	ขึ่ง	55110	587	425
4600		\N	\N	จอมจันทร์	55110	587	425
4589		\N	\N	ตาลชุม	55110	587	425
4602		\N	\N	ทุ่งศรีทอง	55110	587	425
4590		\N	\N	นาเหลือง	55110	587	425
4593		\N	\N	น้ำปั้ว	55110	587	425
4592		\N	\N	น้ำมวบ	55110	587	425
4595		\N	\N	ปงสนุก	55110	587	425
4594		\N	\N	ยาบหัวนา	55110	587	425
4591		\N	\N	ส้าน	55110	587	425
4597		\N	\N	ส้านนาหนองใหม่	55110	587	425
4596		\N	\N	อ่ายนาไลย	55110	587	425
4598		\N	\N	แม่ขะนิง	55110	587	425
4601		\N	\N	แม่สา	55110	587	425
4599		\N	\N	แม่สาคร	55110	587	425
4588		\N	\N	ไหล่น่าน	55110	587	425
4552		\N	\N	น้ำปาย	55170	582	425
4551		\N	\N	น้ำพาง	55170	582	425
4549		\N	\N	หนองแดง	55170	582	425
4550		\N	\N	หมอเมือง	55170	582	425
4553		\N	\N	แม่จริม	55170	582	425
3317		\N	\N	ดงบัง	38220	424	528
3318		\N	\N	ท่าดอกคำ	38220	424	528
3315		\N	\N	บึงโขงหลง	38220	424	528
3316		\N	\N	โพธิ์หมากแข้ง	38220	424	528
3325		\N	\N	บุ่งคล้า	38000	426	528
3326		\N	\N	หนองเดิ่น	38000	426	528
3327		\N	\N	โคกกว้าง	38000	426	528
3311		\N	\N	นากั้ง	38190	423	528
3314		\N	\N	นาดง	38190	423	528
3309		\N	\N	ปากคาด	38190	423	528
3313		\N	\N	สมสนุก	38190	423	528
3310		\N	\N	หนองยอง	38190	423	528
3312		\N	\N	โนนศิลา	38190	423	528
3267		\N	\N	ดอนหญ้านาง	38180	417	528
3271		\N	\N	ป่าแฝก	38180	417	528
3268		\N	\N	พรเจริญ	38180	417	528
3270		\N	\N	วังชมภู	38180	417	528
3266		\N	\N	ศรีชมภู	38180	417	528
3272		\N	\N	ศรีสำราญ	38180	417	528
1762		\N	\N	เย้ยปราสาท	31210	234	313
3269		\N	\N	หนองหัวช้าง	38180	417	528
3321		\N	\N	ชุมภูพร	38210	425	528
3323		\N	\N	นาสะแบง	38210	425	528
3324		\N	\N	นาสิงห์	38210	425	528
3322		\N	\N	นาแสง	38210	425	528
3320		\N	\N	ศรีวิไล	38210	425	528
3301		\N	\N	ซาง	38150	422	528
3302		\N	\N	ท่ากกแดง	38150	422	528
3306		\N	\N	ท่าสะอาด	38150	422	528
3305		\N	\N	น้ำจั้น	38150	422	528
3303		\N	\N	บ้านต้อง	38150	422	528
3304		\N	\N	ป่งไฮ	38150	422	528
3307		\N	\N	หนองทุ่ม	38150	422	528
3300		\N	\N	เซกา	38150	422	528
3308		\N	\N	โสกก่าม	38150	422	528
3264		\N	\N	คำนาดี	38000	416	528
3262		\N	\N	ชัยพร	38000	416	528
3260		\N	\N	นาสวรรค์	38000	416	528
3254		\N	\N	บึงกาฬ	38000	416	528
3263		\N	\N	วิศิษฐ์	38000	416	528
3256		\N	\N	หนองเข็ง	38000	416	528
3258		\N	\N	หนองเลิง	38000	416	528
3257		\N	\N	หอคำ	38000	416	528
3259		\N	\N	โคกก่อง	38000	416	528
3255		\N	\N	โนนสมบูรณ์	38000	416	528
3265		\N	\N	โป่งเปือย	38000	416	528
3261		\N	\N	ไคสี	38000	416	528
3287		\N	\N	คำแก้ว	38170	419	528
3289		\N	\N	ถ้ำเจริญ	38170	419	528
3288		\N	\N	บัวตูม	38170	419	528
3286		\N	\N	ศรีชมภู	38170	419	528
3285		\N	\N	หนองพันทา	38170	419	528
3290		\N	\N	เหล่าทอง	38170	419	528
3284		\N	\N	โซ่	38170	419	528
1838		\N	\N	กระสัง	31160	232	313
1743		\N	\N	กันทรารมย์	31160	232	313
1740		\N	\N	ชุมแสง	31160	232	313
1741		\N	\N	บ้านปรือ	31160	232	313
1736		\N	\N	ลำดวน	31160	232	313
1744		\N	\N	ศรีภูมิ	31160	232	313
1737		\N	\N	สองชั้น	31160	232	313
1738		\N	\N	สูงเนิน	31160	232	313
1739		\N	\N	หนองเต็ง	31160	232	313
1742		\N	\N	ห้วยสำราญ	31160	232	313
1764		\N	\N	เมืองไผ่	31160	232	313
1729		\N	\N	คูเมือง	31190	231	313
1734		\N	\N	ตูมใหญ่	31190	231	313
1731		\N	\N	บ้านแพ	31190	231	313
1730		\N	\N	ปะเคียบ	31190	231	313
1732		\N	\N	พรสำราญ	31190	231	313
1735		\N	\N	หนองขมาร	31190	231	313
1733		\N	\N	หินเหล็กไฟ	31190	231	313
1871		\N	\N	ชำนิ	31110	247	313
1874		\N	\N	ช่อผกา	31110	247	313
1875		\N	\N	ละลวด	31110	247	313
1872		\N	\N	หนองปล่อง	31110	247	313
1873		\N	\N	เมืองยาง	31110	247	313
1876		\N	\N	โคกสนวน	31110	247	313
1753		\N	\N	ก้านเหลือง	31110	233	313
1748		\N	\N	ชุมแสง	31110	233	313
1751		\N	\N	ถนนหัก	31110	233	313
1756		\N	\N	ทรัพย์พระยา	31110	233	313
1759		\N	\N	ทุ่งแสงทอง	31110	233	313
1745		\N	\N	นางรอง	31110	233	313
1754		\N	\N	บ้านสิงห์	31110	233	313
1755		\N	\N	ลำไทรโยง	31110	233	313
1746		\N	\N	สะเดา	31110	233	313
1750		\N	\N	หนองกง	31110	233	313
1757		\N	\N	หนองยายพิมพ์	31110	233	313
1749		\N	\N	หนองโบสถ์	31110	233	313
1760		\N	\N	หนองโสน	31110	233	313
1752		\N	\N	หนองไทร	31110	233	313
1758		\N	\N	หัวถนน	31110	233	313
1847		\N	\N	ดอนกอก	31230	242	313
1844		\N	\N	นาโพธิ์	31230	242	313
1845		\N	\N	บ้านคู	31230	242	313
1846		\N	\N	บ้านดู่	31230	242	313
1848		\N	\N	ศรีสว่าง	31230	242	313
1801		\N	\N	จันทบเพชร	31180	237	313
1800		\N	\N	บึงเจริญ	31180	237	313
1793		\N	\N	บ้านกรวด	31180	237	313
1796		\N	\N	ปราสาท	31180	237	313
1798		\N	\N	สายตะกู	31180	237	313
1795		\N	\N	หนองไม้งาม	31180	237	313
1799		\N	\N	หินลาด	31180	237	313
1766		\N	\N	โคกสว่าง	31210	234	313
1802		\N	\N	เขาดินเหนือ	31180	237	313
1794		\N	\N	โนนเจริญ	31180	237	313
1885		\N	\N	บ้านด่าน	31000	250	313
1797		\N	\N	ปราสาท	31000	250	313
1886		\N	\N	วังเหนือ	31000	250	313
1887		\N	\N	โนนขวาง	31000	250	313
1880		\N	\N	กู่สวนแตง	31120	248	313
1878		\N	\N	ทองหลาง	31120	248	313
1881		\N	\N	หนองเยือง	31120	248	313
1877		\N	\N	หนองแวง	31120	248	313
1879		\N	\N	แดงใหญ่	31120	248	313
1781		\N	\N	จรเข้มาก	31140	236	313
1786		\N	\N	ตะโกตาพิ	31140	236	313
1779		\N	\N	บ้านไทร	31140	236	313
1791		\N	\N	ประทัดบุ	31140	236	313
1777		\N	\N	ประโคนชัย	31140	236	313
1782		\N	\N	ปังกู	31140	236	313
1780		\N	\N	ละเวี้ย	31140	236	313
1792		\N	\N	สี่เหลี่ยม	31140	236	313
1788		\N	\N	หนองบอน	31140	236	313
1787		\N	\N	เขาคอก	31140	236	313
1778		\N	\N	แสลงโทน	31140	236	313
1790		\N	\N	โคกตูม	31140	236	313
1789		\N	\N	โคกมะขาม	31140	236	313
1784		\N	\N	โคกม้า	31140	236	313
1783		\N	\N	โคกย่าง	31140	236	313
1785		\N	\N	ไพศาล	31140	236	313
1839		\N	\N	ปะคำ	31220	241	313
1841		\N	\N	หนองบัว	31220	241	313
1843		\N	\N	หูทำนบ	31220	241	313
1842		\N	\N	โคกมะม่วง	31220	241	313
1840		\N	\N	ไทยเจริญ	31220	241	313
1856		\N	\N	จันดุม	31250	244	313
1858		\N	\N	ป่าชัน	31250	244	313
1747		\N	\N	สะเดา	31250	244	313
1859		\N	\N	สำโรง	31250	244	313
1857		\N	\N	โคกขมิ้น	31250	244	313
1805		\N	\N	บ้านจาน	31120	238	313
1809		\N	\N	บ้านยาง	31120	238	313
1806		\N	\N	บ้านเป้า	31120	238	313
1807		\N	\N	บ้านแวง	31120	238	313
1803		\N	\N	พุทไธสง	31120	238	313
1804		\N	\N	มะเฟือง	31120	238	313
1811		\N	\N	หายโศก	31120	238	313
1773		\N	\N	ตาจง	31170	235	313
1772		\N	\N	ละหานทราย	31170	235	313
1774		\N	\N	สำโรงใหม่	31170	235	313
1776		\N	\N	หนองตะครอง	31170	235	313
1775		\N	\N	หนองแวง	31170	235	313
7395		\N	\N	โคกว่าน	31170	235	313
1816		\N	\N	ตลาดโพธิ์	31130	239	313
1815		\N	\N	ทะเมนชัย	31130	239	313
1825		\N	\N	บุโพธิ์	31130	239	313
1810		\N	\N	บ้านยาง	31130	239	313
1821		\N	\N	ผไทรินทร์	31130	239	313
1812		\N	\N	ลำปลายมาศ	31130	239	313
1817		\N	\N	หนองกะทิง	31130	239	313
1813		\N	\N	หนองคู	31130	239	313
1824		\N	\N	หนองบัวโคก	31130	239	313
7393		\N	\N	หนองโดน	31130	239	313
1823		\N	\N	หินโคน	31130	239	313
1820		\N	\N	เมืองแฝก	31130	239	313
1814		\N	\N	แสลงพัน	31130	239	313
1818		\N	\N	โคกกลาง	31130	239	313
1822		\N	\N	โคกล่าม	31130	239	313
1819		\N	\N	โคกสะอาด	31130	239	313
1836		\N	\N	กระสัง	31150	240	313
7394		\N	\N	ชุมแสง	31150	240	313
1832		\N	\N	ดอนมนต์	31150	240	313
1828		\N	\N	ทุ่งวัง	31150	240	313
1833		\N	\N	ท่าม่วง	31150	240	313
1827		\N	\N	นิคม	31150	240	313
1831		\N	\N	ร่อนทอง	31150	240	313
1826		\N	\N	สตึก	31150	240	313
1835		\N	\N	สนามชัย	31150	240	313
1834		\N	\N	สะแก	31150	240	313
1830		\N	\N	หนองใหญ่	31150	240	313
1829		\N	\N	เมืองแก	31150	240	313
1765		\N	\N	ดอนอะราง	31210	234	313
1767		\N	\N	ทุ่งกระตาดพัฒนา	31210	234	313
1768		\N	\N	ทุ่งกระเต็น	31210	234	313
1769		\N	\N	ท่าโพธิ์ชัย	31210	234	313
1771		\N	\N	บุกระสัง	31210	234	313
1761		\N	\N	หนองกี่	31210	234	313
1763		\N	\N	เมืองไผ่	31210	234	313
1770		\N	\N	โคกสูง	31210	234	313
1855		\N	\N	สระทอง	31240	243	313
1849		\N	\N	สระแก้ว	31240	243	313
1852		\N	\N	หนองชัยศรี	31240	243	313
1850		\N	\N	ห้วยหิน	31240	243	313
1854		\N	\N	เมืองฝ้าย	31240	243	313
1853		\N	\N	เสาเดียว	31240	243	313
1851		\N	\N	ไทยสามัคคี	31240	243	313
1862		\N	\N	ตาเสา	31000	245	313
1863		\N	\N	บ้านตะโก	31000	245	313
1864		\N	\N	สนวน	31000	245	313
1861		\N	\N	สามแวง	31000	245	313
1860		\N	\N	ห้วยราช	31000	245	313
7390		\N	\N	ห้วยราชา	31000	245	313
1866		\N	\N	เมืองโพธิ์	31000	245	313
1865		\N	\N	โคกเหล็ก	31000	245	313
7320		\N	\N	ตาเป๊ก	31110	252	313
1894		\N	\N	ถาวร	31170	252	313
1895		\N	\N	ยายแย้มวัฒนา	31170	252	313
1893		\N	\N	อีสานเขต	31110	252	313
1892		\N	\N	เจริญสุข	31110	252	313
1837		\N	\N	กระสัง	31000	230	313
1728		\N	\N	กลันทา	31000	230	313
1725		\N	\N	ชุมเห็ด	31000	230	313
1720		\N	\N	ถลุงเหล็ก	31000	230	313
1724		\N	\N	บัวทอง	31000	230	313
1716		\N	\N	บ้านบัว	31000	230	313
1808		\N	\N	บ้านยาง	31000	230	313
1719		\N	\N	พระครู	31000	230	313
1722		\N	\N	ลุมปุ๊ก	31000	230	313
1718		\N	\N	สวายจีก	31000	230	313
1723		\N	\N	สองห้อง	31000	230	313
1727		\N	\N	สะแกซำ	31000	230	313
1717		\N	\N	สะแกโพรง	31000	230	313
1721		\N	\N	หนองตาด	31000	230	313
1726		\N	\N	หลักเขต	31000	230	313
1714		\N	\N	อิสาณ	31000	230	313
7391		\N	\N	เมืองฝาง	31000	230	313
1715		\N	\N	เสม็ด	31000	230	313
7392		\N	\N	ในเมือง	31000	230	313
1889		\N	\N	ดงพลอง	31150	251	313
1890		\N	\N	สระบัว	31150	251	313
1891		\N	\N	หัวฝาย	31150	251	313
1888		\N	\N	แคนดง	31150	251	313
1884		\N	\N	ลำนางรอง	31260	249	313
1883		\N	\N	ส้มป่อย	31260	249	313
1882		\N	\N	โนนดินแดง	31260	249	313
1870		\N	\N	ดงอีจาน	31110	246	313
1868		\N	\N	ทุ่งจังหัน	31110	246	313
1869		\N	\N	โกรกแก้ว	31110	246	313
1867		\N	\N	โนนสุวรรณ	31110	246	313
271		\N	\N	คลองสอง	12120	64	212
272		\N	\N	คลองสาม	12120	64	212
273		\N	\N	คลองสี่	12120	64	212
275		\N	\N	คลองหก	12120	64	212
270		\N	\N	คลองหนึ่ง	12120	64	212
274		\N	\N	คลองห้า	12120	64	212
276		\N	\N	คลองเจ็ด	12120	64	212
282		\N	\N	บึงน้ำรักษ์	12110	65	212
278		\N	\N	บึงยี่โถ	12130	65	212
281		\N	\N	บึงสนั่น	12110	65	212
277		\N	\N	ประชาธิปัตย์	12130	65	212
279		\N	\N	รังสิต	12110	65	212
280		\N	\N	ลำผักกูด	12110	65	212
294		\N	\N	คลองพระอุดม	12140	67	212
293		\N	\N	คูขวาง	12140	67	212
292		\N	\N	คูบางหลวง	12140	67	212
295		\N	\N	บ่อเงิน	12140	67	212
290		\N	\N	ระแหง	12140	67	212
291		\N	\N	ลาดหลุมแก้ว	12140	67	212
296		\N	\N	หน้าไม้	12140	67	212
297		\N	\N	คูคต	12130	68	212
303		\N	\N	บึงคอไห	12150	68	212
299		\N	\N	บึงคำพร้อย	12150	68	212
301		\N	\N	บึงทองหลาง	12150	68	212
304		\N	\N	พืชอุดม	12150	68	212
298		\N	\N	ลาดสวาย	12150	68	212
300		\N	\N	ลำลูกกา	12150	68	212
302		\N	\N	ลำไทร	12150	68	212
308		\N	\N	กระแชง	12160	69	212
306		\N	\N	คลองควาย	12160	69	212
315		\N	\N	ท้ายเกาะ	12160	69	212
314		\N	\N	บางกระบือ	12160	69	212
305		\N	\N	บางเตย	12160	69	212
309		\N	\N	บางโพธิ์เหนือ	12160	69	212
312		\N	\N	บ้านงิ้ว	12160	69	212
311		\N	\N	บ้านปทุม	12160	69	212
307		\N	\N	สามโคก	12160	69	212
313		\N	\N	เชียงรากน้อย	12160	69	212
310		\N	\N	เชียงรากใหญ่	12160	69	212
289		\N	\N	นพรัตน์	12170	66	212
285		\N	\N	บึงกาสาม	12170	66	212
286		\N	\N	บึงชำอ้อ	12170	66	212
284		\N	\N	บึงบอน	12170	66	212
283		\N	\N	บึงบา	12170	66	212
288		\N	\N	ศาลาครุ	12170	66	212
287		\N	\N	หนองสามวัง	12170	66	212
267		\N	\N	บางกะดี	12000	63	212
261		\N	\N	บางขะแยง	12000	63	212
262		\N	\N	บางคูวัด	12000	63	212
256		\N	\N	บางปรอก	12000	63	212
265		\N	\N	บางพูด	12000	63	212
266		\N	\N	บางพูน	12000	63	212
263		\N	\N	บางหลวง	12000	63	212
264		\N	\N	บางเดื่อ	12000	63	212
260		\N	\N	บ้านกระแชง	12000	63	212
258		\N	\N	บ้านกลาง	12000	63	212
259		\N	\N	บ้านฉาง	12000	63	212
257		\N	\N	บ้านใหม่	12000	63	212
268		\N	\N	สวนพริกไทย	12000	63	212
269		\N	\N	หลักหก	12000	63	212
6152		\N	\N	กุยบุรี	77150	769	245
6153		\N	\N	กุยเหนือ	77150	769	245
6155		\N	\N	ดอนยายหนู	77150	769	245
6156		\N	\N	สามกระทาย	77150	769	245
6157		\N	\N	หาดขาม	77150	769	245
6154		\N	\N	เขาแดง	77150	769	245
6158		\N	\N	ทับสะแก	77130	770	245
6160		\N	\N	นาหูกวาง	77130	770	245
6162		\N	\N	ห้วยยาง	77130	770	245
6159		\N	\N	อ่างทอง	77130	770	245
6161		\N	\N	เขาล้าน	77130	770	245
6163		\N	\N	แสงอรุณ	77130	770	245
6164		\N	\N	กำเนิดนพคุณ	77140	771	245
6168		\N	\N	ชัยเกษม	77190	771	245
6169		\N	\N	ทองมงคล	77230	771	245
6167		\N	\N	ธงชัย	77190	771	245
6165		\N	\N	พงศ์ประศาสน์	77140	771	245
6166		\N	\N	ร่อนทอง	77230	771	245
6170		\N	\N	แม่รำพึง	77140	771	245
6174		\N	\N	ช้างแรก	77170	772	245
6173		\N	\N	ทรายทอง	77170	772	245
6172		\N	\N	บางสะพาน	77170	772	245
6171		\N	\N	ปากแพรก	77170	772	245
6175		\N	\N	ไชยราช	77170	772	245
6176		\N	\N	ปราณบุรี	77120	773	245
6178		\N	\N	ปากน้ำปราณ	77220	773	245
6180		\N	\N	วังก์พง	77120	773	245
6179		\N	\N	หนองตาแต้ม	77120	773	245
6181		\N	\N	เขาจ้าว	77120	773	245
6177		\N	\N	เขาน้อย	77120	773	245
7321		\N	\N	ศาลาลัย	77180	775	245
6189		\N	\N	ศิลาลอย	77180	775	245
6188		\N	\N	สามร้อยยอด	77120	775	245
6190		\N	\N	ไร่เก่า	77180	775	245
6191		\N	\N	ไร่ใหม่	77180	775	245
6186		\N	\N	ทับใต้	77110	774	245
7471		\N	\N	บึงนคร	77110	774	245
6185		\N	\N	หนองพลับ	77110	774	245
6183		\N	\N	หนองแก	77110	774	245
6182		\N	\N	หัวหิน	77110	774	245
6184		\N	\N	หินเหล็กไฟ	77110	774	245
6187		\N	\N	ห้วยสัตว์ใหญ่	77110	774	245
6148		\N	\N	คลองวาฬ	77000	768	245
6151		\N	\N	บ่อนอก	77210	768	245
6146		\N	\N	ประจวบคีรีขันธ์	77000	768	245
6149		\N	\N	ห้วยทราย	77000	768	245
6150		\N	\N	อ่าวน้อย	77210	768	245
6147		\N	\N	เกาะหลัก	77000	768	245
1273		\N	\N	กบินทร์	25110	179	233
1276		\N	\N	นนทรี	25110	179	233
1284		\N	\N	นาแขม	25110	179	233
1282		\N	\N	บ่อทอง	25110	179	233
1281		\N	\N	บ้านนา	25110	179	233
1277		\N	\N	ย่านรี	25110	179	233
1280		\N	\N	ลาดตะเคียน	25110	179	233
1275		\N	\N	วังดาล	25110	179	233
1278		\N	\N	วังตะเคียน	25110	179	233
1286		\N	\N	วังท่าช้าง	25110	179	233
1283		\N	\N	หนองกี่	25110	179	233
1279		\N	\N	หาดนางแก้ว	25110	179	233
1285		\N	\N	เขาไม้แก้ว	25110	179	233
1274		\N	\N	เมืองเก่า	25240	179	233
1290		\N	\N	ทุ่งโพธิ์	25220	180	233
1287		\N	\N	นาดี	25220	180	233
1292		\N	\N	บุพราหมณ์	25220	180	233
1289		\N	\N	สะพานหิน	25220	180	233
1288		\N	\N	สำพันตา	25220	180	233
1291		\N	\N	แก่งดินสอ	25220	180	233
1301		\N	\N	กระทุ่มแพ้ว	25150	181	233
1294		\N	\N	บางกระเบา	25150	181	233
1300		\N	\N	บางขาม	25150	181	233
1299		\N	\N	บางปลาร้า	25150	181	233
1298		\N	\N	บางพลวง	25150	181	233
1296		\N	\N	บางยาง	25150	181	233
1295		\N	\N	บางเตย	25150	181	233
1297		\N	\N	บางแตน	25150	181	233
1293		\N	\N	บ้านสร้าง	25150	181	233
1307		\N	\N	คำโตนด	25130	182	233
1306		\N	\N	ดงบัง	25130	182	233
1308		\N	\N	บุฝ้าย	25130	182	233
1304		\N	\N	บ้านหอย	25130	182	233
1302		\N	\N	ประจันตคาม	25130	182	233
1309		\N	\N	หนองแก้ว	25130	182	233
1305		\N	\N	หนองแสง	25130	182	233
1303		\N	\N	เกาะลอย	25130	182	233
1310		\N	\N	โพธิ์งาม	25130	182	233
1320		\N	\N	กรอกสมบูรณ์	25140	183	233
1316		\N	\N	ดงกระทงยาม	25140	183	233
1314		\N	\N	ท่าตูม	25140	183	233
1315		\N	\N	บางกุ้ง	25140	183	233
1313		\N	\N	บ้านทาม	25140	183	233
1311		\N	\N	ศรีมหาโพธิ	25140	183	233
1312		\N	\N	สัมพันธ์	25140	183	233
1317		\N	\N	หนองโพรง	25140	183	233
1318		\N	\N	หัวหว้า	25140	183	233
7126		\N	\N	ตะโละ	94150	902	526
1319		\N	\N	หาดยาง	25140	183	233
1323		\N	\N	คู้ลำพัน	25190	184	233
1321		\N	\N	โคกปีบ	25190	184	233
1322		\N	\N	โคกไทย	25190	184	233
1324		\N	\N	ไผ่ชะเลือด	25190	184	233
1270		\N	\N	ดงขี้เหล็ก	25000	178	233
1266		\N	\N	ดงพระราม	25000	178	233
1264		\N	\N	ท่างาม	25000	178	233
1265		\N	\N	บางบริบูรณ์	25000	178	233
1263		\N	\N	บางเดชะ	25000	178	233
1267		\N	\N	บ้านพระ	25230	178	233
1261		\N	\N	รอบเมือง	25000	178	233
1262		\N	\N	วัดโบสถ์	25000	178	233
1260		\N	\N	หน้าเมือง	25000	178	233
1271		\N	\N	เนินหอม	25230	178	233
1268		\N	\N	โคกไม้ลาย	25230	178	233
1272		\N	\N	โนนห้อม	25000	178	233
1269		\N	\N	ไม้เค็ด	25230	178	233
7156		\N	\N	กะรุบี	94230	904	526
7157		\N	\N	ตะโละดือรามัน	94230	904	526
7158		\N	\N	ปล่องหอย	94230	904	526
7107		\N	\N	ตะโละแมะนา	94140	899	526
7109		\N	\N	น้ำดำ	94140	899	526
7110		\N	\N	ปากู	94140	899	526
7108		\N	\N	พิเทน	94140	899	526
7088		\N	\N	ควน	94190	897	526
7090		\N	\N	คอกกระบือ	94130	897	526
7087		\N	\N	ดอน	94190	897	526
7085		\N	\N	ท่าข้าม	94130	897	526
7089		\N	\N	ท่าน้ำ	94130	897	526
7092		\N	\N	บ้านกลาง	94130	897	526
7086		\N	\N	บ้านนอก	94130	897	526
7093		\N	\N	บ้านน้ำบ่อ	94130	897	526
7084		\N	\N	ปะนาเระ	94130	897	526
7091		\N	\N	พ่อมิ่ง	94130	897	526
7097		\N	\N	กระหวะ	94190	898	526
7100		\N	\N	กระเสาะ	94140	898	526
7096		\N	\N	ตรัง	94140	898	526
7095		\N	\N	ถนน	94140	898	526
7102		\N	\N	ปะโด	94140	898	526
7106		\N	\N	ปานัน	94140	898	526
7094		\N	\N	มายอ	94140	898	526
7099		\N	\N	ลางา	94190	898	526
7098		\N	\N	ลุโบะยิไร	94140	898	526
7105		\N	\N	สะกำ	94140	898	526
7103		\N	\N	สาคอบน	94140	898	526
7104		\N	\N	สาคอใต้	94140	898	526
7101		\N	\N	เกาะจัน	94140	898	526
7151		\N	\N	กระโด	94160	903	526
7154		\N	\N	กอลำ	94160	903	526
7152		\N	\N	คลองใหม่	94160	903	526
7146		\N	\N	ประจัน	94160	903	526
7149		\N	\N	ปิตูมุดี	94160	903	526
7144		\N	\N	ยะรัง	94160	903	526
7148		\N	\N	ระแว้ง	94160	903	526
7150		\N	\N	วัด	94160	903	526
7145		\N	\N	สะดาวา	94160	903	526
7147		\N	\N	สะนอ	94160	903	526
7155		\N	\N	เขาตูม	94160	903	526
7153		\N	\N	เมาะมาวี	94160	903	526
7142		\N	\N	จะรัง	94150	902	526
7130		\N	\N	ตอหลัง	94150	902	526
7127		\N	\N	ตะโละกาโปร์	94150	902	526
7129		\N	\N	ตันหยงจึงงา	94190	902	526
7128		\N	\N	ตันหยงดาลอ	94150	902	526
7132		\N	\N	ตาลีอายร์	94150	902	526
7131		\N	\N	ตาแกะ	94150	902	526
7134		\N	\N	บางปู	94150	902	526
7138		\N	\N	บาโลย	94190	902	526
7136		\N	\N	ปิยามุมัง	94150	902	526
7137		\N	\N	ปุลากง	94150	902	526
7140		\N	\N	มะนังยง	94150	902	526
7133		\N	\N	ยามู	94150	902	526
7141		\N	\N	ราตาปันยัง	94150	902	526
7139		\N	\N	สาบัน	94150	902	526
7135		\N	\N	หนองแรต	94150	902	526
7143		\N	\N	แหลมโพธิ์	94150	902	526
7117		\N	\N	กะดุนง	94110	900	526
7112		\N	\N	ตะบิ้ง	94110	900	526
7111		\N	\N	ตะลุบัน	94110	900	526
7121		\N	\N	ทุ่งคล้า	94190	900	526
7114		\N	\N	บางเก่า	94110	900	526
7115		\N	\N	บือเระ	94110	900	526
7113		\N	\N	ปะเสยะวอ	94110	900	526
7119		\N	\N	มะนังดาลำ	94110	900	526
7118		\N	\N	ละหาร	94110	900	526
7116		\N	\N	เตราะบอน	94110	900	526
7120		\N	\N	แป้น	94110	900	526
7073		\N	\N	คอลอตันหยง	94170	896	526
7074		\N	\N	ดอนรัก	94170	896	526
7075		\N	\N	ดาโต๊ะ	94170	896	526
7076		\N	\N	ตุยง	94170	896	526
7077		\N	\N	ท่ากำชำ	94170	896	526
7080		\N	\N	บางตาวา	94170	896	526
7079		\N	\N	บางเขา	94170	896	526
7078		\N	\N	บ่อทอง	94170	896	526
7081		\N	\N	ปุโละปุโย	94170	896	526
7082		\N	\N	ยาบี	94170	896	526
7083		\N	\N	ลิปะสะโง	94170	896	526
7072		\N	\N	เกาะเปาะ	94170	896	526
7053		\N	\N	กะมิยอ	94000	894	526
7052		\N	\N	คลองมานิง	94000	894	526
7481		\N	\N	จะบังติกอ	94000	894	526
7057		\N	\N	ตะลุโบะ	94000	894	526
7051		\N	\N	ตันหยงลุโละ	94000	894	526
7050		\N	\N	บานา	94000	894	526
7058		\N	\N	บาราเฮาะ	94000	894	526
7054		\N	\N	บาราโหม	94000	894	526
7055		\N	\N	ปะกาฮะรัง	94000	894	526
7059		\N	\N	ปุยุด	94000	894	526
7056		\N	\N	รูสะมิแล	94000	894	526
7049		\N	\N	สะบารัง	94000	894	526
7482		\N	\N	อาเนาะรู	94000	894	526
7161		\N	\N	ป่าไร่	94180	905	526
7160		\N	\N	ม่วงเตี้ย	94180	905	526
7159		\N	\N	แม่ลาน	94180	905	526
7070		\N	\N	ควนโนรี	94180	895	526
7071		\N	\N	ช้างให้ตก	94120	895	526
7064		\N	\N	ทรายขาว	94120	895	526
7067		\N	\N	ทุ่งพลา	94180	895	526
7068		\N	\N	ท่าเรือ	94120	895	526
7065		\N	\N	นาประดู่	94180	895	526
7069		\N	\N	นาเกตุ	94120	895	526
7062		\N	\N	บางโกระ	94120	895	526
7066		\N	\N	ปากล่อ	94180	895	526
7063		\N	\N	ป่าบอน	94120	895	526
7061		\N	\N	มะกรูด	94120	895	526
7060		\N	\N	โคกโพธิ์	94120	895	526
7125		\N	\N	ดอนทราย	94220	901	526
7124		\N	\N	ตะโละไกรทอง	94220	901	526
7122		\N	\N	ไทรทอง	94220	901	526
180		\N	\N	ราชาเทวะ	10540	53	215
181		\N	\N	หนองปรือ	10540	53	215
202		\N	\N	บางเสาธง	10540	56	215
5996		\N	\N	อ้อมน้อย	74130	755	246
6013		\N	\N	คลองตัน	74120	756	246
6005		\N	\N	บ้านแพ้ว	74120	756	246
6007		\N	\N	ยกกระบัตร	74120	756	246
6015		\N	\N	สวนส้ม	74120	756	246
6010		\N	\N	หนองบัว	74120	756	246
6009		\N	\N	หนองสองห้อง	74120	756	246
6011		\N	\N	หลักสอง	74120	756	246
6006		\N	\N	หลักสาม	74120	756	246
6014		\N	\N	อำแพง	74120	756	246
6016		\N	\N	เกษตรพัฒนา	74120	756	246
6012		\N	\N	เจ็ดริ้ว	74120	756	246
6008		\N	\N	โรงเข้	74120	756	246
5982		\N	\N	กาหลง	74000	754	246
5987		\N	\N	คอกกระบือ	74000	754	246
5994		\N	\N	ชัยมงคล	74000	754	246
5984		\N	\N	ท่าจีน	74000	754	246
7469		\N	\N	ท่าฉลอม	74000	754	246
5986		\N	\N	ท่าทราย	74000	754	246
5985		\N	\N	นาดี	74000	754	246
5983		\N	\N	นาโคก	74000	754	246
5992		\N	\N	บางกระเจ้า	74000	754	246
5988		\N	\N	บางน้ำจืด	74000	754	246
5993		\N	\N	บางหญ้าแพรก	74000	754	246
5981		\N	\N	บางโทรัด	74000	754	246
5980		\N	\N	บ้านบ่อ	74000	754	246
5991		\N	\N	บ้านเกาะ	74000	754	246
5989		\N	\N	พันท้ายนรสิงห์	74000	754	246
5979		\N	\N	มหาชัย	74000	754	246
7470		\N	\N	โกรกกราก	74000	754	246
5990		\N	\N	โคกขาม	74000	754	246
7386		\N	\N	ดงตะงาว	18210	124	221
867		\N	\N	ดอนพุด	18210	124	221
869		\N	\N	บ้านหลวง	18210	124	221
868		\N	\N	ไผ่หลิ่ว	18210	124	221
861		\N	\N	ตลาดน้อย	18130	123	221
859		\N	\N	บางโขมด	18130	123	221
865		\N	\N	บ้านครัว	18270	123	221
858		\N	\N	บ้านหมอ	18130	123	221
860		\N	\N	สร่างโศก	18130	123	221
866		\N	\N	หนองบัว	18130	123	221
862		\N	\N	หรเทพ	18130	123	221
863		\N	\N	โคกใหญ่	18130	123	221
864		\N	\N	ไผ่ขวาง	18130	123	221
875		\N	\N	ขุนโขลน	18120	126	221
876		\N	\N	ธารเกษม	18120	126	221
877		\N	\N	นายาว	18120	126	221
874		\N	\N	พระพุทธบาท	18120	126	221
881		\N	\N	พุกร่าง	18120	126	221
878		\N	\N	พุคำจาน	18120	126	221
882		\N	\N	หนองแก	18120	126	221
880		\N	\N	ห้วยป่าหวาย	18120	126	221
879		\N	\N	เขาวง	18120	126	221
899		\N	\N	ซับสนุ่น	18220	128	221
7339		\N	\N	มวกเหล็ก	18180	128	221
895		\N	\N	มิตรภาพ	18180	128	221
898		\N	\N	ลำพญากลาง	30130	128	221
897		\N	\N	ลำสมพุง	30130	128	221
896		\N	\N	หนองย่างเสือ	18180	128	221
901		\N	\N	คำพราน	18220	129	221
902		\N	\N	วังม่วง	18220	129	221
900		\N	\N	แสลงพัน	18220	129	221
845		\N	\N	คลองเรือ	18150	121	221
844		\N	\N	บ้านลำ	18150	121	221
846		\N	\N	วิหารแดง	18150	121	221
847		\N	\N	หนองสรวง	18150	121	221
843		\N	\N	หนองหมู	18150	121	221
848		\N	\N	เจริญธรรม	18150	121	221
827		\N	\N	กุ่มหัก	18140	120	221
828		\N	\N	คชสิทธิ์	18250	120	221
831		\N	\N	บัวลอย	18230	120	221
839		\N	\N	หนองจรเข้	18140	120	221
838		\N	\N	หนองจิก	18230	120	221
840		\N	\N	หนองนาก	18230	120	221
841		\N	\N	หนองปลาหมอ	18140	120	221
842		\N	\N	หนองปลิง	18140	120	221
837		\N	\N	หนองแขม	18140	120	221
826		\N	\N	หนองแค	18140	120	221
7340		\N	\N	หนองโรง	18140	120	221
836		\N	\N	หนองไข่น้ำ	18140	120	221
834		\N	\N	ห้วยขมิ้น	18230	120	221
835		\N	\N	ห้วยทราย	18230	120	221
829		\N	\N	โคกตูม	18250	120	221
830		\N	\N	โคกแย้	18230	120	221
833		\N	\N	โพนทอง	18250	120	221
832		\N	\N	ไผ่ต่ำ	18140	120	221
856		\N	\N	ม่วงหวาน	18170	122	221
853		\N	\N	หนองกบ	18170	122	221
850		\N	\N	หนองควายโซ	18170	122	221
852		\N	\N	หนองสีดา	18170	122	221
851		\N	\N	หนองหัวโพ	18170	122	221
849		\N	\N	หนองแซง	18170	122	221
857		\N	\N	เขาดิน	18170	122	221
855		\N	\N	โคกสะอาด	18170	122	221
854		\N	\N	ไก่เส่า	18170	122	221
872		\N	\N	ดอนทอง	18190	125	221
871		\N	\N	บ้านกลับ	18190	125	221
873		\N	\N	บ้านโปร่ง	18190	125	221
870		\N	\N	หนองโดน	18190	125	221
904		\N	\N	บ้านแก้ง	18000	130	221
905		\N	\N	ผึ้งรวง	18000	130	221
906		\N	\N	พุแค	18240	130	221
908		\N	\N	หน้าพระลาน	18240	130	221
907		\N	\N	ห้วยบง	18000	130	221
903		\N	\N	เขาดินพัฒนา	18000	130	221
810		\N	\N	กุดนกเปล้า	18000	118	221
803		\N	\N	ดาวเรือง	18000	118	221
811		\N	\N	ตลิ่งชัน	18000	118	221
812		\N	\N	ตะกุด	18000	118	221
804		\N	\N	นาโฉง	18000	118	221
808		\N	\N	ปากข้าวสาร	18000	118	221
802		\N	\N	ปากเพรียว	18000	118	221
809		\N	\N	หนองปลาไหล	18000	118	221
807		\N	\N	หนองยาว	18000	118	221
806		\N	\N	หนองโน	18000	118	221
805		\N	\N	โคกสว่าง	18000	118	221
886		\N	\N	งิ้วงาม	18160	127	221
888		\N	\N	ต้นตาล	18160	127	221
889		\N	\N	ท่าช้าง	18160	127	221
884		\N	\N	บ้านยาง	18160	127	221
890		\N	\N	พระยาทด	18160	127	221
891		\N	\N	ม่วงงาม	18160	127	221
887		\N	\N	ศาลารีไทย	18160	127	221
894		\N	\N	สวนดอกไม้	18160	127	221
885		\N	\N	หัวปลวก	18160	127	221
893		\N	\N	เมืองเก่า	18160	127	221
892		\N	\N	เริงราง	18160	127	221
883		\N	\N	เสาไห้	18160	127	221
821		\N	\N	ชะอม	18110	119	221
824		\N	\N	ชำผักแพว	18110	119	221
815		\N	\N	ตาลเดี่ยว	18110	119	221
814		\N	\N	ทับกวาง	18260	119	221
817		\N	\N	ท่าคล้อ	18110	119	221
820		\N	\N	ท่าตูม	18110	119	221
825		\N	\N	ท่ามะปราง	18110	119	221
7385		\N	\N	บ้านธาตุ	18110	119	221
819		\N	\N	บ้านป่า	18110	119	221
822		\N	\N	สองคอน	18110	119	221
818		\N	\N	หินซ้อน	18110	119	221
816		\N	\N	ห้วยแห้ง	18110	119	221
823		\N	\N	เตาปูน	18110	119	221
813		\N	\N	แก่งคอย	18110	119	221
1374		\N	\N	คลองหาด	27260	190	237
1378		\N	\N	คลองไก่เถื่อน	27260	190	237
1376		\N	\N	ซับมะกรูด	27260	190	237
1379		\N	\N	เบญจขร	27260	190	237
1375		\N	\N	ไทยอุดม	27260	190	237
1380		\N	\N	ไทรทอง	27260	190	237
1377		\N	\N	ไทรเดี่ยว	27260	190	237
1381		\N	\N	ตาพระยา	27180	191	237
1383		\N	\N	ทัพราช	27180	191	237
1382		\N	\N	ทัพเสด็จ	27180	191	237
1384		\N	\N	ทัพไทย	27180	191	237
1385		\N	\N	โคคลาน	27180	191	237
1388		\N	\N	คลองหินปูน	27210	192	237
1387		\N	\N	ตาหลังใน	27210	192	237
1389		\N	\N	ทุ่งมหาเจริญ	27210	192	237
1386		\N	\N	วังน้ำเย็น	27210	192	237
1424		\N	\N	วังทอง	27250	197	237
1422		\N	\N	วังสมบูรณ์	27250	197	237
1423		\N	\N	วังใหม่	27250	197	237
1395		\N	\N	ช่องกุ่ม	27160	193	237
1391		\N	\N	ท่าเกวียน	27160	193	237
1392		\N	\N	ผักขะ	27160	193	237
1390		\N	\N	วัฒนานคร	27160	193	237
1399		\N	\N	หนองตะเคียนบอน	27160	193	237
1394		\N	\N	หนองน้ำใส	27160	193	237
1398		\N	\N	หนองหมากฝ้าย	27160	193	237
1396		\N	\N	หนองแวง	27160	193	237
1400		\N	\N	ห้วยโจด	27160	193	237
1397		\N	\N	แซร์ออ	27160	193	237
1393		\N	\N	โนนหมากเค็ง	27160	193	237
1411		\N	\N	คลองทับจันทร์	27120	194	237
1404		\N	\N	คลองน้ำใส	27120	194	237
1407		\N	\N	ทับพริก	27120	194	237
1405		\N	\N	ท่าข้าม	27120	194	237
1413		\N	\N	บ้านด่าน	27120	194	237
1408		\N	\N	บ้านใหม่หนองไทร	27120	194	237
1406		\N	\N	ป่าไร่	27120	194	237
1409		\N	\N	ผ่านศึก	27120	194	237
1412		\N	\N	ฟากห้วย	27120	194	237
1410		\N	\N	หนองสังข์	27120	194	237
1403		\N	\N	หันทราย	27120	194	237
1401		\N	\N	อรัญประเทศ	27120	194	237
1402		\N	\N	เมืองไผ่	27120	194	237
1416		\N	\N	พระเพลิง	27000	195	237
1415		\N	\N	หนองหว้า	27000	195	237
1414		\N	\N	เขาฉกรรจ์	27000	195	237
1417		\N	\N	เขาสามสิบ	27000	195	237
1371		\N	\N	ท่าเกษม	27000	189	237
1370		\N	\N	ท่าแยก	27000	189	237
1367		\N	\N	บ้านแก้ง	27000	189	237
1368		\N	\N	ศาลาลำดวน	27000	189	237
1372		\N	\N	สระขวัญ	27000	189	237
1366		\N	\N	สระแก้ว	27000	189	237
1373		\N	\N	หนองบอน	27000	189	237
1369		\N	\N	โคกปี่ฆ้อง	27000	189	237
1419		\N	\N	หนองม่วง	27180	196	237
1420		\N	\N	หนองแวง	27180	196	237
1418		\N	\N	โคกสูง	27120	196	237
1421		\N	\N	โนนหมากมุ่น	27120	196	237
726		\N	\N	คอทราย	16150	106	223
725		\N	\N	ท่าข้าม	16150	106	223
7384		\N	\N	บางระจัน	16150	106	223
727		\N	\N	หนองกระทุ่ม	16150	106	223
723		\N	\N	โพทะเล	16150	106	223
724		\N	\N	โพสังโฆ	16150	106	223
735		\N	\N	ถอนสมอ	16140	108	223
738		\N	\N	พิกุลทอง	16140	108	223
737		\N	\N	วิหารขาว	16140	108	223
736		\N	\N	โพประจักษ์	16140	108	223
720		\N	\N	บ้านจ่า	16130	105	223
721		\N	\N	พักทัน	16130	105	223
722		\N	\N	สระแจง	16130	105	223
715		\N	\N	สิงห์	16130	105	223
717		\N	\N	เชิงกลัด	16130	105	223
719		\N	\N	แม่ลา	16130	105	223
718		\N	\N	โพชนไก่	16130	105	223
716		\N	\N	ไม้ดัด	16130	105	223
730		\N	\N	บางน้ำเชี่ยว	16120	107	223
731		\N	\N	บ้านหม้อ	16120	107	223
732		\N	\N	บ้านแป้ง	16120	107	223
729		\N	\N	พรหมบุรี	16160	107	223
728		\N	\N	พระงาม	16120	107	223
733		\N	\N	หัวป่า	16120	107	223
734		\N	\N	โรงช้าง	16120	107	223
742		\N	\N	งิ้วราย	16110	109	223
743		\N	\N	ชีน้ำร้าย	16110	109	223
746		\N	\N	ทองเอน	16110	109	223
741		\N	\N	ทับยา	16110	109	223
744		\N	\N	ท่างาม	16110	109	223
745		\N	\N	น้ำตาล	16110	109	223
740		\N	\N	ประศุก	16110	109	223
747		\N	\N	ห้วยชัน	16110	109	223
739		\N	\N	อินทร์บุรี	16110	109	223
748		\N	\N	โพธิ์ชัย	16110	109	223
713		\N	\N	จักรสีห์	16000	104	223
712		\N	\N	ต้นโพธิ์	16000	104	223
714		\N	\N	บางกระบือ	16000	104	223
708		\N	\N	บางพุทรา	16000	104	223
7383		\N	\N	บางมัญ	16000	104	223
710		\N	\N	ม่วงหมู่	16000	104	223
711		\N	\N	หัวไผ่	16000	104	223
709		\N	\N	โพกรวม	16000	104	223
5830		\N	\N	ดอนเจดีย์	72170	742	226
5834		\N	\N	ทะเลบก	72250	742	226
5833		\N	\N	สระกระโจม	72250	742	226
5831		\N	\N	หนองสาหร่าย	72170	742	226
5832		\N	\N	ไร่รถ	72170	742	226
5803		\N	\N	ด่านช้าง	72180	739	226
7463		\N	\N	นิคมกระเสียว	72180	739	226
5806		\N	\N	วังคัน	72180	739	226
7464		\N	\N	วังยาว	72180	739	226
5802		\N	\N	หนองมะค่าโมง	72180	739	226
5804		\N	\N	ห้วยขมิ้น	72180	739	226
5805		\N	\N	องค์พระ	72180	739	226
5811		\N	\N	กฤษณา	72150	740	226
5815		\N	\N	จรเข้ใหญ่	72150	740	226
5809		\N	\N	ตะค่า	72150	740	226
5808		\N	\N	บางปลาม้า	72150	740	226
5810		\N	\N	บางใหญ่	72150	740	226
5816		\N	\N	บ้านแหลม	72150	740	226
5817		\N	\N	มะขามล้ม	72150	740	226
5818		\N	\N	วังน้ำเย็น	72150	740	226
5820		\N	\N	วัดดาว	72150	740	226
5819		\N	\N	วัดโบสถ์	72150	740	226
5812		\N	\N	สาลี	72150	740	226
5814		\N	\N	องครักษ์	72150	740	226
5807		\N	\N	โคกคราม	72150	740	226
5813		\N	\N	ไผ่กองดิน	72150	740	226
5825		\N	\N	ดอนปรู	72140	741	226
5824		\N	\N	บางงาม	72140	741	226
5822		\N	\N	บ้านกร่าง	72140	741	226
5826		\N	\N	ปลายนา	72140	741	226
5823		\N	\N	มดแดง	72140	741	226
5828		\N	\N	วังน้ำซับ	72140	741	226
5829		\N	\N	วังยาง	72140	741	226
5827		\N	\N	วังหว้า	72140	741	226
5821		\N	\N	ศรีประจันต์	72140	741	226
5849		\N	\N	ดอนมะนาว	72110	743	226
5844		\N	\N	ต้นตาล	72110	743	226
5846		\N	\N	ทุ่งคอก	72110	743	226
5838		\N	\N	บางตะเคียน	72110	743	226
5837		\N	\N	บางตาเถร	72110	743	226
5841		\N	\N	บางพลับ	72110	743	226
5836		\N	\N	บางเลน	72110	743	226
5848		\N	\N	บ่อสุพรรณ	72190	743	226
5839		\N	\N	บ้านกุ่ม	72110	743	226
5843		\N	\N	บ้านช้าง	72110	743	226
5845		\N	\N	ศรีสำราญ	72110	743	226
1935		\N	\N	ทุ่งกุลา	32120	255	314
5835		\N	\N	สองพี่น้อง	72110	743	226
5847		\N	\N	หนองบ่อ	72190	743	226
5840		\N	\N	หัวโพธิ์	72110	743	226
5842		\N	\N	เนินพระปรางค์	72110	743	226
5857		\N	\N	กระเสียว	72130	744	226
5855		\N	\N	บ้านสระ	72130	744	226
5851		\N	\N	ย่านยาว	72130	744	226
5852		\N	\N	วังลึก	72130	744	226
5853		\N	\N	สามชุก	72130	744	226
5854		\N	\N	หนองผักนาก	72130	744	226
5856		\N	\N	หนองสะเดา	72130	744	226
7465		\N	\N	ทัพหลวง	72240	746	226
7466		\N	\N	หนองขาม	72240	746	226
5872		\N	\N	หนองราชวัตร	72240	746	226
5871		\N	\N	หนองหญ้าไซ	72240	746	226
5873		\N	\N	หนองโพธิ์	72240	746	226
5874		\N	\N	แจงงาม	72240	746	226
5870		\N	\N	กระจัน	72160	745	226
5860		\N	\N	จรเข้สามพัน	71170	745	226
5865		\N	\N	ดอนคา	72160	745	226
5863		\N	\N	ดอนมะเกลือ	72220	745	226
5861		\N	\N	บ้านดอน	72160	745	226
5867		\N	\N	บ้านโข้ง	72160	745	226
5866		\N	\N	พลับพลาไชย	72160	745	226
5862		\N	\N	ยุ้งทะลาย	72160	745	226
5869		\N	\N	สระพังลาน	72220	745	226
5859		\N	\N	สระยายโสม	72220	745	226
5864		\N	\N	หนองโอ่ง	72160	745	226
5858		\N	\N	อู่ทอง	72160	745	226
5868		\N	\N	เจดีย์	72160	745	226
5793		\N	\N	ทุ่งคลี	72120	738	226
5790		\N	\N	นางบวช	72120	738	226
5797		\N	\N	บ่อกรุ	72120	738	226
5792		\N	\N	ปากน้ำ	72120	738	226
5799		\N	\N	ป่าสะแก	72120	738	226
5800		\N	\N	ยางนอน	72120	738	226
5798		\N	\N	วังศรีราช	72120	738	226
5801		\N	\N	หนองกระทุ่ม	72120	738	226
5796		\N	\N	หัวนา	72120	738	226
5795		\N	\N	หัวเขา	72120	738	226
5791		\N	\N	เขาดิน	72120	738	226
5789		\N	\N	เขาพระ	72120	738	226
7462		\N	\N	เดิมบาง	72120	738	226
5794		\N	\N	โคกช้าง	72120	738	226
5779		\N	\N	ดอนกำยาน	72000	737	226
5776		\N	\N	ดอนตาล	72000	737	226
5777		\N	\N	ดอนมะสังข์	72000	737	226
5780		\N	\N	ดอนโพธิ์ทอง	72000	737	226
5783		\N	\N	ตลิ่งชัน	72230	737	226
5772		\N	\N	ทับตีเหล็ก	72000	737	226
5770		\N	\N	ท่าพี่เลี้ยง	72000	737	226
5773		\N	\N	ท่าระหัด	72000	737	226
5784		\N	\N	บางกุ้ง	72210	737	226
5781		\N	\N	บ้านโพธิ์	72000	737	226
5778		\N	\N	พิหารแดง	72000	737	226
5771		\N	\N	รั้วใหญ่	72000	737	226
5785		\N	\N	ศาลาขาว	72210	737	226
5788		\N	\N	สนามคลี	72230	737	226
7342		\N	\N	สนามชัย	72000	737	226
5782		\N	\N	สระแก้ว	72230	737	226
5786		\N	\N	สวนแตง	72210	737	226
5775		\N	\N	โคกโคเฒ่า	72000	737	226
5787		\N	\N	โพธิ์พระยา	72000	737	226
5774		\N	\N	ไผ่ขวาง	72000	737	226
6481		\N	\N	กรูด	84160	819	512
6479		\N	\N	กะแดะ	84160	819	512
6489		\N	\N	คลองสระ	84160	819	512
6486		\N	\N	ช้างขวา	84160	819	512
6482		\N	\N	ช้างซ้าย	84160	819	512
6485		\N	\N	ตะเคียนทอง	84160	819	512
6480		\N	\N	ทุ่งกง	84290	819	512
6488		\N	\N	ทุ่งรัง	84290	819	512
6478		\N	\N	ท่าทอง	84160	819	512
6477		\N	\N	ท่าทองใหม่	84290	819	512
6487		\N	\N	ท่าอุแท	84160	819	512
6484		\N	\N	ป่าร่อน	84160	819	512
6483		\N	\N	พลายวาส	84160	819	512
6522		\N	\N	กะเปา	84180	825	512
6525		\N	\N	ถ้ำสิงขร	84180	825	512
6523		\N	\N	ท่ากระดาน	84180	825	512
6519		\N	\N	ท่าขนอน	84180	825	512
6521		\N	\N	น้ำหัก	84180	825	512
6526		\N	\N	บ้านทำเนียบ	84180	825	512
6520		\N	\N	บ้านยาง	84180	825	512
6524		\N	\N	ย่านยาว	84180	825	512
6593		\N	\N	คลองน้อย	84350	835	512
6592		\N	\N	ชัยบุรี	84350	835	512
6591		\N	\N	สองแพรก	84350	835	512
6594		\N	\N	ไทรทอง	84350	835	512
6491		\N	\N	ชลคราม	84160	820	512
6490		\N	\N	ดอนสัก	84220	820	512
6493		\N	\N	ปากแพรก	84340	820	512
6492		\N	\N	ไชยคราม	84220	820	512
6539		\N	\N	คลองไทร	84150	828	512
6537		\N	\N	ท่าฉาง	84150	828	512
6538		\N	\N	ท่าเคย	84150	828	512
6542		\N	\N	ปากฉลุย	84150	828	512
6540		\N	\N	เขาถ่าน	84150	828	512
6541		\N	\N	เสวียด	84150	828	512
6518		\N	\N	คลองพา	84170	824	512
6516		\N	\N	คันธุลี	84170	824	512
6513		\N	\N	ท่าชนะ	84170	824	512
6515		\N	\N	ประสงค์	84170	824	512
6517		\N	\N	วัง	84170	824	512
6514		\N	\N	สมอทอง	84170	824	512
6529		\N	\N	พรุไทย	84230	826	512
6528		\N	\N	พะแสง	84230	826	512
6530		\N	\N	เขาพัง	84230	826	512
6527		\N	\N	เขาวง	84230	826	512
6550		\N	\N	คลองปราบ	84120	829	512
6548		\N	\N	ควนศรี	84270	829	512
6549		\N	\N	ควนสุบรรณ	84120	829	512
6545		\N	\N	ทุ่งเตา	84120	829	512
6552		\N	\N	ทุ่งเตาใหม่	84120	829	512
6547		\N	\N	ท่าชี	84120	829	512
6543		\N	\N	นาสาร	84120	829	512
6551		\N	\N	น้ำพุ	84120	829	512
6544		\N	\N	พรุพี	84270	829	512
6546		\N	\N	ลำพูน	84120	829	512
6553		\N	\N	เพิ่มพูนทรัพย์	84120	829	512
6556		\N	\N	ทรัพย์ทวี	84240	830	512
6555		\N	\N	ท่าเรือ	84240	830	512
6557		\N	\N	นาใต้	84240	830	512
6554		\N	\N	บ้านนา	84240	830	512
6536		\N	\N	คลองชะอุ่น	84250	827	512
6533		\N	\N	คลองศก	84250	827	512
6532		\N	\N	ต้นยวน	84250	827	512
6531		\N	\N	พนม	84250	827	512
6534		\N	\N	พลูเถื่อน	84250	827	512
6535		\N	\N	พังกาญจน์	84250	827	512
6570		\N	\N	บางสวรรค์	84210	833	512
6574		\N	\N	สาคู	84210	833	512
6569		\N	\N	สินปุน	84210	833	512
6572		\N	\N	สินเจริญ	84210	833	512
6568		\N	\N	อิปัน	84210	833	512
6571		\N	\N	ไทรขึง	84210	833	512
6573		\N	\N	ไทรโสภา	84210	833	512
6581		\N	\N	กรูด	84130	834	512
6590		\N	\N	ตะปาน	84130	834	512
6575		\N	\N	ท่าข้าม	84130	834	512
6576		\N	\N	ท่าสะท้อน	84130	834	512
6580		\N	\N	ท่าโรงช้าง	84130	834	512
6585		\N	\N	น้ำรอบ	84130	834	512
6583		\N	\N	บางงอน	84130	834	512
6578		\N	\N	บางมะเดื่อ	84130	834	512
6579		\N	\N	บางเดือน	84130	834	512
6582		\N	\N	พุนพิน	84130	834	512
6586		\N	\N	มะลวน	84130	834	512
6577		\N	\N	ลีเล็ด	84130	834	512
6584		\N	\N	ศรีวิชัย	84130	834	512
6588		\N	\N	หนองไทร	84130	834	512
6587		\N	\N	หัวเตย	84130	834	512
6589		\N	\N	เขาหัวควาย	84130	834	512
6596		\N	\N	ตะกุกเหนือ	84180	836	512
6595		\N	\N	ตะกุกใต้	84180	836	512
6502		\N	\N	บ้านใต้	84280	822	512
6501		\N	\N	เกาะพะงัน	84280	822	512
6503		\N	\N	เกาะเต่า	84280	822	512
6496		\N	\N	ตลิ่งงาม	84140	821	512
6499		\N	\N	บ่อผุด	84320	821	512
6498		\N	\N	มะเร็ต	84310	821	512
6495		\N	\N	ลิปะน้อย	84140	821	512
6497		\N	\N	หน้าเมือง	84140	821	512
6494		\N	\N	อ่างทอง	84140	821	512
6500		\N	\N	แม่น้ำ	84330	821	512
6562		\N	\N	บ้านเสด็จ	84260	831	512
6559		\N	\N	พ่วงพรมคร	84210	831	512
6561		\N	\N	อรัญคามวารี	84260	831	512
6560		\N	\N	เขาตอก	84260	831	512
6558		\N	\N	เคียนซา	84260	831	512
6469		\N	\N	ขุนทะเล	84100	818	512
6476		\N	\N	คลองฉนาก	84000	818	512
6472		\N	\N	คลองน้อย	84000	818	512
6466		\N	\N	ตลาด	84000	818	512
6475		\N	\N	บางกุ้ง	84000	818	512
6471		\N	\N	บางชนะ	84000	818	512
6474		\N	\N	บางโพธิ์	84000	818	512
6470		\N	\N	บางใบไม้	84000	818	512
6473		\N	\N	บางไทร	84000	818	512
6467		\N	\N	มะขามเตี้ย	84000	818	512
6468		\N	\N	วัดประดู่	84000	818	512
6565		\N	\N	คลองฉนวน	84190	832	512
6566		\N	\N	ทุ่งหลวง	84190	832	512
6564		\N	\N	บ้านส้อง	84190	832	512
6567		\N	\N	เขานิพันธ์	84190	832	512
6563		\N	\N	เวียงสระ	84190	832	512
6504		\N	\N	ตลาดไชยา	84110	823	512
6510		\N	\N	ตะกรบ	84110	823	512
6508		\N	\N	ทุ่ง	84110	823	512
6512		\N	\N	ปากหมาก	84110	823	512
6509		\N	\N	ป่าเว	84110	823	512
6505		\N	\N	พุมเรียง	84110	823	512
6506		\N	\N	เลม็ด	84110	823	512
6507		\N	\N	เวียง	84110	823	512
6511		\N	\N	โมถ่าย	84110	823	512
1963		\N	\N	กาบเชิง	32210	258	314
1964		\N	\N	คูตัน	32210	258	314
1965		\N	\N	ด่าน	32210	258	314
1968		\N	\N	ตะเคียน	32210	258	314
1966		\N	\N	แนงมุด	32210	258	314
1967		\N	\N	โคกตะเคียน	32210	258	314
1938		\N	\N	กระหาด	32180	256	314
1936		\N	\N	จอมพระ	32180	256	314
1943		\N	\N	ชุมแสง	32180	256	314
1939		\N	\N	บุแกรง	32180	256	314
1941		\N	\N	บ้านผือ	32180	256	314
1942		\N	\N	ลุ่มระวี	32180	256	314
1940		\N	\N	หนองสนิท	32180	256	314
1944		\N	\N	เป็นสุข	32180	256	314
1937		\N	\N	เมืองลีง	32180	256	314
1924		\N	\N	กระเบื้อง	32190	254	314
1917		\N	\N	ชุมพลบุรี	32190	254	314
1918		\N	\N	นาหนองไผ่	32190	254	314
1921		\N	\N	ยะวึก	32190	254	314
1920		\N	\N	ศรีณรงค์	32190	254	314
1923		\N	\N	สระขุด	32190	254	314
1925		\N	\N	หนองเรือ	32190	254	314
1922		\N	\N	เมืองบัว	32190	254	314
1919		\N	\N	ไพรขลา	32190	254	314
1927		\N	\N	กระโพ	32120	255	314
1926		\N	\N	ท่าตูม	32120	255	314
1931		\N	\N	บะ	32120	255	314
1933		\N	\N	บัวโคก	32120	255	314
1928		\N	\N	พรมเทพ	32120	255	314
1932		\N	\N	หนองบัว	32120	255	314
1934		\N	\N	หนองเมธี	32120	255	314
1930		\N	\N	เมืองแก	32120	255	314
1929		\N	\N	โพนครก	32120	255	314
2032		\N	\N	จรัส	32230	265	314
2033		\N	\N	ตาวัง	32230	265	314
2030		\N	\N	บัวเชด	32230	265	314
2031		\N	\N	สะเดา	32230	265	314
2035		\N	\N	สำเภาลูน	32230	265	314
2034		\N	\N	อาโพน	32230	265	314
1945		\N	\N	กังแอน	32140	257	314
1960		\N	\N	กันตวจระมวล	32140	257	314
1958		\N	\N	ตานี	32140	257	314
1950		\N	\N	ตาเบา	32140	257	314
1946		\N	\N	ทมอ	32140	257	314
1949		\N	\N	ทุ่งมน	32140	257	314
1959		\N	\N	บ้านพลวง	32140	257	314
1954		\N	\N	บ้านไทร	32140	257	314
1962		\N	\N	ประทัดบุ	32140	257	314
1957		\N	\N	ปราสาททนง	32140	257	314
1948		\N	\N	ปรือ	32140	257	314
1961		\N	\N	สมุด	32140	257	314
1951		\N	\N	หนองใหญ่	32140	257	314
1956		\N	\N	เชื้อเพลิง	32140	257	314
1952		\N	\N	โคกยาง	32140	257	314
1953		\N	\N	โคกสะอาด	32140	257	314
1955		\N	\N	โชคนาสาม	32140	257	314
1947		\N	\N	ไพล	32140	257	314
2038		\N	\N	จีกแดก	32140	266	314
2039		\N	\N	ตาเมียง	32140	266	314
2036		\N	\N	บักได	32140	266	314
2037		\N	\N	โคกกลาง	32140	266	314
1978		\N	\N	กุดขาคีม	32130	259	314
1972		\N	\N	ดอนแรด	32130	259	314
1980		\N	\N	ทับใหญ่	32130	259	314
1970		\N	\N	ธาตุ	32130	259	314
1977		\N	\N	น้ำเขียว	32130	259	314
1979		\N	\N	ยางสว่าง	32130	259	314
1969		\N	\N	รัตนบุรี	32130	259	314
1973		\N	\N	หนองบัวทอง	32130	259	314
1974		\N	\N	หนองบัวบาน	32130	259	314
1976		\N	\N	เบิด	32130	259	314
1971		\N	\N	แก	32130	259	314
1975		\N	\N	ไผ่	32130	259	314
2019		\N	\N	ตระเปียงเตีย	32220	263	314
2018		\N	\N	ตรำดม	32220	263	314
2015		\N	\N	ลำดวน	32220	263	314
2017		\N	\N	อู่โลก	32220	263	314
2016		\N	\N	โชคเหนือ	32220	263	314
2040		\N	\N	ณรงค์	32150	267	314
2042		\N	\N	ตรวจ	32150	267	314
2044		\N	\N	ศรีสุข	32150	267	314
2043		\N	\N	หนองแวง	32150	267	314
2041		\N	\N	แจนแวน	32150	267	314
1998		\N	\N	กุดหวาย	32110	261	314
1999		\N	\N	ขวาวใหญ่	32110	261	314
1994		\N	\N	คาละแมะ	32110	261	314
1990		\N	\N	จารพัต	32110	261	314
1997		\N	\N	ช่างปี่	32110	261	314
2001		\N	\N	ตรมไพร	32110	261	314
1989		\N	\N	ตรึม	32110	261	314
2000		\N	\N	นารุ่ง	32110	261	314
2002		\N	\N	ผักไหม	32110	261	314
1991		\N	\N	ยาง	32110	261	314
1988		\N	\N	ระแงง	32110	261	314
1996		\N	\N	หนองขวาว	32110	261	314
1993		\N	\N	หนองบัว	32110	261	314
1995		\N	\N	หนองเหล็ก	32110	261	314
1992		\N	\N	แตล	32110	261	314
1984		\N	\N	นานวน	32160	260	314
1981		\N	\N	สนม	32160	260	314
1983		\N	\N	หนองระฆัง	32160	260	314
1987		\N	\N	หนองอียอ	32160	260	314
1986		\N	\N	หัวงัว	32160	260	314
1985		\N	\N	แคน	32160	260	314
1982		\N	\N	โพนโก	32160	260	314
2008		\N	\N	กระเทียม	32150	262	314
2004		\N	\N	ขอนแตก	32150	262	314
2005		\N	\N	ดม	32150	262	314
2012		\N	\N	ตาคง	32150	262	314
2010		\N	\N	ตาตุม	32150	262	314
2011		\N	\N	ทับทัน	32150	262	314
2007		\N	\N	บ้านจารย์	32150	262	314
2013		\N	\N	บ้านชบ	32150	262	314
2006		\N	\N	พระแก้ว	32150	262	314
2009		\N	\N	สะกาด	32150	262	314
2003		\N	\N	สังขะ	32150	262	314
2014		\N	\N	เทพรักษา	32150	262	314
2022		\N	\N	กระออม	32170	264	314
2029		\N	\N	ประดู่	32170	264	314
2024		\N	\N	ศรีสุข	32170	264	314
2028		\N	\N	สะโน	32170	264	314
2020		\N	\N	สำโรงทาบ	32170	264	314
2023		\N	\N	หนองฮะ	32170	264	314
2021		\N	\N	หนองไผ่ล้อม	32170	264	314
2026		\N	\N	หมื่นศรี	32170	264	314
2025		\N	\N	เกาะแก้ว	32170	264	314
2027		\N	\N	เสม็จ	32170	264	314
2047		\N	\N	ตากูก	32000	268	314
2046		\N	\N	บึง	32000	268	314
2049		\N	\N	บ้านแร่	32000	268	314
2048		\N	\N	ปราสาททอง	32000	268	314
2045		\N	\N	เขวาสินรินทร์	32000	268	314
1916		\N	\N	กาเกาะ	32000	253	314
1906		\N	\N	คอโค	32000	253	314
1914		\N	\N	ตระแสง	32000	253	314
1897		\N	\N	ตั้งใจ	32000	253	314
1902		\N	\N	ตาอ็อง	32000	253	314
1900		\N	\N	ท่าสว่าง	32000	253	314
1905		\N	\N	นอกเมือง	32000	253	314
1899		\N	\N	นาดี	32000	253	314
1910		\N	\N	นาบัว	32000	253	314
1913		\N	\N	บุฤาษี	32000	253	314
1912		\N	\N	ราม	32000	253	314
1901		\N	\N	สลักได	32000	253	314
1907		\N	\N	สวาย	32000	253	314
1903		\N	\N	สำโรง	32000	253	314
1908		\N	\N	เฉนียง	32000	253	314
1909		\N	\N	เทนมีย์	32000	253	314
1898		\N	\N	เพี้ยราม	32000	253	314
1911		\N	\N	เมืองที	32000	253	314
1904		\N	\N	แกใหญ่	32000	253	314
1915		\N	\N	แสลงพันธ์	32000	253	314
1896		\N	\N	ในเมือง	32000	253	314
2051		\N	\N	คำผง	32130	269	314
2053		\N	\N	ระเวียง	32130	269	314
2050		\N	\N	หนองหลวง	32130	269	314
2054		\N	\N	หนองเทพ	32130	269	314
2052		\N	\N	โนน	32130	269	314
5232		\N	\N	กกแรต	64170	676	415
5225		\N	\N	กง	64170	676	415
5230		\N	\N	ดงเดือย	64170	676	415
5233		\N	\N	ท่าฉนวน	64170	676	415
5226		\N	\N	บ้านกร่าง	64170	676	415
5235		\N	\N	บ้านใหม่สุขเกษม	64170	676	415
5231		\N	\N	ป่าแฝก	64170	676	415
5234		\N	\N	หนองตูม	64170	676	415
5228		\N	\N	ไกรกลาง	64170	676	415
5227		\N	\N	ไกรนอก	64170	676	415
5229		\N	\N	ไกรใน	64170	676	415
5224		\N	\N	ทุ่งยางเมือง	64160	675	415
5216		\N	\N	ทุ่งหลวง	64160	675	415
5221		\N	\N	นาเชิงคีรี	64160	675	415
5223		\N	\N	บ้านน้ำพุ	64160	675	415
5217		\N	\N	บ้านป้อม	64160	675	415
5219		\N	\N	ศรีคีรีมาศ	64160	675	415
5218		\N	\N	สามพวง	64160	675	415
5222		\N	\N	หนองกระดิ่ง	64160	675	415
5220		\N	\N	หนองจิก	64160	675	415
5215		\N	\N	โตนด	64160	675	415
5281		\N	\N	กลางดง	64150	681	415
5280		\N	\N	ทุ่งเสลี่ยม	64150	681	415
5278		\N	\N	บ้านใหม่ไชยมงคล	64230	681	415
5282		\N	\N	เขาแก้วศรีสมบูรณ์	64230	681	415
5279		\N	\N	ไทยชนะศึก	64150	681	415
5212		\N	\N	ตลิ่งชัน	64140	674	415
5209		\N	\N	บ้านด่าน	64140	674	415
5208		\N	\N	ลานหอย	64140	674	415
5210		\N	\N	วังตะคร้อ	64140	674	415
5211		\N	\N	วังน้ำขาว	64140	674	415
5214		\N	\N	วังลึก	64140	674	415
5213		\N	\N	หนองหญ้าปล้อง	64140	674	415
5276		\N	\N	คลองมะพลับ	64180	680	415
5274		\N	\N	นครเดิฐ	64180	680	415
5275		\N	\N	น้ำขุม	64180	680	415
5273		\N	\N	ศรีนคร	64180	680	415
5277		\N	\N	หนองบัว	64180	680	415
5244		\N	\N	ดงคู่	64130	677	415
5242		\N	\N	ท่าชัย	64190	677	415
5240		\N	\N	บ้านตึก	64130	677	415
5245		\N	\N	บ้านแก่ง	64130	677	415
5237		\N	\N	ป่างิ้ว	64130	677	415
5243		\N	\N	ศรีสัชนาลัย	64190	677	415
5246		\N	\N	สารจิตร	64130	677	415
5241		\N	\N	หนองอ้อ	64130	677	415
5236		\N	\N	หาดเสี้ยว	64130	677	415
5238		\N	\N	แม่สำ	64130	677	415
5239		\N	\N	แม่สิน	64130	677	415
5247		\N	\N	คลองตาล	64120	678	415
5256		\N	\N	ทับผึ้ง	64120	678	415
5252		\N	\N	นาขุนไกร	64120	678	415
5257		\N	\N	บ้านซ่าน	64120	678	415
5250		\N	\N	บ้านนา	64120	678	415
5255		\N	\N	บ้านไร่	64120	678	415
5259		\N	\N	ราวต้นจันทร์	64120	678	415
5251		\N	\N	วังทอง	64120	678	415
5248		\N	\N	วังลึก	64120	678	415
5258		\N	\N	วังใหญ่	64120	678	415
5254		\N	\N	วัดเกาะ	64120	678	415
5249		\N	\N	สามเรือน	64120	678	415
5253		\N	\N	เกาะตาเลี้ยง	64120	678	415
5261		\N	\N	คลองกระจง	64110	679	415
5266		\N	\N	คลองยาง	64110	679	415
5268		\N	\N	ท่าทอง	64110	679	415
5265		\N	\N	นาทุ่ง	64110	679	415
5269		\N	\N	ปากน้ำ	64110	679	415
5270		\N	\N	ป่ากุมเกาะ	64110	679	415
5264		\N	\N	ย่านยาว	64110	679	415
5262		\N	\N	วังพิณพาทย์	64110	679	415
5263		\N	\N	วังไม้ขอน	64110	679	415
5272		\N	\N	หนองกลับ	64110	679	415
5271		\N	\N	เมืองบางขลัง	64110	679	415
5267		\N	\N	เมืองบางยม	64110	679	415
7452		\N	\N	เมืองสวรรคโลก	64110	679	415
5260		\N	\N	ในเมือง	64110	679	415
5205		\N	\N	ตาลเตี้ย	64220	673	415
5198		\N	\N	ธานี	64000	673	415
5203		\N	\N	บ้านกล้วย	64000	673	415
5199		\N	\N	บ้านสวน	64220	673	415
5204		\N	\N	บ้านหลุม	64000	673	415
5206		\N	\N	ปากพระ	64000	673	415
5201		\N	\N	ปากแคว	64000	673	415
5202		\N	\N	ยางซ้าย	64000	673	415
5207		\N	\N	วังทองแดง	64210	673	415
5200		\N	\N	เมืองเก่า	64210	673	415
3246		\N	\N	กองนาง	43110	415	323
3244		\N	\N	ท่าบ่อ	43110	415	323
3251		\N	\N	นาข่า	43110	415	323
3245		\N	\N	น้ำโมง	43110	415	323
3249		\N	\N	บ้านถ่อน	43110	415	323
3250		\N	\N	บ้านว่าน	43110	415	323
3248		\N	\N	บ้านเดื่อ	43110	415	323
3253		\N	\N	หนองนาง	43110	415	323
3247		\N	\N	โคกคอน	43110	415	323
3252		\N	\N	โพนสา	43110	415	323
3337		\N	\N	นาทับไฮ	43120	429	323
3338		\N	\N	บ้านต้อน	43120	429	323
3339		\N	\N	พระบาทนาสิงห์	43120	429	323
3336		\N	\N	รัตนวาปี	43120	429	323
3340		\N	\N	โพนแพง	43120	429	323
3292		\N	\N	บ้านหม้อ	43130	420	323
3293		\N	\N	พระพุทธบาท	43130	420	323
3291		\N	\N	พานพร้าว	43130	420	323
3294		\N	\N	หนองปลาปาก	43130	420	323
3329		\N	\N	คอกช้าง	43100	427	323
3330		\N	\N	บ้านฝาง	43100	427	323
3328		\N	\N	สระใคร	43100	427	323
3298		\N	\N	นางิ้ว	43160	421	323
3297		\N	\N	บ้านม่วง	43160	421	323
3296		\N	\N	ผาตั้ง	43160	421	323
3299		\N	\N	สังคม	43160	421	323
3295		\N	\N	แก้งไก่	43160	421	323
3332		\N	\N	นาดี	43120	428	323
3334		\N	\N	วังหลวง	43120	428	323
3333		\N	\N	หนองหลวง	43120	428	323
3335		\N	\N	อุดมพร	43120	428	323
3331		\N	\N	เฝ้าไร่	43120	428	323
3231		\N	\N	กวนวัน	43000	414	323
3237		\N	\N	ค่ายบกหวาน	43100	414	323
3236		\N	\N	บ้านเดื่อ	43000	414	323
3241		\N	\N	ปะโค	43000	414	323
3239		\N	\N	พระธาตุบังพวน	43100	414	323
7343		\N	\N	มีชัย	43000	414	323
3233		\N	\N	วัดธาตุ	43000	414	323
3238		\N	\N	สองห้อง	43100	414	323
3243		\N	\N	สีกาย	43000	414	323
3240		\N	\N	หนองกอมเกาะ	43000	414	323
3234		\N	\N	หาดคำ	43000	414	323
3235		\N	\N	หินโงม	43000	414	323
3242		\N	\N	เมืองหมี	43000	414	323
3232		\N	\N	เวียงคุก	43000	414	323
3230		\N	\N	โพธิ์ชัย	43000	414	323
3229		\N	\N	ในเมือง	43000	414	323
3342		\N	\N	ด่านศรีสุข	43130	430	323
3341		\N	\N	โพธิ์ตาก	43130	430	323
3319		\N	\N	โพนทอง	43130	430	323
3275		\N	\N	กุดบง	43120	418	323
3273		\N	\N	จุมพล	43120	418	323
3276		\N	\N	ชุมช้าง	43120	418	323
3277		\N	\N	ทุ่งหลวง	43120	418	323
3279		\N	\N	นาหนัง	43120	418	323
3282		\N	\N	บ้านผือ	43120	418	323
3281		\N	\N	บ้านโพธิ์	43120	418	323
3274		\N	\N	วัดหลวง	43120	418	323
3283		\N	\N	สร้างนางขาว	43120	418	323
3280		\N	\N	เซิม	43120	418	323
3278		\N	\N	เหล่าต่างคำ	43120	418	323
2743		\N	\N	กุดดินจี่	39350	350	326
2749		\N	\N	กุดแห่	39170	350	326
2748		\N	\N	ดงสวรรค์	39350	350	326
2742		\N	\N	ด่านช้าง	39170	350	326
2741		\N	\N	นากลาง	39170	350	326
2744		\N	\N	ฝั่งแดง	39170	350	326
2747		\N	\N	อุทัยสวรรค์	39170	350	326
2745		\N	\N	เก่ากลอย	39350	350	326
2746		\N	\N	โนนเมือง	39170	350	326
2780		\N	\N	นาเหล่า	39170	354	326
2781		\N	\N	นาแก	39170	354	326
2782		\N	\N	วังทอง	39170	354	326
2783		\N	\N	วังปลาป้อม	39170	354	326
2784		\N	\N	เทพคีรี	39170	354	326
2763		\N	\N	กุดสะเทียน	39180	352	326
2770		\N	\N	ทรายทอง	39180	352	326
2764		\N	\N	นากอก	39180	352	326
2766		\N	\N	ยางหล่อ	39180	352	326
2761		\N	\N	ศรีบุญเรือง	39180	352	326
2768		\N	\N	หนองกุงแก้ว	39180	352	326
2762		\N	\N	หนองบัวใต้	39180	352	326
2769		\N	\N	หนองแก	39180	352	326
2771		\N	\N	หันนางาม	39180	352	326
2760		\N	\N	เมืองใหม่	39180	352	326
2767		\N	\N	โนนม่วง	39180	352	326
2765		\N	\N	โนนสะอาด	39180	352	326
2779		\N	\N	กุดผึ้ง	39270	353	326
2776		\N	\N	ดงมะไฟ	39270	353	326
2774		\N	\N	นาดี	39270	353	326
2775		\N	\N	นาด่าน	39270	353	326
2772		\N	\N	นาสี	39270	353	326
2778		\N	\N	บุญทัน	39270	353	326
2773		\N	\N	บ้านโคก	39270	353	326
2777		\N	\N	สุวรรณคูหา	39270	353	326
2736		\N	\N	กุดจิก	39000	349	326
2738		\N	\N	นาคำไฮ	39000	349	326
2732		\N	\N	นามะเฟือง	39000	349	326
2731		\N	\N	บ้านขาม	39000	349	326
2733		\N	\N	บ้านพร้าว	39000	349	326
2739		\N	\N	ป่าไม้งาม	39000	349	326
2735		\N	\N	ลำภู	39000	349	326
2726		\N	\N	หนองบัว	39000	349	326
2727		\N	\N	หนองภัยศูนย์	39000	349	326
2729		\N	\N	หนองสวรรค์	39000	349	326
2740		\N	\N	หนองหว้า	39000	349	326
2730		\N	\N	หัวนา	39000	349	326
2734		\N	\N	โนนขมิ้น	39000	349	326
2737		\N	\N	โนนทัน	39000	349	326
2728		\N	\N	โพธิ์ชัย	39000	349	326
2753		\N	\N	กุดดู่	39140	351	326
2758		\N	\N	นิคมพัฒนา	39140	351	326
2754		\N	\N	บ้านค้อ	39140	351	326
2751		\N	\N	บ้านถิ่น	39140	351	326
2759		\N	\N	ปางกู่	39140	351	326
2752		\N	\N	หนองเรือ	39140	351	326
2757		\N	\N	โคกม่วง	39140	351	326
2756		\N	\N	โคกใหญ่	39140	351	326
2750		\N	\N	โนนสัง	39140	351	326
2755		\N	\N	โนนเมือง	39140	351	326
2692		\N	\N	คำเขื่อนแก้ว	37210	343	337
2690		\N	\N	ชานุมาน	37210	343	337
2694		\N	\N	ป่าก่อ	37210	343	337
2693		\N	\N	โคกก่ง	37210	343	337
2691		\N	\N	โคกสาร	37210	343	337
2696		\N	\N	คำโพน	37110	344	337
2701		\N	\N	นาป่าแซง	37110	344	337
2697		\N	\N	นาหว้า	37110	344	337
2698		\N	\N	ลือ	37110	344	337
2695		\N	\N	หนองข่า	37110	344	337
2699		\N	\N	ห้วย	37110	344	337
2700		\N	\N	โนนงาม	37110	344	337
2703		\N	\N	จานลาน	37180	345	337
2702		\N	\N	พนา	37180	345	337
2705		\N	\N	พระเหลา	37180	345	337
2704		\N	\N	ไม้กลอน	37180	345	337
2723		\N	\N	ดงบัง	37120	348	337
2721		\N	\N	ดงมะยาง	37120	348	337
2720		\N	\N	อำนาจ	37120	348	337
2722		\N	\N	เปือย	37120	348	337
2725		\N	\N	แมด	37120	348	337
7407		\N	\N	โคกกลาง	37120	348	337
2724		\N	\N	ไร่ขี	37120	348	337
2713		\N	\N	คำพระ	37240	347	337
2718		\N	\N	จิกดู่	37240	347	337
2719		\N	\N	รัตนวารี	37240	347	337
2717		\N	\N	สร้างถ่อน้อย	37240	347	337
2715		\N	\N	หนองแก้ว	37240	347	337
2712		\N	\N	หัวตะพาน	37240	347	337
2714		\N	\N	เค็งใหญ่	37240	347	337
2716		\N	\N	โพนเมืองน้อย	37240	347	337
2689		\N	\N	กุดปลาดุก	37000	342	337
2680		\N	\N	คึมใหญ่	37000	342	337
7404		\N	\N	ดอนเมย	37000	342	337
2676		\N	\N	นาจิก	37000	342	337
2681		\N	\N	นาผือ	37000	342	337
7405		\N	\N	นายม	37000	342	337
2683		\N	\N	นาวัง	37000	342	337
2684		\N	\N	นาหมอม้า	37000	342	337
7406		\N	\N	นาแต้	37000	342	337
2682		\N	\N	น้ำปลีก	37000	342	337
2674		\N	\N	บุ่ง	37000	342	337
2677		\N	\N	ปลาค้าว	37000	342	337
2679		\N	\N	สร้างนกทา	37000	342	337
2688		\N	\N	หนองมะแซว	37000	342	337
2687		\N	\N	ห้วยไร่	37000	342	337
2678		\N	\N	เหล่าพรวน	37000	342	337
2686		\N	\N	โนนหนามแท่ง	37000	342	337
2685		\N	\N	โนนโพธิ์	37000	342	337
2675		\N	\N	ไก่คำ	37000	342	337
2709		\N	\N	นาเวียง	37290	346	337
2711		\N	\N	หนองสามสี	37290	346	337
2710		\N	\N	หนองไฮ	37290	346	337
2706		\N	\N	เสนางคนิคม	37290	346	337
2707		\N	\N	โพนทอง	37290	346	337
2708		\N	\N	ไร่สีสุก	37290	346	337
3006		\N	\N	กุดจับ	41250	381	324
3008		\N	\N	ขอนยูง	41250	381	324
3012		\N	\N	ตาลเลียน	41250	381	324
3007		\N	\N	ปะโค	41250	381	324
3010		\N	\N	สร้างก่อ	41250	381	324
3009		\N	\N	เชียงเพ็ง	41250	381	324
3011		\N	\N	เมืองเพีย	41250	381	324
3031		\N	\N	กุมภวาปี	41110	383	324
3020		\N	\N	ตูมใต้	41110	383	324
3030		\N	\N	ท่าลี่	41110	383	324
3028		\N	\N	ปะโค	41370	383	324
3029		\N	\N	ผาสุก	41370	383	324
3021		\N	\N	พันดอน	41370	383	324
3027		\N	\N	สีออ	41110	383	324
3032		\N	\N	หนองหว้า	41110	383	324
3025		\N	\N	ห้วยเกิ้ง	41110	383	324
3024		\N	\N	เชียงแหว	41110	383	324
3022		\N	\N	เวียงคำ	41110	383	324
3026		\N	\N	เสอเพลอ	41370	383	324
3023		\N	\N	แชแล	41110	383	324
3136		\N	\N	คอนสาย	41130	398	324
3135		\N	\N	ค้อใหญ่	41130	398	324
3133		\N	\N	บ้านจีต	41130	398	324
3134		\N	\N	โนนทองอินทร์	41130	398	324
3051		\N	\N	ทุ่งฝน	41310	386	324
3052		\N	\N	ทุ่งใหญ่	41310	386	324
3053		\N	\N	นาชุมแสง	41310	386	324
3054		\N	\N	นาทม	41310	386	324
3126		\N	\N	นายูง	41380	396	324
3128		\N	\N	นาแค	41380	396	324
3127		\N	\N	บ้านก้อง	41380	396	324
3129		\N	\N	โนนทอง	41380	396	324
3098		\N	\N	นางัว	41210	392	324
3099		\N	\N	น้ำโสม	41210	392	324
3101		\N	\N	บ้านหยวก	41210	392	324
3103		\N	\N	ศรีสำราญ	41210	392	324
3104		\N	\N	สามัคคี	41210	392	324
3100		\N	\N	หนองแวง	41210	392	324
3102		\N	\N	โสมเยี่ยม	41210	392	324
3075		\N	\N	ดงเย็น	41190	390	324
3080		\N	\N	ถ่อนนาลับ	41190	390	324
3084		\N	\N	นาคำ	41190	390	324
3079		\N	\N	นาไหม	41190	390	324
3077		\N	\N	บ้านจันทร์	41190	390	324
3078		\N	\N	บ้านชัย	41190	390	324
3074		\N	\N	บ้านดุง	41190	390	324
3083		\N	\N	บ้านตาด	41190	390	324
3082		\N	\N	บ้านม่วง	41190	390	324
3081		\N	\N	วังทอง	41190	390	324
3073		\N	\N	ศรีสุทโธ	41190	390	324
3076		\N	\N	อ้อมกอ	41190	390	324
3069		\N	\N	โพนสูง	41190	390	324
3092		\N	\N	กลางใหญ่	41160	391	324
3090		\N	\N	ข้าวสาร	41160	391	324
3094		\N	\N	คำด้วง	41160	391	324
3088		\N	\N	คำบง	41160	391	324
3091		\N	\N	จำปาโมง	41160	391	324
3096		\N	\N	บ้านค้อ	41160	391	324
3085		\N	\N	บ้านผือ	41160	391	324
3095		\N	\N	หนองหัวคู	41160	391	324
3097		\N	\N	หนองแวง	41160	391	324
3086		\N	\N	หายโศก	41160	391	324
3087		\N	\N	เขือน้ำ	41160	391	324
3093		\N	\N	เมืองพาน	41160	391	324
3089		\N	\N	โนนทอง	41160	391	324
3137		\N	\N	นาม่วง	41110	399	324
3138		\N	\N	ห้วยสามพาด	41110	399	324
3139		\N	\N	อุ่มจาน	41110	399	324
3132		\N	\N	ดอนกลอย	41130	397	324
3131		\N	\N	นาทราย	41130	397	324
3130		\N	\N	บ้านแดง	41130	397	324
3071		\N	\N	คำโคกสูง	41280	389	324
3068		\N	\N	บะยาว	41280	389	324
3070		\N	\N	ผาสุก	41280	389	324
3072		\N	\N	วังสามหมอ	41280	389	324
3066		\N	\N	หนองกุงทับม้า	41280	389	324
3067		\N	\N	หนองหญ้าไซ	41280	389	324
3061		\N	\N	จำปี	41230	388	324
3065		\N	\N	ตาดทอง	41230	388	324
3064		\N	\N	นายูง	41230	388	324
3058		\N	\N	บ้านโปร่ง	41230	388	324
3060		\N	\N	ศรีธาตุ	41230	388	324
3063		\N	\N	หนองนกเขียน	41230	388	324
3062		\N	\N	หัวนาคำ	41230	388	324
3120		\N	\N	นาสะอาด	41260	394	324
3118		\N	\N	บ้านยวด	41260	394	324
3121		\N	\N	บ้านหินโงม	41260	394	324
3119		\N	\N	บ้านโคก	41260	394	324
3116		\N	\N	สร้างคอม	41260	394	324
3117		\N	\N	เชียงดา	41260	394	324
3016		\N	\N	กุดหมากไฟ	41220	382	324
3017		\N	\N	น้ำพ่น	41360	382	324
3018		\N	\N	หนองบัวบาน	41360	382	324
7344		\N	\N	หนองวัวซอ	41360	382	324
3014		\N	\N	หนองอ้อ	41220	382	324
3013		\N	\N	หมากหญ้า	41360	382	324
3015		\N	\N	อูบมุง	41220	382	324
3019		\N	\N	โนนหวาย	41220	382	324
3049		\N	\N	ดอนหายโศก	41130	385	324
3045		\N	\N	บ้านยา	41320	385	324
3044		\N	\N	บ้านเชียง	41320	385	324
3047		\N	\N	ผักตบ	41130	385	324
3041		\N	\N	พังงู	41130	385	324
3043		\N	\N	สร้อยพร้าว	41130	385	324
3042		\N	\N	สะแบง	41130	385	324
3050		\N	\N	หนองสระปลา	41320	385	324
3039		\N	\N	หนองหาน	41130	385	324
3040		\N	\N	หนองเม็ก	41130	385	324
3048		\N	\N	หนองไผ่	41130	385	324
3046		\N	\N	โพนงาม	41130	385	324
3125		\N	\N	ทับกุง	41340	395	324
3124		\N	\N	นาดี	41340	395	324
3122		\N	\N	หนองแสง	41340	395	324
3123		\N	\N	แสงสว่าง	41340	395	324
3112		\N	\N	จอมศรี	41150	393	324
3110		\N	\N	นาบัว	41150	393	324
3107		\N	\N	นาพู่	41150	393	324
3106		\N	\N	บ้านธาตุ	41150	393	324
3111		\N	\N	บ้านเหล่า	41150	393	324
3115		\N	\N	สร้างแป้น	41150	393	324
3109		\N	\N	สุมเส้า	41150	393	324
3108		\N	\N	เชียงหวาง	41150	393	324
3113		\N	\N	เตาไห	41150	393	324
3105		\N	\N	เพ็ญ	41150	393	324
3114		\N	\N	โคกกลาง	41150	393	324
2994		\N	\N	กุดสระ	41000	380	324
3004		\N	\N	นากว้าง	41000	380	324
3000		\N	\N	นาข่า	41000	380	324
2995		\N	\N	นาดี	41000	380	324
2986		\N	\N	นิคมสงเคราะห์	41000	380	324
2987		\N	\N	บ้านขาว	41000	380	324
3001		\N	\N	บ้านจั่น	41000	380	324
2989		\N	\N	บ้านตาด	41000	380	324
2996		\N	\N	บ้านเลื่อม	41000	380	324
2998		\N	\N	สามพร้าว	41000	380	324
3002		\N	\N	หนองขอนกว้าง	41000	380	324
2993		\N	\N	หนองนาคำ	41000	380	324
2988		\N	\N	หนองบัว	41000	380	324
3005		\N	\N	หนองไผ่	41330	380	324
2999		\N	\N	หนองไฮ	41000	380	324
2985		\N	\N	หมากแข้ง	41000	380	324
2991		\N	\N	หมูม่น	41000	380	324
2997		\N	\N	เชียงพิณ	41000	380	324
2992		\N	\N	เชียงยืน	41000	380	324
3003		\N	\N	โคกสะอาด	41000	380	324
2990		\N	\N	โนนสูง	41330	380	324
3036		\N	\N	ทมนางาม	41240	384	324
3034		\N	\N	บุ่งแก้ว	41240	384	324
3037		\N	\N	หนองกุงศรี	41240	384	324
3038		\N	\N	โคกกลาง	41240	384	324
3033		\N	\N	โนนสะอาด	41240	384	324
3035		\N	\N	โพธิ์ศรีสำราญ	41240	384	324
3057		\N	\N	คำเลาะ	41290	387	324
3056		\N	\N	หนองหลัก	41290	387	324
3059		\N	\N	โพนสูง	41290	387	324
3055		\N	\N	ไชยวาน	41290	387	324
4423		\N	\N	ข่อยสูง	53140	565	426
4422		\N	\N	น้ำอ่าง	53140	565	426
4420		\N	\N	บ้านแก่ง	53140	565	426
4419		\N	\N	วังแดง	53140	565	426
4421		\N	\N	หาดสองแคว	53140	565	426
4468		\N	\N	น้ำพี้	53230	572	426
4466		\N	\N	บ่อทอง	53230	572	426
4467		\N	\N	ป่าคาย	53230	572	426
4465		\N	\N	ผักขวง	53230	572	426
4427		\N	\N	จริม	53150	566	426
4424		\N	\N	ท่าปลา	53150	566	426
4429		\N	\N	ท่าแฝก	53110	566	426
4430		\N	\N	นางพญา	53150	566	426
4428		\N	\N	น้ำหมัน	53150	566	426
4426		\N	\N	ผาเลือด	53190	566	426
4431		\N	\N	ร่วมจิต	53190	566	426
4425		\N	\N	หาดล้า	53190	566	426
4435		\N	\N	น้ำไคร้	53110	567	426
4436		\N	\N	น้ำไผ่	53110	567	426
4433		\N	\N	บ้านฝาย	53110	567	426
4437		\N	\N	ห้วยมุ่น	53110	567	426
4434		\N	\N	เด่นเหล็ก	53110	567	426
4432		\N	\N	แสนตอ	53110	567	426
4444		\N	\N	นาขุม	53180	569	426
4445		\N	\N	บ่อเบี้ย	53180	569	426
4443		\N	\N	บ้านโคก	53180	569	426
4442		\N	\N	ม่วงเจ็ดต้น	53180	569	426
4450		\N	\N	คอรุม	53120	570	426
4452		\N	\N	ท่ามะเฟือง	53120	570	426
4449		\N	\N	ท่าสัก	53220	570	426
4456		\N	\N	นายาง	53120	570	426
4455		\N	\N	นาอิน	53120	570	426
4447		\N	\N	บ้านดารา	53220	570	426
4451		\N	\N	บ้านหม้อ	53120	570	426
4453		\N	\N	บ้านโคน	53120	570	426
4454		\N	\N	พญาแมน	53120	570	426
4446		\N	\N	ในเมือง	53120	570	426
4448		\N	\N	ไร่อ้อย	53120	570	426
4440		\N	\N	บ้านเสี้ยว	53160	568	426
4438		\N	\N	ฟากท่า	53160	568	426
4439		\N	\N	สองคอน	53160	568	426
4441		\N	\N	สองห้อง	53160	568	426
4461		\N	\N	ชัยจุมพล	53130	571	426
4464		\N	\N	ด่านแม่คำมัน	53210	571	426
4463		\N	\N	ทุ่งยั้ง	53210	571	426
4459		\N	\N	นานกกก	53130	571	426
4460		\N	\N	ฝายหลวง	53130	571	426
4457		\N	\N	ศรีพนมมาศ	53130	571	426
4458		\N	\N	แม่พูล	53130	571	426
4462		\N	\N	ไผ่ล้อม	53210	571	426
4417		\N	\N	ขุนฝาง	53000	564	426
4406		\N	\N	คุ้งตะเภา	53000	564	426
4410		\N	\N	งิ้วงาม	53000	564	426
4418		\N	\N	ถ้ำฉลอง	53000	564	426
4402		\N	\N	ท่าอิฐ	53000	564	426
4403		\N	\N	ท่าเสา	53000	564	426
4409		\N	\N	น้ำริด	53000	564	426
4412		\N	\N	บ้านด่าน	53000	564	426
4411		\N	\N	บ้านด่านนาขาม	53000	564	426
4404		\N	\N	บ้านเกาะ	53000	564	426
4405		\N	\N	ป่าเซ่า	53000	564	426
4413		\N	\N	ผาจุก	53000	564	426
4407		\N	\N	วังกะพี้	53170	564	426
4414		\N	\N	วังดิน	53000	564	426
4408		\N	\N	หาดกรวด	53000	564	426
4416		\N	\N	หาดงิ้ว	53000	564	426
4415		\N	\N	แสนตอ	53000	564	426
5017		\N	\N	ตลุกดู่	61120	646	412
5008		\N	\N	ทัพทัน	61120	646	412
5009		\N	\N	ทุ่งนาไทย	61120	646	412
5015		\N	\N	หนองกระทุ่ม	61120	646	412
5014		\N	\N	หนองกลางดง	61120	646	412
5013		\N	\N	หนองยายดา	61120	646	412
5016		\N	\N	หนองสระ	61120	646	412
5011		\N	\N	หนองหญ้าปล้อง	61120	646	412
5010		\N	\N	เขาขี้ฝอย	61120	646	412
5012		\N	\N	โคกหม้อ	61120	646	412
5045		\N	\N	คอกควาย	61140	650	412
5043		\N	\N	ทัพหลวง	61140	650	412
5051		\N	\N	บ้านบึง	61140	650	412
5052		\N	\N	บ้านใหม่คลองเคียน	61180	650	412
5042		\N	\N	บ้านไร่	61140	650	412
5046		\N	\N	วังหิน	61180	650	412
5049		\N	\N	หนองจอก	61180	650	412
5053		\N	\N	หนองบ่มกล้วย	61180	650	412
5050		\N	\N	หูช้าง	61180	650	412
5044		\N	\N	ห้วยแห้ง	61140	650	412
5054		\N	\N	เจ้าวัด	61150	650	412
5047		\N	\N	เมืองการุ้ง	61180	650	412
5048		\N	\N	แก่นมะกรูด	61140	650	412
5060		\N	\N	ทุ่งนางาม	61160	651	412
5059		\N	\N	น้ำรอบ	61160	651	412
5056		\N	\N	ประดู่ยืน	61160	651	412
5057		\N	\N	ป่าอ้อ	61160	651	412
5058		\N	\N	ระบำ	61160	651	412
5055		\N	\N	ลานสัก	61160	651	412
5022		\N	\N	บ่อยาง	61150	647	412
5020		\N	\N	พลวงสองนาง	61150	647	412
5018		\N	\N	สว่างอารมณ์	61150	647	412
5019		\N	\N	หนองหลวง	61150	647	412
5021		\N	\N	ไผ่เขียว	61150	647	412
5041		\N	\N	ดงขวาง	61130	649	412
5035		\N	\N	ดอนกลอย	61130	649	412
5037		\N	\N	ทุ่งพึ่ง	61130	649	412
5038		\N	\N	ท่าโพ	61130	649	412
5033		\N	\N	หนองขาหย่าง	61130	649	412
5034		\N	\N	หนองไผ่	61130	649	412
5039		\N	\N	หมกแถว	61130	649	412
5040		\N	\N	หลุมเข้า	61130	649	412
5036		\N	\N	ห้วยรอบ	61130	649	412
5030		\N	\N	ทุ่งพง	61110	648	412
5029		\N	\N	ทุ่งโพ	61110	648	412
5027		\N	\N	บ้านเก่า	61110	648	412
5023		\N	\N	หนองฉาง	61110	648	412
5025		\N	\N	หนองนางนวล	61110	648	412
5024		\N	\N	หนองยาง	61110	648	412
5026		\N	\N	หนองสรวง	61110	648	412
5028		\N	\N	อุทัยเก่า	61110	648	412
5032		\N	\N	เขากวางทอง	61110	648	412
5031		\N	\N	เขาบางแกรก	61170	648	412
5062		\N	\N	ทองหลาง	61170	652	412
5061		\N	\N	สุขฤทัย	61170	652	412
5063		\N	\N	ห้วยคต	61170	652	412
4997		\N	\N	ดอนขวาง	61000	645	412
5006		\N	\N	ทุ่งใหญ่	61000	645	412
5000		\N	\N	ท่าซุง	61000	645	412
4995		\N	\N	น้ำซึม	61000	645	412
4996		\N	\N	สะแกกรัง	61000	645	412
5005		\N	\N	หนองพังค่า	61000	645	412
5003		\N	\N	หนองเต่า	61000	645	412
5001		\N	\N	หนองแก	61000	645	412
5004		\N	\N	หนองไผ่แบน	61000	645	412
4998		\N	\N	หาดทนง	61000	645	412
4994		\N	\N	อุทัยใหม่	61000	645	412
4999		\N	\N	เกาะเทโพ	61000	645	412
5007		\N	\N	เนินแจง	61000	645	412
5002		\N	\N	โนนเหล็ก	61000	645	412
2375		\N	\N	กาบิน	34270	302	331
2372		\N	\N	ข้าวปุ้น	34270	302	331
2376		\N	\N	หนองทันน้ำ	34270	302	331
2374		\N	\N	แก่งเค็ง	34270	302	331
2373		\N	\N	โนนสวาง	34270	302	331
2442		\N	\N	คำไฮใหญ่	34000	309	331
2439		\N	\N	ดอนมดแดง	34000	309	331
2441		\N	\N	ท่าเมือง	34000	309	331
2440		\N	\N	เหล่าแดง	34000	309	331
2350		\N	\N	กระเดียน	34130	301	331
2369		\N	\N	กุดยาลวน	34130	301	331
2352		\N	\N	กุศกร	34130	301	331
2353		\N	\N	ขามเปี้ย	34130	301	331
2349		\N	\N	ขุหลุ	34130	301	331
2354		\N	\N	คอนสาย	34130	301	331
2371		\N	\N	คำเจริญ	34130	301	331
2359		\N	\N	ตระการ	34130	301	331
2360		\N	\N	ตากแดด	34130	301	331
2366		\N	\N	ถ้ำแข้	34130	301	331
2367		\N	\N	ท่าหลวง	34130	301	331
2356		\N	\N	นาพิน	34130	301	331
2357		\N	\N	นาสะไม	34130	301	331
2370		\N	\N	บ้านแดง	34130	301	331
2364		\N	\N	สะพือ	34130	301	331
2365		\N	\N	หนองเต่า	34130	301	331
2368		\N	\N	ห้วยฝ้ายพัฒนา	34130	301	331
2351		\N	\N	เกษม	34130	301	331
2363		\N	\N	เซเป็ด	34130	301	331
2362		\N	\N	เป้า	34130	301	331
2355		\N	\N	โคกจาน	34130	301	331
2358		\N	\N	โนนกุง	34130	301	331
2361		\N	\N	ไหล่ทุ่ง	34130	301	331
2424		\N	\N	คำหว้า	34330	306	331
2421		\N	\N	จิกเทิง	34330	306	331
2418		\N	\N	ตาลสุม	34330	306	331
2423		\N	\N	นาคาย	34330	306	331
2420		\N	\N	สำโรง	34330	306	331
2422		\N	\N	หนองกุง	34330	306	331
2451		\N	\N	กุดเรือ	34160	311	331
2453		\N	\N	นาห่อม	34160	311	331
2450		\N	\N	นาเกษม	34160	311	331
2449		\N	\N	หนองอ้ม	34160	311	331
2452		\N	\N	โคกชำแระ	34160	311	331
2328		\N	\N	นาจะหลวย	34280	298	331
2331		\N	\N	บ้านตูม	34280	298	331
2330		\N	\N	พรสวรรค์	34280	298	331
2329		\N	\N	โนนสมบูรณ์	34280	298	331
2333		\N	\N	โนนสวรรค์	34280	298	331
2332		\N	\N	โสกแสง	34280	298	331
2459		\N	\N	กองโพน	34170	313	331
2457		\N	\N	นาตาล	34170	313	331
2458		\N	\N	พะลาน	34170	313	331
2460		\N	\N	พังเคน	34170	313	331
2455		\N	\N	นาดี	34160	312	331
2454		\N	\N	นาเยีย	34160	312	331
2456		\N	\N	นาเรือง	34160	312	331
2471		\N	\N	ขี้เหล็ก	34260	316	331
2469		\N	\N	ตาเกา	34260	316	331
2472		\N	\N	โคกสะอาด	34260	316	331
2470		\N	\N	ไพบูลย์	34260	316	331
2337		\N	\N	บุเปือย	34260	299	331
2335		\N	\N	ยาง	34260	299	331
2339		\N	\N	ยางใหญ่	34260	299	331
2338		\N	\N	สีวิเชียร	34260	299	331
2340		\N	\N	เก่าขาม	34260	299	331
2334		\N	\N	โซง	34260	299	331
2336		\N	\N	โดมประดิษฐ์	34260	299	331
2343		\N	\N	คอแลน	34230	300	331
2344		\N	\N	นาโพธิ์	34230	300	331
2347		\N	\N	บัวงาม	34230	300	331
2348		\N	\N	บ้านแมด	34230	300	331
2345		\N	\N	หนองสะโน	34230	300	331
2342		\N	\N	ห้วยข่า	34230	300	331
2346		\N	\N	โนนค้อ	34230	300	331
2341		\N	\N	โพนงาม	34230	300	331
2406		\N	\N	กุดชมภู	34110	305	331
2407		\N	\N	ดอนจิก	34110	305	331
2408		\N	\N	ทรายมูล	34110	305	331
2409		\N	\N	นาโพธิ์	34110	305	331
7400		\N	\N	บ้านแขม	34110	305	331
7401		\N	\N	พิบูล	34110	305	331
2413		\N	\N	ระเว	34110	305	331
2415		\N	\N	หนองบัวฮี	34110	305	331
2416		\N	\N	อ่างศิลา	34110	305	331
2410		\N	\N	โนนกลาง	34110	305	331
2417		\N	\N	โนนกาหลง	34110	305	331
2412		\N	\N	โพธิ์ศรี	34110	305	331
2411		\N	\N	โพธิ์ไทร	34110	305	331
2414		\N	\N	ไร่ใต้	34110	305	331
2379		\N	\N	ดุมใหญ่	34140	303	331
2389		\N	\N	นาเลิง	34140	303	331
2377		\N	\N	ม่วงสามสิบ	34140	303	331
2383		\N	\N	ยางสักกระโพหลุ่ม	34140	303	331
2387		\N	\N	ยางโยภาพ	34140	303	331
2380		\N	\N	หนองช้างใหญ่	34140	303	331
2386		\N	\N	หนองฮาง	34140	303	331
2381		\N	\N	หนองเมือง	34140	303	331
2385		\N	\N	หนองเหล่า	34140	303	331
2384		\N	\N	หนองไข่นก	34140	303	331
2382		\N	\N	เตย	34140	303	331
2378		\N	\N	เหล่าบก	34140	303	331
2390		\N	\N	โพนแพง	34140	303	331
2388		\N	\N	ไผ่ใหญ่	34140	303	331
2398		\N	\N	คำขวาง	34190	304	331
2396		\N	\N	คำน้ำแซบ	34190	304	331
2394		\N	\N	คูเมือง	34190	304	331
2392		\N	\N	ท่าลาด	34310	304	331
2391		\N	\N	ธาตุ	34190	304	331
2397		\N	\N	บุ่งหวาย	34310	304	331
2405		\N	\N	บุ่งไหม	34190	304	331
7345		\N	\N	วารินชำราบ	34190	304	331
2395		\N	\N	สระสมิง	34190	304	331
2401		\N	\N	หนองกินเพล	34190	304	331
2404		\N	\N	ห้วยขะยูง	34310	304	331
2403		\N	\N	เมืองศรีไค	34190	304	331
2400		\N	\N	แสนสุข	34190	304	331
2402		\N	\N	โนนผึ้ง	34190	304	331
2393		\N	\N	โนนโหนน	34190	304	331
2399		\N	\N	โพธิ์ใหญ่	34190	304	331
2276		\N	\N	คำไหล	34250	293	331
2279		\N	\N	ดอนใหญ่	34250	293	331
2275		\N	\N	ตะบ่าย	34250	293	331
2269		\N	\N	นาคำ	34250	293	331
2278		\N	\N	นาเลิน	34250	293	331
2273		\N	\N	ลาดควาย	34250	293	331
2272		\N	\N	วาริน	34250	293	331
2274		\N	\N	สงยาง	34250	293	331
2277		\N	\N	หนามแท่ง	34250	293	331
2271		\N	\N	เอือดใหญ่	34250	293	331
2270		\N	\N	แก้งกอก	34250	293	331
2466		\N	\N	ท่าช้าง	34190	315	331
2467		\N	\N	บุ่งมะแลง	34190	315	331
2468		\N	\N	สว่าง	34190	315	331
2465		\N	\N	แก่งโดม	34190	315	331
2438		\N	\N	ขามป้อม	34360	308	331
2433		\N	\N	ค้อน้อย	34360	308	331
2437		\N	\N	บอน	34360	308	331
2431		\N	\N	สำโรง	34360	308	331
2432		\N	\N	หนองไฮ	34360	308	331
2430		\N	\N	โคกก่อง	34360	308	331
2435		\N	\N	โคกสว่าง	34360	308	331
2436		\N	\N	โนนกลาง	34360	308	331
2434		\N	\N	โนนกาเล็น	34360	308	331
2443		\N	\N	คันไร่	34350	310	331
2448		\N	\N	คำเขื่อนแก้ว	34350	310	331
2444		\N	\N	ช่องเม็ก	34350	310	331
2446		\N	\N	นิคมสร้างตนเองลำโดมน้อย	34350	310	331
2447		\N	\N	ฝางคำ	34350	310	331
2445		\N	\N	โนนก่อ	34350	310	331
2304		\N	\N	ขามป้อม	34170	296	331
2307		\N	\N	นาแวง	34170	296	331
2309		\N	\N	หนองนกทา	34170	296	331
2306		\N	\N	หนองผือ	34170	296	331
2310		\N	\N	หนองสิม	34170	296	331
2311		\N	\N	หัวนา	34170	296	331
2303		\N	\N	เขมราฐ	34170	296	331
2305		\N	\N	เจียด	34170	296	331
2308		\N	\N	แก้งเหนือ	34170	296	331
2297		\N	\N	กลางใหญ่	34320	295	331
2288		\N	\N	ก่อเอ้	34150	295	331
2287		\N	\N	ค้อทอง	34150	295	331
2290		\N	\N	ชีทวน	34150	295	331
2291		\N	\N	ท่าไห	34150	295	331
2294		\N	\N	ธาตุน้อย	34150	295	331
2292		\N	\N	นาคำใหญ่	34150	295	331
2296		\N	\N	บ้านกอก	34320	295	331
2295		\N	\N	บ้านไทย	34320	295	331
2299		\N	\N	ยางขี้นก	34150	295	331
2300		\N	\N	ศรีสุข	34150	295	331
2286		\N	\N	สร้างถ่อ	34150	295	331
2301		\N	\N	สหธาตุ	34150	295	331
2302		\N	\N	หนองเหล่า	34150	295	331
2289		\N	\N	หัวดอน	34150	295	331
2285		\N	\N	เขื่องใน	34150	295	331
2293		\N	\N	แดงหม้อ	34150	295	331
2298		\N	\N	โนนรัง	34320	295	331
2319		\N	\N	กลาง	34160	297	331
2317		\N	\N	กุดประทาย	34160	297	331
2323		\N	\N	คำครั่ง	34160	297	331
2318		\N	\N	ตบหู	34160	297	331
2315		\N	\N	ทุ่งเทิง	34160	297	331
2321		\N	\N	ท่าโพธิ์ศรี	34160	297	331
2324		\N	\N	นากระแซง	34160	297	331
2313		\N	\N	นาส่วง	34160	297	331
2314		\N	\N	นาเจริญ	34160	297	331
2322		\N	\N	บัวงาม	34160	297	331
2326		\N	\N	ป่าโมง	34160	297	331
2316		\N	\N	สมสะอาด	34160	297	331
2312		\N	\N	เมืองเดช	34160	297	331
2320		\N	\N	แก้ง	34160	297	331
2327		\N	\N	โนนสมบูรณ์	34160	297	331
2325		\N	\N	โพนงาม	34160	297	331
2266		\N	\N	กระโสบ	34000	292	331
2267		\N	\N	กุดลาด	34000	292	331
2262		\N	\N	ขามใหญ่	34000	292	331
2268		\N	\N	ขี้เหล็ก	34000	292	331
7398		\N	\N	ปทุม	34000	292	331
7399		\N	\N	ปะอาว	34000	292	331
2261		\N	\N	หนองขอน	34000	292	331
2264		\N	\N	หนองบ่อ	34000	292	331
2260		\N	\N	หัวเรือ	34000	292	331
2263		\N	\N	แจระแม	34000	292	331
2259		\N	\N	ในเมือง	34000	292	331
2265		\N	\N	ไร่น้อย	34000	292	331
2464		\N	\N	หนองบก	34000	314	331
2461		\N	\N	เหล่าเสือโก้ก	34000	314	331
2463		\N	\N	แพงใหญ่	34000	314	331
2462		\N	\N	โพนเมือง	34000	314	331
2282		\N	\N	นาโพธิ์กลาง	34220	294	331
2283		\N	\N	หนองแสงใหญ่	34220	294	331
2281		\N	\N	ห้วยยาง	34220	294	331
2284		\N	\N	ห้วยไผ่	34220	294	331
2280		\N	\N	โขงเจียม	34220	294	331
2425		\N	\N	ม่วงใหญ่	34340	307	331
2427		\N	\N	สองคอน	34340	307	331
2428		\N	\N	สารภี	34340	307	331
2426		\N	\N	สำโรง	34340	307	331
2429		\N	\N	เหล่างาม	34340	307	331
2419		\N	\N	โพธิ์ไทร	34340	307	331
545		\N	\N	นรสิงห์	14130	88	214
541		\N	\N	บางปลากด	14130	88	214
544		\N	\N	บางเสด็จ	14130	88	214
7382		\N	\N	ป่าโมก	14130	88	214
542		\N	\N	สายทอง	14130	88	214
546		\N	\N	เอกราช	14130	88	214
547		\N	\N	โผงเผง	14130	88	214
543		\N	\N	โรงช้าง	14130	88	214
578		\N	\N	คลองขนาก	14110	91	214
584		\N	\N	ตลาดใหม่	14110	91	214
574		\N	\N	ท่าช้าง	14110	91	214
576		\N	\N	บางจัก	14110	91	214
581		\N	\N	ม่วงเตี้ย	14110	91	214
575		\N	\N	ยี่ล้น	14110	91	214
571		\N	\N	ศาลเจ้าโรงทอง	14110	91	214
573		\N	\N	สาวร้องไห้	14110	91	214
580		\N	\N	สี่ร้อย	14110	91	214
583		\N	\N	หลักแก้ว	14110	91	214
582		\N	\N	หัวตะพาน	14110	91	214
577		\N	\N	ห้วยคันแหลน	14110	91	214
570		\N	\N	ไผ่จำศีล	14110	91	214
572		\N	\N	ไผ่ดำพัฒนา	14110	91	214
579		\N	\N	ไผ่วง	14110	91	214
589		\N	\N	มงคลธรรมนิมิต	14160	92	214
586		\N	\N	ราษฎรพัฒนา	14160	92	214
585		\N	\N	สามโก้	14160	92	214
587		\N	\N	อบทม	14160	92	214
588		\N	\N	โพธิ์ม่วงพันธ์	14160	92	214
530		\N	\N	คลองวัว	14000	86	214
527		\N	\N	จำปาหล่อ	14000	86	214
523		\N	\N	ตลาดกรวด	14000	86	214
519		\N	\N	ตลาดหลวง	14000	86	214
7381		\N	\N	บางแก้ว	14000	86	214
529		\N	\N	บ้านรี	14000	86	214
525		\N	\N	บ้านอิฐ	14000	86	214
522		\N	\N	บ้านแห	14000	86	214
521		\N	\N	ป่างิ้ว	14000	86	214
524		\N	\N	มหาดไทย	14000	86	214
531		\N	\N	ย่านซื่อ	14000	86	214
520		\N	\N	ศาลาแดง	14000	86	214
526		\N	\N	หัวไผ่	14000	86	214
528		\N	\N	โพสะ	14000	86	214
569		\N	\N	จำลอง	14150	90	214
565		\N	\N	บ้านพราน	14150	90	214
566		\N	\N	วังน้ำเย็น	14150	90	214
564		\N	\N	ศรีพราน	14150	90	214
567		\N	\N	สีบัวทอง	14150	90	214
568		\N	\N	ห้วยไผ่	14150	90	214
563		\N	\N	แสวงหา	14150	90	214
562		\N	\N	คำหยาด	14120	89	214
559		\N	\N	ทางพระ	14120	89	214
550		\N	\N	บางพลับ	14120	89	214
553		\N	\N	บางระกำ	14120	89	214
561		\N	\N	บางเจ้าฉ่า	14120	89	214
558		\N	\N	บ่อแร่	14120	89	214
557		\N	\N	ยางช้าย	14120	89	214
552		\N	\N	รำมะสัก	14120	89	214
560		\N	\N	สามง่าม	14120	89	214
551		\N	\N	หนองแม่ไก่	14120	89	214
555		\N	\N	องครักษ์	14120	89	214
549		\N	\N	อินทประมูล	14120	89	214
548		\N	\N	อ่างแก้ว	14120	89	214
556		\N	\N	โคกพุทรา	14120	89	214
554		\N	\N	โพธิ์รังนก	14120	89	214
532		\N	\N	จรเข้ร้อง	14140	87	214
539		\N	\N	ชะไว	14140	87	214
534		\N	\N	ชัยฤทธิ์	14140	87	214
540		\N	\N	ตรีณรงค์	14140	87	214
536		\N	\N	ราชสถิตย์	14140	87	214
538		\N	\N	หลักฟ้า	14140	87	214
535		\N	\N	เทวราช	14140	87	214
533		\N	\N	ไชยภูมิ	14140	87	214
537		\N	\N	ไชโย	14140	87	214
4802		\N	\N	ต้า	57340	618	433
4803		\N	\N	ป่าตาล	57340	618	433
4804		\N	\N	ยางฮอม	57340	618	433
4818		\N	\N	ปงน้อย	57110	622	433
4819		\N	\N	หนองป่าก่อ	57110	622	433
7444		\N	\N	โชคชัย	57110	622	433
4751		\N	\N	ป่าแงะ	57190	610	433
4779		\N	\N	ป่าแดด	57190	610	433
4754		\N	\N	ศรีโพธิ์เงิน	57190	610	433
4752		\N	\N	สันมะค่า	57190	610	433
4753		\N	\N	โรงช้าง	57190	610	433
4797		\N	\N	ตาดควัน	57290	616	433
4796		\N	\N	เม็งราย	57290	616	433
4794		\N	\N	แม่ต๋ำ	57290	616	433
4793		\N	\N	แม่เปา	57290	616	433
4795		\N	\N	ไม้ยา	57290	616	433
4740		\N	\N	ดอยงาม	57120	609	433
4745		\N	\N	ทรายขาว	57120	609	433
4749		\N	\N	ทานตะวัน	57280	609	433
4738		\N	\N	ธารทอง	57250	609	433
4743		\N	\N	ป่าหุ่ง	57120	609	433
4744		\N	\N	ม่วงคำ	57120	609	433
4746		\N	\N	สันกลาง	57120	609	433
4739		\N	\N	สันติสุข	57120	609	433
4736		\N	\N	สันมะเค็ด	57120	609	433
4741		\N	\N	หัวง้ม	57120	609	433
4742		\N	\N	เจริญเมือง	57120	609	433
4748		\N	\N	เมืองพาน	57120	609	433
4750		\N	\N	เวียงห้าว	57120	609	433
4737		\N	\N	แม่อ้อ	57120	609	433
4747		\N	\N	แม่เย็น	57280	609	433
4721		\N	\N	ครึ่ง	57140	607	433
4722		\N	\N	บุญเรือง	57140	607	433
4725		\N	\N	ริมโขง	57140	607	433
4724		\N	\N	ศรีดอนชัย	57140	607	433
4720		\N	\N	สถาน	57140	607	433
4723		\N	\N	ห้วยซ้อ	57140	607	433
4719		\N	\N	เวียง	57140	607	433
4766		\N	\N	บ้านแซว	57150	612	433
4765		\N	\N	ป่าสัก	57150	612	433
4767		\N	\N	ศรีดอนมูล	57150	612	433
4764		\N	\N	เวียง	57150	612	433
4768		\N	\N	แม่เงิน	57150	612	433
4769		\N	\N	โยนก	57150	612	433
4727		\N	\N	งิ้ว	57160	608	433
4731		\N	\N	ตับเต่า	57160	608	433
4728		\N	\N	ปล้อง	57230	608	433
4734		\N	\N	ศรีดอนไชย	57230	608	433
4733		\N	\N	สันทรายงาม	57160	608	433
4732		\N	\N	หงาว	57160	608	433
4735		\N	\N	หนองแรด	57230	608	433
4730		\N	\N	เชียงเคี่ยน	57230	608	433
4726		\N	\N	เวียง	57160	608	433
4729		\N	\N	แม่ลอย	57230	608	433
4710		\N	\N	ดอยลาน	57000	605	433
4713		\N	\N	ดอยฮาง	57000	605	433
4712		\N	\N	ท่าสาย	57000	605	433
7443		\N	\N	ท่าสุด	57100	605	433
4702		\N	\N	นางแล	57100	605	433
4701		\N	\N	บ้านดู่	57100	605	433
4711		\N	\N	ป่าอ้อดอนชัย	57000	605	433
4700		\N	\N	รอบเวียง	57000	605	433
4709		\N	\N	ริมกก	57100	605	433
4705		\N	\N	สันทราย	57000	605	433
4707		\N	\N	ห้วยชมภู	57000	605	433
4708		\N	\N	ห้วยสัก	57000	605	433
7350		\N	\N	เวียง	57000	605	433
4706		\N	\N	แม่กรณ์	57000	605	433
4703		\N	\N	แม่ข้าวต้ม	57100	605	433
4704		\N	\N	แม่ยาว	57100	605	433
4717		\N	\N	ดอนศิลา	57210	606	433
4715		\N	\N	ผางาม	57210	606	433
4718		\N	\N	เมืองชุม	57210	606	433
4714		\N	\N	เวียงชัย	57210	606	433
4716		\N	\N	เวียงเหนือ	57210	606	433
4788		\N	\N	บ้านโป่ง	57170	615	433
4789		\N	\N	ป่างิ้ว	57170	615	433
4786		\N	\N	สันสลี	57170	615	433
4787		\N	\N	เวียง	57170	615	433
4790		\N	\N	เวียงกาหลง	57260	615	433
4791		\N	\N	แม่เจดีย์	57260	615	433
4792		\N	\N	แม่เจดีย์ใหม่	57260	615	433
4815		\N	\N	ดงมหาวัน	57210	621	433
4814		\N	\N	ทุ่งก่อ	57210	621	433
4817		\N	\N	ป่าซาง	57210	621	433
4801		\N	\N	ท่าข้าม	57310	617	433
4799		\N	\N	ปอ	57310	617	433
4798		\N	\N	ม่วงยาย	57310	617	433
4800		\N	\N	หล่ายงาว	57310	617	433
7351		\N	\N	จอมสวรรค์	57110	611	433
4756		\N	\N	จันจว้า	57270	611	433
4763		\N	\N	จันจว้าใต้	57270	611	433
4759		\N	\N	ท่าข้าวเปลือก	57110	611	433
4816		\N	\N	ป่าซาง	57110	611	433
4760		\N	\N	ป่าตึง	57110	611	433
4762		\N	\N	ศรีค้ำ	57110	611	433
4758		\N	\N	สันทราย	57110	611	433
4757		\N	\N	แม่คำ	57240	611	433
4755		\N	\N	แม่จัน	57110	611	433
4761		\N	\N	แม่ไร่	57240	611	433
4805		\N	\N	เทอดไทย	57240	619	433
4808		\N	\N	แม่ฟ้าหลวง	57240	619	433
4807		\N	\N	แม่สลองนอก	57110	619	433
4806		\N	\N	แม่สลองใน	57110	619	433
4810		\N	\N	จอมหมอกแก้ว	57250	620	433
4809		\N	\N	ดงมะดะ	57250	620	433
4811		\N	\N	บัวสลี	57250	620	433
4812		\N	\N	ป่าก่อดำ	57250	620	433
4813		\N	\N	โป่งแพร่	57000	620	433
4783		\N	\N	ท่าก๊อ	57180	614	433
4780		\N	\N	ป่าแดด	57180	614	433
4784		\N	\N	วาวี	57180	614	433
4782		\N	\N	ศรีถ้อย	57180	614	433
4785		\N	\N	เจดีย์หลวง	57180	614	433
4781		\N	\N	แม่พริก	57180	614	433
4778		\N	\N	แม่สรวย	57180	614	433
4776		\N	\N	บ้านด้าย	57220	613	433
4774		\N	\N	ศรีเมืองชุม	57130	613	433
4771		\N	\N	ห้วยไคร้	57220	613	433
4772		\N	\N	เกาะช้าง	57130	613	433
4775		\N	\N	เวียงพางคำ	57130	613	433
4770		\N	\N	แม่สาย	57130	613	433
4777		\N	\N	โป่งงาม	57130	613	433
4773		\N	\N	โป่งผา	57130	613	433
7484		\N	\N	บ้านจันทร์	58130	927	432
7485		\N	\N	แจ่มหลวง	58130	927	432
7486		\N	\N	แม่แดด	58130	927	432
4088		\N	\N	ข่วงเปา	50160	520	432
4091		\N	\N	ดอยแก้ว	50160	520	432
4087		\N	\N	บ้านหลวง	50160	520	432
4090		\N	\N	บ้านแปะ	50240	520	432
4089		\N	\N	สบเตี๊ยะ	50160	520	432
4092		\N	\N	แม่สอย	50240	520	432
4113		\N	\N	ตลาดขวัญ	50220	523	432
4116		\N	\N	ตลาดใหญ่	50220	523	432
4110		\N	\N	ป่าป้อง	50220	523	432
4112		\N	\N	ป่าลาน	50220	523	432
4119		\N	\N	ป่าเมี่ยง	50220	523	432
4109		\N	\N	ลวงเหนือ	50220	523	432
4111		\N	\N	สง่าบ้าน	50220	523	432
4108		\N	\N	สันปูเลย	50220	523	432
4114		\N	\N	สำราญราษฎร์	50220	523	432
4107		\N	\N	เชิงดอย	50220	523	432
4120		\N	\N	เทพเสด็จ	50220	523	432
4115		\N	\N	แม่คือ	50220	523	432
4117		\N	\N	แม่ฮ้อยเงิน	50220	523	432
4118		\N	\N	แม่โป่ง	50220	523	432
4256		\N	\N	ดอยหล่อ	50160	542	432
4258		\N	\N	ยางคราม	50160	542	432
4257		\N	\N	สองแคว	50160	542	432
4259		\N	\N	สันติสุข	50160	542	432
4220		\N	\N	ดอยเต่า	50260	535	432
4221		\N	\N	ท่าเดื่อ	50260	535	432
4224		\N	\N	บงตัน	50260	535	432
4223		\N	\N	บ้านแอ่น	50260	535	432
4222		\N	\N	มืดกา	50260	535	432
4225		\N	\N	โปงทุ่ง	50260	535	432
4151		\N	\N	ม่อนปิ่น	50110	527	432
4155		\N	\N	สันทราย	50110	527	432
4149		\N	\N	เวียง	50110	527	432
7348		\N	\N	แม่ข่า	50320	527	432
7347		\N	\N	แม่คะ	50110	527	432
4152		\N	\N	แม่งอน	50320	527	432
4153		\N	\N	แม่สูน	50110	527	432
7346		\N	\N	โป่งน้ำร้อน	50110	527	432
4162		\N	\N	ทุ่งหลวง	50190	529	432
4167		\N	\N	น้ำแพร่	50190	529	432
4165		\N	\N	บ้านโป่ง	50190	529	432
4163		\N	\N	ป่าตุ้ม	50190	529	432
4164		\N	\N	ป่าไหน่	50190	529	432
4154		\N	\N	สันทราย	50190	529	432
4168		\N	\N	เขื่อนผาก	50190	529	432
4150		\N	\N	เวียง	50190	529	432
4170		\N	\N	แม่ปั๋ง	50190	529	432
4169		\N	\N	แม่แวน	50190	529	432
4171		\N	\N	โหล่งขอด	50190	529	432
4147		\N	\N	บ่อแก้ว	50250	526	432
4148		\N	\N	ยั้งเมิน	50250	526	432
4145		\N	\N	สะเมิงเหนือ	50250	526	432
4144		\N	\N	สะเมิงใต้	50250	526	432
4146		\N	\N	แม่สาบ	50250	526	432
4191		\N	\N	ต้นเปา	50130	531	432
4183		\N	\N	ทรายมูล	50130	531	432
4185		\N	\N	บวกค้าง	50130	531	432
4184		\N	\N	ร้องวัวแดง	50130	531	432
4173		\N	\N	สันกลาง	50130	531	432
4182		\N	\N	สันกำแพง	50130	531	432
4189		\N	\N	ห้วยทราย	50130	531	432
4187		\N	\N	ออนใต้	50130	531	432
4186		\N	\N	แช่ช้าง	50130	531	432
4188		\N	\N	แม่ปูคา	50130	531	432
4203		\N	\N	ป่าไผ่	50210	532	432
4193		\N	\N	สันทรายน้อย	50210	532	432
4192		\N	\N	สันทรายหลวง	50210	532	432
4195		\N	\N	สันนาเม็ง	50210	532	432
4196		\N	\N	สันป่าเปา	50210	532	432
4194		\N	\N	สันพระเนตร	50210	532	432
4198		\N	\N	หนองจ๊อม	50210	532	432
4199		\N	\N	หนองหาร	50290	532	432
4197		\N	\N	หนองแหย่ง	50210	532	432
4202		\N	\N	เมืองเล็น	50210	532	432
4200		\N	\N	แม่แฝก	50290	532	432
4201		\N	\N	แม่แฝกใหม่	50290	532	432
4181		\N	\N	ทุ่งต้อม	50120	530	432
4180		\N	\N	ทุ่งสะโตก	50120	530	432
4175		\N	\N	ท่าวังพร้าว	50120	530	432
7418		\N	\N	น้ำบ่อหลวง	50120	530	432
4179		\N	\N	บ้านกลาง	50120	530	432
4178		\N	\N	บ้านแม	50120	530	432
4176		\N	\N	มะขามหลวง	50120	530	432
7419		\N	\N	มะขุนหวาน	50120	530	432
4172		\N	\N	ยุหว่า	50120	530	432
4174		\N	\N	สันกลาง	50120	530	432
4177		\N	\N	แม่ก๊า	50120	530	432
4236		\N	\N	ขัวมุง	50140	537	432
4234		\N	\N	ชมภู	50140	537	432
4141		\N	\N	ดอนแก้ว	50140	537	432
4239		\N	\N	ท่ากว้าง	50140	537	432
4240		\N	\N	ท่าวังตาล	50140	537	432
4241		\N	\N	ป่าบง	50140	537	432
4232		\N	\N	ยางเนิ้ง	50140	537	432
4156		\N	\N	สันทราย	50140	537	432
4233		\N	\N	สารภี	50140	537	432
4238		\N	\N	หนองผึ้ง	50140	537	432
4237		\N	\N	หนองแฝก	50140	537	432
4235		\N	\N	ไชยสถาน	50140	537	432
4207		\N	\N	ขุนคง	50230	533	432
4166		\N	\N	น้ำแพร่	50230	533	432
4212		\N	\N	บ้านปง	50230	533	432
4209		\N	\N	บ้านแหวน	50230	533	432
4208		\N	\N	สบแม่ข่า	50230	533	432
4210		\N	\N	สันผักหวาน	50230	533	432
4211		\N	\N	หนองควาย	50230	533	432
4206		\N	\N	หนองตอง	50340	533	432
4204		\N	\N	หนองแก๋ว	50230	533	432
4213		\N	\N	หางดง	50230	533	432
4205		\N	\N	หารแก้ว	50230	533	432
4231		\N	\N	นาเกียน	50310	536	432
4229		\N	\N	ม่อนจอง	50310	536	432
4227		\N	\N	ยางเปียง	50310	536	432
4230		\N	\N	สบโขง	50310	536	432
4226		\N	\N	อมก๋อย	50310	536	432
4228		\N	\N	แม่ตื่น	50310	536	432
4219		\N	\N	นาคอเรือ	50240	534	432
4218		\N	\N	บ่อสลี	50240	534	432
4217		\N	\N	บ่อหลวง	50240	534	432
4216		\N	\N	บ้านตาล	50240	534	432
4214		\N	\N	หางดง	50240	534	432
4215		\N	\N	ฮอด	50240	534	432
4106		\N	\N	ทุ่งข้าวพวง	50170	522	432
4105		\N	\N	ปิงโค้ง	50170	522	432
4100		\N	\N	เชียงดาว	50170	522	432
4104		\N	\N	เมืองคอง	50170	522	432
4102		\N	\N	เมืองงาย	50170	522	432
4101		\N	\N	เมืองนะ	50170	522	432
4103		\N	\N	แม่นะ	50170	522	432
4074		\N	\N	ช้างคลาน	50100	519	432
4073		\N	\N	ช้างม่อย	50300	519	432
4076		\N	\N	ช้างเผือก	50300	519	432
4081		\N	\N	ท่าศาลา	50000	519	432
4084		\N	\N	ป่าตัน	50300	519	432
4079		\N	\N	ป่าแดด	50100	519	432
4071		\N	\N	พระสิงห์	50200	519	432
4083		\N	\N	ฟ้าฮ่าม	50000	519	432
4075		\N	\N	วัดเกต	50000	519	432
4070		\N	\N	ศรีภูมิ	50200	519	432
4085		\N	\N	สันผีเสื้อ	50300	519	432
4077		\N	\N	สุเทพ	50200	519	432
4082		\N	\N	หนองป่าครั่ง	50000	519	432
4080		\N	\N	หนองหอย	50000	519	432
4072		\N	\N	หายยา	50100	519	432
4078		\N	\N	แม่เหียะ	50100	519	432
4243		\N	\N	เปียงหลวง	50350	538	432
4242		\N	\N	เมืองแหง	50350	538	432
7424		\N	\N	แสนไห	50350	538	432
4136		\N	\N	ขี้เหล็ก	50180	525	432
4142		\N	\N	ดอนแก้ว	50180	525	432
7349		\N	\N	ริมเหนือ	50180	525	432
4134		\N	\N	ริมใต้	50180	525	432
4137		\N	\N	สะลวง	50330	525	432
4135		\N	\N	สันโป่ง	50180	525	432
4190		\N	\N	ห้วยทราย	50180	525	432
4143		\N	\N	เหมืองแก้ว	50180	525	432
4140		\N	\N	แม่สา	50180	525	432
4138		\N	\N	แม่แรม	50180	525	432
4139		\N	\N	โป่งแยง	50180	525	432
7425		\N	\N	ดอนเปา	50360	540	432
4248		\N	\N	ทุ่งปี้	50360	540	432
7426		\N	\N	ทุ่งรวงทอง	50360	540	432
4247		\N	\N	บ้านกาด	50360	540	432
4249		\N	\N	แม่วิน	50360	540	432
4255		\N	\N	ทาเหนือ	50130	541	432
7420		\N	\N	บ้านสหกรณ์	50130	541	432
4253		\N	\N	ห้วยแก้ว	50130	541	432
4251		\N	\N	ออนกลาง	50130	541	432
4250		\N	\N	ออนเหนือ	50130	541	432
4254		\N	\N	แม่ทา	50130	541	432
4161		\N	\N	ท่าตอน	50280	528	432
4086		\N	\N	บ้านหลวง	50280	528	432
7422		\N	\N	มะลิกา	50280	528	432
4159		\N	\N	สันต้นหมื้อ	50280	528	432
4160		\N	\N	แม่นาวาง	50280	528	432
4158		\N	\N	แม่สาว	50280	528	432
4157		\N	\N	แม่อาย	50280	528	432
7421		\N	\N	กองแขก	50270	521	432
4093		\N	\N	ช่างเคิ่ง	50270	521	432
4094		\N	\N	ท่าผา	50270	521	432
4095		\N	\N	บ้านทับ	50270	521	432
4099		\N	\N	ปางหินฝน	50270	521	432
4097		\N	\N	แม่นาจร	50270	521	432
4096		\N	\N	แม่ศึก	50270	521	432
4132		\N	\N	กื้ดช้าง	50150	524	432
4123		\N	\N	ขี้เหล็ก	50150	524	432
4124		\N	\N	ช่อแล	50150	524	432
4131		\N	\N	บ้านช้าง	50150	524	432
4127		\N	\N	บ้านเป้า	50150	524	432
4129		\N	\N	ป่าแป๋	50150	524	432
4126		\N	\N	สบเปิง	50150	524	432
4128		\N	\N	สันป่ายาง	50330	524	432
4121		\N	\N	สันมหาพน	50150	524	432
4133		\N	\N	อินทขิล	50150	524	432
4130		\N	\N	เมืองก๋าย	50150	524	432
4125		\N	\N	แม่หอพระ	50150	524	432
4122		\N	\N	แม่แตง	50150	524	432
4244		\N	\N	ปงตำ	50320	539	432
4245		\N	\N	ศรีดงเย็น	50320	539	432
7423		\N	\N	หนองบัว	50320	539	432
4246		\N	\N	แม่ทะลบ	50320	539	432
6091		\N	\N	ชะอำ	76120	763	244
6099		\N	\N	ดอนขุนห้วย	76120	763	244
6093		\N	\N	นายาง	76120	763	244
6092		\N	\N	บางเก่า	76120	763	244
6098		\N	\N	สามพระยา	76120	763	244
6095		\N	\N	หนองศาลา	76120	763	244
6096		\N	\N	ห้วยทรายเหนือ	76120	763	244
6094		\N	\N	เขาใหญ่	76120	763	244
6097		\N	\N	ไร่ใหม่พัฒนา	76120	763	244
6109		\N	\N	กลัดหลวง	76130	764	244
6102		\N	\N	ท่าคอย	76130	764	244
6100		\N	\N	ท่ายาง	76130	764	244
6112		\N	\N	ท่าแลง	76130	764	244
6107		\N	\N	ท่าไม้รวก	76130	764	244
6113		\N	\N	บ้านในดง	76130	764	244
6110		\N	\N	ปึกเตียน	76130	764	244
6106		\N	\N	มาบปลาเค้า	76130	764	244
6103		\N	\N	ยางหย่อง	76130	764	244
6108		\N	\N	วังไคร้	76130	764	244
6105		\N	\N	หนองจอก	76130	764	244
6111		\N	\N	เขากระปุก	76130	764	244
6117		\N	\N	ตำหรุ	76150	765	244
6130		\N	\N	ถ้ำรงค์	76150	765	244
6129		\N	\N	ท่าช้าง	76150	765	244
6120		\N	\N	ท่าเสน	76150	765	244
6116		\N	\N	บ้านทาน	76150	765	244
6114		\N	\N	บ้านลาด	76150	765	244
6115		\N	\N	บ้านหาด	76150	765	244
6123		\N	\N	ลาดโพธิ์	76150	765	244
6118		\N	\N	สมอพลือ	76150	765	244
6124		\N	\N	สะพานไกร	76150	765	244
6121		\N	\N	หนองกระเจ็ด	76150	765	244
6122		\N	\N	หนองกะปุ	76150	765	244
6128		\N	\N	ห้วยข้อง	76150	765	244
6131		\N	\N	ห้วยลึก	76150	765	244
6126		\N	\N	โรงเข้	76150	765	244
6119		\N	\N	ไร่มะขาม	76150	765	244
6127		\N	\N	ไร่สะท้อน	76150	765	244
6125		\N	\N	ไร่โคก	76150	765	244
6138		\N	\N	ท่าแร้ง	76110	766	244
6139		\N	\N	ท่าแร้งออก	76110	766	244
6101		\N	\N	บางขุนไทร	76110	766	244
6137		\N	\N	บางครก	76110	766	244
6135		\N	\N	บางตะบูน	76110	766	244
6136		\N	\N	บางตะบูนออก	76110	766	244
6104		\N	\N	บางแก้ว	76110	766	244
6132		\N	\N	บ้านแหลม	76110	766	244
6133		\N	\N	ปากทะเล	76110	766	244
6134		\N	\N	แหลมผักเบี้ย	76100	766	244
6090		\N	\N	ท่าตะคร้อ	76160	762	244
6088		\N	\N	ยางน้ำกลัดเหนือ	76160	762	244
6089		\N	\N	ยางน้ำกลัดใต้	76160	762	244
6087		\N	\N	หนองหญ้าปล้อง	76160	762	244
6080		\N	\N	ทับคาง	76140	761	244
6079		\N	\N	บางเค็ม	76140	761	244
6078		\N	\N	สระพัง	76140	761	244
6083		\N	\N	หนองชุมพล	76140	761	244
6086		\N	\N	หนองชุมพลเหนือ	76140	761	244
6082		\N	\N	หนองปรง	76140	761	244
6081		\N	\N	หนองปลาไหล	76140	761	244
6085		\N	\N	ห้วยท่าช้าง	76140	761	244
6084		\N	\N	ห้วยโรง	76140	761	244
6077		\N	\N	เขาย้อย	76140	761	244
6054		\N	\N	คลองกระแชง	76000	760	244
6065		\N	\N	ช่องสะแก	76000	760	244
6074		\N	\N	ดอนยาง	76000	760	244
6071		\N	\N	ต้นมะพร้าว	76000	760	244
6064		\N	\N	ต้นมะม่วง	76000	760	244
6053		\N	\N	ท่าราบ	76000	760	244
6057		\N	\N	ธงชัย	76000	760	244
6056		\N	\N	นาพันสาม	76000	760	244
6066		\N	\N	นาวุ้ง	76000	760	244
6062		\N	\N	บางจาก	76000	760	244
6055		\N	\N	บางจาน	76000	760	244
6058		\N	\N	บ้านกุ่ม	76000	760	244
6063		\N	\N	บ้านหม้อ	76000	760	244
6072		\N	\N	วังตะโก	76000	760	244
6067		\N	\N	สำมะโรง	76000	760	244
6075		\N	\N	หนองขนาน	76000	760	244
6076		\N	\N	หนองพลับ	76000	760	244
6059		\N	\N	หนองโสน	76000	760	244
6070		\N	\N	หัวสะพาน	76000	760	244
6069		\N	\N	หาดเจ้าสำราญ	76100	760	244
6061		\N	\N	เวียงคอย	76000	760	244
6068		\N	\N	โพพระ	76000	760	244
6073		\N	\N	โพไร่หวาน	76000	760	244
6060		\N	\N	ไร่ส้ม	76000	760	244
6143		\N	\N	ป่าเด็ง	76170	767	244
6144		\N	\N	พุสวรรค์	76170	767	244
6142		\N	\N	วังจันทร์	76170	767	244
6141		\N	\N	สองพี่น้อง	76170	767	244
6145		\N	\N	ห้วยแม่เพรียง	76170	767	244
6140		\N	\N	แก่งกระจาน	76170	767	244
5482		\N	\N	ชนแดน	67150	704	423
5488		\N	\N	ซับพุทรา	67150	704	423
5483		\N	\N	ดงขุย	67190	704	423
7352		\N	\N	ตะกุดไร	67190	704	423
5484		\N	\N	ท่าข้าม	67150	704	423
5487		\N	\N	บ้านกล้วย	67190	704	423
5485		\N	\N	พุทธบาท	67150	704	423
5486		\N	\N	ลาดแค	67150	704	423
5489		\N	\N	ศาลาลาย	67150	704	423
5560		\N	\N	น้ำหนาว	67260	711	423
5562		\N	\N	วังกวาง	67260	711	423
5561		\N	\N	หลักด่าน	67260	711	423
7456		\N	\N	โคกมน	67260	711	423
5555		\N	\N	กันจุ	67160	710	423
5552		\N	\N	ซับสมอทอด	67160	710	423
5553		\N	\N	ซับไม้แดง	67160	710	423
5559		\N	\N	บึงสามพัน	67160	710	423
5557		\N	\N	พญาวัง	67160	710	423
5556		\N	\N	วังพิกุล	67230	710	423
5558		\N	\N	ศรีมงคล	67160	710	423
7353		\N	\N	สระแก้ว	67160	710	423
5554		\N	\N	หนองแจง	67160	710	423
5565		\N	\N	ซับเปิบ	67240	712	423
5564		\N	\N	ท้ายดง	67240	712	423
7455		\N	\N	วังศาล	67240	712	423
5566		\N	\N	วังหิน	67240	712	423
5563		\N	\N	วังโป่ง	67240	712	423
5533		\N	\N	ซับน้อย	67180	707	423
5529		\N	\N	ซับสมบูรณ์	67180	707	423
5520		\N	\N	ท่าโรง	67130	707	423
5524		\N	\N	น้ำร้อน	67130	707	423
5530		\N	\N	บึงกระจับ	67130	707	423
5525		\N	\N	บ่อรัง	67130	707	423
5527		\N	\N	พุขาม	67180	707	423
5526		\N	\N	พุเตย	67180	707	423
5528		\N	\N	ภูน้ำหยด	67180	707	423
5532		\N	\N	ยางสาว	67130	707	423
5531		\N	\N	วังใหญ่	67180	707	423
5521		\N	\N	สระประดู่	67130	707	423
5522		\N	\N	สามแยก	67130	707	423
5523		\N	\N	โคกปรง	67130	707	423
5536		\N	\N	คลองกระจัง	67170	708	423
5537		\N	\N	นาสนุ่น	67170	708	423
5540		\N	\N	ประดู่งาม	67170	708	423
5534		\N	\N	ศรีเทพ	67170	708	423
5535		\N	\N	สระกรวด	67170	708	423
5539		\N	\N	หนองย่างทอย	67170	708	423
5538		\N	\N	โคกสะอาด	67170	708	423
5541		\N	\N	กองทูล	67140	709	423
7354		\N	\N	ท่าด้วง	67140	709	423
5544		\N	\N	ท่าแดง	67140	709	423
5542		\N	\N	นาเฉลียง	67220	709	423
5549		\N	\N	บัววัฒนา	67140	709	423
5546		\N	\N	บ่อไทย	67140	709	423
5543		\N	\N	บ้านโภชน์	67140	709	423
7355		\N	\N	ยางงาม	67220	709	423
5548		\N	\N	วังท่าดี	67140	709	423
5551		\N	\N	วังโบสถ์	67140	709	423
5550		\N	\N	หนองไผ่	67140	709	423
5547		\N	\N	ห้วยโป่ง	67220	709	423
5545		\N	\N	เพชรละคร	67140	709	423
5509		\N	\N	ช้างตะลูด	67110	705	423
5492		\N	\N	ตาลเดี่ยว	67110	705	423
5497		\N	\N	ท่าอิบุญ	67110	705	423
5501		\N	\N	น้ำก้อ	67110	705	423
5503		\N	\N	น้ำชุน	67110	705	423
5495		\N	\N	น้ำเฮี้ย	67110	705	423
5506		\N	\N	บุ่งคล้า	67110	705	423
5507		\N	\N	บุ่งน้ำเต้า	67110	705	423
5508		\N	\N	บ้านกลาง	67110	705	423
5499		\N	\N	บ้านติ้ว	67110	705	423
7453		\N	\N	บ้านหวาย	67110	705	423
5498		\N	\N	บ้านโสก	67110	705	423
5510		\N	\N	บ้านไร่	67110	705	423
5502		\N	\N	ปากช่อง	67110	705	423
7454		\N	\N	ปากดุก	67110	705	423
5493		\N	\N	ฝายนาแซง	67110	705	423
5505		\N	\N	ลานบ่า	67110	705	423
5491		\N	\N	วัดป่า	67110	705	423
5496		\N	\N	สักหลง	67110	705	423
5494		\N	\N	หนองสว่าง	67110	705	423
5504		\N	\N	หนองไขว่	67110	705	423
5490		\N	\N	หล่มสัก	67110	705	423
5500		\N	\N	ห้วยไร่	67110	705	423
5519		\N	\N	ตาดกลอย	67120	706	423
5512		\N	\N	นาซำ	67120	706	423
5518		\N	\N	นาเกาะ	67120	706	423
5516		\N	\N	นาแซง	67120	706	423
5514		\N	\N	บ้านเนิน	67120	706	423
5517		\N	\N	วังบาล	67120	706	423
5515		\N	\N	ศิลา	67120	706	423
5511		\N	\N	หล่มเก่า	67120	706	423
5513		\N	\N	หินฮาว	67120	706	423
5567		\N	\N	ทุ่งสมอ	67270	713	423
5570		\N	\N	ริมสีม่วง	67270	713	423
5571		\N	\N	สะเดาะพง	67270	713	423
5572		\N	\N	หนองแม่นา	67270	713	423
5569		\N	\N	เขาค้อ	67270	713	423
5573		\N	\N	เข็กน้อย	67280	713	423
5568		\N	\N	แคมป์สน	67280	713	423
5474		\N	\N	ชอนไพร	67000	703	423
5472		\N	\N	ดงมูลเหล็ก	67000	703	423
5466		\N	\N	ตะเบาะ	67000	703	423
5471		\N	\N	ท่าพล	67250	703	423
5470		\N	\N	นางั่ว	67000	703	423
5475		\N	\N	นาป่า	67000	703	423
5476		\N	\N	นายม	67210	703	423
5478		\N	\N	น้ำร้อน	67000	703	423
5473		\N	\N	บ้านโคก	67000	703	423
5467		\N	\N	บ้านโตก	67000	703	423
5469		\N	\N	ป่าเลา	67000	703	423
5481		\N	\N	ระวิง	67210	703	423
5477		\N	\N	วังชมภู	67210	703	423
5468		\N	\N	สะเดียง	67000	703	423
5479		\N	\N	ห้วยสะแก	67210	703	423
5480		\N	\N	ห้วยใหญ่	67000	703	423
5465		\N	\N	ในเมือง	67000	703	423
3177		\N	\N	กกสะทอน	42120	404	322
3171		\N	\N	ด่านซ้าย	42120	404	322
3173		\N	\N	นาดี	42120	404	322
3180		\N	\N	นาหอ	42120	404	322
3172		\N	\N	ปากหมัน	42120	404	322
3179		\N	\N	วังยาว	42120	404	322
3176		\N	\N	อิปุ่ม	42120	404	322
3174		\N	\N	โคกงาม	42120	404	322
3178		\N	\N	โป่ง	42120	404	322
3175		\N	\N	โพนสูง	42120	404	322
3192		\N	\N	ท่าลี่	42140	407	322
3197		\N	\N	น้ำทูน	42140	407	322
3195		\N	\N	น้ำแคม	42140	407	322
3193		\N	\N	หนองผือ	42140	407	322
3194		\N	\N	อาฮี	42140	407	322
3196		\N	\N	โคกใหญ่	42140	407	322
3156		\N	\N	ท่าสวรรค์	42210	401	322
3155		\N	\N	ท่าสะอาด	42210	401	322
3154		\N	\N	นาดอกคำ	42210	401	322
3153		\N	\N	นาด้วง	42210	401	322
3183		\N	\N	นาพึง	42170	405	322
3184		\N	\N	นามาลา	42170	405	322
3181		\N	\N	นาแห้ว	42170	405	322
3185		\N	\N	เหล่ากอหก	42170	405	322
3182		\N	\N	แสงภา	42170	405	322
3170		\N	\N	ชมเจริญ	42150	403	322
3165		\N	\N	ปากชม	42150	403	322
3167		\N	\N	หาดคัมภีร์	42150	403	322
3168		\N	\N	ห้วยบ่อซืน	42150	403	322
3169		\N	\N	ห้วยพิชัย	42150	403	322
3166		\N	\N	เชียงกลม	42150	403	322
3218		\N	\N	ท่าช้างคล้อง	42240	411	322
3221		\N	\N	บ้านเพิ่ม	42240	411	322
3217		\N	\N	ผาขาว	42240	411	322
3219		\N	\N	โนนปอแดง	42240	411	322
3220		\N	\N	โนนป่าซาง	42240	411	322
3209		\N	\N	ผานกเค้า	42180	409	322
3210		\N	\N	ภูกระดึง	42180	409	322
3208		\N	\N	ศรีฐาน	42180	409	322
3211		\N	\N	ห้วยส้ม	42180	409	322
3212		\N	\N	ภูหอ	42230	410	322
3213		\N	\N	หนองคัน	42230	410	322
3214		\N	\N	ห้วยสีเสียด	42230	410	322
3215		\N	\N	เลยวังไสย์	42230	410	322
3216		\N	\N	แก่งศรีภูมิ	42230	410	322
3187		\N	\N	ท่าศาลา	42160	406	322
3189		\N	\N	ปลาบ่า	42160	406	322
3188		\N	\N	ร่องจิก	42160	406	322
3190		\N	\N	ลาดค่าง	42160	406	322
3191		\N	\N	สานตม	42160	406	322
3186		\N	\N	หนองบัว	42160	406	322
3199		\N	\N	ทรายขาว	42130	408	322
3202		\N	\N	ปากปวน	42130	408	322
3203		\N	\N	ผาน้อย	42130	408	322
3204		\N	\N	ผาบิ้ง	42130	408	322
3198		\N	\N	วังสะพุง	42130	408	322
3207		\N	\N	ศรีสงคราม	42130	408	322
3201		\N	\N	หนองงิ้ว	42130	408	322
3200		\N	\N	หนองหญ้าปล้อง	42130	408	322
3205		\N	\N	เขาหลวง	42130	408	322
3206		\N	\N	โคกขมิ้น	42130	408	322
3227		\N	\N	ตาดข่า	42190	413	322
3228		\N	\N	ปวนพุ	42190	413	322
3226		\N	\N	หนองหิน	42190	413	322
3163		\N	\N	จอมศรี	42110	402	322
3158		\N	\N	ธาตุ	42110	402	322
3159		\N	\N	นาซ่าว	42110	402	322
3162		\N	\N	บุฮม	42110	402	322
3161		\N	\N	ปากตม	42110	402	322
3164		\N	\N	หาดทรายขาว	42110	402	322
3160		\N	\N	เขาแก้ว	42110	402	322
3157		\N	\N	เชียงคาน	42110	402	322
3142		\N	\N	กกดู่	42000	400	322
3152		\N	\N	กกทอง	42000	400	322
7356		\N	\N	กุดป่อง	42000	400	322
3149		\N	\N	ชัยพฤกษ์	42000	400	322
3147		\N	\N	นาดินดำ	42000	400	322
3145		\N	\N	นาอาน	42000	400	322
3141		\N	\N	นาอ้อ	42100	400	322
3150		\N	\N	นาแขม	42000	400	322
3146		\N	\N	นาโป่ง	42000	400	322
3148		\N	\N	น้ำสวย	42000	400	322
3143		\N	\N	น้ำหมาน	42000	400	322
3151		\N	\N	ศรีสองรัก	42100	400	322
3140		\N	\N	เมือง	42000	400	322
3144		\N	\N	เสี้ยว	42000	400	322
3225		\N	\N	ทรัพย์ไพวัลย์	42220	412	322
3224		\N	\N	ผาสามยอด	42220	412	322
3223		\N	\N	ผาอินทร์แปลง	42220	412	322
3222		\N	\N	เอราวัณ	42220	412	322
4492		\N	\N	ทุ่งศรี	54140	574	424
4490		\N	\N	น้ำเลา	54140	574	424
4491		\N	\N	บ้านเวียง	54140	574	424
4488		\N	\N	ร้องกวาง	54140	574	424
4489		\N	\N	ร้องเข็ม	54140	574	424
4496		\N	\N	ห้วยโรง	54140	574	424
4497		\N	\N	แม่ทราย	54140	574	424
4493		\N	\N	แม่ยางตาล	54140	574	424
7432		\N	\N	แม่ยางร้อง	54140	574	424
4494		\N	\N	แม่ยางฮ่อ	54140	574	424
4495		\N	\N	ไผ่โทน	54140	574	424
4500		\N	\N	ต้าผามอก	54150	575	424
4504		\N	\N	ทุ่งแล้ง	54150	575	424
7433		\N	\N	บ่อเหล็กลอง	54150	575	424
4499		\N	\N	บ้านปิน	54150	575	424
4502		\N	\N	ปากกาง	54150	575	424
4503		\N	\N	หัวทุ่ง	54150	575	424
4498		\N	\N	ห้วยอ้อ	54150	575	424
4501		\N	\N	เวียงต้า	54150	575	424
7434		\N	\N	แม่ปาน	54150	575	424
4531		\N	\N	นาพูน	54160	579	424
4533		\N	\N	ป่าสัก	54160	579	424
4528		\N	\N	วังชิ้น	54160	579	424
4529		\N	\N	สรอย	54160	579	424
4530		\N	\N	แม่ป้าก	54160	579	424
4532		\N	\N	แม่พุง	54160	579	424
7435		\N	\N	แม่เกิ๋ง	54160	579	424
7431		\N	\N	ทุ่งน้าว	54120	578	424
4522		\N	\N	บ้านกลาง	54120	578	424
4521		\N	\N	บ้านหนุน	54120	578	424
4526		\N	\N	สะเอียบ	54120	578	424
4525		\N	\N	หัวเมือง	54120	578	424
4523		\N	\N	ห้วยหม้าย	54120	578	424
4524		\N	\N	เตาปูน	54120	578	424
4527		\N	\N	แดนชุมพล	54120	578	424
4508		\N	\N	ดอนมูล	54130	576	424
4506		\N	\N	น้ำชำ	54130	576	424
4510		\N	\N	บ้านกวาง	54130	576	424
4512		\N	\N	บ้านกาศ	54130	576	424
4511		\N	\N	บ้านปง	54130	576	424
4509		\N	\N	บ้านเหล่า	54130	576	424
7357		\N	\N	พระหลวง	54130	576	424
4513		\N	\N	ร่องกาศ	54130	576	424
4514		\N	\N	สบสาย	54130	576	424
4505		\N	\N	สูงเม่น	54130	576	424
4507		\N	\N	หัวฝาย	54130	576	424
4515		\N	\N	เวียงทอง	54000	576	424
7436		\N	\N	ตำหนักธรรม	54170	580	424
7437		\N	\N	ทุ่งแค้ว	54170	580	424
4536		\N	\N	น้ำรัด	54170	580	424
4537		\N	\N	วังหลวง	54170	580	424
4535		\N	\N	หนองม่วงไข่	54170	580	424
4534		\N	\N	แม่คำมี	54170	580	424
4520		\N	\N	ปงป่าหวาย	54110	577	424
4519		\N	\N	ห้วยไร่	54110	577	424
4516		\N	\N	เด่นชัย	54110	577	424
4517		\N	\N	แม่จั๊วะ	54110	577	424
4518		\N	\N	ไทรย้อย	54110	577	424
7430		\N	\N	กาญจนา	54000	573	424
4486		\N	\N	ช่อแฮ	54000	573	424
4483		\N	\N	ทุ่งกวาว	54000	573	424
4473		\N	\N	ทุ่งโฮ้ง	54000	573	424
4484		\N	\N	ท่าข้าม	54000	573	424
4470		\N	\N	นาจักร	54000	573	424
4471		\N	\N	น้ำชำ	54000	573	424
4479		\N	\N	บ้านถิ่น	54000	573	424
4472		\N	\N	ป่าแดง	54000	573	424
4478		\N	\N	ป่าแมต	54000	573	424
4487		\N	\N	ร่องฟอง	54000	573	424
4475		\N	\N	วังธง	54000	573	424
4481		\N	\N	วังหงษ์	54000	573	424
4480		\N	\N	สวนเขื่อน	54000	573	424
4477		\N	\N	ห้วยม้า	54000	573	424
4474		\N	\N	เหมืองหม้อ	54000	573	424
4482		\N	\N	แม่คำมี	54000	573	424
4485		\N	\N	แม่ยม	54000	573	424
4476		\N	\N	แม่หล่าย	54000	573	424
4469		\N	\N	ในเวียง	54000	573	424
4827		\N	\N	ขุนยวม	58140	624	436
4829		\N	\N	เมืองปอน	58140	624	436
4831		\N	\N	แม่กิ๊	58140	624	436
4830		\N	\N	แม่ยวมน้อย	58140	624	436
4832		\N	\N	แม่อูคอ	58140	624	436
4828		\N	\N	แม่เงา	58140	624	436
4863		\N	\N	ถ้ำลอด	58150	629	436
4864		\N	\N	นาปู่ป้อม	58150	629	436
4862		\N	\N	ปางมะผ้า	58150	629	436
4861		\N	\N	สบป่อง	58150	629	436
4837		\N	\N	ทุ่งยาว	58130	625	436
4838		\N	\N	เมืองแปง	58130	625	436
4834		\N	\N	เวียงเหนือ	58130	625	436
4833		\N	\N	เวียงใต้	58130	625	436
4835		\N	\N	แม่นาเติง	58130	625	436
4836		\N	\N	แม่ฮี้	58130	625	436
4839		\N	\N	โป่งสา	58130	625	436
4857		\N	\N	กองก๋อย	58110	628	436
4859		\N	\N	ป่าโปง	58110	628	436
4855		\N	\N	สบเมย	58110	628	436
4856		\N	\N	แม่คะตวน	58110	628	436
4858		\N	\N	แม่สวด	58110	628	436
4860		\N	\N	แม่สามแลบ	58110	628	436
4820		\N	\N	จองคำ	58000	623	436
4823		\N	\N	ปางหมู	58000	623	436
4822		\N	\N	ผาบ่อง	58000	623	436
4824		\N	\N	หมอกจำแป่	58000	623	436
4826		\N	\N	ห้วยปูลิง	58000	623	436
4825		\N	\N	ห้วยผา	58000	623	436
4821		\N	\N	ห้วยโป่ง	58000	623	436
4854		\N	\N	ขุนแม่ลาน้อย	58120	627	436
4849		\N	\N	ท่าผาปุ้ม	58120	627	436
4853		\N	\N	สันติคีรี	58120	627	436
4851		\N	\N	ห้วยห้อม	58120	627	436
4852		\N	\N	แม่นาจาง	58120	627	436
4847		\N	\N	แม่ลาน้อย	58120	627	436
4848		\N	\N	แม่ลาหลวง	58120	627	436
4850		\N	\N	แม่โถ	58120	627	436
4840		\N	\N	บ้านกาศ	58110	626	436
4846		\N	\N	ป่าแป๋	58110	626	436
4845		\N	\N	เสาหิน	58110	626	436
4842		\N	\N	แม่คง	58110	626	436
4844		\N	\N	แม่ยวม	58110	626	436
4841		\N	\N	แม่สะเรียง	58110	626	436
4843		\N	\N	แม่เหาะ	58110	626	436
8001		\N	\N	ปราณบุรี	77160	773	245
8002		\N	\N	วังก์พง	77160	773	245
8003		\N	\N	หนองตาแต้ม	77160	773	245
8004		\N	\N	เขาจ้าว	77160	773	245
8005		\N	\N	เขาน้อย	77160	773	245
8006		\N	\N	สามร้อยยอด	77160	775	245
6631		\N	\N	เกาะร้านไก่		844	513
6719		\N	\N	เกาะกระ		848	513
6687		\N	\N	เกาะคราม		849	513
6713		\N	\N	เกาะพัดหวายเล็ก		848	513
6731		\N	\N	เกาะคางสือ		849	513
6650		\N	\N	เกาะละวะ		842	513
6716		\N	\N	เกาะกุลา		848	513
6649		\N	\N	เกาะทองหลาง		842	513
6648		\N	\N	เกาะหลักแรด		842	513
6675		\N	\N	เกาะร้านเป็ด		844	513
6630		\N	\N	เกาะงามใหญ่		842	513
6729		\N	\N	เกาะสูบ		849	513
6728		\N	\N	หมู่เกาะศรีอบยา		849	513
6712		\N	\N	เกาะแมว		848	513
6647		\N	\N	เกาะมะพร้าว		842	513
6667		\N	\N	เกาะไข่		844	513
6654		\N	\N	เกาะมาตรา		842	513
6733		\N	\N	เกาะมุก		849	513
6671		\N	\N	เกาะซีกง		844	513
6628		\N	\N	เกาะทะลุ		842	513
6720		\N	\N	เกาะยูง		848	513
6692		\N	\N	เกาะเสม็ด		842	513
6710		\N	\N	เกาะพัดหวายใหญ่		848	513
6715		\N	\N	เกาะทองแก้ว		848	513
6653		\N	\N	เกาะสาก		842	513
6676		\N	\N	เกาะเอียง		844	513
6730		\N	\N	เกาะขี้นก		849	513
6629		\N	\N	เกาะงามเล็ก		842	513
6732		\N	\N	เกาะมะพร้าว		849	513
6635		\N	\N	เกาะกินหลักง้ำ		842	513
6727		\N	\N	เกาะรางบรรทัด		849	513
6673		\N	\N	เกาะรัง		844	513
6717		\N	\N	เกาะแรด		848	513
6646		\N	\N	เกาะรังกาจิว		842	513
6672		\N	\N	เกาะพระ		844	513
6645		\N	\N	เกาะกา		842	513
6718		\N	\N	เกาะหนู		848	513
6670		\N	\N	เกาะยอ		844	513
6690		\N	\N	เกาะมัตโพน		842	513
6688		\N	\N	เกาะพิทักษ์		845	513
6651		\N	\N	เกาะอีแรด		842	513
6714		\N	\N	เกาะบาตร์		848	513
\.


--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('hibernate_sequence', 220, true);


--
-- Name: sex_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sex_id_seq', 1, false);


--
-- Name: answer_evaluation answer_evaluation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY answer_evaluation
    ADD CONSTRAINT answer_evaluation_pkey PRIMARY KEY (id);


--
-- Name: caretaker caretaker_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY caretaker
    ADD CONSTRAINT caretaker_pkey PRIMARY KEY (id);


--
-- Name: district district_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY district
    ADD CONSTRAINT district_pkey PRIMARY KEY (id);


--
-- Name: evaluation_category evaluation_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY evaluation_category
    ADD CONSTRAINT evaluation_category_pkey PRIMARY KEY (id);


--
-- Name: evaluation_test evaluation_test_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY evaluation_test
    ADD CONSTRAINT evaluation_test_pkey PRIMARY KEY (id);


--
-- Name: history_evaluation_test history_evaluation_test_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY history_evaluation_test
    ADD CONSTRAINT history_evaluation_test_pkey PRIMARY KEY (id);


--
-- Name: image_question_evaluation image_question_evaluation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY image_question_evaluation
    ADD CONSTRAINT image_question_evaluation_pkey PRIMARY KEY (id);


--
-- Name: matching matching_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY matching
    ADD CONSTRAINT matching_pkey PRIMARY KEY (id);


--
-- Name: number_evaluation number_evaluation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY number_evaluation
    ADD CONSTRAINT number_evaluation_pkey PRIMARY KEY (id);


--
-- Name: patient patient_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY patient
    ADD CONSTRAINT patient_pkey PRIMARY KEY (id);


--
-- Name: patient_test patient_test_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY patient_test
    ADD CONSTRAINT patient_test_pkey PRIMARY KEY (id);


--
-- Name: province province_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY province
    ADD CONSTRAINT province_pkey PRIMARY KEY (id);


--
-- Name: question_evaluation question_evaluation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY question_evaluation
    ADD CONSTRAINT question_evaluation_pkey PRIMARY KEY (id);


--
-- Name: sex sex_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sex
    ADD CONSTRAINT sex_pkey PRIMARY KEY (id);


--
-- Name: subdistrict subdistrict_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY subdistrict
    ADD CONSTRAINT subdistrict_pkey PRIMARY KEY (id);


--
-- Name: number_evaluation fk269jhnm6dtfo395nn04ngpgr6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY number_evaluation
    ADD CONSTRAINT fk269jhnm6dtfo395nn04ngpgr6 FOREIGN KEY (evaluation_category) REFERENCES evaluation_category(id);


--
-- Name: district fk276utu38g5lgqeth6pwfm3rw2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY district
    ADD CONSTRAINT fk276utu38g5lgqeth6pwfm3rw2 FOREIGN KEY (province_id) REFERENCES province(id);


--
-- Name: history_evaluation_test fk2hifs7ep9qi95k0nvy73tm766; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY history_evaluation_test
    ADD CONSTRAINT fk2hifs7ep9qi95k0nvy73tm766 FOREIGN KEY (patient) REFERENCES patient(id);


--
-- Name: subdistrict fk5get31ydhcm06wnxcd8sd9juj; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY subdistrict
    ADD CONSTRAINT fk5get31ydhcm06wnxcd8sd9juj FOREIGN KEY (province_id) REFERENCES province(id);


--
-- Name: matching fk5yqyvu0erqjwukbe4limuprtg; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY matching
    ADD CONSTRAINT fk5yqyvu0erqjwukbe4limuprtg FOREIGN KEY (patient_id) REFERENCES patient(id);


--
-- Name: patient fk67ap1d4l30rq7qt0a0wj3q09t; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY patient
    ADD CONSTRAINT fk67ap1d4l30rq7qt0a0wj3q09t FOREIGN KEY (sex_id) REFERENCES sex(id);


--
-- Name: matching fk80yxr7t9nxv8iq29qf81dvjll; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY matching
    ADD CONSTRAINT fk80yxr7t9nxv8iq29qf81dvjll FOREIGN KEY (caretaker_id) REFERENCES caretaker(id);


--
-- Name: patient fk8ena1rkb5kdlhqalyfxif5hk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY patient
    ADD CONSTRAINT fk8ena1rkb5kdlhqalyfxif5hk1 FOREIGN KEY (province_id) REFERENCES province(id);


--
-- Name: caretaker fk9irnnj71shxcf7ya3eeqi65qu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY caretaker
    ADD CONSTRAINT fk9irnnj71shxcf7ya3eeqi65qu FOREIGN KEY (district_id) REFERENCES district(id);


--
-- Name: caretaker fke962v0ekpu2wf2e0d9o3ycrw0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY caretaker
    ADD CONSTRAINT fke962v0ekpu2wf2e0d9o3ycrw0 FOREIGN KEY (sex_id) REFERENCES sex(id);


--
-- Name: question_evaluation fkgkvxdclc4h1l9nmn0xvldiqjo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY question_evaluation
    ADD CONSTRAINT fkgkvxdclc4h1l9nmn0xvldiqjo FOREIGN KEY (number_evaluation) REFERENCES number_evaluation(id);


--
-- Name: patient_test fkgpa40l7qv0pb7u275nrv8oiiu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY patient_test
    ADD CONSTRAINT fkgpa40l7qv0pb7u275nrv8oiiu FOREIGN KEY (question_evaluation_id) REFERENCES question_evaluation(id);


--
-- Name: answer_evaluation fkhe2ng24exi8e76b0noc9i7me8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY answer_evaluation
    ADD CONSTRAINT fkhe2ng24exi8e76b0noc9i7me8 FOREIGN KEY (question_evaluation_id) REFERENCES question_evaluation(id);


--
-- Name: caretaker fki7f8rhedlhcfwu3x3kb00n7mi; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY caretaker
    ADD CONSTRAINT fki7f8rhedlhcfwu3x3kb00n7mi FOREIGN KEY (province_id) REFERENCES province(id);


--
-- Name: patient fki8pkir4p2e1rliadcwht08n01; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY patient
    ADD CONSTRAINT fki8pkir4p2e1rliadcwht08n01 FOREIGN KEY (sub_district_id) REFERENCES subdistrict(id);


--
-- Name: patient fkj8tcgt32iya29rfi0fkju88yf; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY patient
    ADD CONSTRAINT fkj8tcgt32iya29rfi0fkju88yf FOREIGN KEY (district_id) REFERENCES district(id);


--
-- Name: history_evaluation_test fkjn4y2yhr6vd5lbtjpbotosla6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY history_evaluation_test
    ADD CONSTRAINT fkjn4y2yhr6vd5lbtjpbotosla6 FOREIGN KEY (evaluation_test_id) REFERENCES evaluation_test(id);


--
-- Name: subdistrict fkk489h4wxjre2y1vuxd57ax62f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY subdistrict
    ADD CONSTRAINT fkk489h4wxjre2y1vuxd57ax62f FOREIGN KEY (district_id) REFERENCES district(id);


--
-- Name: patient_test fknbpfssee5lfygpjiniu41ji53; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY patient_test
    ADD CONSTRAINT fknbpfssee5lfygpjiniu41ji53 FOREIGN KEY (answer_evaluation_id) REFERENCES answer_evaluation(id);


--
-- Name: caretaker fkqts512wvfa2osk19sqta70rtv; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY caretaker
    ADD CONSTRAINT fkqts512wvfa2osk19sqta70rtv FOREIGN KEY (sub_district_id) REFERENCES subdistrict(id);


--
-- Name: patient_test fktnboa0rcdfdwt5rwjay7lvp6s; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY patient_test
    ADD CONSTRAINT fktnboa0rcdfdwt5rwjay7lvp6s FOREIGN KEY (evaluation_test) REFERENCES evaluation_test(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

