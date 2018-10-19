# README | Prueba NNODES

Este archivo README fue creado con el proposito de explicar en detalle como fue desarrollada este prueba:

Versiones de:

* Ruby: 2.5.1

* Rails: 5.2

* BD: PostgreSQL (9.5)


* Realización de prueba según instrucciones:

  1.- "Deben existir vistas que permitan crear personas y ver su historial de peleas": 
  - Se accede a este desde el menú principal llamado "Personas", en el, se podrán crear personas, editar (solo nombre), ver su historial de peleas (por personas) y REVIVIRLA en caso de que la persona haya perdido en alguna una batalla.

  2.- "Deben existir vistas que permitan ver a los superhéroes y sus comics, series o eventos. Esto debe ser consultado a la API de Marvel (https://developer.marvel.com) en todo momento.":
   - Se accede a este desde el menú principal llamado "Superheroes", en el, se podrán ver la imagen del superheroe, su poder de ataque(creado desde BD para la simulacion de peleas entre personas), y su Detalle -> al dar click se podrá observar los datos, series, comics y eventos por superheroe.

  3.- Para la simulación de peleas, se puede acceder a ella desde el menu principal llamado "Torneo de peleas", en ella se verá reflejado todas las peleas que ocurren en la plataforma cada 10 minutos, asi mismo se muestra la cantidad de peleas transcurridas hasta el momento. Si se dea simular la batalla de forma manual, el botón "Pelear manualmente" dará inicio a esta acción. PD: En caso de que ninguna persona queda viva, se mostrará un boton que rediccionará a la vista de personas para que al menos una se puede revivir y continuar con la batalla

  4.- Para el ranking, se puede acceder a el desde el menu principal llamado "Ranking", en el se mostrarán los triunfos de las personas. En caso de querer resetear manualmente el ranking, este podrá ser accionado a través del botón "Reiniciar Ranking", y todos los triunfos serán reiniciados.

  5.- Para las interacciones de forma automatica se utilizó la gema 'whenever'. La forma en la que se realizó dichas interacciones fueron las siguientes:

  	5.1.- Para la simulacion de peleas: Primero, fue un metodo desarrollado en el modelo Persona.rb (pelear). Seguidamente, se realizó una task (ver archivo task.rake | nombre task: peleas) para que este fuera ejecutado. Para finalizar, dicha task fue llamada desde schedule.rb (gema whenever), y se le añadió un bloque de codigo para que este fuera ejecutado cada 10 minutos.

  	5.2.- Para revivir a personas: Fue el mismo procedimiento que el punto 5.1, pero se creó un metodo llamado 'revivir', el cual realiza la acción indicada. Igualmente, este metodo fue llamado desde task.rake y desde schedule.rb para que fuera ejecutado al final de día a las 00:00

  	5.3.- Para ranking de personas: Mismo procedimiento, pero este se realizó desde el controllador de ranking (reset_ranking) y se ejecuta en el mismo bloque de horas (final del dia a las 00:00) punto 5.2


* Por ultimo, cabe mencionar que las interraciones automaticas corren con la gema 'whenver' de forma local, y con 'Heroku Scheduler' desde Heroku, ya que esta plataforma no soporta cronjobs de Rails, y tienen sus propios jobs automaticos.