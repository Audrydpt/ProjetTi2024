
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
