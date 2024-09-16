--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer DEFAULT 0 NOT NULL,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (21, 'user_1726507983908', 2, 436);
INSERT INTO public.users VALUES (19, 'user_1726507942860', 3, 7);
INSERT INTO public.users VALUES (20, 'user_1726507983909', 5, 555);
INSERT INTO public.users VALUES (45, 'user_1726508441350', 2, 346);
INSERT INTO public.users VALUES (23, 'user_1726507991973', 2, 56);
INSERT INTO public.users VALUES (22, 'user_1726507991974', 5, 22);
INSERT INTO public.users VALUES (44, 'user_1726508441351', 5, 402);
INSERT INTO public.users VALUES (25, 'user_1726508002683', 2, 438);
INSERT INTO public.users VALUES (24, 'user_1726508002684', 5, 295);
INSERT INTO public.users VALUES (27, 'user_1726508014066', 2, 70);
INSERT INTO public.users VALUES (47, 'user_1726508493048', 2, 704);
INSERT INTO public.users VALUES (71, 'user_1726508949925', 2, 707);
INSERT INTO public.users VALUES (26, 'user_1726508014067', 5, 15);
INSERT INTO public.users VALUES (29, 'user_1726508016764', 2, 147);
INSERT INTO public.users VALUES (46, 'user_1726508493049', 5, 93);
INSERT INTO public.users VALUES (28, 'user_1726508016765', 5, 468);
INSERT INTO public.users VALUES (31, 'user_1726508049645', 2, 35);
INSERT INTO public.users VALUES (49, 'user_1726508500181', 2, 662);
INSERT INTO public.users VALUES (30, 'user_1726508049646', 5, 48);
INSERT INTO public.users VALUES (70, 'user_1726508949926', 5, 224);
INSERT INTO public.users VALUES (33, 'user_1726508061209', 2, 455);
INSERT INTO public.users VALUES (48, 'user_1726508500182', 5, 81);
INSERT INTO public.users VALUES (32, 'user_1726508061210', 5, 194);
INSERT INTO public.users VALUES (35, 'user_1726508162033', 2, 88);
INSERT INTO public.users VALUES (34, 'user_1726508162034', 5, 178);
INSERT INTO public.users VALUES (51, 'user_1726508505295', 2, 10);
INSERT INTO public.users VALUES (18, 'user_1726507942861', 5, 195);
INSERT INTO public.users VALUES (37, 'user_1726508168931', 2, 922);
INSERT INTO public.users VALUES (73, 'user_1726508982500', 2, 475);
INSERT INTO public.users VALUES (36, 'user_1726508168932', 5, 5);
INSERT INTO public.users VALUES (50, 'user_1726508505296', 5, 191);
INSERT INTO public.users VALUES (39, 'user_1726508300042', 2, 52);
INSERT INTO public.users VALUES (38, 'user_1726508300043', 5, 105);
INSERT INTO public.users VALUES (41, 'user_1726508429326', 2, 81);
INSERT INTO public.users VALUES (53, 'user_1726508517689', 2, 233);
INSERT INTO public.users VALUES (40, 'user_1726508429327', 5, 50);
INSERT INTO public.users VALUES (72, 'user_1726508982501', 5, 103);
INSERT INTO public.users VALUES (43, 'user_1726508432628', 2, 723);
INSERT INTO public.users VALUES (52, 'user_1726508517690', 5, 153);
INSERT INTO public.users VALUES (42, 'user_1726508432629', 5, 355);
INSERT INTO public.users VALUES (55, 'user_1726508526163', 2, 233);
INSERT INTO public.users VALUES (54, 'user_1726508526164', 5, 696);
INSERT INTO public.users VALUES (75, 'user_1726508986441', 2, 141);
INSERT INTO public.users VALUES (57, 'user_1726508531379', 2, 641);
INSERT INTO public.users VALUES (56, 'user_1726508531380', 5, 288);
INSERT INTO public.users VALUES (74, 'user_1726508986442', 5, 99);
INSERT INTO public.users VALUES (59, 'user_1726508536659', 2, 94);
INSERT INTO public.users VALUES (58, 'user_1726508536660', 5, 239);
INSERT INTO public.users VALUES (61, 'user_1726508562228', 2, 465);
INSERT INTO public.users VALUES (77, 'user_1726508993071', 2, 14);
INSERT INTO public.users VALUES (60, 'user_1726508562229', 5, 263);
INSERT INTO public.users VALUES (63, 'user_1726508717439', 2, 192);
INSERT INTO public.users VALUES (76, 'user_1726508993072', 5, 21);
INSERT INTO public.users VALUES (62, 'user_1726508717440', 5, 88);
INSERT INTO public.users VALUES (65, 'user_1726508765332', 2, 330);
INSERT INTO public.users VALUES (79, 'user_1726509211272', 2, 409);
INSERT INTO public.users VALUES (64, 'user_1726508765333', 5, 104);
INSERT INTO public.users VALUES (67, 'user_1726508784027', 2, 138);
INSERT INTO public.users VALUES (78, 'user_1726509211273', 5, 14);
INSERT INTO public.users VALUES (66, 'user_1726508784028', 5, 177);
INSERT INTO public.users VALUES (69, 'user_1726508788498', 2, 529);
INSERT INTO public.users VALUES (68, 'user_1726508788499', 5, 161);
INSERT INTO public.users VALUES (81, 'user_1726509303716', 2, 44);
INSERT INTO public.users VALUES (80, 'user_1726509303717', 5, 124);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 81, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

