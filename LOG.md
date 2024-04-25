## Log

- Cambio README
- Creo la nueva Branch
- Creo un archivo .ps1 para poder correr todo desde PowerShell
- Hago un commit a main sin querer con el .ps1 y un cambio a el footer de la página
- Creo todos los Tests de aceptación 1 por 1
- Veo los videos 1 y otra y otra vez hasta encontrar donde puedo empezar a tocar el código.
- Creo un test en job_offer para agregar la variable de instancia required_experience a JobOffer
- Hago pasar el test agregando este nuevo campo a JobOffer
- Creo un test en job_offer_repository para agregar a la base de datos este nuevo campo
- Creo el migration para actualizar la base de datos con esta nueva columna
- Corro el comando para que se ejecuten los migrations
- Intento levantar postgres con DBeaver y luego de 1h de intentar desisto a la idea de poder ver la base de datos con un gestor
- Intento hacer pruebas de la interfaz de usuario con Padrino. Como no funciona y la docu de Padrino me hacia querer sacarme los ojos, luego de mucho tiempo perdido desisto de hacer esto tambien 
- Cambio la interfaz web para que refleje la posibilidad de crear y visualizar un Job Offer con Required Experience
- Pruebo localmente desde el navegador web que ande esta funcionalidad
- Con todo esto andando empiezo a automatizar el feature de gherkin
- Pasa gherkin, pusheo
- Desactive el largo de una linea de momento hasta ver si me deja hacerlo NicoPaez
- Llevo 7h de trabajo :D no sali de la compu en todo el dia. Felices Pascuas
- Pasa el segundo test de aceptación, lo único que se necesito fue agregar a la lista de empleos activados la columna require experience. Hago el mapeo de cucumber a ruby también para verificar qeu el test pase. Además también lo hago pasar en el navegador local de mi compu
- Cambio un test en job offer repository ya que tiene mas sentido probar el caso en el que el required experience se conserva. Antes probaba el caso en el que cambia a "Not specified"
- Creo un test para este otro caso en el que inicializo un JobOffer con un required experience nil
- Creo un test para checkear que mi base de datos tambien guarda el valor correctamente. Por la manera en la que se intercomunican lo objetos del modelo, este test pasa de una. Sin embargo, es importante probar que se persisten los dato correctamente en la base de datos
- Luego de este commit voy a tener que hacer un refactor grande de todo esto, por que no me gusta nada como quedo modelado. Siento que no representa el negocio
- Los comentarios de arriba son del commit anterior, no habia guardado bien
- Creo un objeto required_experience que tenga la responsabilidad de operar con este dato del negocio
- Cambio varios tests unitarios viejos ya que este es un refactor bastante grande que afecta a muchas partes del codigo. Además, pongo en pending 11 tests para poder hacer el push, seguir documentando mi progreso y que no me rompa el pipeline
- Llevo 9h de trabajo
- Creo un unit test para Required Experience para el caso presentado en un test viejo de Job Offer. Lo hago pasar, y por lo tanto, hago pasar el test viejo
- Descomento el primer tesst de job_offer_repository_spec, me fijo por que falla y lo hago pasar. Como un buen programador que usa TDD
- Hago que pase este test cambiando lo que guardo en la base de datos. Con este cambio deberian pasar los demas tests comentados posiblemte
- Se volvio a romper la base de datos. No puedo cambiar el tipo de dato de la columna de Requisq:migrate:upred Experience tampoco. Voy a hacer un rollback de lo commits por que esta todo roto 
=======================================================================================
- Empiezo de 0
- Escribo todos los acceptance tests
- Borro el container para hacer el sq:migrate:up desde 0
- LLevo 12h30m
- Automatizo la primera prueba de aceptacions
- Creo unit test para agregar el nuevo dato al modelo
- Mi modelo ahora tiene required_experience como campo
- Creo nuevo test para agregar la columna de Required Experience a la base de datos. Agrego el migrate 009, esta vez la columna si va a ser un Integer. Además agrego Required Experience al ChangeSet del Job Offers Repository
- Con esto hago pasar la prueba, tengo la migración hecha y ya puedo persistir un Job Offer con Required Experience
- Ahora con todo esto hecho, toco un poco la interfaz de la web para hacer pasar el Aceptance Test de Gherkin/Cucumber
- Para hacer pasar el gherkin, agrego en un helper una conversion de '' a nil para evitar errores en la base de datos
- Hago pasar siguiente test de aceptacion, ahora tanto los usuarios como los empleados pueden ver el Required Experience en sus respectivas vistas
- Dejo automatizado y fallando el siguiente test de aceptación
- Empiezo a implementar la funcionalidad de no especificar Required Experience.
- Creo un test unitario que pasa. Pero sirve para definir el comportamiento del Job Offer con respecto a un dato de entrada nil.
- Hago pasar el siguiente test de aceptacion. Ahora el employer puede ver Not specified si es que le pasa un empty Required Experience a la hora de crear el Job Offer
- Lo mismo para el siguiente Test de aceptacion. Ahora el usuario puede ver Not specified tambien
- Hago un refactor con un partial para evitar codigo repetido en las views
- No me gusta el nombre, por ahi lo cambio despues
- Otro aceptance test pasando. Si la Required Experience es 0, entonces mostrar Not specified
- El siguiente acceptance test tambien va a pasar de una seguramente, por el refactor de _required_experience_formatting.erb
- De cualquier forma, es importante que este test quede para que yo pueda seguir haciendo cambios en el futuro sin cambiar el behavior del programa cuando le ingreso 0 a Required Experience
- Cambio 2 acceptance tests. El primer test no era lo suficientemente descriptivo. El segundo probaba lo mismo que el primero por que me faltaba 1 parametro. Ahora si estan probando lo que deberian estar probando 
- Automatizo la siguiente prueba de aceptacion. Esta prueba me va a ayudar a desarrollar que luego de darle al edit, me recupere el campo Required Experience
- Creo una prueba para el JobOfferForm. De esta forma me aseguro de que este siempre deba contener id, title, location, description y required_experience. Si en algún momento tengo que agregar algo mas, debo tocar la prueba. De esa forma hago TDD para agregar funcionalidad
- Me falto agregar para la prueba tuve que crear un Job Offer con un ID valido, para eso tengo que persistirlo
- Hago un refactor del primer test unitario que cree del tipo describe model. Me aseguro de que el Job Offer deba tener esos campos. De esta manera evito borrarlos sin querer en un refactor futuro
- Pasa el test de aceptacion. Ahora ya no esta el bug de update
- Automatizo el siguiente test de aceptacion
- Pasa de 1 ya que el luego del fill_in se crea el Job Offer directamente como en las pruebas anteriores. Los siguientes 2 tests tambien van a pasar de 1 seguramente 
- Claramente estos test pasaron por que al final del dia el sistema de guardado de un Edit es el mismo que el de creacion de un Job Offer. Por lo tanto, todos los casos andan bien. Importante que queden los tests para evitar que un refactor cambie el behavior propuesto por estos acceptance test
- Intento hacer que a pesar de un error se guarden los campos que estan bien. No puedo, desisto
- Cambio un step de la catedra para que pase un gherkin/cucumber que no pasaba de base por ambiguedad. Ahora pasa correctamente
- Luego de atomatizar el acceptance test siguiente, hago un test unitario para probar que no se le puedan pasar strings a un Required Experience de Job Offer
- Hago que pase el test sin que falle el resto permitiendo que se le puedan pasar nil
- Cabe aclarar que se modifico la caja de input de la pagina web para que no deje enviar strings tambien
- Se cambia un poco el test de Gherkin/Cucumber para que tenga bien el mensaje de error y pase
- El siguiente test de Gherkin ya esta automatizado
- Creo un test unitario para evitar que se cree un Job Offer con numero negativos
- Hago que pase con mas validates. Con esto pasa el Acceptance test tambien
- El siguiente acceptance test y de momento el ultimo ya esta automatizado tambien
- Luego de hacer pasar esto se viene un gran refactor. Pero todas las funcionalidades estan implementadas!
- Creo un nuevo unit test para probar que el Job Offer no se cree con un float. Hago pasar el test y pusheo
- Con este unit test y la automatizacion del aceptance test ya pasan todos los tests que definen el behavior del programa!
- Se viene el refactor
- Llevo 16h30
=========================================================
### Refactor
- Saco numeros magicos y los pongo como cte en job_offers_helper y job_offer(el 0). Tengo que ver los nombres todavia
- Cambio el archivo de partial table para las views de My Offers y Job Offers. Ahora no tiene la condicion del if ahi, sino que pregunta a un metodo de la clase JobOffer
- Cambio el texto de error del Required Experience que tira el validates para que sea mas descriptivo
- Hay un bug de base del ejercicio en edit, si falla el edit 1 vez, la segunda Padrino rompe si o si. Tiene que ver con la implementacion del :update del JobOfferController. Intente cambiarlo, pero no logre entender del todo como funciona el controller. Nuevamente, desisti
- Todavia estoy viendo de implementar el objeto RequiredExperience, estoy esperando que NicoPaez me responda el mail. Llego hasta aca por hoy, mañana sigo
- Llevo 18h30
- Al final no voy a implementar el objeto RequiredExperience. Voy a darle una ultima pasada al tp y entregar
- No encontre nada para hacer un refactor realmente. Aca termina el TP