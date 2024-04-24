
declare p_id alias for $1;
	declare p_champ alias for $2;
	declare p_valeur alias for $3;
BEGIN
EXECUTE format('UPDATE client SET %I = %L WHERE id_client = %L', p_champ, p_valeur, p_id);
-- execute format : utilisé lorsque les champs sont dynamiques
-- %I : remplace le champ colonne, de manière sécurisée (échappement pour éviter les injections sql)
-- %I : remplace la valeur, de manière sécurisée
RETURN 1;
END;
