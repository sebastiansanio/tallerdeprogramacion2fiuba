<?php $this->cache['es_ar']['enrol_flatfile'] = array (
  'filelockedmail' => 'El fichero de texto empleado en matriculaciones basadas en archivo ({$a}) no puede ser eliminado por el proceso de \'cron\'. Esto generalmente significa que los permisos son erróneos. Por favor, corrija los permisos para que Moodle puede eliminar el archivo, de lo contrario, podría ser procesado en varias ocasiones.',
  'filelockedmailsubject' => 'Error importante: Archivo de matriculación',
  'location' => 'Ubicación del archivo',
  'mailadmin' => 'Notificar administrador por correo electrónico',
  'mailstudents' => 'Notificar a los estudiantes por correo electrónico',
  'mailteachers' => 'Notificar a los profesores por correo electrónico',
  'mapping' => 'Flat file mapping',
  'pluginname' => 'Archivo plano (CSV)',
  'pluginname_desc' => 'This method will repeatedly check for and process a specially-formatted text file in the location that you specify.
The file is a comma separated file assumed to have four or six fields per line:
<pre class="informationbox">
*  operation, role, idnumber(user), idnumber(course) [, starttime, endtime]
where:
*  operation        = add | del
*  role             = student | teacher | teacheredit
*  idnumber(user)   = idnumber in the user table NB not id
*  idnumber(course) = idnumber in the course table NB not id
*  starttime        = start time (in seconds since epoch) - optional
*  endtime          = end time (in seconds since epoch) - optional
</pre>
It could look something like this:
<pre class="informationbox">
   add, student, 5, CF101
   add, teacher, 6, CF101
   add, teacheredit, 7, CF101
   del, student, 8, CF101
   del, student, 17, CF101
   add, student, 21, CF101, 1091115000, 1091215000
</pre>',
);