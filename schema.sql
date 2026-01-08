--
-- PostgreSQL database dump
--

\restrict hiifTnPJkiPJEy7Gm7U1qxWpJlbJd4q7BPhmwtukT18HcrBu93vHjcAeGQz3hYj

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

-- Started on 2026-01-08 10:00:31

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 224 (class 1259 OID 16420)
-- Name: bugs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bugs (
    bug_id integer NOT NULL,
    title text NOT NULL,
    description text,
    priority text NOT NULL,
    status text DEFAULT 'open'::text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    resolved_at timestamp with time zone,
    assigned_to integer,
    project_id integer,
    CONSTRAINT bugs_priority_check CHECK ((priority = ANY (ARRAY['low'::text, 'medium'::text, 'high'::text, 'critical'::text]))),
    CONSTRAINT bugs_status_check CHECK ((status = ANY (ARRAY['open'::text, 'in_progress'::text, 'closed'::text])))
);


ALTER TABLE public.bugs OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16419)
-- Name: bugs_bug_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bugs_bug_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bugs_bug_id_seq OWNER TO postgres;

--
-- TOC entry 5039 (class 0 OID 0)
-- Dependencies: 223
-- Name: bugs_bug_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bugs_bug_id_seq OWNED BY public.bugs.bug_id;


--
-- TOC entry 222 (class 1259 OID 16406)
-- Name: projects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.projects (
    project_id integer NOT NULL,
    project_name text NOT NULL,
    status text DEFAULT 'active'::text,
    CONSTRAINT projects_status_check CHECK ((status = ANY (ARRAY['active'::text, 'completed'::text])))
);


ALTER TABLE public.projects OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16405)
-- Name: projects_project_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.projects_project_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.projects_project_id_seq OWNER TO postgres;

--
-- TOC entry 5040 (class 0 OID 0)
-- Dependencies: 221
-- Name: projects_project_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.projects_project_id_seq OWNED BY public.projects.project_id;


--
-- TOC entry 220 (class 1259 OID 16390)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    role text,
    CONSTRAINT users_role_check CHECK ((role = ANY (ARRAY['tester'::text, 'developer'::text, 'manager'::text])))
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16389)
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_user_id_seq OWNER TO postgres;

--
-- TOC entry 5041 (class 0 OID 0)
-- Dependencies: 219
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- TOC entry 4869 (class 2604 OID 16423)
-- Name: bugs bug_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bugs ALTER COLUMN bug_id SET DEFAULT nextval('public.bugs_bug_id_seq'::regclass);


--
-- TOC entry 4867 (class 2604 OID 16409)
-- Name: projects project_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects ALTER COLUMN project_id SET DEFAULT nextval('public.projects_project_id_seq'::regclass);


--
-- TOC entry 4866 (class 2604 OID 16393)
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- TOC entry 4884 (class 2606 OID 16437)
-- Name: bugs bugs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bugs
    ADD CONSTRAINT bugs_pkey PRIMARY KEY (bug_id);


--
-- TOC entry 4882 (class 2606 OID 16417)
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (project_id);


--
-- TOC entry 4878 (class 2606 OID 16403)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 4880 (class 2606 OID 16401)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- TOC entry 4885 (class 2606 OID 16438)
-- Name: bugs bugs_assigned_to_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bugs
    ADD CONSTRAINT bugs_assigned_to_fkey FOREIGN KEY (assigned_to) REFERENCES public.users(user_id);


--
-- TOC entry 4886 (class 2606 OID 16443)
-- Name: bugs bugs_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bugs
    ADD CONSTRAINT bugs_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(project_id);


-- Completed on 2026-01-08 10:00:31

--
-- PostgreSQL database dump complete
--

\unrestrict hiifTnPJkiPJEy7Gm7U1qxWpJlbJd4q7BPhmwtukT18HcrBu93vHjcAeGQz3hYj

