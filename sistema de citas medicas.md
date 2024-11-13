

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

# **Desarrollo TEMA 1 “Permisos a Nivel de Usuario”**

Los permisos a nivel de usuario son configuraciones en bases de datos que determinan qué acciones puede realizar cada usuario sobre los objetos de la base de datos, como por ejemplo tablas y procedimientos almacenados. Estos permisos son fundamentales para garantizar la seguridad y la integridad de los datos. Los usuarios pueden tener diferentes niveles de acceso según sus necesidades y roles en la organización.  
Sentencias para Manejar Permisos

**Las principales sentencias SQL para manejar permisos son:**

* GRANT: Para otorgar permisos a un usuario o rol.  
* REVOKE: Para quitar permisos previamente otorgados.  
* DENY: Para denegar explícitamente permisos, lo que prevalece sobre permisos otorgados.

**Tipos de Permisos Más Comunes**  
**Los permisos más comunes incluyen:**

* SELECT: Permite leer datos.  
* INSERT: Permite agregar nuevos registros.  
* UPDATE: Permite modificar registros existentes.  
* DELETE: Permite eliminar registros.  
* EXECUTE: Permite ejecutar procedimientos almacenados.

**Roles** 

Los roles son conjuntos de permisos que se pueden asignar a varios usuarios, facilitando la gestión de permisos. Algunos roles comunes son:

* db\_owner: Control total sobre la base de datos.  
* db\_datareader: Permite leer todas las tablas.  
* db\_datawriter: Permite modificar datos en las tablas.  
* db\_securityadmin: Permite gestionar permisos y roles.

