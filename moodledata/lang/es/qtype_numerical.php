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

/**
 * Strings for component 'qtype_numerical', language 'es', branch 'MOODLE_21_STABLE'
 *
 * @package   qtype_numerical
 * @copyright 1999 onwards Martin Dougiamas  {@link http://moodle.com}
 * @license   http://www.gnu.org/copyleft/gpl.html GNU GPL v3 or later
 */

$string['addingnumerical'] = 'Agregando una pregunta numérica';
$string['addmoreanswerblanks'] = 'Espacios en blanco para {no} opciones más';
$string['addmoreunitblanks'] = 'Espacios en blanco para {no} unidades más';
$string['answermustbenumberorstar'] = 'La respuesta debe ser un número, o \'*\'.';
$string['answerno'] = 'Respuesta {$a}';
$string['decfractionofquestiongrade'] = 'como fracción decimal (0-1) de la calificación de de la pregunta';
$string['decfractionofresponsegrade'] = 'como fracción decimal (0-1) de la calificación de la respuesta';
$string['decimalformat'] = 'decimales';
$string['editableunittext'] = 'Texto';
$string['editingnumerical'] = 'Editando una pregunta numérica';
$string['errornomultiplier'] = 'Debe especificar un multiplicador para esta unidad.';
$string['errorrepeatedunit'] = 'No puede tener dos unidades con el mismo nombre.';
$string['geometric'] = 'Geométrica';
$string['invalidnumerictolerance'] = 'Uno de los valores de tolerancia introducidos no es un número válido.';
$string['leftexample'] = 'IZQUIERDA como $1.00';
$string['manynumerical'] = 'Se calificará la RESPUESTA NUMÉRICA + UNIDAD, siendo opcional la última.';
$string['multiplier'] = 'Multiplicador';
$string['nominal'] = 'Nominal';
$string['noneditableunittext'] = 'Texto de la Unidad Nº 1 NO editable';
$string['nonvalidcharactersinnumber'] = 'Caracteres NO válidos en el número';
$string['notenoughanswers'] = 'Debe escribir al menos una respuesta.';
$string['numerical'] = 'Numérica';
$string['numerical_help'] = 'Desde la perspectiva del alumno, una pregunta numérica es muy semejante a una pregunta de respuesta corta. La diferencia es que a las respuestas numéricas se les permite tener un margen de error. Esto permite evaluar la respuesta debtro de un rango fijo. Por ejemplo, si la respuesta es 10, con un margen de error de 2, entonces cualquier número entre 8 y 12 se aceptará como correcto.';
$string['numericalmultiplier'] = 'Multiplicador';
$string['numericalmultiplier_help'] = 'El multiplicador es el factor por el que la respuesta-numérica correcta se multiplica. 
<br>La primera unidad (\'Unidad 1\') tiene un valor multiplicador predeterminado de 1. Así, por ejemplo, si la respuesta-numérica correcta es de 5500 W y se establece W (vatio) como unidad en \'Unidad 1\' que tiene 1 como multiplicador predeterminado, la respuesta correcta es 5500 W. 
<br>Si se agrega la unidad kW (kilovatio) con un multiplicador de 0,001, entonces 5,5kW será también una respuesta correcta. Esto significa que tanto 5500W como 5.5kW se consideran correctas. 
<br>Tenga en cuenta que el margen de error aceptado también se multiplica, por lo que un error permitido de 100 W se convertiría en un error de 0.1kW.';
$string['numericalsummary'] = 'Permite una respuesta numérica (con posibilidad de especificar las unidades) que es calificada comparándola con distintas respuestas modelo (es posible incluir márgenes de tolerancia).';
$string['oneunitshown'] = 'Sólo la RESPUESTA-NUMÉRICA se calificará, mostrándose como unidad la especificada en \'Unidad 1\'';
$string['onlynumerical'] = 'Sólo la RESPUESTA-NUMÉRICA se calificará, no permitiéndose unidades';
$string['pleaseenterananswer'] = 'Por favor, escriba una respuesta.';
$string['relative'] = 'Relativa';
$string['rightexample'] = 'DERECHA, como 1.00cm';
$string['selectunit'] = 'Seleccione una unidad';
$string['selectunits'] = 'Seleccione uidades';
$string['studentunitanswer'] = 'RESPUESTA-UNIDAD mostrada como una';
$string['tolerancetype'] = 'Tipo de tolerancia';
$string['unit'] = 'Unidad';
$string['unitappliedpenalty'] = 'Estas marcas incluyen una penalización de {$a} por unidad incorrecta';
$string['unitchoice'] = 'Elección múltiple';
$string['unitedit'] = 'Editar unidad';
$string['unitgraded'] = 'La RESPUESTA-NUMÉRICA y las UNIDADES se calificarán';
$string['unithandling'] = 'Tratamiento de las unidades';
$string['unithdr'] = 'Unidad {$a}';
$string['unitincorrect'] = 'No ha proporcionado la unidad correcta.';
$string['unitmandatory'] = 'Obligatorio';
$string['unitmandatory_help'] = '* La respuesta se calificará usando la unidad escrita.
<br> * La penalización se aplicará si el campo de la unidad está vacío';
$string['unitnotselected'] = 'No se ha seleccionado unidad';
$string['unitonerequired'] = 'Debe escribir al menos una unidad';
$string['unitoptional'] = 'Unidad opcional';
$string['unitoptional_help'] = '* Si el campo de unidad no está vacío, la respuesta será calificada considerando también la unidad.
* Si la unidad está mal escrita o es desconocida la respuesta será considerada como no válida.';
$string['unitpenalty'] = 'Penalización de unidad';
$string['unitpenalty_help'] = 'La penalización se aplica si 
* Se escribe un nombre de unidad sin definir en el campo de respuesta-unidad o 
* Se escribe un nombre de unidad en el campo de respuesta-numérica';
$string['unitposition'] = 'Posición de unidad';
$string['unitselect'] = 'menú emergente';
$string['validnumberformats'] = 'Formatos de número válidos';
$string['validnumberformats_help'] = '* números regulares 13500.67, 13 500.67, 13500,67 or 13 500,67

* si usa coma (,) como separador de miles, use SIEMPRE el punto (.) decimal, por ejemplo:
 13,500.67 : 13,500.

* para la forma exponencial, digamos 1.350067 * 10<sup>4</sup>, utilice
 1.350067 E4 : 1.350067 E04';
$string['validnumbers'] = '13500.67, 13 500.67, 13,500.67, 13500,67, 13 500,67, 1.350067 E4 or 1.350067 E04';
