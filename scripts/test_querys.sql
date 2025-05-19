-- 1. Total milk production for 2023
SELECT SUM(Value) AS total_milk_2023
FROM milk_production
WHERE Year = 2023;

-- 2. States with cheese production > 100 million in April 2023
SELECT COUNT(DISTINCT State_ANSI) AS states_over_100M
FROM cheese_production
WHERE Year = 2023 AND Period = 'APR' AND Value > 100000000;

-- 3. Total coffee production for 2011
SELECT SUM(Value) AS total_coffee_2011
FROM coffee_production
WHERE Year = 2011;

-- 4. Average honey production for 2022
SELECT AVG(Value) AS avg_honey_2022
FROM honey_production
WHERE Year = 2022;

-- 5. ANSI code for Florida
SELECT State_ANSI
FROM state_lookup
WHERE LOWER(State) = 'florida';

-- 6. Cheese production values by state for April 2023 (including zero)
SELECT s.State, IFNULL(SUM(c.Value), 0) AS cheese_apr_2023
FROM state_lookup s
LEFT JOIN cheese_production c
  ON s.State_ANSI = c.State_ANSI AND c.Year = 2023 AND c.Period = 'APR'
GROUP BY s.State
HAVING s.State = 'NEW JERSEY';

-- 7. Total yogurt production in 2022 for states with cheese data in 2023
SELECT SUM(y.Value) AS total_yogurt_2022
FROM yogurt_production y
WHERE y.Year = 2022 AND y.State_ANSI IN (
    SELECT DISTINCT c.State_ANSI
    FROM cheese_production c
    WHERE c.Year = 2023
);

-- 8. States from state_lookup missing in milk_production 2023
SELECT COUNT(*)
FROM state_lookup s
WHERE s.State_ANSI NOT IN (
    SELECT DISTINCT State_ANSI
    FROM milk_production
    WHERE Year = 2023
);

-- 9. Cheese production values by state in April 2023 (including 0)
-- Check if Delaware produced any cheese
SELECT s.State, IFNULL(SUM(c.Value), 0) AS cheese_apr_2023
FROM state_lookup s
LEFT JOIN cheese_production c
  ON s.State_ANSI = c.State_ANSI AND c.Year = 2023 AND c.Period = 'APR'
WHERE s.State = 'DELAWARE'
GROUP BY s.State;

-- 10. Average coffee production for years where honey production exceeded 1M
SELECT AVG(c.Value) AS avg_coffee_for_high_honey_years
FROM coffee_production c
WHERE c.Year IN (
    SELECT h.Year
    FROM honey_production h
    GROUP BY h.Year
    HAVING SUM(h.Value) > 1000000
);
