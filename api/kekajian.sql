--
-- PostgreSQL database dump
--

-- Dumped from database version 10.3
-- Dumped by pg_dump version 10.3

-- Started on 2018-11-17 16:36:49 WIB

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
-- TOC entry 1 (class 3079 OID 13241)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3217 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- TOC entry 203 (class 1259 OID 19074)
-- Name: keka_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: kekajian_da74bas3
--

CREATE SEQUENCE public.keka_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.keka_jobs_id_seq OWNER TO kekajian_da74bas3;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 204 (class 1259 OID 19076)
-- Name: keka_jobs; Type: TABLE; Schema: public; Owner: kekajian_da74bas3
--

CREATE TABLE public.keka_jobs (
    id bigint DEFAULT nextval('public.keka_jobs_id_seq'::regclass) NOT NULL,
    queue character varying(255) NOT NULL,
    payload text NOT NULL,
    attempts smallint NOT NULL,
    reserved smallint,
    reserved_at integer,
    available_at integer NOT NULL,
    created_at integer NOT NULL
);


ALTER TABLE public.keka_jobs OWNER TO kekajian_da74bas3;

--
-- TOC entry 201 (class 1259 OID 19063)
-- Name: keka_jwt_seq; Type: SEQUENCE; Schema: public; Owner: kekajian_da74bas3
--

CREATE SEQUENCE public.keka_jwt_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
    CYCLE;


ALTER TABLE public.keka_jwt_seq OWNER TO kekajian_da74bas3;

--
-- TOC entry 202 (class 1259 OID 19065)
-- Name: keka_jwt; Type: TABLE; Schema: public; Owner: kekajian_da74bas3
--

CREATE TABLE public.keka_jwt (
    id bigint DEFAULT nextval('public.keka_jwt_seq'::regclass) NOT NULL,
    sub bigint NOT NULL,
    jti text NOT NULL,
    token text,
    exp bigint,
    iat bigint,
    iss text,
    nbf bigint,
    prv text,
    created_at timestamp without time zone,
    appid character varying(20),
    ip_address character varying(15),
    updated_at timestamp without time zone,
    user_agent text
);


ALTER TABLE public.keka_jwt OWNER TO kekajian_da74bas3;

--
-- TOC entry 209 (class 1259 OID 19152)
-- Name: keka_kajian_photos_seq; Type: SEQUENCE; Schema: public; Owner: kekajian_da74bas3
--

CREATE SEQUENCE public.keka_kajian_photos_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
    CYCLE;


ALTER TABLE public.keka_kajian_photos_seq OWNER TO kekajian_da74bas3;

--
-- TOC entry 210 (class 1259 OID 19154)
-- Name: keka_kajian_photos; Type: TABLE; Schema: public; Owner: kekajian_da74bas3
--

CREATE TABLE public.keka_kajian_photos (
    id bigint DEFAULT nextval('public.keka_kajian_photos_seq'::regclass) NOT NULL,
    kajian_id bigint NOT NULL,
    cover smallint NOT NULL,
    photo text,
    created_at timestamp(0) without time zone,
    created_by bigint,
    updated_at timestamp(0) without time zone,
    updated_by bigint,
    deleted_at timestamp(0) without time zone,
    deleted_by bigint,
    last_ip character varying
);


ALTER TABLE public.keka_kajian_photos OWNER TO kekajian_da74bas3;

--
-- TOC entry 211 (class 1259 OID 19182)
-- Name: keka_kajians_seq; Type: SEQUENCE; Schema: public; Owner: kekajian_da74bas3
--

CREATE SEQUENCE public.keka_kajians_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
    CYCLE;


ALTER TABLE public.keka_kajians_seq OWNER TO kekajian_da74bas3;

--
-- TOC entry 207 (class 1259 OID 19133)
-- Name: keka_kajians; Type: TABLE; Schema: public; Owner: kekajian_da74bas3
--

CREATE TABLE public.keka_kajians (
    id bigint DEFAULT nextval('public.keka_kajians_seq'::regclass) NOT NULL,
    tema character varying(255) NOT NULL,
    pemateri character varying(255) NOT NULL,
    kota_id integer NOT NULL,
    tempat text NOT NULL,
    link_maps text,
    tanggal date NOT NULL,
    penyelenggara character varying(70),
    kontak_ikhwan character varying(20),
    kontak_akhwat character varying(20),
    keterangan text,
    link_video_kajian text,
    publish smallint DEFAULT 1 NOT NULL,
    approved_at timestamp without time zone,
    approved_by bigint,
    created_at timestamp without time zone,
    created_by bigint,
    updated_at timestamp without time zone,
    updated_by bigint,
    deleted_at timestamp without time zone,
    deleted_by bigint,
    last_ip character varying(15),
    jam_mulai character varying(50) NOT NULL,
    jam_selesai character varying(50),
    link_video_cover text
);


ALTER TABLE public.keka_kajians OWNER TO kekajian_da74bas3;

--
-- TOC entry 208 (class 1259 OID 19143)
-- Name: keka_kotas; Type: TABLE; Schema: public; Owner: kekajian_da74bas3
--

