

--
-- TOC entry 4883 (class 0 OID 16545)
-- Dependencies: 236
-- Data for Name: admin; Type: TABLE DATA; Schema: public; Owner: anonyme
--

INSERT INTO public.admin (id_admin, login, password) VALUES (4, 'Louis', 'Louis');
INSERT INTO public.admin (id_admin, login, password) VALUES (2, 'Pierre', 'Pierre');
INSERT INTO public.admin (id_admin, login, password) VALUES (3, 'Emma', 'Emma');
INSERT INTO public.admin (id_admin, login, password) VALUES (5, 'Bob', 'Bob');
INSERT INTO public.admin (id_admin, login, password) VALUES (9, 'Fred', 'Fred');
INSERT INTO public.admin (id_admin, login, password) VALUES (10, 'Marie', 'Marie');


--
-- TOC entry 4863 (class 0 OID 16401)
-- Dependencies: 216
-- Data for Name: categorie; Type: TABLE DATA; Schema: public; Owner: anonyme
--

INSERT INTO public.categorie (id_categorie, nom_categorie) VALUES (1, 'Boucherie');
INSERT INTO public.categorie (id_categorie, nom_categorie) VALUES (2, 'Boulangerie');
INSERT INTO public.categorie (id_categorie, nom_categorie) VALUES (3, 'Epicerie');
INSERT INTO public.categorie (id_categorie, nom_categorie) VALUES (4, 'Ménage');
INSERT INTO public.categorie (id_categorie, nom_categorie) VALUES (5, 'Papeterie');
INSERT INTO public.categorie (id_categorie, nom_categorie) VALUES (6, 'Animaux');
INSERT INTO public.categorie (id_categorie, nom_categorie) VALUES (7, 'Fruits et légumes');
INSERT INTO public.categorie (id_categorie, nom_categorie) VALUES (8, 'Produits laitiers');


--
-- TOC entry 4867 (class 0 OID 16424)
-- Dependencies: 220
-- Data for Name: pays; Type: TABLE DATA; Schema: public; Owner: anonyme
--

INSERT INTO public.pays (id_pays, nom_pays) VALUES (1, 'Belgique');
INSERT INTO public.pays (id_pays, nom_pays) VALUES (2, 'France');


--
-- TOC entry 4869 (class 0 OID 16433)
-- Dependencies: 222
-- Data for Name: ville; Type: TABLE DATA; Schema: public; Owner: anonyme
--

INSERT INTO public.ville (id_ville, nom_ville, code_postal, id_pays) VALUES (1, 'Peruwelz', '7060', 1);
INSERT INTO public.ville (id_ville, nom_ville, code_postal, id_pays) VALUES (2, 'Quiévrechain', '59920', 2);
INSERT INTO public.ville (id_ville, nom_ville, code_postal, id_pays) VALUES (3, 'Quiévrain', '7380', 1);
INSERT INTO public.ville (id_ville, nom_ville, code_postal, id_pays) VALUES (4, 'Crespin', '59154', 2);
INSERT INTO public.ville (id_ville, nom_ville, code_postal, id_pays) VALUES (5, 'Quarouble', '59243', 2);
INSERT INTO public.ville (id_ville, nom_ville, code_postal, id_pays) VALUES (6, 'Hensies', '7350', 1);


--
-- TOC entry 4873 (class 0 OID 16461)
-- Dependencies: 226
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: anonyme
--



--
-- TOC entry 4871 (class 0 OID 16447)
-- Dependencies: 224
-- Data for Name: magasin; Type: TABLE DATA; Schema: public; Owner: anonyme
--

INSERT INTO public.magasin (id_magasin, nom_magasin, adresse, numero, id_ville) VALUES (2, 'Chez Jacques', 'Rue des écoles', '154', 3);
INSERT INTO public.magasin (id_magasin, nom_magasin, adresse, numero, id_ville) VALUES (3, 'Chez Ignace', 'Rue de la ferme', '19', 4);
INSERT INTO public.magasin (id_magasin, nom_magasin, adresse, numero, id_ville) VALUES (4, 'Chez Arthur', 'Rue des bois', '29', 3);
INSERT INTO public.magasin (id_magasin, nom_magasin, adresse, numero, id_ville) VALUES (5, 'Chez Margot', 'Rue de la poste', '84', 4);


--
-- TOC entry 4865 (class 0 OID 16410)
-- Dependencies: 218
-- Data for Name: sous_categorie; Type: TABLE DATA; Schema: public; Owner: anonyme
--

