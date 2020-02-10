-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Obtenga los apellidos que empiecen por las letras entre la 'd' y la 'k'. La 
-- salida esperada es la siguiente:
-- 
--   (Hamilton)
--   (Holcomb)
--   (Garrett)
--   (Fry)
--   (Kinney)
--   (Klein)
--   (Diaz)
--   (Guy)
--   (Estes)
--   (Jarvis)
--   (Knight)
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

%%pig
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
    
dato1 = FOREACH u GENERATE surname;

dato2 = FILTER dato1 BY (surname matches '.*D.*') OR (surname matches '.*E.*') OR (surname matches '.*F.*') OR (surname matches '.*G.*') OR (surname matches '.*H.*') OR (surname matches '.*I.*') OR (surname matches '.*J.*') OR (surname matches '.*K.*');

STORE dato2 INTO 'output' ;

fs -copyToLocal output
