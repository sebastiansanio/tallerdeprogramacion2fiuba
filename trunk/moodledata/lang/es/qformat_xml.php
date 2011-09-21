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
 * Strings for component 'qformat_xml', language 'es', branch 'MOODLE_21_STABLE'
 *
 * @package   qformat_xml
 * @copyright 1999 onwards Martin Dougiamas  {@link http://moodle.com}
 * @license   http://www.gnu.org/copyleft/gpl.html GNU GPL v3 or later
 */

$string['invalidxml'] = 'Archivo XML no válido - se espera una cadena (¿utiliza CDATA?)';
$string['pluginname'] = 'Formato Moodle XML';
$string['truefalseimporterror'] = '<b> ¡Atención! </ b>: La pregunta de tipo verdadero/falso \'{$ a-> questionText}\' no pudo ser importada correctamente. No estaba claro si la respuesta correcta era Verdadero o Falso. La pregunta se ha importado suponiendo de que la respuesta es \'{$a->answer}\'. Si esto no es correcto, tendrá que editar la pregunta.';
$string['unsupportedexport'] = 'El tipo de pregunta {$a} no es admitido por XML export';
$string['xml'] = 'Formato XML Moodle';
$string['xml_help'] = 'Es un formato específico de Moodle para importar y exportar preguntas.';
$string['xmlimportnoname'] = 'Falta nombre de pregunta en el archivo XML';
$string['xmlimportnoquestion'] = 'No se encuentra el texto de la pregunta en el fichero XML';
$string['xmltypeunsupported'] = 'El tipo de pregunta {$a} no es admitido por XML import';
