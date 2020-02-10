-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra. 
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

Tabla = LOAD 'data.tsv' USING PigStorage()
    AS (Letra:CHARARRAY,
        Fecha:CHARARRAY,
        Num:INT);
Tabla2 = GROUP Tabla BY Letra;
Lettercount = FOREACH Tabla2 GENERATE group, COUNT(Tabla);
DUMP Lettercount;

STORE Lettercount INTO 'output';

fs -copyToLocal output