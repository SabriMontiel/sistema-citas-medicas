------------------------------------------------------------------------------------------------------------------

--/PERMISOS A NIVEL DE USUARIOS/

-- Creacion del usuario con permisos de administrador
CREATE LOGIN AdminMedico WITH PASSWORD = 'AdminPassword123';
CREATE USER AdminMedico FOR LOGIN AdminMedico;
ALTER ROLE db_owner ADD MEMBER AdminMedico;

-- Creacion del usuario con permisos de solo lectura y ejecucion
CREATE LOGIN ConsultaMedica WITH PASSWORD = 'ConsultaPassword123';
CREATE USER ConsultaMedica FOR LOGIN ConsultaMedica;

-- Permiso de lectura en la tabla Atencion_medica
GRANT SELECT ON dbo.Atencion_medica TO ConsultaMedica;

-- Permiso de ejecucion en el procedimiento almacenado sp_InsertAtencionMedica
GRANT EXECUTE ON dbo.sp_InsertAtencionMedica TO ConsultaMedica;


select * from Atencion_medica
-- Insercion permitida para el usuario AdminMedico
INSERT INTO dbo.Atencion_medica (id_atencion_medica, fecha_consulta, notas_observacion_, id_paciente, id_profesional, id_tratamiento)
VALUES (16, '2024-07-10', 'Control de seguimiento', 3, 3, 1);

-- Insercion permitida para el usuario AdminMedico
INSERT INTO dbo.Atencion_medica (id_atencion_medica, fecha_consulta, notas_observacion_, id_paciente, id_profesional, id_tratamiento)
VALUES (17, '2024-09-15', 'Evaluación de tratamiento de esguince.', 3, 3, 3);

-- Insercion permitida para el usuario AdminMedico
INSERT INTO dbo.Atencion_medica (id_atencion_medica, fecha_consulta, notas_observacion_, id_paciente, id_profesional, id_tratamiento)
VALUES (18, '2024-09-20', 'Consulta inicial para psicoterapia.', 4, 4, 4);

-- Insercion permitida para el usuario AdminMedico
INSERT INTO dbo.Atencion_medica (id_atencion_medica, fecha_consulta, notas_observacion_, id_paciente, id_profesional, id_tratamiento)
VALUES (19, '2024-09-20', 'Consulta inicial para psicoterapia.', 4, 4, 4);

-- Insercion permitida para el usuario AdminMedico
INSERT INTO dbo.Atencion_medica (id_atencion_medica, fecha_consulta, notas_observacion_, id_paciente, id_profesional, id_tratamiento)
VALUES (20, '2024-09-20', 'Consulta inicial para psicoterapia.', 4, 4, 4);


--El usuario ConsultaMedica debe usar el procedimiento almacenado para realizar inserciones
EXEC dbo.sp_InsertAtencionMedica 
    @id_atencion_medica = 21,  -- Este ID no debe existir en la tabla
    @fecha_consulta = '2024-07-10', -- Fecha de la consulta 
    @notas_observacion = 'Revisión de seguimiento por dolor de rodilla', -- Notas de la consulta
    @id_paciente = 2,          -- ID de Maria Gomez
    @id_profesional = 2,       -- ID de Maria Gonzalez
    @id_tratamiento = 1;       -- Fisioterapia

--El usuario ConsultaMedica debe usar el procedimiento almacenado para realizar inserciones
	EXEC dbo.sp_InsertAtencionMedica 
    @id_atencion_medica = 22,  -- Este ID no debe existir en la tabla
    @fecha_consulta = '2024-08-15',  -- Fecha de la consulta
    @notas_observacion = 'Consulta inicial para dolor de espalda.',  -- Notas de la consulta
    @id_paciente = 1,          -- ID de Sabrina Montiel
    @id_profesional = 1,       -- ID de Jose Ramirez
    @id_tratamiento = 2;       -- Terapia Ocupacional

--El usuario ConsultaMedica debe usar el procedimiento almacenado para realizar inserciones
	EXEC dbo.sp_InsertAtencionMedica 
    @id_atencion_medica = 23,  -- Este ID no debe existir en la tabla
    @fecha_consulta = '2024-09-20',  -- Fecha de la consulta
    @notas_observacion = 'Seguimiento por tratamiento de esguince.',  -- Notas de la consulta
    @id_paciente = 3,          -- ID de Juana Paez
    @id_profesional = 3,       -- ID de Juan Pedro Sanchez
    @id_tratamiento = 3;       -- Medicacion

/*******************************************************************/


--/PERMISOS A NIVEL DE ROLES DEL DBMS/

-- Crear usuario que tendra permisos de lectura en la tabla Diagnostico
CREATE LOGIN UsuarioConPermisoLectura WITH PASSWORD = 'Password123';
CREATE USER UsuarioConPermisoLectura FOR LOGIN UsuarioConPermisoLectura;

-- Crear usuario que no tendra permisos en la tabla Diagnostico
CREATE LOGIN UsuarioSinPermisoLectura WITH PASSWORD = 'Password123';
CREATE USER UsuarioSinPermisoLectura FOR LOGIN UsuarioSinPermisoLectura;


-- Crear el rol LecturaDiagnostico con permisos de solo lectura en la tabla Diagnostico
CREATE ROLE LecturaDiagnostico;
GRANT SELECT ON dbo.Diagnostico TO LecturaDiagnostico;


-- Asignar el rol LecturaDiagnostico a UsuarioConPermisoLectura
ALTER ROLE LecturaDiagnostico ADD MEMBER UsuarioConPermisoLectura;


-- Consulta permitida para UsuarioConPermisoLectura sobre Diagnostico y no permitida para UsuarioSinPermisoLectura (deberia fallar para UsuarioSinPermisoLectura)
SELECT * FROM dbo.Diagnostico;