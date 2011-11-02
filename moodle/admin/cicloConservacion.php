<?php

require_once('../config.php');
require_once($CFG->libdir.'/adminlib.php');

$section = required_param('section', PARAM_SAFEDIR);
$return = optional_param('return','', PARAM_ALPHA);
$adminediting = optional_param('adminedit', -1, PARAM_BOOL);

/// no guest autologin
require_login(0, false);
$PAGE->set_context(get_context_instance(CONTEXT_SYSTEM));
$PAGE->set_url('/admin/settings.php', array('section' => $section));
$PAGE->set_pagetype('admin-setting-' . $section);
$PAGE->set_pagelayout('admin');
$PAGE->navigation->clear_cache();

$adminroot = admin_get_root(); // need all settings
$settingspage = $adminroot->locate($section, true);

if (empty($settingspage) or !($settingspage instanceof admin_settingpage)) {
    print_error('sectionerror', 'admin', "$CFG->wwwroot/$CFG->admin/");
    die;
}

if (!($settingspage->check_access())) {
    print_error('accessdenied', 'admin');
    die;
}

/// WRITING SUBMITTED DATA (IF ANY) -------------------------------------------------------------------------------

if ($PAGE->user_allowed_editing() && $adminediting != -1) {
    $USER->editing = $adminediting;
}

/// print header stuff ------------------------------------------------------------
if (empty($SITE->fullname)) {
    $PAGE->set_title($settingspage->visiblename);
    $PAGE->set_heading($settingspage->visiblename);

    echo $OUTPUT->header();
    echo $OUTPUT->box(get_string('configintrosite', 'admin'));
    
    if ($errormsg !== '') {
        echo $OUTPUT->notification($errormsg);

    } else if ($statusmsg !== '') {
        echo $OUTPUT->notification($statusmsg, 'notifysuccess');
    }

    // ---------------------------------------------------------------------------------------------------------------
   
} else {
    if ($PAGE->user_allowed_editing()) {
        $url = clone($PAGE->url);
        if ($PAGE->user_is_editing()) {
            $caption = get_string('blockseditoff');
            $url->param('adminedit', 'off');
        } else {
            $caption = get_string('blocksediton');
            $url->param('adminedit', 'on');
        }
        $buttons = $OUTPUT->single_button($url, $caption, 'get');
    }

    $visiblepathtosection = array_reverse($settingspage->visiblepath);

    $PAGE->set_title("$SITE->shortname: " . implode(": ",$visiblepathtosection));
    $PAGE->set_heading($SITE->fullname);
    //$PAGE->set_button($buttons);
    echo $OUTPUT->header();

    if ($errormsg !== '') {
        echo $OUTPUT->notification($errormsg);

    } else if ($statusmsg !== '') {
        echo $OUTPUT->notification($statusmsg, 'notifysuccess');
    }

    // ---------------------------------------------------------------------------------------------------------------

}

$con = mysql_connect("localhost","root","");
mysql_select_db("moodle", $con);
$query = "SELECT duracion FROM ciclo_conservacion";
$resultado = mysql_query($query);
$fila = mysql_fetch_array($resultado);
$duracionCiclo = $fila['duracion'];
$msgActualizacion = "";

if ( ($_POST['duracion'] != $duracionCiclo) && ($_POST['duracion']) ){
      //Compruebo si es un valor numérico
      if (!is_numeric($_POST['duracion'])) {
        $msgActualizacion = "<p style='color:red'><b>La duraci&#243n no ha sido actualizada, ingrese un valor valido</b></p>";
      }
      else {
        $query = 'UPDATE ciclo_conservacion SET duracion='.$_POST['duracion'];
        mysql_query($query);
        $duracionCiclo = $_POST['duracion'];
        $msgActualizacion = "<p style='color:green'><b>La duraci&#243n ha sido actualizada satisfactoriamente</b></p>";
      }
}

echo '<p><form action="cicloConservacion.php?section=coursesettings" method="post">
<b>Duraci&#243n del ciclo de conservaci&#243n de calificaciones (en cuatrimestres):</b> <input type="text" name="duracion" value="'.$duracionCiclo.'" size="2" />
<input type="submit" value="Actualizar" />
</form></p>';
echo $msgActualizacion;

echo $OUTPUT->footer();


