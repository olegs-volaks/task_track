--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1 (Debian 16.1-1.pgdg120+1)
-- Dumped by pg_dump version 16.1 (Debian 16.1-1.pgdg120+1)

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

ALTER TABLE IF EXISTS ONLY public.tasks DROP CONSTRAINT IF EXISTS fk_rails_a362a150d3;
ALTER TABLE IF EXISTS ONLY public.tasks DROP CONSTRAINT IF EXISTS fk_rails_781b907909;
DROP INDEX IF EXISTS public.index_users_on_reset_password_token;
DROP INDEX IF EXISTS public.index_users_on_first_name_and_last_name;
DROP INDEX IF EXISTS public.index_users_on_email;
DROP INDEX IF EXISTS public.index_tasks_on_created_by_id;
DROP INDEX IF EXISTS public.index_tasks_on_assigned_to_id;
ALTER TABLE IF EXISTS ONLY public.users DROP CONSTRAINT IF EXISTS users_pkey;
ALTER TABLE IF EXISTS ONLY public.tasks DROP CONSTRAINT IF EXISTS tasks_pkey;
ALTER TABLE IF EXISTS ONLY public.schema_migrations DROP CONSTRAINT IF EXISTS schema_migrations_pkey;
ALTER TABLE IF EXISTS ONLY public.ar_internal_metadata DROP CONSTRAINT IF EXISTS ar_internal_metadata_pkey;
ALTER TABLE IF EXISTS public.users ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.tasks ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE IF EXISTS public.users_id_seq;
DROP TABLE IF EXISTS public.users;
DROP SEQUENCE IF EXISTS public.tasks_id_seq;
DROP TABLE IF EXISTS public.tasks;
DROP TABLE IF EXISTS public.schema_migrations;
DROP TABLE IF EXISTS public.ar_internal_metadata;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: task_track
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO task_track;

--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: task_track
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO task_track;

--
-- Name: tasks; Type: TABLE; Schema: public; Owner: task_track
--

CREATE TABLE public.tasks (
    id bigint NOT NULL,
    title character varying NOT NULL,
    description text,
    status character varying DEFAULT 'draft'::character varying NOT NULL,
    created_by_id bigint NOT NULL,
    assigned_to_id bigint NOT NULL,
    deadline timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.tasks OWNER TO task_track;

--
-- Name: tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: task_track
--

CREATE SEQUENCE public.tasks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tasks_id_seq OWNER TO task_track;

--
-- Name: tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: task_track
--

ALTER SEQUENCE public.tasks_id_seq OWNED BY public.tasks.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: task_track
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp(6) without time zone,
    remember_created_at timestamp(6) without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp(6) without time zone,
    last_sign_in_at timestamp(6) without time zone,
    current_sign_in_ip character varying,
    last_sign_in_ip character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    first_name character varying,
    last_name character varying
);


ALTER TABLE public.users OWNER TO task_track;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: task_track
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO task_track;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: task_track
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: tasks id; Type: DEFAULT; Schema: public; Owner: task_track
--

