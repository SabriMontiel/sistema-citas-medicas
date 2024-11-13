--PROCEDIMIENTOS ALMACENDOS
-- Creacion del procedimiento almacenado para insertar atencion medica
CREATE PROCEDURE sp_InsertAtencionMedica
    @id_atencion_medica INT,
    @fecha_consulta DATE,
    @notas_observacion VARCHAR(250),
    @id_paciente INT,
    @id_profesional INT,
    @id_tratamiento INT
AS
BEGIN
    INSERT INTO dbo.Atencion_medica (id_atencion_medica, fecha_consulta, notas_observacion_, id_paciente, id_profesional, id_tratamiento)
    VALUES (@id_atencion_medica, @fecha_consulta, @notas_observacion, @id_paciente, @id_profesional, @id_tratamiento);
END;

-- Insertar usando procedimiento sp_InsertAtencionMedica
--El usuario ConsultaMedica debe usar el procedimiento almacenado para realizar inserciones
EXEC dbo.sp_InsertAtencionMedica 
    @id_atencion_medica = 7,  -- Este ID no debe existir en la tabla
    @fecha_consulta = '2024-07-10', -- Fecha de la consulta 
    @notas_observacion = 'Revisión de seguimiento por dolor de rodilla', -- Notas de la consulta
    @id_paciente = 2,          -- ID de Maria Gomez
    @id_profesional = 2,       -- ID de Maria Gonzalez
    @id_tratamiento = 1;       -- Fisioterapia

GO

--verificamos que se realizaron los procedimientos
SELECT *  from Atencion_medica;


GO

--Procedimiento para modificar registros
CREATE PROCEDURE sp_ModificarAtencionMedica
    @id_atencion_medica INT,
    @fecha_consulta DATE,
    @notas_observacion VARCHAR(250),
    @id_paciente INT,
    @id_profesional INT,
    @id_tratamiento INT
AS
BEGIN
    UPDATE dbo.Atencion_medica
    SET 
        fecha_consulta = @fecha_consulta,
        notas_observacion_ = @notas_observacion,
        id_paciente = @id_paciente,
        id_profesional = @id_profesional,
        id_tratamiento = @id_tratamiento
    WHERE id_atencion_medica = @id_atencion_medica;
END;
GO

-- Realizar UPDATE y DELETE invocando procedimientos
-- Actualizar usando procedimiento sp_UpdatePaciente(se actualizara: fecha de consulta, notas_observacion)
EXEC dbo.sp_ModificarAtencionMedica
   @id_atencion_medica = 3,
    @fecha_consulta ='2024-10-11',
    @notas_observacion = 'El paciente ya no presenta dolores',
    @id_paciente = 3,
    @id_profesional = 3,
    @id_tratamiento = 3
GO
--verificamos que se actualizaron los procedimientos
SELECT *  from Atencion_medica;


-- Procedimiento para eliminar registros
CREATE PROCEDURE sp_EliminarAtencionMedica
    @id_atencion_medica INT
AS
BEGIN
    DELETE FROM dbo.Atencion_medica
    WHERE id_atencion_medica = @id_atencion_medica;
END;
GO
-- Borrar usando procedimiento sp_DeletePaciente, se deberia eliminar la atencion medica 7
EXEC sp_EliminarAtencionMedica @id_atencion_medica = 7;


-- FUNCIONES ALMACENADAS:
-- Función para calcular la edad a partir de la fecha de nacimiento
CREATE FUNCTION CalcularEdad(@fecha_nacimiento DATE)
RETURNS INT
AS
BEGIN
    RETURN DATEDIFF(YEAR, @fecha_nacimiento, GETDATE())
           - CASE WHEN MONTH(@fecha_nacimiento) * 100 + DAY(@fecha_nacimiento)
                    > MONTH(GETDATE()) * 100 + DAY(GETDATE()) THEN 1 ELSE 0 END;
END;
GO

-- Mostrar la edad de un paciente específico
SELECT nombre, apellido, dbo.CalcularEdad(fecha_nacimiento) AS edad
FROM Paciente
WHERE id_paciente = 6;

-- Mostrar la edad de todos los pacientes
SELECT nombre, apellido, dbo.CalcularEdad(fecha_nacimiento) AS edad
FROM Paciente;

-- Función para obtener el nombre completo de un paciente
CREATE FUNCTION ObtenerNombreCompleto(@id_paciente INT)
RETURNS NVARCHAR(201)
AS
BEGIN
    DECLARE @nombre NVARCHAR(100), @apellido NVARCHAR(100);
    SELECT @nombre = nombre, @apellido = apellido
    FROM Paciente
    WHERE id_paciente = @id_paciente;
    RETURN @nombre + ' ' + @apellido;
END;
GO

--Mostrar nombre completo de un paciente
SELECT dbo.ObtenerNombreCompleto(6) AS nombre_Completo

-- Mostrar nombre completo de todos los pacientes
SELECT id_paciente, dbo.ObtenerNombreCompleto(id_paciente) AS NombreCompleto
FROM Paciente;

-- Función para obtener la obra social de un paciente
CREATE FUNCTION ObtenerObraSocial(@id_paciente INT)
RETURNS NVARCHAR(100)
AS
BEGIN
    DECLARE @obra_social NVARCHAR(100);
    SELECT @obra_social = os.descripcion
    FROM Paciente p
    JOIN Obra_social os ON p.id_obra_social = os.id_obra_social
    WHERE p.id_paciente = @id_paciente;
    RETURN @obra_social;

END;
GO

-- Obtener la obra social de un paciente específico
SELECT dbo.ObtenerObraSocial(6) AS ObraSocial;

-- Obtener la obra social de todos los pacientes
SELECT id_paciente, dbo.ObtenerObraSocial(id_paciente) AS ObraSocial
FROM Paciente;

-- Combinar todas las funciones en una consulta
SELECT 
    id_paciente,
    dbo.ObtenerNombreCompleto(id_paciente) AS NombreCompleto,
    dbo.CalcularEdad(fecha_nacimiento) AS Edad,
    dbo.ObtenerObraSocial(id_paciente) AS ObraSocia

FROM Paciente;