CREATE TABLE public.keka_kotas (
    id integer NOT NULL,
    provinsi_id character(2) DEFAULT NULL::bpchar NOT NULL,
    nama text NOT NULL,
    jenis_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.keka_kotas OWNER TO kekajian_da74bas3;

--
-- TOC entry 205 (class 1259 OID 19087)
-- Name: keka_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: kekajian_da74bas3
--

CREATE SEQUENCE public.keka_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.keka_migrations_id_seq OWNER TO kekajian_da74bas3;

--
-- TOC entry 206 (class 1259 OID 19089)
-- Name: keka_migrations; Type: TABLE; Schema: public; Owner: kekajian_da74bas3
--

CREATE TABLE public.keka_migrations (
    id integer DEFAULT nextval('public.keka_migrations_id_seq'::regclass) NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.keka_migrations OWNER TO kekajian_da74bas3;

--
-- TOC entry 199 (class 1259 OID 19052)
-- Name: keka_user_activities_seq; Type: SEQUENCE; Schema: public; Owner: kekajian_da74bas3
--

CREATE SEQUENCE public.keka_user_activities_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
    CYCLE;


ALTER TABLE public.keka_user_activities_seq OWNER TO kekajian_da74bas3;

--
-- TOC entry 200 (class 1259 OID 19054)
-- Name: keka_user_activities; Type: TABLE; Schema: public; Owner: kekajian_da74bas3
--

CREATE TABLE public.keka_user_activities (
    id bigint DEFAULT nextval('public.keka_user_activities_seq'::regclass) NOT NULL,
    logs text NOT NULL,
    endpoint text,
    created_at timestamp(0) without time zone,
    created_by bigint,
    updated_at timestamp(0) without time zone,
    updated_by bigint,
    deleted_at timestamp(0) without time zone,
    last_ip character varying
);


ALTER TABLE public.keka_user_activities OWNER TO kekajian_da74bas3;

--
-- TOC entry 196 (class 1259 OID 19017)
-- Name: keka_user_groups; Type: TABLE; Schema: public; Owner: kekajian_da74bas3
--

CREATE TABLE public.keka_user_groups (
    id integer NOT NULL,
    name character varying(35) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE public.keka_user_groups OWNER TO kekajian_da74bas3;

--
-- TOC entry 197 (class 1259 OID 19036)
-- Name: keka_users_id_seq; Type: SEQUENCE; Schema: public; Owner: kekajian_da74bas3
--

CREATE SEQUENCE public.keka_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.keka_users_id_seq OWNER TO kekajian_da74bas3;

--
-- TOC entry 198 (class 1259 OID 19038)
-- Name: keka_users; Type: TABLE; Schema: public; Owner: kekajian_da74bas3
--

CREATE TABLE public.keka_users (
    id integer DEFAULT nextval('public.keka_users_id_seq'::regclass) NOT NULL,
    name character varying(50) NOT NULL,
    email character varying(255) NOT NULL,
    birthplace character varying(50),
    birthdate date,
    address text,
    hp character varying(20),
    password character varying(255) NOT NULL,
    city_id integer,
    jobs character varying(100),
    community character varying(50),
    group_id integer DEFAULT 1 NOT NULL,
    disabled smallint DEFAULT (0)::smallint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    created_by bigint,
    updated_by bigint,
    last_ip character varying(15)
);


ALTER TABLE public.keka_users OWNER TO kekajian_da74bas3;

--
-- TOC entry 3202 (class 0 OID 19076)
-- Dependencies: 204
-- Data for Name: keka_jobs; Type: TABLE DATA; Schema: public; Owner: kekajian_da74bas3
--

INSERT INTO public.keka_jobs (id, queue, payload, attempts, reserved, reserved_at, available_at, created_at) VALUES (5, 'default', '{"displayName":"App\\Jobs\\SendRegisterEmail","job":"Illuminate\\Queue\\CallQueuedHandler@call","maxTries":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"App\\Jobs\\SendRegisterEmail","command":"O:26:\"App\\Jobs\\SendRegisterEmail\":8:{s:7:\"\u0000*\u0000user\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":3:{s:5:\"class\";s:15:\"App\\Models\\User\";s:2:\"id\";i:5;s:10:\"connection\";s:5:\"pgsql\";}s:6:\"\u0000*\u0000job\";N;s:10:\"connection\";N;s:5:\"queue\";N;s:15:\"chainConnection\";N;s:10:\"chainQueue\";N;s:5:\"delay\";N;s:7:\"chained\";a:0:{}}"}}', 0, NULL, NULL, 1540649619, 1540649619);


--
-- TOC entry 3200 (class 0 OID 19065)
-- Dependencies: 202
-- Data for Name: keka_jwt; Type: TABLE DATA; Schema: public; Owner: kekajian_da74bas3
--

INSERT INTO public.keka_jwt (id, sub, jti, token, exp, iat, iss, nbf, prv, created_at, appid, ip_address, updated_at, user_agent) VALUES (1, 5, 'pwysbG3v9csLRtfj', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMTUvYXBpL2xvZ2luIiwiaWF0IjoxNTQwNjUwMzg0LCJleHAiOjE1NDA3MzY3ODQsIm5iZiI6MTU0MDY1MDM4NCwianRpIjoicHd5c2JHM3Y5Y3NMUnRmaiIsInN1YiI6NSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.LnxprAL3aKvRPmW4gDKruQWw0T6qmko2U9yd365Lw7U', 1540736784, 1540650384, 'http://localhost:8015/api/login', 1540650384, '23bd5c8949f600adb39e701c400872db7a5976f7', '2018-10-27 21:26:24', 'mobileapp', '::1', '2018-10-27 21:26:24', 'PostmanRuntime/7.2.0');
INSERT INTO public.keka_jwt (id, sub, jti, token, exp, iat, iss, nbf, prv, created_at, appid, ip_address, updated_at, user_agent) VALUES (2, 5, 'N60qdh16nBnYuhfl', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMTUvYXBpL2xvZ2luIiwiaWF0IjoxNTQwNjUwNDA5LCJleHAiOjE1NDA3MzY4MDksIm5iZiI6MTU0MDY1MDQwOSwianRpIjoiTjYwcWRoMTZuQm5ZdWhmbCIsInN1YiI6NSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.RFqtCxtWZ-kd6TeYGzy2JHGFVtmPXsKW4zQel2mNHNc', 1540736809, 1540650409, 'http://localhost:8015/api/login', 1540650409, '23bd5c8949f600adb39e701c400872db7a5976f7', '2018-10-27 21:26:49', 'mobileapp', '::1', '2018-10-27 21:26:49', 'PostmanRuntime/7.2.0');
INSERT INTO public.keka_jwt (id, sub, jti, token, exp, iat, iss, nbf, prv, created_at, appid, ip_address, updated_at, user_agent) VALUES (3, 5, 'FOb8IIDUhDPuMkHX', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMTUvYXBpL2xvZ2luIiwiaWF0IjoxNTQwNjUwNDg4LCJleHAiOjE1NDA3MzY4ODgsIm5iZiI6MTU0MDY1MDQ4OCwianRpIjoiRk9iOElJRFVoRFB1TWtIWCIsInN1YiI6NSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.fu_OwjhYh6eD5w-w_n6_4atJQkN5v9PtTU7jyPu5ai8', 1540736888, 1540650488, 'http://localhost:8015/api/login', 1540650488, '23bd5c8949f600adb39e701c400872db7a5976f7', '2018-10-27 21:28:08', 'mobileapp', '::1', '2018-10-27 21:28:08', 'PostmanRuntime/7.2.0');
INSERT INTO public.keka_jwt (id, sub, jti, token, exp, iat, iss, nbf, prv, created_at, appid, ip_address, updated_at, user_agent) VALUES (4, 5, 'TlFhXXTFhFXJgPdT', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMTUvYXBpL2xvZ2luIiwiaWF0IjoxNTQwNjUwNTI4LCJleHAiOjE1NDA3MzY5MjgsIm5iZiI6MTU0MDY1MDUyOCwianRpIjoiVGxGaFhYVEZoRlhKZ1BkVCIsInN1YiI6NSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.cTmnKbFLOQ-YCIdCJzjRieMsPp2JuL4BONhsDKC6pTE', 1540736928, 1540650528, 'http://localhost:8015/api/login', 1540650528, '23bd5c8949f600adb39e701c400872db7a5976f7', '2018-10-27 21:28:48', 'mobileapp', '::1', '2018-10-27 21:28:48', 'PostmanRuntime/7.2.0');
INSERT INTO public.keka_jwt (id, sub, jti, token, exp, iat, iss, nbf, prv, created_at, appid, ip_address, updated_at, user_agent) VALUES (5, 5, 'KpAdNiiM8NuV66rs', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMTUvYXBpL2xvZ2luIiwiaWF0IjoxNTQwNjUwNTU2LCJleHAiOjE1NDA3MzY5NTYsIm5iZiI6MTU0MDY1MDU1NiwianRpIjoiS3BBZE5paU04TnVWNjZycyIsInN1YiI6NSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.syt1bOXo3I8uvWuCL-2rFgddEkAVgGqsNkLuux6LU-0', 1540736956, 1540650556, 'http://localhost:8015/api/login', 1540650556, '23bd5c8949f600adb39e701c400872db7a5976f7', '2018-10-27 21:29:16', 'mobileapp', '::1', '2018-10-27 21:29:16', 'PostmanRuntime/7.2.0');
INSERT INTO public.keka_jwt (id, sub, jti, token, exp, iat, iss, nbf, prv, created_at, appid, ip_address, updated_at, user_agent) VALUES (6, 5, 'jwT1pF67qOlk00l9', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMTUvYXBpL2xvZ2luIiwiaWF0IjoxNTQwNjUwNTkzLCJleHAiOjE1NDA3MzY5OTMsIm5iZiI6MTU0MDY1MDU5MywianRpIjoiandUMXBGNjdxT2xrMDBsOSIsInN1YiI6NSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.i0LdyF_woWd-R1Yepv0zpWncL8k6FqT9V-uFnET7svg', 1540736993, 1540650593, 'http://localhost:8015/api/login', 1540650593, '23bd5c8949f600adb39e701c400872db7a5976f7', '2018-10-27 21:29:53', 'mobileapp', '::1', '2018-10-27 21:29:53', 'PostmanRuntime/7.2.0');
INSERT INTO public.keka_jwt (id, sub, jti, token, exp, iat, iss, nbf, prv, created_at, appid, ip_address, updated_at, user_agent) VALUES (7, 5, 'zcS3KWaQZE9pE3S7', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMTUvYXBpL2xvZ2luIiwiaWF0IjoxNTQwNjUwNjY0LCJleHAiOjE1NDA3MzcwNjQsIm5iZiI6MTU0MDY1MDY2NCwianRpIjoiemNTM0tXYVFaRTlwRTNTNyIsInN1YiI6NSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.I_ln6szLvyIq0s12AG4YA_wL0jrBkZNKpH-dn7Luc5k', 1540737064, 1540650664, 'http://localhost:8015/api/login', 1540650664, '23bd5c8949f600adb39e701c400872db7a5976f7', '2018-10-27 21:31:04', 'mobileapp', '::1', '2018-10-27 21:31:04', 'PostmanRuntime/7.2.0');
INSERT INTO public.keka_jwt (id, sub, jti, token, exp, iat, iss, nbf, prv, created_at, appid, ip_address, updated_at, user_agent) VALUES (11, 5, 'eytFWzYSm7m06SEr', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMTUvYXBpL2xvZ2luIiwiaWF0IjoxNTQwNjU1MTQwLCJleHAiOjE1NDA3NDE1NDAsIm5iZiI6MTU0MDY1NTE0MCwianRpIjoiZXl0Rld6WVNtN20wNlNFciIsInN1YiI6NSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.I2VKuPmJejbPjJQoo55KbUyxDIy4XmY3CJBPSc75xBU', 1540741540, 1540655140, 'http://localhost:8015/api/login', 1540655140, '23bd5c8949f600adb39e701c400872db7a5976f7', '2018-10-27 22:45:40', 'keKajian', '::1', '2018-10-27 22:45:40', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36');
INSERT INTO public.keka_jwt (id, sub, jti, token, exp, iat, iss, nbf, prv, created_at, appid, ip_address, updated_at, user_agent) VALUES (12, 5, 'nDkjmtoAqJUXwaCE', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMTUvYXBpL2xvZ2luIiwiaWF0IjoxNTQwNjgzMTExLCJleHAiOjE1NDA3Njk1MTEsIm5iZiI6MTU0MDY4MzExMSwianRpIjoibkRram10b0FxSlVYd2FDRSIsInN1YiI6NSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.N1KTwnAbXyr1-r3boCCuQHR3uR8OiVWAgaBImCj3-fQ', 1540769511, 1540683111, 'http://localhost:8015/api/login', 1540683111, '23bd5c8949f600adb39e701c400872db7a5976f7', '2018-10-28 06:31:51', 'keKajian', '::1', '2018-10-28 06:31:51', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36');
INSERT INTO public.keka_jwt (id, sub, jti, token, exp, iat, iss, nbf, prv, created_at, appid, ip_address, updated_at, user_agent) VALUES (13, 5, 'ol2sjEaShkNbgOqd', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMTUvYXBpL2xvZ2luIiwiaWF0IjoxNTQwNjk5NTYxLCJleHAiOjE1NDA3ODU5NjEsIm5iZiI6MTU0MDY5OTU2MSwianRpIjoib2wyc2pFYVNoa05iZ09xZCIsInN1YiI6NSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.pKNGaMZI-p-n4_UqCKVZ78Q_7dulOpDbFUsEtmIrSi8', 1540785961, 1540699561, 'http://localhost:8015/api/login', 1540699561, '23bd5c8949f600adb39e701c400872db7a5976f7', '2018-10-28 11:06:01', 'keKajian', '::1', '2018-10-28 11:06:01', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36');
INSERT INTO public.keka_jwt (id, sub, jti, token, exp, iat, iss, nbf, prv, created_at, appid, ip_address, updated_at, user_agent) VALUES (14, 5, 'fMl3kH7dhRYHWZ1N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMTUvYXBpL2xvZ2luIiwiaWF0IjoxNTQwNzA1OTQwLCJleHAiOjE1NDA3OTIzNDAsIm5iZiI6MTU0MDcwNTk0MCwianRpIjoiZk1sM2tIN2RoUllIV1oxTiIsInN1YiI6NSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.naQOwSZiR6AwMK7bjpQvioawVZcj8YmGUgJbVH_RMtw', 1540792340, 1540705940, 'http://localhost:8015/api/login', 1540705940, '23bd5c8949f600adb39e701c400872db7a5976f7', '2018-10-28 12:52:20', 'keKajian', '::1', '2018-10-28 12:52:20', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36');
INSERT INTO public.keka_jwt (id, sub, jti, token, exp, iat, iss, nbf, prv, created_at, appid, ip_address, updated_at, user_agent) VALUES (15, 5, 'g7ot2hOkbo3YFzTJ', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMTUvYXBpL2xvZ2luIiwiaWF0IjoxNTQwNzA3MjE3LCJleHAiOjE1NDA3OTM2MTcsIm5iZiI6MTU0MDcwNzIxNywianRpIjoiZzdvdDJoT2tibzNZRnpUSiIsInN1YiI6NSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.mzoyLejMA9x28kmm-PxY9q1jYdKZoBHa7He4qHiGSCM', 1540793617, 1540707217, 'http://localhost:8015/api/login', 1540707217, '23bd5c8949f600adb39e701c400872db7a5976f7', '2018-10-28 13:13:37', 'keKajian', '::1', '2018-10-28 13:13:37', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36');
INSERT INTO public.keka_jwt (id, sub, jti, token, exp, iat, iss, nbf, prv, created_at, appid, ip_address, updated_at, user_agent) VALUES (16, 5, 'KkUKSSe45nRMS1gP', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMTUvYXBpL2xvZ2luIiwiaWF0IjoxNTQwNzA4NDU2LCJleHAiOjE1NDA3OTQ4NTYsIm5iZiI6MTU0MDcwODQ1NiwianRpIjoiS2tVS1NTZTQ1blJNUzFnUCIsInN1YiI6NSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.ZXB35RZXHii6pXzXFiIhN-UkAe7AahIUzkDyQxUUmP0', 1540794856, 1540708456, 'http://localhost:8015/api/login', 1540708456, '23bd5c8949f600adb39e701c400872db7a5976f7', '2018-10-28 13:34:17', 'keKajian', '::1', '2018-10-28 13:34:17', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36');
INSERT INTO public.keka_jwt (id, sub, jti, token, exp, iat, iss, nbf, prv, created_at, appid, ip_address, updated_at, user_agent) VALUES (17, 5, '0KsAcBolifyr8X0C', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMTUvYXBpL2xvZ2luIiwiaWF0IjoxNTQxMjQ1NjE4LCJleHAiOjE1NDEzMzIwMTgsIm5iZiI6MTU0MTI0NTYxOCwianRpIjoiMEtzQWNCb2xpZnlyOFgwQyIsInN1YiI6NSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.rKcwVjwbUnT8WIE3YHnPM7RIaSkfCMg4Iof3juGweD0', 1541332018, 1541245618, 'http://localhost:8015/api/login', 1541245618, '23bd5c8949f600adb39e701c400872db7a5976f7', '2018-11-03 18:46:58', 'keKajian', '::1', '2018-11-03 18:46:58', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36');
INSERT INTO public.keka_jwt (id, sub, jti, token, exp, iat, iss, nbf, prv, created_at, appid, ip_address, updated_at, user_agent) VALUES (18, 5, 'N0jarzJIvZLlbWfT', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMTUvYXBpL2xvZ2luIiwiaWF0IjoxNTQxNjA0OTgwLCJleHAiOjE1NDE2OTEzODAsIm5iZiI6MTU0MTYwNDk4MCwianRpIjoiTjBqYXJ6Skl2WkxsYldmVCIsInN1YiI6NSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.ku8FZg3FlDawIHs6imshnl3qXzvSzFM6rimL6DUuL28', 1541691380, 1541604980, 'http://localhost:8015/api/login', 1541604980, '23bd5c8949f600adb39e701c400872db7a5976f7', '2018-11-07 22:36:20', 'keKajian', '::1', '2018-11-07 22:36:20', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1');
INSERT INTO public.keka_jwt (id, sub, jti, token, exp, iat, iss, nbf, prv, created_at, appid, ip_address, updated_at, user_agent) VALUES (19, 5, 'DZAT57Z0fH4DrkUE', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMTUvYXBpL2xvZ2luIiwiaWF0IjoxNTQxNjA1MDQ3LCJleHAiOjE1NDE2OTE0NDcsIm5iZiI6MTU0MTYwNTA0NywianRpIjoiRFpBVDU3WjBmSDREcmtVRSIsInN1YiI6NSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.xftbkBFsEYq0fQonAKIyXdrF7_su8Mdq7B-2OQ_u3AA', 1541691447, 1541605047, 'http://localhost:8015/api/login', 1541605047, '23bd5c8949f600adb39e701c400872db7a5976f7', '2018-11-07 22:37:27', 'keKajian', '::1', '2018-11-07 22:37:27', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1');
INSERT INTO public.keka_jwt (id, sub, jti, token, exp, iat, iss, nbf, prv, created_at, appid, ip_address, updated_at, user_agent) VALUES (20, 5, 'tIpaWCrxu3wo2zGT', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMTUvYXBpL2xvZ2luIiwiaWF0IjoxNTQxNjA1MzMzLCJleHAiOjE1NDE2OTE3MzMsIm5iZiI6MTU0MTYwNTMzMywianRpIjoidElwYVdDcnh1M3dvMnpHVCIsInN1YiI6NSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.YeTW86gKV4HxLGWz4eHsAuNq3hXlQ8nAR4lQA_wQsaY', 1541691733, 1541605333, 'http://localhost:8015/api/login', 1541605333, '23bd5c8949f600adb39e701c400872db7a5976f7', '2018-11-07 22:42:13', 'keKajian', '::1', '2018-11-07 22:42:13', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1');
INSERT INTO public.keka_jwt (id, sub, jti, token, exp, iat, iss, nbf, prv, created_at, appid, ip_address, updated_at, user_agent) VALUES (21, 5, 'gzpN7vdasZDj9ErQ', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMTUvYXBpL2xvZ2luIiwiaWF0IjoxNTQxNjA1MzUyLCJleHAiOjE1NDE2OTE3NTIsIm5iZiI6MTU0MTYwNTM1MiwianRpIjoiZ3pwTjd2ZGFzWkRqOUVyUSIsInN1YiI6NSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.oBfozpQsj3L45up_maGKnOc_MJ0KcWT41GINeVwcoHw', 1541691752, 1541605352, 'http://localhost:8015/api/login', 1541605352, '23bd5c8949f600adb39e701c400872db7a5976f7', '2018-11-07 22:42:32', 'keKajian', '::1', '2018-11-07 22:42:32', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1');
INSERT INTO public.keka_jwt (id, sub, jti, token, exp, iat, iss, nbf, prv, created_at, appid, ip_address, updated_at, user_agent) VALUES (22, 5, 'BAvORl7gtXsVc9Xz', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMTUvYXBpL2xvZ2luIiwiaWF0IjoxNTQxNjA1ODEwLCJleHAiOjE1NDE2OTIyMTAsIm5iZiI6MTU0MTYwNTgxMCwianRpIjoiQkF2T1JsN2d0WHNWYzlYeiIsInN1YiI6NSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.NGBvnOVsnL7F-n51aQ4tJ_4XVVfqaXEi59mTJTXscIM', 1541692210, 1541605810, 'http://localhost:8015/api/login', 1541605810, '23bd5c8949f600adb39e701c400872db7a5976f7', '2018-11-07 22:50:10', 'keKajian', '::1', '2018-11-07 22:50:10', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1');
INSERT INTO public.keka_jwt (id, sub, jti, token, exp, iat, iss, nbf, prv, created_at, appid, ip_address, updated_at, user_agent) VALUES (23, 5, 'YUQdTROuLm9BpaFR', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMTUvYXBpL2xvZ2luIiwiaWF0IjoxNTQxNjA1ODU2LCJleHAiOjE1NDE2OTIyNTYsIm5iZiI6MTU0MTYwNTg1NiwianRpIjoiWVVRZFRST3VMbTlCcGFGUiIsInN1YiI6NSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.kZGKBrw5QaP5lFCSy_m--wEQaExljUVGBKvd7ygTcaA', 1541692256, 1541605856, 'http://localhost:8015/api/login', 1541605856, '23bd5c8949f600adb39e701c400872db7a5976f7', '2018-11-07 22:50:56', 'keKajian', '::1', '2018-11-07 22:50:56', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1');
INSERT INTO public.keka_jwt (id, sub, jti, token, exp, iat, iss, nbf, prv, created_at, appid, ip_address, updated_at, user_agent) VALUES (24, 5, 'eCYig6XriuStnU2r', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMTUvYXBpL2xvZ2luIiwiaWF0IjoxNTQxNjA1ODgxLCJleHAiOjE1NDE2OTIyODEsIm5iZiI6MTU0MTYwNTg4MSwianRpIjoiZUNZaWc2WHJpdVN0blUyciIsInN1YiI6NSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.OFv1RCNrorLkVtFhcvAsN9rHJfxS_Mawtl3EFx-EGOQ', 1541692281, 1541605881, 'http://localhost:8015/api/login', 1541605881, '23bd5c8949f600adb39e701c400872db7a5976f7', '2018-11-07 22:51:21', 'keKajian', '::1', '2018-11-07 22:51:21', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1');
INSERT INTO public.keka_jwt (id, sub, jti, token, exp, iat, iss, nbf, prv, created_at, appid, ip_address, updated_at, user_agent) VALUES (25, 5, 'zlSPwHeLK8BJNP2Z', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMTUvYXBpL2xvZ2luIiwiaWF0IjoxNTQxNjA1ODg2LCJleHAiOjE1NDE2OTIyODYsIm5iZiI6MTU0MTYwNTg4NiwianRpIjoiemxTUHdIZUxLOEJKTlAyWiIsInN1YiI6NSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.zpqby7ncsoEKWdgKLVybdodKBRywkv1Ivp8v3-v34Io', 1541692286, 1541605886, 'http://localhost:8015/api/login', 1541605886, '23bd5c8949f600adb39e701c400872db7a5976f7', '2018-11-07 22:51:26', 'keKajian', '::1', '2018-11-07 22:51:26', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1');
INSERT INTO public.keka_jwt (id, sub, jti, token, exp, iat, iss, nbf, prv, created_at, appid, ip_address, updated_at, user_agent) VALUES (26, 5, 'bDfw4jHNlO6PU5bI', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMTUvYXBpL2xvZ2luIiwiaWF0IjoxNTQxNjA2Nzk5LCJleHAiOjE1NDE2OTMxOTksIm5iZiI6MTU0MTYwNjc5OSwianRpIjoiYkRmdzRqSE5sTzZQVTViSSIsInN1YiI6NSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.KvDCD1wXqd7yH0epC9fE1K1IG3V2chSJAd5hiBBDJn4', 1541693199, 1541606799, 'http://localhost:8015/api/login', 1541606799, '23bd5c8949f600adb39e701c400872db7a5976f7', '2018-11-07 23:06:39', 'keKajian', '::1', '2018-11-07 23:06:39', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1');
INSERT INTO public.keka_jwt (id, sub, jti, token, exp, iat, iss, nbf, prv, created_at, appid, ip_address, updated_at, user_agent) VALUES (27, 5, 'ooRd2YPokE9sqybm', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMTUvYXBpL2xvZ2luIiwiaWF0IjoxNTQxOTQ5NzgzLCJleHAiOjE1NDIwMzYxODMsIm5iZiI6MTU0MTk0OTc4MywianRpIjoib29SZDJZUG9rRTlzcXlibSIsInN1YiI6NSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.a058L9xcTMUmRfuHgVIkbkZLaZJ7HcHVD2VXtODgOhU', 1542036183, 1541949783, 'http://localhost:8015/api/login', 1541949783, '23bd5c8949f600adb39e701c400872db7a5976f7', '2018-11-11 22:23:03', 'keKajian', '::1', '2018-11-11 22:23:03', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1');
INSERT INTO public.keka_jwt (id, sub, jti, token, exp, iat, iss, nbf, prv, created_at, appid, ip_address, updated_at, user_agent) VALUES (28, 5, 'Zll1NmunLgExWjEk', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMTUvYXBpL2xvZ2luIiwiaWF0IjoxNTQxOTQ5OTE2LCJleHAiOjE1NDIwMzYzMTYsIm5iZiI6MTU0MTk0OTkxNiwianRpIjoiWmxsMU5tdW5MZ0V4V2pFayIsInN1YiI6NSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.kE1qlwM4JDayfA6lWdvPH4K1fnok2Emv7yCYLkbm9fo', 1542036316, 1541949916, 'http://localhost:8015/api/login', 1541949916, '23bd5c8949f600adb39e701c400872db7a5976f7', '2018-11-11 22:25:16', 'keKajian', '::1', '2018-11-11 22:25:16', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1');
INSERT INTO public.keka_jwt (id, sub, jti, token, exp, iat, iss, nbf, prv, created_at, appid, ip_address, updated_at, user_agent) VALUES (29, 5, 'qRKywPqhslf2k7Yv', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMTUvYXBpL2xvZ2luIiwiaWF0IjoxNTQxOTQ5OTYyLCJleHAiOjE1NDIwMzYzNjIsIm5iZiI6MTU0MTk0OTk2MiwianRpIjoicVJLeXdQcWhzbGYyazdZdiIsInN1YiI6NSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.jdN4K4vshXb7KSjwbLPfTDPlJDSGapyKSDZ2j23EEG4', 1542036362, 1541949962, 'http://localhost:8015/api/login', 1541949962, '23bd5c8949f600adb39e701c400872db7a5976f7', '2018-11-11 22:26:02', 'keKajian', '::1', '2018-11-11 22:26:02', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1');
INSERT INTO public.keka_jwt (id, sub, jti, token, exp, iat, iss, nbf, prv, created_at, appid, ip_address, updated_at, user_agent) VALUES (30, 5, 'g5tyR60GG6njLhHt', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMTUvYXBpL2xvZ2luIiwiaWF0IjoxNTQxOTUwMDEzLCJleHAiOjE1NDIwMzY0MTMsIm5iZiI6MTU0MTk1MDAxMywianRpIjoiZzV0eVI2MEdHNm5qTGhIdCIsInN1YiI6NSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.4-gjo2IDSJc5HRIjM9A4TOIGNRvPnTdQBDhU0ZLIyG0', 1542036413, 1541950013, 'http://localhost:8015/api/login', 1541950013, '23bd5c8949f600adb39e701c400872db7a5976f7', '2018-11-11 22:26:53', 'keKajian', '::1', '2018-11-11 22:26:53', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1');
INSERT INTO public.keka_jwt (id, sub, jti, token, exp, iat, iss, nbf, prv, created_at, appid, ip_address, updated_at, user_agent) VALUES (31, 5, '5SV50kR2xwEN9YdG', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMTUvYXBpL2xvZ2luIiwiaWF0IjoxNTQxOTUwMDQ2LCJleHAiOjE1NDIwMzY0NDYsIm5iZiI6MTU0MTk1MDA0NiwianRpIjoiNVNWNTBrUjJ4d0VOOVlkRyIsInN1YiI6NSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.-9MitF1ULMuszaWes6_zVJSb_3ic2MVMA_szt-uauV0', 1542036446, 1541950046, 'http://localhost:8015/api/login', 1541950046, '23bd5c8949f600adb39e701c400872db7a5976f7', '2018-11-11 22:27:26', 'keKajian', '::1', '2018-11-11 22:27:26', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1');
INSERT INTO public.keka_jwt (id, sub, jti, token, exp, iat, iss, nbf, prv, created_at, appid, ip_address, updated_at, user_agent) VALUES (32, 5, 'MpwcvifiNJTpncDo', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMTUvYXBpL2xvZ2luIiwiaWF0IjoxNTQxOTUwMTMxLCJleHAiOjE1NDIwMzY1MzEsIm5iZiI6MTU0MTk1MDEzMSwianRpIjoiTXB3Y3ZpZmlOSlRwbmNEbyIsInN1YiI6NSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9._7MJQtkCXmcizs42XZT5TkuDyUHH7FO8b2lAZ2IJug8', 1542036531, 1541950131, 'http://localhost:8015/api/login', 1541950131, '23bd5c8949f600adb39e701c400872db7a5976f7', '2018-11-11 22:28:51', 'keKajian', '::1', '2018-11-11 22:28:51', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1');
INSERT INTO public.keka_jwt (id, sub, jti, token, exp, iat, iss, nbf, prv, created_at, appid, ip_address, updated_at, user_agent) VALUES (33, 5, 'HcdCXLDD5mxuzwRU', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMTUvYXBpL2xvZ2luIiwiaWF0IjoxNTQxOTUwMzgzLCJleHAiOjE1NDIwMzY3ODMsIm5iZiI6MTU0MTk1MDM4MywianRpIjoiSGNkQ1hMREQ1bXh1endSVSIsInN1YiI6NSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.oBnfDpD8856XHWepy0u5QbFTggVXxBYhMNiBNEVTkzQ', 1542036783, 1541950383, 'http://localhost:8015/api/login', 1541950383, '23bd5c8949f600adb39e701c400872db7a5976f7', '2018-11-11 22:33:03', 'keKajian', '::1', '2018-11-11 22:33:03', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1');
INSERT INTO public.keka_jwt (id, sub, jti, token, exp, iat, iss, nbf, prv, created_at, appid, ip_address, updated_at, user_agent) VALUES (34, 5, 'R4F9HwlPlqRK6c8o', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMTUvYXBpL2xvZ2luIiwiaWF0IjoxNTQxOTUwNTk5LCJleHAiOjE1NDIwMzY5OTksIm5iZiI6MTU0MTk1MDU5OSwianRpIjoiUjRGOUh3bFBscVJLNmM4byIsInN1YiI6NSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.pOi_gYXymIbNwz3EyZhssyzpAeER4bfJRwm_ZR__llA', 1542036999, 1541950599, 'http://localhost:8015/api/login', 1541950599, '23bd5c8949f600adb39e701c400872db7a5976f7', '2018-11-11 22:36:39', 'keKajian', '::1', '2018-11-11 22:36:39', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1');
INSERT INTO public.keka_jwt (id, sub, jti, token, exp, iat, iss, nbf, prv, created_at, appid, ip_address, updated_at, user_agent) VALUES (35, 5, 'T0ofewYsi1fLyKYU', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMTUvYXBpL2xvZ2luIiwiaWF0IjoxNTQxOTUxMDA5LCJleHAiOjE1NDIwMzc0MDksIm5iZiI6MTU0MTk1MTAwOSwianRpIjoiVDBvZmV3WXNpMWZMeUtZVSIsInN1YiI6NSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.xx2Qi9crLbDCuMP-cz-Cv0zqs_CgqwxudlqJp4JQc6s', 1542037409, 1541951009, 'http://localhost:8015/api/login', 1541951009, '23bd5c8949f600adb39e701c400872db7a5976f7', '2018-11-11 22:43:29', 'keKajian', '::1', '2018-11-11 22:43:29', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1');
INSERT INTO public.keka_jwt (id, sub, jti, token, exp, iat, iss, nbf, prv, created_at, appid, ip_address, updated_at, user_agent) VALUES (36, 5, 'pZ47bBA9XUPPkwNX', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMTUvYXBpL2xvZ2luIiwiaWF0IjoxNTQxOTUxMTg3LCJleHAiOjE1NDIwMzc1ODcsIm5iZiI6MTU0MTk1MTE4NywianRpIjoicFo0N2JCQTlYVVBQa3dOWCIsInN1YiI6NSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.ksxhFw7nhzHBVFl1cp9IgpNUwX1I-931CuRTbDsWQTU', 1542037587, 1541951187, 'http://localhost:8015/api/login', 1541951187, '23bd5c8949f600adb39e701c400872db7a5976f7', '2018-11-11 22:46:27', 'keKajian', '::1', '2018-11-11 22:46:27', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1');
INSERT INTO public.keka_jwt (id, sub, jti, token, exp, iat, iss, nbf, prv, created_at, appid, ip_address, updated_at, user_agent) VALUES (37, 5, 'fHzLRQJm9m4CPSZK', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMTUvYXBpL2xvZ2luIiwiaWF0IjoxNTQxOTUyMDc4LCJleHAiOjE1NDIwMzg0NzgsIm5iZiI6MTU0MTk1MjA3OCwianRpIjoiZkh6TFJRSm05bTRDUFNaSyIsInN1YiI6NSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.uUavh24HOI7jUXiqPZWEznFz34HG6to5FmAI0-ujp0o', 1542038478, 1541952078, 'http://localhost:8015/api/login', 1541952078, '23bd5c8949f600adb39e701c400872db7a5976f7', '2018-11-11 23:01:18', 'keKajian', '::1', '2018-11-11 23:01:18', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1');
INSERT INTO public.keka_jwt (id, sub, jti, token, exp, iat, iss, nbf, prv, created_at, appid, ip_address, updated_at, user_agent) VALUES (38, 5, 'h8Y3QnWPnqRv61bU', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMTUvYXBpL2xvZ2luIiwiaWF0IjoxNTQxOTUyNjMwLCJleHAiOjE1NDIwMzkwMzAsIm5iZiI6MTU0MTk1MjYzMCwianRpIjoiaDhZM1FuV1BucVJ2NjFiVSIsInN1YiI6NSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.cwUIeiYNiAyKbn3RWz8_0qbt3brIngqfAH2IShO1BGM', 1542039030, 1541952630, 'http://localhost:8015/api/login', 1541952630, '23bd5c8949f600adb39e701c400872db7a5976f7', '2018-11-11 23:10:30', 'keKajian', '::1', '2018-11-11 23:10:30', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1');
INSERT INTO public.keka_jwt (id, sub, jti, token, exp, iat, iss, nbf, prv, created_at, appid, ip_address, updated_at, user_agent) VALUES (39, 5, 'GKkOfRUOKixr1GK8', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMTUvYXBpL2xvZ2luIiwiaWF0IjoxNTQxOTUzMTMyLCJleHAiOjE1NDIwMzk1MzIsIm5iZiI6MTU0MTk1MzEzMiwianRpIjoiR0trT2ZSVU9LaXhyMUdLOCIsInN1YiI6NSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.zCD660lhcYy6U-KVTfAnD94fxRHYkcPMauXvF2E3EwQ', 1542039532, 1541953132, 'http://localhost:8015/api/login', 1541953132, '23bd5c8949f600adb39e701c400872db7a5976f7', '2018-11-11 23:18:52', 'keKajian', '::1', '2018-11-11 23:18:52', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1');
INSERT INTO public.keka_jwt (id, sub, jti, token, exp, iat, iss, nbf, prv, created_at, appid, ip_address, updated_at, user_agent) VALUES (40, 5, 'M3n3wG3SSmYpQj4w', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMTUvYXBpL2xvZ2luIiwiaWF0IjoxNTQxOTU1NDM3LCJleHAiOjE1NDIwNDE4MzcsIm5iZiI6MTU0MTk1NTQzNywianRpIjoiTTNuM3dHM1NTbVlwUWo0dyIsInN1YiI6NSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.yHmgkkeMwrRFldpNryRL0iRGta06LHYloMrSY6kb8DU', 1542041837, 1541955437, 'http://localhost:8015/api/login', 1541955437, '23bd5c8949f600adb39e701c400872db7a5976f7', '2018-11-11 23:57:17', 'keKajian', '::1', '2018-11-11 23:57:17', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1');
INSERT INTO public.keka_jwt (id, sub, jti, token, exp, iat, iss, nbf, prv, created_at, appid, ip_address, updated_at, user_agent) VALUES (41, 5, 'qaNNfr9Y1hLUdV4I', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMTUvYXBpL2xvZ2luIiwiaWF0IjoxNTQxOTU1NTEzLCJleHAiOjE1NDIwNDE5MTMsIm5iZiI6MTU0MTk1NTUxMywianRpIjoicWFOTmZyOVkxaExVZFY0SSIsInN1YiI6NSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.yTAtVHMmQ1d5Y2tDERorMHDbmkuDpVITWcJKjtwovkU', 1542041913, 1541955513, 'http://localhost:8015/api/login', 1541955513, '23bd5c8949f600adb39e701c400872db7a5976f7', '2018-11-11 23:58:33', 'keKajian', '::1', '2018-11-11 23:58:33', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1');
INSERT INTO public.keka_jwt (id, sub, jti, token, exp, iat, iss, nbf, prv, created_at, appid, ip_address, updated_at, user_agent) VALUES (42, 5, '1uwwKeiVqnG182Yn', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMTUvYXBpL2xvZ2luIiwiaWF0IjoxNTQxOTU1NjEwLCJleHAiOjE1NDIwNDIwMTAsIm5iZiI6MTU0MTk1NTYxMCwianRpIjoiMXV3d0tlaVZxbkcxODJZbiIsInN1YiI6NSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.Dsw3IfuayY0qvoVUeiQiIeGu9AbZYLWVTaxhp859vDk', 1542042010, 1541955610, 'http://localhost:8015/api/login', 1541955610, '23bd5c8949f600adb39e701c400872db7a5976f7', '2018-11-12 00:00:10', 'keKajian', '::1', '2018-11-12 00:00:10', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1');
INSERT INTO public.keka_jwt (id, sub, jti, token, exp, iat, iss, nbf, prv, created_at, appid, ip_address, updated_at, user_agent) VALUES (43, 5, 'VfBegyjnVz5Rulhw', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMTUvYXBpL2xvZ2luIiwiaWF0IjoxNTQyMTIzMDg3LCJleHAiOjE1NDIyMDk0ODcsIm5iZiI6MTU0MjEyMzA4NywianRpIjoiVmZCZWd5am5WejVSdWxodyIsInN1YiI6NSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9._Q18gEEGdeJG_BJ0QdD8WI_G1w6R2tczcJ4TIRFj4dQ', 1542209487, 1542123087, 'http://localhost:8015/api/login', 1542123087, '23bd5c8949f600adb39e701c400872db7a5976f7', '2018-11-13 22:31:27', 'keKajian', '::1', '2018-11-13 22:31:27', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1');
INSERT INTO public.keka_jwt (id, sub, jti, token, exp, iat, iss, nbf, prv, created_at, appid, ip_address, updated_at, user_agent) VALUES (44, 5, 'GO1mQ5v46JC8PBmW', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMTUvYXBpL2xvZ2luIiwiaWF0IjoxNTQyMTI0MTY1LCJleHAiOjE1NDIyMTA1NjUsIm5iZiI6MTU0MjEyNDE2NSwianRpIjoiR08xbVE1djQ2SkM4UEJtVyIsInN1YiI6NSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.V20qkNyNU-p5JWpLfTc2FEHq3Mb9T1wNaDMohr8n8w4', 1542210565, 1542124165, 'http://localhost:8015/api/login', 1542124165, '23bd5c8949f600adb39e701c400872db7a5976f7', '2018-11-13 22:49:25', 'keKajian', '::1', '2018-11-13 22:49:25', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1');
INSERT INTO public.keka_jwt (id, sub, jti, token, exp, iat, iss, nbf, prv, created_at, appid, ip_address, updated_at, user_agent) VALUES (45, 5, '9i2m7dIzDOCYwvSB', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMTUvYXBpL2xvZ2luIiwiaWF0IjoxNTQyMjA5NDEzLCJleHAiOjE1NDIyOTU4MTMsIm5iZiI6MTU0MjIwOTQxMywianRpIjoiOWkybTdkSXpET0NZd3ZTQiIsInN1YiI6NSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.IeqFmHd3QduBL_W-Z743hOvAXkY_srI7n_xJK-I1Q_w', 1542295813, 1542209413, 'http://localhost:8015/api/login', 1542209413, '23bd5c8949f600adb39e701c400872db7a5976f7', '2018-11-14 22:30:13', 'keKajian', '::1', '2018-11-14 22:30:13', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1');
INSERT INTO public.keka_jwt (id, sub, jti, token, exp, iat, iss, nbf, prv, created_at, appid, ip_address, updated_at, user_agent) VALUES (46, 5, 'qdJr2LfXH34Ncu8P', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMTUvYXBpL2xvZ2luIiwiaWF0IjoxNTQyMzI2MzY3LCJleHAiOjE1NDI0MTI3NjcsIm5iZiI6MTU0MjMyNjM2NywianRpIjoicWRKcjJMZlhIMzROY3U4UCIsInN1YiI6NSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.P31TMIAOd38U3cWuuFnwB2OIGWIwtRKS1gbJvWltU-w', 1542412767, 1542326367, 'http://localhost:8015/api/login', 1542326367, '23bd5c8949f600adb39e701c400872db7a5976f7', '2018-11-16 06:59:27', 'keKajian', '::1', '2018-11-16 06:59:27', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1');


--
-- TOC entry 3208 (class 0 OID 19154)
-- Dependencies: 210
-- Data for Name: keka_kajian_photos; Type: TABLE DATA; Schema: public; Owner: kekajian_da74bas3
--

INSERT INTO public.keka_kajian_photos (id, kajian_id, cover, photo, created_at, created_by, updated_at, updated_by, deleted_at, deleted_by, last_ip) VALUES (2, 4, 1, 'http://localhost:8015/api/kajian/photo/1484b2881398182fdba87791ffa87d01586.jpeg', '2018-10-28 17:32:42', 5, '2018-10-28 17:33:06', 5, NULL, NULL, '::1');
INSERT INTO public.keka_kajian_photos (id, kajian_id, cover, photo, created_at, created_by, updated_at, updated_by, deleted_at, deleted_by, last_ip) VALUES (3, 4, 1, 'http://localhost:8015/api/kajian/photo/321e92dd6a5f3c5222a1b74197d7f99b024.jpg', '2018-10-28 17:33:06', 5, '2018-10-28 17:33:06', NULL, NULL, NULL, '::1');
INSERT INTO public.keka_kajian_photos (id, kajian_id, cover, photo, created_at, created_by, updated_at, updated_by, deleted_at, deleted_by, last_ip) VALUES (4, 3, 1, 'http://localhost:8015/api/kajian/photo/7354b2881398182fdba87791ffa87d01586.jpeg', '2018-10-28 17:33:48', 5, '2018-10-28 17:33:48', NULL, NULL, NULL, '::1');
INSERT INTO public.keka_kajian_photos (id, kajian_id, cover, photo, created_at, created_by, updated_at, updated_by, deleted_at, deleted_by, last_ip) VALUES (5, 2, 1, 'http://localhost:8015/api/kajian/photo/5694b2881398182fdba87791ffa87d01586.jpeg', '2018-10-28 17:34:43', 5, '2018-10-28 17:34:43', NULL, NULL, NULL, '::1');
INSERT INTO public.keka_kajian_photos (id, kajian_id, cover, photo, created_at, created_by, updated_at, updated_by, deleted_at, deleted_by, last_ip) VALUES (8, 5, 1, 'http://localhost:8015/api/kajian/photo/5644b2881398182fdba87791ffa87d01586.jpeg', '2018-10-28 22:30:33', 5, '2018-10-28 22:42:25', 5, NULL, NULL, '::1');
INSERT INTO public.keka_kajian_photos (id, kajian_id, cover, photo, created_at, created_by, updated_at, updated_by, deleted_at, deleted_by, last_ip) VALUES (7, 6, 1, 'http://localhost:8015/api/kajian/photo/867e92dd6a5f3c5222a1b74197d7f99b024.jpg', '2018-10-28 22:30:08', 5, '2018-11-03 21:54:06', 5, NULL, NULL, '::1');
INSERT INTO public.keka_kajian_photos (id, kajian_id, cover, photo, created_at, created_by, updated_at, updated_by, deleted_at, deleted_by, last_ip) VALUES (6, 6, 0, 'http://localhost:8015/api/kajian/photo/6184b2881398182fdba87791ffa87d01586.jpeg', '2018-10-28 20:58:21', 5, '2018-11-03 21:54:06', 5, NULL, NULL, '::1');


--
-- TOC entry 3205 (class 0 OID 19133)
-- Dependencies: 207
-- Data for Name: keka_kajians; Type: TABLE DATA; Schema: public; Owner: kekajian_da74bas3
--

INSERT INTO public.keka_kajians (id, tema, pemateri, kota_id, tempat, link_maps, tanggal, penyelenggara, kontak_ikhwan, kontak_akhwat, keterangan, link_video_kajian, publish, approved_at, approved_by, created_at, created_by, updated_at, updated_by, deleted_at, deleted_by, last_ip, jam_mulai, jam_selesai, link_video_cover) VALUES (22, 'Kajian Rutin Akhwat', 'sadvadsfv', 5302, 'asdvadfvdfvadfvadfv', NULL, '2018-11-17', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2018-11-14 22:31:37', 5, '2018-11-16 07:44:59', 5, NULL, NULL, '::1', '18:30', NULL, NULL);
INSERT INTO public.keka_kajians (id, tema, pemateri, kota_id, tempat, link_maps, tanggal, penyelenggara, kontak_ikhwan, kontak_akhwat, keterangan, link_video_kajian, publish, approved_at, approved_by, created_at, created_by, updated_at, updated_by, deleted_at, deleted_by, last_ip, jam_mulai, jam_selesai, link_video_cover) VALUES (2, 'dasvaf', 'savdfbdsgb', 1112, 'sadvdfbdfsb
dafbdfb', NULL, '2018-10-29', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2018-10-28 14:46:25', 5, '2018-10-28 20:40:49', 5, '2018-10-28 20:40:49', NULL, '::1', 'ba''da maghrib', 'Selesai', NULL);
INSERT INTO public.keka_kajians (id, tema, pemateri, kota_id, tempat, link_maps, tanggal, penyelenggara, kontak_ikhwan, kontak_akhwat, keterangan, link_video_kajian, publish, approved_at, approved_by, created_at, created_by, updated_at, updated_by, deleted_at, deleted_by, last_ip, jam_mulai, jam_selesai, link_video_cover) VALUES (3, 'cxvxcbvxn', 'cxvbcvbcvxnbcxn', 1106, 'xvzxcvxb
xzvcbcvbvxcvxb', NULL, '2018-10-29', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2018-10-28 15:50:48', 5, '2018-10-28 20:45:54', 5, '2018-10-28 20:45:54', NULL, '::1', 'xzcvxczvcb', 'Selesai', NULL);
INSERT INTO public.keka_kajians (id, tema, pemateri, kota_id, tempat, link_maps, tanggal, penyelenggara, kontak_ikhwan, kontak_akhwat, keterangan, link_video_kajian, publish, approved_at, approved_by, created_at, created_by, updated_at, updated_by, deleted_at, deleted_by, last_ip, jam_mulai, jam_selesai, link_video_cover) VALUES (4, 'xczvxczvxzc', 'xczvxcbx', 1112, 'xczvxcbcvb
xzcvxcbcvb', NULL, '2018-10-28', 'cxvxcbb', '21314324', '324235245', 'sdafv
dfsbsdfgbgf', NULL, 1, NULL, NULL, '2018-10-28 15:51:23', 5, '2018-10-28 20:56:16', 5, '2018-10-28 20:56:16', NULL, '::1', 'xvccbcvxb', 'Selesai', NULL);
INSERT INTO public.keka_kajians (id, tema, pemateri, kota_id, tempat, link_maps, tanggal, penyelenggara, kontak_ikhwan, kontak_akhwat, keterangan, link_video_kajian, publish, approved_at, approved_by, created_at, created_by, updated_at, updated_by, deleted_at, deleted_by, last_ip, jam_mulai, jam_selesai, link_video_cover) VALUES (1, 'Kaum Yang Di Do''akan Malaikat', 'Ustadz Abu Yahya Badrussalam, LC Hafizahullah', 3273, 'Majis Al-Ukhuwah Jln. Westu Kencana No. 27 - Sumur', NULL, '2018-10-05', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2018-10-28 14:09:53', 5, '2018-10-28 22:38:45', 5, NULL, NULL, '::1', '09:00', '11:00', NULL);
INSERT INTO public.keka_kajians (id, tema, pemateri, kota_id, tempat, link_maps, tanggal, penyelenggara, kontak_ikhwan, kontak_akhwat, keterangan, link_video_kajian, publish, approved_at, approved_by, created_at, created_by, updated_at, updated_by, deleted_at, deleted_by, last_ip, jam_mulai, jam_selesai, link_video_cover) VALUES (5, 'Hambakan Diri Kepada Allah', 'Ustadz Maududi Abdullah, Lc', 1112, 'Majis Al-Ukhuwah Jln. Westu Kencana No. 27 - Sumur', NULL, '2018-11-05', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2018-10-28 20:45:49', 5, '2018-10-28 22:42:25', 5, NULL, NULL, '::1', 'Ba''da Maghrib', 'Selesai', NULL);
INSERT INTO public.keka_kajians (id, tema, pemateri, kota_id, tempat, link_maps, tanggal, penyelenggara, kontak_ikhwan, kontak_akhwat, keterangan, link_video_kajian, publish, approved_at, approved_by, created_at, created_by, updated_at, updated_by, deleted_at, deleted_by, last_ip, jam_mulai, jam_selesai, link_video_cover) VALUES (6, 'Kajian Tematik', 'Ustadz Muhammad Abduh Tuasikal, MSc', 1110, 'Majis Al-Ukhuwah Jln. Westu Kencana No. 27 - Sumur', NULL, '2018-10-31', NULL, '081277331500', NULL, NULL, 'https://youtu.be/aiQoTUiTWtw', 1, NULL, NULL, '2018-10-28 20:58:21', 5, '2018-11-03 21:54:06', 5, NULL, NULL, '::1', '18:30', 'Selesai', '');
INSERT INTO public.keka_kajians (id, tema, pemateri, kota_id, tempat, link_maps, tanggal, penyelenggara, kontak_ikhwan, kontak_akhwat, keterangan, link_video_kajian, publish, approved_at, approved_by, created_at, created_by, updated_at, updated_by, deleted_at, deleted_by, last_ip, jam_mulai, jam_selesai, link_video_cover) VALUES (7, 'sdfsdafg', 'sdafadsf', 8103, 'sadfsadgf', NULL, '2018-11-11', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2018-11-11 23:58:59', 5, '2018-11-11 23:58:59', NULL, NULL, NULL, '::1', 'asdfsdaf', 'sadfsdg', NULL);
INSERT INTO public.keka_kajians (id, tema, pemateri, kota_id, tempat, link_maps, tanggal, penyelenggara, kontak_ikhwan, kontak_akhwat, keterangan, link_video_kajian, publish, approved_at, approved_by, created_at, created_by, updated_at, updated_by, deleted_at, deleted_by, last_ip, jam_mulai, jam_selesai, link_video_cover) VALUES (8, 'dsaf', 'asdfads', 8103, 'sadfsad', NULL, '2018-11-13', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2018-11-12 00:00:37', 5, '2018-11-12 00:00:37', NULL, NULL, NULL, '::1', 'xzcvcxvb', NULL, NULL);
INSERT INTO public.keka_kajians (id, tema, pemateri, kota_id, tempat, link_maps, tanggal, penyelenggara, kontak_ikhwan, kontak_akhwat, keterangan, link_video_kajian, publish, approved_at, approved_by, created_at, created_by, updated_at, updated_by, deleted_at, deleted_by, last_ip, jam_mulai, jam_selesai, link_video_cover) VALUES (9, 'avfvczvfadv', 'sadvadsfv', 5302, 'asdvadfvdfvadfvadfv', NULL, '2018-11-17', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2018-11-14 22:31:21', 5, '2018-11-14 22:31:21', NULL, NULL, NULL, '::1', '18:30', NULL, NULL);
INSERT INTO public.keka_kajians (id, tema, pemateri, kota_id, tempat, link_maps, tanggal, penyelenggara, kontak_ikhwan, kontak_akhwat, keterangan, link_video_kajian, publish, approved_at, approved_by, created_at, created_by, updated_at, updated_by, deleted_at, deleted_by, last_ip, jam_mulai, jam_selesai, link_video_cover) VALUES (10, 'avfvczvfadv', 'sadvadsfv', 5302, 'asdvadfvdfvadfvadfv', NULL, '2018-11-17', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2018-11-14 22:31:32', 5, '2018-11-14 22:31:32', NULL, NULL, NULL, '::1', '18:30', NULL, NULL);
INSERT INTO public.keka_kajians (id, tema, pemateri, kota_id, tempat, link_maps, tanggal, penyelenggara, kontak_ikhwan, kontak_akhwat, keterangan, link_video_kajian, publish, approved_at, approved_by, created_at, created_by, updated_at, updated_by, deleted_at, deleted_by, last_ip, jam_mulai, jam_selesai, link_video_cover) VALUES (11, 'avfvczvfadv', 'sadvadsfv', 5302, 'asdvadfvdfvadfvadfv', NULL, '2018-11-17', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2018-11-14 22:31:33', 5, '2018-11-14 22:31:33', NULL, NULL, NULL, '::1', '18:30', NULL, NULL);
INSERT INTO public.keka_kajians (id, tema, pemateri, kota_id, tempat, link_maps, tanggal, penyelenggara, kontak_ikhwan, kontak_akhwat, keterangan, link_video_kajian, publish, approved_at, approved_by, created_at, created_by, updated_at, updated_by, deleted_at, deleted_by, last_ip, jam_mulai, jam_selesai, link_video_cover) VALUES (12, 'avfvczvfadv', 'sadvadsfv', 5302, 'asdvadfvdfvadfvadfv', NULL, '2018-11-17', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2018-11-14 22:31:34', 5, '2018-11-14 22:31:34', NULL, NULL, NULL, '::1', '18:30', NULL, NULL);
INSERT INTO public.keka_kajians (id, tema, pemateri, kota_id, tempat, link_maps, tanggal, penyelenggara, kontak_ikhwan, kontak_akhwat, keterangan, link_video_kajian, publish, approved_at, approved_by, created_at, created_by, updated_at, updated_by, deleted_at, deleted_by, last_ip, jam_mulai, jam_selesai, link_video_cover) VALUES (13, 'avfvczvfadv', 'sadvadsfv', 5302, 'asdvadfvdfvadfvadfv', NULL, '2018-11-17', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2018-11-14 22:31:35', 5, '2018-11-14 22:31:35', NULL, NULL, NULL, '::1', '18:30', NULL, NULL);
INSERT INTO public.keka_kajians (id, tema, pemateri, kota_id, tempat, link_maps, tanggal, penyelenggara, kontak_ikhwan, kontak_akhwat, keterangan, link_video_kajian, publish, approved_at, approved_by, created_at, created_by, updated_at, updated_by, deleted_at, deleted_by, last_ip, jam_mulai, jam_selesai, link_video_cover) VALUES (14, 'avfvczvfadv', 'sadvadsfv', 5302, 'asdvadfvdfvadfvadfv', NULL, '2018-11-17', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2018-11-14 22:31:36', 5, '2018-11-14 22:31:36', NULL, NULL, NULL, '::1', '18:30', NULL, NULL);
INSERT INTO public.keka_kajians (id, tema, pemateri, kota_id, tempat, link_maps, tanggal, penyelenggara, kontak_ikhwan, kontak_akhwat, keterangan, link_video_kajian, publish, approved_at, approved_by, created_at, created_by, updated_at, updated_by, deleted_at, deleted_by, last_ip, jam_mulai, jam_selesai, link_video_cover) VALUES (15, 'avfvczvfadv', 'sadvadsfv', 5302, 'asdvadfvdfvadfvadfv', NULL, '2018-11-17', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2018-11-14 22:31:36', 5, '2018-11-14 22:31:36', NULL, NULL, NULL, '::1', '18:30', NULL, NULL);
INSERT INTO public.keka_kajians (id, tema, pemateri, kota_id, tempat, link_maps, tanggal, penyelenggara, kontak_ikhwan, kontak_akhwat, keterangan, link_video_kajian, publish, approved_at, approved_by, created_at, created_by, updated_at, updated_by, deleted_at, deleted_by, last_ip, jam_mulai, jam_selesai, link_video_cover) VALUES (16, 'avfvczvfadv', 'sadvadsfv', 5302, 'asdvadfvdfvadfvadfv', NULL, '2018-11-17', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2018-11-14 22:31:36', 5, '2018-11-14 22:31:36', NULL, NULL, NULL, '::1', '18:30', NULL, NULL);
INSERT INTO public.keka_kajians (id, tema, pemateri, kota_id, tempat, link_maps, tanggal, penyelenggara, kontak_ikhwan, kontak_akhwat, keterangan, link_video_kajian, publish, approved_at, approved_by, created_at, created_by, updated_at, updated_by, deleted_at, deleted_by, last_ip, jam_mulai, jam_selesai, link_video_cover) VALUES (17, 'avfvczvfadv', 'sadvadsfv', 5302, 'asdvadfvdfvadfvadfv', NULL, '2018-11-17', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2018-11-14 22:31:36', 5, '2018-11-14 22:31:36', NULL, NULL, NULL, '::1', '18:30', NULL, NULL);
INSERT INTO public.keka_kajians (id, tema, pemateri, kota_id, tempat, link_maps, tanggal, penyelenggara, kontak_ikhwan, kontak_akhwat, keterangan, link_video_kajian, publish, approved_at, approved_by, created_at, created_by, updated_at, updated_by, deleted_at, deleted_by, last_ip, jam_mulai, jam_selesai, link_video_cover) VALUES (18, 'avfvczvfadv', 'sadvadsfv', 5302, 'asdvadfvdfvadfvadfv', NULL, '2018-11-17', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2018-11-14 22:31:36', 5, '2018-11-14 22:31:36', NULL, NULL, NULL, '::1', '18:30', NULL, NULL);
INSERT INTO public.keka_kajians (id, tema, pemateri, kota_id, tempat, link_maps, tanggal, penyelenggara, kontak_ikhwan, kontak_akhwat, keterangan, link_video_kajian, publish, approved_at, approved_by, created_at, created_by, updated_at, updated_by, deleted_at, deleted_by, last_ip, jam_mulai, jam_selesai, link_video_cover) VALUES (19, 'avfvczvfadv', 'sadvadsfv', 5302, 'asdvadfvdfvadfvadfv', NULL, '2018-11-17', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2018-11-14 22:31:36', 5, '2018-11-14 22:31:36', NULL, NULL, NULL, '::1', '18:30', NULL, NULL);
INSERT INTO public.keka_kajians (id, tema, pemateri, kota_id, tempat, link_maps, tanggal, penyelenggara, kontak_ikhwan, kontak_akhwat, keterangan, link_video_kajian, publish, approved_at, approved_by, created_at, created_by, updated_at, updated_by, deleted_at, deleted_by, last_ip, jam_mulai, jam_selesai, link_video_cover) VALUES (20, 'avfvczvfadv', 'sadvadsfv', 5302, 'asdvadfvdfvadfvadfv', NULL, '2018-11-17', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2018-11-14 22:31:36', 5, '2018-11-14 22:31:36', NULL, NULL, NULL, '::1', '18:30', NULL, NULL);
INSERT INTO public.keka_kajians (id, tema, pemateri, kota_id, tempat, link_maps, tanggal, penyelenggara, kontak_ikhwan, kontak_akhwat, keterangan, link_video_kajian, publish, approved_at, approved_by, created_at, created_by, updated_at, updated_by, deleted_at, deleted_by, last_ip, jam_mulai, jam_selesai, link_video_cover) VALUES (21, 'avfvczvfadv', 'sadvadsfv', 5302, 'asdvadfvdfvadfvadfv', NULL, '2018-11-17', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2018-11-14 22:31:36', 5, '2018-11-14 22:31:36', NULL, NULL, NULL, '::1', '18:30', NULL, NULL);
INSERT INTO public.keka_kajians (id, tema, pemateri, kota_id, tempat, link_maps, tanggal, penyelenggara, kontak_ikhwan, kontak_akhwat, keterangan, link_video_kajian, publish, approved_at, approved_by, created_at, created_by, updated_at, updated_by, deleted_at, deleted_by, last_ip, jam_mulai, jam_selesai, link_video_cover) VALUES (23, 'avfvczvfadv', 'sadvadsfv', 5302, 'asdvadfvdfvadfvadfv', NULL, '2018-11-17', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2018-11-14 22:31:37', 5, '2018-11-14 22:31:37', NULL, NULL, NULL, '::1', '18:30', NULL, NULL);
INSERT INTO public.keka_kajians (id, tema, pemateri, kota_id, tempat, link_maps, tanggal, penyelenggara, kontak_ikhwan, kontak_akhwat, keterangan, link_video_kajian, publish, approved_at, approved_by, created_at, created_by, updated_at, updated_by, deleted_at, deleted_by, last_ip, jam_mulai, jam_selesai, link_video_cover) VALUES (24, 'avfvczvfadv', 'sadvadsfv', 5302, 'asdvadfvdfvadfvadfv', NULL, '2018-11-17', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2018-11-14 22:31:37', 5, '2018-11-14 22:31:37', NULL, NULL, NULL, '::1', '18:30', NULL, NULL);
INSERT INTO public.keka_kajians (id, tema, pemateri, kota_id, tempat, link_maps, tanggal, penyelenggara, kontak_ikhwan, kontak_akhwat, keterangan, link_video_kajian, publish, approved_at, approved_by, created_at, created_by, updated_at, updated_by, deleted_at, deleted_by, last_ip, jam_mulai, jam_selesai, link_video_cover) VALUES (25, 'bbbbb', 'sadvadsfv', 5302, 'asdvadfvdfvadfvadfv', NULL, '2018-11-17', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2018-11-14 22:31:37', 5, '2018-11-16 07:45:17', 5, NULL, NULL, '::1', '18:30', NULL, NULL);
INSERT INTO public.keka_kajians (id, tema, pemateri, kota_id, tempat, link_maps, tanggal, penyelenggara, kontak_ikhwan, kontak_akhwat, keterangan, link_video_kajian, publish, approved_at, approved_by, created_at, created_by, updated_at, updated_by, deleted_at, deleted_by, last_ip, jam_mulai, jam_selesai, link_video_cover) VALUES (26, 'bbbbbb', 'sadvadsfv', 5302, 'asdvadfvdfvadfvadfv', NULL, '2018-11-17', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2018-11-14 22:31:37', 5, '2018-11-16 07:46:02', 5, NULL, NULL, '::1', '18:30', NULL, NULL);


--
-- TOC entry 3206 (class 0 OID 19143)
-- Dependencies: 208
-- Data for Name: keka_kotas; Type: TABLE DATA; Schema: public; Owner: kekajian_da74bas3
--

INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1101, '11', 'KAB. ACEH SELATAN', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1102, '11', 'KAB. ACEH TENGGARA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1103, '11', 'KAB. ACEH TIMUR', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1104, '11', 'KAB. ACEH TENGAH', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1105, '11', 'KAB. ACEH BARAT', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1106, '11', 'KAB. ACEH BESAR', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1107, '11', 'KAB. PIDIE', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1108, '11', 'KAB. ACEH UTARA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1109, '11', 'KAB. SIMEULUE', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1110, '11', 'KAB. ACEH SINGKIL', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1111, '11', 'KAB. BIREUEN', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1112, '11', 'KAB. ACEH BARAT DAYA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1113, '11', 'KAB. GAYO LUES', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1114, '11', 'KAB. ACEH JAYA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1115, '11', 'KAB. NAGAN RAYA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1116, '11', 'KAB. ACEH TAMIANG', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1117, '11', 'KAB. BENER MERIAH', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1118, '11', 'KAB. PIDIE JAYA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1171, '11', 'KOTA BANDA ACEH', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1172, '11', 'KOTA SABANG', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1173, '11', 'KOTA LHOKSEUMAWE', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1174, '11', 'KOTA LANGSA', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1175, '11', 'KOTA SUBULUSSALAM', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1201, '12', 'KAB. TAPANULI TENGAH', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1202, '12', 'KAB. TAPANULI UTARA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1203, '12', 'KAB. TAPANULI SELATAN', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1204, '12', 'KAB. NIAS', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1205, '12', 'KAB. LANGKAT', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1206, '12', 'KAB. KARO', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1207, '12', 'KAB. DELI SERDANG', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1208, '12', 'KAB. SIMALUNGUN', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1209, '12', 'KAB. ASAHAN', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1210, '12', 'KAB. LABUHANBATU', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1211, '12', 'KAB. DAIRI', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1212, '12', 'KAB. TOBA SAMOSIR', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1213, '12', 'KAB. MANDAILING NATAL', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1214, '12', 'KAB. NIAS SELATAN', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1215, '12', 'KAB. PAKPAK BHARAT', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1216, '12', 'KAB. HUMBANG HASUNDUTAN', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1217, '12', 'KAB. SAMOSIR', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1218, '12', 'KAB. SERDANG BEDAGAI', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1219, '12', 'KAB. BATU BARA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1220, '12', 'KAB. PADANG LAWAS UTARA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1221, '12', 'KAB. PADANG LAWAS', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1222, '12', 'KAB. LABUHANBATU SELATAN', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1223, '12', 'KAB. LABUHANBATU UTARA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1224, '12', 'KAB. NIAS UTARA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1225, '12', 'KAB. NIAS BARAT', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1271, '12', 'KOTA MEDAN', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1272, '12', 'KOTA PEMATANG SIANTAR', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1273, '12', 'KOTA SIBOLGA', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1274, '12', 'KOTA TANJUNG BALAI', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1275, '12', 'KOTA BINJAI', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1276, '12', 'KOTA TEBING TINGGI', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1277, '12', 'KOTA PADANGSIDIMPUAN', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1278, '12', 'KOTA GUNUNGSITOLI', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1301, '13', 'KAB. PESISIR SELATAN', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1302, '13', 'KAB. SOLOK', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1303, '13', 'KAB. SIJUNJUNG', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1304, '13', 'KAB. TANAH DATAR', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1305, '13', 'KAB. PADANG PARIAMAN', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1306, '13', 'KAB. AGAM', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1307, '13', 'KAB. LIMA PULUH KOTA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1308, '13', 'KAB. PASAMAN', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1309, '13', 'KAB. KEPULAUAN MENTAWAI', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1310, '13', 'KAB. DHARMASRAYA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1311, '13', 'KAB. SOLOK SELATAN', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1312, '13', 'KAB. PASAMAN BARAT', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1371, '13', 'KOTA PADANG', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1372, '13', 'KOTA SOLOK', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1373, '13', 'KOTA SAWAHLUNTO', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1374, '13', 'KOTA PADANG PANJANG', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1375, '13', 'KOTA BUKITTINGGI', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1376, '13', 'KOTA PAYAKUMBUH', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1377, '13', 'KOTA PARIAMAN', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1401, '14', 'KAB. KAMPAR', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1402, '14', 'KAB. INDRAGIRI HULU', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1403, '14', 'KAB. BENGKALIS', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1404, '14', 'KAB. INDRAGIRI HILIR', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1405, '14', 'KAB. PELALAWAN', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1406, '14', 'KAB. ROKAN HULU', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1407, '14', 'KAB. ROKAN HILIR', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1408, '14', 'KAB. SIAK', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1409, '14', 'KAB. KUANTAN SINGINGI', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1410, '14', 'KAB. KEPULAUAN MERANTI', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1471, '14', 'KOTA PEKANBARU', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1472, '14', 'KOTA DUMAI', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1501, '15', 'KAB. KERINCI', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1502, '15', 'KAB. MERANGIN', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1503, '15', 'KAB. SAROLANGUN', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1504, '15', 'KAB. BATANGHARI', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1505, '15', 'KAB. MUARO JAMBI', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1506, '15', 'KAB. TANJUNG JABUNG BARAT', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1507, '15', 'KAB. TANJUNG JABUNG TIMUR', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1508, '15', 'KAB. BUNGO', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1509, '15', 'KAB. TEBO', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1571, '15', 'KOTA JAMBI', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1572, '15', 'KOTA SUNGAI PENUH', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1601, '16', 'KAB. OGAN KOMERING ULU', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1602, '16', 'KAB. OGAN KOMERING ILIR', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1603, '16', 'KAB. MUARA ENIM', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1604, '16', 'KAB. LAHAT', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1605, '16', 'KAB. MUSI RAWAS', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1606, '16', 'KAB. MUSI BANYUASIN', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1607, '16', 'KAB. BANYUASIN', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1608, '16', 'KAB. OGAN KOMERING ULU TIMUR', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1609, '16', 'KAB. OGAN KOMERING ULU SELATAN', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1610, '16', 'KAB. OGAN ILIR', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1611, '16', 'KAB. EMPAT LAWANG', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1612, '16', 'KAB. PENUKAL ABAB LEMATANG ILIR', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1613, '16', 'KAB. MUSI RAWAS UTARA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1671, '16', 'KOTA PALEMBANG', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1672, '16', 'KOTA PAGAR ALAM', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1673, '16', 'KOTA LUBUK LINGGAU', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1674, '16', 'KOTA PRABUMULIH', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1701, '17', 'KAB. BENGKULU SELATAN', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1702, '17', 'KAB. REJANG LEBONG', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1703, '17', 'KAB. BENGKULU UTARA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1704, '17', 'KAB. KAUR', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1705, '17', 'KAB. SELUMA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1706, '17', 'KAB. MUKO MUKO', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1707, '17', 'KAB. LEBONG', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1708, '17', 'KAB. KEPAHIANG', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1709, '17', 'KAB. BENGKULU TENGAH', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1771, '17', 'KOTA BENGKULU', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1801, '18', 'KAB. LAMPUNG SELATAN', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1802, '18', 'KAB. LAMPUNG TENGAH', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1803, '18', 'KAB. LAMPUNG UTARA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1804, '18', 'KAB. LAMPUNG BARAT', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1805, '18', 'KAB. TULANG BAWANG', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1806, '18', 'KAB. TANGGAMUS', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1807, '18', 'KAB. LAMPUNG TIMUR', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1808, '18', 'KAB. WAY KANAN', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1809, '18', 'KAB. PESAWARAN', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1810, '18', 'KAB. PRINGSEWU', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1811, '18', 'KAB. MESUJI', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1812, '18', 'KAB. TULANG BAWANG BARAT', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1813, '18', 'KAB. PESISIR BARAT', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1871, '18', 'KOTA BANDAR LAMPUNG', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1872, '18', 'KOTA METRO', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1901, '19', 'KAB. BANGKA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1902, '19', 'KAB. BELITUNG', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1903, '19', 'KAB. BANGKA SELATAN', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1904, '19', 'KAB. BANGKA TENGAH', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1905, '19', 'KAB. BANGKA BARAT', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1906, '19', 'KAB. BELITUNG TIMUR', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (1971, '19', 'KOTA PANGKAL PINANG', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (2101, '21', 'KAB. BINTAN', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (2102, '21', 'KAB. KARIMUN', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (2103, '21', 'KAB. NATUNA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (2104, '21', 'KAB. LINGGA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (2105, '21', 'KAB. KEPULAUAN ANAMBAS', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (2171, '21', 'KOTA BATAM', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (2172, '21', 'KOTA TANJUNG PINANG', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3101, '31', 'KAB. ADM. KEP. SERIBU', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3171, '31', 'KOTA ADM. JAKARTA PUSAT', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3172, '31', 'KOTA ADM. JAKARTA UTARA', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3173, '31', 'KOTA ADM. JAKARTA BARAT', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3174, '31', 'KOTA ADM. JAKARTA SELATAN', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3175, '31', 'KOTA ADM. JAKARTA TIMUR', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3201, '32', 'KAB. BOGOR', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3202, '32', 'KAB. SUKABUMI', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3203, '32', 'KAB. CIANJUR', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3204, '32', 'KAB. BANDUNG', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3205, '32', 'KAB. GARUT', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3206, '32', 'KAB. TASIKMALAYA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3207, '32', 'KAB. CIAMIS', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3208, '32', 'KAB. KUNINGAN', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3209, '32', 'KAB. CIREBON', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3210, '32', 'KAB. MAJALENGKA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3211, '32', 'KAB. SUMEDANG', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3212, '32', 'KAB. INDRAMAYU', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3213, '32', 'KAB. SUBANG', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3214, '32', 'KAB. PURWAKARTA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3215, '32', 'KAB. KARAWANG', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3216, '32', 'KAB. BEKASI', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3217, '32', 'KAB. BANDUNG BARAT', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3218, '32', 'KAB. PANGANDARAN', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3271, '32', 'KOTA BOGOR', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3272, '32', 'KOTA SUKABUMI', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3273, '32', 'KOTA BANDUNG', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3274, '32', 'KOTA CIREBON', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3275, '32', 'KOTA BEKASI', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3276, '32', 'KOTA DEPOK', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3277, '32', 'KOTA CIMAHI', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3278, '32', 'KOTA TASIKMALAYA', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3279, '32', 'KOTA BANJAR', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3301, '33', 'KAB. CILACAP', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3302, '33', 'KAB. BANYUMAS', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3303, '33', 'KAB. PURBALINGGA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3304, '33', 'KAB. BANJARNEGARA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3305, '33', 'KAB. KEBUMEN', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3306, '33', 'KAB. PURWOREJO', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3307, '33', 'KAB. WONOSOBO', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3308, '33', 'KAB. MAGELANG', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3309, '33', 'KAB. BOYOLALI', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3310, '33', 'KAB. KLATEN', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3311, '33', 'KAB. SUKOHARJO', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3312, '33', 'KAB. WONOGIRI', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3313, '33', 'KAB. KARANGANYAR', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3314, '33', 'KAB. SRAGEN', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3315, '33', 'KAB. GROBOGAN', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3316, '33', 'KAB. BLORA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3317, '33', 'KAB. REMBANG', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3318, '33', 'KAB. PATI', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3319, '33', 'KAB. KUDUS', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3320, '33', 'KAB. JEPARA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3321, '33', 'KAB. DEMAK', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3322, '33', 'KAB. SEMARANG', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3323, '33', 'KAB. TEMANGGUNG', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3324, '33', 'KAB. KENDAL', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3325, '33', 'KAB. BATANG', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3326, '33', 'KAB. PEKALONGAN', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3327, '33', 'KAB. PEMALANG', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3328, '33', 'KAB. TEGAL', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3329, '33', 'KAB. BREBES', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3371, '33', 'KOTA MAGELANG', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3372, '33', 'KOTA SURAKARTA', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3373, '33', 'KOTA SALATIGA', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3374, '33', 'KOTA SEMARANG', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3375, '33', 'KOTA PEKALONGAN', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3376, '33', 'KOTA TEGAL', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3401, '34', 'KAB. KULON PROGO', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3402, '34', 'KAB. BANTUL', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3403, '34', 'KAB. GUNUNG KIDUL', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3404, '34', 'KAB. SLEMAN', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3471, '34', 'KOTA YOGYAKARTA', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3501, '35', 'KAB. PACITAN', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3502, '35', 'KAB. PONOROGO', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3503, '35', 'KAB. TRENGGALEK', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3504, '35', 'KAB. TULUNGAGUNG', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3505, '35', 'KAB. BLITAR', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3506, '35', 'KAB. KEDIRI', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3507, '35', 'KAB. MALANG', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3508, '35', 'KAB. LUMAJANG', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3509, '35', 'KAB. JEMBER', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3510, '35', 'KAB. BANYUWANGI', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3511, '35', 'KAB. BONDOWOSO', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3512, '35', 'KAB. SITUBONDO', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3513, '35', 'KAB. PROBOLINGGO', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3514, '35', 'KAB. PASURUAN', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3515, '35', 'KAB. SIDOARJO', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3516, '35', 'KAB. MOJOKERTO', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3517, '35', 'KAB. JOMBANG', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3518, '35', 'KAB. NGANJUK', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3519, '35', 'KAB. MADIUN', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3520, '35', 'KAB. MAGETAN', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3521, '35', 'KAB. NGAWI', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3522, '35', 'KAB. BOJONEGORO', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3523, '35', 'KAB. TUBAN', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3524, '35', 'KAB. LAMONGAN', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3525, '35', 'KAB. GRESIK', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3526, '35', 'KAB. BANGKALAN', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3527, '35', 'KAB. SAMPANG', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3528, '35', 'KAB. PAMEKASAN', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3529, '35', 'KAB. SUMENEP', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3571, '35', 'KOTA KEDIRI', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3572, '35', 'KOTA BLITAR', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3573, '35', 'KOTA MALANG', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3574, '35', 'KOTA PROBOLINGGO', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3575, '35', 'KOTA PASURUAN', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3576, '35', 'KOTA MOJOKERTO', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3577, '35', 'KOTA MADIUN', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3578, '35', 'KOTA SURABAYA', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3579, '35', 'KOTA BATU', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3601, '36', 'KAB. PANDEGLANG', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3602, '36', 'KAB. LEBAK', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3603, '36', 'KAB. TANGERANG', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3604, '36', 'KAB. SERANG', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3671, '36', 'KOTA TANGERANG', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3672, '36', 'KOTA CILEGON', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3673, '36', 'KOTA SERANG', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (3674, '36', 'KOTA TANGERANG SELATAN', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (5101, '51', 'KAB. JEMBRANA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (5102, '51', 'KAB. TABANAN', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (5103, '51', 'KAB. BADUNG', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (5104, '51', 'KAB. GIANYAR', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (5105, '51', 'KAB. KLUNGKUNG', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (5106, '51', 'KAB. BANGLI', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (5107, '51', 'KAB. KARANGASEM', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (5108, '51', 'KAB. BULELENG', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (5171, '51', 'KOTA DENPASAR', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (5201, '52', 'KAB. LOMBOK BARAT', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (5202, '52', 'KAB. LOMBOK TENGAH', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (5203, '52', 'KAB. LOMBOK TIMUR', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (5204, '52', 'KAB. SUMBAWA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (5205, '52', 'KAB. DOMPU', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (5206, '52', 'KAB. BIMA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (5207, '52', 'KAB. SUMBAWA BARAT', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (5208, '52', 'KAB. LOMBOK UTARA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (5271, '52', 'KOTA MATARAM', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (5272, '52', 'KOTA BIMA', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (5301, '53', 'KAB. KUPANG', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (5302, '53', 'KAB TIMOR TENGAH SELATAN', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (5303, '53', 'KAB. TIMOR TENGAH UTARA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (5304, '53', 'KAB. BELU', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (5305, '53', 'KAB. ALOR', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (5306, '53', 'KAB. FLORES TIMUR', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (5307, '53', 'KAB. SIKKA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (5308, '53', 'KAB. ENDE', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (5309, '53', 'KAB. NGADA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (5310, '53', 'KAB. MANGGARAI', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (5311, '53', 'KAB. SUMBA TIMUR', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (5312, '53', 'KAB. SUMBA BARAT', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (5313, '53', 'KAB. LEMBATA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (5314, '53', 'KAB. ROTE NDAO', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (5315, '53', 'KAB. MANGGARAI BARAT', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (5316, '53', 'KAB. NAGEKEO', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (5317, '53', 'KAB. SUMBA TENGAH', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (5318, '53', 'KAB. SUMBA BARAT DAYA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (5319, '53', 'KAB. MANGGARAI TIMUR', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (5320, '53', 'KAB. SABU RAIJUA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (5321, '53', 'KAB. MALAKA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (5371, '53', 'KOTA KUPANG', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (6101, '61', 'KAB. SAMBAS', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (6102, '61', 'KAB. MEMPAWAH', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (6103, '61', 'KAB. SANGGAU', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (6104, '61', 'KAB. KETAPANG', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (6105, '61', 'KAB. SINTANG', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (6106, '61', 'KAB. KAPUAS HULU', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (6107, '61', 'KAB. BENGKAYANG', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (6108, '61', 'KAB. LANDAK', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (6109, '61', 'KAB. SEKADAU', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (6110, '61', 'KAB. MELAWI', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (6111, '61', 'KAB. KAYONG UTARA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (6112, '61', 'KAB. KUBU RAYA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (6171, '61', 'KOTA PONTIANAK', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (6172, '61', 'KOTA SINGKAWANG', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (6201, '62', 'KAB. KOTAWARINGIN BARAT', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (6202, '62', 'KAB. KOTAWARINGIN TIMUR', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (6203, '62', 'KAB. KAPUAS', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (6204, '62', 'KAB. BARITO SELATAN', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (6205, '62', 'KAB. BARITO UTARA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (6206, '62', 'KAB. KATINGAN', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (6207, '62', 'KAB. SERUYAN', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (6208, '62', 'KAB. SUKAMARA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (6209, '62', 'KAB. LAMANDAU', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (6210, '62', 'KAB. GUNUNG MAS', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (6211, '62', 'KAB. PULANG PISAU', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (6212, '62', 'KAB. MURUNG RAYA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (6213, '62', 'KAB. BARITO TIMUR', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (6271, '62', 'KOTA PALANGKARAYA', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (6301, '63', 'KAB. TANAH LAUT', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (6302, '63', 'KAB. KOTABARU', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (6303, '63', 'KAB. BANJAR', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (6304, '63', 'KAB. BARITO KUALA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (6305, '63', 'KAB. TAPIN', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (6306, '63', 'KAB. HULU SUNGAI SELATAN', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (6307, '63', 'KAB. HULU SUNGAI TENGAH', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (6308, '63', 'KAB. HULU SUNGAI UTARA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (6309, '63', 'KAB. TABALONG', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (6310, '63', 'KAB. TANAH BUMBU', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (6311, '63', 'KAB. BALANGAN', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (6371, '63', 'KOTA BANJARMASIN', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (6372, '63', 'KOTA BANJARBARU', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (6401, '64', 'KAB. PASER', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (6402, '64', 'KAB. KUTAI KARTANEGARA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (6403, '64', 'KAB. BERAU', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (6407, '64', 'KAB. KUTAI BARAT', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (6408, '64', 'KAB. KUTAI TIMUR', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (6409, '64', 'KAB. PENAJAM PASER UTARA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (6411, '64', 'KAB. MAHAKAM ULU', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (6471, '64', 'KOTA BALIKPAPAN', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (6472, '64', 'KOTA SAMARINDA', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (6474, '64', 'KOTA BONTANG', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (6501, '65', 'KAB. BULUNGAN', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (6502, '65', 'KAB. MALINAU', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (6503, '65', 'KAB. NUNUKAN', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (6504, '65', 'KAB. TANA TIDUNG', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (6571, '65', 'KOTA TARAKAN', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7101, '71', 'KAB. BOLAANG MONGONDOW', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7102, '71', 'KAB. MINAHASA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7103, '71', 'KAB. KEPULAUAN SANGIHE', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7104, '71', 'KAB. KEPULAUAN TALAUD', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7105, '71', 'KAB. MINAHASA SELATAN', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7106, '71', 'KAB. MINAHASA UTARA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7107, '71', 'KAB. MINAHASA TENGGARA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7108, '71', 'KAB. BOLAANG MONGONDOW UTARA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7109, '71', 'KAB. KEP. SIAU TAGULANDANG BIARO', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7110, '71', 'KAB. BOLAANG MONGONDOW TIMUR', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7111, '71', 'KAB. BOLAANG MONGONDOW SELATAN', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7171, '71', 'KOTA MANADO', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7172, '71', 'KOTA BITUNG', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7173, '71', 'KOTA TOMOHON', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7174, '71', 'KOTA KOTAMOBAGU', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7201, '72', 'KAB. BANGGAI', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7202, '72', 'KAB. POSO', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7203, '72', 'KAB. DONGGALA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7204, '72', 'KAB. TOLI TOLI', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7205, '72', 'KAB. BUOL', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7206, '72', 'KAB. MOROWALI', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7207, '72', 'KAB. BANGGAI KEPULAUAN', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7208, '72', 'KAB. PARIGI MOUTONG', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7209, '72', 'KAB. TOJO UNA UNA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7210, '72', 'KAB. SIGI', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7211, '72', 'KAB. BANGGAI LAUT', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7212, '72', 'KAB. MOROWALI UTARA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7271, '72', 'KOTA PALU', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7301, '73', 'KAB. KEPULAUAN SELAYAR', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7302, '73', 'KAB. BULUKUMBA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7303, '73', 'KAB. BANTAENG', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7304, '73', 'KAB. JENEPONTO', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7305, '73', 'KAB. TAKALAR', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7306, '73', 'KAB. GOWA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7307, '73', 'KAB. SINJAI', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7308, '73', 'KAB. BONE', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7309, '73', 'KAB. MAROS', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7310, '73', 'KAB. PANGKAJENE KEPULAUAN', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7311, '73', 'KAB. BARRU', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7312, '73', 'KAB. SOPPENG', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7313, '73', 'KAB. WAJO', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7314, '73', 'KAB. SIDENRENG RAPPANG', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7315, '73', 'KAB. PINRANG', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7316, '73', 'KAB. ENREKANG', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7317, '73', 'KAB. LUWU', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7318, '73', 'KAB. TANA TORAJA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7322, '73', 'KAB. LUWU UTARA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7324, '73', 'KAB. LUWU TIMUR', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7326, '73', 'KAB. TORAJA UTARA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7371, '73', 'KOTA MAKASSAR', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7372, '73', 'KOTA PARE PARE', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7373, '73', 'KOTA PALOPO', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7401, '74', 'KAB. KOLAKA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7402, '74', 'KAB. KONAWE', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7403, '74', 'KAB. MUNA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7404, '74', 'KAB. BUTON', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7405, '74', 'KAB. KONAWE SELATAN', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7406, '74', 'KAB. BOMBANA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7407, '74', 'KAB. WAKATOBI', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7408, '74', 'KAB. KOLAKA UTARA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7409, '74', 'KAB. KONAWE UTARA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7410, '74', 'KAB. BUTON UTARA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7411, '74', 'KAB. KOLAKA TIMUR', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7412, '74', 'KAB. KONAWE KEPULAUAN', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7413, '74', 'KAB. MUNA BARAT', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7414, '74', 'KAB. BUTON TENGAH', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7415, '74', 'KAB. BUTON SELATAN', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7471, '74', 'KOTA KENDARI', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7472, '74', 'KOTA BAU BAU', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7501, '75', 'KAB. GORONTALO', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7502, '75', 'KAB. BOALEMO', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7503, '75', 'KAB. BONE BOLANGO', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7504, '75', 'KAB. PAHUWATO', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7505, '75', 'KAB. GORONTALO UTARA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7571, '75', 'KOTA GORONTALO', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7601, '76', 'KAB. MAMUJU UTARA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7602, '76', 'KAB. MAMUJU', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7603, '76', 'KAB. MAMASA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7604, '76', 'KAB. POLEWALI MANDAR', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7605, '76', 'KAB. MAJENE', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (7606, '76', 'KAB. MAMUJU TENGAH', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (8101, '81', 'KAB. MALUKU TENGAH', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (8102, '81', 'KAB. MALUKU TENGGARA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (8103, '81', 'KAB MALUKU TENGGARA BARAT', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (8104, '81', 'KAB. BURU', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (8105, '81', 'KAB. SERAM BAGIAN TIMUR', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (8106, '81', 'KAB. SERAM BAGIAN BARAT', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (8107, '81', 'KAB. KEPULAUAN ARU', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (8108, '81', 'KAB. MALUKU BARAT DAYA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (8109, '81', 'KAB. BURU SELATAN', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (8171, '81', 'KOTA AMBON', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (8172, '81', 'KOTA TUAL', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (8201, '82', 'KAB. HALMAHERA BARAT', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (8202, '82', 'KAB. HALMAHERA TENGAH', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (8203, '82', 'KAB. HALMAHERA UTARA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (8204, '82', 'KAB. HALMAHERA SELATAN', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (8205, '82', 'KAB. KEPULAUAN SULA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (8206, '82', 'KAB. HALMAHERA TIMUR', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (8207, '82', 'KAB. PULAU MOROTAI', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (8208, '82', 'KAB. PULAU TALIABU', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (8271, '82', 'KOTA TERNATE', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (8272, '82', 'KOTA TIDORE KEPULAUAN', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (9101, '91', 'KAB. MERAUKE', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (9102, '91', 'KAB. JAYAWIJAYA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (9103, '91', 'KAB. JAYAPURA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (9104, '91', 'KAB. NABIRE', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (9105, '91', 'KAB. KEPULAUAN YAPEN', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (9106, '91', 'KAB. BIAK NUMFOR', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (9107, '91', 'KAB. PUNCAK JAYA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (9108, '91', 'KAB. PANIAI', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (9109, '91', 'KAB. MIMIKA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (9110, '91', 'KAB. SARMI', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (9111, '91', 'KAB. KEEROM', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (9112, '91', 'KAB PEGUNUNGAN BINTANG', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (9113, '91', 'KAB. YAHUKIMO', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (9114, '91', 'KAB. TOLIKARA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (9115, '91', 'KAB. WAROPEN', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (9116, '91', 'KAB. BOVEN DIGOEL', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (9117, '91', 'KAB. MAPPI', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (9118, '91', 'KAB. ASMAT', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (9119, '91', 'KAB. SUPIORI', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (9120, '91', 'KAB. MAMBERAMO RAYA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (9121, '91', 'KAB. MAMBERAMO TENGAH', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (9122, '91', 'KAB. YALIMO', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (9123, '91', 'KAB. LANNY JAYA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (9124, '91', 'KAB. NDUGA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (9125, '91', 'KAB. PUNCAK', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (9126, '91', 'KAB. DOGIYAI', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (9127, '91', 'KAB. INTAN JAYA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (9128, '91', 'KAB. DEIYAI', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (9171, '91', 'KOTA JAYAPURA', 2, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (9201, '92', 'KAB. SORONG', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (9202, '92', 'KAB. MANOKWARI', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (9203, '92', 'KAB. FAK FAK', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (9204, '92', 'KAB. SORONG SELATAN', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (9205, '92', 'KAB. RAJA AMPAT', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (9206, '92', 'KAB. TELUK BINTUNI', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (9207, '92', 'KAB. TELUK WONDAMA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (9208, '92', 'KAB. KAIMANA', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (9209, '92', 'KAB. TAMBRAUW', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (9210, '92', 'KAB. MAYBRAT', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (9211, '92', 'KAB. MANOKWARI SELATAN', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (9212, '92', 'KAB. PEGUNUNGAN ARFAK', 1, NULL, NULL, NULL);
INSERT INTO public.keka_kotas (id, provinsi_id, nama, jenis_id, created_at, updated_at, deleted_at) VALUES (9271, '92', 'KOTA SORONG', 2, NULL, NULL, NULL);


--
-- TOC entry 3204 (class 0 OID 19089)
-- Dependencies: 206
-- Data for Name: keka_migrations; Type: TABLE DATA; Schema: public; Owner: kekajian_da74bas3
--



--
-- TOC entry 3198 (class 0 OID 19054)
-- Dependencies: 200
-- Data for Name: keka_user_activities; Type: TABLE DATA; Schema: public; Owner: kekajian_da74bas3
--

INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (1, 'Login berasil dengan username marsanix@gmail.com', 'POST api/login', '2018-10-27 21:25:43', 5, '2018-10-27 21:25:43', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (2, 'Login berasil dengan username marsanix@gmail.com', 'POST api/login', '2018-10-27 21:26:24', 5, '2018-10-27 21:26:24', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (3, 'Login berasil dengan username marsanix@gmail.com', 'POST api/login', '2018-10-27 21:26:49', 5, '2018-10-27 21:26:49', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (4, 'Login berasil dengan username marsanix@gmail.com', 'POST api/login', '2018-10-27 21:28:08', 5, '2018-10-27 21:28:08', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (5, 'Login berasil dengan username marsanix@gmail.com', 'POST api/login', '2018-10-27 21:28:48', 5, '2018-10-27 21:28:48', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (6, 'Login berasil dengan username marsanix@gmail.com', 'POST api/login', '2018-10-27 21:29:16', 5, '2018-10-27 21:29:16', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (7, 'Login berasil dengan username marsanix@gmail.com', 'POST api/login', '2018-10-27 21:29:53', 5, '2018-10-27 21:29:53', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (8, 'Login berasil dengan username marsanix@gmail.com', 'POST api/login', '2018-10-27 21:31:04', 5, '2018-10-27 21:31:04', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (9, 'Login berasil dengan username marsanix@gmail.com', 'POST api/login', '2018-10-27 21:35:07', 5, '2018-10-27 21:35:07', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (10, 'Login gagal dengan username marsanix@gmail.com', 'POST api/login', '2018-10-27 21:57:51', NULL, '2018-10-27 21:57:51', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (11, 'Login berasil dengan username marsanix@gmail.com', 'POST api/login', '2018-10-27 21:58:06', 5, '2018-10-27 21:58:06', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (12, 'Login gagal dengan username: marsanix@gmail.com dan password: asdfas', 'POST api/login', '2018-10-27 22:00:51', NULL, '2018-10-27 22:00:51', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (13, 'Login gagal dengan username: marsanix@gmail.com dan password: password', 'POST api/login', '2018-10-27 22:01:09', NULL, '2018-10-27 22:01:09', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (14, 'Login berasil dengan username marsanix@gmail.com', 'POST api/login', '2018-10-27 22:01:12', 5, '2018-10-27 22:01:12', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (15, 'Perubahan data profil user Marsani (marsanix@gmail.com)', 'PUT api/user/profile', '2018-10-27 22:21:26', 5, '2018-10-27 22:21:26', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (16, 'Login gagal dengan username: marsanix@gmail.com dan password: dasgfsd', 'POST api/login', '2018-10-27 22:39:50', NULL, '2018-10-27 22:39:50', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (17, 'Login gagal masuk dengan username: dvfdv@aeg.com dan password: adsf', 'api/login', '2018-10-27 22:45:27', NULL, '2018-10-27 22:45:27', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (18, 'Login berasil dengan username marsanix@gmail.com', 'POST api/login', '2018-10-27 22:45:40', 5, '2018-10-27 22:45:40', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (19, 'Login berasil dengan username marsanix@gmail.com', 'POST api/login', '2018-10-28 06:31:51', 5, '2018-10-28 06:31:51', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (20, 'Login gagal dengan username: marsanix@gmail.com dan password: p123456', 'POST api/login', '2018-10-28 11:05:56', NULL, '2018-10-28 11:05:56', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (21, 'Login berasil dengan username marsanix@gmail.com', 'POST api/login', '2018-10-28 11:06:01', 5, '2018-10-28 11:06:01', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (22, 'Login berasil dengan username marsanix@gmail.com', 'POST api/login', '2018-10-28 12:52:20', 5, '2018-10-28 12:52:20', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (23, 'Login berasil dengan username marsanix@gmail.com', 'POST api/login', '2018-10-28 13:13:37', 5, '2018-10-28 13:13:37', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (24, 'Login berasil dengan username marsanix@gmail.com', 'POST api/login', '2018-10-28 13:34:17', 5, '2018-10-28 13:34:17', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (25, 'Tambah kajian ''Kaum Yang Di Do''akan Malaikat'' pemateri Ustadz Abu Yahya Badrussalam, LC Hafizahullah', 'POST api/kajian', '2018-10-28 14:09:53', 5, '2018-10-28 14:09:53', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (26, 'Tambah kajian ''dasvaf'' pemateri savdfbdsgb', 'POST api/kajian', '2018-10-28 14:46:25', 5, '2018-10-28 14:46:25', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (27, 'Tambah kajian ''cxvxcbvxn'' pemateri cxvbcvbcvxnbcxn', 'POST api/kajian', '2018-10-28 15:50:48', 5, '2018-10-28 15:50:48', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (28, 'Tambah kajian ''xczvxczvxzc'' pemateri xczvxcbx', 'POST api/kajian', '2018-10-28 15:51:23', 5, '2018-10-28 15:51:23', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (30, 'Ubah data kajian ', 'PUT api/kajian/4', '2018-10-28 17:12:01', 5, '2018-10-28 17:12:01', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (31, 'Ubah data kajian ', 'PUT api/kajian/4', '2018-10-28 17:14:19', 5, '2018-10-28 17:14:19', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (32, 'Ubah data kajian ', 'PUT api/kajian/4', '2018-10-28 17:14:47', 5, '2018-10-28 17:14:47', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (33, 'Ubah data kajian ', 'PUT api/kajian/4', '2018-10-28 17:15:37', 5, '2018-10-28 17:15:37', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (34, 'Ubah data kajian ', 'PUT api/kajian/4', '2018-10-28 17:32:42', 5, '2018-10-28 17:32:42', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (35, 'Ubah data kajian ', 'PUT api/kajian/4', '2018-10-28 17:33:06', 5, '2018-10-28 17:33:06', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (36, 'Ubah data kajian ', 'PUT api/kajian/3', '2018-10-28 17:33:48', 5, '2018-10-28 17:33:48', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (37, 'Ubah data kajian ', 'PUT api/kajian/2', '2018-10-28 17:34:43', 5, '2018-10-28 17:34:43', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (38, 'Hapus data kajian '''' Tgl. 2018-10-29', 'DELETE api/kajian/2', '2018-10-28 20:40:49', 5, '2018-10-28 20:40:49', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (39, 'Tambah kajian ''bvcnvbnbm'' pemateri mnbcvbn,bmvbm mbvbv mnbnm', 'POST api/kajian', '2018-10-28 20:45:49', 5, '2018-10-28 20:45:49', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (40, 'Hapus data kajian ''cxvxcbvxn'' Tgl. 2018-10-29', 'DELETE api/kajian/3', '2018-10-28 20:45:54', 5, '2018-10-28 20:45:54', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (41, 'Hapus data kajian ID: 4, xczvxczvxzc / 2018-10-28', 'DELETE api/kajian/4', '2018-10-28 20:56:16', 5, '2018-10-28 20:56:16', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (42, 'Ubah data kajian ID: 5, bvcnvbnbm / 2018-10-28', 'PUT api/kajian/5', '2018-10-28 20:57:01', 5, '2018-10-28 20:57:01', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (43, 'Tambah kajian ID: 6, ccvbmvcnvvb,vbnbmn / 2018-10-29 pemateri ccvbjhmvn', 'POST api/kajian', '2018-10-28 20:58:21', 5, '2018-10-28 20:58:21', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (44, 'Ubah data kajian ID: 6, ccvbmvcnvvb,vbnbmn', 'PUT api/kajian/6', '2018-10-28 22:30:08', 5, '2018-10-28 22:30:08', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (45, 'Ubah data kajian ID: 5, bvcnvbnbm', 'PUT api/kajian/5', '2018-10-28 22:30:33', 5, '2018-10-28 22:30:33', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (46, 'Ubah data kajian ID: 6, ccvbmvcnvvb,vbnbmn', 'PUT api/kajian/6', '2018-10-28 22:38:17', 5, '2018-10-28 22:38:17', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (47, 'Ubah data kajian ID: 5, bvcnvbnbm', 'PUT api/kajian/5', '2018-10-28 22:38:29', 5, '2018-10-28 22:38:29', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (48, 'Ubah data kajian ID: 1, Kaum Yang Di Do''akan Malaikat', 'PUT api/kajian/1', '2018-10-28 22:38:45', 5, '2018-10-28 22:38:45', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (49, 'Ubah data kajian ID: 6, Kajian Tematik', 'PUT api/kajian/6', '2018-10-28 22:40:10', 5, '2018-10-28 22:40:10', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (50, 'Ubah data kajian ID: 5, Hambakan Diri Kepada Allah', 'PUT api/kajian/5', '2018-10-28 22:41:35', 5, '2018-10-28 22:41:35', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (51, 'Ubah data kajian ID: 6, Kajian Tematik', 'PUT api/kajian/6', '2018-10-28 22:42:18', 5, '2018-10-28 22:42:18', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (52, 'Ubah data kajian ID: 5, Hambakan Diri Kepada Allah', 'PUT api/kajian/5', '2018-10-28 22:42:25', 5, '2018-10-28 22:42:25', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (53, 'Login berasil dengan username marsanix@gmail.com', 'POST api/login', '2018-11-03 18:46:58', 5, '2018-11-03 18:46:58', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (54, 'Ubah data kajian ID: 6, Kajian Tematik', 'PUT api/kajian/6', '2018-11-03 21:33:09', 5, '2018-11-03 21:33:09', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (55, 'Ubah data kajian ID: 6, Kajian Tematik', 'PUT api/kajian/6', '2018-11-03 21:54:06', 5, '2018-11-03 21:54:06', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (56, 'Login gagal validasi dengan username ', 'api/login', '2018-11-07 22:22:18', NULL, '2018-11-07 22:22:18', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (57, 'Login gagal validasi dengan username ', 'api/login', '2018-11-07 22:22:58', NULL, '2018-11-07 22:22:58', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (58, 'Login berasil dengan username marsanix@gmail.com', 'POST api/login', '2018-11-07 22:25:52', 5, '2018-11-07 22:25:52', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (59, 'Login berasil dengan username marsanix@gmail.com', 'POST api/login', '2018-11-07 22:26:18', 5, '2018-11-07 22:26:18', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (60, 'Login gagal validasi dengan username ', 'api/login', '2018-11-07 22:30:18', NULL, '2018-11-07 22:30:18', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (61, 'Login gagal validasi dengan username ', 'api/login', '2018-11-07 22:32:15', NULL, '2018-11-07 22:32:15', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (62, 'Login gagal validasi dengan username ', 'api/login', '2018-11-07 22:33:26', NULL, '2018-11-07 22:33:26', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (63, 'Login gagal validasi dengan username ', 'api/login', '2018-11-07 22:33:57', NULL, '2018-11-07 22:33:57', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (64, 'Login gagal validasi dengan username ', 'api/login', '2018-11-07 22:34:29', NULL, '2018-11-07 22:34:29', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (65, 'Login gagal validasi dengan username ', 'api/login', '2018-11-07 22:35:19', NULL, '2018-11-07 22:35:19', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (66, 'Login gagal validasi dengan username ', 'api/login', '2018-11-07 22:35:42', NULL, '2018-11-07 22:35:42', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (67, 'Login gagal validasi dengan username ', 'api/login', '2018-11-07 22:35:56', NULL, '2018-11-07 22:35:56', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (68, 'Login gagal dengan username: marsanix@gmail.com dan password: R4h4si4ku**', 'POST api/login', '2018-11-07 22:36:06', NULL, '2018-11-07 22:36:06', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (69, 'Login berasil dengan username marsanix@gmail.com', 'POST api/login', '2018-11-07 22:36:20', 5, '2018-11-07 22:36:20', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (70, 'Login berasil dengan username marsanix@gmail.com', 'POST api/login', '2018-11-07 22:37:27', 5, '2018-11-07 22:37:27', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (71, 'Login berasil dengan username marsanix@gmail.com', 'POST api/login', '2018-11-07 22:42:13', 5, '2018-11-07 22:42:13', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (72, 'Login berasil dengan username marsanix@gmail.com', 'POST api/login', '2018-11-07 22:42:32', 5, '2018-11-07 22:42:32', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (73, 'Login berasil dengan username marsanix@gmail.com', 'POST api/login', '2018-11-07 22:50:10', 5, '2018-11-07 22:50:10', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (74, 'Login berasil dengan username marsanix@gmail.com', 'POST api/login', '2018-11-07 22:50:56', 5, '2018-11-07 22:50:56', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (75, 'Login berasil dengan username marsanix@gmail.com', 'POST api/login', '2018-11-07 22:51:21', 5, '2018-11-07 22:51:21', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (76, 'Login berasil dengan username marsanix@gmail.com', 'POST api/login', '2018-11-07 22:51:26', 5, '2018-11-07 22:51:26', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (77, 'Login gagal validasi dengan username ', 'api/login', '2018-11-07 22:53:30', NULL, '2018-11-07 22:53:30', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (78, 'Login gagal validasi dengan username ', 'api/login', '2018-11-07 22:57:03', NULL, '2018-11-07 22:57:03', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (79, 'Login berasil dengan username marsanix@gmail.com', 'POST api/login', '2018-11-07 23:06:39', 5, '2018-11-07 23:06:39', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (80, 'Login berasil dengan username marsanix@gmail.com', 'POST api/login', '2018-11-11 22:23:03', 5, '2018-11-11 22:23:03', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (81, 'Login berasil dengan username marsanix@gmail.com', 'POST api/login', '2018-11-11 22:25:16', 5, '2018-11-11 22:25:16', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (82, 'Login berasil dengan username marsanix@gmail.com', 'POST api/login', '2018-11-11 22:26:02', 5, '2018-11-11 22:26:02', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (83, 'Login berasil dengan username marsanix@gmail.com', 'POST api/login', '2018-11-11 22:26:53', 5, '2018-11-11 22:26:53', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (84, 'Login berasil dengan username marsanix@gmail.com', 'POST api/login', '2018-11-11 22:27:26', 5, '2018-11-11 22:27:26', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (85, 'Login berasil dengan username marsanix@gmail.com', 'POST api/login', '2018-11-11 22:28:51', 5, '2018-11-11 22:28:51', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (86, 'Login berasil dengan username marsanix@gmail.com', 'POST api/login', '2018-11-11 22:33:03', 5, '2018-11-11 22:33:03', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (87, 'Login berasil dengan username marsanix@gmail.com', 'POST api/login', '2018-11-11 22:36:39', 5, '2018-11-11 22:36:39', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (88, 'Login berasil dengan username marsanix@gmail.com', 'POST api/login', '2018-11-11 22:43:29', 5, '2018-11-11 22:43:29', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (89, 'Login berasil dengan username marsanix@gmail.com', 'POST api/login', '2018-11-11 22:46:27', 5, '2018-11-11 22:46:27', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (90, 'Login berasil dengan username marsanix@gmail.com', 'POST api/login', '2018-11-11 23:01:18', 5, '2018-11-11 23:01:18', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (91, 'Login berasil dengan username marsanix@gmail.com', 'POST api/login', '2018-11-11 23:10:30', 5, '2018-11-11 23:10:30', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (92, 'Login berasil dengan username marsanix@gmail.com', 'POST api/login', '2018-11-11 23:18:52', 5, '2018-11-11 23:18:52', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (93, 'Login berasil dengan username marsanix@gmail.com', 'POST api/login', '2018-11-11 23:57:17', 5, '2018-11-11 23:57:17', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (94, 'Login berasil dengan username marsanix@gmail.com', 'POST api/login', '2018-11-11 23:58:33', 5, '2018-11-11 23:58:33', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (95, 'Tambah kajian ID: 7, sdfsdafg, pemateri sdafadsf', 'POST api/kajian', '2018-11-11 23:58:59', 5, '2018-11-11 23:58:59', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (96, 'Login berasil dengan username marsanix@gmail.com', 'POST api/login', '2018-11-12 00:00:10', 5, '2018-11-12 00:00:10', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (97, 'Tambah kajian ID: 8, dsaf, pemateri asdfads', 'POST api/kajian', '2018-11-12 00:00:37', 5, '2018-11-12 00:00:37', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (98, 'Login berasil dengan username marsanix@gmail.com', 'POST api/login', '2018-11-13 22:31:27', 5, '2018-11-13 22:31:27', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (99, 'Login berasil dengan username marsanix@gmail.com', 'POST api/login', '2018-11-13 22:49:25', 5, '2018-11-13 22:49:25', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (100, 'Login berasil dengan username marsanix@gmail.com', 'POST api/login', '2018-11-14 22:30:13', 5, '2018-11-14 22:30:13', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (101, 'Tambah kajian ID: 9, avfvczvfadv, pemateri sadvadsfv', 'POST api/kajian', '2018-11-14 22:31:21', 5, '2018-11-14 22:31:21', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (102, 'Tambah kajian ID: 10, avfvczvfadv, pemateri sadvadsfv', 'POST api/kajian', '2018-11-14 22:31:32', 5, '2018-11-14 22:31:32', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (103, 'Tambah kajian ID: 11, avfvczvfadv, pemateri sadvadsfv', 'POST api/kajian', '2018-11-14 22:31:33', 5, '2018-11-14 22:31:33', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (104, 'Tambah kajian ID: 12, avfvczvfadv, pemateri sadvadsfv', 'POST api/kajian', '2018-11-14 22:31:34', 5, '2018-11-14 22:31:34', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (105, 'Tambah kajian ID: 13, avfvczvfadv, pemateri sadvadsfv', 'POST api/kajian', '2018-11-14 22:31:35', 5, '2018-11-14 22:31:35', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (106, 'Tambah kajian ID: 14, avfvczvfadv, pemateri sadvadsfv', 'POST api/kajian', '2018-11-14 22:31:36', 5, '2018-11-14 22:31:36', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (107, 'Tambah kajian ID: 15, avfvczvfadv, pemateri sadvadsfv', 'POST api/kajian', '2018-11-14 22:31:36', 5, '2018-11-14 22:31:36', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (108, 'Tambah kajian ID: 16, avfvczvfadv, pemateri sadvadsfv', 'POST api/kajian', '2018-11-14 22:31:36', 5, '2018-11-14 22:31:36', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (109, 'Tambah kajian ID: 17, avfvczvfadv, pemateri sadvadsfv', 'POST api/kajian', '2018-11-14 22:31:36', 5, '2018-11-14 22:31:36', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (110, 'Tambah kajian ID: 18, avfvczvfadv, pemateri sadvadsfv', 'POST api/kajian', '2018-11-14 22:31:36', 5, '2018-11-14 22:31:36', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (111, 'Tambah kajian ID: 19, avfvczvfadv, pemateri sadvadsfv', 'POST api/kajian', '2018-11-14 22:31:36', 5, '2018-11-14 22:31:36', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (112, 'Tambah kajian ID: 20, avfvczvfadv, pemateri sadvadsfv', 'POST api/kajian', '2018-11-14 22:31:36', 5, '2018-11-14 22:31:36', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (113, 'Tambah kajian ID: 21, avfvczvfadv, pemateri sadvadsfv', 'POST api/kajian', '2018-11-14 22:31:36', 5, '2018-11-14 22:31:36', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (114, 'Tambah kajian ID: 22, avfvczvfadv, pemateri sadvadsfv', 'POST api/kajian', '2018-11-14 22:31:37', 5, '2018-11-14 22:31:37', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (115, 'Tambah kajian ID: 23, avfvczvfadv, pemateri sadvadsfv', 'POST api/kajian', '2018-11-14 22:31:37', 5, '2018-11-14 22:31:37', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (116, 'Tambah kajian ID: 24, avfvczvfadv, pemateri sadvadsfv', 'POST api/kajian', '2018-11-14 22:31:37', 5, '2018-11-14 22:31:37', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (117, 'Tambah kajian ID: 25, avfvczvfadv, pemateri sadvadsfv', 'POST api/kajian', '2018-11-14 22:31:37', 5, '2018-11-14 22:31:37', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (118, 'Tambah kajian ID: 26, avfvczvfadv, pemateri sadvadsfv', 'POST api/kajian', '2018-11-14 22:31:37', 5, '2018-11-14 22:31:37', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (119, 'Login berasil dengan username marsanix@gmail.com', 'POST api/login', '2018-11-16 06:59:27', 5, '2018-11-16 06:59:27', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (120, 'Ubah data kajian ID: 22, avfvczvfadv', 'PUT api/kajian/22', '2018-11-16 07:44:10', 5, '2018-11-16 07:44:10', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (121, 'Ubah data kajian ID: 22, Kajian Rutin Akhwat', 'PUT api/kajian/22', '2018-11-16 07:44:59', 5, '2018-11-16 07:44:59', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (122, 'Ubah data kajian ID: 25, bbbbb', 'PUT api/kajian/25', '2018-11-16 07:45:17', 5, '2018-11-16 07:45:17', NULL, NULL, '::1');
INSERT INTO public.keka_user_activities (id, logs, endpoint, created_at, created_by, updated_at, updated_by, deleted_at, last_ip) VALUES (123, 'Ubah data kajian ID: 26, bbbbbb', 'PUT api/kajian/26', '2018-11-16 07:46:02', 5, '2018-11-16 07:46:02', NULL, NULL, '::1');


--
-- TOC entry 3194 (class 0 OID 19017)
-- Dependencies: 196
-- Data for Name: keka_user_groups; Type: TABLE DATA; Schema: public; Owner: kekajian_da74bas3
--

INSERT INTO public.keka_user_groups (id, name, created_at, updated_at, deleted_at) VALUES (-24, 'Super Administrator', NULL, NULL, NULL);
INSERT INTO public.keka_user_groups (id, name, created_at, updated_at, deleted_at) VALUES (0, 'Pengunjung', NULL, NULL, NULL);
INSERT INTO public.keka_user_groups (id, name, created_at, updated_at, deleted_at) VALUES (101, 'Member', NULL, NULL, NULL);
INSERT INTO public.keka_user_groups (id, name, created_at, updated_at, deleted_at) VALUES (212, 'Admin', NULL, NULL, NULL);


--
-- TOC entry 3196 (class 0 OID 19038)
-- Dependencies: 198
-- Data for Name: keka_users; Type: TABLE DATA; Schema: public; Owner: kekajian_da74bas3
--

INSERT INTO public.keka_users (id, name, email, birthplace, birthdate, address, hp, password, city_id, jobs, community, group_id, disabled, created_at, updated_at, deleted_at, created_by, updated_by, last_ip) VALUES (5, 'Marsani', 'marsanix@gmail.com', NULL, NULL, NULL, NULL, '$2y$10$MI1hap5kdcdpSOwNV.gtMOcy2227ICTbtQ0sa3YQDixayrDo/AHge', NULL, NULL, NULL, -24, 0, '2018-10-27 21:13:39', '2018-10-27 22:21:26', NULL, NULL, 5, NULL);


--
-- TOC entry 3218 (class 0 OID 0)
-- Dependencies: 203
-- Name: keka_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kekajian_da74bas3
--

SELECT pg_catalog.setval('public.keka_jobs_id_seq', 5, true);


--
-- TOC entry 3219 (class 0 OID 0)
-- Dependencies: 201
-- Name: keka_jwt_seq; Type: SEQUENCE SET; Schema: public; Owner: kekajian_da74bas3
--

SELECT pg_catalog.setval('public.keka_jwt_seq', 46, true);


--
-- TOC entry 3220 (class 0 OID 0)
-- Dependencies: 209
-- Name: keka_kajian_photos_seq; Type: SEQUENCE SET; Schema: public; Owner: kekajian_da74bas3
--

SELECT pg_catalog.setval('public.keka_kajian_photos_seq', 8, true);


--
-- TOC entry 3221 (class 0 OID 0)
-- Dependencies: 211
-- Name: keka_kajians_seq; Type: SEQUENCE SET; Schema: public; Owner: kekajian_da74bas3
--

SELECT pg_catalog.setval('public.keka_kajians_seq', 26, true);


--
-- TOC entry 3222 (class 0 OID 0)
-- Dependencies: 205
-- Name: keka_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kekajian_da74bas3
--

SELECT pg_catalog.setval('public.keka_migrations_id_seq', 1, false);


--
-- TOC entry 3223 (class 0 OID 0)
-- Dependencies: 199
-- Name: keka_user_activities_seq; Type: SEQUENCE SET; Schema: public; Owner: kekajian_da74bas3
--

SELECT pg_catalog.setval('public.keka_user_activities_seq', 123, true);


--
-- TOC entry 3224 (class 0 OID 0)
-- Dependencies: 197
-- Name: keka_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kekajian_da74bas3
--

SELECT pg_catalog.setval('public.keka_users_id_seq', 5, true);


--
-- TOC entry 3063 (class 2606 OID 19084)
-- Name: keka_jobs keka_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: kekajian_da74bas3
--

ALTER TABLE ONLY public.keka_jobs
    ADD CONSTRAINT keka_jobs_pkey PRIMARY KEY (id);


--
-- TOC entry 3060 (class 2606 OID 19073)
-- Name: keka_jwt keka_jwt_pkey; Type: CONSTRAINT; Schema: public; Owner: kekajian_da74bas3
--

ALTER TABLE ONLY public.keka_jwt
    ADD CONSTRAINT keka_jwt_pkey PRIMARY KEY (id);


--
-- TOC entry 3071 (class 2606 OID 19162)
-- Name: keka_kajian_photos keka_kajian_photos_pkey; Type: CONSTRAINT; Schema: public; Owner: kekajian_da74bas3
--

ALTER TABLE ONLY public.keka_kajian_photos
    ADD CONSTRAINT keka_kajian_photos_pkey PRIMARY KEY (id);


--
-- TOC entry 3067 (class 2606 OID 19201)
-- Name: keka_kajians keka_kajian_pkey; Type: CONSTRAINT; Schema: public; Owner: kekajian_da74bas3
--

ALTER TABLE ONLY public.keka_kajians
    ADD CONSTRAINT keka_kajian_pkey PRIMARY KEY (id);


--
-- TOC entry 3069 (class 2606 OID 19151)
-- Name: keka_kotas keka_kotas_pkey; Type: CONSTRAINT; Schema: public; Owner: kekajian_da74bas3
--

ALTER TABLE ONLY public.keka_kotas
    ADD CONSTRAINT keka_kotas_pkey PRIMARY KEY (id);


--
-- TOC entry 3058 (class 2606 OID 19062)
-- Name: keka_user_activities keka_log_activities_pkey; Type: CONSTRAINT; Schema: public; Owner: kekajian_da74bas3
--

ALTER TABLE ONLY public.keka_user_activities
    ADD CONSTRAINT keka_log_activities_pkey PRIMARY KEY (id);


--
-- TOC entry 3065 (class 2606 OID 19094)
-- Name: keka_migrations keka_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: kekajian_da74bas3
--

ALTER TABLE ONLY public.keka_migrations
    ADD CONSTRAINT keka_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 3050 (class 2606 OID 19021)
-- Name: keka_user_groups keka_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: kekajian_da74bas3
--

ALTER TABLE ONLY public.keka_user_groups
    ADD CONSTRAINT keka_user_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 3053 (class 2606 OID 19048)
-- Name: keka_users keka_users_pkey; Type: CONSTRAINT; Schema: public; Owner: kekajian_da74bas3
--

ALTER TABLE ONLY public.keka_users
    ADD CONSTRAINT keka_users_pkey PRIMARY KEY (id);


--
-- TOC entry 3055 (class 2606 OID 19050)
-- Name: keka_users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: kekajian_da74bas3
--

ALTER TABLE ONLY public.keka_users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- TOC entry 3061 (class 1259 OID 19124)
-- Name: jobs_queue_reserved_reserved_at_index; Type: INDEX; Schema: public; Owner: kekajian_da74bas3
--

CREATE INDEX jobs_queue_reserved_reserved_at_index ON public.keka_jobs USING btree (queue, reserved, reserved_at);


--
-- TOC entry 3051 (class 1259 OID 19022)
-- Name: user_groups_name_UNIQUE; Type: INDEX; Schema: public; Owner: kekajian_da74bas3
--

CREATE INDEX "user_groups_name_UNIQUE" ON public.keka_user_groups USING btree (name);


--
-- TOC entry 3056 (class 1259 OID 19051)
-- Name: users_name_index; Type: INDEX; Schema: public; Owner: kekajian_da74bas3
--

CREATE INDEX users_name_index ON public.keka_users USING btree (name);


--
-- TOC entry 3072 (class 2606 OID 19202)
-- Name: keka_kajian_photos keka_kajian_photos_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kekajian_da74bas3
--

ALTER TABLE ONLY public.keka_kajian_photos
    ADD CONSTRAINT keka_kajian_photos_fkey FOREIGN KEY (kajian_id) REFERENCES public.keka_kajians(id) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2018-11-17 16:36:50 WIB

--
-- PostgreSQL database dump complete
--

