<?php $this->cache['es_ar']['enrol_self'] = array (
  'customwelcomemessage' => 'Mensaje de bienvenida personalizado',
  'defaultrole' => 'Asignación de rol por defecto',
  'defaultrole_desc' => 'Seleccione el rol que debe asignarse a los usuarios con auto-matriculación',
  'editenrolment' => 'Editar matricula',
  'enrolenddate' => 'Fecha límite',
  'enrolenddate_help' => 'If enabled, users can enrol themselves until this date only.',
  'enrolenddaterror' => 'La fecha final de matriculación no puede ser anterior a la fecha inicial',
  'enrolme' => 'Matricularme',
  'enrolperiod' => 'Período de matriculación',
  'enrolperiod_desc' => 'Duración por defecto del período de matriculación (en segundos).',
  'enrolperiod_help' => 'Length of time that the enrolment is valid, starting with the moment the user enrols themselves. If disabled, the enrolment duration will be unlimited.',
  'enrolstartdate' => 'Fecha de inicio',
  'enrolstartdate_help' => 'If enabled, users can enrol themselves from this date onward only.',
  'groupkey' => 'Clave de matriculación del grupo de usuarios',
  'groupkey_desc' => 'Por defecto, utilice claves de matriculación de grupo.',
  'groupkey_help' => '<p>Además de restringir el acceso al curso a sólo aquellos que conocen la clave, el uso de una clave de acceso de grupo significa que los usuarios se agregan automáticamente al grupo cuando se inscriben en el curso. </p>
<p>Para utilizar una clave de acceso de grupo, se debe especificar que se precisa clave en la configuración de los cursos, y también en la configuración del grupo.</p>',
  'longtimenosee' => 'Dar de baja los inactivos después de',
  'longtimenosee_help' => 'Si los usuarios no acceden a un curso durante mucho tiempo, entonces se les da de baja automáticamente. Este parámetro especifica este plazo de tiempo.',
  'maxenrolled' => 'Número máximo de usuarios matriculados',
  'maxenrolled_help' => 'Especifique el número máximo de usuarios que pueden auto-matricularse.El 0 significa sin límite.',
  'maxenrolledreached' => 'Se alcanzó el número máximo de usuarios permitidos para auto-matriculación.',
  'password' => 'Clave de matriculación',
  'password_help' => '<p>Una clave de acceso permite que el acceso al curso esté limitado sólo a aquellos que conocen dichala clave. </p>
<p>Si el campo se deja en blanco, cualquier usuario puede matricularse en el curso.</p>
<p>Si se especifica una clave de acceso, cualquier usuario que intenta matricularse en el curso deberá proporcionar la clave. Tenga en cuenta que un usuario sólo tiene que proporcionar la clave de acceso una vez, cuando se matricule en el curso.</p>',
  'passwordinvalid' => 'Contraseña de acceso incorrecta, pruebe de nuevo',
  'passwordinvalidhint' => 'La contraseña de matriculación es incorrecta. Por favor, inténtelo de nuevo<br />
(Una pista: comienza con \'{$a}\')',
  'pluginname' => 'Auto-matriculación',
  'pluginname_desc' => '<p>La extensión para matrícula libre permite a los usuarios elegir los cursos en los que quieren participar.</p>
<p>Los cursos pueden estar protegidos por una contraseña de acceso.</p>
<p> Internamente, la matriculación se realiza a través de la extensión para la matriculación manual, que debe estar habilitada en el mismo curso.</p>',
  'requirepassword' => 'Se precisa clave de matriculación',
  'requirepassword_desc' => 'Se precisa clave de matriculación en nuevos cursos y se evita la eliminación de la clave de matriculación de los cursos existentes.',
  'role' => 'Asignar rol',
  'self:config' => 'Configure la auto-matriculación',
  'self:manage' => 'Gestionar usuarios matriculados',
  'self:unenrol' => 'Dart de baja usuarios del curso',
  'self:unenrolself' => 'Darse de baja del curso',
  'sendcoursewelcomemessage' => 'Enviar mensaje de bienvenida al curso',
  'sendcoursewelcomemessage_help' => 'Si esta opción está activada, los usuarios recibirán un mensaje de bienvenida por email cuando se automatriculen en un curso.',
  'showhint' => 'Mostrar pista',
  'showhint_desc' => 'Mostrar la primera letra de la contraseña de acceso de invitados.',
  'status' => 'Permitir la auto-matrículación',
  'status_desc' => 'Permitir, por defecto, que los usuarios puedan auto-inscribirse en un curso.',
  'status_help' => 'Esta opción determina si un usuario puede inscribirse a un curso (y también darse de baja si tienen el permiso adecuado) por si mismo.',
  'unenrol' => 'Unenrol user',
  'unenrolselfconfirm' => '¿Está seguro que quiere darse de baja del curso "{$a}"?',
  'unenroluser' => 'Do you really want to unenrol "{$a->user}" from course "{$a->course}"?',
  'usepasswordpolicy' => 'Utilice la directiva de contraseñas',
  'usepasswordpolicy_desc' => 'Utilice la directiva de contraseñas estándar para las claves de matriculación.',
  'welcometocourse' => 'Bienvenido a {$a}',
  'welcometocoursetext' => 'Bienvenido a {$a->coursename}

Lo primero que debe hacer es actualizar su información personal: así podremos saber algo más sobre usted.
No olvide colocar su foto u otra imagen que lo identifique.

  {$a->profileurl}',
);