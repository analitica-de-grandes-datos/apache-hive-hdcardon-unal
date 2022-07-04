/* 
Pregunta
===========================================================================

Para resolver esta pregunta use el archivo `data.tsv`.

Construya una consulta que ordene la tabla por letra y valor (3ra columna).

Apache Hive se ejecutará en modo local (sin HDFS).

Escriba el resultado a la carpeta `output` de directorio de trabajo.

        >>> Escriba su respuesta a partir de este punto <<<
*/

DROP TABLE IF EXISTS datos;
DROP TABLE IF EXISTS datos_ordenados;

CREATE TABLE datos (
    letra STRING,
    fecha DATE, 
    numero INT
    )
    ROW FORMAT DELIMITED 
        FIELDS TERMINATED BY '\t'
        LINES TERMINATED BY '\n';

LOAD DATA LOCAL INPATH 'data.tsv' OVERWRITE INTO TABLE datos;

CREATE TABLE datos_ordenados
AS
    SELECT *
    FROM
        datos
ORDER BY
    letra ASC,numero ASC,fecha ASC;

INSERT OVERWRITE LOCAL DIRECTORY './output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
SELECT * FROM datos_ordenados;
