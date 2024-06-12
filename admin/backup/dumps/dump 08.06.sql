--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

-- Started on 2024-06-08 12:49:28

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

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- TOC entry 4901 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 241 (class 1255 OID 16701)
-- Name: ajoutequipement(text, text, real, text, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.ajoutequipement(text, text, real, text, integer, integer) RETURNS integer
    LANGUAGE plpgsql
    AS $_$
  declare p_nom alias for $1;
  declare p_description alias for $2;
  declare p_tarif alias for $3;
  declare p_image alias for $4;
  declare p_stock alias for $5;
  declare p_id_categorie alias for $6;
  declare id integer;
  declare retour integer;

begin
 select into id id_equipement from equipement where nome = p_nom;
 if not found
 then
   insert into equipement (nome, descriptione, tarife, image, stock, id_categorie) values (p_nom, p_description, p_tarif, p_image, p_stock, p_id_categorie);
   select into id id_equipement from equipement where nome = p_nom;
   if not found
   then
     retour = -1;  --échec de la requête
   else
     retour = 1;   -- insertion ok
   end if;
 else
   retour = 0;      -- déjà en BD
 end if;
 return retour;
 end;
$_$;


--
-- TOC entry 229 (class 1255 OID 16695)
-- Name: deleteequipement(integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.deleteequipement(id integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    DELETE FROM equipement WHERE id_equipement = id;
END;
$$;


--
-- TOC entry 227 (class 1255 OID 16645)
-- Name: insert_random_client_code(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.insert_random_client_code() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.code := generate_random_client_code(); -- Appel de la fonction pour générer le code client
    RETURN NEW;
END;
$$;


--
-- TOC entry 228 (class 1255 OID 16694)
-- Name: updateequipement(integer, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.updateequipement(integer, text, text) RETURNS integer
    LANGUAGE plpgsql
    AS $_$
	declare p_id alias for $1;
	declare p_champ alias for $2;
	declare p_valeur alias for $3;
BEGIN
    EXECUTE format('UPDATE equipement SET %I = %L WHERE id_equipement = %L', p_champ, p_valeur, p_id);
    -- execute format : utilisé lorsque les champs sont dynamiques
    -- %I : remplace le champ colonne, de manière sécurisée (échappement pour éviter les injections sql)
    -- %I : remplace la valeur, de manière sécurisée
    RETURN 1;
END;
$_$;


--
-- TOC entry 225 (class 1255 OID 16642)
-- Name: verifier_admin(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.verifier_admin(text, text) RETURNS integer
    LANGUAGE plpgsql
    AS $_$
	declare p_login alias for $1;
	declare p_password alias for $2;
	declare id integer;
	declare retour integer;
	
begin
	select into id id_admin from admin where login=p_login and password = p_password;
	if not found 
	then
	  retour = 0;
	else
	  retour =1;
	end if;  
	return retour;
end;
$_$;


--
-- TOC entry 226 (class 1255 OID 16643)
-- Name: verifier_client(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.verifier_client(text, text) RETURNS integer
    LANGUAGE plpgsql
    AS $_$
 declare p_login alias for $1;
 declare p_password alias for $2;

 declare id integer;
 declare retour integer;

 begin
 select into id id_client from client where login=p_login and password = p_password;
if not found
 then
  retour = 0;
  else
retour =1;
 end if;
return retour;
  end;
$_$;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 222 (class 1259 OID 16620)
-- Name: admin; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.admin (
    id_admin integer NOT NULL,
    login text NOT NULL,
    password text NOT NULL,
    etat boolean NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 16619)
-- Name: admin_id_admin_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.admin_id_admin_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4902 (class 0 OID 0)
-- Dependencies: 221
-- Name: admin_id_admin_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.admin_id_admin_seq OWNED BY public.admin.id_admin;


--
-- TOC entry 224 (class 1259 OID 16656)
-- Name: categorie; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.categorie (
    id_categ integer NOT NULL,
    nom_categ character varying(50) NOT NULL
);


--
-- TOC entry 223 (class 1259 OID 16655)
-- Name: categorie_id_categ_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.categorie_id_categ_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4903 (class 0 OID 0)
-- Dependencies: 223
-- Name: categorie_id_categ_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.categorie_id_categ_seq OWNED BY public.categorie.id_categ;


--
-- TOC entry 218 (class 1259 OID 16588)
-- Name: client; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.client (
    id_client integer NOT NULL,
    code text,
    nomc text NOT NULL,
    telephonec text NOT NULL,
    prenomc text NOT NULL,
    emailc text NOT NULL,
    password text
);


--
-- TOC entry 217 (class 1259 OID 16587)
-- Name: client_id_client_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.client_id_client_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4904 (class 0 OID 0)
-- Dependencies: 217
-- Name: client_id_client_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.client_id_client_seq OWNED BY public.client.id_client;


--
-- TOC entry 216 (class 1259 OID 16577)
-- Name: equipement; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.equipement (
    id_equipement integer NOT NULL,
    nome text NOT NULL,
    descriptione text,
    tarife real,
    image text,
    stock integer,
    id_categorie integer
);


--
-- TOC entry 215 (class 1259 OID 16576)
-- Name: equipement_id_equipement_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.equipement_id_equipement_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4905 (class 0 OID 0)
-- Dependencies: 215
-- Name: equipement_id_equipement_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.equipement_id_equipement_seq OWNED BY public.equipement.id_equipement;


--
-- TOC entry 220 (class 1259 OID 16601)
-- Name: location; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.location (
    id_location integer NOT NULL,
    dated date NOT NULL,
    datef date NOT NULL,
    prix_total real NOT NULL,
    mode_paiement text,
    quantiteloue integer NOT NULL,
    id_equipement integer NOT NULL,
    id_client integer NOT NULL
);


--
-- TOC entry 219 (class 1259 OID 16600)
-- Name: location_id_location_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.location_id_location_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4906 (class 0 OID 0)
-- Dependencies: 219
-- Name: location_id_location_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.location_id_location_seq OWNED BY public.location.id_location;


--
-- TOC entry 4717 (class 2604 OID 16623)
-- Name: admin id_admin; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin ALTER COLUMN id_admin SET DEFAULT nextval('public.admin_id_admin_seq'::regclass);


--
-- TOC entry 4718 (class 2604 OID 16659)
-- Name: categorie id_categ; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categorie ALTER COLUMN id_categ SET DEFAULT nextval('public.categorie_id_categ_seq'::regclass);


--
-- TOC entry 4715 (class 2604 OID 16591)
-- Name: client id_client; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.client ALTER COLUMN id_client SET DEFAULT nextval('public.client_id_client_seq'::regclass);


--
-- TOC entry 4714 (class 2604 OID 16580)
-- Name: equipement id_equipement; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.equipement ALTER COLUMN id_equipement SET DEFAULT nextval('public.equipement_id_equipement_seq'::regclass);


--
-- TOC entry 4716 (class 2604 OID 16604)
-- Name: location id_location; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.location ALTER COLUMN id_location SET DEFAULT nextval('public.location_id_location_seq'::regclass);


--
-- TOC entry 4893 (class 0 OID 16620)
-- Dependencies: 222
-- Data for Name: admin; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.admin (id_admin, login, password, etat) VALUES (1, 'Audry', 'audry2004', true);


--
-- TOC entry 4895 (class 0 OID 16656)
-- Dependencies: 224
-- Data for Name: categorie; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.categorie (id_categ, nom_categ) VALUES (1, 'Transport et manutention');
INSERT INTO public.categorie (id_categ, nom_categ) VALUES (3, 'Espace verts');
INSERT INTO public.categorie (id_categ, nom_categ) VALUES (4, 'Nettoyage');
INSERT INTO public.categorie (id_categ, nom_categ) VALUES (7, 'Outillage professionnel');
INSERT INTO public.categorie (id_categ, nom_categ) VALUES (8, 'Démolition');
INSERT INTO public.categorie (id_categ, nom_categ) VALUES (9, 'Terrassement');


--
-- TOC entry 4889 (class 0 OID 16588)
-- Dependencies: 218
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.client (id_client, code, nomc, telephonec, prenomc, emailc, password) VALUES (5, '11111', 'Manon', '0123456789', 'Manon', 'client@example.com', '0123');
INSERT INTO public.client (id_client, code, nomc, telephonec, prenomc, emailc, password) VALUES (7, '1111', 't', 't', 't', 't@t', 't');
INSERT INTO public.client (id_client, code, nomc, telephonec, prenomc, emailc, password) VALUES (9, '66067d7c4f56c', 'test', 'test', 'test', 'tt@t', 't');
INSERT INTO public.client (id_client, code, nomc, telephonec, prenomc, emailc, password) VALUES (10, '66067dc73b8c7', 'aa', 'aa', 'aa', 'a@aa', 'a');
INSERT INTO public.client (id_client, code, nomc, telephonec, prenomc, emailc, password) VALUES (8, '22222', 'a', 'a', 'a', 'a@a', 'a');
INSERT INTO public.client (id_client, code, nomc, telephonec, prenomc, emailc, password) VALUES (11, '66150416c3633', 'Degreve', '1234', 'Thomas', 't.d@t.d', '1234');
INSERT INTO public.client (id_client, code, nomc, telephonec, prenomc, emailc, password) VALUES (12, '66150acfdbb7a', 'aaaa', '1234', 'aaaaaaa', 'a@b', '1234');
INSERT INTO public.client (id_client, code, nomc, telephonec, prenomc, emailc, password) VALUES (13, '6616673b699a5', 'Dupont', '1234', 'Audry', 'audry@a', '1234');
INSERT INTO public.client (id_client, code, nomc, telephonec, prenomc, emailc, password) VALUES (14, '661bbaeeed203', 'a', '1234', 'a', 'sss@s', '123');
INSERT INTO public.client (id_client, code, nomc, telephonec, prenomc, emailc, password) VALUES (16, '661bd7163660f', 'a', '1234', 'a', 'a@d', 'a');
INSERT INTO public.client (id_client, code, nomc, telephonec, prenomc, emailc, password) VALUES (17, '661e3717c3de3', 'az', '123', 'az', 'a@zzzzz', 'a');
INSERT INTO public.client (id_client, code, nomc, telephonec, prenomc, emailc, password) VALUES (18, '6633dcf301544', 'Hansen', '0498565913', 'Candice', 'candicehansen79@gmail.com', 'Obilyw1994');


--
-- TOC entry 4887 (class 0 OID 16577)
-- Dependencies: 216
-- Data for Name: equipement; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.equipement (id_equipement, nome, descriptione, tarife, image, stock, id_categorie) VALUES (8, 'Autolaveuse', 'Peut-être controllée par client, lave tout type de sols', 38.99, 'autolaveuse2.jpg', 10, 4);
INSERT INTO public.equipement (id_equipement, nome, descriptione, tarife, image, stock, id_categorie) VALUES (1, 'Scie électrique', 'Une scie électrique portable', 25.99, 'scieElec.jpg', 10, 7);
INSERT INTO public.equipement (id_equipement, nome, descriptione, tarife, image, stock, id_categorie) VALUES (10, 'Tronconneuse', 'Découpe du bois en général', 18.5, 'tronco.jpg', 2, 3);
INSERT INTO public.equipement (id_equipement, nome, descriptione, tarife, image, stock, id_categorie) VALUES (11, 'Elévateur', 'Véhicule motorisé permettant l''élévation d''objets', 12.99, 'elevateur.jpg', 20, 1);
INSERT INTO public.equipement (id_equipement, nome, descriptione, tarife, image, stock, id_categorie) VALUES (14, 'Marteau piqueur', 'Outil de démolition ', 15.5, 'marteauPic.jpg', 1, 8);
INSERT INTO public.equipement (id_equipement, nome, descriptione, tarife, image, stock, id_categorie) VALUES (12, 'Remorque', 'Remorques multi-fonctions', 20, 'remorque.jpg', 3, 1);
INSERT INTO public.equipement (id_equipement, nome, descriptione, tarife, image, stock, id_categorie) VALUES (7, 'Autolaveuse (XL)', 'Machine automatique qui lave les sols de tout type', 39.99, 'autolaveuse.jpg', 8, 4);
INSERT INTO public.equipement (id_equipement, nome, descriptione, tarife, image, stock, id_categorie) VALUES (13, 'Rouleur', 'Permet d''aplatir les sols', 9.99, 'rouleauGazon.jpg', 2, 9);


--
-- TOC entry 4891 (class 0 OID 16601)
-- Dependencies: 220
-- Data for Name: location; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.location (id_location, dated, datef, prix_total, mode_paiement, quantiteloue, id_equipement, id_client) VALUES (4, '2024-04-28', '2024-05-05', 39.99, 'carte', 1, 7, 8);
INSERT INTO public.location (id_location, dated, datef, prix_total, mode_paiement, quantiteloue, id_equipement, id_client) VALUES (5, '2024-04-28', '2024-05-05', 39.99, 'carte', 1, 7, 7);
INSERT INTO public.location (id_location, dated, datef, prix_total, mode_paiement, quantiteloue, id_equipement, id_client) VALUES (6, '2024-05-07', '2024-05-09', 25.99, 'carte', 1, 1, 8);
INSERT INTO public.location (id_location, dated, datef, prix_total, mode_paiement, quantiteloue, id_equipement, id_client) VALUES (7, '2024-05-07', '2024-05-09', 25.99, 'carte', 1, 1, 8);
INSERT INTO public.location (id_location, dated, datef, prix_total, mode_paiement, quantiteloue, id_equipement, id_client) VALUES (8, '2024-05-05', '2024-05-12', 79.98, 'carte', 2, 7, 8);
INSERT INTO public.location (id_location, dated, datef, prix_total, mode_paiement, quantiteloue, id_equipement, id_client) VALUES (9, '2024-05-05', '2024-05-12', 919.77, 'carte', 23, 7, 8);
INSERT INTO public.location (id_location, dated, datef, prix_total, mode_paiement, quantiteloue, id_equipement, id_client) VALUES (10, '2024-05-05', '2024-05-12', 25.99, 'carte', 1, 1, 7);
INSERT INTO public.location (id_location, dated, datef, prix_total, mode_paiement, quantiteloue, id_equipement, id_client) VALUES (11, '2024-04-30', '2024-05-07', 39.99, 'carte', 1, 7, 8);
INSERT INTO public.location (id_location, dated, datef, prix_total, mode_paiement, quantiteloue, id_equipement, id_client) VALUES (12, '2024-04-30', '2024-05-07', 39.99, 'carte', 1, 7, 8);
INSERT INTO public.location (id_location, dated, datef, prix_total, mode_paiement, quantiteloue, id_equipement, id_client) VALUES (13, '2024-05-12', '2024-06-09', 38.99, 'carte', 1, 8, 7);
INSERT INTO public.location (id_location, dated, datef, prix_total, mode_paiement, quantiteloue, id_equipement, id_client) VALUES (14, '2024-05-19', '2024-06-02', 399.9, 'carte', 10, 7, 8);
INSERT INTO public.location (id_location, dated, datef, prix_total, mode_paiement, quantiteloue, id_equipement, id_client) VALUES (15, '2024-04-21', '2024-05-05', 39.99, 'carte', 1, 7, 8);
INSERT INTO public.location (id_location, dated, datef, prix_total, mode_paiement, quantiteloue, id_equipement, id_client) VALUES (16, '2024-04-28', '2024-05-05', 39.99, 'carte', 1, 7, 8);
INSERT INTO public.location (id_location, dated, datef, prix_total, mode_paiement, quantiteloue, id_equipement, id_client) VALUES (17, '2024-05-16', '2024-05-17', 39.99, 'espece', 1, 7, 18);
INSERT INTO public.location (id_location, dated, datef, prix_total, mode_paiement, quantiteloue, id_equipement, id_client) VALUES (18, '2024-05-07', '2024-05-08', 79.98, 'carte', 2, 7, 17);
INSERT INTO public.location (id_location, dated, datef, prix_total, mode_paiement, quantiteloue, id_equipement, id_client) VALUES (19, '2024-05-07', '2024-05-08', 77.97, 'cheque', 3, 1, 14);
INSERT INTO public.location (id_location, dated, datef, prix_total, mode_paiement, quantiteloue, id_equipement, id_client) VALUES (20, '2024-05-07', '2024-05-08', 39.99, 'carte', 1, 7, 8);
INSERT INTO public.location (id_location, dated, datef, prix_total, mode_paiement, quantiteloue, id_equipement, id_client) VALUES (21, '2024-05-07', '2024-05-08', 39.99, 'carte', 1, 7, 8);
INSERT INTO public.location (id_location, dated, datef, prix_total, mode_paiement, quantiteloue, id_equipement, id_client) VALUES (22, '2024-05-26', '2024-05-26', 39.99, 'carte', 1, 7, 8);
INSERT INTO public.location (id_location, dated, datef, prix_total, mode_paiement, quantiteloue, id_equipement, id_client) VALUES (23, '2024-05-19', '2024-05-16', 39.99, 'carte', 1, 7, 8);


--
-- TOC entry 4907 (class 0 OID 0)
-- Dependencies: 221
-- Name: admin_id_admin_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.admin_id_admin_seq', 1, true);


--
-- TOC entry 4908 (class 0 OID 0)
-- Dependencies: 223
-- Name: categorie_id_categ_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.categorie_id_categ_seq', 9, true);


--
-- TOC entry 4909 (class 0 OID 0)
-- Dependencies: 217
-- Name: client_id_client_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.client_id_client_seq', 18, true);


--
-- TOC entry 4910 (class 0 OID 0)
-- Dependencies: 215
-- Name: equipement_id_equipement_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.equipement_id_equipement_seq', 14, true);


--
-- TOC entry 4911 (class 0 OID 0)
-- Dependencies: 219
-- Name: location_id_location_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.location_id_location_seq', 23, true);


--
-- TOC entry 4732 (class 2606 OID 16629)
-- Name: admin admin_login_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_login_key UNIQUE (login);


--
-- TOC entry 4734 (class 2606 OID 16627)
-- Name: admin admin_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (id_admin);


--
-- TOC entry 4736 (class 2606 OID 16663)
-- Name: categorie categorie_nom_categ_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categorie
    ADD CONSTRAINT categorie_nom_categ_key UNIQUE (nom_categ);


--
-- TOC entry 4738 (class 2606 OID 16661)
-- Name: categorie categorie_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categorie
    ADD CONSTRAINT categorie_pkey PRIMARY KEY (id_categ);


--
-- TOC entry 4724 (class 2606 OID 16597)
-- Name: client client_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_code_key UNIQUE (code);


--
-- TOC entry 4726 (class 2606 OID 16599)
-- Name: client client_emailc_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_emailc_key UNIQUE (emailc);


--
-- TOC entry 4728 (class 2606 OID 16595)
-- Name: client client_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (id_client);


--
-- TOC entry 4720 (class 2606 OID 16586)
-- Name: equipement equipement_nome_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.equipement
    ADD CONSTRAINT equipement_nome_key UNIQUE (nome);


--
-- TOC entry 4722 (class 2606 OID 16584)
-- Name: equipement equipement_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.equipement
    ADD CONSTRAINT equipement_pkey PRIMARY KEY (id_equipement);


--
-- TOC entry 4730 (class 2606 OID 16608)
-- Name: location location_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.location
    ADD CONSTRAINT location_pkey PRIMARY KEY (id_location);


--
-- TOC entry 4742 (class 2620 OID 16646)
-- Name: client generate_client_code_trigger; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER generate_client_code_trigger BEFORE INSERT ON public.client FOR EACH ROW EXECUTE FUNCTION public.insert_random_client_code();

ALTER TABLE public.client DISABLE TRIGGER generate_client_code_trigger;


--
-- TOC entry 4739 (class 2606 OID 16696)
-- Name: equipement fk_id_categ; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.equipement
    ADD CONSTRAINT fk_id_categ FOREIGN KEY (id_categorie) REFERENCES public.categorie(id_categ) NOT VALID;


--
-- TOC entry 4740 (class 2606 OID 16614)
-- Name: location location_id_client_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.location
    ADD CONSTRAINT location_id_client_fkey FOREIGN KEY (id_client) REFERENCES public.client(id_client);


--
-- TOC entry 4741 (class 2606 OID 16609)
-- Name: location location_id_equipement_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.location
    ADD CONSTRAINT location_id_equipement_fkey FOREIGN KEY (id_equipement) REFERENCES public.equipement(id_equipement);


-- Completed on 2024-06-08 12:49:28

--
-- PostgreSQL database dump complete
--

