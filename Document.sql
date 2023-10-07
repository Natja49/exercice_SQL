3/ Afin de vérifier l’intégrité des données présentes en base de données, écrivez les requêtes de sélection permettant de récupérer les éléments suivants :

La liste des régions pour le continent « Europe »
SELECT 
libelle_région FROM t_régions
 LEFT JOIN t_continents ON (t_regions.continent_id=t_continents.id_continent)
 WHERE libelle_continent
 LIKE 'Europe';

SELECT libelle_region From t_regions WHERE continent_id=5 


La liste des pays pour le continent « Europe »
SELECT 
libelle_ pays FROM t_pays
 LEFT JOIN t_continents ON (t_pays.continent_id=t_continents.id_continent)
 WHERE libelle _continent
 LIKE 'Europe';


La liste des pays pour la région « Afrique Centrale »
SELECT 
libelle_pays from t_pays
 LEFT JOIN t_regions ON(t_pays.region_id=t_regions.id_region)
 WHERE libelle_region
 LIKE 'Afrique Centrale'


Le nombre de pays pour le continent « Océanie »
SELECT COUNT
(libelle_pays)FROM t_pays
LEFT JOIN t_continents ON (t_pays.continent_id=t_continents.id_continent)
WHERE libelle_continent
LIKE'Oceanie';


Le nombre de régions pour le continent « Asie »
SELECT COUNT
(libelle_region) FROM t_regions
LEFT JOIN t_continents ON (t_regions.continent_id=t_continents.id_continent)
WHERE libelle_continent 
LIKE'Asie';


Le nombre de régions pour le continent « Amérique Septentrionale »
SELECT COUNT
(libelle_region) FROM t_regions
LEFT JOIN t_continents ON (t_regions.continent_id=t_continents.id_continent) WHERE libelle_continent
LIKE'Amerique Septentrionale';



4/ L’INED vous demande d’établir des résultats statistiques par rapport aux données qu’elle vous a fournies. Voici la liste des résultats qu’elle souhaite récupérer :

La population totale par continent





Le continent du monde disposant de la plus grande population
SELECT libelle_continent,
SUM(population_pays) FROM t_pays 
LEFT JOIN t_continents ON (t_continents.id_continent=t_pays.continent_id) 
GROUP BY libelle_continent 
ORDER BY SUM(population_pays) DESC LIMIT 1;

CREATE VIEW continent plus grande population 
AS SELECT 
libelle_continent,
SUM(population_pays) 
FROM t_pays 
LEFT JOIN t_continents ON (t_continents.id_continent=t_pays.continent_id)
GROUP BY libelle_continent 
ORDER BY SUM
(population_pays) DESC LIMIT 1;


La même requête avec le renommage des entêtes de colonnes à afficher
SELECT 
libelle_continent AS 'Nom du continent',
SUM(population_pays) 
AS 'Population du continent' 
FROM t_pays 
LEFT JOIN t_continents ON (t_continents.id_continent=t_pays.continent_id) 
GROUP BY libelle_continent 
ORDER BY SUM
(population_pays) DESC LIMIT 1;

Le continent du monde disposant de la plus faible population
SELECT libelle_continent, 
SUM(population_pays) FROM t_pays 
LEFT JOIN t_continents ON (t_continents.id_continent=t_pays.continent_id) 
GROUP BY libelle_continent 
ORDER BY MIN(population_pays) DESC LIMIT 1; 
