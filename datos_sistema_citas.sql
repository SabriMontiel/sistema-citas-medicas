USE sistema_citas;
GO
-- Lote de datos representativos--
--Tabla sexo
INSERT INTO Sexo (id_sexo, descripcion) 
VALUE
(1,'FEMENINO'),
(2, 'MASCULINO');
GO
--Tabla obra social
INSERT INTO Obra_social (id_obra_social,descripcion )
VALUE 
(1,'IOSCOR'),
(2,'SANCOR SALUD'),
(3, 'OSDE'),
(4, 'OSECAC '),
(5, 'MEDIFE'),
(6,'SWISS MEDICAL');
GO
--Tabla paciente
INSERT INTO Paciente (id_paciente, nombre, apellido, domicilio, fecha_nacimiento, email, telefono, dni, id_localidad, id_sexo, id_obra_social)
VALUE
(1, 'Sabrina', 'Montiel','quintana 1276', '1997-08-07', 'sabri@gmail', 37941212, 12345, 2,1,4),
(2, 'Maria', 'Gomez','9 de julio 123', '2000-03-04', 'maria@gmail', 37941234, 12456, 4,1,5),
(3, 'Juana', 'Paez','salta 2345', '2003-12-17', 'juana@gmail', 37953344, 23445, 5,1,2),
(4, 'Franco', 'Colapinto','catamarca 1456', '2003-06-27', 'franco@gmail', 3794099, 44567, 1,2,3),
(5, 'Max', 'Verstappen','mendoza 2375', '1997-09-30', 'max@gmail', 37950505, 11111, 3,2,1),
(6, 'Lewis', 'Hamilton',' Cordoba 1144', '1977-06-17', 'lewis@gmail', 379444, 44444, 2,2,6),

SELECT * FROM sexo;
SELECT * FROM Obra_social;
SELECT * FROM Paciente;



//aca aroba de  trataniento deberia ir el resto

INSERT INTO Tratamiento (descripcion) VALUES 
('Fisioterapia'),
('Terapia Ocupacional'),
('Medicación'),
('Psicoterapia'),
('Rehabilitación Cardiaca'),
('Acupuntura');
GO

INSERT INTO Diagnostico (descripcion) VALUES 
('Lesión Muscular'),
('Fractura'),
('Esguince'),
('Tendinitis'),
('Artritis'),
('Síndrome del túnel carpiano');
GO

INSERT INTO Atencion_medica_diagnostico (id_diagnostico, id_atencion_medica) VALUES 
(1, 1),
(2, 1),
(3, 2),
(4, 2),
(5, 1),
(6, 2);
GO

SELECT * FROM Tratamiento;

SELECT * FROM Diagnostico;

SELECT * FROM Atencion_medica_diagnostico;




