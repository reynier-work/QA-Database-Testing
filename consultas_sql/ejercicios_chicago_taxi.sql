-- PROYECTO: Chicago Taxi - Validación de Datos
-- SPRINT 7: SQL y Bases de Datos

-- EJERCICIO 1: Conteo de vehículos totales para validación de flota
SELECT COUNT(*) FROM cabs;

-- EJERCICIO 2: Compañías con flota inferior a 100 automóviles
-- Identificación de empresas con baja disponibilidad de servicio
SELECT company_name, COUNT(cab_id) AS cnt
FROM cabs
GROUP BY company_name
HAVING COUNT(cab_id) < 100
ORDER BY cnt DESC;

-- EJERCICIO 3: Clasificación climática (Lógica de negocio con CASE)
-- Validación de condiciones para aplicación de coeficientes tarifarios
SELECT
    ts,
    CASE
        WHEN description LIKE '%rain%' OR description LIKE '%storm%' THEN 'Bad'
        ELSE 'Good'
    END AS weather_conditions
FROM weather_records
WHERE ts BETWEEN '2017-11-05 00:00:00' AND '2017-11-06 00:00:00';

-- EJERCICIO 4: Auditoría de viajes por compañía (JOIN de tablas)
-- Verificación de volumen de viajes para los días 15 y 16 de noviembre de 2017
SELECT 
    c.company_name, 
    COUNT(t.trip_id) AS trips_amount
FROM cabs AS c
INNER JOIN trips AS t ON c.cab_id = t.cab_id
WHERE CAST(t.start_ts AS DATE) IN ('2017-11-15', '2017-11-16')
GROUP BY c.company_name
ORDER BY trips_amount DESC;
