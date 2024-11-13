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

- **db_owner**: Control total sobre la base de datos.
- **db_datareader**: Permite leer todas las tablas.
- **db_datawriter**: Permite modificar datos en las tablas.
- **db_securityadmin**: Permite gestionar permisos y roles.

###
###
###
### **Aplicación Específica en los Requisitos del trabajo** 
1. **Creación de Usuarios**:
   1. Se crean dos usuarios en la base de datos: un usuario con permisos de administrador (**AdminMedico**) y otro con permisos de solo lectura (**ConsultaMedica**).

       ```sql
           -- Creacion del usuario con permisos de administrador

           CREATE LOGIN AdminMedico WITH PASSWORD = 'AdminPassword123';

           CREATE USER AdminMedico FOR LOGIN AdminMedico;

           -- Creacion del usuario con permisos de solo lectura y ejecucion

           CREATE LOGIN ConsultaMedica WITH PASSWORD = 'ConsultaPassword123';

           CREATE USER ConsultaMedica FOR LOGIN ConsultaMedica;
       ```

1. **Asignación de Permisos**:
   1. Al usuario **AdminMedico** se le otorgan permisos de administrador, como **db_owner**.

   
       ```sql
           ALTER ROLE db_owner ADD MEMBER AdminMedico;
       ```

   1. Al usuario **ConsultaMedica** se le otorgan permisos de solo lectura sobre la tabla **Atencion_medica** y permisos de ejecución sobre el procedimiento almacenado **sp_InsertAtencionMedica**.

       ```sql
           -- Permiso de lectura en la tabla Atencion_medica

           GRANT SELECT ON dbo.Atencion_medica TO ConsultaMedica;

           -- Permiso de ejecucion en el procedimiento almacenado sp_InsertAtencionMedica

           GRANT EXECUTE ON dbo.sp_InsertAtencionMedica TO ConsultaMedica;
       ```

1. **Uso de Procedimientos Almacenados**:
   1. Se crea un procedimiento almacenado (**sp_InsertAtencionMedica**) que permite insertar datos en la tabla **Atencion_medica**.
   1. El usuario **ConsultaMedica**, a pesar de tener solo permisos de lectura, puede ejecutar este procedimiento para insertar datos.


```sql
     -- Creación del procedimiento almacenado para insertar atención médica

     CREATE PROCEDURE sp_InsertAtencionMedica

         @id_atencion_medica INT,

         @fecha_consulta DATE,

         @notas_observacion VARCHAR(250),

         @id_paciente INT,

         @id_profesional INT,

         @id_tratamiento INT

     AS

     BEGIN

         INSERT INTO dbo.Atencion_medica (id_atencion_medica, fecha_consulta,   

     		        notas_observacion_, id_paciente, id_profesional, id_tratamiento)

     	    VALUES (@id_atencion_medica, @fecha_consulta, @notas_observacion, 

    	   	    @id_paciente, @id_profesional, @id_tratamiento);

                 END;
```

4. **Verificación de Comportamiento**:
   1. El usuario **AdminMedico** puede realizar **INSERT** directamente en la tabla.

``` sql
     -- Inserción permitida para el usuario AdminMedico

     INSERT INTO dbo.Atencion_medica (id_atencion_medica, fecha_consulta,    

     notas_observacion_, id_paciente, id_profesional, id_tratamiento)

     VALUES (10, '2024-07-10', 'Control de seguimiento', 3, 3, 1);
```

    1. El usuario **ConsultaMedica**, aunque no puede hacer un **INSERT** directo, puede llamar al 
   procedimiento almacenado para realizar inserciones.

``` sql
     --El usuario ConsultaMedica debe usar el procedimiento almacenado para realizar inserciones

     EXEC dbo.sp_InsertAtencionMedica 

         @id_atencion_medica = 7,  

         @fecha_consulta = '2024-07-10', 

         @notas_observacion = 'Revisión de seguimiento por dolor de rodilla', 

         @id_paciente = 2,          -- ID de Maria Gomez

         @id_profesional = 2,       -- ID de Maria Gonzalez

         @id_tratamiento = 1;       -- Fisioterapia
```


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

```sql
     -- Crear usuario que tendrá permisos de lectura en la tabla Diagnostico

     CREATE LOGIN UsuarioConPermisoLectura WITH PASSWORD = 'Password123';

     CREATE USER UsuarioConPermisoLectura FOR LOGIN UsuarioConPermisoLectura;



     -- Crear usuario que no tendrá permisos en la tabla Diagnostico

     CREATE LOGIN UsuarioSinPermisoLectura WITH PASSWORD = 'Password123';

     CREATE USER UsuarioSinPermisoLectura FOR LOGIN UsuarioSinPermisoLectura;

     -- Crear el rol LecturaDiagnostico con permisos de solo lectura en la tabla Diagnostico

     CREATE ROLE LecturaDiagnostico;

     GRANT SELECT ON dbo.Diagnostico TO LecturaDiagnostico;
```

1. Un usuario recibe permiso sobre este rol, lo que le permite ejecutar consultas **SELECT**, mientras que otro usuario, sin ese permiso, no puede acceder a la tabla.

```sql
     -- Asignar el rol LecturaDiagnostico a UsuarioConPermisoLectura

     ALTER ROLE LecturaDiagnostico ADD MEMBER UsuarioConPermisoLectura;
```

1. **Verificación de Comportamiento**:
   1. El usuario con el rol **LecturaDiagnostico** puede leer datos de la tabla, mientras que el usuario sin ese permiso recibe un error al intentar hacerlo.

```sql
     -- Consulta permitida para UsuarioConPermisoLectura sobre Diagnostico y no permitida para UsuarioSinPermisoLectura (deberia fallar para UsuarioSinPermisoLectura)

     SELECT * FROM dbo.Diagnostico;
```

- Usuario con permiso:

![imagen 6](https://github.com/SabriMontiel/sistema-citas-medicas/blob/master/imgs/IMAGEN%20FER%20(3).png)




- Usuario sin permiso:

![imagen 7](https://github.com/SabriMontiel/sistema-citas-medicas/blob/master/imgs/IMAGEN%20FER%20(5).png)

###
### **Conclusiones**
- **Control de Acceso**: Permisos y roles proporcionan un control más preciso sobre las acciones que los usuarios pueden realizar en la base de datos.
- **Seguridad**: La gestión de permisos es esencial para proteger la información sensible.
- **Facilidad de Gestión**: Los roles simplifican la administración de permisos en entornos con múltiples usuarios.

