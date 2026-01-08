--
-- PostgreSQL database dump
--

\restrict fXfnlJSPGiC6SZhHN4B54AXS8E65EtEA77C1DsqV83dFhuP9huR2qU8PpO6sK7f

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

-- Started on 2026-01-08 10:11:32

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 5039 (class 0 OID 16420)
-- Dependencies: 224
-- Data for Name: bugs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bugs (bug_id, title, description, priority, status, created_at, updated_at, resolved_at, assigned_to, project_id) FROM stdin;
1	Login button not working	Clicking login does nothing	high	open	2026-01-08 09:51:45.451784-08	2026-01-08 09:51:45.451784-08	\N	2	1
2	Crash on startup	App crashes on Android 14	critical	in_progress	2026-01-08 09:51:45.451784-08	2026-01-08 09:51:45.451784-08	\N	2	1
3	Typo on homepage	Misspelled word on hero section	low	open	2026-01-08 09:51:45.451784-08	2026-01-08 09:51:45.451784-08	\N	1	2
\.


--
-- TOC entry 5037 (class 0 OID 16406)
-- Dependencies: 222
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.projects (project_id, project_name, status) FROM stdin;
1	Mobile App	active
2	Website Redesign	active
\.


--
-- TOC entry 5035 (class 0 OID 16390)
-- Dependencies: 220
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_id, name, email, role) FROM stdin;
1	James Jakubczyk	james@test.com	tester
2	Alice Developer	alice@dev.com	developer
3	Bob Manager	bob@company.com	manager
\.


--
-- TOC entry 5048 (class 0 OID 0)
-- Dependencies: 223
-- Name: bugs_bug_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bugs_bug_id_seq', 3, true);


--
-- TOC entry 5049 (class 0 OID 0)
-- Dependencies: 221
-- Name: projects_project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.projects_project_id_seq', 2, true);


--
-- TOC entry 5050 (class 0 OID 0)
-- Dependencies: 219
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_id_seq', 3, true);


-- Completed on 2026-01-08 10:11:32

--
-- PostgreSQL database dump complete
--

\unrestrict fXfnlJSPGiC6SZhHN4B54AXS8E65EtEA77C1DsqV83dFhuP9huR2qU8PpO6sK7f

