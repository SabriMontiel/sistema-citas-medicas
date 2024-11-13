
--Indices columnares en SQL Server

/*inicio de script de insercion de un millon de registros
sobre la tabla paciente_con_indice*/
DECLARE @counter INT = 1;

WHILE @counter <= 1000000
BEGIN
    INSERT INTO paciente_con_indice (
        id_paciente,
        nombre,
        apellido,
        domicilio,
        fecha_nacimiento,
        email,
        telefono,
        dni,
        id_localidad,
        id_cod_postal,
        id_sexo,
        id_obra_social
    )
    VALUES (
        @counter, 
        CONCAT('Nombre', @counter % 1000),
        CONCAT('Apellido', @counter % 1000),
        CONCAT('Domicilio ', @counter),
        DATEADD(DAY, -((@counter % 365) + 7300), GETDATE()),
        CONCAT('email', @counter, '@example.com'),
        CONCAT('123-456', RIGHT('0000' + CAST(@counter AS VARCHAR(4)), 4)),
        CONCAT('DNI-', @counter),
        (@counter % 6) + 1,
        (@counter % 10000) + 1,
        (@counter % 2) + 1,
        (@counter % 6) + 1 
    );

    SET @counter = @counter + 1;
END;
--fin de script de insercion de un millon de registros

SET STATISTICS TIME ON;--mostrará el tiempo de CPU y tiempo total de ejecución
SET STATISTICS IO ON;--mostrará la cantidad de operaciones de lectura de página para monitorear la entrada/salida.

--crear copia de la tabla paciente_con_indice en una nueva tabla llamada paciente_sin
SELECT * INTO paciente_sin FROM paciente_con_indice;

--crear indice columnar sobre la tabla paciente_con_indice
CREATE COLUMNSTORE INDEX idx_columnstore_paciente
ON paciente_con_indice (email, id_sexo, fecha_nacimiento, id_localidad);

--consulta sobre tabla sin indice para comparar resultados
SELECT id_localidad, id_sexo, COUNT(*) AS total_pacientes
FROM paciente_sin
GROUP BY id_localidad, id_sexo;

--consulta sobre tabla con indice para comparar resultados
SELECT id_localidad, id_sexo, COUNT(*) AS total_pacientes
FROM paciente_con_indice
GROUP BY id_localidad, id_sexo;

/*Al analizar los tiempos de respuesta y la cantidad de lecturas podremos apreciar la ventaja de rendimiento.
En el archivo tema_4_practica.md se puede ver la comparacion de resultados de las consultas
realizadas en una noteboox modelo ASUS X556UB*/