ALTER TABLE ONLY public.tasks ALTER COLUMN id SET DEFAULT nextval('public.tasks_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: task_track
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: task_track
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2024-04-23 00:16:25.087864	2024-04-23 00:16:25.087868
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: task_track
--

COPY public.schema_migrations (version) FROM stdin;
20240417192925
20240417194937
20240418221931
\.


--
-- Data for Name: tasks; Type: TABLE DATA; Schema: public; Owner: task_track
--

COPY public.tasks (id, title, description, status, created_by_id, assigned_to_id, deadline, created_at, updated_at) FROM stdin;
1	Prepare Budget	Improving our SEO can increase our online visibility.	completed	20	40	2024-05-24 00:34:42.458889	2024-04-23 00:34:42.626681	2024-04-23 00:34:42.626681
2	Prepare Budget	Understanding our competitors can help us position our product better.	in_progress	41	78	2024-04-30 00:34:42.633695	2024-04-23 00:34:42.639639	2024-04-23 00:34:42.639639
3	Test New Feature	This task involves a lot of creativity and an eye for design.	completed	99	64	2024-05-03 00:34:42.65384	2024-04-23 00:34:42.66542	2024-04-23 00:34:42.66542
4	Refactor Code	Refactoring code can improve its readability and efficiency.	pending	49	10	2024-06-05 00:34:42.675029	2024-04-23 00:34:42.683125	2024-04-23 00:34:42.683125
5	Train New Hires	Improving our SEO can increase our online visibility.	completed	63	75	2024-05-10 00:34:42.691235	2024-04-23 00:34:42.699003	2024-04-23 00:34:42.699003
6	Improve SEO	Regular team meetings can help us stay aligned and informed.	in_progress	44	11	2024-04-29 00:34:42.705819	2024-04-23 00:34:42.712783	2024-04-23 00:34:42.712783
7	Order Supplies	Before we release a new feature, it needs to be thoroughly tested.	completed	59	80	2024-04-30 00:34:42.720429	2024-04-23 00:34:42.727167	2024-04-23 00:34:42.727167
8	Clean Office	A compelling presentation can help us win over clients.	in_progress	65	71	2024-04-27 00:34:42.733449	2024-04-23 00:34:42.739617	2024-04-23 00:34:42.739617
9	Refactor Code	The sales report contains important information about our performance.	pending	26	97	2024-05-12 00:34:42.748438	2024-04-23 00:34:42.75744	2024-04-23 00:34:42.75744
10	Launch Product	Regular team meetings can help us stay aligned and informed.	completed	48	94	2024-05-02 00:34:42.764696	2024-04-23 00:34:42.777172	2024-04-23 00:34:42.777172
11	Prepare Budget	Fixing bugs is an ongoing task in software development.	completed	53	35	2024-06-10 00:34:42.785289	2024-04-23 00:34:42.793089	2024-04-23 00:34:42.793089
12	Analyze User Data	We need to plan a marketing campaign for the upcoming product launch.	draft	96	51	2024-06-17 00:34:42.801753	2024-04-23 00:34:42.810739	2024-04-23 00:34:42.810739
13	Launch Product	Preparing a budget helps us plan our finances better.	draft	4	34	2024-05-14 00:34:42.819558	2024-04-23 00:34:42.829029	2024-04-23 00:34:42.829029
14	Write Blog Post	Understanding our competitors can help us position our product better.	in_progress	98	36	2024-05-28 00:34:42.838049	2024-04-23 00:34:42.846042	2024-04-23 00:34:42.846042
15	Analyze User Data	Launching a new product is always exciting.	in_progress	42	46	2024-05-21 00:34:42.852247	2024-04-23 00:34:42.859334	2024-04-23 00:34:42.859334
16	Create Presentation	Training new hires is an important investment in our team.	completed	47	39	2024-06-10 00:34:42.866246	2024-04-23 00:34:42.87328	2024-04-23 00:34:42.87328
17	Review Sales Report	Launching a new product is always exciting.	completed	68	73	2024-06-20 00:34:42.881222	2024-04-23 00:34:42.887013	2024-04-23 00:34:42.887013
18	Organize Team Meeting	A compelling presentation can help us win over clients.	draft	41	92	2024-06-10 00:34:42.893201	2024-04-23 00:34:42.899367	2024-04-23 00:34:42.899367
19	Launch Product	Before we release a new feature, it needs to be thoroughly tested.	in_progress	80	48	2024-05-21 00:34:42.905841	2024-04-23 00:34:42.91361	2024-04-23 00:34:42.91361
20	Fix Bugs	Fixing bugs is an ongoing task in software development.	completed	68	5	2024-05-27 00:34:42.920809	2024-04-23 00:34:42.930651	2024-04-23 00:34:42.930651
21	Test New Feature	This task involves a lot of creativity and an eye for design.	in_progress	49	35	2024-05-26 00:34:42.937729	2024-04-23 00:34:42.945496	2024-04-23 00:34:42.945496
22	Order Supplies	A well-written blog post can attract a lot of traffic to our website.	draft	27	43	2024-06-10 00:34:42.957351	2024-04-23 00:34:42.965483	2024-04-23 00:34:42.965483
23	Improve SEO	Documenting our processes can help new team members get up to speed faster.	draft	55	94	2024-05-08 00:34:42.972297	2024-04-23 00:34:42.978936	2024-04-23 00:34:42.978936
24	Launch Product	We need to order supplies before we run out.	in_progress	4	7	2024-04-26 00:34:42.986319	2024-04-23 00:34:42.994414	2024-04-23 00:34:42.994414
25	Analyze User Data	Preparing a budget helps us plan our finances better.	in_progress	21	21	2024-05-10 00:34:43.002592	2024-04-23 00:34:43.019582	2024-04-23 00:34:43.019582
26	Train New Hires	A clean office is a productive office.	in_progress	63	44	2024-04-24 00:34:43.0287	2024-04-23 00:34:43.036918	2024-04-23 00:34:43.036918
27	Order Supplies	We need to order supplies before we run out.	in_progress	25	44	2024-05-05 00:34:43.044201	2024-04-23 00:34:43.051759	2024-04-23 00:34:43.051759
28	Train New Hires	The sales report contains important information about our performance.	completed	75	8	2024-06-20 00:34:43.05837	2024-04-23 00:34:43.065817	2024-04-23 00:34:43.065817
29	Fix Bugs	The website needs to be updated with the latest information about our products.	draft	60	76	2024-06-07 00:34:43.073436	2024-04-23 00:34:43.081311	2024-04-23 00:34:43.081311
30	Improve SEO	Improving our SEO can increase our online visibility.	completed	16	35	2024-05-05 00:34:43.089754	2024-04-23 00:34:43.097632	2024-04-23 00:34:43.097632
31	Organize Team Meeting	A clean office is a productive office.	pending	90	2	2024-06-18 00:34:43.104279	2024-04-23 00:34:43.111024	2024-04-23 00:34:43.111024
32	Launch Product	We need to order supplies before we run out.	draft	96	3	2024-05-20 00:34:43.118232	2024-04-23 00:34:43.125425	2024-04-23 00:34:43.125425
33	Clean Office	The sales report contains important information about our performance.	pending	26	98	2024-06-06 00:34:43.131721	2024-04-23 00:34:43.13888	2024-04-23 00:34:43.13888
34	Clean Office	Fixing bugs is an ongoing task in software development.	draft	78	13	2024-05-15 00:34:43.145205	2024-04-23 00:34:43.151971	2024-04-23 00:34:43.151971
35	Launch Product	Conducting a survey can give us valuable insights from our users.	draft	84	41	2024-04-24 00:34:43.162877	2024-04-23 00:34:43.171822	2024-04-23 00:34:43.171822
36	Fix Bugs	Conducting a survey can give us valuable insights from our users.	completed	63	44	2024-05-19 00:34:43.178351	2024-04-23 00:34:43.1858	2024-04-23 00:34:43.1858
37	Create Presentation	Regular team meetings can help us stay aligned and informed.	pending	69	52	2024-04-30 00:34:43.192104	2024-04-23 00:34:43.198264	2024-04-23 00:34:43.198264
38	Launch Product	We need to plan a marketing campaign for the upcoming product launch.	in_progress	21	67	2024-05-18 00:34:43.205004	2024-04-23 00:34:43.21268	2024-04-23 00:34:43.21268
39	Write Blog Post	The website needs to be updated with the latest information about our products.	in_progress	77	11	2024-06-15 00:34:43.218815	2024-04-23 00:34:43.224982	2024-04-23 00:34:43.224982
40	Refactor Code	Improving our SEO can increase our online visibility.	completed	45	94	2024-06-17 00:34:43.231245	2024-04-23 00:34:43.236401	2024-04-23 00:34:43.236401
41	Design New Logo	Regular team meetings can help us stay aligned and informed.	in_progress	90	40	2024-05-14 00:34:43.241866	2024-04-23 00:34:43.247616	2024-04-23 00:34:43.247616
42	Clean Office	Improving our SEO can increase our online visibility.	draft	96	29	2024-06-09 00:34:43.252816	2024-04-23 00:34:43.263805	2024-04-23 00:34:43.263805
43	Fix Bugs	A well-written blog post can attract a lot of traffic to our website.	completed	92	74	2024-04-27 00:34:43.271064	2024-04-23 00:34:43.277995	2024-04-23 00:34:43.277995
44	Order Supplies	Conducting a survey can give us valuable insights from our users.	draft	12	68	2024-05-10 00:34:43.285695	2024-04-23 00:34:43.292876	2024-04-23 00:34:43.292876
45	Train New Hires	Regular team meetings can help us stay aligned and informed.	in_progress	11	85	2024-06-14 00:34:43.30045	2024-04-23 00:34:43.307451	2024-04-23 00:34:43.307451
46	Prepare Budget	This task involves a lot of creativity and an eye for design.	completed	51	76	2024-05-08 00:34:43.314086	2024-04-23 00:34:43.320617	2024-04-23 00:34:43.320617
47	Improve SEO	The website needs to be updated with the latest information about our products.	completed	27	38	2024-06-09 00:34:43.32719	2024-04-23 00:34:43.333246	2024-04-23 00:34:43.333246
48	Write Blog Post	Documenting our processes can help new team members get up to speed faster.	in_progress	96	24	2024-05-01 00:34:43.340137	2024-04-23 00:34:43.346372	2024-04-23 00:34:43.346372
49	Clean Office	We need to order supplies before we run out.	completed	1	2	2024-05-01 00:34:43.35269	2024-04-23 00:34:43.362102	2024-04-23 00:34:43.362102
50	Conduct Survey	A compelling presentation can help us win over clients.	pending	25	42	2024-06-12 00:34:43.370152	2024-04-23 00:34:43.378484	2024-04-23 00:34:43.378484
51	Prepare Budget	A well-written blog post can attract a lot of traffic to our website.	in_progress	91	3	2024-05-21 00:34:43.385667	2024-04-23 00:34:43.395176	2024-04-23 00:34:43.395176
52	Review Sales Report	Understanding our competitors can help us position our product better.	draft	54	65	2024-06-04 00:34:43.401931	2024-04-23 00:34:43.416664	2024-04-23 00:34:43.416664
53	Document Process	Training new hires is an important investment in our team.	draft	74	82	2024-05-04 00:34:43.42325	2024-04-23 00:34:43.429992	2024-04-23 00:34:43.429992
54	Refactor Code	Improving our SEO can increase our online visibility.	completed	62	4	2024-06-05 00:34:43.435971	2024-04-23 00:34:43.441948	2024-04-23 00:34:43.441948
55	Research Competitors	Fixing bugs is an ongoing task in software development.	pending	45	69	2024-06-20 00:34:43.447658	2024-04-23 00:34:43.453284	2024-04-23 00:34:43.453284
56	Document Process	Documenting our processes can help new team members get up to speed faster.	in_progress	85	57	2024-05-23 00:34:43.461576	2024-04-23 00:34:43.469931	2024-04-23 00:34:43.469931
57	Plan Marketing Campaign	Conducting a survey can give us valuable insights from our users.	draft	4	21	2024-05-09 00:34:43.479676	2024-04-23 00:34:43.484846	2024-04-23 00:34:43.484846
58	Prepare Budget	Regular team meetings can help us stay aligned and informed.	draft	5	98	2024-04-25 00:34:43.490493	2024-04-23 00:34:43.495965	2024-04-23 00:34:43.495965
59	Improve SEO	The website needs to be updated with the latest information about our products.	in_progress	45	3	2024-06-16 00:34:43.501447	2024-04-23 00:34:43.506482	2024-04-23 00:34:43.506482
60	Create Presentation	The website needs to be updated with the latest information about our products.	in_progress	13	22	2024-04-30 00:34:43.512275	2024-04-23 00:34:43.518329	2024-04-23 00:34:43.518329
61	Test New Feature	This task involves a lot of creativity and an eye for design.	draft	13	57	2024-05-27 00:34:43.524651	2024-04-23 00:34:43.532056	2024-04-23 00:34:43.532056
62	Test New Feature	Before we release a new feature, it needs to be thoroughly tested.	pending	34	34	2024-05-02 00:34:43.538186	2024-04-23 00:34:43.543936	2024-04-23 00:34:43.543936
63	Plan Marketing Campaign	Understanding our competitors can help us position our product better.	pending	97	6	2024-06-21 00:34:43.550261	2024-04-23 00:34:43.562968	2024-04-23 00:34:43.562968
64	Conduct Survey	The website needs to be updated with the latest information about our products.	in_progress	21	78	2024-05-06 00:34:43.572588	2024-04-23 00:34:43.581296	2024-04-23 00:34:43.581296
65	Document Process	The sales report contains important information about our performance.	in_progress	66	33	2024-04-26 00:34:43.587197	2024-04-23 00:34:43.592667	2024-04-23 00:34:43.592667
66	Write Blog Post	Fixing bugs is an ongoing task in software development.	draft	70	63	2024-04-26 00:34:43.598612	2024-04-23 00:34:43.603855	2024-04-23 00:34:43.603855
67	Clean Office	Training new hires is an important investment in our team.	completed	78	91	2024-06-12 00:34:43.609924	2024-04-23 00:34:43.615723	2024-04-23 00:34:43.615723
68	Improve SEO	Fixing bugs is an ongoing task in software development.	pending	9	5	2024-05-22 00:34:43.622115	2024-04-23 00:34:43.627367	2024-04-23 00:34:43.627367
69	Improve SEO	Before we release a new feature, it needs to be thoroughly tested.	completed	14	35	2024-05-20 00:34:43.632952	2024-04-23 00:34:43.638013	2024-04-23 00:34:43.638013
70	Refactor Code	This task involves a lot of creativity and an eye for design.	draft	60	15	2024-05-08 00:34:43.643366	2024-04-23 00:34:43.650034	2024-04-23 00:34:43.650034
71	Research Competitors	Conducting a survey can give us valuable insights from our users.	pending	48	48	2024-04-26 00:34:43.657393	2024-04-23 00:34:43.667744	2024-04-23 00:34:43.667744
72	Organize Team Meeting	This task involves a lot of creativity and an eye for design.	completed	39	47	2024-05-13 00:34:43.6747	2024-04-23 00:34:43.680536	2024-04-23 00:34:43.680536
73	Plan Marketing Campaign	Analyzing user data can inform our product development decisions.	completed	67	99	2024-05-29 00:34:43.688465	2024-04-23 00:34:43.693379	2024-04-23 00:34:43.693379
74	Plan Marketing Campaign	Analyzing user data can inform our product development decisions.	completed	58	84	2024-05-28 00:34:43.699098	2024-04-23 00:34:43.7039	2024-04-23 00:34:43.7039
75	Analyze User Data	Refactoring code can improve its readability and efficiency.	draft	39	44	2024-05-03 00:34:43.709813	2024-04-23 00:34:43.715219	2024-04-23 00:34:43.715219
76	Review Sales Report	A well-written blog post can attract a lot of traffic to our website.	in_progress	17	32	2024-05-19 00:34:43.721166	2024-04-23 00:34:43.726563	2024-04-23 00:34:43.726563
77	Plan Marketing Campaign	This task involves a lot of creativity and an eye for design.	draft	9	32	2024-05-05 00:34:43.732402	2024-04-23 00:34:43.738456	2024-04-23 00:34:43.738456
78	Order Supplies	Analyzing user data can inform our product development decisions.	in_progress	39	70	2024-06-11 00:34:43.744033	2024-04-23 00:34:43.749608	2024-04-23 00:34:43.749608
79	Test New Feature	A compelling presentation can help us win over clients.	pending	25	66	2024-05-18 00:34:43.756937	2024-04-23 00:34:43.767809	2024-04-23 00:34:43.767809
80	Document Process	We need to order supplies before we run out.	in_progress	57	56	2024-05-21 00:34:43.775043	2024-04-23 00:34:43.782198	2024-04-23 00:34:43.782198
81	Improve SEO	This task involves a lot of creativity and an eye for design.	draft	43	90	2024-06-15 00:34:43.792569	2024-04-23 00:34:43.80101	2024-04-23 00:34:43.80101
82	Train New Hires	Preparing a budget helps us plan our finances better.	completed	51	13	2024-06-16 00:34:43.807651	2024-04-23 00:34:43.814246	2024-04-23 00:34:43.814246
83	Train New Hires	We need to order supplies before we run out.	draft	34	93	2024-05-17 00:34:43.820174	2024-04-23 00:34:43.826695	2024-04-23 00:34:43.826695
84	Refactor Code	Training new hires is an important investment in our team.	in_progress	80	83	2024-04-26 00:34:43.832703	2024-04-23 00:34:43.838854	2024-04-23 00:34:43.838854
85	Test New Feature	We need to order supplies before we run out.	pending	35	93	2024-05-07 00:34:43.844701	2024-04-23 00:34:43.850696	2024-04-23 00:34:43.850696
86	Conduct Survey	A compelling presentation can help us win over clients.	draft	53	16	2024-06-09 00:34:43.857279	2024-04-23 00:34:43.86689	2024-04-23 00:34:43.86689
87	Review Sales Report	We need to plan a marketing campaign for the upcoming product launch.	completed	75	16	2024-04-26 00:34:43.875107	2024-04-23 00:34:43.88048	2024-04-23 00:34:43.88048
88	Order Supplies	Conducting a survey can give us valuable insights from our users.	completed	74	31	2024-05-27 00:34:43.891089	2024-04-23 00:34:43.903799	2024-04-23 00:34:43.903799
89	Write Blog Post	The website needs to be updated with the latest information about our products.	in_progress	52	67	2024-05-19 00:34:43.90919	2024-04-23 00:34:43.914001	2024-04-23 00:34:43.914001
90	Plan Marketing Campaign	A compelling presentation can help us win over clients.	pending	5	41	2024-06-04 00:34:43.919494	2024-04-23 00:34:43.924477	2024-04-23 00:34:43.924477
91	Plan Marketing Campaign	The website needs to be updated with the latest information about our products.	in_progress	67	94	2024-04-27 00:34:43.930612	2024-04-23 00:34:43.936523	2024-04-23 00:34:43.936523
92	Prepare Budget	A well-written blog post can attract a lot of traffic to our website.	in_progress	99	39	2024-04-30 00:34:43.942502	2024-04-23 00:34:43.948133	2024-04-23 00:34:43.948133
93	Fix Bugs	We need to plan a marketing campaign for the upcoming product launch.	in_progress	92	99	2024-05-17 00:34:43.955068	2024-04-23 00:34:43.963444	2024-04-23 00:34:43.963444
94	Organize Team Meeting	A well-written blog post can attract a lot of traffic to our website.	draft	43	46	2024-05-20 00:34:43.972297	2024-04-23 00:34:43.979657	2024-04-23 00:34:43.979657
95	Refactor Code	Understanding our competitors can help us position our product better.	pending	33	99	2024-06-09 00:34:43.986939	2024-04-23 00:34:43.994108	2024-04-23 00:34:43.994108
96	Clean Office	Preparing a budget helps us plan our finances better.	draft	62	13	2024-05-18 00:34:44.001141	2024-04-23 00:34:44.007958	2024-04-23 00:34:44.007958
97	Update Website	Regular team meetings can help us stay aligned and informed.	pending	60	69	2024-05-24 00:34:44.015469	2024-04-23 00:34:44.022157	2024-04-23 00:34:44.022157
98	Test New Feature	Regular team meetings can help us stay aligned and informed.	draft	9	91	2024-05-04 00:34:44.028949	2024-04-23 00:34:44.03524	2024-04-23 00:34:44.03524
99	Clean Office	The sales report contains important information about our performance.	pending	98	69	2024-06-22 00:34:44.041411	2024-04-23 00:34:44.047656	2024-04-23 00:34:44.047656
100	Organize Team Meeting	Conducting a survey can give us valuable insights from our users.	pending	27	25	2024-06-15 00:34:44.053597	2024-04-23 00:34:44.060003	2024-04-23 00:34:44.060003
101	Improve SEO	Analyzing user data can inform our product development decisions.	completed	4	36	2024-06-02 00:34:44.065283	2024-04-23 00:34:44.069768	2024-04-23 00:34:44.069768
102	Fix Bugs	A compelling presentation can help us win over clients.	completed	82	71	2024-05-03 00:34:44.084383	2024-04-23 00:34:44.137557	2024-04-23 00:34:44.137557
103	Create Presentation	A clean office is a productive office.	completed	75	2	2024-05-15 00:34:44.161469	2024-04-23 00:34:44.174207	2024-04-23 00:34:44.174207
104	Create Presentation	Refactoring code can improve its readability and efficiency.	pending	90	57	2024-05-05 00:34:44.180311	2024-04-23 00:34:44.186309	2024-04-23 00:34:44.186309
105	Review Sales Report	Understanding our competitors can help us position our product better.	in_progress	32	69	2024-06-13 00:34:44.192297	2024-04-23 00:34:44.198425	2024-04-23 00:34:44.198425
106	Clean Office	The website needs to be updated with the latest information about our products.	in_progress	100	12	2024-05-03 00:34:44.20629	2024-04-23 00:34:44.21168	2024-04-23 00:34:44.21168
107	Conduct Survey	The website needs to be updated with the latest information about our products.	draft	44	68	2024-05-08 00:34:44.21726	2024-04-23 00:34:44.2223	2024-04-23 00:34:44.2223
108	Review Sales Report	Conducting a survey can give us valuable insights from our users.	pending	88	25	2024-04-26 00:34:44.228457	2024-04-23 00:34:44.233962	2024-04-23 00:34:44.233962
109	Design New Logo	Before we release a new feature, it needs to be thoroughly tested.	in_progress	63	46	2024-05-28 00:34:44.239288	2024-04-23 00:34:44.244241	2024-04-23 00:34:44.244241
110	Analyze User Data	A well-written blog post can attract a lot of traffic to our website.	pending	51	47	2024-04-24 00:34:44.249636	2024-04-23 00:34:44.256906	2024-04-23 00:34:44.256906
111	Train New Hires	Conducting a survey can give us valuable insights from our users.	in_progress	66	92	2024-05-31 00:34:44.262281	2024-04-23 00:34:44.266953	2024-04-23 00:34:44.266953
112	Conduct Survey	Documenting our processes can help new team members get up to speed faster.	in_progress	12	1	2024-05-11 00:34:44.272171	2024-04-23 00:34:44.277023	2024-04-23 00:34:44.277023
113	Plan Marketing Campaign	Conducting a survey can give us valuable insights from our users.	in_progress	73	27	2024-06-12 00:34:44.282476	2024-04-23 00:34:44.287342	2024-04-23 00:34:44.287342
114	Write Blog Post	This task involves a lot of creativity and an eye for design.	draft	19	28	2024-04-29 00:34:44.292418	2024-04-23 00:34:44.296741	2024-04-23 00:34:44.296741
115	Improve SEO	The website needs to be updated with the latest information about our products.	pending	88	65	2024-04-27 00:34:44.301761	2024-04-23 00:34:44.306567	2024-04-23 00:34:44.306567
116	Order Supplies	The website needs to be updated with the latest information about our products.	draft	39	68	2024-05-09 00:34:44.311438	2024-04-23 00:34:44.315859	2024-04-23 00:34:44.315859
117	Plan Marketing Campaign	The website needs to be updated with the latest information about our products.	in_progress	76	17	2024-06-21 00:34:44.320988	2024-04-23 00:34:44.326578	2024-04-23 00:34:44.326578
118	Improve SEO	A well-written blog post can attract a lot of traffic to our website.	pending	68	35	2024-04-26 00:34:44.332463	2024-04-23 00:34:44.3382	2024-04-23 00:34:44.3382
119	Update Website	This task involves a lot of creativity and an eye for design.	draft	2	9	2024-05-24 00:34:44.344337	2024-04-23 00:34:44.350358	2024-04-23 00:34:44.350358
120	Review Sales Report	Improving our SEO can increase our online visibility.	in_progress	17	3	2024-06-11 00:34:44.357721	2024-04-23 00:34:44.368328	2024-04-23 00:34:44.368328
121	Design New Logo	Launching a new product is always exciting.	draft	61	85	2024-06-14 00:34:44.375771	2024-04-23 00:34:44.382255	2024-04-23 00:34:44.382255
122	Refactor Code	Conducting a survey can give us valuable insights from our users.	in_progress	32	97	2024-05-07 00:34:44.388863	2024-04-23 00:34:44.394903	2024-04-23 00:34:44.394903
123	Launch Product	This task involves a lot of creativity and an eye for design.	in_progress	12	22	2024-06-01 00:34:44.401745	2024-04-23 00:34:44.408685	2024-04-23 00:34:44.408685
124	Design New Logo	A clean office is a productive office.	completed	34	18	2024-06-22 00:34:44.415161	2024-04-23 00:34:44.421565	2024-04-23 00:34:44.421565
125	Research Competitors	A compelling presentation can help us win over clients.	draft	44	31	2024-06-19 00:34:44.428254	2024-04-23 00:34:44.434483	2024-04-23 00:34:44.434483
126	Conduct Survey	Understanding our competitors can help us position our product better.	draft	77	69	2024-05-28 00:34:44.440981	2024-04-23 00:34:44.44691	2024-04-23 00:34:44.44691
127	Test New Feature	A well-written blog post can attract a lot of traffic to our website.	in_progress	79	47	2024-05-19 00:34:44.453618	2024-04-23 00:34:44.462981	2024-04-23 00:34:44.462981
128	Write Blog Post	Fixing bugs is an ongoing task in software development.	pending	42	52	2024-06-19 00:34:44.47048	2024-04-23 00:34:44.476501	2024-04-23 00:34:44.476501
129	Write Blog Post	Preparing a budget helps us plan our finances better.	draft	44	84	2024-05-27 00:34:44.482013	2024-04-23 00:34:44.486721	2024-04-23 00:34:44.486721
130	Improve SEO	Analyzing user data can inform our product development decisions.	completed	38	2	2024-05-27 00:34:44.491798	2024-04-23 00:34:44.496437	2024-04-23 00:34:44.496437
131	Fix Bugs	Training new hires is an important investment in our team.	completed	62	23	2024-05-10 00:34:44.501486	2024-04-23 00:34:44.506005	2024-04-23 00:34:44.506005
132	Improve SEO	Refactoring code can improve its readability and efficiency.	in_progress	25	77	2024-05-28 00:34:44.51105	2024-04-23 00:34:44.515833	2024-04-23 00:34:44.515833
133	Create Presentation	The website needs to be updated with the latest information about our products.	pending	80	96	2024-05-18 00:34:44.521055	2024-04-23 00:34:44.525524	2024-04-23 00:34:44.525524
134	Research Competitors	The sales report contains important information about our performance.	draft	10	52	2024-05-25 00:34:44.530627	2024-04-23 00:34:44.534983	2024-04-23 00:34:44.534983
135	Launch Product	The sales report contains important information about our performance.	in_progress	82	16	2024-05-15 00:34:44.540038	2024-04-23 00:34:44.54446	2024-04-23 00:34:44.54446
136	Update Website	Understanding our competitors can help us position our product better.	draft	50	40	2024-05-13 00:34:44.549297	2024-04-23 00:34:44.553962	2024-04-23 00:34:44.553962
137	Plan Marketing Campaign	Training new hires is an important investment in our team.	in_progress	6	2	2024-05-06 00:34:44.559062	2024-04-23 00:34:44.563829	2024-04-23 00:34:44.563829
138	Update Website	Preparing a budget helps us plan our finances better.	draft	75	27	2024-06-11 00:34:44.569168	2024-04-23 00:34:44.575491	2024-04-23 00:34:44.575491
139	Analyze User Data	Fixing bugs is an ongoing task in software development.	pending	38	9	2024-06-11 00:34:44.580851	2024-04-23 00:34:44.585617	2024-04-23 00:34:44.585617
140	Create Presentation	We need to plan a marketing campaign for the upcoming product launch.	pending	80	75	2024-05-10 00:34:44.591179	2024-04-23 00:34:44.598192	2024-04-23 00:34:44.598192
141	Review Sales Report	Fixing bugs is an ongoing task in software development.	draft	80	28	2024-04-24 00:34:44.60358	2024-04-23 00:34:44.608996	2024-04-23 00:34:44.608996
142	Document Process	Conducting a survey can give us valuable insights from our users.	in_progress	32	22	2024-05-22 00:34:44.614899	2024-04-23 00:34:44.620267	2024-04-23 00:34:44.620267
143	Fix Bugs	The website needs to be updated with the latest information about our products.	pending	20	9	2024-05-19 00:34:44.625901	2024-04-23 00:34:44.632047	2024-04-23 00:34:44.632047
144	Conduct Survey	The sales report contains important information about our performance.	completed	26	61	2024-06-22 00:34:44.637906	2024-04-23 00:34:44.643335	2024-04-23 00:34:44.643335
145	Prepare Budget	Preparing a budget helps us plan our finances better.	completed	8	75	2024-05-23 00:34:44.651307	2024-04-23 00:34:44.658961	2024-04-23 00:34:44.658961
146	Plan Marketing Campaign	Understanding our competitors can help us position our product better.	in_progress	47	26	2024-05-30 00:34:44.668006	2024-04-23 00:34:44.677822	2024-04-23 00:34:44.677822
147	Design New Logo	We need to plan a marketing campaign for the upcoming product launch.	completed	41	99	2024-06-09 00:34:44.684004	2024-04-23 00:34:44.69032	2024-04-23 00:34:44.69032
148	Order Supplies	We need to order supplies before we run out.	draft	2	92	2024-04-25 00:34:44.696755	2024-04-23 00:34:44.70232	2024-04-23 00:34:44.70232
149	Review Sales Report	Understanding our competitors can help us position our product better.	in_progress	5	95	2024-04-28 00:34:44.707495	2024-04-23 00:34:44.711825	2024-04-23 00:34:44.711825
150	Train New Hires	Understanding our competitors can help us position our product better.	draft	57	51	2024-06-11 00:34:44.717381	2024-04-23 00:34:44.722382	2024-04-23 00:34:44.722382
151	Order Supplies	Preparing a budget helps us plan our finances better.	pending	15	70	2024-05-10 00:34:44.72754	2024-04-23 00:34:44.732116	2024-04-23 00:34:44.732116
152	Update Website	We need to plan a marketing campaign for the upcoming product launch.	in_progress	17	62	2024-05-02 00:34:44.737449	2024-04-23 00:34:44.742102	2024-04-23 00:34:44.742102
153	Train New Hires	This task involves a lot of creativity and an eye for design.	in_progress	69	13	2024-04-25 00:34:44.747331	2024-04-23 00:34:44.752277	2024-04-23 00:34:44.752277
154	Analyze User Data	Improving our SEO can increase our online visibility.	in_progress	91	78	2024-06-12 00:34:44.7598	2024-04-23 00:34:44.770092	2024-04-23 00:34:44.770092
155	Organize Team Meeting	Documenting our processes can help new team members get up to speed faster.	draft	94	100	2024-04-25 00:34:44.776719	2024-04-23 00:34:44.781364	2024-04-23 00:34:44.781364
156	Design New Logo	Regular team meetings can help us stay aligned and informed.	in_progress	88	67	2024-06-12 00:34:44.786491	2024-04-23 00:34:44.791363	2024-04-23 00:34:44.791363
157	Analyze User Data	Launching a new product is always exciting.	completed	85	19	2024-06-10 00:34:44.796621	2024-04-23 00:34:44.801691	2024-04-23 00:34:44.801691
158	Design New Logo	Refactoring code can improve its readability and efficiency.	draft	38	40	2024-04-24 00:34:44.807534	2024-04-23 00:34:44.814267	2024-04-23 00:34:44.814267
159	Create Presentation	The sales report contains important information about our performance.	in_progress	74	77	2024-05-24 00:34:44.820839	2024-04-23 00:34:44.826999	2024-04-23 00:34:44.826999
160	Order Supplies	A clean office is a productive office.	draft	48	55	2024-06-21 00:34:44.833309	2024-04-23 00:34:44.84337	2024-04-23 00:34:44.84337
161	Research Competitors	Before we release a new feature, it needs to be thoroughly tested.	completed	66	48	2024-05-11 00:34:44.849092	2024-04-23 00:34:44.855275	2024-04-23 00:34:44.855275
162	Launch Product	Regular team meetings can help us stay aligned and informed.	in_progress	35	12	2024-05-29 00:34:44.864304	2024-04-23 00:34:44.87544	2024-04-23 00:34:44.87544
163	Create Presentation	Analyzing user data can inform our product development decisions.	pending	84	24	2024-06-14 00:34:44.881663	2024-04-23 00:34:44.887542	2024-04-23 00:34:44.887542
164	Create Presentation	The website needs to be updated with the latest information about our products.	pending	87	84	2024-05-12 00:34:44.893317	2024-04-23 00:34:44.898606	2024-04-23 00:34:44.898606
165	Plan Marketing Campaign	This task involves a lot of creativity and an eye for design.	pending	34	89	2024-05-25 00:34:44.915409	2024-04-23 00:34:44.950522	2024-04-23 00:34:44.950522
166	Order Supplies	A compelling presentation can help us win over clients.	in_progress	36	75	2024-05-08 00:34:44.956813	2024-04-23 00:34:44.962287	2024-04-23 00:34:44.962287
167	Train New Hires	We need to plan a marketing campaign for the upcoming product launch.	draft	5	94	2024-05-04 00:34:44.967521	2024-04-23 00:34:44.972147	2024-04-23 00:34:44.972147
168	Improve SEO	A well-written blog post can attract a lot of traffic to our website.	pending	52	93	2024-05-15 00:34:44.977184	2024-04-23 00:34:44.981842	2024-04-23 00:34:44.981842
169	Prepare Budget	Conducting a survey can give us valuable insights from our users.	completed	34	20	2024-05-14 00:34:44.98684	2024-04-23 00:34:44.992468	2024-04-23 00:34:44.992468
170	Research Competitors	We need to order supplies before we run out.	pending	71	53	2024-05-07 00:34:44.997583	2024-04-23 00:34:45.001966	2024-04-23 00:34:45.001966
171	Prepare Budget	Regular team meetings can help us stay aligned and informed.	pending	91	83	2024-05-09 00:34:45.007148	2024-04-23 00:34:45.012725	2024-04-23 00:34:45.012725
172	Launch Product	A clean office is a productive office.	in_progress	81	83	2024-05-30 00:34:45.018645	2024-04-23 00:34:45.025095	2024-04-23 00:34:45.025095
173	Organize Team Meeting	Fixing bugs is an ongoing task in software development.	draft	34	51	2024-06-03 00:34:45.031404	2024-04-23 00:34:45.037293	2024-04-23 00:34:45.037293
174	Document Process	Documenting our processes can help new team members get up to speed faster.	draft	17	36	2024-05-24 00:34:45.043611	2024-04-23 00:34:45.049375	2024-04-23 00:34:45.049375
175	Clean Office	Improving our SEO can increase our online visibility.	draft	18	84	2024-05-03 00:34:45.055231	2024-04-23 00:34:45.063948	2024-04-23 00:34:45.063948
176	Improve SEO	Improving our SEO can increase our online visibility.	in_progress	31	55	2024-04-30 00:34:45.069774	2024-04-23 00:34:45.07537	2024-04-23 00:34:45.07537
177	Organize Team Meeting	Regular team meetings can help us stay aligned and informed.	pending	98	1	2024-04-29 00:34:45.081231	2024-04-23 00:34:45.086704	2024-04-23 00:34:45.086704
178	Analyze User Data	Improving our SEO can increase our online visibility.	completed	6	92	2024-05-30 00:34:45.092564	2024-04-23 00:34:45.097938	2024-04-23 00:34:45.097938
179	Plan Marketing Campaign	This task involves a lot of creativity and an eye for design.	in_progress	60	55	2024-05-04 00:34:45.103695	2024-04-23 00:34:45.109294	2024-04-23 00:34:45.109294
180	Document Process	Refactoring code can improve its readability and efficiency.	draft	89	77	2024-05-03 00:34:45.114851	2024-04-23 00:34:45.120181	2024-04-23 00:34:45.120181
181	Clean Office	A compelling presentation can help us win over clients.	completed	28	100	2024-04-25 00:34:45.125571	2024-04-23 00:34:45.130127	2024-04-23 00:34:45.130127
182	Document Process	Preparing a budget helps us plan our finances better.	pending	17	43	2024-06-17 00:34:45.135319	2024-04-23 00:34:45.139694	2024-04-23 00:34:45.139694
183	Order Supplies	A clean office is a productive office.	draft	23	65	2024-06-11 00:34:45.144905	2024-04-23 00:34:45.149268	2024-04-23 00:34:45.149268
184	Test New Feature	We need to order supplies before we run out.	draft	28	7	2024-06-09 00:34:45.154645	2024-04-23 00:34:45.159617	2024-04-23 00:34:45.159617
185	Test New Feature	A compelling presentation can help us win over clients.	draft	9	12	2024-05-13 00:34:45.164811	2024-04-23 00:34:45.169385	2024-04-23 00:34:45.169385
186	Prepare Budget	Training new hires is an important investment in our team.	completed	58	46	2024-06-11 00:34:45.174495	2024-04-23 00:34:45.179358	2024-04-23 00:34:45.179358
187	Organize Team Meeting	Preparing a budget helps us plan our finances better.	in_progress	68	64	2024-05-24 00:34:45.185619	2024-04-23 00:34:45.191097	2024-04-23 00:34:45.191097
188	Refactor Code	Understanding our competitors can help us position our product better.	completed	60	26	2024-04-28 00:34:45.196576	2024-04-23 00:34:45.201225	2024-04-23 00:34:45.201225
189	Conduct Survey	Fixing bugs is an ongoing task in software development.	draft	67	66	2024-06-19 00:34:45.206503	2024-04-23 00:34:45.214232	2024-04-23 00:34:45.214232
190	Document Process	Before we release a new feature, it needs to be thoroughly tested.	in_progress	26	7	2024-05-25 00:34:45.219508	2024-04-23 00:34:45.22415	2024-04-23 00:34:45.22415
191	Conduct Survey	Preparing a budget helps us plan our finances better.	in_progress	30	67	2024-05-11 00:34:45.230028	2024-04-23 00:34:45.235349	2024-04-23 00:34:45.235349
192	Train New Hires	Fixing bugs is an ongoing task in software development.	draft	34	66	2024-05-30 00:34:45.241177	2024-04-23 00:34:45.246671	2024-04-23 00:34:45.246671
193	Test New Feature	Conducting a survey can give us valuable insights from our users.	draft	6	81	2024-05-16 00:34:45.25214	2024-04-23 00:34:45.258987	2024-04-23 00:34:45.258987
194	Conduct Survey	A well-written blog post can attract a lot of traffic to our website.	pending	91	48	2024-05-22 00:34:45.264577	2024-04-23 00:34:45.270139	2024-04-23 00:34:45.270139
195	Conduct Survey	Launching a new product is always exciting.	draft	76	92	2024-06-06 00:34:45.276169	2024-04-23 00:34:45.282654	2024-04-23 00:34:45.282654
196	Update Website	Regular team meetings can help us stay aligned and informed.	pending	34	99	2024-05-28 00:34:45.288414	2024-04-23 00:34:45.293603	2024-04-23 00:34:45.293603
197	Fix Bugs	A compelling presentation can help us win over clients.	draft	71	43	2024-06-22 00:34:45.299237	2024-04-23 00:34:45.304433	2024-04-23 00:34:45.304433
198	Design New Logo	Fixing bugs is an ongoing task in software development.	completed	66	12	2024-06-05 00:34:45.310786	2024-04-23 00:34:45.316842	2024-04-23 00:34:45.316842
199	Analyze User Data	Regular team meetings can help us stay aligned and informed.	completed	38	48	2024-05-03 00:34:45.322815	2024-04-23 00:34:45.329874	2024-04-23 00:34:45.329874
200	Prepare Budget	Analyzing user data can inform our product development decisions.	pending	97	78	2024-06-20 00:34:45.335517	2024-04-23 00:34:45.34052	2024-04-23 00:34:45.34052
201	Document Process	Preparing a budget helps us plan our finances better.	in_progress	53	100	2024-06-20 00:34:45.345993	2024-04-23 00:34:45.351108	2024-04-23 00:34:45.351108
202	Organize Team Meeting	Improving our SEO can increase our online visibility.	draft	67	15	2024-04-27 00:34:45.356956	2024-04-23 00:34:45.36616	2024-04-23 00:34:45.36616
203	Review Sales Report	Launching a new product is always exciting.	completed	31	6	2024-04-26 00:34:45.371669	2024-04-23 00:34:45.376199	2024-04-23 00:34:45.376199
204	Test New Feature	Improving our SEO can increase our online visibility.	draft	97	3	2024-04-29 00:34:45.381463	2024-04-23 00:34:45.386031	2024-04-23 00:34:45.386031
205	Analyze User Data	Analyzing user data can inform our product development decisions.	completed	41	44	2024-06-10 00:34:45.390987	2024-04-23 00:34:45.395558	2024-04-23 00:34:45.395558
206	Analyze User Data	Refactoring code can improve its readability and efficiency.	draft	25	15	2024-04-29 00:34:45.400583	2024-04-23 00:34:45.405373	2024-04-23 00:34:45.405373
207	Train New Hires	A compelling presentation can help us win over clients.	pending	16	34	2024-06-21 00:34:45.410497	2024-04-23 00:34:45.41509	2024-04-23 00:34:45.41509
208	Improve SEO	Regular team meetings can help us stay aligned and informed.	pending	84	22	2024-06-02 00:34:45.42019	2024-04-23 00:34:45.4243	2024-04-23 00:34:45.4243
209	Order Supplies	We need to plan a marketing campaign for the upcoming product launch.	pending	95	36	2024-05-26 00:34:45.430636	2024-04-23 00:34:45.436687	2024-04-23 00:34:45.436687
210	Conduct Survey	A compelling presentation can help us win over clients.	in_progress	92	70	2024-05-17 00:34:45.442068	2024-04-23 00:34:45.447728	2024-04-23 00:34:45.447728
211	Organize Team Meeting	Understanding our competitors can help us position our product better.	draft	38	79	2024-05-22 00:34:45.45386	2024-04-23 00:34:45.466994	2024-04-23 00:34:45.466994
212	Review Sales Report	A clean office is a productive office.	completed	79	93	2024-05-29 00:34:45.477405	2024-04-23 00:34:45.483741	2024-04-23 00:34:45.483741
213	Train New Hires	Preparing a budget helps us plan our finances better.	completed	1	1	2024-04-27 00:34:45.489795	2024-04-23 00:34:45.495799	2024-04-23 00:34:45.495799
214	Refactor Code	This task involves a lot of creativity and an eye for design.	pending	23	21	2024-05-21 00:34:45.501519	2024-04-23 00:34:45.509816	2024-04-23 00:34:45.509816
215	Update Website	Before we release a new feature, it needs to be thoroughly tested.	draft	32	13	2024-05-10 00:34:45.515669	2024-04-23 00:34:45.521128	2024-04-23 00:34:45.521128
216	Improve SEO	Regular team meetings can help us stay aligned and informed.	in_progress	88	62	2024-05-27 00:34:45.527525	2024-04-23 00:34:45.532449	2024-04-23 00:34:45.532449
217	Review Sales Report	Understanding our competitors can help us position our product better.	pending	45	22	2024-05-27 00:34:45.538166	2024-04-23 00:34:45.543403	2024-04-23 00:34:45.543403
218	Conduct Survey	Training new hires is an important investment in our team.	pending	24	34	2024-05-15 00:34:45.549166	2024-04-23 00:34:45.554243	2024-04-23 00:34:45.554243
219	Organize Team Meeting	Documenting our processes can help new team members get up to speed faster.	completed	42	16	2024-05-28 00:34:45.561714	2024-04-23 00:34:45.570285	2024-04-23 00:34:45.570285
220	Document Process	Documenting our processes can help new team members get up to speed faster.	in_progress	2	75	2024-06-15 00:34:45.576069	2024-04-23 00:34:45.580568	2024-04-23 00:34:45.580568
221	Organize Team Meeting	Before we release a new feature, it needs to be thoroughly tested.	completed	100	77	2024-05-02 00:34:45.586036	2024-04-23 00:34:45.591314	2024-04-23 00:34:45.591314
222	Test New Feature	The website needs to be updated with the latest information about our products.	draft	8	45	2024-04-25 00:34:45.597029	2024-04-23 00:34:45.601983	2024-04-23 00:34:45.601983
223	Fix Bugs	A well-written blog post can attract a lot of traffic to our website.	pending	89	46	2024-06-21 00:34:45.608037	2024-04-23 00:34:45.61355	2024-04-23 00:34:45.61355
224	Create Presentation	The website needs to be updated with the latest information about our products.	draft	29	69	2024-05-05 00:34:45.619369	2024-04-23 00:34:45.625131	2024-04-23 00:34:45.625131
225	Update Website	Documenting our processes can help new team members get up to speed faster.	draft	76	97	2024-06-03 00:34:45.631262	2024-04-23 00:34:45.637245	2024-04-23 00:34:45.637245
226	Document Process	Conducting a survey can give us valuable insights from our users.	completed	27	37	2024-06-17 00:34:45.643081	2024-04-23 00:34:45.648841	2024-04-23 00:34:45.648841
227	Launch Product	We need to plan a marketing campaign for the upcoming product launch.	draft	61	91	2024-06-11 00:34:45.653843	2024-04-23 00:34:45.6589	2024-04-23 00:34:45.6589
228	Organize Team Meeting	We need to plan a marketing campaign for the upcoming product launch.	completed	64	35	2024-04-25 00:34:45.664023	2024-04-23 00:34:45.668513	2024-04-23 00:34:45.668513
229	Test New Feature	Analyzing user data can inform our product development decisions.	pending	23	36	2024-06-20 00:34:45.676077	2024-04-23 00:34:45.682465	2024-04-23 00:34:45.682465
230	Plan Marketing Campaign	Analyzing user data can inform our product development decisions.	in_progress	31	84	2024-05-24 00:34:45.688344	2024-04-23 00:34:45.694777	2024-04-23 00:34:45.694777
231	Train New Hires	Preparing a budget helps us plan our finances better.	in_progress	69	23	2024-06-16 00:34:45.701006	2024-04-23 00:34:45.70713	2024-04-23 00:34:45.70713
232	Create Presentation	This task involves a lot of creativity and an eye for design.	in_progress	7	85	2024-06-16 00:34:45.712974	2024-04-23 00:34:45.718983	2024-04-23 00:34:45.718983
233	Write Blog Post	A compelling presentation can help us win over clients.	completed	10	64	2024-06-21 00:34:45.72463	2024-04-23 00:34:45.72973	2024-04-23 00:34:45.72973
234	Analyze User Data	A compelling presentation can help us win over clients.	in_progress	74	36	2024-06-19 00:34:45.73535	2024-04-23 00:34:45.740759	2024-04-23 00:34:45.740759
235	Update Website	A clean office is a productive office.	draft	16	43	2024-05-13 00:34:45.746197	2024-04-23 00:34:45.751293	2024-04-23 00:34:45.751293
236	Train New Hires	Improving our SEO can increase our online visibility.	pending	76	98	2024-06-07 00:34:45.757097	2024-04-23 00:34:45.762972	2024-04-23 00:34:45.762972
237	Design New Logo	The sales report contains important information about our performance.	in_progress	13	59	2024-06-14 00:34:45.768575	2024-04-23 00:34:45.774008	2024-04-23 00:34:45.774008
238	Improve SEO	Fixing bugs is an ongoing task in software development.	pending	62	29	2024-06-10 00:34:45.779572	2024-04-23 00:34:45.784394	2024-04-23 00:34:45.784394
239	Review Sales Report	A clean office is a productive office.	completed	26	31	2024-05-06 00:34:45.789967	2024-04-23 00:34:45.795261	2024-04-23 00:34:45.795261
240	Train New Hires	A compelling presentation can help us win over clients.	completed	34	91	2024-06-18 00:34:45.80109	2024-04-23 00:34:45.805932	2024-04-23 00:34:45.805932
241	Review Sales Report	We need to order supplies before we run out.	in_progress	73	83	2024-05-17 00:34:45.811019	2024-04-23 00:34:45.815436	2024-04-23 00:34:45.815436
242	Order Supplies	A clean office is a productive office.	draft	21	52	2024-04-30 00:34:45.820219	2024-04-23 00:34:45.824889	2024-04-23 00:34:45.824889
243	Analyze User Data	Refactoring code can improve its readability and efficiency.	pending	15	24	2024-06-04 00:34:45.830056	2024-04-23 00:34:45.83475	2024-04-23 00:34:45.83475
244	Conduct Survey	Analyzing user data can inform our product development decisions.	draft	7	60	2024-05-28 00:34:45.839747	2024-04-23 00:34:45.844013	2024-04-23 00:34:45.844013
245	Refactor Code	Training new hires is an important investment in our team.	completed	18	39	2024-05-10 00:34:45.848957	2024-04-23 00:34:45.854497	2024-04-23 00:34:45.854497
246	Update Website	We need to order supplies before we run out.	in_progress	15	83	2024-05-04 00:34:45.860252	2024-04-23 00:34:45.865133	2024-04-23 00:34:45.865133
247	Prepare Budget	The website needs to be updated with the latest information about our products.	in_progress	15	7	2024-05-18 00:34:45.870146	2024-04-23 00:34:45.874506	2024-04-23 00:34:45.874506
248	Fix Bugs	Launching a new product is always exciting.	in_progress	23	26	2024-06-07 00:34:45.879848	2024-04-23 00:34:45.885162	2024-04-23 00:34:45.885162
249	Review Sales Report	Documenting our processes can help new team members get up to speed faster.	draft	26	44	2024-06-05 00:34:45.892283	2024-04-23 00:34:45.897708	2024-04-23 00:34:45.897708
250	Research Competitors	Regular team meetings can help us stay aligned and informed.	pending	76	5	2024-06-04 00:34:45.903388	2024-04-23 00:34:45.909328	2024-04-23 00:34:45.909328
251	Order Supplies	We need to order supplies before we run out.	draft	39	72	2024-05-11 00:34:45.915484	2024-04-23 00:34:45.92242	2024-04-23 00:34:45.92242
252	Research Competitors	Launching a new product is always exciting.	in_progress	6	88	2024-05-16 00:34:45.928098	2024-04-23 00:34:45.933646	2024-04-23 00:34:45.933646
253	Plan Marketing Campaign	A compelling presentation can help us win over clients.	completed	43	52	2024-06-15 00:34:45.939066	2024-04-23 00:34:45.944118	2024-04-23 00:34:45.944118
254	Order Supplies	The sales report contains important information about our performance.	completed	76	49	2024-05-30 00:34:45.949862	2024-04-23 00:34:45.956165	2024-04-23 00:34:45.956165
255	Document Process	Regular team meetings can help us stay aligned and informed.	completed	10	70	2024-06-03 00:34:45.96545	2024-04-23 00:34:45.976997	2024-04-23 00:34:45.976997
256	Prepare Budget	Documenting our processes can help new team members get up to speed faster.	pending	87	55	2024-05-17 00:34:46.009467	2024-04-23 00:34:46.016123	2024-04-23 00:34:46.016123
257	Organize Team Meeting	Before we release a new feature, it needs to be thoroughly tested.	in_progress	94	100	2024-04-25 00:34:46.021538	2024-04-23 00:34:46.026486	2024-04-23 00:34:46.026486
258	Update Website	We need to plan a marketing campaign for the upcoming product launch.	pending	72	27	2024-05-26 00:34:46.031614	2024-04-23 00:34:46.03753	2024-04-23 00:34:46.03753
259	Order Supplies	Analyzing user data can inform our product development decisions.	in_progress	42	64	2024-06-20 00:34:46.043498	2024-04-23 00:34:46.049206	2024-04-23 00:34:46.049206
260	Improve SEO	We need to order supplies before we run out.	completed	35	37	2024-06-02 00:34:46.054355	2024-04-23 00:34:46.059471	2024-04-23 00:34:46.059471
261	Update Website	A clean office is a productive office.	in_progress	8	57	2024-06-09 00:34:46.064665	2024-04-23 00:34:46.069775	2024-04-23 00:34:46.069775
262	Research Competitors	Refactoring code can improve its readability and efficiency.	completed	18	95	2024-06-17 00:34:46.074905	2024-04-23 00:34:46.079385	2024-04-23 00:34:46.079385
263	Launch Product	A compelling presentation can help us win over clients.	pending	13	52	2024-06-22 00:34:46.084708	2024-04-23 00:34:46.089294	2024-04-23 00:34:46.089294
264	Review Sales Report	The website needs to be updated with the latest information about our products.	pending	30	53	2024-05-11 00:34:46.094386	2024-04-23 00:34:46.098997	2024-04-23 00:34:46.098997
265	Design New Logo	Regular team meetings can help us stay aligned and informed.	draft	47	4	2024-05-09 00:34:46.104379	2024-04-23 00:34:46.109884	2024-04-23 00:34:46.109884
266	Document Process	The website needs to be updated with the latest information about our products.	draft	100	43	2024-05-08 00:34:46.115651	2024-04-23 00:34:46.121948	2024-04-23 00:34:46.121948
267	Clean Office	A well-written blog post can attract a lot of traffic to our website.	pending	88	85	2024-05-31 00:34:46.127571	2024-04-23 00:34:46.133246	2024-04-23 00:34:46.133246
268	Organize Team Meeting	Improving our SEO can increase our online visibility.	draft	23	74	2024-05-01 00:34:46.138886	2024-04-23 00:34:46.144259	2024-04-23 00:34:46.144259
269	Fix Bugs	Refactoring code can improve its readability and efficiency.	completed	87	82	2024-05-01 00:34:46.150804	2024-04-23 00:34:46.156195	2024-04-23 00:34:46.156195
270	Clean Office	Regular team meetings can help us stay aligned and informed.	in_progress	13	25	2024-06-15 00:34:46.163197	2024-04-23 00:34:46.170273	2024-04-23 00:34:46.170273
271	Plan Marketing Campaign	Preparing a budget helps us plan our finances better.	draft	6	26	2024-05-10 00:34:46.176559	2024-04-23 00:34:46.182679	2024-04-23 00:34:46.182679
272	Analyze User Data	We need to order supplies before we run out.	in_progress	40	91	2024-05-28 00:34:46.188647	2024-04-23 00:34:46.194084	2024-04-23 00:34:46.194084
273	Fix Bugs	Before we release a new feature, it needs to be thoroughly tested.	draft	100	24	2024-06-05 00:34:46.19975	2024-04-23 00:34:46.205107	2024-04-23 00:34:46.205107
274	Write Blog Post	Regular team meetings can help us stay aligned and informed.	in_progress	90	14	2024-05-14 00:34:46.210564	2024-04-23 00:34:46.215763	2024-04-23 00:34:46.215763
275	Update Website	We need to plan a marketing campaign for the upcoming product launch.	completed	44	62	2024-06-19 00:34:46.221338	2024-04-23 00:34:46.227927	2024-04-23 00:34:46.227927
276	Launch Product	This task involves a lot of creativity and an eye for design.	in_progress	13	18	2024-05-15 00:34:46.233028	2024-04-23 00:34:46.237684	2024-04-23 00:34:46.237684
277	Document Process	The sales report contains important information about our performance.	pending	41	6	2024-05-17 00:34:46.242641	2024-04-23 00:34:46.247259	2024-04-23 00:34:46.247259
278	Test New Feature	This task involves a lot of creativity and an eye for design.	pending	75	79	2024-05-13 00:34:46.25218	2024-04-23 00:34:46.264965	2024-04-23 00:34:46.264965
279	Analyze User Data	This task involves a lot of creativity and an eye for design.	completed	10	11	2024-05-03 00:34:46.273497	2024-04-23 00:34:46.281575	2024-04-23 00:34:46.281575
280	Prepare Budget	Understanding our competitors can help us position our product better.	draft	64	38	2024-06-09 00:34:46.286859	2024-04-23 00:34:46.29339	2024-04-23 00:34:46.29339
281	Improve SEO	Fixing bugs is an ongoing task in software development.	draft	79	53	2024-05-31 00:34:46.29868	2024-04-23 00:34:46.303646	2024-04-23 00:34:46.303646
282	Train New Hires	Improving our SEO can increase our online visibility.	in_progress	8	65	2024-05-21 00:34:46.309201	2024-04-23 00:34:46.314362	2024-04-23 00:34:46.314362
283	Research Competitors	We need to order supplies before we run out.	pending	96	40	2024-06-12 00:34:46.320043	2024-04-23 00:34:46.325324	2024-04-23 00:34:46.325324
284	Refactor Code	Regular team meetings can help us stay aligned and informed.	completed	57	85	2024-06-01 00:34:46.331345	2024-04-23 00:34:46.336791	2024-04-23 00:34:46.336791
285	Research Competitors	Documenting our processes can help new team members get up to speed faster.	pending	76	66	2024-05-03 00:34:46.34232	2024-04-23 00:34:46.347316	2024-04-23 00:34:46.347316
286	Prepare Budget	Refactoring code can improve its readability and efficiency.	in_progress	39	42	2024-05-01 00:34:46.352939	2024-04-23 00:34:46.358145	2024-04-23 00:34:46.358145
287	Document Process	Understanding our competitors can help us position our product better.	completed	86	34	2024-06-22 00:34:46.366109	2024-04-23 00:34:46.376771	2024-04-23 00:34:46.376771
288	Research Competitors	Refactoring code can improve its readability and efficiency.	in_progress	27	33	2024-05-09 00:34:46.382354	2024-04-23 00:34:46.389081	2024-04-23 00:34:46.389081
289	Test New Feature	A well-written blog post can attract a lot of traffic to our website.	pending	51	4	2024-04-24 00:34:46.39465	2024-04-23 00:34:46.400364	2024-04-23 00:34:46.400364
290	Analyze User Data	Documenting our processes can help new team members get up to speed faster.	pending	21	12	2024-06-04 00:34:46.406277	2024-04-23 00:34:46.411569	2024-04-23 00:34:46.411569
291	Review Sales Report	Conducting a survey can give us valuable insights from our users.	completed	34	13	2024-06-07 00:34:46.416754	2024-04-23 00:34:46.422216	2024-04-23 00:34:46.422216
292	Order Supplies	A well-written blog post can attract a lot of traffic to our website.	in_progress	24	10	2024-06-03 00:34:46.427644	2024-04-23 00:34:46.432294	2024-04-23 00:34:46.432294
293	Plan Marketing Campaign	Fixing bugs is an ongoing task in software development.	pending	6	76	2024-04-29 00:34:46.437644	2024-04-23 00:34:46.44201	2024-04-23 00:34:46.44201
294	Launch Product	Fixing bugs is an ongoing task in software development.	draft	97	12	2024-05-23 00:34:46.447081	2024-04-23 00:34:46.452172	2024-04-23 00:34:46.452172
295	Plan Marketing Campaign	Analyzing user data can inform our product development decisions.	in_progress	91	51	2024-05-05 00:34:46.457668	2024-04-23 00:34:46.462687	2024-04-23 00:34:46.462687
296	Write Blog Post	The website needs to be updated with the latest information about our products.	draft	80	51	2024-05-21 00:34:46.467803	2024-04-23 00:34:46.472088	2024-04-23 00:34:46.472088
297	Prepare Budget	Refactoring code can improve its readability and efficiency.	completed	26	91	2024-05-03 00:34:46.477369	2024-04-23 00:34:46.481955	2024-04-23 00:34:46.481955
298	Order Supplies	This task involves a lot of creativity and an eye for design.	completed	79	75	2024-05-15 00:34:46.487475	2024-04-23 00:34:46.491925	2024-04-23 00:34:46.491925
299	Launch Product	Regular team meetings can help us stay aligned and informed.	pending	83	9	2024-05-30 00:34:46.497095	2024-04-23 00:34:46.502771	2024-04-23 00:34:46.502771
300	Prepare Budget	The sales report contains important information about our performance.	in_progress	48	67	2024-06-07 00:34:46.507636	2024-04-23 00:34:46.512145	2024-04-23 00:34:46.512145
301	Research Competitors	Before we release a new feature, it needs to be thoroughly tested.	pending	61	45	2024-05-09 00:34:46.51748	2024-04-23 00:34:46.522217	2024-04-23 00:34:46.522217
302	Clean Office	We need to order supplies before we run out.	in_progress	81	21	2024-06-16 00:34:46.527882	2024-04-23 00:34:46.535318	2024-04-23 00:34:46.535318
303	Document Process	A clean office is a productive office.	in_progress	62	11	2024-05-19 00:34:46.541689	2024-04-23 00:34:46.549863	2024-04-23 00:34:46.549863
304	Test New Feature	Preparing a budget helps us plan our finances better.	completed	80	83	2024-06-08 00:34:46.556641	2024-04-23 00:34:46.565669	2024-04-23 00:34:46.565669
305	Order Supplies	Conducting a survey can give us valuable insights from our users.	completed	49	71	2024-05-15 00:34:46.573069	2024-04-23 00:34:46.57935	2024-04-23 00:34:46.57935
306	Train New Hires	A compelling presentation can help us win over clients.	pending	63	24	2024-05-31 00:34:46.585615	2024-04-23 00:34:46.595469	2024-04-23 00:34:46.595469
307	Create Presentation	The sales report contains important information about our performance.	pending	18	67	2024-05-02 00:34:46.602174	2024-04-23 00:34:46.609279	2024-04-23 00:34:46.609279
308	Launch Product	Improving our SEO can increase our online visibility.	completed	76	20	2024-06-13 00:34:46.615942	2024-04-23 00:34:46.622561	2024-04-23 00:34:46.622561
309	Train New Hires	A clean office is a productive office.	in_progress	26	81	2024-05-02 00:34:46.629269	2024-04-23 00:34:46.635876	2024-04-23 00:34:46.635876
310	Create Presentation	We need to plan a marketing campaign for the upcoming product launch.	completed	37	45	2024-05-24 00:34:46.642207	2024-04-23 00:34:46.648321	2024-04-23 00:34:46.648321
311	Create Presentation	Refactoring code can improve its readability and efficiency.	pending	8	28	2024-05-08 00:34:46.654359	2024-04-23 00:34:46.662366	2024-04-23 00:34:46.662366
312	Order Supplies	Documenting our processes can help new team members get up to speed faster.	in_progress	75	48	2024-05-08 00:34:46.669097	2024-04-23 00:34:46.67383	2024-04-23 00:34:46.67383
313	Fix Bugs	A clean office is a productive office.	pending	70	32	2024-05-19 00:34:46.678944	2024-04-23 00:34:46.683538	2024-04-23 00:34:46.683538
314	Update Website	Fixing bugs is an ongoing task in software development.	completed	58	66	2024-05-31 00:34:46.688826	2024-04-23 00:34:46.693631	2024-04-23 00:34:46.693631
315	Order Supplies	Analyzing user data can inform our product development decisions.	pending	77	66	2024-06-14 00:34:46.698718	2024-04-23 00:34:46.703002	2024-04-23 00:34:46.703002
316	Analyze User Data	Understanding our competitors can help us position our product better.	draft	70	37	2024-05-05 00:34:46.707988	2024-04-23 00:34:46.712539	2024-04-23 00:34:46.712539
317	Plan Marketing Campaign	Improving our SEO can increase our online visibility.	draft	50	97	2024-05-25 00:34:46.721643	2024-04-23 00:34:46.731541	2024-04-23 00:34:46.731541
318	Analyze User Data	Analyzing user data can inform our product development decisions.	in_progress	37	53	2024-06-11 00:34:46.73698	2024-04-23 00:34:46.741598	2024-04-23 00:34:46.741598
319	Train New Hires	Training new hires is an important investment in our team.	draft	75	53	2024-04-28 00:34:46.746876	2024-04-23 00:34:46.75234	2024-04-23 00:34:46.75234
320	Prepare Budget	Improving our SEO can increase our online visibility.	in_progress	39	44	2024-05-31 00:34:46.758913	2024-04-23 00:34:46.765763	2024-04-23 00:34:46.765763
321	Refactor Code	Regular team meetings can help us stay aligned and informed.	draft	94	41	2024-06-10 00:34:46.771449	2024-04-23 00:34:46.777662	2024-04-23 00:34:46.777662
322	Write Blog Post	Regular team meetings can help us stay aligned and informed.	completed	26	85	2024-04-24 00:34:46.784134	2024-04-23 00:34:46.791074	2024-04-23 00:34:46.791074
323	Order Supplies	Regular team meetings can help us stay aligned and informed.	pending	40	30	2024-05-09 00:34:46.79709	2024-04-23 00:34:46.802802	2024-04-23 00:34:46.802802
324	Test New Feature	The sales report contains important information about our performance.	pending	25	19	2024-05-06 00:34:46.80836	2024-04-23 00:34:46.813851	2024-04-23 00:34:46.813851
325	Test New Feature	A well-written blog post can attract a lot of traffic to our website.	draft	6	70	2024-05-03 00:34:46.819602	2024-04-23 00:34:46.826836	2024-04-23 00:34:46.826836
326	Improve SEO	Understanding our competitors can help us position our product better.	draft	51	18	2024-04-27 00:34:46.833949	2024-04-23 00:34:46.839578	2024-04-23 00:34:46.839578
327	Organize Team Meeting	We need to order supplies before we run out.	in_progress	45	81	2024-05-31 00:34:46.845319	2024-04-23 00:34:46.851047	2024-04-23 00:34:46.851047
328	Improve SEO	Before we release a new feature, it needs to be thoroughly tested.	in_progress	47	77	2024-04-30 00:34:46.856758	2024-04-23 00:34:46.861886	2024-04-23 00:34:46.861886
329	Order Supplies	The sales report contains important information about our performance.	draft	92	30	2024-05-09 00:34:46.867008	2024-04-23 00:34:46.871871	2024-04-23 00:34:46.871871
330	Research Competitors	Improving our SEO can increase our online visibility.	completed	75	26	2024-06-18 00:34:46.87701	2024-04-23 00:34:46.881731	2024-04-23 00:34:46.881731
331	Clean Office	This task involves a lot of creativity and an eye for design.	draft	28	99	2024-05-20 00:34:46.887633	2024-04-23 00:34:46.892134	2024-04-23 00:34:46.892134
332	Design New Logo	Fixing bugs is an ongoing task in software development.	completed	81	94	2024-05-09 00:34:46.897922	2024-04-23 00:34:46.904006	2024-04-23 00:34:46.904006
333	Conduct Survey	We need to order supplies before we run out.	completed	4	21	2024-06-20 00:34:46.909519	2024-04-23 00:34:46.91386	2024-04-23 00:34:46.91386
334	Analyze User Data	We need to order supplies before we run out.	pending	84	32	2024-06-01 00:34:46.918874	2024-04-23 00:34:46.92378	2024-04-23 00:34:46.92378
335	Analyze User Data	Documenting our processes can help new team members get up to speed faster.	in_progress	80	83	2024-05-16 00:34:46.929958	2024-04-23 00:34:46.9347	2024-04-23 00:34:46.9347
336	Analyze User Data	The sales report contains important information about our performance.	pending	22	69	2024-04-25 00:34:46.939834	2024-04-23 00:34:46.944413	2024-04-23 00:34:46.944413
337	Review Sales Report	Before we release a new feature, it needs to be thoroughly tested.	in_progress	64	74	2024-05-27 00:34:46.949755	2024-04-23 00:34:46.954612	2024-04-23 00:34:46.954612
338	Train New Hires	A well-written blog post can attract a lot of traffic to our website.	in_progress	25	16	2024-05-23 00:34:46.95999	2024-04-23 00:34:46.971272	2024-04-23 00:34:46.971272
339	Clean Office	The sales report contains important information about our performance.	in_progress	52	99	2024-06-18 00:34:46.978956	2024-04-23 00:34:46.984388	2024-04-23 00:34:46.984388
340	Plan Marketing Campaign	Before we release a new feature, it needs to be thoroughly tested.	completed	19	58	2024-06-12 00:34:46.990254	2024-04-23 00:34:46.99555	2024-04-23 00:34:46.99555
341	Research Competitors	Refactoring code can improve its readability and efficiency.	in_progress	85	21	2024-06-11 00:34:47.001192	2024-04-23 00:34:47.007298	2024-04-23 00:34:47.007298
342	Improve SEO	A clean office is a productive office.	pending	44	71	2024-05-20 00:34:47.012701	2024-04-23 00:34:47.018154	2024-04-23 00:34:47.018154
343	Review Sales Report	A clean office is a productive office.	draft	6	90	2024-05-01 00:34:47.024959	2024-04-23 00:34:47.036765	2024-04-23 00:34:47.036765
344	Conduct Survey	Analyzing user data can inform our product development decisions.	in_progress	43	43	2024-05-29 00:34:47.052623	2024-04-23 00:34:47.070488	2024-04-23 00:34:47.070488
345	Write Blog Post	Documenting our processes can help new team members get up to speed faster.	draft	40	73	2024-06-09 00:34:47.076017	2024-04-23 00:34:47.081047	2024-04-23 00:34:47.081047
346	Review Sales Report	Fixing bugs is an ongoing task in software development.	completed	63	23	2024-06-17 00:34:47.086338	2024-04-23 00:34:47.09095	2024-04-23 00:34:47.09095
347	Clean Office	The sales report contains important information about our performance.	completed	69	95	2024-05-28 00:34:47.095811	2024-04-23 00:34:47.10171	2024-04-23 00:34:47.10171
348	Document Process	We need to order supplies before we run out.	pending	53	38	2024-06-11 00:34:47.106695	2024-04-23 00:34:47.110855	2024-04-23 00:34:47.110855
349	Train New Hires	Before we release a new feature, it needs to be thoroughly tested.	pending	50	46	2024-06-13 00:34:47.115904	2024-04-23 00:34:47.12066	2024-04-23 00:34:47.12066
350	Order Supplies	Regular team meetings can help us stay aligned and informed.	pending	70	80	2024-05-15 00:34:47.125657	2024-04-23 00:34:47.130453	2024-04-23 00:34:47.130453
351	Create Presentation	Fixing bugs is an ongoing task in software development.	in_progress	55	71	2024-06-03 00:34:47.135897	2024-04-23 00:34:47.14042	2024-04-23 00:34:47.14042
352	Prepare Budget	Regular team meetings can help us stay aligned and informed.	completed	29	21	2024-04-24 00:34:47.145493	2024-04-23 00:34:47.150698	2024-04-23 00:34:47.150698
353	Document Process	Before we release a new feature, it needs to be thoroughly tested.	pending	70	58	2024-05-10 00:34:47.15576	2024-04-23 00:34:47.161055	2024-04-23 00:34:47.161055
354	Plan Marketing Campaign	A clean office is a productive office.	draft	86	46	2024-05-08 00:34:47.167784	2024-04-23 00:34:47.174277	2024-04-23 00:34:47.174277
355	Research Competitors	This task involves a lot of creativity and an eye for design.	completed	67	70	2024-05-15 00:34:47.180187	2024-04-23 00:34:47.1857	2024-04-23 00:34:47.1857
356	Write Blog Post	We need to order supplies before we run out.	pending	34	24	2024-04-26 00:34:47.191345	2024-04-23 00:34:47.196861	2024-04-23 00:34:47.196861
357	Plan Marketing Campaign	Fixing bugs is an ongoing task in software development.	completed	38	12	2024-04-28 00:34:47.202766	2024-04-23 00:34:47.208978	2024-04-23 00:34:47.208978
358	Prepare Budget	The website needs to be updated with the latest information about our products.	in_progress	46	74	2024-05-15 00:34:47.214615	2024-04-23 00:34:47.219882	2024-04-23 00:34:47.219882
359	Plan Marketing Campaign	Improving our SEO can increase our online visibility.	in_progress	33	9	2024-04-26 00:34:47.225667	2024-04-23 00:34:47.231059	2024-04-23 00:34:47.231059
360	Fix Bugs	We need to order supplies before we run out.	completed	100	33	2024-05-21 00:34:47.236611	2024-04-23 00:34:47.242353	2024-04-23 00:34:47.242353
361	Conduct Survey	We need to order supplies before we run out.	pending	24	28	2024-06-13 00:34:47.24812	2024-04-23 00:34:47.253204	2024-04-23 00:34:47.253204
362	Prepare Budget	Analyzing user data can inform our product development decisions.	draft	4	7	2024-06-22 00:34:47.259002	2024-04-23 00:34:47.264451	2024-04-23 00:34:47.264451
363	Research Competitors	Fixing bugs is an ongoing task in software development.	in_progress	57	52	2024-06-22 00:34:47.272451	2024-04-23 00:34:47.279531	2024-04-23 00:34:47.279531
364	Review Sales Report	Documenting our processes can help new team members get up to speed faster.	completed	57	59	2024-04-25 00:34:47.285607	2024-04-23 00:34:47.290434	2024-04-23 00:34:47.290434
365	Review Sales Report	Conducting a survey can give us valuable insights from our users.	completed	36	54	2024-06-09 00:34:47.295727	2024-04-23 00:34:47.300723	2024-04-23 00:34:47.300723
366	Refactor Code	Launching a new product is always exciting.	completed	39	14	2024-04-28 00:34:47.305909	2024-04-23 00:34:47.310566	2024-04-23 00:34:47.310566
367	Review Sales Report	A clean office is a productive office.	in_progress	77	81	2024-06-12 00:34:47.315771	2024-04-23 00:34:47.320532	2024-04-23 00:34:47.320532
368	Improve SEO	Regular team meetings can help us stay aligned and informed.	pending	84	34	2024-05-01 00:34:47.325645	2024-04-23 00:34:47.330282	2024-04-23 00:34:47.330282
369	Create Presentation	Documenting our processes can help new team members get up to speed faster.	completed	50	27	2024-05-21 00:34:47.335303	2024-04-23 00:34:47.339748	2024-04-23 00:34:47.339748
370	Clean Office	Launching a new product is always exciting.	in_progress	58	45	2024-05-05 00:34:47.344954	2024-04-23 00:34:47.349545	2024-04-23 00:34:47.349545
371	Update Website	Before we release a new feature, it needs to be thoroughly tested.	pending	28	78	2024-06-19 00:34:47.354591	2024-04-23 00:34:47.359733	2024-04-23 00:34:47.359733
372	Improve SEO	Fixing bugs is an ongoing task in software development.	draft	28	34	2024-05-15 00:34:47.364954	2024-04-23 00:34:47.369296	2024-04-23 00:34:47.369296
373	Improve SEO	The sales report contains important information about our performance.	in_progress	64	10	2024-06-17 00:34:47.374355	2024-04-23 00:34:47.379055	2024-04-23 00:34:47.379055
374	Create Presentation	Preparing a budget helps us plan our finances better.	draft	74	31	2024-05-09 00:34:47.384101	2024-04-23 00:34:47.389074	2024-04-23 00:34:47.389074
375	Plan Marketing Campaign	We need to plan a marketing campaign for the upcoming product launch.	draft	64	93	2024-05-24 00:34:47.39528	2024-04-23 00:34:47.401093	2024-04-23 00:34:47.401093
376	Clean Office	Conducting a survey can give us valuable insights from our users.	in_progress	73	65	2024-06-09 00:34:47.40745	2024-04-23 00:34:47.41294	2024-04-23 00:34:47.41294
377	Design New Logo	We need to plan a marketing campaign for the upcoming product launch.	completed	29	72	2024-05-02 00:34:47.420066	2024-04-23 00:34:47.425374	2024-04-23 00:34:47.425374
378	Create Presentation	We need to order supplies before we run out.	completed	19	89	2024-04-29 00:34:47.430959	2024-04-23 00:34:47.436414	2024-04-23 00:34:47.436414
379	Document Process	Before we release a new feature, it needs to be thoroughly tested.	pending	75	74	2024-04-26 00:34:47.442207	2024-04-23 00:34:47.447522	2024-04-23 00:34:47.447522
380	Design New Logo	Preparing a budget helps us plan our finances better.	draft	14	29	2024-05-03 00:34:47.453077	2024-04-23 00:34:47.458609	2024-04-23 00:34:47.458609
381	Refactor Code	Conducting a survey can give us valuable insights from our users.	pending	77	14	2024-06-10 00:34:47.464745	2024-04-23 00:34:47.470316	2024-04-23 00:34:47.470316
382	Update Website	The sales report contains important information about our performance.	completed	71	32	2024-06-07 00:34:47.475901	2024-04-23 00:34:47.481741	2024-04-23 00:34:47.481741
383	Conduct Survey	We need to plan a marketing campaign for the upcoming product launch.	completed	8	70	2024-05-18 00:34:47.487491	2024-04-23 00:34:47.492656	2024-04-23 00:34:47.492656
384	Create Presentation	Preparing a budget helps us plan our finances better.	completed	81	10	2024-05-07 00:34:47.498183	2024-04-23 00:34:47.502969	2024-04-23 00:34:47.502969
385	Fix Bugs	A compelling presentation can help us win over clients.	pending	61	66	2024-05-08 00:34:47.508183	2024-04-23 00:34:47.51584	2024-04-23 00:34:47.51584
386	Create Presentation	We need to order supplies before we run out.	completed	47	93	2024-05-30 00:34:47.521683	2024-04-23 00:34:47.526757	2024-04-23 00:34:47.526757
387	Fix Bugs	We need to plan a marketing campaign for the upcoming product launch.	in_progress	20	14	2024-05-17 00:34:47.53211	2024-04-23 00:34:47.536529	2024-04-23 00:34:47.536529
388	Prepare Budget	This task involves a lot of creativity and an eye for design.	in_progress	46	35	2024-06-18 00:34:47.541491	2024-04-23 00:34:47.545775	2024-04-23 00:34:47.545775
389	Update Website	This task involves a lot of creativity and an eye for design.	completed	58	37	2024-05-17 00:34:47.550772	2024-04-23 00:34:47.55513	2024-04-23 00:34:47.55513
390	Analyze User Data	Understanding our competitors can help us position our product better.	in_progress	4	60	2024-06-13 00:34:47.560535	2024-04-23 00:34:47.565891	2024-04-23 00:34:47.565891
391	Analyze User Data	A clean office is a productive office.	in_progress	45	62	2024-06-18 00:34:47.570888	2024-04-23 00:34:47.575663	2024-04-23 00:34:47.575663
392	Train New Hires	Improving our SEO can increase our online visibility.	pending	27	87	2024-05-30 00:34:47.58084	2024-04-23 00:34:47.585159	2024-04-23 00:34:47.585159
393	Order Supplies	Launching a new product is always exciting.	in_progress	40	2	2024-06-05 00:34:47.590168	2024-04-23 00:34:47.595325	2024-04-23 00:34:47.595325
394	Test New Feature	Fixing bugs is an ongoing task in software development.	draft	70	31	2024-06-06 00:34:47.600639	2024-04-23 00:34:47.605735	2024-04-23 00:34:47.605735
395	Clean Office	A well-written blog post can attract a lot of traffic to our website.	pending	1	41	2024-04-29 00:34:47.611569	2024-04-23 00:34:47.617074	2024-04-23 00:34:47.617074
396	Analyze User Data	Launching a new product is always exciting.	completed	96	16	2024-05-17 00:34:47.623231	2024-04-23 00:34:47.628993	2024-04-23 00:34:47.628993
397	Test New Feature	Regular team meetings can help us stay aligned and informed.	completed	1	24	2024-06-14 00:34:47.639677	2024-04-23 00:34:47.645632	2024-04-23 00:34:47.645632
398	Research Competitors	Conducting a survey can give us valuable insights from our users.	in_progress	12	37	2024-04-29 00:34:47.651519	2024-04-23 00:34:47.656965	2024-04-23 00:34:47.656965
399	Design New Logo	Launching a new product is always exciting.	in_progress	29	22	2024-05-04 00:34:47.662578	2024-04-23 00:34:47.671913	2024-04-23 00:34:47.671913
400	Analyze User Data	Analyzing user data can inform our product development decisions.	in_progress	98	42	2024-05-31 00:34:47.677636	2024-04-23 00:34:47.683361	2024-04-23 00:34:47.683361
401	Document Process	Regular team meetings can help us stay aligned and informed.	in_progress	63	70	2024-05-26 00:34:47.688941	2024-04-23 00:34:47.694522	2024-04-23 00:34:47.694522
402	Conduct Survey	Documenting our processes can help new team members get up to speed faster.	in_progress	83	79	2024-05-07 00:34:47.700458	2024-04-23 00:34:47.705982	2024-04-23 00:34:47.705982
403	Prepare Budget	The sales report contains important information about our performance.	draft	71	69	2024-05-05 00:34:47.711532	2024-04-23 00:34:47.716574	2024-04-23 00:34:47.716574
404	Research Competitors	Improving our SEO can increase our online visibility.	draft	38	39	2024-05-09 00:34:47.721872	2024-04-23 00:34:47.726535	2024-04-23 00:34:47.726535
405	Test New Feature	The sales report contains important information about our performance.	in_progress	42	24	2024-05-17 00:34:47.731932	2024-04-23 00:34:47.73641	2024-04-23 00:34:47.73641
406	Train New Hires	This task involves a lot of creativity and an eye for design.	pending	74	89	2024-06-09 00:34:47.741565	2024-04-23 00:34:47.747749	2024-04-23 00:34:47.747749
407	Update Website	A clean office is a productive office.	in_progress	68	69	2024-05-11 00:34:47.752882	2024-04-23 00:34:47.75806	2024-04-23 00:34:47.75806
408	Plan Marketing Campaign	Training new hires is an important investment in our team.	pending	22	4	2024-05-25 00:34:47.764566	2024-04-23 00:34:47.773855	2024-04-23 00:34:47.773855
409	Launch Product	Before we release a new feature, it needs to be thoroughly tested.	draft	75	29	2024-06-12 00:34:47.78144	2024-04-23 00:34:47.786495	2024-04-23 00:34:47.786495
410	Launch Product	We need to plan a marketing campaign for the upcoming product launch.	completed	58	53	2024-04-28 00:34:47.791489	2024-04-23 00:34:47.795833	2024-04-23 00:34:47.795833
411	Create Presentation	The website needs to be updated with the latest information about our products.	draft	52	4	2024-06-01 00:34:47.801035	2024-04-23 00:34:47.805506	2024-04-23 00:34:47.805506
412	Organize Team Meeting	The website needs to be updated with the latest information about our products.	completed	74	77	2024-06-08 00:34:47.810316	2024-04-23 00:34:47.814871	2024-04-23 00:34:47.814871
413	Update Website	The website needs to be updated with the latest information about our products.	draft	1	73	2024-04-25 00:34:47.819858	2024-04-23 00:34:47.824693	2024-04-23 00:34:47.824693
414	Conduct Survey	A well-written blog post can attract a lot of traffic to our website.	completed	46	73	2024-05-03 00:34:47.830023	2024-04-23 00:34:47.834977	2024-04-23 00:34:47.834977
415	Refactor Code	Refactoring code can improve its readability and efficiency.	in_progress	89	52	2024-05-05 00:34:47.840202	2024-04-23 00:34:47.845014	2024-04-23 00:34:47.845014
416	Test New Feature	Understanding our competitors can help us position our product better.	in_progress	89	13	2024-05-21 00:34:47.850543	2024-04-23 00:34:47.856006	2024-04-23 00:34:47.856006
417	Test New Feature	Improving our SEO can increase our online visibility.	completed	27	6	2024-06-07 00:34:47.861622	2024-04-23 00:34:47.867416	2024-04-23 00:34:47.867416
418	Clean Office	Understanding our competitors can help us position our product better.	in_progress	1	97	2024-05-10 00:34:47.872823	2024-04-23 00:34:47.877987	2024-04-23 00:34:47.877987
419	Document Process	A clean office is a productive office.	completed	66	50	2024-06-17 00:34:47.888445	2024-04-23 00:34:47.908719	2024-04-23 00:34:47.908719
420	Analyze User Data	A clean office is a productive office.	completed	71	85	2024-06-07 00:34:47.914108	2024-04-23 00:34:47.919274	2024-04-23 00:34:47.919274
421	Improve SEO	Understanding our competitors can help us position our product better.	pending	39	72	2024-05-06 00:34:47.924886	2024-04-23 00:34:47.930294	2024-04-23 00:34:47.930294
422	Design New Logo	Launching a new product is always exciting.	draft	20	34	2024-05-04 00:34:47.935957	2024-04-23 00:34:47.940948	2024-04-23 00:34:47.940948
423	Document Process	Documenting our processes can help new team members get up to speed faster.	draft	68	78	2024-06-20 00:34:47.947132	2024-04-23 00:34:47.952191	2024-04-23 00:34:47.952191
424	Update Website	Preparing a budget helps us plan our finances better.	draft	68	57	2024-04-25 00:34:47.95766	2024-04-23 00:34:47.962816	2024-04-23 00:34:47.962816
425	Refactor Code	Regular team meetings can help us stay aligned and informed.	completed	88	63	2024-06-09 00:34:47.968799	2024-04-23 00:34:47.97339	2024-04-23 00:34:47.97339
426	Plan Marketing Campaign	Launching a new product is always exciting.	in_progress	73	67	2024-06-14 00:34:47.978677	2024-04-23 00:34:47.983219	2024-04-23 00:34:47.983219
427	Design New Logo	A well-written blog post can attract a lot of traffic to our website.	in_progress	45	36	2024-04-30 00:34:47.988199	2024-04-23 00:34:47.992521	2024-04-23 00:34:47.992521
428	Refactor Code	Fixing bugs is an ongoing task in software development.	in_progress	13	9	2024-05-04 00:34:47.997507	2024-04-23 00:34:48.002996	2024-04-23 00:34:48.002996
429	Research Competitors	A compelling presentation can help us win over clients.	completed	89	31	2024-04-29 00:34:48.008869	2024-04-23 00:34:48.013395	2024-04-23 00:34:48.013395
430	Plan Marketing Campaign	The website needs to be updated with the latest information about our products.	pending	75	53	2024-05-31 00:34:48.018707	2024-04-23 00:34:48.023183	2024-04-23 00:34:48.023183
431	Prepare Budget	Improving our SEO can increase our online visibility.	pending	53	1	2024-04-29 00:34:48.028077	2024-04-23 00:34:48.032508	2024-04-23 00:34:48.032508
432	Review Sales Report	Analyzing user data can inform our product development decisions.	pending	25	15	2024-05-04 00:34:48.03779	2024-04-23 00:34:48.042427	2024-04-23 00:34:48.042427
433	Train New Hires	A clean office is a productive office.	completed	23	36	2024-06-12 00:34:48.047983	2024-04-23 00:34:48.053568	2024-04-23 00:34:48.053568
434	Design New Logo	A compelling presentation can help us win over clients.	pending	21	53	2024-06-04 00:34:48.059052	2024-04-23 00:34:48.065205	2024-04-23 00:34:48.065205
435	Write Blog Post	The sales report contains important information about our performance.	completed	29	54	2024-05-29 00:34:48.070857	2024-04-23 00:34:48.076053	2024-04-23 00:34:48.076053
436	Write Blog Post	Fixing bugs is an ongoing task in software development.	completed	75	33	2024-05-30 00:34:48.085203	2024-04-23 00:34:48.109117	2024-04-23 00:34:48.109117
437	Document Process	Conducting a survey can give us valuable insights from our users.	completed	53	90	2024-05-13 00:34:48.123645	2024-04-23 00:34:48.130588	2024-04-23 00:34:48.130588
438	Fix Bugs	Regular team meetings can help us stay aligned and informed.	draft	22	34	2024-06-14 00:34:48.136937	2024-04-23 00:34:48.142193	2024-04-23 00:34:48.142193
439	Analyze User Data	Preparing a budget helps us plan our finances better.	in_progress	64	21	2024-06-15 00:34:48.148242	2024-04-23 00:34:48.154397	2024-04-23 00:34:48.154397
440	Analyze User Data	The sales report contains important information about our performance.	draft	25	90	2024-05-18 00:34:48.160079	2024-04-23 00:34:48.165201	2024-04-23 00:34:48.165201
441	Test New Feature	A compelling presentation can help us win over clients.	completed	95	59	2024-06-12 00:34:48.170393	2024-04-23 00:34:48.175238	2024-04-23 00:34:48.175238
442	Clean Office	Regular team meetings can help us stay aligned and informed.	in_progress	97	9	2024-06-12 00:34:48.180263	2024-04-23 00:34:48.18508	2024-04-23 00:34:48.18508
443	Plan Marketing Campaign	Before we release a new feature, it needs to be thoroughly tested.	pending	56	28	2024-06-03 00:34:48.190376	2024-04-23 00:34:48.194955	2024-04-23 00:34:48.194955
444	Update Website	The sales report contains important information about our performance.	in_progress	55	70	2024-05-01 00:34:48.200161	2024-04-23 00:34:48.20477	2024-04-23 00:34:48.20477
445	Refactor Code	Improving our SEO can increase our online visibility.	draft	78	8	2024-06-17 00:34:48.209742	2024-04-23 00:34:48.214205	2024-04-23 00:34:48.214205
446	Update Website	Conducting a survey can give us valuable insights from our users.	draft	77	69	2024-05-24 00:34:48.219945	2024-04-23 00:34:48.224672	2024-04-23 00:34:48.224672
447	Analyze User Data	Refactoring code can improve its readability and efficiency.	pending	31	7	2024-05-25 00:34:48.229614	2024-04-23 00:34:48.234432	2024-04-23 00:34:48.234432
448	Update Website	A clean office is a productive office.	in_progress	6	65	2024-05-26 00:34:48.239641	2024-04-23 00:34:48.244274	2024-04-23 00:34:48.244274
449	Review Sales Report	A compelling presentation can help us win over clients.	pending	2	23	2024-06-08 00:34:48.250434	2024-04-23 00:34:48.256225	2024-04-23 00:34:48.256225
450	Review Sales Report	Documenting our processes can help new team members get up to speed faster.	in_progress	67	28	2024-04-30 00:34:48.262526	2024-04-23 00:34:48.272129	2024-04-23 00:34:48.272129
451	Test New Feature	The website needs to be updated with the latest information about our products.	in_progress	99	7	2024-05-17 00:34:48.280154	2024-04-23 00:34:48.28594	2024-04-23 00:34:48.28594
452	Document Process	Understanding our competitors can help us position our product better.	completed	78	98	2024-05-09 00:34:48.292603	2024-04-23 00:34:48.300068	2024-04-23 00:34:48.300068
453	Clean Office	Fixing bugs is an ongoing task in software development.	in_progress	57	59	2024-06-04 00:34:48.306879	2024-04-23 00:34:48.313599	2024-04-23 00:34:48.313599
454	Launch Product	A compelling presentation can help us win over clients.	pending	3	46	2024-06-12 00:34:48.319766	2024-04-23 00:34:48.326611	2024-04-23 00:34:48.326611
455	Write Blog Post	This task involves a lot of creativity and an eye for design.	in_progress	5	6	2024-05-30 00:34:48.333044	2024-04-23 00:34:48.339106	2024-04-23 00:34:48.339106
456	Review Sales Report	Regular team meetings can help us stay aligned and informed.	completed	57	94	2024-05-19 00:34:48.345354	2024-04-23 00:34:48.353021	2024-04-23 00:34:48.353021
457	Clean Office	Regular team meetings can help us stay aligned and informed.	completed	24	7	2024-04-29 00:34:48.359592	2024-04-23 00:34:48.370209	2024-04-23 00:34:48.370209
458	Train New Hires	Analyzing user data can inform our product development decisions.	in_progress	7	48	2024-05-24 00:34:48.377729	2024-04-23 00:34:48.383259	2024-04-23 00:34:48.383259
459	Test New Feature	Launching a new product is always exciting.	in_progress	17	69	2024-06-20 00:34:48.388471	2024-04-23 00:34:48.393039	2024-04-23 00:34:48.393039
460	Refactor Code	Understanding our competitors can help us position our product better.	in_progress	7	64	2024-06-13 00:34:48.398086	2024-04-23 00:34:48.402701	2024-04-23 00:34:48.402701
461	Launch Product	The website needs to be updated with the latest information about our products.	pending	32	22	2024-04-27 00:34:48.408079	2024-04-23 00:34:48.412378	2024-04-23 00:34:48.412378
462	Write Blog Post	A clean office is a productive office.	pending	84	56	2024-05-06 00:34:48.41752	2024-04-23 00:34:48.421842	2024-04-23 00:34:48.421842
463	Train New Hires	Documenting our processes can help new team members get up to speed faster.	draft	99	71	2024-05-01 00:34:48.426682	2024-04-23 00:34:48.432011	2024-04-23 00:34:48.432011
464	Fix Bugs	Conducting a survey can give us valuable insights from our users.	completed	63	89	2024-05-26 00:34:48.437993	2024-04-23 00:34:48.443594	2024-04-23 00:34:48.443594
465	Design New Logo	Launching a new product is always exciting.	draft	75	11	2024-05-06 00:34:48.449693	2024-04-23 00:34:48.457008	2024-04-23 00:34:48.457008
466	Create Presentation	Fixing bugs is an ongoing task in software development.	completed	33	57	2024-06-20 00:34:48.464049	2024-04-23 00:34:48.473146	2024-04-23 00:34:48.473146
467	Document Process	Improving our SEO can increase our online visibility.	draft	58	33	2024-05-08 00:34:48.480221	2024-04-23 00:34:48.486499	2024-04-23 00:34:48.486499
468	Fix Bugs	Regular team meetings can help us stay aligned and informed.	completed	29	7	2024-05-15 00:34:48.492329	2024-04-23 00:34:48.499247	2024-04-23 00:34:48.499247
469	Create Presentation	Conducting a survey can give us valuable insights from our users.	pending	49	86	2024-05-17 00:34:48.506204	2024-04-23 00:34:48.512502	2024-04-23 00:34:48.512502
470	Organize Team Meeting	Conducting a survey can give us valuable insights from our users.	in_progress	66	94	2024-06-07 00:34:48.518934	2024-04-23 00:34:48.525414	2024-04-23 00:34:48.525414
471	Launch Product	Refactoring code can improve its readability and efficiency.	pending	39	19	2024-05-13 00:34:48.531667	2024-04-23 00:34:48.538168	2024-04-23 00:34:48.538168
472	Refactor Code	This task involves a lot of creativity and an eye for design.	in_progress	17	55	2024-05-13 00:34:48.54435	2024-04-23 00:34:48.551076	2024-04-23 00:34:48.551076
473	Order Supplies	Refactoring code can improve its readability and efficiency.	draft	33	54	2024-06-16 00:34:48.557086	2024-04-23 00:34:48.565528	2024-04-23 00:34:48.565528
474	Order Supplies	The website needs to be updated with the latest information about our products.	completed	40	40	2024-06-17 00:34:48.575577	2024-04-23 00:34:48.586005	2024-04-23 00:34:48.586005
475	Review Sales Report	Conducting a survey can give us valuable insights from our users.	in_progress	80	44	2024-05-05 00:34:48.591906	2024-04-23 00:34:48.597266	2024-04-23 00:34:48.597266
476	Launch Product	We need to plan a marketing campaign for the upcoming product launch.	draft	19	70	2024-05-18 00:34:48.602956	2024-04-23 00:34:48.60784	2024-04-23 00:34:48.60784
477	Analyze User Data	Analyzing user data can inform our product development decisions.	in_progress	75	73	2024-05-25 00:34:48.6136	2024-04-23 00:34:48.619278	2024-04-23 00:34:48.619278
478	Analyze User Data	The website needs to be updated with the latest information about our products.	completed	79	13	2024-06-11 00:34:48.624775	2024-04-23 00:34:48.629227	2024-04-23 00:34:48.629227
479	Train New Hires	Before we release a new feature, it needs to be thoroughly tested.	in_progress	45	50	2024-06-14 00:34:48.634708	2024-04-23 00:34:48.639274	2024-04-23 00:34:48.639274
480	Clean Office	Refactoring code can improve its readability and efficiency.	draft	69	32	2024-05-05 00:34:48.644096	2024-04-23 00:34:48.648828	2024-04-23 00:34:48.648828
481	Plan Marketing Campaign	We need to order supplies before we run out.	completed	22	93	2024-05-22 00:34:48.654131	2024-04-23 00:34:48.659094	2024-04-23 00:34:48.659094
482	Update Website	Documenting our processes can help new team members get up to speed faster.	draft	50	21	2024-05-23 00:34:48.664529	2024-04-23 00:34:48.669718	2024-04-23 00:34:48.669718
483	Write Blog Post	Conducting a survey can give us valuable insights from our users.	draft	31	37	2024-04-25 00:34:48.674785	2024-04-23 00:34:48.679383	2024-04-23 00:34:48.679383
484	Improve SEO	Regular team meetings can help us stay aligned and informed.	draft	17	57	2024-06-03 00:34:48.684233	2024-04-23 00:34:48.68886	2024-04-23 00:34:48.68886
485	Plan Marketing Campaign	We need to order supplies before we run out.	draft	52	32	2024-05-05 00:34:48.694278	2024-04-23 00:34:48.698731	2024-04-23 00:34:48.698731
486	Plan Marketing Campaign	A clean office is a productive office.	in_progress	75	73	2024-06-20 00:34:48.703497	2024-04-23 00:34:48.707858	2024-04-23 00:34:48.707858
487	Fix Bugs	Preparing a budget helps us plan our finances better.	completed	32	43	2024-05-13 00:34:48.713077	2024-04-23 00:34:48.717147	2024-04-23 00:34:48.717147
488	Improve SEO	The sales report contains important information about our performance.	pending	13	63	2024-06-01 00:34:48.722483	2024-04-23 00:34:48.727358	2024-04-23 00:34:48.727358
489	Write Blog Post	Documenting our processes can help new team members get up to speed faster.	completed	33	80	2024-05-14 00:34:48.732695	2024-04-23 00:34:48.738668	2024-04-23 00:34:48.738668
490	Write Blog Post	We need to plan a marketing campaign for the upcoming product launch.	completed	96	74	2024-06-14 00:34:48.745216	2024-04-23 00:34:48.750796	2024-04-23 00:34:48.750796
491	Improve SEO	Documenting our processes can help new team members get up to speed faster.	completed	68	10	2024-06-01 00:34:48.756517	2024-04-23 00:34:48.76265	2024-04-23 00:34:48.76265
492	Train New Hires	We need to order supplies before we run out.	pending	32	62	2024-06-18 00:34:48.770384	2024-04-23 00:34:48.776319	2024-04-23 00:34:48.776319
493	Launch Product	A compelling presentation can help us win over clients.	pending	71	36	2024-04-29 00:34:48.781919	2024-04-23 00:34:48.787386	2024-04-23 00:34:48.787386
494	Analyze User Data	The website needs to be updated with the latest information about our products.	completed	65	50	2024-05-05 00:34:48.792856	2024-04-23 00:34:48.798624	2024-04-23 00:34:48.798624
495	Clean Office	A well-written blog post can attract a lot of traffic to our website.	completed	57	82	2024-05-22 00:34:48.804428	2024-04-23 00:34:48.811251	2024-04-23 00:34:48.811251
496	Design New Logo	Preparing a budget helps us plan our finances better.	completed	98	4	2024-05-01 00:34:48.817259	2024-04-23 00:34:48.822496	2024-04-23 00:34:48.822496
497	Conduct Survey	We need to plan a marketing campaign for the upcoming product launch.	in_progress	97	30	2024-04-25 00:34:48.82824	2024-04-23 00:34:48.833083	2024-04-23 00:34:48.833083
498	Order Supplies	We need to plan a marketing campaign for the upcoming product launch.	in_progress	30	48	2024-06-17 00:34:48.838219	2024-04-23 00:34:48.845638	2024-04-23 00:34:48.845638
499	Order Supplies	This task involves a lot of creativity and an eye for design.	completed	81	53	2024-06-13 00:34:48.859883	2024-04-23 00:34:48.867788	2024-04-23 00:34:48.867788
500	Organize Team Meeting	Conducting a survey can give us valuable insights from our users.	in_progress	72	23	2024-05-12 00:34:48.877292	2024-04-23 00:34:48.886308	2024-04-23 00:34:48.886308
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: task_track
--

COPY public.users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, first_name, last_name) FROM stdin;
3	user.2@example.com	$2a$12$H.MmQsvcO.I4GAv6Zy1Jpuvf7YumRF32DGtyLUrq/lLvzKnoPywSu	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:24:58.840171	2024-04-23 00:24:58.840171	Jane	Brown
4	user.3@example.com	$2a$12$qN1co/0PuE4RlVs3kII.Du82ZWAKtFpUbBl8qjaODaoTjh/xNhx5u	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:24:59.210407	2024-04-23 00:24:59.210407	Karen	Hernandez
5	user.4@example.com	$2a$12$TLJozV2j5yif86Wxn89rLeqsm2Kh1jvx69LeGZ/y.g3KOtJ8tKq8a	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:24:59.626227	2024-04-23 00:24:59.626227	Linda	Smith
6	user.5@example.com	$2a$12$ZTrmpfhGfIWX.1zQ1UlgbOkHhHWvfvwRzFzAvUATDYCXNaoBs5rEG	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:00.008127	2024-04-23 00:25:00.008127	Sarah	Wilson
7	user.6@example.com	$2a$12$gazvmaihjvQ3kGacusGPPe93Jy4YPxSHO/ZHUBYo1IrGtE6Bj./rq	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:00.379554	2024-04-23 00:25:00.379554	Robert	Johnson
8	user.7@example.com	$2a$12$lS8b.mPN9gTwSN/te7JHpODArRa/wAL5boGvxFnwkMKotL1rXUNq.	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:00.741142	2024-04-23 00:25:00.741142	Jane	Rodriguez
9	user.8@example.com	$2a$12$P8uF9AfEy38on16IIf6JBOKQ.ua/zeEq/Who0doErLl5GnR2KAGLe	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:01.11151	2024-04-23 00:25:01.11151	James	Davis
10	user.9@example.com	$2a$12$bTPUDpAXfXYzS8.tv.wgnuWICeherjPo8Pcv/PahI1mx/8rnsVj8y	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:01.480373	2024-04-23 00:25:01.480373	Dave	Smith
11	user.10@example.com	$2a$12$1nVTaXN9tefilIZkdxncX.zsFikpbwuQsx9LJX7hdUVJLoZ4g1Sfm	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:01.851216	2024-04-23 00:25:01.851216	Margaret	Taylor
12	user.11@example.com	$2a$12$jh6uUnxB7tpUBrIPUbsbeugcnJkAI5OM8CYm1ZGvGgNUVFZkPSNwe	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:02.220356	2024-04-23 00:25:02.220356	Tom	Martinez
13	user.12@example.com	$2a$12$hIpP4AXE9/Nd6qss..4b9uuPtHfsBn5HGALngWZOJtew8jPZtcglO	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:02.58398	2024-04-23 00:25:02.58398	Jerry	Lopez
14	user.13@example.com	$2a$12$LVdPdPJI8mVacO1gqb9i0OWaDAQEuypX5vOrt2L9ojIkW/RMhqzcq	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:02.940848	2024-04-23 00:25:02.940848	Jessica	Jackson
15	user.14@example.com	$2a$12$cOQ.6/ySRqN7J1hzhFdJQ.rWAV0nB3Ulcin27WxAvkMYfeq0ecPvm	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:03.308499	2024-04-23 00:25:03.308499	Lucy	Lopez
16	user.15@example.com	$2a$12$kxYNDRNA3BFQJ2.qGOlsAeS0t7PpPf..nqupDkvt1Kl.uI2oleQ4a	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:03.68794	2024-04-23 00:25:03.68794	Dave	Anderson
17	user.16@example.com	$2a$12$v8AukxknpYHUlbyT3Oc1Vu0IWc40dJsjtfIAnUVQvtnpWot/vvSvi	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:04.042028	2024-04-23 00:25:04.042028	Sarah	Martin
18	user.17@example.com	$2a$12$1zRL.xTUBEvYDa.BTBfPNeZdAvcsmBzQ34EGmEQ7CfjaJbwookot2	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:04.408254	2024-04-23 00:25:04.408254	Karen	Anderson
19	user.18@example.com	$2a$12$BgVnu81vJLXH3zPdjOjlregtf7O9NfBvQdGLOmWDSly3HHPlAblF6	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:04.764435	2024-04-23 00:25:04.764435	James	Miller
20	user.19@example.com	$2a$12$zRZU4RMG8mbW7iWr/bI3MOZIVueRhUoit6oD6uskWJzBAnu82ymne	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:05.131353	2024-04-23 00:25:05.131353	Steve	Lopez
21	user.20@example.com	$2a$12$Enr92fYSIIo1hKRzyIp1Q.yk/QPyTBF8U4jrVbx0ugkwqFcKa/ita	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:05.48932	2024-04-23 00:25:05.48932	Jessica	Jackson
22	user.21@example.com	$2a$12$UvdqBYtFN4rJsK6z7pZ1meDK.0m4bsv.gU5RGacM5PJrfTm.De76e	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:05.841028	2024-04-23 00:25:05.841028	Jane	Garcia
23	user.22@example.com	$2a$12$bfcmDpmM9cTpqvzdOtkj.uwpDGbPjxBN8C42a7orz9YjHO7Gm4FYi	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:06.201958	2024-04-23 00:25:06.201958	Tom	Taylor
24	user.23@example.com	$2a$12$0gZztLzEgVO5OUmKs1R9u.XPwSb2MvE.ynXUBUOKTAV4V.5FaNTwm	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:06.561251	2024-04-23 00:25:06.561251	Margaret	Martin
25	user.24@example.com	$2a$12$tagcch0vlTjRxcdSiV/XgeRK36tEE/9j.T8y/7FkOWVLrAV57W14C	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:06.933264	2024-04-23 00:25:06.933264	Margaret	Wilson
26	user.25@example.com	$2a$12$4twsUUpgZRThUMZ2Q5WA5.qdHDB346XK00CsUCZnbEUonSUw9zG5i	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:07.292307	2024-04-23 00:25:07.292307	Dave	Jackson
27	user.26@example.com	$2a$12$AqYeQ96651D3Cm4gWLkLfuzM3HwhnQQQZkASf6cB0R.uB6UHnDu6W	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:07.66487	2024-04-23 00:25:07.66487	Susan	Jones
28	user.27@example.com	$2a$12$lRngO7i8LcrFRukQouQ6ZeEA0W1Cd62ADmhwunO5YqTChZ2W1S..q	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:08.031863	2024-04-23 00:25:08.031863	Mary	Martinez
29	user.28@example.com	$2a$12$5Nuc1xQNIx/2MK3DgGEJKenMfwiYWiLk./lYDNwjqv7gPGx2cTiwm	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:08.401252	2024-04-23 00:25:08.401252	Jerry	Thomas
30	user.29@example.com	$2a$12$NgjcffVsJP/bRWI/MtqSj.HskwlakP7DBbhooi4s.a5z9H0ZlhRta	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:08.767059	2024-04-23 00:25:08.767059	Jessica	Davis
31	user.30@example.com	$2a$12$9TD1zjlKDTi/oVVs9P0IWubwZwUrQZbjjyJScPXooodphp2K2oRn2	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:09.125703	2024-04-23 00:25:09.125703	Susan	Wilson
32	user.31@example.com	$2a$12$t21KLJRYvzz0G.DeFPIJqOwabQr4qiUtDwGmW9iKfhEGlYHeZOofG	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:09.487026	2024-04-23 00:25:09.487026	Jessica	Miller
33	user.32@example.com	$2a$12$AzwCazt1vSxplLb9PCSr/Ocfcbk/dVkss7m/M5qL5PYiG99OKI2oK	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:09.867256	2024-04-23 00:25:09.867256	Susan	Jones
34	user.33@example.com	$2a$12$sCa51U.LPIX6cyxJcPp.0uJBFrgA7UXzdEbGhtPwI3g8jONQHTeiG	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:10.23493	2024-04-23 00:25:10.23493	Steve	Hernandez
35	user.34@example.com	$2a$12$XeCyvuPifdHzbuhqE3hZJuBFe5TTElhVa/lLIeGPap.emFQPceYw.	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:10.603442	2024-04-23 00:25:10.603442	Richard	Jackson
36	user.35@example.com	$2a$12$IkLR0XNk/yxqinAT9H4moOPjGnd7uAgNd.x1oEvhe4/c/ju/NSj2y	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:10.971886	2024-04-23 00:25:10.971886	Susan	Martin
37	user.36@example.com	$2a$12$DJackn68yAnTvWF9U.YvDeMUNuRsJ/WGrn.pgWiJ/O0ny9dLGLFpC	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:11.342835	2024-04-23 00:25:11.342835	Robert	Johnson
38	user.37@example.com	$2a$12$J8UG3AGI7Z519T62o3/X9eKGG.yfffjiMUF/mLuFe.YOlOpEgGVHm	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:11.698422	2024-04-23 00:25:11.698422	Jessica	Gonzalez
39	user.38@example.com	$2a$12$4o8ujqz.JM5B3CO/W8iZpuSvb.suh7yNePjlTHZEB/CidJQNG6ayO	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:12.082331	2024-04-23 00:25:12.082331	James	Garcia
40	user.39@example.com	$2a$12$SJh4Gpku7nxlr.XfYqFE5OnKtVfu7Hv2Ry4hilpYzld7KMml5p6Pm	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:12.445223	2024-04-23 00:25:12.445223	Patricia	Brown
41	user.40@example.com	$2a$12$OrtpVS8WPzG81543b64OT.42vDEVk1Gl9VgOpEVuoHB3dOTiwSlMS	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:12.815186	2024-04-23 00:25:12.815186	Jane	Johnson
42	user.41@example.com	$2a$12$XzgPYjAS4zg33rwVYIhhVOkCJwh/4uXR56MheblF7/BrjxnK4BkI2	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:13.177308	2024-04-23 00:25:13.177308	Mary	Brown
43	user.42@example.com	$2a$12$Lxdq36HOaWUgz79bbGrIh.UKf3.AGqf/1ryHykvHCsmQ9rYnd7jvi	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:13.543278	2024-04-23 00:25:13.543278	Sarah	Martinez
44	user.43@example.com	$2a$12$Nc3og9/v4vb8ujFCbCdFiuq.iGaSnltkwJpAnsQDrEJnAVqcSuToW	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:13.906939	2024-04-23 00:25:13.906939	Steve	Williams
45	user.44@example.com	$2a$12$rdefPDofgqOyu57gc6wiIeDH7M8GM1GP8.qCUHsU83gX0eAInZNai	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:14.276838	2024-04-23 00:25:14.276838	Robert	Garcia
46	user.45@example.com	$2a$12$ZBcbJ.OL.CMsYrWhkgpVEeqpy.PaX.JLp5EYJygfFPPVdPuSiIXgW	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:14.635254	2024-04-23 00:25:14.635254	John	Martinez
47	user.46@example.com	$2a$12$x1q/TcbTCCE/95jerDdqdOF4sq8AkKtB/GYkPbwCq7IwnLZRtUQfS	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:15.001502	2024-04-23 00:25:15.001502	Jerry	Miller
48	user.47@example.com	$2a$12$gV1AmafKwqHQ3XXNyfJ0QOdHYijvOf8rGmWi.dowM8lTQC3PN6b86	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:15.364709	2024-04-23 00:25:15.364709	James	Hernandez
49	user.48@example.com	$2a$12$xjyVUg7yinVEarOTgWE2I.tPiLHd.JOgWSJVO5AfjIgRwExdwx9mC	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:15.717542	2024-04-23 00:25:15.717542	Richard	Jones
2	user.1@example.com	$2a$12$PZtzEBYfrNmWo78/Rkcet.yEOl3htq6STjWEyAsxJjrH4flrEFsXe	\N	\N	\N	1	2024-04-23 00:35:35.254143	2024-04-23 00:35:35.254143	172.19.0.1	172.19.0.1	2024-04-23 00:24:58.4539	2024-04-23 00:35:35.254406	Lucy	Jones
50	user.49@example.com	$2a$12$Z6l/5QRsKA9x9WuJ7DYqPewePayIM9/DEICDfBeRnijNhihIMMFc6	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:16.089027	2024-04-23 00:25:16.089027	Michael	Anderson
51	user.50@example.com	$2a$12$nJVhpvEv9vVEeALXroYnOeyOETS6aAlD913.IEEoJl59/GXrNntGO	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:16.455141	2024-04-23 00:25:16.455141	Margaret	Miller
52	user.51@example.com	$2a$12$MlP5f3Nds7FofArqGVHxXuRyR03V7KOTHCo9hy9oF.BglNvI.2N3y	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:16.822872	2024-04-23 00:25:16.822872	Mary	Johnson
53	user.52@example.com	$2a$12$eu1qTS57mYpVvE9t8EovreRUFVq5fxypUswcAA9zA/cPQFoWHleD6	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:17.204234	2024-04-23 00:25:17.204234	Charles	Williams
54	user.53@example.com	$2a$12$pNNwAcVALoeskuO1Hqq0seoAj9ak/IHSH4L2yNdqSaNL/Vmku0dRS	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:17.591284	2024-04-23 00:25:17.591284	Linda	Anderson
55	user.54@example.com	$2a$12$Ar7FFKbTUX/eWWbLFk3w9.abV3vMurxJjCsd5HWX5x3gx5lwUAugq	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:17.96202	2024-04-23 00:25:17.96202	Jessica	Williams
56	user.55@example.com	$2a$12$V3RMJfyya1J0QYw7pb7pwe1iaR19ogDS7Shc91KpppHqv7oltQtva	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:18.330921	2024-04-23 00:25:18.330921	Sarah	Johnson
57	user.56@example.com	$2a$12$5bP4lejyMxhUMKQh3NF1C.50GIgw0qLbzlTPRw/bQXSccWFRLY6RG	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:18.696655	2024-04-23 00:25:18.696655	Mary	Miller
58	user.57@example.com	$2a$12$SH83H6VtzOZCauCppHHwQ.eb9glvR23/vDcJKjsEC177GZDMesIny	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:19.056862	2024-04-23 00:25:19.056862	Sarah	Gonzalez
59	user.58@example.com	$2a$12$af/oBkGNHy1xu7ofIrd5.eh04THtcHx0gN1octpwcz.Regppa736m	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:19.422703	2024-04-23 00:25:19.422703	Joseph	Jackson
60	user.59@example.com	$2a$12$COLMqeeVUGToX0xIsxcUw.HEDGirY4eMoIufuuOIh5X.yQOr7hwYy	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:19.782263	2024-04-23 00:25:19.782263	Jane	Davis
61	user.60@example.com	$2a$12$NIy9s6WRixazVMSZD9Uy/eDftv9zKMMExOCmcRZP.63vKlAYWyWOW	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:20.158809	2024-04-23 00:25:20.158809	Tom	Williams
62	user.61@example.com	$2a$12$g/ki8WJzAavucooSGciOruGJ79qeWjIpsp5kZNcoaD55g/JTyKFZu	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:20.528712	2024-04-23 00:25:20.528712	James	Rodriguez
63	user.62@example.com	$2a$12$xd3dNhipEIfFQ.PqIBf/v.LMq5JY4415Z3tgjbyJQoS9vj/vohRYS	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:20.89261	2024-04-23 00:25:20.89261	Linda	Miller
64	user.63@example.com	$2a$12$up7d/dRkUpp2JigY8uX5becVKIYnGuUq1J.wkhgbv326wfe0Y9TqG	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:21.252563	2024-04-23 00:25:21.252563	Lucy	Rodriguez
65	user.64@example.com	$2a$12$72c50E04dfMcxXyJShxdyOawslkpECxaedM2pdYQ/jA6s.x2.kDuy	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:21.619093	2024-04-23 00:25:21.619093	Jerry	Martinez
66	user.65@example.com	$2a$12$gUxe4MMR8M9uefEKisXqFOH6xoj5ZLR2wj5XJ7hU9KS8RQ3Q3zzyy	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:21.989907	2024-04-23 00:25:21.989907	Michael	Johnson
67	user.66@example.com	$2a$12$4C/nZYfeiddcSjzetn2j7eqwoht7LHJ.RVhYprF3A4JWVaZco3iLO	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:22.359207	2024-04-23 00:25:22.359207	James	Johnson
68	user.67@example.com	$2a$12$5b01rwjYPwQRKAZmKauFreXlLFu57iXrWCptWlShCNybbq2suTRAu	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:22.718167	2024-04-23 00:25:22.718167	Sarah	Martinez
69	user.68@example.com	$2a$12$a7cPsGLHYnxawVAYgazkHuGnRjE3kercFAfnriaA5CW7qiI6sEzJ.	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:23.07233	2024-04-23 00:25:23.07233	John	Hernandez
70	user.69@example.com	$2a$12$8WvxSntEmH1TKR0WDGbkaekyvL1PA2yzqzlg7YVnP.ft/x2N8hhZm	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:23.438617	2024-04-23 00:25:23.438617	Patricia	Williams
71	user.70@example.com	$2a$12$dsffYJLSJETRjV240znzt.RxtIkrDC2vCXh2Zv20iKR3q7B/EypDS	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:23.7985	2024-04-23 00:25:23.7985	Mary	Rodriguez
72	user.71@example.com	$2a$12$rrDAWXzegyWm6mNALhFeXO5JNVMOcuPZ.GYraIhd8pZ6wVvVRQDqy	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:24.158284	2024-04-23 00:25:24.158284	Joseph	Rodriguez
73	user.72@example.com	$2a$12$5AcDQ7fUkroVox1K2O4MT.nMD9ldvBBEfzgJeIgSdMQdw9FaPArRu	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:24.522157	2024-04-23 00:25:24.522157	Sarah	Brown
74	user.73@example.com	$2a$12$6HN1SHmYweGJaQyR0Pmsnu61yNQOvuECxmiupOX51ERoJJXPEb5re	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:24.883508	2024-04-23 00:25:24.883508	Linda	Johnson
75	user.74@example.com	$2a$12$Hf0bMLzXNS/BmzeuW1/qIeVacHs8MeEhta5jJ.jylrber2TFh.SQa	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:25.243887	2024-04-23 00:25:25.243887	Susan	Miller
76	user.75@example.com	$2a$12$ifSsy2Rz92hhvL7WFJDrduzsMb95VExv8Wzl9NvannDtFyDx5NMYm	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:25.615981	2024-04-23 00:25:25.615981	Karen	Martin
77	user.76@example.com	$2a$12$qe.TJY3r3myIPVm8naxwKeK2zRrfvfnPSmKTWHdhkLX2VXA8FOZRm	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:25.978838	2024-04-23 00:25:25.978838	Jerry	Anderson
78	user.77@example.com	$2a$12$k.hZJ.xttL.w4XBhxKWEfeXnXwCJ/n19hUZo6B1rDBc5ZnUCj9Oie	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:26.351919	2024-04-23 00:25:26.351919	Charles	Rodriguez
79	user.78@example.com	$2a$12$JEJClFCZbq4ni.NZB5YxZ.4tR87yT58ls7vU56kOsNG5eCv0XCZ2q	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:26.71486	2024-04-23 00:25:26.71486	Tom	Jackson
80	user.79@example.com	$2a$12$ATjqmZMLuElN4RF808/0POmWwbSRRv5JrgyASpj1syocgN0NMOv46	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:27.084486	2024-04-23 00:25:27.084486	Joseph	Miller
81	user.80@example.com	$2a$12$Bp0jv2GZiFXXpbCl5LqHheWpBQdI1BhFio4IuAEqGcJMCWOf.PNEK	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:27.446399	2024-04-23 00:25:27.446399	Jessica	Taylor
82	user.81@example.com	$2a$12$ey5bLHyLQNIKQSTDU7gomux7/.wvgYbxaqAvDVwimCR.DN2E5JZmC	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:27.822778	2024-04-23 00:25:27.822778	Robert	Taylor
83	user.82@example.com	$2a$12$ubZlVTDOVJtTI7VRnlYIVewcfyDBtvHe19RnLcFJVKl7rn16YHVES	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:28.194898	2024-04-23 00:25:28.194898	Dave	Brown
84	user.83@example.com	$2a$12$tk9u08njXyEo0ANP.op2qe/CaPxSxSKKqdk3DJwDF26KEZoVhiKKe	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:28.564398	2024-04-23 00:25:28.564398	Robert	Williams
85	user.84@example.com	$2a$12$16Kmgw0bS3rdleTyfMzMA.zs8UX3rw4LLJ.j8kJyUA04hHB6ch8vG	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:28.928793	2024-04-23 00:25:28.928793	Jerry	Brown
86	user.85@example.com	$2a$12$Ohk2ABbOYEV1OnrZqxA5z.HZJ7F7sUFCSW.c3V2hIyvqws3xuJEIe	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:29.289706	2024-04-23 00:25:29.289706	Joseph	Gonzalez
87	user.86@example.com	$2a$12$N6Diw8409FfjVTkrUDG5ee1tE9Fcpi4Ukm8C4aT82wYNE9tFXSXlK	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:29.658119	2024-04-23 00:25:29.658119	Joseph	Lopez
88	user.87@example.com	$2a$12$uALwoL4hJu/Ydtb7bwNVI.yaM/NTN/foXrBy8pQZF7SfpyAhNfe2C	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:30.031337	2024-04-23 00:25:30.031337	John	Martinez
89	user.88@example.com	$2a$12$b0n2InU07m1upFp0DCi0ouLYqjjAo5dkC3Qk/SDQF6SVLCLH8bleC	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:30.402294	2024-04-23 00:25:30.402294	Margaret	Taylor
90	user.89@example.com	$2a$12$a9cvvCUzfcHNO.8.Q01hv.BoelUIQ8p6LPFVUNmyyuTcd4n9kBSm6	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:30.763268	2024-04-23 00:25:30.763268	Tom	Thomas
91	user.90@example.com	$2a$12$UZzOSQ1OCBZRK3wuGYJLA.aWAY4KLAvTw.47gsl.4yNixhSShhvZ2	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:31.132115	2024-04-23 00:25:31.132115	Linda	Moore
92	user.91@example.com	$2a$12$YzoZ6KRjexWidHBHFJptoexCB6T0NbqdYFJ7UASu21Rl5RFClboAC	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:31.501545	2024-04-23 00:25:31.501545	Dave	Garcia
93	user.92@example.com	$2a$12$syjkhEqoQgNSvVUTt.4bvOJmd0P07u6iPUGJWvQIRqydxgcPj4X.S	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:31.866556	2024-04-23 00:25:31.866556	Robert	Brown
94	user.93@example.com	$2a$12$TPNRDUh9Zs052H.p9wcL8OWIRKbtRa3tGqoNLoWl/zygBxQ1dQc0u	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:32.232859	2024-04-23 00:25:32.232859	Dave	Hernandez
95	user.94@example.com	$2a$12$9T.n1ojGZUldRcuh8qtuDuRFETeseLfIh2Ic8x6PdhDcWEbuCRh3y	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:32.600882	2024-04-23 00:25:32.600882	Karen	Garcia
96	user.95@example.com	$2a$12$m50i0U42sLUYtlbGvv0bQeA5KQQRLU5HdcGW5B2NU8rHhz9jjVcbS	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:32.959352	2024-04-23 00:25:32.959352	Jane	Gonzalez
97	user.96@example.com	$2a$12$mnBwZr2wf3Eolbn8Mh2l8..iOyfNGjavALNmPE4/LP0IJq0NwWVHO	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:33.319023	2024-04-23 00:25:33.319023	Jessica	Hernandez
98	user.97@example.com	$2a$12$lCe9zAFOWLiG/FUqZjG6q.GqqFAju3uNDSby1SEZ79Ysjz/iQo3Vy	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:33.680832	2024-04-23 00:25:33.680832	Michael	Hernandez
99	user.98@example.com	$2a$12$LcFh14eRR8UPCc5f26b5zObCXoDSvegvwDIyGDusY8XZzbSxE/1s.	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:34.036621	2024-04-23 00:25:34.036621	Charles	Taylor
100	user.99@example.com	$2a$12$PEeR6O1Du5AhG1I5Oxv8DObiA2wL7Og3HgSYMwrVxv1Bditk.qLLK	\N	\N	\N	0	\N	\N	\N	\N	2024-04-23 00:25:34.40892	2024-04-23 00:25:34.40892	Tom	Martin
1	user.0@example.com	$2a$12$EuspgKRkdcFjbVjkiE2V3ueEMJ9OabRQ.KZkvELYvDvPwby9vQY8i	\N	\N	\N	1	2024-04-23 00:26:22.394351	2024-04-23 00:26:22.394351	172.19.0.1	172.19.0.1	2024-04-23 00:24:58.087244	2024-04-23 00:26:22.395002	Margaret	Anderson
\.