INSERT INTO public.sous_categorie (id_sous_categorie, nom_sous_categorie, id_categorie) VALUES (6, 'Volaille', 1);
INSERT INTO public.sous_categorie (id_sous_categorie, nom_sous_categorie, id_categorie) VALUES (7, 'Pains', 2);
INSERT INTO public.sous_categorie (id_sous_categorie, nom_sous_categorie, id_categorie) VALUES (5, 'Féculents', 3);
INSERT INTO public.sous_categorie (id_sous_categorie, nom_sous_categorie, id_categorie) VALUES (4, 'Pâtisserie', 2);
INSERT INTO public.sous_categorie (id_sous_categorie, nom_sous_categorie, id_categorie) VALUES (10, 'Vaisselle', 4);
INSERT INTO public.sous_categorie (id_sous_categorie, nom_sous_categorie, id_categorie) VALUES (2, 'Entretien', 4);
INSERT INTO public.sous_categorie (id_sous_categorie, nom_sous_categorie, id_categorie) VALUES (9, 'Fruits', 7);
INSERT INTO public.sous_categorie (id_sous_categorie, nom_sous_categorie, id_categorie) VALUES (11, 'Légumes', 7);
INSERT INTO public.sous_categorie (id_sous_categorie, nom_sous_categorie, id_categorie) VALUES (1, 'Traiteur', 1);
INSERT INTO public.sous_categorie (id_sous_categorie, nom_sous_categorie, id_categorie) VALUES (3, 'Animaux', 4);


--
-- TOC entry 4875 (class 0 OID 16475)
-- Dependencies: 228
-- Data for Name: produit; Type: TABLE DATA; Schema: public; Owner: anonyme
--

INSERT INTO public.produit (id_produit, nom_produit, prix, stock, relais, id_magasin, id_sous_categorie) VALUES (1, 'Glacé', 3.5, 8, NULL, 2, 7);
INSERT INTO public.produit (id_produit, nom_produit, prix, stock, relais, id_magasin, id_sous_categorie) VALUES (2, 'Riz', 5.7, 8, NULL, 3, 5);
INSERT INTO public.produit (id_produit, nom_produit, prix, stock, relais, id_magasin, id_sous_categorie) VALUES (3, 'Ebly', 4.5, 16, NULL, 3, 5);
INSERT INTO public.produit (id_produit, nom_produit, prix, stock, relais, id_magasin, id_sous_categorie) VALUES (4, 'Semoule moyen', 4.19, 11, NULL, 3, 5);
INSERT INTO public.produit (id_produit, nom_produit, prix, stock, relais, id_magasin, id_sous_categorie) VALUES (5, 'Félix Duo', 5.75, 18, NULL, 3, 3);
INSERT INTO public.produit (id_produit, nom_produit, prix, stock, relais, id_magasin, id_sous_categorie) VALUES (6, 'Whiskas Poisson', 6.51, 21, NULL, 3, 3);
INSERT INTO public.produit (id_produit, nom_produit, prix, stock, relais, id_magasin, id_sous_categorie) VALUES (7, 'Croquettes Gourmet', 7.24, 10, NULL, 3, 3);
INSERT INTO public.produit (id_produit, nom_produit, prix, stock, relais, id_magasin, id_sous_categorie) VALUES (8, 'Pommes Grany Smith', 3.15, 20, NULL, 3, 9);
INSERT INTO public.produit (id_produit, nom_produit, prix, stock, relais, id_magasin, id_sous_categorie) VALUES (9, 'Poires Williams', 2.51, 12, NULL, 3, 9);
INSERT INTO public.produit (id_produit, nom_produit, prix, stock, relais, id_magasin, id_sous_categorie) VALUES (10, 'Oranges de table', 4.24, 12, NULL, 3, 9);
INSERT INTO public.produit (id_produit, nom_produit, prix, stock, relais, id_magasin, id_sous_categorie) VALUES (11, 'Clémentines', 4.11, 19, NULL, 3, 9);
INSERT INTO public.produit (id_produit, nom_produit, prix, stock, relais, id_magasin, id_sous_categorie) VALUES (12, 'Bananes', 1.2, 19, NULL, 3, 9);
INSERT INTO public.produit (id_produit, nom_produit, prix, stock, relais, id_magasin, id_sous_categorie) VALUES (13, 'Laitues', 0.85, 20, NULL, 3, 11);
INSERT INTO public.produit (id_produit, nom_produit, prix, stock, relais, id_magasin, id_sous_categorie) VALUES (14, 'Carottes', 3, 12, NULL, 3, 11);
INSERT INTO public.produit (id_produit, nom_produit, prix, stock, relais, id_magasin, id_sous_categorie) VALUES (15, 'Poireaux', 2.24, 15, NULL, 3, 11);
INSERT INTO public.produit (id_produit, nom_produit, prix, stock, relais, id_magasin, id_sous_categorie) VALUES (16, 'Navets', 2.4, 19, NULL, 3, 11);
INSERT INTO public.produit (id_produit, nom_produit, prix, stock, relais, id_magasin, id_sous_categorie) VALUES (17, 'Céleri', 1.26, 4, NULL, 3, 11);
INSERT INTO public.produit (id_produit, nom_produit, prix, stock, relais, id_magasin, id_sous_categorie) VALUES (19, 'Poulet', 8.75, 11, NULL, 2, 6);
INSERT INTO public.produit (id_produit, nom_produit, prix, stock, relais, id_magasin, id_sous_categorie) VALUES (20, 'Dinde', 6.51, 21, NULL, 2, 6);
INSERT INTO public.produit (id_produit, nom_produit, prix, stock, relais, id_magasin, id_sous_categorie) VALUES (21, 'Caille', 17.24, 5, NULL, 2, 6);


