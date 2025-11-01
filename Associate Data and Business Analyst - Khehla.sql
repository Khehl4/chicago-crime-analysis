SELECT * FROM `alva-coding-test.chicago_crime.crime` LIMIT 1000

-- TASK 1: Oldest Data Point
SELECT 
  MIN(`date`) AS oldest_date
FROM `alva-coding-test.chicago_crime.crime`;

-- TASK 2: Year with Most Crimes
SELECT 
  EXTRACT(YEAR FROM `date`) AS year,
  COUNT(*) AS total_crimes
FROM `alva-coding-test.chicago_crime.crime`
GROUP BY year
ORDER BY total_crimes DESC
LIMIT 1;

-- TASK 3: Top 5 Crimes in 2020 + Arrest Rates
WITH crimes_2020 AS (
  SELECT 
    `primary_type` AS crime_type,
    COUNT(*) AS total,
    SUM(CASE WHEN ARREST THEN 1 ELSE 0 END) AS arrests
  FROM `alva-coding-test.chicago_crime.crime`
  WHERE EXTRACT(YEAR FROM `date`) = 2020
  GROUP BY crime_type
),
top5 AS (
  SELECT crime_type
  FROM crimes_2020
  ORDER BY total DESC
  LIMIT 5
)
SELECT 
  c.crime_type,
  c.total,
  c.arrests,
  ROUND(c.arrests / c.total * 100, 2) AS arrest_rate_percent
FROM crimes_2020 c
JOIN top5 t USING (crime_type)
ORDER BY arrest_rate_percent DESC;



-- TASK 4: Year with Highest Arrest Rate & Crime Trend
WITH yearly_stats AS (
  SELECT 
    EXTRACT(YEAR FROM `date`) AS year,
    COUNT(*) AS total_crimes,
    SUM(CASE WHEN ARREST THEN 1 ELSE 0 END) AS arrests
  FROM `alva-coding-test.chicago_crime.crime`
  GROUP BY year
)
SELECT 
  year,
  total_crimes,
  arrests,
  ROUND(arrests / total_crimes * 100, 2) AS arrest_rate_percent
FROM yearly_stats
ORDER BY year;


-- TASK 5: Year with Most Arrests & Arrest Trend
-- (a) Year with most arrests
SELECT 
  EXTRACT(YEAR FROM `date`) AS year,
  SUM(CASE WHEN ARREST THEN 1 ELSE 0 END) AS total_arrests
FROM `alva-coding-test.chicago_crime.crime`
GROUP BY year
ORDER BY total_arrests DESC
LIMIT 1;

-- (b) Arrest trend over time
SELECT 
  EXTRACT(YEAR FROM `date`) AS year,
  SUM(CASE WHEN ARREST THEN 1 ELSE 0 END) AS total_arrests
FROM `alva-coding-test.chicago_crime.crime`
GROUP BY year
ORDER BY year;

-- TASK 6: Arrest Rate Over Time + Largest Change Detection

WITH yearly AS (
  SELECT 
    EXTRACT(YEAR FROM `date`) AS year,
    COUNT(*) AS total_crimes,
    SUM(CASE WHEN ARREST THEN 1 ELSE 0 END) AS arrests
  FROM `alva-coding-test.chicago_crime.crime`
  GROUP BY year
)
SELECT 
  year,
  ROUND(arrests / total_crimes * 100, 2) AS arrest_rate_percent
FROM yearly
ORDER BY year;

-- (Find years with biggest change in arrest rate)
WITH yearly AS (
  SELECT 
    EXTRACT(YEAR FROM `date`) AS year,
    ROUND(SUM(CASE WHEN ARREST THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS arrest_rate
  FROM `alva-coding-test.chicago_crime.crime`
  GROUP BY year
)
SELECT 
  year,
  arrest_rate,
  arrest_rate - LAG(arrest_rate) OVER (ORDER BY year) AS rate_change
FROM yearly
ORDER BY ABS(rate_change) DESC
LIMIT 1;
