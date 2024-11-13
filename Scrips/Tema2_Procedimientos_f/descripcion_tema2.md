Creación de procedimientos Almacenados.

Como dice el enunciado, se crearon tres procedimientos almacenados que permitan: 

Insertar, Modificar y borrar registros de alguna de las tablas del proyecto. Cómo trabajamos en conjunto con mis compañeros, decidimos realizar estos procedimientos sobre la tabla Atencion\_medica para luego darles los permisos correspondientes a los diferentes usuarios.

El primer procedimiento almacenado creado fue para insertar una nueva atención médica, luego para insertar usando el  procedimiento sp\_InsertAtencionMedica, el usuario ConsultaMedica debe usar el procedimiento almacenado para realizar inserciones.

Luego creamos un procedimiento para actualizar sp\_ModificarAtencionMedica. En donde se actualizará: fecha de consulta y notas observación. Para más tarde ejecutarla mediante 

EXEC dbo.sp\_ModificarAtencionMedica.

Para finalizar con el tercer procedimiento de eliminación de registros, lo borramos usando el procedimiento sp\_DeletePaciente, se debería eliminar la atención médica 7

EXEC sp\_EliminarAtencionMedica @id\_atencion\_medica \= 7;

Por último verificamos que se realizaron correctamente los procedimientos, tanto las inserciones como las modificaciones y las eliminaciones con un:

SELECT \*  from Atencion\_medica;

Creación de Funciones.

Se crearon 3 funciones esenciales para el sistema en el que estamos trabajando ya que nos ahorra a la hora de buscar información importante como lo son el calcular la edad de un paciente, obtener el nombre completo y obtener la obra social de un paciente específico.

En la siguiente imagen se puede observar la utilización de todas las funciones en una sola consulta, facilitando así la obtención de estos datos.

![imagen1](https://github.com/SabriMontiel/sistema-citas-medicas/blob/master/imgs/Screenshot%202024-11-12%20at%2023.27.08.png)
