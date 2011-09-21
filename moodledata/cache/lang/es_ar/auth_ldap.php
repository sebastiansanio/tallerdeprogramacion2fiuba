<?php $this->cache['es_ar']['auth_ldap'] = array (
  'auth_ldap_ad_create_req' => 'No se puede crear la nueva cuenta en el Directorio Activo. Asegúrese de que cumple todos los requisitos (conexión LDAPS, \'bind user\' con derechos adecuados, &c.)',
  'auth_ldap_attrcreators' => 'Lista de grupos o contextos cuyos miembros están habilitados para crear atributos. Separe los grupos con \',\'. Por ejemplo: \'cn=profesores,ou=personal,o=miorg\'',
  'auth_ldap_attrcreators_key' => 'Creadores de atributo',
  'auth_ldap_auth_user_create_key' => 'Crear usuarios externamente',
  'auth_ldap_bind_dn' => 'Si quiere usar \'bind-user\' para buscar usuarios, especifíquelo aquí. Algo como \'cn=ldapuser,ou=public,o=org\'',
  'auth_ldap_bind_dn_key' => 'Nombre distinguido',
  'auth_ldap_bind_pw' => 'Contraseña para bind-user.',
  'auth_ldap_bind_pw_key' => 'Contraseña',
  'auth_ldap_bind_settings' => 'Fijar ajustes',
  'auth_ldap_contexts' => 'Lista de contextos donde están localizados los usuarios. Separe contextos diferentes con \';\'. Por ejemplo: \'ou=usuarios,o=org; ou=otros,o=org\'',
  'auth_ldap_contexts_key' => 'Contextos',
  'auth_ldap_create_context' => 'Si habilita la creación de usuario con confirmación por medio de correo electrónico, especifique el contexto en el que se crean los usuarios. Este contexto debe ser diferente de otros usuarios para prevenir problemas de seguridad. No es necesario añadir este contexto a Idap_context-variable, Moodle buscará automáticamente los usuarios de este contexto.',
  'auth_ldap_create_context_key' => 'Contexto para nuevos usuarios',
  'auth_ldap_create_error' => 'Error al crear usuario en LDAP.',
  'auth_ldap_creators' => 'Lista de grupos cuyos miembros están autorizados para crear nuevos cursos. Pueden separarse varios grupos con \';\'. Normalmente así: \'cn=teachers,ou=staff,o=myorg\'',
  'auth_ldap_creators_key' => 'Creadores',
  'auth_ldapdescription' => 'Este método proporciona identificación contra un servidor LDAP externo.
Si el nombre de usuario y contraseña facilitados son válidos, Moodle crea una nueva entrada para el usuario en su base de datos. Este módulo puede leer atributos de usuario desde LDAP y prerrellenar los campos requeridos en Moodle. Para las entradas sucesivas sólo se comprueba el usuario y la contraseña.',
  'auth_ldap_expiration_desc' => 'Seleccione No para deshabilitar comprobar si la contraseña ha caducado, o LDAP para leer el tiempo de caducidad de la contraseña directamente de LDAP.',
  'auth_ldap_expiration_key' => 'Expiración',
  'auth_ldap_expiration_warning_desc' => 'Número de días antes de que aparezca la advertencia de caducidad de la contraseña.',
  'auth_ldap_expiration_warning_key' => 'Advertencia de expiración',
  'auth_ldap_expireattr_desc' => 'Opcional: anula el atributo ldap que almacena el tiempo de caducidad de la contraseña PasswordExpirationTime',
  'auth_ldap_expireattr_key' => 'Atributo de expiración',
  'auth_ldapextrafields' => 'Estos campos son opcionales. Usted puede elegir pre-rellenar algunos campos de usuario en Moodle con información de los <strong>campos LDAP</strong> que especifique aquí. <p>Si deja estos campos en blanco, entonces no se transferirá nada desde LDAP y se usará el sistema predeterminado en Moodle.</p><p>En ambos casos, los usuarios podrán editar todos estos campos después de entrar.</p>',
  'auth_ldap_graceattr_desc' => 'Opcional: Anula el atributo gracelogin',
  'auth_ldap_gracelogin_key' => 'Atributo de entrada libre',
  'auth_ldap_gracelogins_desc' => 'Activar el soporte de entrada libre LDAP. Una ves que la contraseña ha caducado, el usuario puede entrar hasta que la cuenta de acceso libre llega a cero. Si se activa esta opción se mostrará un mensaje de acceso libre en el caso de que la contraseña haya caducado.',
  'auth_ldap_gracelogins_key' => 'Entradas libres',
  'auth_ldap_groupecreators' => 'Lista de grupos o contextos cuyos miembros están habilitados para crear grupos. Separe los grupos con \',\'. Por ejemplo: \'cn=profesores,ou=personal,o=miorg\'',
  'auth_ldap_groupecreators_key' => 'Creadores de grupo',
  'auth_ldap_host_url' => 'Especificar el host LDAP en forma de URL como \'ldap://ldap.myorg.com/\' o \'ldaps://ldap.myorg.com/\'',
  'auth_ldap_host_url_key' => 'URL  del host',
  'auth_ldap_changepasswordurl_key' => 'URL para cambio de contraseña',
  'auth_ldap_ldap_encoding' => 'Especifique la codificación usada por el servidor LDAP. Muy probablemente utf-8, MS AD v2 utiliza codificación de plataforma por defecto como cp1252, cp1250, etc.',
  'auth_ldap_ldap_encoding_key' => 'Codificación LDAP',
  'auth_ldap_login_settings' => 'Ajustes de entrada',
  'auth_ldap_memberattribute' => 'Especificar el atributo para nombre de usuario, cuando los usuarios se integran en un grupo. Normalmente \'miembro\'',
  'auth_ldap_memberattribute_isdn' => 'Opcional: Anula el manejo de valores de atributos de los miembros, es 0 ó 1',
  'auth_ldap_memberattribute_isdn_key' => 'Atributos de miembro utilizan dn',
  'auth_ldap_memberattribute_key' => 'Atributo de miembro',
  'auth_ldap_noconnect' => 'El módulo LDAP no se puede conectar al servidor: {$a}',
  'auth_ldap_noconnect_all' => 'El módulo LDAP no puede conectarse a ninguno de los servidores: {$a}',
  'auth_ldap_noextension' => '<em>Advertencia: El módulo LDAP de PHP no parece estar presente. Por favor asegúrese que esté instalado y activado.</em>',
  'auth_ldap_no_mbstring' => 'Necesita la extensión mbstring para crear usuarios en el Directorio Activo.',
  'auth_ldapnotinstalled' => 'No se puede utilizar identificación LDAP. El módulo LDAP de PHP no está instalado.',
  'auth_ldap_objectclass' => 'Filtro usado para usuarios name/search. Normalmente deberá ajustarlo a algo parecido a objectClass=posixAccount. Valores por defecto para objectClass=* que devolverán todos los objetos desde LDAP.',
  'auth_ldap_objectclass_key' => 'Clase de objetos',
  'auth_ldap_opt_deref' => 'Determina cómo se manejan los alias durante la búsqueda. Seleccione uno de los siguientes valores: "No" (LDAP_DEREF_NEVER) o "Sí" (LDAP_DEREF_ALWAYS)',
  'auth_ldap_opt_deref_key' => 'Dereferenciar los alias',
  'auth_ldap_passtype' => 'Especifique el formato de las contraseñas nuevas o cambiadas en el servidor LDAP',
  'auth_ldap_passtype_key' => 'Formato de contraseña',
  'auth_ldap_passwdexpire_settings' => 'Ajustes de caducidad de la contraseña LDAP.',
  'auth_ldap_preventpassindb' => 'Seleccione \'sí\' para evitar que las contraseñas se almacenen en la base de datos de Moodle.',
  'auth_ldap_preventpassindb_key' => 'Ocultar contraseñas',
  'auth_ldap_search_sub' => 'Ponga el valor <> 0 si quiere buscar usuarios desde subcontextos.',
  'auth_ldap_search_sub_key' => 'Buscar subcontextos',
  'auth_ldap_server_settings' => 'Ajustes de servidor LDAP',
  'auth_ldap_unsupportedusertype' => 'auth: ldap user_create() no admite el tipo de usuario seleccionado: usertype: {$a} (..aún)',
  'auth_ldap_update_userinfo' => 'Actualizar información del usuario (nombre, apellido, dirección..) desde LDAP a Moodle. Mire en /auth/ldap/attr_mappings.php para información de mapeado',
  'auth_ldap_user_attribute' => 'El atributo usado para nombrar/buscar usuarios. Normalmente \'cn\'.',
  'auth_ldap_user_attribute_key' => 'Atributo de usuario',
  'auth_ldap_user_exists' => 'Ya existe ese nombre de usuario LDAP',
  'auth_ldap_user_settings' => 'Ajustes de búsqueda de usuario',
  'auth_ldap_user_type' => 'Seleccione cómo se almacenarán los usuarios en LDAP. Este ajuste también especifica cómo funcionarán la caducidad del acceso, los accesos libres y la creación de usuarios.',
  'auth_ldap_user_type_key' => 'Tipo de usuario',
  'auth_ldap_usertypeundefined' => 'config.user_type no está definido o la función ldap_expirationtime2unix no admite el tipo seleccionado',
  'auth_ldap_usertypeundefined2' => 'config.user_type no está definido o la función ldap_unixi2expirationtime no admite el tipo seleccionado',
  'auth_ldap_version' => 'La versión del protocolo LDAP que su servidor está utilizando.',
  'auth_ldap_version_key' => 'Versión',
  'auth_ntlmsso' => 'NTLM SSO',
  'auth_ntlmsso_enabled' => 'Seleccione Sí para intentar Single Sign On con el dominio NTLM. <strong>Nota:</strong> esto requiere un ajuste adicional en el servidor web para trabajar; vea <a href="http://docs.moodle.org/en/NTLM_authentication">http://docs.moodle.org/en/NTLM_authentication</a>',
  'auth_ntlmsso_enabled_key' => 'Habilitar',
  'auth_ntlmsso_ie_fastpath' => 'Set to yes to enable the NTLM SSO fast path (bypasses certain steps and only works if the client\'s browser is MS Internet Explorer).',
  'auth_ntlmsso_ie_fastpath_key' => '¿Ruta rápida MS IE?',
  'auth_ntlmsso_subnet' => 'Si se selecciona, sólo intentará el SSO con clientes de esta sub-red. Formato: xxx.xxx.xxx.xxx/bitmask',
  'auth_ntlmsso_subnet_key' => 'Sub-red',
  'auth_ntlmsso_type_key' => 'Tipo de identificación',
  'auth_ntlmsso_type' => 'El método de autenticación configurado en el servidor Web para autentificar a los usuarios (en caso de duda, elija NTLM)',
  'connectingldap' => 'Conectando con el servidor LDAP ...',
  'creatingtemptable' => 'Creando la tabla temporal {$a}',
  'didntfindexpiretime' => 'password_expire() no ha encontrado la fecha de expiración.',
  'didntgetusersfromldap' => 'No se han conseguido usuarios de  LDAP -- error? -- saliendo',
  'gotcountrecordsfromldap' => 'Obtenidos {$a} registros de LDAP
',
  'morethanoneuser' => '¡Extraño! Se ha encontrado más de un registro de usuario en Idap. Se usa únicamente el primero.',
  'needbcmath' => 'Necesita la extensión BCMath para usar accesos de gracia con Active Directory',
  'needmbstring' => 'Necesita la extensión mbstring para cambiar contraseñas en Active Directory',
  'nodnforusername' => 'Error in user_update_password(). No DN para: {$a->username}',
  'noemail' => 'Se ha intentado enviarle un email sin éxito.',
  'notcalledfromserver' => '¡No debería llamarse desde el servidor web!',
  'noupdatestobedone' => 'No hay actualizaciones disponibles',
  'nouserentriestoremove' => 'No hay entradas de usuario para ser eliminadas',
  'nouserentriestorevive' => 'No hay entradas de usuario para ser recuperadas',
  'nouserstobeadded' => 'No hay usuarios que agregar',
  'ntlmsso_attempting' => 'Intentando Single Sign On vía NTLM...',
  'ntlmsso_failed' => 'Falló el acceso automático; intente con la página de acceso normal...',
  'ntlmsso_isdisabled' => 'NTLM SSO está desactivado.',
  'ntlmsso_unknowntype' => 'Tipo ntlmsso desconocido',
  'pluginname' => 'Usar un servidor LDAP',
  'pluginnotenabled' => 'El pugin no está habilitado',
  'renamingnotallowed' => 'El renombrado del nombre de usuario no está habilitado en LDAP',
  'rootdseerror' => 'Error al consultar rootDSE para el Directorio Activo',
  'updateremfail' => 'Error updating LDAP record. Error code: {$a->errno}; Error string: {$a->errstring}<br/>Key ({$a->key}) - old moodle value: \'{$a->ouvalue}\' new value: \'{$a->nuvalue}\'',
  'updateremfailamb' => 'Failed to update LDAP with ambiguous field {$a->key}; old moodle value: \'{$a->ouvalue}\', new value: \'{$a->nuvalue}\'',
  'updatepasserror' => 'Error in user_update_password(). Error code: {$a->errno}; Error string: {$a->errstring}',
  'updatepasserrorexpire' => 'Error in user_update_password() when reading password expiration time. Error code: {$a->errno}; Error string: {$a->errstring}',
  'updatepasserrorexpiregrace' => 'Error in user_update_password() when modifying expirationtime and/or gracelogins. Error code: {$a->errno}; Error string: {$a->errstring}',
  'updateusernotfound' => 'Could not find user while updating externally. Details follow: search base: \'{$a->userdn}\'; search filter: \'(objectClass=*)\'; search attributes: {$a->attribs}',
  'user_activatenotsupportusertype' => 'auth: la función de ldap user_activate() no admite el tipo de usuario seleccionado: {$a}',
  'user_disablenotsupportusertype' => 'auth: la función de ldap user_disable() no admite el tipo de usuario seleccionado: {$a}',
  'userentriestoadd' => 'Entradas de usuario a agregar: {$a}',
  'userentriestoremove' => 'Entradas del usuario a eliminar: {$a}',
  'userentriestorevive' => 'Entradas del usuario a recuperar: {$a}',
  'userentriestoupdate' => 'Entradas del usuario a actualizar: {$a}',
  'usernotfound' => 'El usuario no se encuentra en LDAP',
  'useracctctrlerror' => 'Error al obtener userAccountControl para {$a}',
);