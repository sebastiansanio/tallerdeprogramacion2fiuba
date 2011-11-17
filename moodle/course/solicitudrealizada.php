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
 * For most people, just lists the course categories
 * Allows the admin to create, delete and rename course categories
 *
 * @copyright 1999 Martin Dougiamas  http://dougiamas.com
 * @license http://www.gnu.org/copyleft/gpl.html GNU GPL v3 or later
 * @package course
 */

require_once("../config.php");
require_once("lib.php");

$categoryedit = optional_param('categoryedit', -1,PARAM_BOOL);
$delete   = optional_param('delete',0,PARAM_INT);
$courseid = required_param('id', PARAM_INT);
$hide     = optional_param('hide',0,PARAM_INT);
$show     = optional_param('show',0,PARAM_INT);
$move     = optional_param('move',0,PARAM_INT);
$moveto   = optional_param('moveto',-1,PARAM_INT);
$moveup   = optional_param('moveup',0,PARAM_INT);
$movedown = optional_param('movedown',0,PARAM_INT);

$site = get_site();

$systemcontext = get_context_instance(CONTEXT_SYSTEM);

$PAGE->set_url('/course/index.php');
$PAGE->set_context($systemcontext);
$PAGE->set_pagelayout('admin');

if (can_edit_in_category()) {
    if ($categoryedit !== -1) {
        $USER->editing = $categoryedit;
    }
    require_login();
    $adminediting = $PAGE->user_is_editing();
} else {
    if ($CFG->forcelogin) {
        require_login();
    }
    $adminediting = false;
}

$stradministration = get_string('administration');
$strcategories = 'Materias';
$strcategory = 'Materia';
$strcourses = get_string('courses');
$stredit = get_string('edit');
$strdelete = get_string('delete');
$straction = get_string('action');
$strfulllistofcourses = get_string('fulllistofcourses');


/// Unless it's an editing admin, just print the regular listing of courses/categories
/// Print form for creating new categories
    $countcategories = $DB->count_records('course_categories');

        $strcourses = get_string('courses');
        $strcategories = 'Materias';

        //$PAGE->navbar->add($strcategories);
        //$PAGE->set_title("$site->shortname: $strcategories");
        $PAGE->set_heading($COURSE->fullname);
        //$PAGE->set_button(update_category_button());
        echo $OUTPUT->header();
        echo $OUTPUT->heading($strcategories);
        echo $OUTPUT->skip_link_target();
        echo $OUTPUT->box_start('categorybox');
        //print_whole_category_list_solicitar();
		if(usuario_solicitomatriculacion($courseid)){
			echo "Ya tiene una solicitud de matriculacion pendiente.";
		} else {
			usuario_guardarsolicitud($courseid);
			echo "Se solicitado la matriculacion. Espere a ser matriculado por el mediador del curso.";
		}
        echo $OUTPUT->box_end();
        //print_course_search();

    echo $OUTPUT->container_start('buttons');
    if (has_capability('moodle/course:create', $systemcontext)) {
    /// Print link to create a new course
    /// Get the 1st available category
        $options = array('category' => $CFG->defaultrequestcategory);
        echo $OUTPUT->single_button(new moodle_url('edit.php', $options), get_string('addnewcourse'), 'get');
    }
    print_course_request_buttons($systemcontext);
    echo $OUTPUT->container_end();
    echo $OUTPUT->footer();
    exit;

//echo '</div>';

echo $OUTPUT->footer();

