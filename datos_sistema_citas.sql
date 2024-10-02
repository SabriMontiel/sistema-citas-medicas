
USE sistema_citas;
GO
-- Lote de datos representativos--

--Tabla Provincia
INSERT INTO Provincia (id_provincia,nombre_provincia)
VALUES
(1,'Corrientes'),
(2,'Formosa'),
(3,'Chaco'),
(4,'Misiones'),
(5,'Mendoza'),
(6,'Buenos Aires');

--Tabla Localidad
INSERT INTO Localidad (id_localidad,nombre,cod_postal,id_provincia)
VALUES
(1,'Corrientes',3400,1),
(2,'Formosa',3600,2),
(3,'Resistencia',3500,3),
(4,'Posadas',3300,4),
(5,'Mendoza',5500,5),
(6,'Ciudad Autonoma de Buenos Aires',1000,6);
  

--Tabla sexo
INSERT INTO Sexo (id_sexo, descripcion) 
VALUES
(1,'FEMENINO'),
(2, 'MASCULINO');
GO
--Tabla obra social
INSERT INTO Obra_social (id_obra_social,descripcion )
VALUES 
(1,'IOSCOR'),
(2,'SANCOR SALUD'),
(3, 'OSDE'),
(4, 'OSECAC '),
(5, 'MEDIFE'),
(6,'SWISS MEDICAL');
GO
--Tabla paciente
INSERT INTO Paciente (id_paciente, nombre, apellido, domicilio, fecha_nacimiento, email, telefono, dni, id_localidad, id_sexo, id_obra_social)
VALUES
(1, 'Sabrina', 'Montiel','quintana 1276', '1997-08-07', 'sabri@gmail', 37941212, 12345, 2,1,4),
(2, 'Maria', 'Gomez','9 de julio 123', '2000-03-04', 'maria@gmail', 37941234, 12456, 4,1,5),
(3, 'Juana', 'Paez','salta 2345', '2003-12-17', 'juana@gmail', 37953344, 23445, 5,1,2),
(4, 'Franco', 'Colapinto','catamarca 1456', '2003-06-27', 'franco@gmail', 3794099, 44567, 1,2,3),
(5, 'Max', 'Verstappen','mendoza 2375', '1997-09-30', 'max@gmail', 37950505, 11111, 3,2,1),
(6, 'Lewis', 'Hamilton',' Cordoba 1144', '1977-06-17', 'lewis@gmail', 379444, 44444, 2,2,6);

SELECT * FROM sexo;
SELECT * FROM Obra_social;
SELECT * FROM Paciente;


INSERT INTO Profesional(id_profesional,nombre_profesional,apellido_profesional,lic_medica) VALUES
(1,'Jose','Ramirez',34542),
(2,'Maria','Gonzalez',74632),
(3,'Juan Pedro','Sanchez',42312),
(4,'Silvina','Benitez',48382),
(5,'Matias','Esquivel',42341),
(6,'Luz','Martinez',12342);

INSERT INTO Asignacion_profesional_paciente(id_paciente,id_profesional,fecha_inicio,fecha_fin) VALUES
(1,1,'2024-10-12','2024-12-04'),
(2,2,'2022-08-12','2022-11-13'),
(3,3,'2021-04-12','2021-8-23'),
(4,4,'2023-11-12','2024-06-15'),
(5,5,'2024-03-12','2024-07-04'),
(6,6,'2023-09-12','2024-04-17');



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

INSERT INTO Atencion_medica (id_atencion_medica, fecha_consulta,notas_observacion_, id_paciente, id_profesional, id_tratamiento) VALUES
(1, '2024-01-10', 'Paciente con dolor muscular en el brazo derecho.', 1, 1, 1),
(2, '2024-02-14', 'Paciente con inflamación en la rodilla.', 2, 2, 2),
(3, '2024-03-03', 'Paciente con fatiga crónica.', 3, 3, 3),
(4, '2024-04-22', 'Paciente con dolor en el cuello.', 4, 4, 4),
(5, '2024-05-12', 'Paciente en rehabilitación por fractura de brazo.', 5, 5, 5),
(6, '2024-06-07', 'Paciente con síndrome del túnel carpiano.', 6, 6, 6);

INSERT INTO Ficha_Paciente (id_paciente, id_atencion_medica) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6);

SELECT * FROM Tratamiento;

SELECT * FROM Diagnostico;

SELECT * FROM Atencion_medica_diagnostico;
