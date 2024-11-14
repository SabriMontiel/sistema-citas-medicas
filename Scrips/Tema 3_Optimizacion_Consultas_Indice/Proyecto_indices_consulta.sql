

DECLARE @i INT = 1;
WHILE @i <= 1000000
BEGIN
    INSERT INTO Paciente (
        id_paciente, nombre, apellido, domicilio, fecha_nacimiento, email, telefono, dni, 
        id_localidad, id_sexo, id_obra_social
    )
    VALUES (
        @i,  
        'Nombre ' + CAST(@i AS VARCHAR(10)),  
        'Apellido ' + CAST(@i AS VARCHAR(10)),  
        'Domicilio ' + CAST(@i AS VARCHAR(10)),  
        DATEADD(DAY, - (RAND() * 365 * 50), GETDATE()),  
        'email' + CAST(@i AS VARCHAR(10)) + '@dominio.com',  
        'Telefono' + CAST(@i AS VARCHAR(10)),  
        'DNI' + CAST(@i AS VARCHAR(10)),  
        1 + (@i % 6),  -- id_localidad (reutilizando 3 localidades: 1, 2, 3)
        1 + (@i % 2),  -- id_sexo (reutilizando 2 sexos: 1, 2)
        1 + (@i % 6)   -- id_obra_social (reutilizando 2 obras sociales: 1, 2)
    );
    SET @i = @i + 1;
END;

SELECT * FROM Paciente;

SELECT *
FROM Paciente
WHERE fecha_nacimiento BETWEEN '1970-01-01' AND '1985-12-31';

ALTER TABLE Ficha_Paciente DROP CONSTRAINT FK_Ficha_Paciente_Paciente; ---Quitar FK

ALTER TABLE Ficha_Paciente ADD CONSTRAINT FK_Ficha_Paciente_Paciente FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente); --Restaurar FK

ALTER TABLE Asignacion_profesional_paciente DROP CONSTRAINT FK_Asignacion_profesional_paciente_paciente; ---Quitar FK

ALTER TABLE Asignacion_profesional_paciente  ADD CONSTRAINT FK_Asignacion_profesional_paciente_paciente ---Restaurar FK

ALTER TABLE Paciente DROP CONSTRAINT PK_paciente; ---Quitar PK

ALTER TABLE Paciente ADD CONSTRAINT PK_paciente PRIMARY KEY (id_paciente); --Restaurar PK

CREATE CLUSTERED INDEX IDX_FechaNac_Paciente
ON Paciente (fecha_nacimiento);


DROP INDEX IDX_FechaNac_Paciente ON Paciente;


CREATE CLUSTERED INDEX [IX_fecha]
ON [dbo].[Paciente] ([fecha_nacimiento],[dni])
    
DROP INDEX IX_FECHA ON Paciente;


SELECT * FROM sys.indexes
WHERE object_id = OBJECT_ID('Paciente'); ---Muestra los index existentes

