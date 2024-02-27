CREATE OR REPLACE VIEW public.vue_categorie_sous_categorie
    AS
     SELECT categorie.id_categorie,
    categorie.nom_categorie,
    sous_categorie.id_sous_categorie,
    sous_categorie.nom_sous_categorie
   FROM categorie,
    sous_categorie 
  WHERE sous_categorie.id_categorie = categorie.id_categorie;