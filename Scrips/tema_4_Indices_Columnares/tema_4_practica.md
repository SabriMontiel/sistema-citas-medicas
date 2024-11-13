Explicaremos mejor el funcionamiento de los indices columnares con un ejemplo practico de nuestro proyecto:

Tenemos una tabla paciente en la cuál, entre otras cosas, tenemos almacenada la edad, la obra social y el email del paciente. Queremos calcular la edad promedio del paciente. Para comparar el rendimiento con un ordenamiento estándar por fila, utilizamos las tablas paciente\_con\_indice y paciente\_sin, las cuales cuentan con un millón de registros

Creamos el indice sobre la tabla paciente\_con\_indice:

CREATE COLUMNSTORE INDEX idx\_columnstore\_paciente

ON paciente\_con\_indice (email,id\_sexo,fecha\_nacimiento,id\_localidad)

Luego realizamos la consulta de edad promedio sobre la tabla sin indice llamada paciente\_sin:

SELECT id\_localidad, id\_sexo, COUNT(\*) AS total\_pacientes

FROM paciente\_sin

GROUP BY id\_localidad, id\_sexo;

El resultado y el tiempo de ejecución:

Table 'Worktable'. Scan count 0, logical reads 0, physical reads 0, page server reads 0, read-ahead reads 0, page server read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob page server reads 0, lob read-ahead reads 0, lob page server read-ahead reads 0.

Table 'Workfile'. Scan count 0, logical reads 0, physical reads 0, page server reads 0, read-ahead reads 0, page server read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob page server reads 0, lob read-ahead reads 0, lob page server read-ahead reads 0.

Table 'paciente\_sin'. Scan count 1, logical reads 15788, physical reads 0, page server reads 0, read-ahead reads 15788, page server read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob page server reads 0, lob read-ahead reads 0, lob page server read-ahead reads 0.

` `SQL Server Execution Times:

`   `CPU time = 390 ms,  elapsed time = 644 ms.

La consulta tardó 644 milisegundos, un tiempo de respuesta bastante lento para los estándares modernos.




Al realizar la misma consulta sobre la tabla con indice columnar llamada paciente\_con\_indice, como se puede apreciar en la consulta:

SELECT id\_localidad, id\_sexo, COUNT(\*) AS total\_pacientes

FROM paciente\_con\_indice

GROUP BY id\_localidad, id\_sexo;

Obtenemos el siguiente resultado:

Table 'paciente\_con\_indice'. Scan count 2, logical reads 0, physical reads 0, page server reads 0, read-ahead reads 0, page server read-ahead reads 0, lob logical reads 406, lob physical reads 0, lob page server reads 0, lob read-ahead reads 0, lob page server read-ahead reads 0.

Table 'paciente\_con\_indice'. Segment reads 1, segment skipped 0.

` `SQL Server Execution Times:

`   `CPU time = 0 ms,  elapsed time = 6 ms.

La consulta se ejecutó de manera casi instantánea. El tiempo de respuesta fue de 6ms. Además, se redujo considerablemente el numero de operacion de Entrada/salida: 15788 lecturas contra 406 al utilizar indices columnares.

Si realizáramos promedios sobre 2 columnas distintas, el beneficio en rendimiento podría ser aún mayor ya que se puede optimizar el procesamiento utilizando paralelismo. De esta manera, un núcleo del procesador podría encargarse del calculo de la edad, mientras que otro núcleo podría calcular al mismo tiempo la obra social mas común.

En nuestro sistema utilizamos indices columnares no agrupados, ya que las consultas analíticas no son más importantes que las consultas transaccionales, y ciertas operaciones, como leer los datos de un paciente en especifico, son más eficientes cuando almacenamos la información por fila. Por algo el almacenamiento por fila es el estándar en las bases de datos relacionales. Por ello debemos ser cuidadosos a la hora de utilizar indices columnares agrupados ya que la modificación en la forma de almacenamiento de los datos puede ayudarnos a ahorrar espacio en disco y optimizar las consultas analíticas, pero entregando a cambio velocidad de respuesta en las consultas transaccionales, lo cual puede ser trágico en un sistema orientado a transacciones.
