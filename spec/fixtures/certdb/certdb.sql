--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: certificates; Type: TABLE; Schema: public; Owner: vagrant; Tablespace: 
--

CREATE TABLE certificates (
    serial_number bytea NOT NULL,
    authority_key_identifier bytea NOT NULL,
    ca_label bytea,
    status bytea NOT NULL,
    reason integer,
    expiry timestamp with time zone,
    revoked_at timestamp with time zone,
    pem bytea NOT NULL
);


ALTER TABLE public.certificates OWNER TO vagrant;

--
-- Name: ocsp_responses; Type: TABLE; Schema: public; Owner: vagrant; Tablespace: 
--

CREATE TABLE ocsp_responses (
    serial_number bytea NOT NULL,
    authority_key_identifier bytea NOT NULL,
    body bytea NOT NULL,
    expiry timestamp with time zone
);


ALTER TABLE public.ocsp_responses OWNER TO vagrant;

--
-- Data for Name: certificates; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY certificates (serial_number, authority_key_identifier, ca_label, status, reason, expiry, revoked_at, pem) FROM stdin;
\.


--
-- Data for Name: ocsp_responses; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY ocsp_responses (serial_number, authority_key_identifier, body, expiry) FROM stdin;
\.


--
-- Name: certificates_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant; Tablespace: 
--

ALTER TABLE ONLY certificates
    ADD CONSTRAINT certificates_pkey PRIMARY KEY (serial_number, authority_key_identifier);


--
-- Name: ocsp_responses_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant; Tablespace: 
--

ALTER TABLE ONLY ocsp_responses
    ADD CONSTRAINT ocsp_responses_pkey PRIMARY KEY (serial_number, authority_key_identifier);


--
-- Name: ocsp_responses_serial_number_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY ocsp_responses
    ADD CONSTRAINT ocsp_responses_serial_number_fkey FOREIGN KEY (serial_number, authority_key_identifier) REFERENCES certificates(serial_number, authority_key_identifier);


--
-- Name: public; Type: ACL; Schema: -; Owner: vagrant
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO vagrant;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

