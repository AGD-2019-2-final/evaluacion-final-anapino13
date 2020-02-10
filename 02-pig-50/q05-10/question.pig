-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
-- aparece cada letra minúscula en la columna 2.
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

u = LOAD 'data.tsv'
    AS (f1:CHARARRAY, f2:CHARARRAY, f3:CHARARRAY);
columna  = FOREACH u GENERATE $1 ;
dato1 = FOREACH columna GENERATE FLATTEN(TOKENIZE($0)) AS letra ;
agrupar = GROUP dato1 BY letra;
contar = FOREACH agrupar GENERATE group, COUNT($1);
limite = LIMIT contar 7;
DUMP limite;

STORE limite INTO 'output';

fs -copyToLocal output
