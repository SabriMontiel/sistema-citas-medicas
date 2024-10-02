CREATE DATABASE sistema_citas;

USE sistema_citas;


CREATE TABLE Provincia (
    id_provincia INT,
    nombre_provincia VARCHAR(30) NOT NULL,
     CONSTRAINT PK_Provincial PRIMARY KEY (id_provincia)
);

CREATE TABLE Ciudad (
    id_ciudad INT,
    nombre_ciudad VARCHAR(30) NOT NULL,
	id_provincia INT not null,
     CONSTRAINT PK_Ciudad PRIMARY KEY (id_ciudad),
	 CONSTRAINT FK_Ciudad_Provincia FOREIGN KEY (id_provincia) REFERENCES Provincia(id_provincia)
);

-- Tabla Localidad
CREATE TABLE Localidad (
    id_localidad INT,
    nombre VARCHAR(100) NOT NULL,
	cod_postal int not null,
	id_provincia int not null,
    CONSTRAINT PK_localidad PRIMARY KEY (id_localidad),
CONSTRAINT FK_Localidad_Provincia FOREIGN KEY (id_provincia) REFERENCES Provincia(id_provincia)
);

--Tabla sexo
CREATE TABLE Sexo (
    id_sexo INT,
    descripcion VARCHAR(50) NOT NULL,
     CONSTRAINT PK_sexo PRIMARY KEY (id_sexo)
);

--Tabla obra social
CREATE TABLE Obra_social (
    id_obra_social INT,
    descripcion VARCHAR(100) NOT NULL,
     CONSTRAINT PK_obraSocial PRIMARY KEY (id_obra_social)
);

--Tabla paciente
CREATE TABLE Paciente (
    id_paciente INT,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    domicilio VARCHAR(255),
    fecha_nacimiento DATE NOT NULL,
    email VARCHAR(100),
    telefono VARCHAR(20),
    dni VARCHAR(20) UNIQUE NOT NULL, 
    id_localidad INT,
    id_cod_postal INT,
    id_sexo INT,
    id_obra_social INT,
    CONSTRAINT PK_paciente PRIMARY KEY (id_paciente),
    CONSTRAINT FK_paciente_Ciudad FOREIGN KEY (id_localidad) REFERENCES Ciudad(id_ciudad),
    CONSTRAINT PK_paciente_sexo FOREIGN KEY (id_sexo) REFERENCES Sexo(id_sexo),
    CONSTRAINT PK_paciente_obraSocial FOREIGN KEY (id_obra_social) REFERENCES Obra_social(id_obra_social),
    CONSTRAINT UK_paciente_email UNIQUE(email),
    CONSTRAINT UK_paciente_telefono UNIQUE (telefono),
    CONSTRAINT UK_paciente_dni UNIQUE (dni)
);

//CREATE TABLE PRUEBA(
//);


CREATE TABLE Tratamiento
(
  id_tratamiento INT NOT NULL,
  descripcion VARCHAR(40) NOT NULL,
  CONSTRAINT PK_Tratamiento PRIMARY KEY (id_tratamiento)
);

CREATE TABLE Diagnostico
(
  id_diagnostico INT NOT NULL, 
  descripcion VARCHAR(40) NOT NULL,
  CONSTRAINT PK_Diagnostico PRIMARY KEY (id_diagnostico)
);

CREATE TABLE Atencion_medica_diagnostico
(
  id_diagnostico INT NOT NULL,
  id_atencion_medica INT NOT NULL,
  CONSTRAINT PK_Atencion_medica_diagnostico PRIMARY KEY (id_diagnostico, id_atencion_medica),
  CONSTRAINT FK_Atencion_medica_diagnostico_REFERENCES_Diagnostico FOREIGN KEY (id_diagnostico) REFERENCES Diagnostico(id_diagnostico),
  CONSTRAINT FK_Atencion_medica_diagnostico_REFERENCES_Atencion_medica FOREIGN KEY (id_atencion_medica) REFERENCES Atencion_medica(id_atencion_medica)
);

CREATE TABLE Profesional (
    id_profesional INT,
    nombre_profesional VARCHAR(30) NOT NULL,
	apellido_profesional VARCHAR(30) NOT NULL,
	lic_medica INT NOT NULL,
    CONSTRAINT PK_Profesional PRIMARY KEY (id_profesional),
	CONSTRAINT UQ_Profesional_lic_medica UNIQUE(lic_medica)
);

CREATE TABLE Asignacion_profesional_paciente (
    id_paciente INT,
	id_profesional INT,
    fecha_inicio DATE NOT NULL,
	fecha_fin DATE NOT NULL,
    CONSTRAINT PK_Profesional PRIMARY KEY (id_paciente,id_profesional),
	CONSTRAINT FK_Asignacion_profesional_paciente_paciente FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente),
	CONSTRAINT FK_Asignacion_profesional_paciente_profesional FOREIGN KEY (id_profesional) REFERENCES Profesional(id_profesional)
);

CREATE TABLE Atencion_medica
(
  id_atencion_medica INT NOT NULL,
  fecha_consulta DATE NOT NULL,
  notas_observacion_ INT NOT NULL,
  id_paciente INT NOT NULL,
  id_profesional_ INT NOT NULL,
  id_tratamiento INT NOT NULL,
  CONSTRAINT PK_atencion_medica PRIMARY KEY (id_atencion_medica),
  CONSTRAINT FK_Atencion_medica_Asignacion_profesional FOREIGN KEY (id_paciente, id_profesional_) REFERENCES Asignacion_profesional_paciente(id_paciente, 		id_profesional_),
  CONSTRAINT FK_Atencion_medica_Tratamiento FOREIGN KEY (id_tratamiento) REFERENCES Tratamiento(id_tratamiento)
);

CREATE TABLE Ficha_Paciente
(
  id_paciente INT NOT NULL,
  id_atencion_medica INT NOT NULL,
  CONSTRAINT PK_Ficha_Paciente PRIMARY KEY (id_paciente, id_atencion_medica),
  CONSTRAINT FK_Ficha_Paciente_Paciente FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente),
  CONSTRAINT FK_Ficha_Paciente_Atencion_Medica FOREIGN KEY (id_atencion_medica) REFERENCES Atencion_medica(id_atencion_medica)
);


