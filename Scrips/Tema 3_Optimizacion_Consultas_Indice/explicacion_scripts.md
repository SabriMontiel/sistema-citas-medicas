**﻿A continuación esta son las serie de pasos que hay que seguir para poder ver el resultado de los scripts, cabe aclarar que se debieron haber ejecutado todos los scripts anteriores** 

1. **Carga Masiva de datos en la tabla paciente**

Se realizan un total de un millón de registros en la tabla paciente para poder realizar las diferentes consultas.

```sql
DECLARE @i INT = 1; -- DECLARE permite declarar variables con su tipo de dato.

WHILE @i <= 1000000 –- Ciclo while normal

BEGIN – Marca el principio de la instruccion

`    `INSERT INTO Paciente (

`        `id_paciente, nombre, apellido, domicilio, fecha_nacimiento, email, telefono, dni, 

`        `id_localidad, id_sexo, id_obra_social

`    `)

`    `VALUES (

`        `@i,  

`        `'Nombre ' + CAST(@i AS VARCHAR(10)),  -- Cast para coincidencia de datos.

`        `'Apellido ' + CAST(@i AS VARCHAR(10)), 

`        `'Domicilio ' + CAST(@i AS VARCHAR(10)),  

`        `DATEADD(DAY, - (RAND() \* 365 \* 50), GETDATE()),  

`        `'email' + CAST(@i AS VARCHAR(10)) + '@dominio.com',  

`        `'Telefono' + CAST(@i AS VARCHAR(10)),  

`        `'DNI' + CAST(@i AS VARCHAR(10)),  

`        `1 + (@i % 6),  -- toma alguna de las 3 localidades

`        `1 + (@i % 2),  -- toma alguno de los 2 sexos

`        `1 + (@i % 6)   -- toma alguna de las 2 obras sociales

`    `);

`    `SET @i = @i + 1; -- Incrementa el contador en 1 de la iteración.

END; -- Termina la instruccion
```





1. **Consultas con y sin índices**

` `Al final se vera una información detallada de las diferentes consultas realizadas.

- **Consulta sin índice:**

Para primero poder realizar una consulta sin índice debemos quitar la restricción de clave primaria de la tabla paciente con sus respectivas claves foraneas:
```sql
ALTER TABLE Ficha_Paciente DROP CONSTRAINT FK_Ficha_Paciente_Paciente;
```
```sql
ALTER TABLE Asignacion_profesional_paciente DROP CONSTRAINT   FK_Asignacion_profesional_paciente_paciente; 
```
```sql
ALTER TABLE Paciente DROP CONSTRAINT PK_paciente; ---Quita pk de paciente
```
Esto se hace debido a que en sql server al realizar una consulta sobre una tabla, el mismo lo que hace es tomar al campo que tenga la restricción de clave primaria como un índice en si, por eso para realizar una consulta sin índice es mejor eliminar su restricción.

La consulta que se utilizara a lo largo de estas pruebas devuelve todos los pacientes cuya fecha de nacimiento este situada desde 1970 hasta 1985:
```sql
SELECT 

FROM Paciente

WHERE fecha_nacimiento BETWEEN '1970-01-01' AND '1985-12-31';
```
- **Consulta con índice agrupado**

Si queremos realizar una consulta con un índice agrupado hay que utilizar la sentencia CREATE CLUSTERED INDEX:
```sql
CREATE CLUSTERED INDEX IDX_FechaNac_Paciente
ON Paciente (fecha_nacimiento);
```
Cabe aclarar que solo puede crearse un índice agrupado con respecto a una columna, solo si la tabla no tiene un indice agrupado asociado previamente.

- **Consulta con índice agrupado y otras columnas**

Si queremos realizar una consulta con un índice agrupado y otras columnas incluidas, se puede usar el CREATE CLUSTERED INDEX, pero asociado a mas colimnas de esta manera: 
```sql
CREATE CLUSTERED INDEX [IX_fecha]
ON [dbo].[Paciente] ([fecha_nacimiento],[dni])
```
A continuación se mostrará un detalle de los tiempos de respuesta obtenidos:

|Prueba|Tiempo de ejecucion|Tipo de Operacion|Costo Relativo|Estimacion de Filas|Filas Leidas|Tipo de Indice|<p>Columnas del </p><p>Indice</p>|Observaciones|
| :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: |
|Sin índice |0\.844 segs|Scan |100%|1,000,000|222289|Ninguno|Ninguno|Consulta lenta y sin ordenar.|
|Con indice|0\.169 segs|Index Seek|100%|1,000,000|222289|Clustered|Fecha\_nacimiento|Consulta aun mas rápida y ordenado por fecha de nacimiento.|
|Con índice (incluyendo, fecha\_nacimiento, y dni)|<p>0\.169</p><p>segs</p>|Index seek|100%|1,000,000|222289|Clustered|Fecha\_nacimiento, , dni|Consulta exactamente igual de rápida que la prueba anterior|


1. **Conclusión** 

Utilizando la consulta antes mencionada en el trabajo, se pudo concluir que debido a que los índices agrupados, permiten organizar físicamente los datos en la tabla los tiempos de respuesta mejoran bastante a que si la tabla en cuestión, no tiene índices. La desventaja de utilizar índices agrupados es que solo se puede tener un solo índice agrupado por tabla. También se concluyó que utilizar índices agrupado con mas de una columna  generan casi el mismo tiempo de respuesta, ya que justamente depende de la consulta en cuestión y además en este caso como estamos consultando por fecha_nacimiento de nuevo entonces los tiempos no van a variar mucho.


