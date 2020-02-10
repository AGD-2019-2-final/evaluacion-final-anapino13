-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Escriba el código equivalente a la siguiente consulta SQL.
-- 
--    SELECT 
--        firstname,
--        color 
--    FROM 
--        u 
--    WHERE 
--        color REGEXP '[aeiou]$';
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
-- 
u = LOAD 'data.csv' USING PigStorage(',') 
    AS (id:int, 
        firstname:CHARARRAY, 
        surname:CHARARRAY, 
        birthday:CHARARRAY, 
        color:CHARARRAY, 
        quantity:INT);
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

fs -rm output/*
fs -rmdir  output
fs -rm -f -r data.csv
fs -put data.csv

u = LOAD 'data.csv' USING PigStorage(',') 
    AS (id:int, 
        firstname:CHARARRAY, 
        surname:CHARARRAY, 
        birthday:CHARARRAY, 
        color:CHARARRAY, 
        quantity:INT);

dato1 = FOREACH u GENERATE firstname,color;

dato2 = FILTER dato1 BY ENDSWITH(color, 'a') or ENDSWITH(color, 'e') or ENDSWITH(color, 'i') or ENDSWITH(color, 'o') or ENDSWITH(color, 'u');

store dato2 into 'output' USING PigStorage(',');    
    
