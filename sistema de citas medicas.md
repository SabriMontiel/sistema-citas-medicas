

**Universidad Nacional del Nordeste** 

   
 

**Facultad de Ciencias Exactas y Naturales y Agrimensura** 

 

**Carrera:** Licenciatura en Sistemas de Información 

**Título:** Sistema de citas

**Cátedra:** Bases de datos 1  
**Año:** 2024   
**Docentes:** Dario O. VILLEGAS

**Comisión 2, Grupo 8**

**Alumnos:**  
 

| Nombre  | N° de Legajo  |
| :---: | ----- |
| Sabrina Guadalupe Montiel  | 50180 |
| Fernando Gabriel Romero  |         53948 |
| Nahuel Nicolas Romero Cristanchi  | 57907 |
| Lucas Daniel Scherf  | 55432 |

 

ÍNDICE

# 

[CAPÍTULO I: INTRODUCCIÓN	3](#capítulo-i:-introducción)

[CAPÍTULO II: MARCO CONCEPTUAL O REFERENCIAL	4](#capítulo-ii:-marco-conceptual-o-referencial)

[CAPÍTULO III: METODOLOGÍA SEGUIDA	4](#capítulo-iii:-metodología-seguida)

[CAPÍTULO IV: DESARROLLO DEL TEMA / PRESENTACIÓN DE RESULTADOS	5](#capítulo-iv:-desarrollo-del-tema-/-presentación-de-resultados)

[CAPÍTULO V: CONCLUSIONES](#capítulo-v:-conclusiones)	9

[CAPÍTULO VI: BIBLIOGRAFÍA.](#capítulo-vi:-bibliografía.)	9

# 

# CAPÍTULO I: INTRODUCCIÓN   

Objetivos del Proyecto

El proyecto tiene como objetivo principal desarrollar e implementar un sistema simple y eficiente para gestionar citas médicas. Este sistema permitirá registrar pacientes, médicos, diagnósticos y tratamientos, garantizando que todo esté bien organizado y sea fácil de usar. Algunos de los objetivos clave son:

1\. Organizar citas médicas: El sistema permitirá agendar citas entre pacientes y médicos, asegurándose de que no haya errores de horarios o fechas duplicadas.

2\. Registrar información de pacientes y médicos: Se podrá guardar y actualizar los datos de los pacientes y médicos, como nombre, contacto, y obra social, asegurando que todo esté correctamente relacionado.

3\. Seguir diagnósticos y tratamientos: Cada cita médica podrá incluir un diagnóstico y un tratamiento, permitiendo hacer un seguimiento del progreso del paciente.

4\. Mantener relaciones claras entre datos: El sistema organizará los datos para que las conexiones entre pacientes, médicos, citas, diagnósticos y tratamientos sean claras y fáciles de manejar. 

5\. Posibilidades de crecimiento: Aunque el sistema empieza con lo básico, podrá ampliarse en el futuro para incluir historiales médicos más detallados y gestión de prescripciones.

 Alcance del Proyecto

El alcance de este proyecto se enfoca en cubrir las funciones esenciales para la gestión de citas médicas, manteniendo la simplicidad y dejando espacio para mejorar en el futuro:

1\. Gestión básica de datos: Se podrán crear, actualizar y eliminar pacientes y médicos, con la opción de asignar médicos a pacientes.

2\. Manejo de citas: El sistema permitirá agendar citas, validando la disponibilidad de los médicos para evitar solapamientos (dos o más citas se programan para el mismo médico en el mismo horario).

3\. Registro de diagnósticos y tratamientos: Cada consulta incluirá un diagnóstico y un tratamiento, facilitando el seguimiento del estado de los pacientes.

4\. Seguridad de los datos: Se aplicarán reglas simples para asegurar que los datos estén bien organizados y relacionados correctamente (reglas como  **integridad referencial**, **restricciones de unicidad**, **validaciones de datos**, **cifrado de datos sensibles**).

* **Integridad Referencial**: Asegurar que las relaciones entre tablas sean válidas.  
* **Restricciones de Unicidad**: Evitar la duplicación de datos.  
* **Validaciones de Datos**: Comprobar que la entrada de datos cumpla con formatos específicos.  
* **Cifrado de Datos Sensibles**: Proteger información personal y de salud mediante cifrado.

5\. Posibilidad de expansión: Aunque se empieza con lo básico, el sistema puede evolucionar para incluir historiales médicos completos y otras funcionalidades útiles en el futuro.

Este proyecto está pensado para ser útil en centros de salud, ayudando a organizar mejor las citas y el seguimiento de los pacientes, y facilitando el trabajo tanto de los médicos como del personal administrativo.

# CAPÍTULO II: MARCO CONCEPTUAL O REFERENCIAL 

En las últimas décadas, el sector salud ha experimentado profundas transformaciones debido al desarrollo de nuevas tecnologías. Las Tecnologías de la Información y la Comunicación (TICs) han revolucionado la manera en que los pacientes interactúan con los servicios de salud, facilitando la digitalización de procesos administrativos y asistenciales. Un ejemplo claro de estas innovaciones es la implementación de sistemas de gestión de citas médicas, los cuales permiten a los pacientes programar y gestionar sus consultas de manera eficiente, sin la necesidad de largas esperas o trámites presenciales.

La digitalización de estos procesos no solo mejora la eficiencia operativa de los centros de salud, sino que también promueve una atención más centrada en el paciente, al ofrecer mayor accesibilidad y comodidad.

# CAPÍTULO III: METODOLOGÍA SEGUIDA 

a. Descripción de cómo se realizó el Trabajo Práctico

El proyecto se desarrolló siguiendo una metodología incremental, comenzando con la planificación del diseño de la base de datos y luego implementando las funcionalidades del sistema de gestión de citas médicas. Los principales pasos fueron:

* Análisis de Requerimientos: Se identificaron las necesidades clave del sistema, como la gestión de pacientes, médicos, citas, diagnósticos y tratamientos.  
* Modelado de la Base de Datos: Se creó un modelo entidad-relación que refleja las relaciones entre las tablas principales: pacientes, médicos, citas, diagnósticos, y tratamientos.  
* Desarrollo del Sistema: Se implementó el sistema en una base de datos relacional, utilizando consultas SQL para gestionar las inserciones, actualizaciones y consultas de datos.  
* Pruebas del Sistema: Se realizaron pruebas para verificar la integridad de los datos, la funcionalidad del sistema y la validación de las reglas de negocio, como evitar solapamientos en las citas.

b. Herramientas (Instrumentos y procedimientos)

El trabajo se realizó utilizando las siguientes herramientas y procedimientos:

1. Se utilizó MySQL como el sistema gestor de bases de datos relacional, seleccionado por su robustez y facilidad de uso.  
2. Se empleó Azure Data Studio y  Microsoft SQL Server para el desarrollo y escritura de las consultas SQL.  
3. Mediante el ERDplus elaboramos un diagrama en el modelo relacional  a partir de especificaciones de los requerimientos que fueron surgiendo al plantear el problema en cuestión.   
4. Se utilizó GitHub como plataforma de control de versiones y colaboración en equipo. GitHub permitió a los miembros del grupo compartir, revisar y fusionar sus partes del trabajo de manera eficiente.

# CAPÍTULO IV: DESARROLLO DEL TEMA / PRESENTACIÓN DE RESULTADOS 

Como se mencionó en el capítulo anterior, lo primero que decidimos implementar fue el diagrama en el modelo relacional a partir de especificaciones de requerimientos que fueron surgiendo a medida que investigamos las problemáticas que tienen los pacientes a la hora de tener que pedir citas médicas. Este fue el resultado del mismo:

![imagen1](https://github.com/SabriMontiel/sistema-citas-medicas/blob/master/doc/citas_medicas_DER.png)

**Desarrollo del Sistema**

El **Sistema de Gestión de Citas Médicas** fue desarrollado utilizando el entorno de **SQL Server**, con el objetivo de ofrecer una solución eficiente para la administración de datos médicos. A continuación, se describen las principales etapas del desarrollo:

**Modelado de la Base de Datos:**

Se llevó a cabo un diagrama entidad-relación para definir las entidades clave del sistema, tales como: **Pacientes**, **Profesionales Médicos**, **Citas Médicas**, **Diagnósticos**, **Tratamientos**, **Localidades**, **Obras Sociales** y **Sexo**. En este diagrama se establecieron las relaciones entre las distintas entidades, asegurando que los pacientes pudieran ser asignados a citas y profesionales médicos a diagnósticos. Se implementaron las claves primarias (PK) y foráneas (FK) necesarias para mantener la integridad referencial en los datos.

**Creación de las Tablas en SQL Server:**

Cada entidad se tradujo a una tabla en SQL Server, incorporando las restricciones necesarias como claves primarias y foráneas. Se establecieron validaciones de campos obligatorios, por ejemplo, el DNI único para los pacientes y la licencia médica para los profesionales. Además, se implementaron restricciones para validar las citas, garantizando que no haya solapamientos de horario para el mismo profesional o paciente.

**Inserción de Datos:**

Durante la fase de implementación, se centró exclusivamente en las operaciones de inserción de datos. Se registraron datos para pacientes, profesionales, citas médicas, diagnósticos y tratamientos. No se llevaron a cabo operaciones de actualización o eliminación, ya que el enfoque principal del proyecto fue crear un sistema que almacene correctamente la información médica y las citas.

**Carga de Datos de Prueba:**

Para verificar el correcto funcionamiento de las inserciones y las relaciones entre las entidades, se realizó una carga de datos de prueba. Se ingresaron registros representativos de pacientes, profesionales médicos, citas, diagnósticos y tratamientos, asegurando que los datos se vinculan adecuadamente entre las tablas.

**PRESENTACIÓN DE RESULTADOS:**

Los principales resultados del desarrollo fueron los siguientes:

![imagen1](https://github.com/SabriMontiel/sistema-citas-medicas/blob/master/imgs/WhatsApp%20Image%202024-10-02%20at%2022.09.44.jpeg)

![imagen2](https://github.com/SabriMontiel/sistema-citas-medicas/blob/master/imgs/WhatsApp%20Image%202024-10-02%20at%2022.10.15.jpeg)
![imagen3](https://github.com/SabriMontiel/sistema-citas-medicas/blob/master/imgs/WhatsApp%20Image%202024-10-02%20at%2022.10.52.jpeg)

![imagen4](https://github.com/SabriMontiel/sistema-citas-medicas/blob/master/imgs/WhatsApp%20Image%202024-10-02%20at%2022.11.15.jpeg)

Desarrollo TEMA 1 “Permisos a Nivel de Usuario”

Los permisos a nivel de usuario son configuraciones en bases de datos que determinan qué acciones puede realizar cada usuario sobre los objetos de la base de datos, como por ejemplo tablas y procedimientos almacenados. Estos permisos son fundamentales para garantizar la seguridad y la integridad de los datos. Los usuarios pueden tener diferentes niveles de acceso según sus necesidades y roles en la organización.  
Sentencias para Manejar Permisos

Las principales sentencias SQL para manejar permisos son:

* GRANT: Para otorgar permisos a un usuario o rol.  
* REVOKE: Para quitar permisos previamente otorgados.  
* DENY: Para denegar explícitamente permisos, lo que prevalece sobre permisos otorgados.

Tipos de Permisos Más Comunes  
Los permisos más comunes incluyen:

* SELECT: Permite leer datos.  
* INSERT: Permite agregar nuevos registros.  
* UPDATE: Permite modificar registros existentes.  
* DELETE: Permite eliminar registros.  
* EXECUTE: Permite ejecutar procedimientos almacenados.

Roles  
Los roles son conjuntos de permisos que se pueden asignar a varios usuarios, facilitando la gestión de permisos. Algunos roles comunes son:

* db\_owner: Control total sobre la base de datos.  
* db\_datareader: Permite leer todas las tablas.  
* db\_datawriter: Permite modificar datos en las tablas.  
* db\_securityadmin: Permite gestionar permisos y roles.

Para ver el desarrollo practico del tema ir a: [Tema_1](https://github.com/SabriMontiel/sistema-citas-medicas/blob/master/Scrips/Manejo%20de%20permisos%20y%20roles%20.sql)



# CAPÍTULO V: CONCLUSIONES  

El sistema de gestión de citas médicas cumplió con los objetivos planteados, permitiendo la organización de citas, el almacenamiento seguro de la información de los pacientes y médicos, y el seguimiento de diagnósticos y tratamientos. La implementación del sistema permite mejorar la eficiencia en la gestión de las citas médicas, reduciendo los solapamientos y mejorando la organización de la información médica, lo que impacta directamente en la calidad de atención.

Algunos de los desafíos encontrados incluyeron la gestión de la integridad referencial y la validación de datos para evitar errores de ingreso, los cuales fueron abordados mediante restricciones en el DBMS.

El sistema tiene un alto potencial de expansión, permitiendo en el futuro agregar funcionalidades como un historial médico completo y la integración con sistemas de telemedicina.

# CAPÍTULO VI: BIBLIOGRAFÍA. 

1. Camuña Rodríguez, J. F. (2015). Lenguajes de definición y modificación de datos SQL (UF1472). Antequera, Málaga, Spain: IC Editorial.  
2. Pulido Romero, E. Escobar Domínguez, Ó. y Núñez Pérez, J. Á. (2019). Base de datos. Ciudad de México, Grupo Editorial Patria.  
3. Artículos académicos, manuales de MySQL, páginas web, entre otros.  
4. Articles from Revista Panamericana de Salud Pública are provided here courtesy of Pan American Health Organization.

