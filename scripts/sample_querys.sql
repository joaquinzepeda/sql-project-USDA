-- 1. Total milk production for the year 2023
SELECT SUM(Value) AS total_milk_2023
FROM milk_production
WHERE Year = 2023;

-- 2. Coffee production data for the year 2015 and total value
SELECT *
FROM coffee_production
WHERE Year = 2015;

SELECT SUM(Value) AS total_coffee_2015
FROM coffee_production
WHERE Year = 2015;

-- 3. Average honey production for the year 2022
SELECT AVG(Value) AS avg_honey_2022
FROM honey_production
WHERE Year = 2022;

-- 4. State names and ANSI codes
SELECT *
FROM state_lookup;

-- (Iowa will be one of the rows returned)

-- 5. Highest yogurt production value for 2022
SELECT MAX(Value) AS max_yogurt_2022
FROM yogurt_production
WHERE Year = 2022;

-- 6. States where both honey and milk were produced in 2022
SELECT DISTINCT h.State_ANSI
FROM honey_production h
JOIN milk_production m
  ON h.State_ANSI = m.State_ANSI AND h.Year = 2022 AND m.Year = 2022;

-- Check if State_ANSI 35 is included
SELECT DISTINCT h.State_ANSI
FROM honey_production h
JOIN milk_production m
  ON h.State_ANSI = m.State_ANSI AND h.Year = 2022 AND m.Year = 2022
WHERE h.State_ANSI = 35;

-- 7. Total yogurt production for states that also produced cheese in 2022
SELECT SUM(y.Value) AS total_yogurt_for_cheese_states_2022
FROM yogurt_production y
WHERE y.Year = 2022
  AND y.State_ANSI IN (
    SELECT DISTINCT c.State_ANSI
    FROM cheese_production c
    WHERE c.Year = 2022
  );
