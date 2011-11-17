<?php

// This file is part of Moodle - http://moodle.org/
//
// Moodle is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// Moodle is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Moodle.  If not, see <http://www.gnu.org/licenses/>.

require_once '../../../config.php';
require_once $CFG->libdir.'/gradelib.php';
require_once $CFG->dirroot.'/grade/lib.php';
require_once $CFG->dirroot.'/grade/report/grader/lib.php';

$courseid      = required_param('id', PARAM_INT);        // course id

$PAGE->set_url(new moodle_url('/grade/report/grader/calificacionesAnteriores.php', array('id'=>$courseid)));

/// basic access checks
if (!$course = $DB->get_record('course', array('id' => $courseid))) {
    print_error('nocourseid');
}
require_login($course);
$context = get_context_instance(CONTEXT_COURSE, $course->id);

require_capability('gradereport/grader:view', $context);
require_capability('moodle/grade:viewall', $context);

/// Print header
print_grade_page_head($COURSE->id, 'report', 'grader', $reportname, false, $buttons);

//Leer duracion del ciclo de conservacion
global $CFG, $USER;
$con = mysql_connect($CFG->dbhost,$CFG->dbuser,$CFG->dbpass);
mysql_select_db($CFG->dbname, $con);
$query = "SELECT duracion FROM ciclo_conservacion";
$resultado = mysql_query($query);
$fila = mysql_fetch_array($resultado);
$duracionCiclo = $fila['duracion'];

//Calcular fecha de inicio de notas conservadas a mostrar
$fechaInicio = date('Y-m-d',$course->startdate);
$query = "SELECT num_cuat, ano FROM cuatrimestres WHERE fecha_inicio=\"".$fechaInicio."\"";
$resultado = mysql_query($query);
$fila = mysql_fetch_array($resultado);
$ano = $fila['ano']; $numCuat = $fila['num_cuat'];

$anoInicial = $ano - floor( $duracionCiclo/2 );
$cuatInicial = $numCuat;
if( $duracionCiclo % 2 == 1 ){
    if ( $cuatInicial == 1 ){
          $cuatInicial = 2;
    }
    else{
          $cuatInicial = 1;
    }
}

//Obtener las notas conservadas
$query = "SELECT num_cuat, ano, nombre, calificacion FROM calificaciones WHERE courseID=".$courseid." AND (ano>".$anoInicial." OR (ano=".$anoInicial." AND num_cuat>=".$cuatInicial.")) ORDER BY ano, num_cuat, nombre";
$resultado = mysql_query($query);

echo "<p>";
echo "<table border='1'>
<tr>
<th>A&#241o</th>
<th>Cuatrimestre</th>
<th>Nombre</th>
<th>Calificaci&#243n</th>
</tr>";

while($row = mysql_fetch_array($resultado))
  {
  echo "<tr>";
  echo "<td style='text-align:center'>" . $row['ano'] . "</td>";
  echo "<td style='text-align:center'>" . $row['num_cuat'] . "</td>";
  echo "<td style='text-align:center'>" . $row['nombre'] . "</td>";
  echo "<td style='text-align:center'>" . $row['calificacion'] . "</td>";
  echo "</tr>";
  }
echo "</table>";
echo "</p>";

mysql_close($con);


//Initialise the grader report object that produces the table
//the class grade_report_grader_ajax was removed as part of MDL-21562

echo $OUTPUT->footer();
