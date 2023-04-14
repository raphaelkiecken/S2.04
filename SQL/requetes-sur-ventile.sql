/*   -- QUESTION 1
SELECT r.regions, COUNT(*) AS nbParticipation
FROM participe NATURAL JOIN resultat NATURAL JOIN regions AS r
GROUP BY r.regions
ORDER BY nbParticipation DESC;

-- QUESTION 2
SELECT rg.regions, COUNT(*) AS nbOr
FROM participe NATURAL JOIN resultat AS rs NATURAL JOIN regions AS rg
WHERE rs.medaille = 'Gold'
GROUP BY rg.regions
ORDER BY nbOr DESC;

-- QUESTION 3
SELECT rg.regions, COUNT(*) AS nbMedailles
FROM participe NATURAL JOIN resultat AS rs NATURAL JOIN regions AS rg
WHERE rs.medaille IS NOT NULL
GROUP BY rg.regions
ORDER BY nbMedailles DESC;

-- QUESTION 4
SELECT a.id, a.nom, COUNT(*) AS nbMedaillesOr
FROM athlete AS a NATURAL JOIN resultat AS r
WHERE r.medaille = 'Gold'
GROUP BY a.id, a.nom
ORDER BY nbMedaillesOr DESC;

-- QUESTION 5
SELECT rg.regions, COUNT(*) AS nbMedailles
FROM participe NATURAL JOIN resultat AS rs NATURAL JOIN regions AS rg
WHERE rs.ville = 'Albertville' AND rs.medaille IS NOT NULL
GROUP BY rg.regions
ORDER BY nbMedailles DESC;
-- QUESTION 6, cette requête ne "compte" pas le nombre d'athlètes, mais
-- donne le nom des 20 athlètes qui ont déjà participés sous differentes bannières


SELECT COUNT(DISTINCT a.id)
FROM participe AS parun JOIN participe AS pardeux USING (id) NATURAL JOIN athlete AS a
WHERE parun.annee < pardeux.annee
AND pardeux.noc = 'FRA' AND parun.noc <> pardeux.noc;

-- QUESTION 7

SELECT COUNT(DISTINCT a.id)
FROM participe AS parun JOIN participe AS pardeux USING (id) NATURAL JOIN athlete AS a
WHERE parun.annee < pardeux.annee
AND parun.noc = 'FRA' AND parun.noc <> pardeux.noc;


-- QUESTION 8
SELECT p.age, COUNT(*) AS nbOr
FROM participe AS p NATURAL JOIN resultat AS rs NATURAL JOIN regions
WHERE rs.medaille = 'Gold' AND p.age IS NOT NULL
GROUP BY p.age;

-- QUESTION 9
SELECT e.sport, COUNT(*) AS nbMedailles
FROM epreuves AS e NATURAL JOIN resultat AS rs NATURAL JOIN participe AS p
WHERE p.age >= 50 AND rs.medaille IS NOT NULL
GROUP BY e.sport
ORDER BY nbMedailles DESC;

-- QUESTION 10
SELECT o.label, o.ville, COUNT(DISTINCT e.elabel) AS nbEpreuves
FROM olympics AS o JOIN resultat USING(annee, saison, ville) NATURAL JOIN epreuves AS e
GROUP BY o.label, o.ville;

-- QUESTION 11
*/