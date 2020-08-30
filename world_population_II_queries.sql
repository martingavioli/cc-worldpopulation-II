-- Countries from Africa

SELECT count(*)
FROM countries
WHERE continent = 'Africa';

-- Population of oceania in 2005

SELECT countries.continent,
	population_years.year,
	sum(population_years.population) AS 'Total population'
FROM countries
JOIN population_years
	ON population_years.country_id = countries.id
WHERE countries.continent = 'Oceania'
AND population_years.year = 2005;

-- Avg population in South America in 2003

SELECT countries.continent,
	population_years.year,
	round(avg(population_years.population), 2) AS 'AVG population'
FROM countries
JOIN population_years
	ON population_years.country_id = countries.id
WHERE countries.continent = 'South America'
AND population_years.year = 2003;

-- Country with smallest population in 2007

SELECT countries.name,
	population_years.year,
	min(population_years.population) AS 'min population'
FROM countries
JOIN population_years
	ON population_years.country_id = countries.id
WHERE population_years.year = 2007;

-- Avg population of Poland during the whole period

SELECT countries.name,
	round(avg(population_years.population), 2) AS 'AVG population'
FROM countries
JOIN population_years
	ON population_years.country_id = countries.id
WHERE countries.name = 'Poland';

-- Countries with "The" in their name

SELECT count(*)
FROM countries
WHERE name LIKE '%, The%';

-- Total population by continent in 2010

SELECT countries.continent,
	population_years.year,
	round(sum(population_years.population), 2) AS 'population'
FROM countries
JOIN population_years
	ON population_years.country_id = countries.id
WHERE population_years.year = 2010
GROUP BY countries.continent
ORDER BY 3 DESC;
