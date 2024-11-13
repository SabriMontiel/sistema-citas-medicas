### **Introducción**
#### **Permisos a Nivel de Usuario**
Los **permisos a nivel de usuario** son configuraciones en bases de datos que determinan qué acciones puede realizar cada usuario sobre los objetos de la base de datos, como por ejemplo tablas y procedimientos almacenados. Estos permisos son fundamentales para garantizar la seguridad y la integridad de los datos. Los usuarios pueden tener diferentes niveles de acceso según sus necesidades y roles en la organización.
#### **Sentencias para Manejar Permisos**
Las principales sentencias SQL para manejar permisos son:

- **GRANT**: Para otorgar permisos a un usuario o rol.
- **REVOKE**: Para quitar permisos previamente otorgados.
- **DENY**: Para denegar explícitamente permisos, lo que prevalece sobre permisos otorgados.
#### **Tipos de Permisos Más Comunes**
Los permisos más comunes incluyen:

- **SELECT**: Permite leer datos.
- **INSERT**: Permite agregar nuevos registros.
- **UPDATE**: Permite modificar registros existentes.
- **DELETE**: Permite eliminar registros.
- **EXECUTE**: Permite ejecutar procedimientos almacenados.
#### **Roles**
Los **roles** son conjuntos de permisos que se pueden asignar a varios usuarios, facilitando la gestión de permisos. Algunos roles comunes son:

- **db\_owner**: Control total sobre la base de datos.
- **db\_datareader**: Permite leer todas las tablas.
- **db\_datawriter**: Permite modificar datos en las tablas.
- **db\_securityadmin**: Permite gestionar permisos y roles.

###
###
###
### **Aplicación Específica en los Requisitos del trabajo** 
1. **Creación de Usuarios**:
   1. Se crean dos usuarios en la base de datos: un usuario con permisos de administrador (**AdminMedico**) y otro con permisos de solo lectura (**ConsultaMedica**).

      `   `-- Creacion del usuario con permisos de administrador

      `   `CREATE LOGIN AdminMedico WITH PASSWORD = 'AdminPassword123';

      `   `CREATE USER AdminMedico FOR LOGIN AdminMedico;

      `   `-- Creacion del usuario con permisos de solo lectura y ejecucion

      `   `CREATE LOGIN ConsultaMedica WITH PASSWORD = 'ConsultaPassword123';

      `   `CREATE USER ConsultaMedica FOR LOGIN ConsultaMedica;

1. **Asignación de Permisos**:
   1. Al usuario **AdminMedico** se le otorgan permisos de administrador, como **db\_owner**.

   

      `   `ALTER ROLE db\_owner ADD MEMBER AdminMedico;

   1. Al usuario **ConsultaMedica** se le otorgan permisos de solo lectura sobre la tabla **Atencion\_medica** y permisos de ejecución sobre el procedimiento almacenado **sp\_InsertAtencionMedica**.

      `   `-- Permiso de lectura en la tabla Atencion\_medica

      `   `GRANT SELECT ON dbo.Atencion\_medica TO ConsultaMedica;

      `   `-- Permiso de ejecucion en el procedimiento almacenado

      `   `sp\_InsertAtencionMedica

      `   `GRANT EXECUTE ON dbo.sp\_InsertAtencionMedica TO ConsultaMedica;

1. **Uso de Procedimientos Almacenados**:
   1. Se crea un procedimiento almacenado (**sp\_InsertAtencionMedica**) que permite insertar datos en la tabla **Atencion\_medica**.
   1. El usuario **ConsultaMedica**, a pesar de tener solo permisos de lectura, puede ejecutar este procedimiento para insertar datos.

`   `-- Creación del procedimiento almacenado para insertar atención médica

`   `CREATE PROCEDURE sp\_InsertAtencionMedica

`       `@id\_atencion\_medica INT,

`       `@fecha\_consulta DATE,

`       `@notas\_observacion VARCHAR(250),

`       `@id\_paciente INT,

`       `@id\_profesional INT,

`       `@id\_tratamiento INT

`   `AS

`   `BEGIN

`       `INSERT INTO dbo.Atencion\_medica (id\_atencion\_medica, fecha\_consulta,   

`    		       `notas\_observacion\_, id\_paciente, id\_profesional, id\_tratamiento)

`    	   `VALUES (@id\_atencion\_medica, @fecha\_consulta, @notas\_observacion, 

`   	   	   `@id\_paciente, @id\_profesional, @id\_tratamiento);

`               `END;

4. **Verificación de Comportamiento**:
   1. El usuario **AdminMedico** puede realizar **INSERT** directamente en la tabla.

`   `-- Inserción permitida para el usuario AdminMedico

