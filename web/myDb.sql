--
-- PostgreSQL database dump
--

-- Dumped from database version 10.3 (Ubuntu 10.3-1.pgdg16.04+1)
-- Dumped by pg_dump version 10.4 (Ubuntu 10.4-1.pgdg16.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: chatuser; Type: TABLE; Schema: public; Owner: ozumxghmiajgmg
--

CREATE TABLE public.chatuser (
    userid integer NOT NULL,
    cookie integer NOT NULL,
    nickname character varying(255) NOT NULL,
    ts timestamp without time zone
);


ALTER TABLE public.chatuser OWNER TO ozumxghmiajgmg;

--
-- Name: chatuser_userid_seq; Type: SEQUENCE; Schema: public; Owner: ozumxghmiajgmg
--

CREATE SEQUENCE public.chatuser_userid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chatuser_userid_seq OWNER TO ozumxghmiajgmg;

--
-- Name: chatuser_userid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ozumxghmiajgmg
--

ALTER SEQUENCE public.chatuser_userid_seq OWNED BY public.chatuser.userid;


--
-- Name: message; Type: TABLE; Schema: public; Owner: ozumxghmiajgmg
--

CREATE TABLE public.message (
    messageid integer NOT NULL,
    creatorid integer NOT NULL,
    content text,
    likedby integer[],
    ts timestamp without time zone
);


ALTER TABLE public.message OWNER TO ozumxghmiajgmg;

--
-- Name: message_messageid_seq; Type: SEQUENCE; Schema: public; Owner: ozumxghmiajgmg
--

CREATE SEQUENCE public.message_messageid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.message_messageid_seq OWNER TO ozumxghmiajgmg;

--
-- Name: message_messageid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ozumxghmiajgmg
--

ALTER SEQUENCE public.message_messageid_seq OWNED BY public.message.messageid;


--
-- Name: chatuser userid; Type: DEFAULT; Schema: public; Owner: ozumxghmiajgmg
--

ALTER TABLE ONLY public.chatuser ALTER COLUMN userid SET DEFAULT nextval('public.chatuser_userid_seq'::regclass);


--
-- Name: message messageid; Type: DEFAULT; Schema: public; Owner: ozumxghmiajgmg
--

ALTER TABLE ONLY public.message ALTER COLUMN messageid SET DEFAULT nextval('public.message_messageid_seq'::regclass);


--
-- Data for Name: chatuser; Type: TABLE DATA; Schema: public; Owner: ozumxghmiajgmg
--

COPY public.chatuser (userid, cookie, nickname, ts) FROM stdin;
\.


--
-- Data for Name: message; Type: TABLE DATA; Schema: public; Owner: ozumxghmiajgmg
--

COPY public.message (messageid, creatorid, content, likedby, ts) FROM stdin;
\.


--
-- Name: chatuser_userid_seq; Type: SEQUENCE SET; Schema: public; Owner: ozumxghmiajgmg
--

SELECT pg_catalog.setval('public.chatuser_userid_seq', 1, false);


--
-- Name: message_messageid_seq; Type: SEQUENCE SET; Schema: public; Owner: ozumxghmiajgmg
--

SELECT pg_catalog.setval('public.message_messageid_seq', 1, false);


--
-- Name: chatuser chatuser_nickname_key; Type: CONSTRAINT; Schema: public; Owner: ozumxghmiajgmg
--

ALTER TABLE ONLY public.chatuser
    ADD CONSTRAINT chatuser_nickname_key UNIQUE (nickname);


--
-- Name: chatuser chatuser_pkey; Type: CONSTRAINT; Schema: public; Owner: ozumxghmiajgmg
--

ALTER TABLE ONLY public.chatuser
    ADD CONSTRAINT chatuser_pkey PRIMARY KEY (userid);


--
-- Name: message message_pkey; Type: CONSTRAINT; Schema: public; Owner: ozumxghmiajgmg
--

ALTER TABLE ONLY public.message
    ADD CONSTRAINT message_pkey PRIMARY KEY (messageid);


--
-- Name: message message_creatorid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ozumxghmiajgmg
--

ALTER TABLE ONLY public.message
    ADD CONSTRAINT message_creatorid_fkey FOREIGN KEY (creatorid) REFERENCES public.chatuser(userid);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: ozumxghmiajgmg
--

REVOKE ALL ON SCHEMA public FROM postgres;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO ozumxghmiajgmg;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: LANGUAGE plpgsql; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON LANGUAGE plpgsql TO ozumxghmiajgmg;


--
-- PostgreSQL database dump complete
--

