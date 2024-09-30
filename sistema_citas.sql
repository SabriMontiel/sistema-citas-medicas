CREATE DATABASE sistema_citas;

USE sistema_citas;

-- Tabla Localidad
CREATE TABLE Localidad (
    id_localidad INT,
    nombre VARCHAR(100) NOT NULL,
    CONSTRAINT PK_localidad PRIMARY KEY (id_localidad)
);

--Tabla código postal
CREATE TABLE Codigo_postal (
    id_cod_postal INT ,
    num_codigo VARCHAR(10) NOT NULL,
     CONSTRAINT PK_codigoPostal PRIMARY KEY (id_cod_postal)
);

--Tabla sexo
CREATE TABLE Sexo (
    id_sexo INT ,
    descripcion VARCHAR(50) NOT NULL,
     CONSTRAINT PK_sexo PRIMARY KEY (id_sexo)
);

--Tabla obra social
CREATE TABLE Obra_social (
    id_obra_social INT ,
    descripcion VARCHAR(100) NOT NULL,
     CONSTRAINT PK_obraSocial PRIMARY KEY (id_obra_social)
);

--Tabla paciente
CREATE TABLE Paciente (
    id_paciente INT ,
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
    CONSTRAINT FK_paciente_localidad FOREIGN KEY (id_localidad) REFERENCES Localidad(id_localidad),
    CONSTRAINT PK_paciente_cp FOREIGN KEY (id_cod_postal) REFERENCES Codigo_postal(id_cod_postal),
    CONSTRAINT PK_paciente_sexo FOREIGN KEY (id_sexo) REFERENCES Sexo(id_sexo),
    CONSTRAINT PK_paciente_obraSocial FOREIGN KEY (id_obra_social) REFERENCES Obra_social(id_obra_social),
    CONSTRAINT UK_paciente_email UNIQUE(email),
    CONSTRAINT UK_paciente_telefono UNIQUE (telefono),
    CONSTRAINT UK_paciente_dni UNIQUE (dni)
);
