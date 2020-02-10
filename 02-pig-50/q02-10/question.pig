-- Pregunta
-- ===========================================================================
-- 
-- Ordene el archivo `data.tsv`  por letra y valor (3ra columna).
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
-- 
--  >>> Escriba el codigo del mapper a partir de este punto <<<
-- 

fs -rm output/*
fs -rmdir  output
fs -rm -f -r data.tsv
fs -put data.tsv

u = LOAD 'data.tsv'
    AS (f1:CHARARRAY, f2:CHARARRAY, f3:INT);
orden = ORDER u BY f1,f3;
DUMP orden;


STORE orden INTO 'output';

fs -copyToLocal output
