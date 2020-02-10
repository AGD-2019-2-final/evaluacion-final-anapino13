-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
-- columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
-- registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
-- columna 3 es:
-- 
--   ((b,jjj), 216)
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

fs -rm output/*
fs -rmdir  output
fs -rm -f -r data.tsv
fs -put data.tsv

u= LOAD 'data.tsv' USING PigStorage() AS (
    f1:CHARARRAY,
    f2:BAG{t: TUPLE()},
    f3:MAP[]
);

dato = FOREACH u GENERATE FLATTEN(f2) AS f2, FLATTEN(f3) AS f3;

grupo = GROUP dato BY (f2, f3);

contar = FOREACH grupo GENERATE group, COUNT(dato);

STORE contar into 'output' using PigStorage('\t');

fs -copyToLocal output