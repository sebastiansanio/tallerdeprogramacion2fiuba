<?php $this->cache['es_ar']['mod_lesson'] = array (
  'accesscontrol' => 'Control de acceso',
  'actionaftercorrectanswer' => 'Acción posterior a la respuesta correcta',
  'actionaftercorrectanswer_help' => '<p>La acción normal es seguir el salto de página tal como se ha especificado en la respuesta.
    En la mayoría de los casos se mostrará la página siguiente de la lección. Se conduce al
    estudiante a través de la lección siguiendo un camino lógico desde el principio hasta el final.</p>

<p>Sin embargo, el módulo Lección puede también usarse como si fuera una tarea a base de <i>tarjetas</i> (<I>flash-cards</I>).
    Se muestra (opcionalmente) al estudiante alguna información y se le formula una pregunta
    habitualmente de forma aleatoria. No hay ni principio ni final establecidos, sino simplemente
    un conjunto de <i>fichas</i> que se muestran unas junto a otras sin ajustarse a un orden
    particular.</p>

<p>Esta opción permite dos variantes muy similares al comportamiento de las tarjetas. La opción
    "Ir a una página no vista" nunca muestra dos veces la misma página (incluso aunque el estudiante
    <b>no</b> haya contestado correctamente la pregunta asociada con la página o la tarjeta. La otra
    opción ("Mostrar unan página no contestada") permite al estudiante ver páginas que pueden haber
    aparecido antes, pero sólo si ha contestado erróneamente a la pregunta asociada.</p>

<p>En las lecciones a base de tarjetas el profesor puede decidir si utiliza bien todas las páginas/tarjeta
    de la lección o sólo un subconjunto aleatorio. Esto se lleva a cabo a través del parámetro &quot; Número
    de Páginas (Tarjetas) a mostrar&quot;.</p>',
  'actions' => 'Acciones',
  'activitylink' => 'Enlace a una actividad',
  'activitylink_help' => '<p>El menú emergente contiene todas las actividades del curso. Si se selecciona una de ellas, al final de la        lección aparecerá un enlace a dicha actividad.</p>',
  'activitylinkname' => 'Ir a: {$a}',
  'addabranchtable' => 'Agregar una página de contenido',
  'addanendofbranch' => 'Agregar un final de ramificación',
  'addanewpage' => 'Añadir una nueva página',
  'addaquestionpage' => 'Añadir página',
  'addaquestionpagehere' => 'Agregar aquí una página de pregunta',
  'addbranchtable' => 'Agregar una página de contenido',
  'addcluster' => 'Agregar un cluster',
  'addedabranchtable' => 'Agregar una página de contenido',
  'addedanendofbranch' => 'Agregado un final de ramificación',
  'addedaquestionpage' => 'Agregada página de preguntas',
  'addedcluster' => 'Agregado cluster',
  'addedendofcluster' => 'Agregado un final de cluster',
  'addendofcluster' => 'Agregar un final de cluster',
  'addpage' => 'Agregar una página',
  'and' => 'Y',
  'anchortitle' => 'Comienzo del contenido principal',
  'answer' => 'Respuesta',
  'answeredcorrectly' => 'respondidas correctamente.',
  'answersfornumerical' => 'Las respuestas a preguntas numéricas deberían ser pares de valores máximo y mínimo',
  'arrangebuttonshorizontally' => '¿Disponer horizontalmente los botones de contenido?',
  'attempt' => 'Intento: {$a}',
  'attempts' => 'Intentos',
  'attemptsdeleted' => 'Intentos eliminados',
  'attemptsremaining' => 'Tiene {$a} intento(s) pendiente(s)',
  'available' => 'Disponible desde',
  'averagescore' => 'Puntuación promedio',
  'averagetime' => 'Tiempo promedio',
  'branch' => 'Contenido',
  'branchtable' => 'Contenido',
  'cancel' => 'Cancelar',
  'cannotfindanswer' => 'Error: no se pudo encontrar la respuesta',
  'cannotfindattempt' => 'Error: no se pudo encontrar el intento',
  'cannotfindessay' => 'Error: no se pudo encontrar el ensayo',
  'cannotfindfirstgrade' => 'Error: no se pudieron encontrar las calificaciones',
  'cannotfindfirstpage' => 'No se pudo encontrar la primera página',
  'cannotfindgrade' => 'Error: no se pudieron encontrar las calificaciones',
  'cannotfindnewestgrade' => 'Error: no se puede encontrar la calificación más reciente',
  'cannotfindnextpage' => 'Retroalimentación de la lección: no se pudo encontrar la Página Siguiente',
  'cannotfindpagerecord' => 'Agregar final de ramificación: registro de página no encontrado',
  'cannotfindpages' => 'No se han encontrado páginas en la lección',
  'cannotfindpagetitle' => 'Confirmar eliminación: título de página no encontrado',
  'cannotfindpreattempt' => 'No se ha encontrado el registro de intento previo',
  'cannotfindrecords' => 'Error: no se pudieron encontrar los registros de la lección',
  'cannotfindtimer' => 'Error: no se pudieron encontrar los registros de lesson_timer',
  'cannotfinduser' => 'Error: no se pudieron encontrar los usuarios',
  'canretake' => 'Permitir que el {$a} pueda retomar la lección',
  'casesensitive' => 'Usar expresiones regulares',
  'casesensitive_help' => '<p>Algunos tipos de pregunta tienen una opción que se activa con un clic en cuadro de verificación.  Los tipos de la pregunta y el significado de las opciones son detallados abajo.

<ol>
<li><p><b>Elección múltiple</b> Es una variante de las preguntas de Opción
Múltiple llamada de <b>&quot;Elección múltiple y respuestas múltiples"</b>.  Si escoge esta opción en la pregunta entonces requieren que el estudiante seleccione todas las respuestas correctas del conjunto de respuestas.  La pregunta puede o no decir al estudiante <i>cuántas</i> respuestas correctas existen. Por ejemplo "¿Cuáles han sido presidentes de
EE.UU.?", o "Seleccione a dos presidentes de EE.UU. de la siguiente lista.".  El número de respuestas correctas pueden ser de <b>una</b> hasta todas las opciones.  (Una pregunta de Elección múltiples y respuestas múltiples con una respuesta correcta <b>es</b> diferente de una pregunta de Opción Múltiple pues la primera permite al estudiante la posibilidad de elegir más de una respuesta mientras que la última no lo permite.)</p></li>

<li><p><b>Respuesta corta</b> Por defecto, en las comparaciones no se tiene en cuenta si el texto está mayúsculas o minúsculas. Si se selecciona Opción de pregunta  las comparaciones tiene en cuenta si el texto está en mayúsculas o minúsculas.</p></li>

<p>En los otros tipos de preguntas no afecta la Opción de pregunta.</p>',
  'classstats' => 'Estadísticas de clase',
  'clicktodownload' => 'Haga clic en el siguiente enlace para descargar el archivo.',
  'clicktopost' => 'Haga clic aquí para enviar su calificación a la lista de mejores puntuaciones.',
  'cluster' => 'Cluster',
  'clusterjump' => 'Pregunta no vista dentro de un cluster',
  'clustertitle' => 'Cluster',
  'collapsed' => 'Colapsado',
  'comments' => 'Sus comentarios',
  'completed' => 'Completado',
  'completederror' => 'Completar la lección',
  'completethefollowingconditions' => 'Para seguir, deberá completar la(s) siguiente(s) condición(es) en la lección <b>{$a}</b>.',
  'conditionsfordependency' => 'Condición(es) para la dependencia',
  'configactionaftercorrectanswer' => 'Acción predeterminada a ejecutar tras una respuesta correcta',
  'configmaxanswers' => 'Número máximo de respuestas por página predeterminado',
  'configmaxhighscores' => 'Número de puntuaciones altas a mostrar',
  'configmediaclose' => 'Muestra un botón de cierre en el marco de la ventana emergente generada por un archivo multimedia vinculado',
  'configmediaheight' => 'Establece la altura de la ventana emergente para mostrar un archivo multimedia enlazado',
  'configmediawidth' => 'Establece el ancho de la ventana emergente para mostrar un archivo multimedia enlazado.',
  'configslideshowbgcolor' => 'Color de fondo para la presentación de diapositivas si está habilitado',
  'configslideshowheight' => 'Establece la altura de la presentación de diapositivas si está habilitado',
  'configslideshowwidth' => 'Establece el ancho de la presentación de diapositivas si está habilitado',
  'confirmdelete' => 'Eliminar página',
  'confirmdeletionofthispage' => 'Confirme que desea eliminar esta página',
  'congratulations' => 'Enhorabuena, ha llegado al final de la lección',
  'continue' => 'Continuar',
  'continuetoanswer' => 'Continuar a cambiar respuestas.',
  'continuetonextpage' => 'Continue to next page.',
  'correctanswerjump' => 'Salto a respuesta correcta',
  'correctanswerscore' => 'Puntuación de respuesta correcta',
  'correctresponse' => 'Comentario (correcto)',
  'credit' => 'Crédito',
  'customscoring' => 'Puntuación personalizada',
  'customscoring_help' => '<p>Esta opción le permite asignar un valor numérico a cada respuesta. Las respuestas
   pueden tener valores negativos o positivos. Se asignará automáticamente a las preguntas
   importadas 1 punto a cada respuesta correcta y 0 puntos a cada respuesta incorrecta,
   si bien usted puede cambiar esto después de importarlas.</p>',
  'deadline' => 'Fecha final',
  'defaultessayresponse' => 'Su ensayo será calificado por el instructor del curso.',
  'deleteallattempts' => 'Eliminar todos los intentos de resolver la lección',
  'deletedefaults' => 'Eliminada {$a} x lección por defecto',
  'deletedpage' => 'Página eliminada',
  'deleting' => 'Eliminando',
  'deletingpage' => 'Eliminando página: {$a}',
  'dependencyon' => 'Dependiente de',
  'dependencyon_help' => '<p>Esta opción permite que la lección actual dependa del rendimiento de los estudiantes en otra lección del         mismo curso. Si no alcanza el rendimiento exigido, el estudiante no podrá acceder a esta lección.</p>

<p>Las condiciones de la dependencia incluyen:
    <ul>
        <li><b>Tiempo empleado:</b> el estudiante debe emplear en la lección el tiempo que aquí se señale.</li>
        <li><b>Completa:</b> el estudiante debe completar la lección.</li>
        <li><b>Calificación superior a:</b> el estudiante debe alcanzar en la lección una calificación superior     a la especificada en esta opción.</li>
    </ul>
    Puede usarse cualquier combinación de las opciones anteriores.
</p>',
  'description' => 'Descripción',
  'detailedstats' => 'Estadísticas detalladas',
  'didnotanswerquestion' => 'No ha contestado a esta pregunta.',
  'didnotreceivecredit' => 'No ha recibido crédito',
  'displaydefaultfeedback' => 'Mostrar retroalimentación por defecto',
  'displaydefaultfeedback_help' => '<p align="center"><strong>Mostrar retroalimentación por defecto</strong></p>

<p>Si se ajusta esta opción a <strong>Sí</strong>, cuando no se encuentre una respuesta a una pregunta en particular, se usará por defecto el comentario "Esa es la respuesta correcta" y "Esa es la respuesta incorrecta".</p>
<p>Si la opción se ajusta a <strong>No</strong>, cuando no se encuentre una respuesta a una pregunta en particular, no se mostrarán comentarios de retroalimentación. El usuario que está realizando la lección pasará directamente a la siguiente página de la lección.</p>',
  'displayhighscores' => 'Mostrar mejores puntuaciones',
  'displayinleftmenu' => '¿Mostrar en menú de la izquierda?',
  'displayleftif' => 'Mostrar el menú izquierdo solo si la calificación es mayor que',
  'displayleftif_help' => 'Esta configuración determina si un estudiante debe obtener una cierta puntuación para poder ver el menú de la izquierda. Esto obliga al estudiante a pasar por toda la lección en su primer intento y así obtener la puntuación necesaria para poder utilizar el menú de la izquierda para la revisión.',
  'displayleftmenu' => 'Mostrar menú de la izquierda',
  'displayleftmenu_help' => '<p>Esta opción muestra una lista de las páginas (tablas de ramas) de la lección. Las
páginas de preguntas, las páginas de conglomerados, etc., no se mostrarán por defecto
(usted puede elegir el mostrar las páginas de preguntas marcando esa opción en la
pregunta).</p>',
  'displayofgrade' => 'Mostrar calificación (sólo para estudiantes)',
  'displayreview' => 'Mostrar botón Revisar',
  'displayreview_help' => 'Si se activa, cuando una pregunta se responde incorrectamente, se le da al estudiante la opción de intentarlo de nuevo sin crédito de puntos, o continuar con la lección.',
  'displayscorewithessays' => 'Usted ha obtenido una puntuación de {$a->score} sobre {$a->tempmaxgrade} en las preguntas calificadas automáticamente.<br>La(s) {$a->essayquestions} pregunta(s) de su ensayo serán calificadas y añadidas<br>a su calificación final en una fecha posterior.<br><br>Su calificación actual sin contar esa(s) pregunta(s) es de is {$a->score} sobre {$a->grade}',
  'displayscorewithoutessays' => 'Su puntuación es {$a->score} (sobre {$a->grade}).',
  'edit' => 'Edición',
  'editingquestionpage' => 'Editando página de preguntas {$a}',
  'editlessonsettings' => 'Editar los ajustes de Esta lección',
  'editpage' => 'Modificar el contenido de la página',
  'editpagecontent' => 'Editar el contenido de esta página',
  'email' => 'Email',
  'emailallgradedessays' => 'Enviar por email TODOS los<br>ensayos calificados',
  'emailgradedessays' => 'Enviar por email los ensayos calificados',
  'emailsuccess' => 'Email enviado con éxito',
  'endofbranch' => 'Fin de ramificación',
  'endofcluster' => 'Final de cluster',
  'endofclustertitle' => 'Fin de cluster',
  'endoflesson' => 'Fin de la lección',
  'enteredthis' => 'introducido ésta.',
  'entername' => 'Escriba un apodo para la lista de mejores puntuaciones',
  'enterpassword' => 'Por favor, escriba la contraseña:',
  'eolstudentoutoftime' => 'Atención: Usted ha sobrepasado el tiempo fijado para esta lección. Su última respuesta puede no haber sido contabilizada si ha sido dada con el tiempo finalizado.',
  'eolstudentoutoftimenoanswers' => 'No ha contestado a ninguna pregunta. En esta lección ha obtenido 0 puntos.',
  'essay' => 'Ensayo',
  'essayemailmessage' => '<p>Ensayo:<blockquote>{$a->question}</blockquote></p><p>Su respuesta:<blockquote><em>{$a->response}</em></blockquote></p><p>{$a->comment} del profesor:<blockquote><em>{$a->comment}</em></blockquote></p><p>Usted ha recibido {$a->earned} sobre un total de {$a->outof} en esta pregunta de ensayo.</p><p>Su calificación en la lección ha cambiado a {$a->newgrade}%.</p>',
  'essayemailmessage2' => '<p>Essay prompt:<blockquote>{$a->question}</blockquote></p><p>Your response:<blockquote><em>{$a->response}</em></blockquote></p><p>Grader\'s comments:<blockquote><em>{$a->comment}</em></blockquote></p><p>You have received {$a->earned} out of {$a->outof} for this essay question.</p><p>Your grade for the lesson has been changed to {$a->newgrade}&#37;.</p>',
  'essayemailsubject' => 'Su calificación para la pregunta {$a}',
  'essays' => 'Ensayos',
  'essayscore' => 'Puntuación del ensayo',
  'fileformat' => 'Formato de archivo',
  'finish' => 'Finish',
  'firstanswershould' => 'de elementos',
  'firstwrong' => 'Lo sentimos, usted no puede obtener este punto porque su respuesta no es correcta. ¿Desea seguir intentándolo? (únicamente para aprender, no para ganar el punto).',
  'flowcontrol' => 'Control de Flujo',
  'full' => 'Expandido',
  'general' => 'General',
  'gotoendoflesson' => 'Go to the end of the lesson',
  'grade' => 'Calificación',
  'gradebetterthan' => 'Calificación superior a (%)',
  'gradebetterthanerror' => 'Obtener una calificación superior al {$a} por ciento',
  'gradeessay' => 'Calificar preguntas de ensayo ({$a->notgradedcount} no calificadas y {$a->notsentcount} no enviadas)',
  'gradeis' => 'La calificación es {$a}',
  'gradeoptions' => 'Opciones de Calificación',
  'handlingofretakes' => 'Calificación con varios intentos',
  'handlingofretakes_help' => '<p>Cuando se permite a los estudiantes retomar o repetir la lección, esta opción
permite elegir al profesor la clase de calificación final del alumno, por ejemplo, en
la página de calificaciones. Puede ser la <b>media</b>, la <b>primera</b> o la
<b>mejor</b> calificación de las obtenidas en todos los intentos o repeticiones de la lección.</p>

<p>Esta opción puede cambiarla en cualquier momento.</p>',
  'havenotgradedyet' => 'Aún no calificado.',
  'here' => 'aquí',
  'highscore' => 'Puntuación alta',
  'highscores' => 'Puntuaciones altas',
  'hightime' => 'Tiempo alto',
  'checkbranchtable' => 'Comprobar página de contenidos',
  'checkedthisone' => 'Comprobada ésta.',
  'checknavigation' => 'Revisar navegación',
  'checkquestion' => 'Revisar pregunta',
  'importcount' => 'Importando {$a} preguntas',
  'importppt' => 'Importar PowerPoint',
  'importppt_help' => '<p> FORMA DE USARLO</p>

<p>Todas las diapositivas PowerPoint se importan como Tablas de Rama con las respuestas Anterior y Siguente.</p>

<p>

<ol>

<li>Abra su presentación PowerPoint.</li>

<li>Guárdela como Página Web (sin opciones especiales)</li>

<li>El resultado del paso 3 debería ser un archivo HTML y una carpeta con todas las diapositivas convertidas a páginas web.<br />

  COMPRIMA sólo LA CARPETA.</li>

<li>Vaya a su sitio Moodle y agrege una nueva lección.</li>

<li>Tras haber guardado los ajustes de la lección, usted debería ver 4 opciones bajo &quot;¿Qué desea hacer primero?&quot; Haga clic en &quot;Importar PowerPoint&quot;</li>

<li>Use el botón &quot;Navegar...&quot; para encontrar el archivo ZIP to find your zip hecho en el paso 3. Haga clic a continuación en &quot;Subir este archivo&quot;</li>

<li>ISi todo ha ido bien, la próxima pantalla mostrará el botón Continuar.</li>

</ol>

</p>

<p>Si la presentación en PowerPoint contenía imágenes, deberán haber sido guardadas como archivos del curso en moddata/XY donde X es el nombre de la lección e Y es un número (normalmente 0). Asimismo, durante el proceso de importación, se crearán archivos en el directorio de datos de Moodle, dentro de temp/lesson. Estos archivos por el momento no son eliminados por import.php.</p>

<p align="center">&nbsp;</p>',
  'importquestions' => 'Importar preguntas',
  'importquestions_help' => '<P>Esta función permite importar preguntas de archivos de texto, subidos mediante un formulario.

<P>Los formatos permitidos son:

<P><B>GIFT</B></P>
<ul>
<p>GIFT es el formato de importación de preguntas más amigable para Moodle de todos los formatos disponible.  Su diseño permite que los profesores pueden escribir las preguntas en un archivo de texto de forma fácil. Permite preguntas de opción múltiple, Verdadero o Falso, Cortas, Emparejar y numéricas, también permite las preguntas de rellenar huecos
insertándolas como  _____ . Se pueden mezclar Varios tipos de preguntas en un solo archivo del texto, y este formato también permite líneas comentarios, los nombres de la pregunta, retroalimentación y los porcentaje-peso (ponderar) calificaciones.  Veamos algunos ejemplos:</p>
<pre>Who\'s buried in Grant\'s tomb?{~Grant ~Jefferson =no one}

Grant is {~buried =entombed ~living} in Grant\'s tomb.

Grant is buried in Grant\'s tomb.{FALSE}

Who\'s buried in Grant\'s tomb?{=no one =nobody}

When was Ulysses S. Grant born?{#1822}
</pre>

<p align=right><a href="help.php?file=formatgift.html&module=quiz">Más información sobre el formato "GIFT" </a></p>
</ul>

<P><B>Aiken</B></P>
<ul>
<p>El formato Aiken es una manera simple de crear preguntas de opción múltiple usando un
formato de fácil lectura. Un ejemplo del formato:</p>
<pre>¿Qué objetivo tienen los primeros auxilios?
A. Salvar la vida, prevenir más lesiones, mantener el buen estado de salud.
B. Dar tratamiento médico o sanitario
C. prevenir más lesiones
D. Ayudar a las victimas que pedir auxilio
ANSWER: A
</pre>

<p align=right><a href="help.php?file=formataiken.html&module=quiz">Más información sobre el formato "Aiken" </a></p>
</ul>


<P><B>Llenar el hueco</B></P>
<UL>
<P>Este formato sólo soporta preguntas de opción múltiple. Cada pregunta se separa con un tilde (~), y la respuesta correcta se precede con un signo de igual (=). Un ejemplo:


<BLOCKQUOTE>Cuando comenzamos a explorar las partes de nuestro cuerpo nos convertimos en estudiosos de: {=anatomía y fisiología ~reflexología ~la ciencia ~los experimentos}, y en cierto sentido somos estudiantes de la vida.

</BLOCKQUOTE>

<p align=right><a href="help.php?file=formatmissingword.html&module=quiz">Más información sobre el formato "Llenar
el hueco"</a></p>
</UL>


<P><B>AON</B></P>
<UL>
<P>Este es el mismo caso de llenar el hueco, excepto que luego de ser importadas, todas las preguntas se convierten en grupos de cuatro preguntas de seleccionar la correcta.
</P>
<p>Además, las respuestas de opción múltiple son mezcladas  aleatoriamente en la importación.
<p>Se le llama así en honor a una empresa que impulsó el desarrollo de muchas
características para los cuestionarios.
</p>
</UL>


<P><B>Blackboard</B></P>
<UL>
<P>Este módulo puede importar preguntas guardadas con la característica de exportar preguntas del programa Blackboard. Se apoya en la capacidad de compilar funciones XML en sus correspondientes PHP.</P>

<p align=right><a href="help.php?file=formatblackboard.html&module=quiz">Más información sobre el formato "Blackboard"</a></p>
</UL>

<P><B>Course Test Manager</B></P>
<UL>
<P>Este módulo puede importar las preguntas guardadas en una banco de preguntas de Course Test Manager.  Tenemos varias formas de acceder al banco de preguntas en formato
Access de Microsoft, dependiendo si Moodle está funcionando en un servidor de Windows o de Linux:</P>
<p>Desde Windows debemos subir la base de datos como cualquier otro archivo para importar sus datos.</p>
<p>Desde Linux, debemos instalar el software ODBC Socket Server, que utiliza XML para transferir datos a
Moodle desde el servidor Linux.</p>  <p>Por favor, lea todo el archivo de ayuda antes de importar este tipo de formato.</p>


<p align=right><a href="help.php?file=formatctm.html&module=quiz">Más información sobre el formato "CTM"</a></p>
</UL>

<P><B>Personal</B></P>
<UL>
<P>Si tiene su propio formato que desea importar, puede implementarlo editando mod/quiz/format/custom.php


<P>La cantidad de código nuevo necesaria es bastante pequeña - será suficiente con analizar una sola pregunta del texto-.

<p align=right><a href="help.php?file=formatcustom.html&module=quiz">Más información sobre el formato "Personal"</a></p>
</UL>


<P>Se están desarrollando más formatos, incluyendo WebCT, IMS QTI y cualquier otro que los usuarios de Moodle quieran aportar.</p>',
  'insertedpage' => 'Página insertada',
  'invalidfile' => 'Archivo no válido',
  'invalidid' => 'No course module ID or lesson ID were passed',
  'invalidlessonid' => 'La ID de la lección es incorrecta',
  'invalidpageid' => 'ID de página no válida',
  'jump' => 'Saltar',
  'jumps' => 'Saltos',
  'jumps_help' => '<p>Cada respuesta tiene un salto de página hacia un enlace. Cuando se elige una
respuesta se muestra el refuerzo al estudiante. Después de ver el mensaje de
refuerzo se produce el salto de página hacia el enlace. Este enlace puede ser
absoluto o relativo. Los enlaces relativos son <b>Esta página </b>y <b>Siguiente página</b>. <b>Esta página</b> significa que el estudiante ve la misma página otra vez. La <b>Siguiente página </b>muestra la página que le sigue en el orden lógico de las páginas. Un enlace Absoluto se determina eligiendo el título de la página.</p>
<p>Nota: si cambia el orden de  las páginas el salto de página (relativo) <b>Siguiente página</b> puede mostrar una página diferente. Cuando se usa un enlace absoluto con el título de la página siempre mostrará la página seleccionada aunque las cambie de orden</p>
<p>&nbsp;</p>',
  'jumpsto' => 'Saltos a <em>{$a}</em>',
  'leftduringtimed' => 'Se ha interrumpido una lección con tiempo fijo.<br>Por favor, haga clic en Continuar para volver a empezar la lección.',
  'leftduringtimednoretake' => 'Se ha interrumpido una lección con tiempo fijo y<br>no se permite volver a empezar o continuar la lección.',
  'lessonattempted' => 'Lección intentada',
  'lessonclosed' => 'Esta lección se cerró el {$a}.',
  'lessoncloses' => 'La lección se cierra',
  'lessoncloseson' => 'La lección se cierra el {$a}',
  'lesson:edit' => 'Editar una actividad de lección',
  'lessonformating' => 'Formateado de la Lección',
  'lesson:manage' => 'Gestionar una actividad de lección',
  'lessonmenu' => 'Menú Lección',
  'lessonnotready' => 'Esta lección no está lista para practicar. Por favor, contacte con su {$a}.',
  'lessonnotready2' => 'Esta lección no está preparada.',
  'lessonopen' => 'Esta lección se abrirá el {$a}.',
  'lessonopens' => 'La lección se abre',
  'lessonpagelinkingbroken' => 'No se encuentra la primera página. El enlace a la página de la lección debe estar roto. Por favor, contacte con el administrador.',
  'lessonstats' => 'Estadísticas de la lección',
  'linkedmedia' => 'Medios enlazados',
  'loginfail' => 'Acceso fallido, por favor pruebe de nuevo...',
  'lowscore' => 'Puntuación baja',
  'lowtime' => 'Tiempo bajo',
  'manualgrading' => 'Calificar ensayos',
  'matchesanswer' => 'Concuerda con la respuesta',
  'matching' => 'Emparejamiento',
  'matchingpair' => 'Pareja {$a}',
  'maxgrade' => 'Calificación máxima',
  'maxgrade_help' => '<p>Este valor determina la máxima calificación que se puede obtener con la
lección.    El rango va de&nbsp; 0 a 100%. Este valor puede cambiarse en
cualquier momento. Los cambios tendrán un efecto inmediato en la página de
calificaciones y los alumnos podrán ver sus calificaciones en diferentes
listas.</p>',
  'maxhighscores' => 'Número de puntuaciones más altas para mostrar',
  'maximumnumberofanswersbranches' => 'Número máximo de respuestas',
  'maximumnumberofanswersbranches_help' => '<p>Este valor determina máximo número de respuestas que usará el profesor. El
valor por defecto es 4. Si una lección solo utilizará preguntas de VERDADERO o
FALSO podemos asignarle el valor de 2.</p>

<p>Este valor también se usa para asignar el máximo número de capítulos que se
usarán en la lección.</p>

<p>Puede editar, de forma segura, este valor en las lecciones ya creadas. De hecho,
será necesario si desea añadir un pregunta con muchas opciones o ampliar el
número de capítulos. Después de que haya añadido las preguntas o capítulos
también puede reducir el valor a uno más &quot;estándar&quot;.</p>',
  'maximumnumberofattempts' => 'Número máximo de intentos',
  'maximumnumberofattempts_help' => '<p>Este valor determina el número máximo de intentos que tienen los estudiantes para responder <b>cualquiera</b> de las preguntas de una lección. En los casos de preguntas que no tienes respuestas, por ejemplo preguntas cortas o numéricas, este valor indica el número de veces que puede responder antes de que lo envíe a la siguiente página de la lección. </p>

<p>El valor por defecto es 5. Valores bajos pueden desalentar al estudiante antes de resolver la pregunta. Valores altos pueden producir
frustración.</p>

<p>Si asignamos el valor 1 damos al estudiante una única opción para responder cada pregunta. Esto produce un comportamiento similar a los cuestionarios excepto que cada pregunta se presenta en una página individual.</p>

<p>Advierta que este valor es un parámetro global y que se aplica a todas las preguntas de la lección sin tener en cuenta su tipo de pregunta.</p>

<p>Recuerde que este parámetro <b>no</b> se aplica cuando los profesores comprueban las preguntas o cuando navegan por la lección. No son registrados en la base de datos el número de intentos realizados ni las calificaciones obtenidas por los profesores. ¡Los profesores deberían después de todo conocer todas las respuestas!</p>',
  'maximumnumberofattemptsreached' => 'Se ha alcanzado el número máximo de intentos. Traslado a la página siguiente',
  'maxtime' => 'Límite de tiempo (minutos)',
  'maxtimewarning' => 'Dispone de {$a} minuto(s) para terminar la lección.',
  'mediaclose' => 'Mostrar botón de cierre:',
  'mediafile' => 'Archivo multimedia',
  'mediafile_help' => '<p>Esta opción crea una ventana emergente al comienzo de la lección a un archivo (e.g., mp3) o página web. Asimismo, en cada página de la lección aparecerá un enlace que abre de nuevo la ventana emergente si fuera necesario.</p>

<p>Opcionalmente aparecerá un botón de "Cerrar ventana" al final de la ventana emergente; pueden ajustarse asimismo la altura y anchura de la ventana.</p>',
  'mediafilepopup' => 'Haga clic aquí para ver',
  'mediaheight' => 'Altura de la ventana emergente:',
  'mediawidth' => 'Anchura de la ventana emergente:',
  'messageprovider:graded_essay' => 'Notificación de ensayo calificado',
  'minimumnumberofquestions' => 'Número mínimo de preguntas',
  'minimumnumberofquestions_help' => 'Este ajuste determina el número mínimo de preguntas vistas para que se calcule una calificación para la actividad. si la lección cuenta con una o más páginas de contenido, el número mínimo de preguntas debería fijarse en cero.

En el caso de fijar este parámetro, por ejemplo, a 20, se sugiere que se agregue este texto a la página inicial de la lección: "Se espera que en esta lección usted intente contestar al menos 20 preguntas. Puede contestar más si lo desea. Sin embargo, si intenta contestar menos de 20 preguntas, su calificación se calculará como si hubiera intentado contestar 20".',
  'missingname' => 'Por favor, escriba un \'nick\'',
  'modattempts' => 'Permitir revisión al estudiante',
  'modattempts_help' => '<p>Esta opción permite al estudiante volver atrás para cambiar sus respuestas.</p>',
  'modattemptsnoteacher' => 'La revisión del estudiante sólo está disponible para los estudiantes.',
  'modulename' => 'Lección',
  'modulename_help' => '<p><img alt="" src="<?php echo $CFG->wwwroot?>/mod/lesson/icon.gif" />&nbsp;<b>Lección</b></p>
<div class="indent">
<p>Una lección proporciona contenidos de forma interesante y flexible. Consiste en una
    serie de páginas. Cada una de ellas normalmente termina con una pregunta y un
    número de respuestas posibles. Dependiendo de cuál sea la elección del estudiante,
    progresará a la próxima página o volverá a una página anterior. La navegación a
    través de la lección puede ser simple o compleja, dependiendo en gran medida de
    la estructura del material que se está presentando.</p>
</div>',
  'modulenameplural' => 'Lecciones',
  'move' => 'Mover página',
  'movedpage' => 'Página movida',
  'movepagehere' => 'Mover la página aquí',
  'moving' => 'Moviendo página: {$a}',
  'multianswer' => 'Multirrespuesta',
  'multianswer_help' => '<p>Algunos tipos de pregunta tienen una opción que se activa con un clic en cuadro de verificación.  Los tipos de la pregunta y el significado de las opciones son detallados abajo.

<ol>
<li><p><b>Elección múltiple</b> Es una variante de las preguntas de Opción
Múltiple llamada de <b>&quot;Elección múltiple y respuestas múltiples"</b>.  Si escoge esta opción en la pregunta entonces requieren que el estudiante seleccione todas las respuestas correctas del conjunto de respuestas.  La pregunta puede o no decir al estudiante <i>cuántas</i> respuestas correctas existen. Por ejemplo "¿Cuáles han sido presidentes de
EE.UU.?", o "Seleccione a dos presidentes de EE.UU. de la siguiente lista.".  El número de respuestas correctas pueden ser de <b>una</b> hasta todas las opciones.  (Una pregunta de Elección múltiples y respuestas múltiples con una respuesta correcta <b>es</b> diferente de una pregunta de Opción Múltiple pues la primera permite al estudiante la posibilidad de elegir más de una respuesta mientras que la última no lo permite.)</p></li>

<li><p><b>Respuesta corta</b> Por defecto, en las comparaciones no se tiene en cuenta si el texto está mayúsculas o minúsculas. Si se selecciona Opción de pregunta  las comparaciones tiene en cuenta si el texto está en mayúsculas o minúsculas.</p></li>

<p>En los otros tipos de preguntas no afecta la Opción de pregunta.</p>',
  'multichoice' => 'Opción múltiple',
  'multipleanswer' => 'Respuesta múltiple',
  'nameapproved' => 'Nombre aprobado',
  'namereject' => 'Lo sentimos, su nombre ha sido rechazado por el filtro.<br>Por favor, pruebe con otro nombre.',
  'new' => 'nueva',
  'nextpage' => 'Página siguiente',
  'noanswer' => 'No se ha dado respuesta',
  'noattemptrecordsfound' => 'No se encontraron registros de intentos. Sin calificación',
  'nobranchtablefound' => 'No se ha encontrado página de contenido',
  'nocommentyet' => 'Aún no comentado.',
  'nocoursemods' => 'No se encuentran actividades',
  'nocredit' => 'No crédito',
  'nodeadline' => 'No fecha límite',
  'noessayquestionsfound' => 'No se encuentran preguntas de ensayo en esta lección.',
  'nohighscores' => 'No puntuaciones más altas',
  'nolessonattempts' => 'No se han hecho intentos de practicar esta lección.',
  'nooneansweredcorrectly' => 'Nadie ha contestado correctamente.',
  'nooneansweredthisquestion' => 'Nadie ha contestado esta pregunta.',
  'nooneenteredthis' => 'Nadie ha introducido esto.',
  'noonehasanswered' => 'Nadie ha contestado aún a una pregunta de ensayo.',
  'noonecheckedthis' => 'Nadie ha comprobado esto.',
  'noretake' => 'No se le permite retomar esta lección.',
  'normal' => 'Normal - seguir el flujo de la lección',
  'notcompleted' => 'Sin finalizar',
  'notdefined' => 'Sin definir',
  'nothighscore' => 'No ha fijado la lista {$a} de puntuaciones más altas.',
  'notitle' => 'Sin título',
  'numberofcorrectanswers' => 'Número de respuestas correctas: {$a}',
  'numberofcorrectmatches' => 'Número de emparejamientos correctos: {$a}',
  'numberofpagestoshow' => 'Número de páginas a mostrar',
  'numberofpagestoshow_help' => '<p>Este valor se usa solamente en las lecciones de tipo Tarjeta (<I>Flash Card</I>). Su
valor por defecto es cero y significa que todas las Páginas/Tarjeta serán
mostradas en la lección. Cuando el valor es distinto de cero se mostrarán ese
número de páginas. Después de mostrar ese número de&nbsp; Páginas/Tarjeta viene
el final de la lección y se muestra la calificación obtenida por el estudiante.</p>

<p>Si el valor que se asigna es superior al número de páginas de la lección se
mostrarán todas las páginas.</p>',
  'numberofpagesviewed' => 'Número de páginas vistas: {$a}',
  'numberofpagesviewednotice' => 'Número de preguntas contestadas: {$a->nquestions}; (Debería contestar al menos: {$a->minquestions})',
  'numerical' => 'Numérica',
  'ongoing' => 'Mostrar puntuación acumulada',
  'ongoing_help' => '<p>Cuando se activa esta opción, cada página mostrará los puntos que el estudiante ha obtenido del total de          puntos posible. Por ejemplo, si un estudiante ha contestado correctamente cuatro preguntas de 5 puntos y ha      fallado una pregunta, la puntuación provisional será de 15/20 puntos.</p>',
  'ongoingcustom' => 'Esta es una lección de {$a->score} puntos. Usted ha obtenido {$a->score} punto(s) sobre {$a->currenthigh} hasta ahora.',
  'ongoingnormal' => 'Usted ha respondido correctamente {$a->correct} pregunta(s) de un total de {$a->viewed} pregunta(s).',
  'onpostperpage' => 'Solo un mensaje por calificación',
  'options' => 'Opciones',
  'or' => 'O',
  'ordered' => 'Ordenado',
  'other' => 'Otro',
  'outof' => 'Fuera de {$a}',
  'overview' => 'Revisión',
  'overview_help' => 'Una lección se compone de un conjunto de páginas y, ocasionalmente, de páginas de contenido. Una página contiene información y normalmente termina con una pregunta. Con cada respuesta a la pregunta está asociado un salto. Este puede ser relativo (e.g., a la página actual o a la siguiente) o absoluto (e.g., a cualquiera de las páginas de la lección). Una página de contenido es aquella que contiene un conjunto de enlaces a otras páginas de la lección, e.g., una Tabla de Contenidos.',
  'page' => 'Página: {$a}',
  'page-mod-lesson-x' => 'Cualquier página de lección',
  'page-mod-lesson-view' => 'View or preview lesson page',
  'page-mod-lesson-edit' => 'Edit lesson page',
  'pagecontents' => 'Contenido de la página',
  'pages' => 'Páginas',
  'pagetitle' => 'Título de la página',
  'password' => 'Contraseña',
  'passwordprotectedlesson' => '{$a} es una lección protegida con contraseña.',
  'pleaseenteryouranswerinthebox' => 'Por favor, escriba su respuesta en la caja',
  'pleasecheckoneanswer' => 'Seleccione una respuesta',
  'pleasecheckoneormoreanswers' => 'Seleccione una o más respuestas',
  'pleasematchtheabovepairs' => 'Empareje los siguentes elementos',
  'pluginadministration' => 'Administración de la lección',
  'pluginname' => 'Lección',
  'pointsearned' => 'Puntos ganados',
  'postprocesserror' => 'Ha ocurrido un error durante el post-procesamiento',
  'postsuccess' => 'Mensaje exitoso',
  'pptsuccessfullimport' => 'Se han importado con éxito las páginas de la presentación PowerPoint subida',
  'practice' => 'Lección de práctica',
  'practice_help' => '<p>Las lecciones de práctica no se mostrarán en el libro de calificaciones.</p>',
  'preprocesserror' => 'Ha ocurrido un error durante el pre-procesamiento',
  'preview' => 'Previsualizar',
  'previewlesson' => 'Previsualizar {$a}',
  'previouspage' => 'Página anterior',
  'processerror' => 'Ha ocurrido un error durante el procesamiento',
  'progressbar' => 'Barra de progreso',
  'progressbar_help' => '<p>Muestra una barra de progreso al final de la lección.
Por el momento, la barra de progreso tiene más precisión cuando las lecciones son lineales.</p>
<p>Al calcular el porcentaje completado, las Tablas de ramificación y las páginas de preguntas contestadas correctamente contribuyen al progreso de la lección. Al calcular el número total de páginas de la lección, los conglomerados y las páginas incluídas en los conglomerados sólo cuentan como una página única, excluyéndose las páginas de final de conglomerado y final de tabla de ramificación. El resto de las páginas cuentan para calcular el total de páginas de la lección.</p>
<p>Nota: los estilos por defecto de la barra de progreso no impresionan ;)  Todos los estilos (e.g.: colores, imágenes de fondo, etc.)
de la barra de progreso pueden modificarse en mod/lesson/styles.php.',
  'progressbarteacherwarning' => 'La barra de progreso no muestra {$a}',
  'progressbarteacherwarning2' => 'Usted no verá la barra de progreso porque puede editar esta lección',
  'qtype' => 'Tipo de página',
  'question' => 'Pregunta',
  'questionoption' => 'Opción de pregunta',
  'questiontype' => 'Tipo de pregunta',
  'randombranch' => 'Página de contenido aleatorio',
  'randompageinbranch' => 'Pregunta aleatoria dentro de una página de contenido',
  'rank' => 'Rango',
  'rawgrade' => 'Calificación en bruto',
  'receivedcredit' => 'Crédito recibido',
  'redisplaypage' => 'Volver a mostrar página',
  'report' => 'Informe',
  'reports' => 'Informes',
  'response' => 'Comentario',
  'retakesallowed' => 'Se permite volver a tomar la lección',
  'retakesallowed_help' => '<p>Esta opción determina si los alumnos pueden tomar una lección más de una vez.
   El profesor puede decidir que la lección contiene material que los alumnos
     deben conocer en profundidad, en cuyo caso se debería permitir que el alumno repita
     la lección. Por otro lado, si el material se utiliza como examen esto no debería
     permitirse.
</p>

<p>Cuando a los alumnos se les permite repetir la lección, la <b>calificación</b> que aparece
    en la página Calificaciones corresponde bien al <B>promedio</B> de calificaciones, bien al <b>mejor</b> resultado obtenido en las repeticiones.
    El siguiente parámetro determina cuál de esas dos alternativas de calificación se utilizará.
</p>
<p>Advierta que el <b>Análisis de Pregunta</b> siempre utiliza las respuestas de los primeros intentos, y que las repeticiones subsiguientes no son tenidas en cuenta.</p>
<p>La opción por defecto es <b>Sí</b>, lo que significa que los alumnos pueden retomar la lección. Se
espera que sólo bajo condiciones excepcionales se seleccione la opción <b>No</b>.
</p>',
  'returnto' => '{$a}',
  'returntocourse' => 'Volver al curso',
  'review' => 'Revisión',
  'reviewlesson' => 'Revisar lección',
  'reviewquestionback' => 'Sí, me gustaría probar de nuevo',
  'reviewquestioncontinue' => 'No, deseo pasar a la siguiente',
  'sanitycheckfailed' => 'Ha fallado el \'Sanity Check\': Este intento se ha eliminado',
  'savechanges' => 'Guardar cambios',
  'savechangesandeol' => 'Guardar todos los cambios e ir al final de la lección.',
  'savepage' => 'Guardar página',
  'score' => 'Puntuación',
  'scores' => 'Puntuaciones',
  'secondpluswrong' => 'No. ¿Desea probar de nuevo?',
  'selectaqtype' => 'Seleccione un tipo de pregunta',
  'shortanswer' => 'Respuesta corta',
  'showanunansweredpage' => 'Mostrar una página no respondida',
  'showanunseenpage' => 'Mostrar una página no vista',
  'singleanswer' => 'Una sola respuesta',
  'skip' => 'Pasar por alto la navegación',
  'slideshow' => 'Pase de diapositivas',
  'slideshow_help' => '<p>Esta opción permite mostrar la lección como una sesión de diapositivas, con una
anchura, altura y color de fondo personalizado fijos. Se mostrará una barra de
desplazamiento basada en CSS si el contenido de la página excede la anchura o la altura
seleccionadas. Por defecto, las preguntas se "desgajarán" del modo de pase de
diapositivas, y sólo las páginas (i.e., tablas de ramas) se mostrarán en una
diapositiva. Los botones etiquetados por el idioma por defecto como "Siguiente" y
"Anterior" aparecerán en los extremos derecho e izquierdo de la diapositiva si
tal opción es seleccionada en la página. El resto de los botones aparecerán centrados
debajo de la diapositiva.</p>',
  'slideshowbgcolor' => 'Color de fondo del pase de diapositivas',
  'slideshowheight' => 'Altura del pase de diapositivas',
  'slideshowwidth' => 'Anchura del pase de diapositivas',
  'startlesson' => 'Comenzar lección',
  'studentattemptlesson' => 'Intento número {$a->attempt} de {$a->lastname}, {$a->firstname}',
  'studentname' => '{$a} Nombre',
  'studentoneminwarning' => 'Atención: Le queda 1 minuto o menos para terminar la lección.',
  'studentresponse' => 'comentario de {$a}',
  'submit' => 'Submit',
  'submitname' => 'Enviar nombre',
  'teacherjumpwarning' => 'Un salto {$a->cluster} o {$a->unseen} se está usando en esta lección. En su lugar se usará el salto a la página siguiente. Entre como estudiante para probar estos saltos.',
  'teacherongoingwarning' => 'La puntuación acumulada sólo se muestra al estudiante. Entre como estudiante para probar la puntuación acumulada.',
  'teachertimerwarning' => 'El temporizador sólo funciona con estudiantes. Entre como estudiante para probar el temporizador.',
  'thatsthecorrectanswer' => 'Esta es la respuesta correcta',
  'thatsthewronganswer' => 'Esta es la respuesta equivocada',
  'thefollowingpagesjumptothispage' => 'Las páginas siguientes saltan a esta página',
  'thispage' => 'Esta página',
  'timeremaining' => 'Tiempo restante',
  'timespenterror' => 'Dedicar al menos {$a} minutos a la lección',
  'timespentminutes' => 'Tiempo empleado (minutos)',
  'timetaken' => 'Tiempo empleado',
  'topscorestitle' => '{$a} puntuaciones más altas.',
  'truefalse' => 'Verdadero/Falso',
  'unabledtosavefile' => 'El archivo que ha subido no se ha podido guardar',
  'unknownqtypesnotimported' => 'No se importaron {$a} preguntas con tipos de pregunta no admitidos',
  'unseenpageinbranch' => 'Pregunta no vista dentro de una página de conenidos',
  'unsupportedqtype' => '¡Tipo de pregunta no admitido ({$a})!',
  'updatedpage' => 'Página actualizada',
  'updatefailed' => 'Actualización fallida',
  'usemaximum' => 'Utilizar el máximo',
  'usemean' => 'Utilizar la media',
  'usepassword' => 'Lección protegida con contraseña',
  'usepassword_help' => '<p>Si se selecciona esta opción, el estudiante no podrá acceder a la lección a menos que escriba la contraseña.</p>',
  'viewgrades' => 'Ver calificaciones',
  'viewhighscores' => 'Ver lista de puntuaciones más altas.',
  'viewreports' => 'Ver {$a->attempts} intentos {$a->student} completados',
  'viewreports2' => 'View {$a} intentos completados',
  'welldone' => '¡Bien hecho!',
  'whatdofirst' => '¿Qué desea hacer primero?',
  'wronganswerjump' => 'Salto a respuesta errónea',
  'wronganswerscore' => 'Puntuación de respuesta errónea',
  'wrongresponse' => 'Comentario (erróneo)',
  'xattempts' => '{$a} intentos',
  'youhaveseen' => 'Usted ya ha visto más de una página de esta lección.<br />¿Desea comenzar desde la última página vista?',
  'youmadehighscore' => 'Lo ha hecho en la lista {$a} de puntuaciones más altas.',
  'youranswer' => 'Su respuesta',
  'yourcurrentgradeis' => 'Su calificación actual es {$a}',
  'yourcurrentgradeisoutof' => 'Su calificación actual es {$a->grade} sobre {$a->total}',
  'youshouldview' => 'Usted debería ver como mínimo: {$a}',
);