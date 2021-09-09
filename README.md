# Taller1_BD

De cuardo al taller propuesto, se nos indica crear un modelo  en el cual hay que tener encuentas las tablas como Veterinaria,Mascotas, propietari y funcionario alcaldía, en el cual se crea un modelo relacional teniendo en cuentas cada uno de los requerimientos propuestos.

Integrantes:

1)Juan Pablo Muñoz Buitrago
2) Moises Daniel  Salcedo Ramos
3) Jieson Jair Jossa
4) Raul T  Gonzalez Arrieta

Se trabajo con la herramienta PostgreSQL   Versión 13.




a. ¿Las vistas que decide crear a qué requerimiento no funcional obedecen?
Seguridad o facilidad de consulta. ¿Deberían ser vistas materializadas?
Argumente. Realice los supuestos que considere necesarios.
* La primera vista creada trae la información de el funcionario que acepto la solicitud de registro de la veterinaria y muestra la asociasión de veterinaria con funcionario. La segunda vista hace referencia a las visitas que ha tenido una mascota por veterinaria, brindando información de la mascota, su propietario y el nombre de la veterinaria visitada.
* Las vistas no necesitan ser materilaizadas ya que no estamos hablando de un datawarehouse y la información se puede filtrar con facilidad de acuerdo a la cantidad de registros que potencialmente podrían existir.


b. ¿Cuáles consultas a la base de datos, a partir de los requerimientos
dados, pueden optimizarse mediante índices? ¿De qué tipos deben ser
dichos índices? Argumente. Realice los supuestos que considere
necesarios.
* Si unimos los índices y las vistas vamos a lograr mucha más agilidad a la hora de realizar las consultas. Esto porque creamos índices en tablas como mascota y propietario, filtrando por ID de cada registro, y las consultas realizadas en las vistas previamente descritas tienen su base en estas columnas de cada tabla.