function print_category_edit($category, $displaylist, $parentslist, $depth=-1, $up=false, $down=false) {
/// Recursive function to print all the categories ready for editing

    global $CFG, $USER, $OUTPUT;

    static $str = NULL;

    if (is_null($str)) {
        $str = new stdClass;
        $str->edit     = get_string('edit');
        $str->delete   = get_string('delete');
        $str->moveup   = get_string('moveup');
        $str->movedown = get_string('movedown');
        $str->edit     = 'Editar materia';
        $str->hide     = get_string('hide');
        $str->show     = get_string('show');
        $str->cohorts  = get_string('cohorts', 'cohort');
        $str->spacer = $OUTPUT->spacer().' ';
    }

    if (!empty($category)) {

        if (!isset($category->context)) {
            $category->context = get_context_instance(CONTEXT_COURSECAT, $category->id);
        }

        echo '<tr><td align="left" class="name">';
        for ($i=0; $i<$depth;$i++) {
            echo '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
        }
        $linkcss = $category->visible ? '' : ' class="dimmed" ';
        echo '<a '.$linkcss.' title="'.$str->edit.'" '.
             ' href="category.php?id='.$category->id.'&amp;categoryedit=on&amp;sesskey='.sesskey().'">'.
             format_string($category->name).'</a>';
        echo '</td>';

        echo '<td class="count">'.$category->coursecount.'</td>';

        echo '<td class="icons">';    /// Print little icons

        if (has_capability('moodle/category:manage', $category->context)) {
            echo '<a title="'.$str->edit.'" href="editcategory.php?id='.$category->id.'"><img'.
                 ' src="'.$OUTPUT->pix_url('t/edit') . '" class="iconsmall" alt="'.$str->edit.'" /></a> ';

            echo '<a title="'.$str->delete.'" href="index.php?delete='.$category->id.'&amp;sesskey='.sesskey().'"><img'.
                 ' src="'.$OUTPUT->pix_url('t/delete') . '" class="iconsmall" alt="'.$str->delete.'" /></a> ';

/*            if (!empty($category->visible)) {
                echo '<a title="'.$str->hide.'" href="index.php?hide='.$category->id.'&amp;sesskey='.sesskey().'"><img'.
                     ' src="'.$OUTPUT->pix_url('t/hide') . '" class="iconsmall" alt="'.$str->hide.'" /></a> ';
            } else {
                echo '<a title="'.$str->show.'" href="index.php?show='.$category->id.'&amp;sesskey='.sesskey().'"><img'.
                     ' src="'.$OUTPUT->pix_url('t/show') . '" class="iconsmall" alt="'.$str->show.'" /></a> ';
            }

            if (has_capability('moodle/cohort:manage', $category->context) or has_capability('moodle/cohort:view', $category->context)) {
                echo '<a title="'.$str->cohorts.'" href="'.$CFG->wwwroot.'/cohort/index.php?contextid='.$category->context->id.'"><img'.
                     ' src="'.$OUTPUT->pix_url('i/cohort') . '" class="iconsmall" alt="'.$str->cohorts.'" /></a> ';
            }

            if ($up) {
                echo '<a title="'.$str->moveup.'" href="index.php?moveup='.$category->id.'&amp;sesskey='.sesskey().'"><img'.
                     ' src="'.$OUTPUT->pix_url('t/up') . '" class="iconsmall" alt="'.$str->moveup.'" /></a> ';
            } else {
                echo $str->spacer;
            }
            if ($down) {
                echo '<a title="'.$str->movedown.'" href="index.php?movedown='.$category->id.'&amp;sesskey='.sesskey().'"><img'.
                     ' src="'.$OUTPUT->pix_url('t/down') . '" class="iconsmall" alt="'.$str->movedown.'" /></a> ';
            } else {
                echo $str->spacer;
            }*/
        }
        echo '</td>';

/*        echo '<td align="left">';
        if (has_capability('moodle/category:manage', $category->context)) {
            $tempdisplaylist = $displaylist;
            unset($tempdisplaylist[$category->id]);
            foreach ($parentslist as $key => $parents) {
                if (in_array($category->id, $parents)) {
                    unset($tempdisplaylist[$key]);
                }
            }
            $popupurl = new moodle_url("index.php?move=$category->id&sesskey=".sesskey());
            $select = new single_select($popupurl, 'moveto', $tempdisplaylist, $category->parent, null, "moveform$category->id");
            echo $OUTPUT->render($select);
        }
        echo '</td>';*/
        echo '</tr>';
    } else {
        $category->id = '0';
    }

    if ($categories = get_categories($category->id)) {   // Print all the children recursively
        $countcats = count($categories);
        $count = 0;
        $first = true;
        $last = false;
        foreach ($categories as $cat) {
            $count++;
            if ($count == $countcats) {
                $last = true;
            }
            $up = $first ? false : true;
            $down = $last ? false : true;
            $first = false;

            print_category_edit($cat, $displaylist, $parentslist, $depth+1, $up, $down);
        }
    }
}

function usuario_solicitomatriculacion($courseid){
	global $USER, $DB;
	$sql = "
	SELECT *
	FROM {solicitud} u
	WHERE
		u.courseid=".$courseid."
		AND u.userid=".$USER->id;
	$availableusers = $DB->get_records_sql($sql);
	foreach($availableusers as $usercourse){
		return true;
	};
	return false;
}

function usuario_guardarsolicitud($courseid){
	global $USER, $DB;
	$sql = "INSERT INTO mdl_solicitud (userid, courseid)
VALUES (".$USER->id.",".$courseid.")";
	$con = mysql_connect($CFG->dbhost,$CFG->dbuser,$CFG->dbpass);
	mysql_select_db($CFG->dbname, $con);
	mysql_query($sql);
}