--
-- TOC entry 4879 (class 0 OID 16511)
-- Dependencies: 232
-- Data for Name: facture; Type: TABLE DATA; Schema: public; Owner: anonyme
--



--
-- TOC entry 4881 (class 0 OID 16528)
-- Dependencies: 234
-- Data for Name: livraison; Type: TABLE DATA; Schema: public; Owner: anonyme
--



--
-- TOC entry 4877 (class 0 OID 16494)
-- Dependencies: 230
-- Data for Name: panier; Type: TABLE DATA; Schema: public; Owner: anonyme
--



--
-- TOC entry 4889 (class 0 OID 0)
-- Dependencies: 235
-- Name: admin_id_admin_seq; Type: SEQUENCE SET; Schema: public; Owner: anonyme
--

SELECT pg_catalog.setval('public.admin_id_admin_seq', 10, true);


--
-- TOC entry 4890 (class 0 OID 0)
-- Dependencies: 215
-- Name: categorie_id_categorie_seq; Type: SEQUENCE SET; Schema: public; Owner: anonyme
--

SELECT pg_catalog.setval('public.categorie_id_categorie_seq', 8, true);


--
-- TOC entry 4891 (class 0 OID 0)
-- Dependencies: 225
-- Name: client_id_client_seq; Type: SEQUENCE SET; Schema: public; Owner: anonyme
--

SELECT pg_catalog.setval('public.client_id_client_seq', 1, false);


--
-- TOC entry 4892 (class 0 OID 0)
-- Dependencies: 231
-- Name: facture_id_facture_seq; Type: SEQUENCE SET; Schema: public; Owner: anonyme
--

SELECT pg_catalog.setval('public.facture_id_facture_seq', 1, false);


--
-- TOC entry 4893 (class 0 OID 0)
-- Dependencies: 233
-- Name: livraison_id_livraison_seq; Type: SEQUENCE SET; Schema: public; Owner: anonyme
--

SELECT pg_catalog.setval('public.livraison_id_livraison_seq', 1, false);


--
-- TOC entry 4894 (class 0 OID 0)
-- Dependencies: 223
-- Name: magasin_id_magasin_seq; Type: SEQUENCE SET; Schema: public; Owner: anonyme
--

SELECT pg_catalog.setval('public.magasin_id_magasin_seq', 5, true);


--
-- TOC entry 4895 (class 0 OID 0)
-- Dependencies: 229
-- Name: panier_id_panier_seq; Type: SEQUENCE SET; Schema: public; Owner: anonyme
--

SELECT pg_catalog.setval('public.panier_id_panier_seq', 1, false);


--
-- TOC entry 4896 (class 0 OID 0)
-- Dependencies: 219
-- Name: pays_id_pays_seq; Type: SEQUENCE SET; Schema: public; Owner: anonyme
--

SELECT pg_catalog.setval('public.pays_id_pays_seq', 2, true);


--
-- TOC entry 4897 (class 0 OID 0)
-- Dependencies: 227
-- Name: produit_id_produit_seq; Type: SEQUENCE SET; Schema: public; Owner: anonyme
--

SELECT pg_catalog.setval('public.produit_id_produit_seq', 1, false);


--
-- TOC entry 4898 (class 0 OID 0)
-- Dependencies: 217
-- Name: sous_categorie_id_sous_categorie_seq; Type: SEQUENCE SET; Schema: public; Owner: anonyme
--

SELECT pg_catalog.setval('public.sous_categorie_id_sous_categorie_seq', 11, true);


--
-- TOC entry 4899 (class 0 OID 0)
-- Dependencies: 221
-- Name: ville_id_ville_seq; Type: SEQUENCE SET; Schema: public; Owner: anonyme
--

SELECT pg_catalog.setval('public.ville_id_ville_seq', 6, true);


-- Completed on 2024-02-15 12:37:30

--
-- PostgreSQL database dump complete
--