`   `INSERT INTO dbo.Atencion\_medica (id\_atencion\_medica, fecha\_consulta,    

`   `notas\_observacion\_, id\_paciente, id\_profesional, id\_tratamiento)

`   `VALUES (10, '2024-07-10', 'Control de seguimiento', 3, 3, 1);

1. El usuario **ConsultaMedica**, aunque no puede hacer un **INSERT** directo, puede llamar al procedimiento almacenado para realizar inserciones.

`   `--El usuario ConsultaMedica debe usar el procedimiento almacenado para    

`   `realizar inserciones

`   `EXEC dbo.sp\_InsertAtencionMedica 

`       `@id\_atencion\_medica = 7,  

`       `@fecha\_consulta = '2024-07-10', 

`       `@notas\_observacion = 'Revisión de seguimiento por dolor de rodilla', 

`       `@id\_paciente = 2,          -- ID de Maria Gomez

`       `@id\_profesional = 2,       -- ID de Maria Gonzalez

`       `@id\_tratamiento = 1;       -- Fisioterapia


- Previo a hacer los intentos de inserciones:
  ![imagen 1](https://github.com/SabriMontiel/sistema-citas-medicas/blob/master/imgs/IMAGEN%20FER%20(4).png)



- Inserción hecha con **AdminMedico** con el insert:

   ![imagen 2](https://github.com/SabriMontiel/sistema-citas-medicas/blob/master/imgs/IMAGEN%20FER%20(1).png)









- Inserción hecha con **ConsultaMedica** con el insert:
  ![imagen 3](https://github.com/SabriMontiel/sistema-citas-medicas/blob/master/imgs/IMAGEN%20FER%20(6).png)
  
- Inserción hecha con **ConsultaMedica** con el procedimiento almacenado:
  ![imagen 4](https://github.com/SabriMontiel/sistema-citas-medicas/blob/master/imgs/IMAGEN%20FER%20(7).png)








- Posterior a hacer los intentos de inserciones:
  ![imagen 5](https://github.com/SabriMontiel/sistema-citas-medicas/blob/master/imgs/IMAGEN%20FER%20(2).png)






5. **Creación de Roles**:
   1. Se crean usuarios adicionales y un rol (**LecturaDiagnostico**) que permite solo la lectura en la tabla **Diagnostico**.

`   `-- Crear usuario que tendrá permisos de lectura en la tabla Diagnostico

`   `CREATE LOGIN UsuarioConPermisoLectura WITH PASSWORD = 'Password123';

`   `CREATE USER UsuarioConPermisoLectura FOR LOGIN UsuarioConPermisoLectura;



`   `-- Crear usuario que no tendrá permisos en la tabla Diagnostico

`   `CREATE LOGIN UsuarioSinPermisoLectura WITH PASSWORD = 'Password123';

`   `CREATE USER UsuarioSinPermisoLectura FOR LOGIN UsuarioSinPermisoLectura;

`      `-- Crear el rol LecturaDiagnostico con permisos de solo lectura en la tabla         

`         `Diagnostico

`             `CREATE ROLE LecturaDiagnostico;

`             `GRANT SELECT ON dbo.Diagnostico TO LecturaDiagnostico;

1. Un usuario recibe permiso sobre este rol, lo que le permite ejecutar consultas **SELECT**, mientras que otro usuario, sin ese permiso, no puede acceder a la tabla.

`   `-- Asignar el rol LecturaDiagnostico a UsuarioConPermisoLectura

`   `ALTER ROLE LecturaDiagnostico ADD MEMBER UsuarioConPermisoLectura;


1. **Verificación de Comportamiento**:
   1. El usuario con el rol **LecturaDiagnostico** puede leer datos de la tabla, mientras que el usuario sin ese permiso recibe un error al intentar hacerlo.

`   `-- Consulta permitida para UsuarioConPermisoLectura sobre Diagnostico y no    

`   `permitida para UsuarioSinPermisoLectura (deberia fallar para    

`   `UsuarioSinPermisoLectura)

`   `SELECT \* FROM dbo.Diagnostico;

- Usuario con permiso:

![imagen 6](https://github.com/SabriMontiel/sistema-citas-medicas/blob/master/imgs/IMAGEN%20FER%20(3).png)




- ![imagen 7](https://github.com/SabriMontiel/sistema-citas-medicas/blob/master/imgs/IMAGEN%20FER%20(5).png)Usuario sin permiso:

###
### **Conclusiones**
- **Control de Acceso**: Permisos y roles proporcionan un control más preciso sobre las acciones que los usuarios pueden realizar en la base de datos.
- **Seguridad**: La gestión de permisos es esencial para proteger la información sensible.
- **Facilidad de Gestión**: Los roles simplifican la administración de permisos en entornos con múltiples usuarios.

