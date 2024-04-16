
--




--
-- TOC entry 4898 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 227 (class 1255 OID 16645)
-- Name: insert_random_client_code(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.insert_random_client_code() RETURNS trigger
    LANGUAGE plpgsql
    AS '
BEGIN
    NEW.code := generate_random_client_code(); -- Appel de la fonction pour générer le code client
    RETURN NEW;
END;
';


--
-- TOC entry 225 (class 1255 OID 16642)
-- Name: verifier_admin(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.verifier_admin(text, text) RETURNS integer
    LANGUAGE plpgsql
    AS '
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
';


--
-- TOC entry 226 (class 1255 OID 16643)
-- Name: verifier_client(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.verifier_client(text, text) RETURNS integer
    LANGUAGE plpgsql
    AS '
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
';


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
-- TOC entry 4899 (class 0 OID 0)
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
-- TOC entry 4900 (class 0 OID 0)
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
-- TOC entry 4901 (class 0 OID 0)
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
    tarife text,
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
-- TOC entry 4902 (class 0 OID 0)
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
-- TOC entry 4903 (class 0 OID 0)
-- Dependencies: 219
-- Name: location_id_location_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.location_id_location_seq OWNED BY public.location.id_location;


--
-- TOC entry 4714 (class 2604 OID 16623)
-- Name: admin id_admin; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin ALTER COLUMN id_admin SET DEFAULT nextval('public.admin_id_admin_seq'::regclass);


--
-- TOC entry 4715 (class 2604 OID 16659)
-- Name: categorie id_categ; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categorie ALTER COLUMN id_categ SET DEFAULT nextval('public.categorie_id_categ_seq'::regclass);


--
-- TOC entry 4712 (class 2604 OID 16591)
-- Name: client id_client; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.client ALTER COLUMN id_client SET DEFAULT nextval('public.client_id_client_seq'::regclass);


--
-- TOC entry 4711 (class 2604 OID 16580)
-- Name: equipement id_equipement; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.equipement ALTER COLUMN id_equipement SET DEFAULT nextval('public.equipement_id_equipement_seq'::regclass);


--
-- TOC entry 4713 (class 2604 OID 16604)
-- Name: location id_location; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.location ALTER COLUMN id_location SET DEFAULT nextval('public.location_id_location_seq'::regclass);


--
-- TOC entry 4890 (class 0 OID 16620)
-- Dependencies: 222
-- Data for Name: admin; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.admin (id_admin, login, password, etat) VALUES (1, 'Audry', 'audry2004', true);


--
-- TOC entry 4892 (class 0 OID 16656)
-- Dependencies: 224
-- Data for Name: categorie; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.categorie (id_categ, nom_categ) VALUES (1, 'Transport et manutention');
INSERT INTO public.categorie (id_categ, nom_categ) VALUES (2, 'Outillage');
INSERT INTO public.categorie (id_categ, nom_categ) VALUES (3, 'Espace verts');


--
-- TOC entry 4886 (class 0 OID 16588)
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


--
-- TOC entry 4884 (class 0 OID 16577)
-- Dependencies: 216
-- Data for Name: equipement; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.equipement (id_equipement, nome, descriptione, tarife, image, stock, id_categorie) VALUES (1, 'Scie électrique', 'Une scie électrique portable', '19.99/j', 'scieElec.jpg', 5, 2);
INSERT INTO public.equipement (id_equipement, nome, descriptione, tarife, image, stock, id_categorie) VALUES (2, 'Station de peinture', 'Une station de peinture', '18.99/j', 'stationPeinture.jpg', 10, 2);


--
-- TOC entry 4888 (class 0 OID 16601)
-- Dependencies: 220
-- Data for Name: location; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4904 (class 0 OID 0)
-- Dependencies: 221
-- Name: admin_id_admin_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.admin_id_admin_seq', 1, true);


--
-- TOC entry 4905 (class 0 OID 0)
-- Dependencies: 223
-- Name: categorie_id_categ_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.categorie_id_categ_seq', 3, true);


--
-- TOC entry 4906 (class 0 OID 0)
-- Dependencies: 217
-- Name: client_id_client_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.client_id_client_seq', 17, true);


--
-- TOC entry 4907 (class 0 OID 0)
-- Dependencies: 215
-- Name: equipement_id_equipement_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.equipement_id_equipement_seq', 2, true);


--
-- TOC entry 4908 (class 0 OID 0)
-- Dependencies: 219
-- Name: location_id_location_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.location_id_location_seq', 1, false);


--
-- TOC entry 4729 (class 2606 OID 16629)
-- Name: admin admin_login_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_login_key UNIQUE (login);


--
-- TOC entry 4731 (class 2606 OID 16627)
-- Name: admin admin_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (id_admin);


--
-- TOC entry 4733 (class 2606 OID 16663)
-- Name: categorie categorie_nom_categ_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categorie
    ADD CONSTRAINT categorie_nom_categ_key UNIQUE (nom_categ);


--
-- TOC entry 4735 (class 2606 OID 16661)
-- Name: categorie categorie_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categorie
    ADD CONSTRAINT categorie_pkey PRIMARY KEY (id_categ);


--
-- TOC entry 4721 (class 2606 OID 16597)
-- Name: client client_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_code_key UNIQUE (code);


--
-- TOC entry 4723 (class 2606 OID 16599)
-- Name: client client_emailc_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_emailc_key UNIQUE (emailc);


--
-- TOC entry 4725 (class 2606 OID 16595)
-- Name: client client_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (id_client);


--
-- TOC entry 4717 (class 2606 OID 16586)
-- Name: equipement equipement_nome_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.equipement
    ADD CONSTRAINT equipement_nome_key UNIQUE (nome);


--
-- TOC entry 4719 (class 2606 OID 16584)
-- Name: equipement equipement_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.equipement
    ADD CONSTRAINT equipement_pkey PRIMARY KEY (id_equipement);


--
-- TOC entry 4727 (class 2606 OID 16608)
-- Name: location location_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.location
    ADD CONSTRAINT location_pkey PRIMARY KEY (id_location);


--
-- TOC entry 4739 (class 2620 OID 16646)
-- Name: client generate_client_code_trigger; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER generate_client_code_trigger BEFORE INSERT ON public.client FOR EACH ROW EXECUTE FUNCTION public.insert_random_client_code();

ALTER TABLE public.client DISABLE TRIGGER generate_client_code_trigger;


--
-- TOC entry 4736 (class 2606 OID 16669)
-- Name: equipement fk_categ; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.equipement
    ADD CONSTRAINT fk_categ FOREIGN KEY (id_categorie) REFERENCES public.categorie(id_categ) NOT VALID;


--
-- TOC entry 4737 (class 2606 OID 16614)
-- Name: location location_id_client_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.location
    ADD CONSTRAINT location_id_client_fkey FOREIGN KEY (id_client) REFERENCES public.client(id_client);


--
-- TOC entry 4738 (class 2606 OID 16609)
-- Name: location location_id_equipement_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.location
    ADD CONSTRAINT location_id_equipement_fkey FOREIGN KEY (id_equipement) REFERENCES public.equipement(id_equipement);


-- Completed on 2024-04-16 11:10:27

--
-- PostgreSQL database dump complete
--