--
-- Name: tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: task_track
--

SELECT pg_catalog.setval('public.tasks_id_seq', 500, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: task_track
--

SELECT pg_catalog.setval('public.users_id_seq', 100, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: task_track
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: task_track
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: tasks tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: task_track
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: task_track
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_tasks_on_assigned_to_id; Type: INDEX; Schema: public; Owner: task_track
--

CREATE INDEX index_tasks_on_assigned_to_id ON public.tasks USING btree (assigned_to_id);


--
-- Name: index_tasks_on_created_by_id; Type: INDEX; Schema: public; Owner: task_track
--

CREATE INDEX index_tasks_on_created_by_id ON public.tasks USING btree (created_by_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: task_track
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_first_name_and_last_name; Type: INDEX; Schema: public; Owner: task_track
--

CREATE INDEX index_users_on_first_name_and_last_name ON public.users USING btree (first_name, last_name);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: task_track
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: tasks fk_rails_781b907909; Type: FK CONSTRAINT; Schema: public; Owner: task_track
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT fk_rails_781b907909 FOREIGN KEY (assigned_to_id) REFERENCES public.users(id);


--
-- Name: tasks fk_rails_a362a150d3; Type: FK CONSTRAINT; Schema: public; Owner: task_track
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT fk_rails_a362a150d3 FOREIGN KEY (created_by_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

