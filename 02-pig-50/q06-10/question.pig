-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
-- columna 3. En otras palabras, cuántos registros hay que tengan la clave 
-- `aaa`?
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

u = LOAD 'data.tsv' USING PigStorage('\t') 
    AS (letra:CHARARRAY, 
        bolsa:bag{(a:CHARARRAY)},
        mapa:map[]);


dato1= FOREACH u GENERATE FLATTEN(mapa) as clave;
dato2= group dato1 by clave;
dato3 = FOREACH dato2 GENERATE group, COUNT(dato1);


store dato3 into 'output' using PigStorage(',');
fs -copyToLocal output