**Para ver el desarrollo practico del tema ir a:** [Tema_1](https://github.com/SabriMontiel/sistema-citas-medicas/tree/master/Scrips/Tema%201_%20Manejo%20de%20permisos%20a%20nivel%20de%20usuarios%20de%20base%20de%20datos)

Desarrollo TEMA 2 “Procedimientos y funciones almacenadas”

Un procedimiento almacenado en SQL Server es un grupo de una o más instrucciones Transact-SQL, o una referencia a un método de lenguaje de ejecución común (CLR). Los procedimientos pueden:

* Aceptar parámetros de entrada y devolver múltiples valores en forma de parámetros de salida al programa que realiza la llamada.  
* Contener instrucciones de programación que realizan operaciones en la base de datos. Estas incluyen la llamada a otros procedimientos.  
* Devolver un valor de estado a un programa que realiza la llamada para indicar que la operación se realizó correctamente o falló (y el motivo de la falla).

Beneficios de utilizar procedimientos almacenados:

* Reducción del tráfico de red entre el servidor y el cliente.  
* Mayor seguridad, ya que controla qué procesos y actividades se realizan y protege los objetos de base de datos subyacentes. Cuando una aplicación llama a un procedimiento a través de la red, solo es visible la llamada para ejecutar el procedimiento. Por lo tanto, no  se puede ver los nombres de los objetos de la tabla y la base de datos, incrustar sus propias instrucciones Transact-SQL ni buscar datos críticos.  
* Reutilización de código: ya que se utiliza la encapsulación en procedimientos. Esto elimina las reescrituras innecesarias del mismo código, disminuye la inconsistencia del código y permite el acceso y la ejecución del código por parte de cualquier usuario o aplicación que posea los permisos necesarios.


Las funciones definidas por el usuario de SQL Server son rutinas que aceptan parámetros, realizan una acción, como un cálculo complejo, y devuelven el resultado de esa acción como un valor. El valor de retorno puede ser un único valor escalar o un conjunto de resultados.

De manera similar a los procedimientos almacenados, las funciones definidas por el usuario de Transact-SQL reducen el costo de compilación del código de Transact-SQL al almacenar en caché los planes y reutilizarlos para ejecuciones repetidas. Esto significa que no es necesario volver a analizar y optimizar la función definida por el usuario con cada uso, lo que da como resultado tiempos de ejecución mucho más rápidos.

Tipos de funciones:

* Las funciones escalares definidas por el usuario devuelve un único valor de datos del tipo definido en la cláusula RETURNS.  
* Las funciones con valores de tabla (TVF) devuelven un tipo de datos de tabla. En el caso de una función con valores de tabla en línea, no hay cuerpo de función; la tabla es el conjunto de resultados de una única instrucción SELECT.  
* Funciones del sistema: SQL Server proporciona muchas funciones del sistema que puede utilizar para realizar diversas operaciones. No se pueden modificar. 

Los errores de Transact-SQL que hacen que se cancele una instrucción y continúe con la siguiente instrucción en el módulo (como desencadenadores o procedimientos almacenados) se tratan de forma diferente dentro de una función. En las funciones, estos errores hacen que se detenga la ejecución de la función. Esto, a su vez, hace que se cancele la instrucción que invocó la función.

Las instrucciones de un bloque BEGIN...END no pueden tener efectos secundarios. Los efectos secundarios de la función son cualquier cambio permanente en el estado de un recurso que tiene un ámbito fuera de la función, como una modificación en una tabla de base de datos. Los únicos cambios que las instrucciones de la función pueden realizar son cambios en objetos locales de la función, como cursores o variables locales.

Comparación entre Procedimientos y funciones almacenadas:

| Características | Procedimientos almacenados | Funciones almacenadas |
| :---- | :---- | :---- |
| Devuelven valor | Opcional | Siempre (1 valor o tabla) |
| Modifican datos | Si | No |
| Llamadas desde SQL | Si | Si |
| Usables en SELECT | No | Si |

**Para ver el desarrollo practico del tema ir a:** [Tema_2](https://github.com/SabriMontiel/sistema-citas-medicas/tree/master/Scrips/Tema2_Procedimientos_f)

# **Desarrollo TEMA 3 “Optimizacion de consultas por indices”**

En las bases de datos, el rendimiento de las consultas y el tiempo de consulta de las mismas, es un factor muy importante para lo que sería la recuperación de la información. Estos tiempos de consulta y rendimiento antes mencionado irán creciendo conforme la magnitud de los datos sea mayor, y si no se tiene algún método de optimización estas consultas pueden llegar a tomar mucho tiempo. Una de las técnicas mas comunes y efectivas para mejorar el rendimiento en las consultas son los denominados índices. 

**Índices**

Un índice es una estructura auxiliar que lo que hace es mejorar la velocidad de las operaciones de consulta, ya que se reducen la cantidad de datos que la consulta misma debe revisar para poder encontrar los registros correspondientes. En palabras mas simples tienen la misma funcionalidad que el índice de un libro que permite ubicar una sección especifica sin necesidad de leer todas las paginas.

**Hay varios tipos de índices:**

**Índice agrupado:**
Este tipo de índice lo que hace es ordenar de forma física los datos en la tabla según la columna que se indexa. Solo una tabla puede contener un índice agrupado. Es buena para buscar rangos o intervalos de una columna en especifico.

**Índice no agrupado:**
En este tipo de indica se crea una estructura aparte para poder ordenar y buscar los datos, a diferencia del agrupado este no cambia el orden físico de los datos. Una tabla puede tener varios indices no agrupados.

**Índice único:**
Este índice no permite valores duplicados en una columna previamente indexada, el valor de la columna debe ser único, bastante similar al uso de claves primarias.

**Índice compuesto:**
Es un índice que utiliza dos o mas columnas de una misma tabla. Resulta especialmente útil cuando se consulta por 2 columnas a la vez.

**Índice columnar:**
Indice diseñado para manejar grandes cantidades de datos, este organiza los datos en columnas en lugar de filas lo que hace que sea mas rápido analizar datos específicos de muchas filas.

**En este trabajo solo se van a contemplar los agrupados y no agrupados.**

Tambien existen varios tipos de **búsqueda** como, **búsqueda exacta**, **por rango**, **por patron**, etc, pero en este trabajo solo se va a contemplar la búsqueda por **periodo**.

**Para ver el desarrollo practico del tema ir a:** [Tema_3](https://github.com/SabriMontiel/sistema-citas-medicas/tree/master/Scrips/Tema%203_Optimizacion_Consultas_Indice)


# **Desarrollo TEMA 4 “Índices Columnares”**

Los índices columnares permiten almacenar los datos por columnas, es decir, que primero se almacenaran uno tras otro los datos de la primer columna de todos los registros, luego se almacenara todos los datos de la segunda columna, y así sucesivamente hasta almacenar toda la información. Una vez llegado el momento de rescatar la información, primero se accederá al dato de la primer columna del primer registro, luego al dato de la primer columna del segundo registro, y así hasta leer todos los datos de la primer columna, tras lo cual se encontrara el dato de la segunda columna del primer registro, haciendo un proceso análogo hasta leer toda la información. Esta forma de almacenar y acceder a los datos puede disminuir considerablemente los tiempos de respuesta de un sistema si se implementa de manera correcta. 

En aquellos sistemas que se centran en consultas analíticas, que requieren de operaciones de agregación sobre un gran volumen de datos o un análisis de grandes cantidades de información, el uso sensato de indices reduce enormemente el tiempo de respuesta de las consultas.

Este trabajo esta centrado en el uso de indices columnares en SQL Server. Algunos motores de bases de datos también ofrecen esta funcionalidad, varios de ellos requieren de alguna extensión adicional y en otros no están implementados.

En SQL Server se los conoce como Columnstore Index. La sintaxis para la creacion de uno es la siguiente, sacado de un ejemplo de nuestro desarrollo practico:

CREATE COLUMNSTORE INDEX idx_columnstore_paciente
ON paciente_con_indice (email, id_sexo, fecha_nacimiento, id_localidad);

CREATE para crear un nuevo indice, luego COLUMNSTORE INDEX en caso de que creemos un indice columnar no agrupado(usa más espacio de almacenamiento, ya que el índice no reemplaza la tabla original) o CLUSTERED COLUMNSTORE INDEX en caso de crear un indice columnar agrupado(reemplaza la estructura de almacenamiento de la tabla, almacenando los datos en el indice utilizando ordenamiento por columna), seguido del nombre que queremos asignar al indice(en este caso comienza con idx_columnstore para seguir una convencion generalizada), para finalizar con ON nombre_de_la_tabla y entre parentesis las columnas de la tabla que queremos guardar en el indice.

Al ordenar los datos por columna, el poderoso algoritmo VertiPaq desarrollado por microsoft, permite comprimir enormemente la información, incrementando su beneficio de forma exponencial cuando trabajamos con enormes conjuntos de datos. De esta manera, ahorramos espacio de almacenamiento y los tiempos de respuesta ya se ven beneficiados debido a que es menor la información que debe ser rescatada de dispositivos de almacenamiento como por ejemplo un disco rígido cuyos cabezales deberán moverse menos.

Pero ademas, al traer la información ordenada por columna, si queremos realizar una operación de agregación, como SUM, AVG, o COUNT, la consulta se realizara rápidamente.


# CAPÍTULO V: CONCLUSIONES  

Con respecto a las conclusiones del [Tema_3](https://github.com/SabriMontiel/sistema-citas-medicas/tree/master/Scrips/Tema%203_Optimizacion_Consultas_Indice) Se pudo concluir que debido a que los índices agrupados, permiten organizar físicamente los datos en la tabla los tiempos de respuesta mejoran bastante a que si la tabla en cuestión, no tiene índices. La desventaja de utilizar índices agrupados es que solo se puede tener un solo índice agrupado por tabla. También se concluyó que utilizar índices agrupado con mas de una columna  generan casi el mismo tiempo de respuesta, ya que justamente depende de la consulta en cuestión y además en este caso como estamos consultando por fecha_nacimiento de nuevo entonces los tiempos no van a variar mucho.

Respecto a las conclusiones del [Tema_4](https://github.com/SabriMontiel/sistema-citas-medicas/tree/master/Scrips/tema_4_Indices_Columnares). En nuestro sistema utilizamos indices columnares no agrupados, ya que las consultas analíticas no son más importantes que las consultas transaccionales, y ciertas operaciones, como leer los datos de un paciente en especifico, son más eficientes cuando almacenamos la información por fila. Por algo el almacenamiento por fila es el estándar en las bases de datos relacionales. Por ello debemos ser cuidadosos a la hora de utilizar indices columnares agrupados ya que la modificación en la forma de almacenamiento de los datos puede ayudarnos a ahorrar espacio en disco y optimizar las consultas analíticas, pero entregando a cambio velocidad de respuesta en las consultas transaccionales, lo cual puede ser trágico en un sistema orientado a transacciones.

El sistema de gestión de citas médicas cumplió con los objetivos planteados, permitiendo la organización de citas, el almacenamiento seguro de la información de los pacientes y médicos, y el seguimiento de diagnósticos y tratamientos. La implementación del sistema permite mejorar la eficiencia en la gestión de las citas médicas, reduciendo los solapamientos y mejorando la organización de la información médica, lo que impacta directamente en la calidad de atención.

Algunos de los desafíos encontrados incluyeron la gestión de la integridad referencial y la validación de datos para evitar errores de ingreso, los cuales fueron abordados mediante restricciones en el DBMS.

El sistema tiene un alto potencial de expansión, permitiendo en el futuro agregar funcionalidades como un historial médico completo y la integración con sistemas de telemedicina.


# CAPÍTULO VI: BIBLIOGRAFÍA. 

1. Camuña Rodríguez, J. F. (2015). Lenguajes de definición y modificación de datos SQL (UF1472). Antequera, Málaga, Spain: IC Editorial.  
2. Pulido Romero, E. Escobar Domínguez, Ó. y Núñez Pérez, J. Á. (2019). Base de datos. Ciudad de México, Grupo Editorial Patria.  
3. Artículos académicos, manuales de MySQL, páginas web, entre otros.  
4. Articles from Revista Panamericana de Salud Pública are provided here courtesy of Pan American Health Organization.
5. Microsoft(2024, 23 octubre). *CREATE COLUMNSTORE INDEX (Transact-SQL) - SQL Server*. Microsoft Learn. <https://learn.microsoft.com/es-es/sql/t-sql/statements/create-columnstore-index-transact-sql?view=sql-server-ver16>
6. Mehrez, B. (2023, 1 julio). *How to Use SQL Server as a Columnar Datastore*. https://www.linkedin.com/pulse/how-use-sql-server-columnar-datastore-baligh-mehrez
7.User-defined functions:[https://learn.microsoft.com/en-us/sql/relational-databases/stored-procedures/stored-procedures-database-engine?view=sql-server-ver16](https://learn.microsoft.com/en-us/sql/relational-databases/stored-procedures/stored-procedures-database-engine?view=sql-server-ver16)
8.Stored procedures (Database Engine):[https://learn.microsoft.com/en-us/sql/relational-databases/stored-procedures/stored-procedures-database-engine?view=sql-server-ver16](https://learn.microsoft.com/en-us/sql/relational-databases/stored-procedures/stored-procedures-database-engine?view=sql-server-ver16) 

