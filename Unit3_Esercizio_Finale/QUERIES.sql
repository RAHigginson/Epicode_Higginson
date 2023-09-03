USE prenotazione_volo;

-- 1. Nomi e congnomi dei passeggeri che usano un indirizzo email Google 'gmail':

SELECT  Nome,
		Cognome,
        Email
FROM passeggero
WHERE Email LIKE '%gmail%';

-- 2. Numero di passeggeri italiani

SELECT COUNT(*) AS Numero_passeggeri_Italiani
FROM passeggero
WHERE Cittadinanza = 'Italiana';

-- 3. Nome, cognome e cittadinanza dei clienti che hanno spesso più di 700

SELECT p.Nome, 
	   p.Cognome,
       p.Cittadinanza
FROM passeggero p
JOIN biglietto b 
	ON p.Numero_passaporto = b.Numero_passaporto
WHERE b.Prezzo > 700;

-- 4. Media prezzo per classe

SELECT c.Nome AS Classe,
       AVG(b.Prezzo) AS Media_Prezzo
FROM biglietto b
RIGHT JOIN classe c 
	ON b.Codice_classe = c.Codice_classe
GROUP BY c.Nome
HAVING AVG(b.Prezzo) > 100 OR c.Nome = 'First Class';

-- 5. Passeggeri che volano con EasyJet. Sia EJ Europa che UK con aeroporto di arrivo

SELECT p.Nome, 
       p.Cognome,
	   v.Numero_volo,
       b.Aeroporto_arrivo
FROM passeggero p
JOIN biglietto b 
	ON p.Numero_passaporto = b.Numero_passaporto
JOIN volo v 
	ON b.Numero_volo = v.Numero_volo
JOIN compagnia_aerea ca 
	ON v.Compagnia_area_IATA = ca.Codice_IATA_compagnia
WHERE ca.Nome LIKE '%Easyjet%';

-- 6. Durata in ore dei voli con il nome della compagnia aerea

SELECT
	Numero_volo,
	ca.Nome AS 'Compagnia_aerea',
    v.Durata_minuti / 60 AS 'Durata_ore'
FROM volo v
JOIN compagnia_aerea ca
	ON v.Compagnia_area_IATA = ca.Codice_IATA_compagnia
;

-- 7. Aeroporto di partenza e di arrivo dai 3 voli più lunghi

SELECT
	b.Aeroporto_partenza,
	b.Aeroporto_arrivo,
    v.Durata_minuti
FROM biglietto b
JOIN volo v
	USING (Numero_volo)
ORDER BY v.Durata_minuti DESC
LIMIT 3;

-- 8. Nome e congome dei passeggeri agruppati per classe (Nome della classe)

SELECT 
	CONCAT(p.Nome, ' ', p.Cognome) AS 'nome_completo',
    c.nome AS 'classe'
FROM passeggero p 
JOIN biglietto b
	USING (Numero_passaporto)
JOIN classe c
	USING (Codice_classe)
ORDER BY c.nome;

-- 9. Adesso gli organizziamo considerando che l'economy è quella più bassa è First Class quella più alta. 

SELECT 
	CONCAT(p.Nome, ' ', p.Cognome) AS 'nome_completo',
    c.nome AS 'classe'
FROM passeggero p 
JOIN biglietto b
	USING (Numero_passaporto)
JOIN classe c
	USING (Codice_classe)
ORDER BY
    CASE c.nome
        WHEN 'Economy' THEN 1
        WHEN 'Premium Economy' THEN 2
        WHEN 'Business' THEN 3
        ELSE 4 
    END;
    
-- 10. Scegliamo il nome completo dei passeggeri volando in Economy

SELECT CONCAT(p.Nome, ' ', p.Cognome) AS 'nome_completo'
FROM passeggero p
WHERE p.Numero_passaporto IN (
    SELECT b.Numero_passaporto
    FROM biglietto b
    JOIN classe c 
		ON b.Codice_classe = c.Codice_classe
    WHERE c.Nome = 'Economy'
);

