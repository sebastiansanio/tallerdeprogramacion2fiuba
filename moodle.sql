-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 07-10-2011 a las 20:41:36
-- Versión del servidor: 5.5.16
-- Versión de PHP: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `moodle`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_assignment`
--

CREATE TABLE IF NOT EXISTS `mdl_assignment` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` text COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  `assignmenttype` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `resubmit` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `preventlate` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `emailteachers` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `var1` bigint(10) DEFAULT '0',
  `var2` bigint(10) DEFAULT '0',
  `var3` bigint(10) DEFAULT '0',
  `var4` bigint(10) DEFAULT '0',
  `var5` bigint(10) DEFAULT '0',
  `maxbytes` bigint(10) unsigned NOT NULL DEFAULT '100000',
  `timedue` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeavailable` bigint(10) unsigned NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assi_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines assignments' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_assignment_submissions`
--

CREATE TABLE IF NOT EXISTS `mdl_assignment_submissions` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `numfiles` bigint(10) unsigned NOT NULL DEFAULT '0',
  `data1` text COLLATE utf8_unicode_ci,
  `data2` text COLLATE utf8_unicode_ci,
  `grade` bigint(11) NOT NULL DEFAULT '0',
  `submissioncomment` text COLLATE utf8_unicode_ci NOT NULL,
  `format` smallint(4) unsigned NOT NULL DEFAULT '0',
  `teacher` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemarked` bigint(10) unsigned NOT NULL DEFAULT '0',
  `mailed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assisubm_use_ix` (`userid`),
  KEY `mdl_assisubm_mai_ix` (`mailed`),
  KEY `mdl_assisubm_tim_ix` (`timemarked`),
  KEY `mdl_assisubm_ass_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Info about submitted assignments' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_backup_controllers`
--

CREATE TABLE IF NOT EXISTS `mdl_backup_controllers` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `backupid` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `operation` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'backup',
  `type` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) unsigned NOT NULL,
  `format` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `interactive` smallint(4) unsigned NOT NULL,
  `purpose` smallint(4) unsigned NOT NULL,
  `userid` bigint(10) unsigned NOT NULL,
  `status` smallint(4) unsigned NOT NULL,
  `execution` smallint(4) unsigned NOT NULL,
  `executiontime` bigint(10) unsigned NOT NULL,
  `checksum` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) unsigned NOT NULL,
  `timemodified` bigint(10) unsigned NOT NULL,
  `controller` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_backcont_bac_uix` (`backupid`),
  KEY `mdl_backcont_typite_ix` (`type`,`itemid`),
  KEY `mdl_backcont_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To store the backup_controllers as they are used' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_backup_courses`
--

CREATE TABLE IF NOT EXISTS `mdl_backup_courses` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `laststarttime` bigint(10) unsigned NOT NULL DEFAULT '0',
  `lastendtime` bigint(10) unsigned NOT NULL DEFAULT '0',
  `laststatus` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `nextstarttime` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_backcour_cou_uix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To store every course backup status' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_backup_files`
--

CREATE TABLE IF NOT EXISTS `mdl_backup_files` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `backup_code` bigint(10) unsigned NOT NULL DEFAULT '0',
  `file_type` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `old_id` bigint(10) unsigned NOT NULL DEFAULT '0',
  `new_id` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_backfile_bacfilpat_uix` (`backup_code`,`file_type`,`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To store and recode ids to user and course files' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_backup_files_template`
--

CREATE TABLE IF NOT EXISTS `mdl_backup_files_template` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `backupid` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contextid` bigint(10) unsigned NOT NULL,
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `filearea` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) unsigned NOT NULL,
  `info` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_backfiletemp_bacconcomf_ix` (`backupid`,`contextid`,`component`,`filearea`,`itemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To store files along the backup process. Note this table isn' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_backup_ids`
--

CREATE TABLE IF NOT EXISTS `mdl_backup_ids` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `backup_code` bigint(12) unsigned NOT NULL DEFAULT '0',
  `table_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `old_id` bigint(10) unsigned NOT NULL DEFAULT '0',
  `new_id` bigint(10) unsigned NOT NULL DEFAULT '0',
  `info` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_backids_bactabold_uix` (`backup_code`,`table_name`,`old_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To store and convert ids in backup/restore' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_backup_ids_template`
--

CREATE TABLE IF NOT EXISTS `mdl_backup_ids_template` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `backupid` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemname` varchar(160) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) unsigned NOT NULL,
  `newitemid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `parentitemid` bigint(10) unsigned DEFAULT NULL,
  `info` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_backidstemp_baciteite_uix` (`backupid`,`itemname`,`itemid`),
  KEY `mdl_backidstemp_bacitepar_ix` (`backupid`,`itemname`,`parentitemid`),
  KEY `mdl_backidstemp_bacitenew_ix` (`backupid`,`itemname`,`newitemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To store all sort of ids along the backup process. Note this' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_backup_log`
--

CREATE TABLE IF NOT EXISTS `mdl_backup_log` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `time` bigint(10) unsigned NOT NULL DEFAULT '0',
  `laststarttime` bigint(10) unsigned NOT NULL DEFAULT '0',
  `info` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `backuptype` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_backlog_cou_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To store every course backup log info' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_backup_logs`
--

CREATE TABLE IF NOT EXISTS `mdl_backup_logs` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `backupid` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `loglevel` smallint(4) unsigned NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_backlogs_bacid_uix` (`backupid`,`id`),
  KEY `mdl_backlogs_bac_ix` (`backupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To store all the logs from backup and restore operations (by' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_block`
--

CREATE TABLE IF NOT EXISTS `mdl_block` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `version` bigint(10) unsigned NOT NULL DEFAULT '0',
  `cron` bigint(10) unsigned NOT NULL DEFAULT '0',
  `lastcron` bigint(10) unsigned NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_bloc_nam_uix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='contains all installed blocks' AUTO_INCREMENT=40 ;

--
-- Volcado de datos para la tabla `mdl_block`
--

INSERT INTO `mdl_block` (`id`, `name`, `version`, `cron`, `lastcron`, `visible`) VALUES
(1, 'activity_modules', 2007101509, 0, 0, 1),
(2, 'admin_bookmarks', 2007101509, 0, 0, 0),
(3, 'blog_menu', 2009071700, 0, 0, 0),
(4, 'blog_recent', 2009070900, 0, 0, 0),
(5, 'blog_tags', 2007101509, 0, 0, 0),
(6, 'calendar_month', 2007101509, 0, 0, 0),
(7, 'calendar_upcoming', 2007101509, 0, 0, 0),
(8, 'comments', 2009072000, 0, 0, 1),
(9, 'community', 2010042701, 0, 0, 1),
(10, 'completionstatus', 2009072800, 0, 0, 1),
(11, 'course_list', 2007101509, 0, 0, 1),
(12, 'course_overview', 2010021100, 0, 0, 1),
(13, 'course_summary', 2007101509, 0, 0, 1),
(14, 'feedback', 2010050200, 0, 0, 0),
(15, 'glossary_random', 2007101509, 0, 0, 1),
(16, 'html', 2010071900, 0, 0, 1),
(17, 'login', 2007101509, 0, 0, 1),
(18, 'mentees', 2007101509, 0, 0, 1),
(19, 'messages', 2007101509, 0, 0, 1),
(20, 'mnet_hosts', 2010112900, 0, 0, 1),
(21, 'myprofile', 2009123100, 0, 0, 1),
(22, 'navigation', 2010091400, 0, 0, 1),
(23, 'news_items', 2007101509, 0, 0, 1),
(24, 'online_users', 2007101510, 0, 0, 1),
(25, 'participants', 2007101509, 0, 0, 1),
(26, 'private_files', 2010030100, 0, 0, 1),
(27, 'quiz_results', 2007101509, 0, 0, 1),
(28, 'recent_activity', 2007101509, 0, 0, 0),
(29, 'rss_client', 2009072901, 300, 0, 0),
(30, 'search', 2010111100, 1, 0, 0),
(31, 'search_forums', 2007101509, 0, 0, 1),
(32, 'section_links', 2007101511, 0, 0, 1),
(33, 'selfcompletion', 2009072800, 0, 0, 1),
(34, 'settings', 2010091400, 0, 0, 1),
(35, 'site_main_menu', 2007101509, 0, 0, 1),
(36, 'social_activities', 2007101509, 0, 0, 1),
(37, 'tag_flickr', 2007101509, 0, 0, 1),
(38, 'tag_youtube', 2007101509, 0, 0, 1),
(39, 'tags', 2010090502, 0, 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_block_community`
--

CREATE TABLE IF NOT EXISTS `mdl_block_community` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL,
  `coursename` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `coursedescription` longtext COLLATE utf8_unicode_ci,
  `courseurl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `imageurl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Community block' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_block_instances`
--

CREATE TABLE IF NOT EXISTS `mdl_block_instances` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `blockname` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `parentcontextid` bigint(10) unsigned NOT NULL,
  `showinsubcontexts` smallint(4) NOT NULL,
  `pagetypepattern` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subpagepattern` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `defaultregion` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `defaultweight` bigint(10) NOT NULL,
  `configdata` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_blocinst_parshopagsub_ix` (`parentcontextid`,`showinsubcontexts`,`pagetypepattern`,`subpagepattern`),
  KEY `mdl_blocinst_par_ix` (`parentcontextid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table stores block instances. The type of block this is' AUTO_INCREMENT=28 ;

--
-- Volcado de datos para la tabla `mdl_block_instances`
--

INSERT INTO `mdl_block_instances` (`id`, `blockname`, `parentcontextid`, `showinsubcontexts`, `pagetypepattern`, `subpagepattern`, `defaultregion`, `defaultweight`, `configdata`) VALUES
(1, 'site_main_menu', 2, 0, 'site-index', NULL, 'side-pre', -1, ''),
(2, 'course_summary', 2, 0, 'site-index', NULL, 'side-post', 0, ''),
(4, 'navigation', 1, 1, '*', NULL, 'side-pre', 0, 'Tzo4OiJzdGRDbGFzcyI6NTp7czoxMDoiZW5hYmxlZG9jayI7czozOiJ5ZXMiO3M6MTQ6ImxpbmtjYXRlZ29yaWVzIjtzOjI6Im5vIjtzOjg6InRyaW1tb2RlIjtzOjE6IjEiO3M6MTA6InRyaW1sZW5ndGgiO2k6NTA7czoxNDoiZXhwYW5zaW9ubGltaXQiO3M6MToiMCI7fQ=='),
(5, 'settings', 1, 1, '*', NULL, 'side-pre', 1, ''),
(6, 'admin_bookmarks', 1, 0, 'admin-*', NULL, 'side-pre', 0, ''),
(7, 'private_files', 1, 0, 'my-index', '2', 'side-post', 0, ''),
(8, 'online_users', 1, 0, 'my-index', '2', 'side-post', 1, ''),
(9, 'course_overview', 1, 0, 'my-index', '2', 'content', 0, ''),
(10, 'html', 1, 1, '*', NULL, 'side-pre', 0, 'Tzo4OiJzdGRDbGFzcyI6Mzp7czo1OiJ0aXRsZSI7czoxMzoiQWRtaW5pc3RyYWRvciI7czo2OiJmb3JtYXQiO3M6MToiMSI7czo0OiJ0ZXh0IjtzOjUzNjoiPHVsPg0KPGxpPjxhIGhyZWY9Imh0dHA6Ly9sb2NhbGhvc3QvIj5QYWdpbmEgcHJpbmNpcGFsPC9hPjwvbGk+DQo8bGk+PGEgaHJlZj0iaHR0cDovL2xvY2FsaG9zdC9tb2QvZm9ydW0vdmlldy5waHA/aWQ9MSI+Q2FydGVsZXJhPC9hPjwvbGk+DQo8bGk+PGEgaHJlZj0iaHR0cDovL2xvY2FsaG9zdC9hZG1pbi9zZXR0aW5ncy5waHA/c2VjdGlvbj1jb3Vyc2VzZXR0aW5ncyI+Q29uZmlndXJhY2lvbjwvYT48L2xpPg0KPGxpPjxhIGhyZWY9Imh0dHA6Ly9sb2NhbGhvc3QvY291cnNlLyI+TWF0ZXJpYXM8L2E+PC9saT4NCjxsaT48YSBocmVmPSJodHRwOi8vbG9jYWxob3N0L2FkbWluL3VzZXIucGhwIj5NaWVtYnJvczwvYT48L2xpPg0KPGxpPjxhIGhyZWY9Imh0dHA6Ly9sb2NhbGhvc3QvYWRtaW4vcm9sZXMvYXNzaWduLnBocD9jb250ZXh0aWQ9MSI+QXNpZ25hciByb2xlczwvYT48L2xpPg0KPGxpPjxhIGhyZWY9Imh0dHA6Ly9sb2NhbGhvc3QvY291cnNlL2Vucm9sbWVudC5waHAiPkFzaWduYXIgbWVkaWFkb3JlczwvYT48L2xpPg0KPC91bD4iO30='),
(11, 'search_forums', 24, 0, 'course-view-*', NULL, 'side-post', 0, ''),
(12, 'news_items', 24, 0, 'course-view-*', NULL, 'side-post', 1, ''),
(14, 'recent_activity', 24, 0, 'course-view-*', NULL, 'side-post', 3, ''),
(15, 'course_list', 1, 1, '*', NULL, 'side-pre', 5, 'Tzo4OiJzdGRDbGFzcyI6MDp7fQ=='),
(16, 'html', 1, 1, '*', NULL, 'side-pre', 0, 'Tzo4OiJzdGRDbGFzcyI6Mzp7czo1OiJ0aXRsZSI7czo5OiJWaXNpdGFudGUiO3M6NjoiZm9ybWF0IjtzOjE6IjEiO3M6NDoidGV4dCI7czoxOTk6Ijx1bD4NCjxsaT48YSBocmVmPSJodHRwOi8vbG9jYWxob3N0LyI+UGFnaW5hIHByaW5jaXBhbDwvYT48L2xpPg0KPGxpPjxhIGhyZWY9Imh0dHA6Ly9sb2NhbGhvc3QvbG9naW4vIj5Db25lY3RhcnNlPC9hPjwvbGk+DQo8bGk+PGEgaHJlZj0iaHR0cDovL2xvY2FsaG9zdC9sb2dpbi9zaWdudXAucGhwIj5SZWdpc3RyYXJzZTwvYT48L2xpPg0KPC91bD4iO30='),
(17, 'html', 1, 1, '*', NULL, 'side-post', 1, 'Tzo4OiJzdGRDbGFzcyI6Mzp7czo1OiJ0aXRsZSI7czo3OiJNaWVtYnJvIjtzOjY6ImZvcm1hdCI7czoxOiIxIjtzOjQ6InRleHQiO3M6NzA6Ijx1bD4NCjxsaT48YSBocmVmPSJodHRwOi8vbG9jYWxob3N0LyI+UGFnaW5hIHByaW5jaXBhbDwvYT48L2xpPg0KPC91bD4iO30='),
(18, 'html', 1, 1, '*', NULL, 'side-post', 1, 'Tzo4OiJzdGRDbGFzcyI6Mzp7czo1OiJ0aXRsZSI7czo4OiJBcHJlbmRpeiI7czo2OiJmb3JtYXQiO3M6MToiMSI7czo0OiJ0ZXh0IjtzOjE1MzoiPHVsPg0KPGxpPjxhIGhyZWY9Imh0dHA6Ly9sb2NhbGhvc3QvIj5QYWdpbmEgcHJpbmNpcGFsPC9hPjwvbGk+DQo8bGk+PGEgaHJlZj0iaHR0cDovL2xvY2FsaG9zdC9jb3Vyc2Uvc29saWNpdHVkLnBocCI+UmVnaXN0cmFyc2UgZW4gY3Vyc288L2E+PC9saT4NCjwvdWw+Ijt9'),
(19, 'html', 1, 1, '*', NULL, 'side-post', 1, 'Tzo4OiJzdGRDbGFzcyI6Mzp7czo1OiJ0aXRsZSI7czo4OiJNZWRpYWRvciI7czo2OiJmb3JtYXQiO3M6MToiMSI7czo0OiJ0ZXh0IjtzOjE4ODoiPHVsPg0KPGxpPjxhIGhyZWY9Imh0dHA6Ly9sb2NhbGhvc3QvIj5QYWdpbmEgcHJpbmNpcGFsPC9hPjwvbGk+DQo8bGk+PGEgaHJlZj0iIyI+TWlzIGN1cnNvczwvYT48L2xpPg0KPGxpPjxhIGhyZWY9Imh0dHA6Ly9sb2NhbGhvc3QvY291cnNlL2Vucm9sbWVudC5waHAiPkFncmVnYXIgYXByZW5kaWNlczwvYT48L2xpPg0KPC91bD4iO30='),
(20, 'search_forums', 40, 0, 'course-view-*', NULL, 'side-post', 0, ''),
(21, 'news_items', 40, 0, 'course-view-*', NULL, 'side-post', 1, ''),
(22, 'calendar_upcoming', 40, 0, 'course-view-*', NULL, 'side-post', 2, ''),
(23, 'recent_activity', 40, 0, 'course-view-*', NULL, 'side-post', 3, ''),
(25, 'news_items', 46, 0, 'course-view-*', NULL, 'side-post', 1, ''),
(26, 'calendar_upcoming', 46, 0, 'course-view-*', NULL, 'side-post', 2, ''),
(27, 'recent_activity', 46, 0, 'course-view-*', NULL, 'side-post', 3, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_block_instance_old`
--

CREATE TABLE IF NOT EXISTS `mdl_block_instance_old` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `oldid` bigint(10) unsigned NOT NULL,
  `blockid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `pageid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `pagetype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `position` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `weight` smallint(3) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '0',
  `configdata` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_blocinstold_pag_ix` (`pageid`),
  KEY `mdl_blocinstold_pag2_ix` (`pagetype`),
  KEY `mdl_blocinstold_blo_ix` (`blockid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='backup of 1.9 block instances - to be deleted' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_block_pinned_old`
--

CREATE TABLE IF NOT EXISTS `mdl_block_pinned_old` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `blockid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `pagetype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `position` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `weight` smallint(3) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '0',
  `configdata` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_blocpinnold_pag_ix` (`pagetype`),
  KEY `mdl_blocpinnold_blo_ix` (`blockid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='backup of 1.9 pinned blocks - to be deleted' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_block_positions`
--

CREATE TABLE IF NOT EXISTS `mdl_block_positions` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `blockinstanceid` bigint(10) unsigned NOT NULL,
  `contextid` bigint(10) unsigned NOT NULL,
  `pagetype` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subpage` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `visible` smallint(4) NOT NULL,
  `region` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `weight` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_blocposi_bloconpagsub_uix` (`blockinstanceid`,`contextid`,`pagetype`,`subpage`),
  KEY `mdl_blocposi_blo_ix` (`blockinstanceid`),
  KEY `mdl_blocposi_con_ix` (`contextid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the position of a sticky block_instance on a another ' AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `mdl_block_positions`
--

INSERT INTO `mdl_block_positions` (`id`, `blockinstanceid`, `contextid`, `pagetype`, `subpage`, `visible`, `region`, `weight`) VALUES
(1, 4, 2, 'site-index', '', 1, 'side-pre', -1),
(2, 5, 2, 'site-index', '', 1, 'side-pre', 4),
(3, 15, 2, 'site-index', '', 1, 'side-pre', 3),
(4, 10, 2, 'site-index', '', 1, 'side-pre', -6),
(5, 17, 2, 'site-index', '', 1, 'side-pre', -5),
(6, 18, 2, 'site-index', '', 1, 'side-pre', -4),
(7, 16, 2, 'site-index', '', 1, 'side-pre', -3),
(8, 19, 2, 'site-index', '', 1, 'side-pre', -2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_block_rss_client`
--

CREATE TABLE IF NOT EXISTS `mdl_block_rss_client` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `preferredtitle` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `shared` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Remote news feed information. Contains the news feed id, the' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_block_search_documents`
--

CREATE TABLE IF NOT EXISTS `mdl_block_search_documents` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `docid` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `doctype` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `itemtype` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'standard',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `docdate` bigint(10) unsigned NOT NULL DEFAULT '0',
  `updated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `courseid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `groupid` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_blocseardocu_doc_ix` (`docid`),
  KEY `mdl_blocseardocu_doc2_ix` (`doctype`),
  KEY `mdl_blocseardocu_ite_ix` (`itemtype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='table to store search index backups' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_blog_association`
--

CREATE TABLE IF NOT EXISTS `mdl_blog_association` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) unsigned NOT NULL,
  `blogid` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_blogasso_con_ix` (`contextid`),
  KEY `mdl_blogasso_blo_ix` (`blogid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Associations of blog entries with courses and module instanc' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_blog_external`
--

CREATE TABLE IF NOT EXISTS `mdl_blog_external` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci,
  `url` text COLLATE utf8_unicode_ci NOT NULL,
  `filtertags` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `failedlastsync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned DEFAULT NULL,
  `timefetched` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_blogexte_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='External blog links used for RSS copying of blog entries to ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_cache_filters`
--

CREATE TABLE IF NOT EXISTS `mdl_cache_filters` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `filter` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `version` bigint(10) unsigned NOT NULL DEFAULT '0',
  `md5key` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rawtext` text COLLATE utf8_unicode_ci NOT NULL,
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_cachfilt_filmd5_ix` (`filter`,`md5key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='For keeping information about cached data' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_cache_flags`
--

CREATE TABLE IF NOT EXISTS `mdl_cache_flags` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `flagtype` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `value` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `expiry` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_cachflag_fla_ix` (`flagtype`),
  KEY `mdl_cachflag_nam_ix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Cache of time-sensitive flags' AUTO_INCREMENT=32 ;

--
-- Volcado de datos para la tabla `mdl_cache_flags`
--

INSERT INTO `mdl_cache_flags` (`id`, `flagtype`, `name`, `timemodified`, `value`, `expiry`) VALUES
(1, 'userpreferenceschanged', '2', 1317326363, '1', 1317333563),
(2, 'accesslib/dirtycontexts', '/1', 1317998140, '1', 1318005340),
(3, 'accesslib/dirtycontexts', '/1/2/16', 1316650870, '1', 1316658070),
(4, 'accesslib/dirtycontexts', '/1/14', 1316715379, '1', 1316722579),
(5, 'accesslib/dirtycontexts', '/1/3', 1316724834, '1', 1316732034),
(6, 'accesslib/dirtycontexts', '/1/18', 1316731622, '1', 1316738822),
(7, 'accesslib/dirtycontexts', '/1/19', 1316732460, '1', 1316739660),
(8, 'accesslib/dirtycontexts', '/1/20', 1316732271, '1', 1316739471),
(9, 'accesslib/dirtycontexts', '/1/21', 1316810207, '1', 1316817407),
(10, 'accesslib/dirtycontexts', '/1/22', 1316810170, '1', 1316817370),
(11, 'accesslib/dirtycontexts', '/1/23', 1316810501, '1', 1316817701),
(12, 'accesslib/dirtycontexts', '/1/23/24', 1318012391, '1', 1318019591),
(13, 'accesslib/dirtycontexts', '/1/16', 1317244268, '1', 1317251468),
(14, 'accesslib/dirtycontexts', '/1/30', 1317244276, '1', 1317251476),
(15, 'userpreferenceschanged', '12', 1317997758, '1', 1318004958),
(16, 'accesslib/dirtycontexts', '/1/2/15', 1317328396, '1', 1317335596),
(17, 'accesslib/dirtycontexts', '/1/2/6', 1317326393, '1', 1317333593),
(18, 'accesslib/dirtycontexts', '/1/2/35', 1317330318, '1', 1317337518),
(19, 'accesslib/dirtycontexts', '/1/2/36', 1317329846, '1', 1317337046),
(20, 'accesslib/dirtycontexts', '/1/2/34', 1317328910, '1', 1317336110),
(21, 'accesslib/dirtycontexts', '/1/2/37', 1317329034, '1', 1317336234),
(22, 'userpreferenceschanged', '14', 1317936639, '1', 1317943839),
(23, 'accesslib/dirtycontexts', '/1/7', 1317329906, '1', 1317337106),
(24, 'accesslib/dirtycontexts', '/1/8', 1317330050, '1', 1317337250),
(25, 'accesslib/dirtycontexts', '/1/2/4', 1317330134, '1', 1317337334),
(26, 'accesslib/dirtycontexts', '/1/2/17', 1317332730, '1', 1317339930),
(27, 'accesslib/dirtycontexts', '/1/23/24/27', 1317390971, '1', 1317398171),
(28, 'accesslib/dirtycontexts', '/1/22/40', 1317957296, '1', 1317964496),
(29, 'accesslib/dirtycontexts', '/1/23/46', 1318009918, '1', 1318017118),
(30, 'accesslib/dirtycontexts', '/1/23/46/47', 1317848546, '1', 1317855746),
(31, 'accesslib/dirtycontexts', '/1/23/46/52', 1317848645, '1', 1317855845);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_cache_text`
--

CREATE TABLE IF NOT EXISTS `mdl_cache_text` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `md5key` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `formattedtext` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_cachtext_md5_ix` (`md5key`),
  KEY `mdl_cachtext_tim_ix` (`timemodified`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='For storing temporary copies of processed texts' AUTO_INCREMENT=239 ;

--
-- Volcado de datos para la tabla `mdl_cache_text`
--

INSERT INTO `mdl_cache_text` (`id`, `md5key`, `formattedtext`, `timemodified`) VALUES
(1, '118e7866a9d4840f56149b3a4c204485', '<div class="no-overflow"><div class="text_to_html"><p>Red social de la Facultad de Ingeniería<br /><br /></p></div></div>', 1318012400),
(2, '15be33c9cba759fdb969189290c904a0', '<p>Red social de la Facultad de Ingeniería<br /><br /></p>', 1317330296),
(3, '3f753a864e451dd63c50e2914e848ffa', '<p>Para transformar el texto en un enlace, introduzca una URL que contenga $$, donde $$ se sustituye por el texto. Por ejemplo, para transformar una ID de Twitter en un enlace, introduzca http://twitter.com/$$.</p>\n', 1316642136),
(4, 'b0294bf82e6fed3c48aee6eda658d687', '<div class="no-overflow"><div class="text_to_html"><p>Red social de la Facultad de Ingeniería<br /><br /></p></div></div>', 1317955528),
(5, 'b0294bf82e6fed3c48aee6eda658d687', '<div class="no-overflow"><div class="text_to_html"><p>Red social de la Facultad de Ingeniería<br /><br /></p></div></div>', 1316642917),
(6, 'b0294bf82e6fed3c48aee6eda658d687', '<div class="no-overflow"><div class="text_to_html"><p>Red social de la Facultad de Ingeniería<br /><br /></p></div></div>', 1316642918),
(7, 'f28aa128d54cc14e9293397d5fa0e0ce', '<p>Red social de la Facultad de Ingeniería<br /><br /></p>', 1316728745),
(8, 'f28aa128d54cc14e9293397d5fa0e0ce', '<p>Red social de la Facultad de Ingeniería<br /><br /></p>', 1316642921),
(9, 'f28aa128d54cc14e9293397d5fa0e0ce', '<p>Red social de la Facultad de Ingeniería<br /><br /></p>', 1316642930),
(10, '7df7723cf476d69bc13eed1ea208b702', '12345678', 1317390556),
(11, '3cacbd06d2cea41568697793c94a8361', '1234567890', 1316648440),
(12, '2aff888c5cc7ceed5dc32f6967ff349b', 'Aprendiz', 1316813121),
(13, '4112d23e812cc2a4810ca926101d527f', 'Ninguno', 1316648049),
(14, '85e62ac1e3b1c50e55dcd86a33077a48', 'Los gestores pueden acceder a los cursos y modificarlos, por lo general no participan en los cursos.', 1316650407),
(15, '4c6057364a06af0ffaae37777cb4a742', 'Los creadores de cursos pueden crear nuevos cursos.', 1316650407),
(16, '2d5e7b787f4219cdb7b5b4a6ed1aaba6', 'Los profesores pueden realizar cualquier acción dentro de un curso, incluyendo cambiar actividades y calificar a los estudiantes.', 1316811068),
(17, '58582df6214224706d388f3035818bb5', 'Los profesores sin permiso de edición pueden enseñar en los cursos y calificar a los estudiantes, pero no pueden modificar las actividades.', 1316650407),
(18, '652850f711ea69d77aa95c95bd3f91bd', 'Los estudiantes tienen por lo general menos privilegios dentro de un curso.', 1316811068),
(19, '192d5947cde4c040297beb0c12ebec84', 'Los invitados tienen privilegios mínimos y normalmente no están autorizados para escribir.', 1316811068),
(20, '4ec84abe62cb010e906d6254616ed901', 'Todos los usuarios identificados.', 1316810966),
(21, '5498b85cb9de8e8bcbb269601f250be0', 'Todos los usuarios identificados en el curso de la página principal', 1316650524),
(22, '275f923851211239b5f6e90a3d5696fe', '<div class="no-overflow"><p>&lt;p&gt; Titulo &lt;/p&gt;</p></div>', 1316650916),
(23, '34065e52d2a2f6219b518e3025df79b0', '<div class="no-overflow"><p><a href="http://localhost/admin/user.php">Usuarios</a></p></div>', 1316729154),
(24, '0909b09c9678cac387f2a2044755c2bc', '<div class="no-overflow"><p><a href="http://localhost/admin/user.php">Usuarios</a></p></div>', 1316731306),
(25, '9fdbfd394e20d03ba3468e3cb6b267ac', '<div class="no-overflow"><p><a href="http://localhost/admin/user.php">Usuarios</a></p></div>', 1316730367),
(26, '939ba169d7d0017b408a9f518d2d251d', '<div class="no-overflow"><p><a href="http://localhost/admin/user.php">Usuarios</a></p></div>', 1316715653),
(27, '4e46d06bdcc733e932e24c0fbc687d08', '<div class="no-overflow"><p><a href="http://localhost/admin/user.php">Usuarios</a></p></div>', 1316716394),
(28, 'bbdda4b15cd915a4f3462f32602cc8c1', '<div class="no-overflow">Novedades y anuncios</div>', 1317333329),
(29, '9a9bd2a65551cb9b76beafd3cbb69de0', '<p>Hola, mensaje</p>', 1317332070),
(30, 'df2fc47fd0e90fe782622f30f04f7acf', '<div class="no-overflow"><p><a href="http://localhost/admin/user.php">Usuarios</a></p></div>', 1316728783),
(31, '0e7c9686c7a27fb05e7b6881d3539fc7', '<div class="no-overflow"><div class="text_to_html"><p>Red social de la Facultad de Ingeniería<br /><br /></p></div></div>', 1316728783),
(32, 'f5857128b28b59b68311e5bb07e38383', '<p>Red social de la Facultad de Ingeniería<br /><br /></p>', 1316728784),
(33, '7c383ec0254d9afecf39d0fee4f3cbac', '<p>Hola, mensaje</p>', 1316728784),
(34, '3535fbcc9de49ca775556df7e989b0a6', '<div class="no-overflow"><p><a href="http://localhost/admin/user.php">Usuarios</a></p></div>', 1316728744),
(35, '0c8e5438b1ef96fab4a5c383d9213ad8', '<p>Hola, mensaje</p>', 1316728745),
(36, 'd942e310a907a09adc8463584aed488d', '<div class="no-overflow"><p><a href="http://localhost/admin/user.php">Usuarios</a></p></div>', 1316728621),
(37, '17855839ab06a3b822aafcc5f7edff58', '<div class="no-overflow"><p><a href="http://localhost/admin/user.php">Usuarios</a></p></div>', 1316731180),
(38, 'bfa2be5909c89bbcf80726df70c4ebff', '<p>\nAl asignar un rol a un usuario en un contexto, usted\nle está garantizando los permisos propios de ese rol\nen el contexto actual y en todos los contextos de\nrango ''inferior''.\n</p>\n\n<p>\nContextos:\n</p><ol><li>Sitio/Sistema</li>\n<li>Categorías de cursos</li>\n<li>Cursos</li>\n<li>Bloques y Actividades</li>\n</ol><p>\nAsí, si le da a un estudiante el rol de usuario de un\ncurso, tendrá ese rol para ese curso, pero también para\ntodos los bloques y actividades dentro del curso. Sus\npermisos reales dependerán de otros roles y anularán\nlos que han sido definidos.\n</p>\n\n<p>\nVea también\n<a href="help.php?file=roles.html">Roles</a>,\n<a href="help.php?file=contexts.html">Contextos</a>,\n<a href="help.php?file=permissions.html">Permisos</a> y\n<a href="help.php?file=overrides.html">Anulaciones</a>.\n</p>\n', 1316730372),
(39, '6c267be72733d7408cd14a7c0b0f9738', '<div class="no-overflow"><p><a href="http://localhost/admin/user.php">Usuarios</a></p>\r\n<p><a href="http://localhost/course/index.php?categoryedit=on">Cursos</a></p></div>', 1317326311),
(40, 'dc0c25f44e821d01208f946aa7557ec1', '<div class="no-overflow"><p><a href="http://localhost/admin/user.php">Usuarios</a></p>\r\n<p><a href="http://localhost/course/index.php?categoryedit=on">Cursos</a></p></div>', 1317326394),
(41, '59871fc49db985e89d186c5a35554903', '<div class="no-overflow"><p><a href="http://localhost/admin/user.php">Usuarios</a></p>\r\n<p><a href="http://localhost/course/index.php?categoryedit=on">Cursos</a></p></div>', 1316731646),
(42, '2501233af784821fb22eb3768ce564a4', '<div class="no-overflow"><p><a href="http://localhost/admin/user.php">Usuarios</a></p>\r\n<p><a href="http://localhost/course/index.php?categoryedit=on">Cursos</a></p></div>', 1316731767),
(43, 'f802718b074a605d9164fb8d1c6bd7e3', '<div class="no-overflow"><p><a href="http://localhost/admin/user.php">Usuarios</a></p>\r\n<p><a href="http://localhost/course/index.php?categoryedit=on">Cursos</a></p></div>', 1316810640),
(44, '1cb32bc21655a4db4d3a4fbb97a5ea77', '<div class="no-overflow"><p><a href="http://localhost/admin/user.php">Usuarios</a></p>\r\n<p><a href="http://localhost/course/index.php?categoryedit=on">Cursos</a></p></div>', 1317247980),
(45, 'eef0c21466656d7766dd28f53532b100', '<p>El resumen del curso se muestra en la lista de cursos. Una búsqueda de cursos busca el texto del resumen del curso además de los nombres de curso.</p>\n', 1316810776),
(46, '1ab20d6dfe938bb5b31e7c2b7a2647ed', '<div class="no-overflow"><p><a href="http://localhost/admin/user.php">Usuarios</a></p>\r\n<p><a href="http://localhost/course/index.php?categoryedit=on">Cursos</a></p></div>', 1317248098),
(47, '20f7045625c732dacecc561e779e2a54', '<p>Todos los usuarios identificados.</p>', 1318006154),
(48, '2f8b7530669537817ae18e6d154e46ef', '<p>Los invitados tienen privilegios mínimos y normalmente no están autorizados para escribir.</p>', 1318006154),
(49, 'e63ec5279c3fa2c91bffa8483df0b5dc', '<p>Los estudiantes tienen por lo general menos privilegios dentro de un curso.</p>', 1318006154),
(50, '24b187e2a604187bea9b705924302adb', '<p>Los profesores pueden realizar cualquier acción dentro de un curso, incluyendo cambiar actividades y calificar a los estudiantes.</p>', 1318006153),
(51, '94b1894cfac1a77a856b6fc9ccb3b0f2', '23434342', 1316813121),
(52, 'c20116423ad3f827fe97167b30c8aa33', '345345', 1316813121),
(53, '9ecd690dfe37057f51c226f62ba6040e', '<div class="no-overflow"><p><a href="http://localhost/admin/user.php">Usuarios</a></p>\r\n<p><a href="http://localhost/course/index.php?categoryedit=on">Cursos</a></p></div>', 1316813144),
(54, 'a7f816d772a520164e2465ba05acd10d', '<div class="no-overflow"><p><a href="http://localhost/admin/user.php">Usuarios</a></p>\r\n<p><a href="http://localhost/course/index.php?categoryedit=on">Cursos</a></p></div>', 1316813762),
(55, 'bfabbb51f75ddc1f1fba6d1ae1cade8f', '<div class="no-overflow">Novedades y anuncios</div>', 1317396521),
(56, 'd30db130a82f97d30d9e1f1c9afaa176', 'Miembro', 1317325325),
(57, 'fcca811611401a01ceb09816c3989b74', '<div class="no-overflow"><p><a href="http://localhost/admin/user.php">Usuarios</a></p>\r\n<p><a href="http://localhost/course/index.php?categoryedit=on">Cursos</a></p></div>', 1317245192),
(58, '602071f25b5bcbc3026d0da986fb326d', '<div class="no-overflow"><p><a href="http://localhost/admin/user.php">Usuarios</a></p>\r\n<p><a href="http://localhost/course/index.php?categoryedit=on">Cursos</a></p></div>', 1317245582),
(59, 'a5a85a51a52a3412f636096d39cf3ef0', 'Administrador', 1317390379),
(60, '124c8350d6e670d45cd486ca8a451ab2', '<div class="no-overflow"><p><a href="http://localhost/admin/user.php">Usuarios</a></p>\r\n<p><a href="http://localhost/course/index.php?categoryedit=on">Cursos</a></p></div>', 1317248266),
(61, '00d773fecf83a0bce46749c38b177b07', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/admin/user.php">Usuarios</a></li>\r\n<li><a href="http://localhost/course/index.php?categoryedit=on">Cursos</a></li>\r\n</ul></div>', 1317327015),
(62, '3d824d758ff3f74993a15f54cc06a3b0', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/admin/user.php">Usuarios</a></li>\r\n<li><a href="http://localhost/course/index.php?categoryedit=on">Cursos</a></li>\r\n</ul></div>', 1317326596),
(63, '59b6f47d40d02cb0245b52b1b01d05a5', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/admin/user.php">Usuarios</a></li>\r\n<li><a href="http://localhost/course/index.php?categoryedit=on">Cursos</a></li>\r\n</ul></div>', 1317327026),
(64, 'e510fad5ee54a504abc4aed6c66a3c64', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/admin/user.php">Usuarios</a></li>\r\n<li><a href="http://localhost/course/index.php?categoryedit=on">Cursos</a></li>\r\n</ul></div>', 1317326855),
(65, '4b84ed279509738500523186aa8c7e21', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/admin/user.php">Usuarios</a></li>\r\n<li><a href="http://localhost/course/index.php?categoryedit=on">Cursos</a></li>\r\n</ul></div>', 1317326903),
(66, 'f4cf63cc59c7fdf2bfef8bf2f83b5e4f', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/admin/user.php">Usuarios</a></li>\r\n<li><a href="http://localhost/course/index.php?categoryedit=on">Cursos</a></li>\r\n</ul></div>', 1317326905),
(67, 'a8361c23b8a0b7947c0e72d22169344c', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/mod/forum/view.php?id=1">Cartelera</a></li>\r\n<li><a href="#">Configuracion</a></li>\r\n<li><a href="http://localhost/course/index.php?categoryedit=on">Materias</a></li>\r\n<li><a href="http://localhost/admin/user.php">Miembros</a></li>\r\n<li><a href="http://localhost/admin/roles/assign.php?contextid=1">Asignar roles</a></li>\r\n</ul>\r\n<!--?php \r\necho "hola";\r\n?--></div>', 1317327126),
(68, 'cc112a688eba41486f4e86c935b6bcd5', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/mod/forum/view.php?id=1">Cartelera</a></li>\r\n<li><a href="#">Configuracion</a></li>\r\n<li><a href="http://localhost/course/index.php?categoryedit=on">Materias</a></li>\r\n<li><a href="http://localhost/admin/user.php">Miembros</a></li>\r\n<li><a href="http://localhost/admin/roles/assign.php?contextid=1">Asignar roles</a></li>\r\n</ul></div>', 1317334824),
(69, '6adeb3dd2a825f7e2da5e75b91a373c2', '<div class="no-overflow"><p>&lt;ul&gt;<br />&lt;li&gt;&lt;a href="http://localhost/"&gt;Pagina principal&lt;/a&gt;&lt;/li&gt;<br />&lt;li&gt;&lt;a href="http://localhost/login/"&gt;Conectarse&lt;/a&gt;&lt;/li&gt;<br />&lt;li&gt;&lt;a href="http://localhost/login/signup.php"&gt;Registrarse&lt;/a&gt;&lt;/li&gt;<br />&lt;/ul&gt;</p></div>', 1317327622),
(70, '5785be5644a37e1e2a92bbad5ad400c8', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/login/">Conectarse</a></li>\r\n<li><a href="http://localhost/login/signup.php">Registrarse</a></li>\r\n</ul></div>', 1318012400),
(71, 'eb6d13ec293bbe8a1bd37d9fd5b621ed', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n</ul></div>', 1318012400),
(72, 'd3e72cf14d54fc5e32abab06615022de', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="#">Mis cursos</a></li>\r\n</ul></div>', 1317934836),
(73, 'b50ef70b15eabc200fcc0a9390ccc28a', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/mod/forum/view.php?id=1">Cartelera</a></li>\r\n<li><a href="#">Configuracion</a></li>\r\n<li><a href="http://localhost/course/index.php?categoryedit=on">Materias</a></li>\r\n<li><a href="http://localhost/admin/user.php">Miembros</a></li>\r\n<li><a href="http://localhost/admin/roles/assign.php?contextid=1">Asignar roles</a></li>\r\n</ul></div>', 1317333778),
(74, 'f1d08970e62175b134a45b63add57a3c', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/login/">Conectarse</a></li>\r\n<li><a href="http://localhost/login/signup.php">Registrarse</a></li>\r\n</ul></div>', 1317333778),
(75, 'a32e1267da8f9409bc87cbbca0f91327', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n</ul></div>', 1317333778),
(76, 'd3498adfda2af7dfe98a9c3eadae1576', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="#">Mis cursos</a></li>\r\n</ul></div>', 1317333778),
(77, 'b554e142a7d5e36413f89c02b4a68e30', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/mod/forum/view.php?id=1">Cartelera</a></li>\r\n<li><a href="#">Configuracion</a></li>\r\n<li><a href="http://localhost/course/index.php?categoryedit=on">Materias</a></li>\r\n<li><a href="http://localhost/admin/user.php">Miembros</a></li>\r\n<li><a href="http://localhost/admin/roles/assign.php?contextid=1">Asignar roles</a></li>\r\n</ul></div>', 1317330306),
(78, 'b582b68ec63d676baab69ca7c1eb0d08', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/login/">Conectarse</a></li>\r\n<li><a href="http://localhost/login/signup.php">Registrarse</a></li>\r\n</ul></div>', 1317330306),
(79, 'ae38ebec3415cf5040bfc996be07d8a1', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n</ul></div>', 1317330307),
(80, 'dee29e80b7dd1fe4254b04cf5657919f', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="#">Mis cursos</a></li>\r\n</ul></div>', 1317330307),
(81, 'fdd3658a69465e936c4fa65472f3841b', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/mod/forum/view.php?id=1">Cartelera</a></li>\r\n<li><a href="#">Configuracion</a></li>\r\n<li><a href="http://localhost/course/index.php?categoryedit=on">Materias</a></li>\r\n<li><a href="http://localhost/admin/user.php">Miembros</a></li>\r\n<li><a href="http://localhost/admin/roles/assign.php?contextid=1">Asignar roles</a></li>\r\n</ul></div>', 1317333803),
(82, '26707685f1bed9fb61fb92af33c2f43a', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/login/">Conectarse</a></li>\r\n<li><a href="http://localhost/login/signup.php">Registrarse</a></li>\r\n</ul></div>', 1317333803),
(83, 'a7930a81125039770799fad751ba0dba', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n</ul></div>', 1317333803),
(84, '7d7525b466f3e93dc5534b5f353be990', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="#">Mis cursos</a></li>\r\n</ul></div>', 1317333803),
(85, '317dde190059be76f67576497a07a386', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/mod/forum/view.php?id=1">Cartelera</a></li>\r\n<li><a href="#">Configuracion</a></li>\r\n<li><a href="http://localhost/course/index.php?categoryedit=on">Materias</a></li>\r\n<li><a href="http://localhost/admin/user.php">Miembros</a></li>\r\n<li><a href="http://localhost/admin/roles/assign.php?contextid=1">Asignar roles</a></li>\r\n</ul></div>', 1317328869),
(86, '2d31f1811643c89ee4dcd4f9b8484113', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/login/">Conectarse</a></li>\r\n<li><a href="http://localhost/login/signup.php">Registrarse</a></li>\r\n</ul></div>', 1317391270),
(87, 'ab8f54c08af342a7f8384778c1c570e7', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n</ul></div>', 1317391271),
(88, 'e19cadaceadf2956db384e0a02b77ac3', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="#">Mis cursos</a></li>\r\n</ul></div>', 1317391271),
(89, '5fd1e97ecb5d4f687d48b8a55360064c', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/mod/forum/view.php?id=1">Cartelera</a></li>\r\n<li><a href="#">Configuracion</a></li>\r\n<li><a href="http://localhost/course/index.php?categoryedit=on">Materias</a></li>\r\n<li><a href="http://localhost/admin/user.php">Miembros</a></li>\r\n<li><a href="http://localhost/admin/roles/assign.php?contextid=1">Asignar roles</a></li>\r\n</ul></div>', 1317328995),
(90, 'd30adb645e340764d8e6020035cb3d5b', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/login/">Conectarse</a></li>\r\n<li><a href="http://localhost/login/signup.php">Registrarse</a></li>\r\n</ul></div>', 1317328995),
(91, 'a4936508bbba7861ed242402b944d7e1', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n</ul></div>', 1317328995),
(92, '3b202ad55fe28e3088f89933f2b4268d', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="#">Mis cursos</a></li>\r\n</ul></div>', 1317328995),
(93, 'dde8df9a240bb80cdf2ce3d6e680cadd', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/mod/forum/view.php?id=1">Cartelera</a></li>\r\n<li><a href="#">Configuracion</a></li>\r\n<li><a href="http://localhost/course/index.php?categoryedit=on">Materias</a></li>\r\n<li><a href="http://localhost/admin/user.php">Miembros</a></li>\r\n<li><a href="http://localhost/admin/roles/assign.php?contextid=1">Asignar roles</a></li>\r\n</ul></div>', 1317334840),
(94, '902bb1b65c14de5a8e4fa3c119868548', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/login/">Conectarse</a></li>\r\n<li><a href="http://localhost/login/signup.php">Registrarse</a></li>\r\n</ul></div>', 1318012354),
(95, 'accb44e0b7b275b2c44e114ff7ec97c0', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n</ul></div>', 1318012354),
(96, '3e28232ab741397c660d75cb585df966', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="#">Mis cursos</a></li>\r\n</ul></div>', 1317934751),
(97, 'd0c07d03ac2b8277c3b7e613a0353719', 'Mediador', 1317390556),
(98, 'e7641c731f17c40f2e82ba4dca8864b2', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/mod/forum/view.php?id=1">Cartelera</a></li>\r\n<li><a href="#">Configuracion</a></li>\r\n<li><a href="http://localhost/course/index.php?categoryedit=on">Materias</a></li>\r\n<li><a href="http://localhost/admin/user.php">Miembros</a></li>\r\n<li><a href="http://localhost/admin/roles/assign.php?contextid=1">Asignar roles</a></li>\r\n</ul></div>', 1317329483),
(99, '2139dbc3bbaf2810d066414dc7a49a16', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/login/">Conectarse</a></li>\r\n<li><a href="http://localhost/login/signup.php">Registrarse</a></li>\r\n</ul></div>', 1317329483),
(100, '275626ba65608869220ece90f5fb5a52', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n</ul></div>', 1317329483),
(101, '53daf2cb5cb49e5a00471f3dbbbdc36f', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="#">Mis cursos</a></li>\r\n</ul></div>', 1317329483),
(102, '4ab8707618279a8c5d8868525d4aea18', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/mod/forum/view.php?id=1">Cartelera</a></li>\r\n<li><a href="#">Configuracion</a></li>\r\n<li><a href="http://localhost/course/index.php?categoryedit=on">Materias</a></li>\r\n<li><a href="http://localhost/admin/user.php">Miembros</a></li>\r\n<li><a href="http://localhost/admin/roles/assign.php?contextid=1">Asignar roles</a></li>\r\n</ul></div>', 1317329864),
(103, '6e91a78975d7dd4556d9bb58384bd900', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/login/">Conectarse</a></li>\r\n<li><a href="http://localhost/login/signup.php">Registrarse</a></li>\r\n</ul></div>', 1317329864),
(104, '415040be377970c64e57d543dc2be33f', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n</ul></div>', 1317329864),
(105, '32d80999868c82ee00eef0f23cca167f', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="#">Mis cursos</a></li>\r\n</ul></div>', 1317329864),
(106, '660ab809fdbfeb1935c15939573bc9d2', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/mod/forum/view.php?id=1">Cartelera</a></li>\r\n<li><a href="#">Configuracion</a></li>\r\n<li><a href="http://localhost/course/index.php?categoryedit=on">Materias</a></li>\r\n<li><a href="http://localhost/admin/user.php">Miembros</a></li>\r\n<li><a href="http://localhost/admin/roles/assign.php?contextid=1">Asignar roles</a></li>\r\n</ul></div>', 1317330008),
(107, '301353ca6b97914181368846b4181b54', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/login/">Conectarse</a></li>\r\n<li><a href="http://localhost/login/signup.php">Registrarse</a></li>\r\n</ul></div>', 1317330008),
(108, '56bd6bcd539adb69972e50fd6ea3d477', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n</ul></div>', 1317330008),
(109, '92e0a59e5b10637509d11e7662110025', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="#">Mis cursos</a></li>\r\n</ul></div>', 1317330008),
(110, '0c66907b7f758e732061540d8c22a7ca', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/mod/forum/view.php?id=1">Cartelera</a></li>\r\n<li><a href="#">Configuracion</a></li>\r\n<li><a href="http://localhost/course/index.php?categoryedit=on">Materias</a></li>\r\n<li><a href="http://localhost/admin/user.php">Miembros</a></li>\r\n<li><a href="http://localhost/admin/roles/assign.php?contextid=1">Asignar roles</a></li>\r\n</ul></div>', 1317330090),
(111, 'bb60ead94f34918e786642f177d32785', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/login/">Conectarse</a></li>\r\n<li><a href="http://localhost/login/signup.php">Registrarse</a></li>\r\n</ul></div>', 1317330090),
(112, 'f191c57b0e8996b6f0ab9495872d2512', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n</ul></div>', 1317330090),
(113, '82ee22f3b054a30d13b8a8b5146dcd3b', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="#">Mis cursos</a></li>\r\n</ul></div>', 1317330090),
(114, '61be6b25497dead6a87afcd8e69784f6', '<div class="text_to_html"> <div class="clearfix"><div class="theme_screenshot"><h2>Arialist</h2><img src="arialist/pix/screenshot.png" alt="screenshot.png" /><h3>Theme Discussion Forum:</h3><p><a href="http://moodle.org/mod/forum/view.php?id=46">http://moodle.org/mod/forum/view.php?id=46</a></p><h3>Theme Credits</h3><p><a href="http://docs.moodle.org/en/Theme_credits">http://docs.moodle.org/en/Theme_credits</a></p><h3>Theme Documentation:</h3><p><a href="http://docs.moodle.org/en/Themes">http://docs.moodle.org/en/Themes</a></p><h3>Report a bug:</h3><p><a href="http://tracker.moodle.org">http://tracker.moodle.org</a></p></div><div class="theme_description"><h2>About</h2><p>Arialist is a very clean and simple two-column, fluid-width theme for Moodle 2.0.</p><h2>Tweaks</h2><p>This theme is built upon both Base and Canvas, two parent themes included in the Moodle core. If you want to modify this theme, we recommend that you first duplicate it, then rename it before making your changes. This will prevent your customized theme from being overwritten by future Moodle upgrades, and you''ll still have the original files if you make a mess. More information on modifying themes can be found in the <a href="http://docs.moodle.org/en/Theme">MoodleDocs</a>.</p><h2>Credits</h2><p>This theme was coded and is maintained by Patrick Malley of NewSchool Learning. He can be contacted by email at contact@newschoollearning.com. </p><h2>License</h2><p>This, and all other themes included in the Moodle core, are licensed under the <a href="http://www.gnu.org/licenses/gpl.html">GNU General Public License</a>.<br /></p></div></div></div>', 1317330356),
(115, '57df01b8f5e2bd6c9e0bb8882cdede35', '<div class="text_to_html"><div class="clearfix"><div class="theme_screenshot"><h2>Magazine</h2><img src="magazine/pix/screenshot.png" alt="screenshot.png" /><h3>Theme Discussion Forum:</h3><p><a href="http://moodle.org/mod/forum/view.php?id=46">http://moodle.org/mod/forum/view.php?id=46</a></p><h3>Theme Credits</h3><p><a href="http://docs.moodle.org/en/Theme_credits">http://docs.moodle.org/en/Theme_credits</a></p><h3>Theme Documentation:</h3><p><a href="http://docs.moodle.org/en/Themes">http://docs.moodle.org/en/Themes</a></p><h3>Report a bug:</h3><p><a href="http://tracker.moodle.org">http://tracker.moodle.org</a></p></div><div class="theme_description"><h2>About</h2><p>Magazine is a three column fluid-width theme for Moodle 2.0. </p><h2>Tweaks</h2><p>This theme is built upon both Base and Canvas, two parent themes included in the Moodle core. If you want to modify this theme, we recommend that you first duplicate it, then rename it before making your changes. This will prevent your customized theme from being overwritten by future Moodle upgrades, and you''ll still have the original files if you make a mess. More information on modifying themes can be found in the <a href="http://docs.moodle.org/en/Theme">MoodleDocs</a>.</p><h2>Credits</h2><p>This theme was coded and is maintained by John Stabinger of NewSchool Learning. He can be contacted by email at contact@newschoollearning.com. </p><h2>License</h2><p>This, and all other themes included in the Moodle core, are licensed under the <a href="http://www.gnu.org/licenses/gpl.html">GNU General Public License</a>. Some icons used in this theme are from the Splashy Icon set and are freely available at http://splashyfish.com/icons/. </p></div></div></div>', 1317330463),
(116, 'a67eccd10b31be3b451f057603e16b1b', '<div class="text_to_html"><div class="clearfix"><div class="theme_screenshot"><h2>Boxxie</h2><img src="boxxie/pix/screenshot.jpg" alt="screenshot.jpg" /><h3>Theme Discussion Forum:</h3><p><a href="http://moodle.org/mod/forum/view.php?id=46">http://moodle.org/mod/forum/view.php?id=46</a></p><h3>Theme Credits</h3><p><a href="http://docs.moodle.org/en/Theme_credits">http://docs.moodle.org/en/Theme_credits</a></p><h3>Theme Documentation:</h3><p><a href="http://docs.moodle.org/en/Themes">http://docs.moodle.org/en/Themes</a></p><h3>Report a bug:</h3><p><a href="http://tracker.moodle.org">http://tracker.moodle.org</a></p></div><div class="theme_description"><h2>About</h2><p>Boxxie is a fluid-width, three-column theme for Moodle 2.0.</p><h2>Tweaks</h2><p>This theme is built upon both Base and Canvas, two parent themes included in the Moodle core. If you want to modify this theme, we recommend that you first duplicate it then rename it before making your changes. This will prevent your customized theme from being overwritten by future Moodle upgrades, and you''ll still have the original files if you make a mess. More information on modifying themes can be found in the <a href="http://docs.moodle.org/en/Theme">MoodleDocs</a>.</p><h2>Credits</h2><p>This theme was coded and is maintained by Patrick Malley. He can be contacted by email at contact@newschoollearning.com. </p><h3>License</h3><p>This, and all other themes included in the Moodle core, are licensed under the <a href="http://www.gnu.org/licenses/gpl.html">GNU General Public License</a>.</p></div></div></div>', 1317330514),
(117, '4072232ae161c4a7df3e8eb36be8b305', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/mod/forum/view.php?id=1">Cartelera</a></li>\r\n<li><a href="#">Configuracion</a></li>\r\n<li><a href="http://localhost/course/index.php?categoryedit=on">Materias</a></li>\r\n<li><a href="http://localhost/admin/user.php">Miembros</a></li>\r\n<li><a href="http://localhost/admin/roles/assign.php?contextid=1">Asignar roles</a></li>\r\n</ul></div>', 1317330635),
(118, '7f31490f75b039ab6da2a1bda263e237', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/login/">Conectarse</a></li>\r\n<li><a href="http://localhost/login/signup.php">Registrarse</a></li>\r\n</ul></div>', 1317330635),
(119, '2402956ff6ed40c13a8d8dc1d5c76b94', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n</ul></div>', 1317330635),
(120, '7896621777293376979252a30c62122f', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="#">Mis cursos</a></li>\r\n</ul></div>', 1317330635),
(121, '950a1079fc15a6e04a067e767261d79b', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/mod/forum/view.php?id=1">Cartelera</a></li>\r\n<li><a href="#">Configuracion</a></li>\r\n<li><a href="http://localhost/course/index.php?categoryedit=on">Materias</a></li>\r\n<li><a href="http://localhost/admin/user.php">Miembros</a></li>\r\n<li><a href="http://localhost/admin/roles/assign.php?contextid=1">Asignar roles</a></li>\r\n</ul></div>', 1317334694),
(122, '73f95a6e78124d1c288f06133d909888', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/login/">Conectarse</a></li>\r\n<li><a href="http://localhost/login/signup.php">Registrarse</a></li>\r\n</ul></div>', 1317997736),
(123, 'd4c38b96d242ee0a167340fb6b1420c1', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n</ul></div>', 1317997736),
(124, '825bbf4a8897f60e38fb65f498618f66', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="#">Mis cursos</a></li>\r\n</ul></div>', 1317929969),
(125, '8e1544fde6ea77a3f41d2966fc2d432c', '<p>Hola</p>', 1318012400),
(126, 'af8eff36b9230c7b6fa5fc15dd368b29', '<div class="no-overflow">Cartelera</div>', 1317997736),
(127, 'cf3bd191758ceb96e7dbd366b36b95f5', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/mod/forum/view.php?id=1">Cartelera</a></li>\r\n<li><a href="#">Configuracion</a></li>\r\n<li><a href="http://localhost/course/index.php?categoryedit=on">Materias</a></li>\r\n<li><a href="http://localhost/admin/user.php">Miembros</a></li>\r\n<li><a href="http://localhost/admin/roles/assign.php?contextid=1">Asignar roles</a></li>\r\n</ul></div>', 1317333398),
(128, 'a9b6da6c5e5bb6d899677614f67e3381', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/login/">Conectarse</a></li>\r\n<li><a href="http://localhost/login/signup.php">Registrarse</a></li>\r\n</ul></div>', 1317396521),
(129, '6133a4ff96f14360be28c246ce9bcc0c', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n</ul></div>', 1317396521),
(130, 'da794beba1ffc626ddb54f2b5c237180', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="#">Mis cursos</a></li>\r\n</ul></div>', 1317396521),
(131, '053823953400172ced4ad219ba81a682', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/mod/forum/view.php?id=1">Cartelera</a></li>\r\n<li><a href="#">Configuracion</a></li>\r\n<li><a href="http://localhost/course/index.php?categoryedit=on">Materias</a></li>\r\n<li><a href="http://localhost/admin/user.php">Miembros</a></li>\r\n<li><a href="http://localhost/admin/roles/assign.php?contextid=1">Asignar roles</a></li>\r\n</ul></div>', 1317334692),
(132, 'e23f21d8ebbb668ec9cfd9f9447711b5', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/login/">Conectarse</a></li>\r\n<li><a href="http://localhost/login/signup.php">Registrarse</a></li>\r\n</ul></div>', 1318012356),
(133, '47858c8f8b05b79f401673d3c89ab975', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n</ul></div>', 1318012357),
(134, '6d710633304ffb47dca9e9d06b6142a9', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="#">Mis cursos</a></li>\r\n</ul></div>', 1317933091),
(135, 'a6a16af75ba435e2092732fd89334633', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/mod/forum/view.php?id=1">Cartelera</a></li>\r\n<li><a href="#">Configuracion</a></li>\r\n<li><a href="http://localhost/course/index.php?categoryedit=on">Materias</a></li>\r\n<li><a href="http://localhost/admin/user.php">Miembros</a></li>\r\n<li><a href="http://localhost/admin/roles/assign.php?contextid=1">Asignar roles</a></li>\r\n</ul></div>', 1317334518),
(136, '4337335dea34aa355d23718dd0999cd6', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/login/">Conectarse</a></li>\r\n<li><a href="http://localhost/login/signup.php">Registrarse</a></li>\r\n</ul></div>', 1318012394),
(137, 'a62e163da1b0b48a5a04bca0be387acd', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n</ul></div>', 1318012394),
(138, 'a64f5f5461c4f9af5929ec1d4f4d986a', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="#">Mis cursos</a></li>\r\n</ul></div>', 1317931871),
(139, '661a403c78552a1b0e7ec3dba052ffb2', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/mod/forum/view.php?id=1">Cartelera</a></li>\r\n<li><a href="#">Configuracion</a></li>\r\n<li><a href="http://localhost/course/index.php?categoryedit=on">Materias</a></li>\r\n<li><a href="http://localhost/admin/user.php">Miembros</a></li>\r\n<li><a href="http://localhost/admin/roles/assign.php?contextid=1">Asignar roles</a></li>\r\n</ul></div>', 1317334633),
(140, '37264307d7f333f897d72d5ef57ed479', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/login/">Conectarse</a></li>\r\n<li><a href="http://localhost/login/signup.php">Registrarse</a></li>\r\n</ul></div>', 1318006617),
(141, '6fab7e2702a4ead5cd97348e420544d5', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n</ul></div>', 1318006617),
(142, '3387e72aa930def576af8969f7161cd1', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="#">Mis cursos</a></li>\r\n</ul></div>', 1317929972),
(143, 'cd16fd7259edb638a20d47ec183beb35', '<div class="no-overflow"><p>Algoritmos y Programacion II</p></div>', 1318006617),
(144, 'c939646ad08660364f0904ed23cda2e4', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/mod/forum/view.php?id=1">Cartelera</a></li>\r\n<li><a href="#">Configuracion</a></li>\r\n<li><a href="http://localhost/course/">Materias</a></li>\r\n<li><a href="http://localhost/admin/user.php">Miembros</a></li>\r\n<li><a href="http://localhost/admin/roles/assign.php?contextid=1">Asignar roles</a></li>\r\n</ul></div>', 1317397683),
(145, '116df8caaee3764c94f84ecce7f62b30', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/mod/forum/view.php?id=1">Cartelera</a></li>\r\n<li><a href="#">Configuracion</a></li>\r\n<li><a href="http://localhost/course/">Materias</a></li>\r\n<li><a href="http://localhost/admin/user.php">Miembros</a></li>\r\n<li><a href="http://localhost/admin/roles/assign.php?contextid=1">Asignar roles</a></li>\r\n</ul></div>', 1317397006),
(146, '316d82651575f0e5b2878887fa43f666', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/mod/forum/view.php?id=1">Cartelera</a></li>\r\n<li><a href="#">Configuracion</a></li>\r\n<li><a href="http://localhost/course/">Materias</a></li>\r\n<li><a href="http://localhost/admin/user.php">Miembros</a></li>\r\n<li><a href="http://localhost/admin/roles/assign.php?contextid=1">Asignar roles</a></li>\r\n</ul></div>', 1317397091),
(147, '3b463df603d5a3caf00674ebf1ac5f73', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/mod/forum/view.php?id=1">Cartelera</a></li>\r\n<li><a href="#">Configuracion</a></li>\r\n<li><a href="http://localhost/course/">Materias</a></li>\r\n<li><a href="http://localhost/admin/user.php">Miembros</a></li>\r\n<li><a href="http://localhost/admin/roles/assign.php?contextid=1">Asignar roles</a></li>\r\n</ul></div>', 1317396518),
(148, '0064124657a5a420aea45ab20dccab9f', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/mod/forum/view.php?id=1">Cartelera</a></li>\r\n<li><a href="#">Configuracion</a></li>\r\n<li><a href="http://localhost/course/">Materias</a></li>\r\n<li><a href="http://localhost/admin/user.php">Miembros</a></li>\r\n<li><a href="http://localhost/admin/roles/assign.php?contextid=1">Asignar roles</a></li>\r\n</ul></div>', 1317396521),
(149, 'b97ebfa7004e29f58a8e06cfd0c50cc4', '<p>sdfsadgf adsf dsfg dfs sdfd</p>', 1317389724),
(150, 'b898310a2190b0de691df9833e6038de', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/mod/forum/view.php?id=1">Cartelera</a></li>\r\n<li><a href="#">Configuracion</a></li>\r\n<li><a href="http://localhost/course/">Materias</a></li>\r\n<li><a href="http://localhost/admin/user.php">Miembros</a></li>\r\n<li><a href="http://localhost/admin/roles/assign.php?contextid=1">Asignar roles</a></li>\r\n</ul></div>', 1317389776),
(151, '0095a19e9ac5f05c9d9c6aa5ecc46e2f', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/login/">Conectarse</a></li>\r\n<li><a href="http://localhost/login/signup.php">Registrarse</a></li>\r\n</ul></div>', 1317389776),
(152, '2be18f2c6bbee37a117764a03fc95f09', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n</ul></div>', 1317389776),
(153, 'aec342d32680cacf45ec305a0bce09a1', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="#">Mis cursos</a></li>\r\n</ul></div>', 1317389776),
(154, '7a32700883dc46bc3b8d9354256074a6', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/mod/forum/view.php?id=1">Cartelera</a></li>\r\n<li><a href="#">Configuracion</a></li>\r\n<li><a href="http://localhost/course/">Materias</a></li>\r\n<li><a href="http://localhost/admin/user.php">Miembros</a></li>\r\n<li><a href="http://localhost/admin/roles/assign.php?contextid=1">Asignar roles</a></li>\r\n</ul></div>', 1317389789),
(155, '6c18c8c2e08e91390d85eb9f6c8cd223', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/login/">Conectarse</a></li>\r\n<li><a href="http://localhost/login/signup.php">Registrarse</a></li>\r\n</ul></div>', 1317389789),
(156, 'e10b07024d728d40f4d8d5b13c70c3c5', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n</ul></div>', 1317389789),
(157, '43295a810d98ba2e9fc5ebd7ba7e25fa', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="#">Mis cursos</a></li>\r\n</ul></div>', 1317389789),
(158, 'da28f8f5964288310744ae2158189adc', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/mod/forum/view.php?id=1">Cartelera</a></li>\r\n<li><a href="#">Configuracion</a></li>\r\n<li><a href="http://localhost/course/">Materias</a></li>\r\n<li><a href="http://localhost/admin/user.php">Miembros</a></li>\r\n<li><a href="http://localhost/admin/roles/assign.php?contextid=1">Asignar roles</a></li>\r\n</ul></div>', 1317396068),
(159, 'c71a68cf97292d699c78fa31e1f43fdc', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/mod/forum/view.php?id=1">Cartelera</a></li>\r\n<li><a href="#">Configuracion</a></li>\r\n<li><a href="http://localhost/course/">Materias</a></li>\r\n<li><a href="http://localhost/admin/user.php">Miembros</a></li>\r\n<li><a href="http://localhost/admin/roles/assign.php?contextid=1">Asignar roles</a></li>\r\n</ul></div>', 1317395993),
(160, 'd7ccedc166476c12a394df9dba72400b', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/mod/forum/view.php?id=1">Cartelera</a></li>\r\n<li><a href="#">Configuracion</a></li>\r\n<li><a href="http://localhost/course/">Materias</a></li>\r\n<li><a href="http://localhost/admin/user.php">Miembros</a></li>\r\n<li><a href="http://localhost/admin/roles/assign.php?contextid=1">Asignar roles</a></li>\r\n</ul></div>', 1317397578),
(161, '85c3dd135c317e680d77ca1f618c433c', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/login/">Conectarse</a></li>\r\n<li><a href="http://localhost/login/signup.php">Registrarse</a></li>\r\n</ul></div>', 1318011634),
(162, '40ede81be4df3b6857b7a071e7f3c969', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n</ul></div>', 1318011635),
(163, '1470b825e57405da25699d908f49a661', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="#">Mis cursos</a></li>\r\n</ul></div>', 1317934134),
(164, '0b31c4151ac7d01fea6e9832fba9c81a', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/mod/forum/view.php?id=1">Cartelera</a></li>\r\n<li><a href="#">Configuracion</a></li>\r\n<li><a href="http://localhost/course/">Materias</a></li>\r\n<li><a href="http://localhost/admin/user.php">Miembros</a></li>\r\n<li><a href="http://localhost/admin/roles/assign.php?contextid=1">Asignar roles</a></li>\r\n</ul></div>', 1317391270),
(165, '31b2f7e5d39b3d3a6baecf1f24a53a0f', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/mod/forum/view.php?id=1">Cartelera</a></li>\r\n<li><a href="#">Configuracion</a></li>\r\n<li><a href="http://localhost/course/">Materias</a></li>\r\n<li><a href="http://localhost/admin/user.php">Miembros</a></li>\r\n<li><a href="http://localhost/admin/roles/assign.php?contextid=1">Asignar roles</a></li>\r\n</ul></div>', 1317397640),
(166, '854e27130e85c46e82567bb885b5cfdc', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/login/">Conectarse</a></li>\r\n<li><a href="http://localhost/login/signup.php">Registrarse</a></li>\r\n</ul></div>', 1317397640),
(167, '211e2edde49119b5e766f0f602714d78', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n</ul></div>', 1317397641),
(168, '312113cd2b6cb330c2b4cf77af07a539', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="#">Mis cursos</a></li>\r\n</ul></div>', 1317397641),
(169, 'f9b7c6d5fc199336759cdf71a2c12261', '<div class="no-overflow">Cartelera</div>', 1317397641),
(170, 'ba8ac38ce9bd5b152927c261d38b1695', '<h2>Formato LAMS</h2>\n\n<p class="indent">\nEste formato convierte la interfaz LAMS (Learning Activity Management System) en el aspecto central del curso. Los ajustes LAMS deben ser realizados por un administrador para poder utilizar este formato.</p>\n\n<h2>Formato SCORM</h2>\n\n<p class="indent">\nEste formato muestra un paquete SCORM en la primera sección de la portada del curso. (El módulo SCORM/AICC proporciona un método alternativo para mostrar un paquete SCORM en un curso).</p>\n\n<h2>Formato social</h2>\n\n<p class="indent">\nEste formato se orienta en torno al foro central, el Foro Social, que aparece en\nla página principal. Resulta útil en situaciones de formato más libre. Incluso puede no ser un curso: por ejemplo, podría utilizarse como tablón de anuncios de un departamento.</p>\n\n<h2>Formato por temas</h2>\n\n<p class="indent">\nEl curso se organiza en secciones o temas. Cada tema consiste en una serie de actividades.</p>\n\n<h2>Formato semanal</h2>\n\n<p class="indent">\nEl curso se organiza por semanas, con fecha de inicio y fin.\nCada semana contiene sus propias actividades. Algunas de ellas,\ncomo los diarios, pueden durar más de una semana, antes de cerrarse.</p>\n\n<h2>Formato semanal - CSS/Sin tablas</h2>\n\n<p class="indent">\nEl curso se organiza semana por semana, sin usar tablas en el formato.</p>\n', 1317392170),
(171, '0c74706d17505531ce795bc5d6815a70', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/mod/forum/view.php?id=1">Cartelera</a></li>\r\n<li><a href="#">Configuracion</a></li>\r\n<li><a href="http://localhost/course/">Materias</a></li>\r\n<li><a href="http://localhost/admin/user.php">Miembros</a></li>\r\n<li><a href="http://localhost/admin/roles/assign.php?contextid=1">Asignar roles</a></li>\r\n</ul></div>', 1317396506),
(172, '6e2944297a63c4b165f2dee548b0c232', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/login/">Conectarse</a></li>\r\n<li><a href="http://localhost/login/signup.php">Registrarse</a></li>\r\n</ul></div>', 1318010599),
(173, '9c9dfbd5f6436daf5ce9b3c0d3cf27ad', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n</ul></div>', 1318010599),
(174, 'ccbc92a239350e71f335c3906d956dfe', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="#">Mis cursos</a></li>\r\n</ul></div>', 1317933527),
(175, 'cb1a255c2888c26225bfd558402eef23', '<p>Si lo desea, puede adjuntar uno o más archivos a un mensaje en el foro. Si adjunta una imagen, se mostrará al final del mensaje.</p>\n', 1317396350);
INSERT INTO `mdl_cache_text` (`id`, `md5key`, `formattedtext`, `timemodified`) VALUES
(176, 'e18a0980d999bd35bf69fe26d659faaa', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/mod/forum/view.php?id=1">Cartelera</a></li>\r\n<li><a href="#">Configuracion</a></li>\r\n<li><a href="http://localhost/course/">Materias</a></li>\r\n<li><a href="http://localhost/admin/user.php">Miembros</a></li>\r\n<li><a href="http://localhost/admin/roles/assign.php?contextid=1">Asignar roles</a></li>\r\n</ul></div>', 1317396459),
(177, 'c8d69900d52dce07fd29ec6af65749ec', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/login/">Conectarse</a></li>\r\n<li><a href="http://localhost/login/signup.php">Registrarse</a></li>\r\n</ul></div>', 1317396460),
(178, 'ba514a88e8167c90be73a0365e7a7725', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n</ul></div>', 1317396460),
(179, '35834f8b740fdec031c32b5149c4ae44', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="#">Mis cursos</a></li>\r\n</ul></div>', 1317396460),
(180, 'c434c9e2f3f3c231e44cbc9d51757948', '<div class="no-overflow">Cartelera</div>', 1317396460),
(181, '13246cc763ae01ea704546c0297a0868', '<p></p><p>Cuando alguien se subscribe a un foro recibirá por correo electrónico una\n   copia de cada mensaje enviado a ese foro (los mensajes son enviados\n   &lt;?PHP echo $CFG-&gt;maxeditingtime/60 ?&gt; aproximadamente 30 minutos después\n   de haber sido escritos).</p>\n\n<p></p><p>Los participantes normalmente pueden escoger si desean o no suscribirse a cada uno\n   de los foros.</p>\n\n<p></p><p>Sin embargo, si un profesor fuerza la suscripción a un foro concreto, esta\n   posibilidad de elección es anulada y todos recibirán copias por\n   correo electrónico de los mensajes de ese foro.</p>\n\n<p></p><p>Esto es especialmente útil en el foro de Noticias y en los foros iniciados\n   al principio del curso (antes de que todos sepan que pueden suscribirse por sí mismos).</p>\n', 1317397599),
(182, '33fc3379124375d5f5cc5ceb9528e1ba', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/mod/forum/view.php?id=1">Cartelera</a></li>\r\n<li><a href="http://localhost/admin/settings.php?section=coursesettings">Configuracion</a></li>\r\n<li><a href="http://localhost/course/">Materias</a></li>\r\n<li><a href="http://localhost/admin/user.php">Miembros</a></li>\r\n<li><a href="http://localhost/admin/roles/assign.php?contextid=1">Asignar roles</a></li>\r\n</ul></div>', 1317934741),
(183, '6ba105f8934308fc3fcc3a84260cc3e0', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/mod/forum/view.php?id=1">Cartelera</a></li>\r\n<li><a href="http://localhost/admin/settings.php?section=coursesettings">Configuracion</a></li>\r\n<li><a href="http://localhost/course/">Materias</a></li>\r\n<li><a href="http://localhost/admin/user.php">Miembros</a></li>\r\n<li><a href="http://localhost/admin/roles/assign.php?contextid=1">Asignar roles</a></li>\r\n</ul></div>', 1317934751),
(184, 'ff1e1b8a2cba8971c10ca7bbc8b7204f', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/mod/forum/view.php?id=1">Cartelera</a></li>\r\n<li><a href="http://localhost/admin/settings.php?section=coursesettings">Configuracion</a></li>\r\n<li><a href="http://localhost/course/">Materias</a></li>\r\n<li><a href="http://localhost/admin/user.php">Miembros</a></li>\r\n<li><a href="http://localhost/admin/roles/assign.php?contextid=1">Asignar roles</a></li>\r\n</ul></div>', 1317934686),
(185, '1c9746b46107c90f7ebd9a500a7f4bae', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n</ul></div>', 1317955527),
(186, '1889b755baa6d0770388bb546493b46a', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/login/">Conectarse</a></li>\r\n<li><a href="http://localhost/login/signup.php">Registrarse</a></li>\r\n</ul></div>', 1317955527),
(187, '142701bb3c76897352720cacf2575fcc', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="#">Mis cursos</a></li>\r\n</ul></div>', 1317934686),
(188, '2e04671a4a476c85f446f0c588e51e16', '<p>Hola</p>', 1317955532),
(189, '9e092764bc86235918810a2c36788a9c', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/mod/forum/view.php?id=1">Cartelera</a></li>\r\n<li><a href="http://localhost/admin/settings.php?section=coursesettings">Configuracion</a></li>\r\n<li><a href="http://localhost/course/">Materias</a></li>\r\n<li><a href="http://localhost/admin/user.php">Miembros</a></li>\r\n<li><a href="http://localhost/admin/roles/assign.php?contextid=1">Asignar roles</a></li>\r\n</ul></div>', 1317931871),
(190, 'b351fd7639f38d777f12e7e6be1b0125', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/mod/forum/view.php?id=1">Cartelera</a></li>\r\n<li><a href="http://localhost/admin/settings.php?section=coursesettings">Configuracion</a></li>\r\n<li><a href="http://localhost/course/">Materias</a></li>\r\n<li><a href="http://localhost/admin/user.php">Miembros</a></li>\r\n<li><a href="http://localhost/admin/roles/assign.php?contextid=1">Asignar roles</a></li>\r\n</ul></div>', 1317933527),
(191, '7ec3772cfdd2d77c7f502c2fb8f1c7ab', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/mod/forum/view.php?id=1">Cartelera</a></li>\r\n<li><a href="http://localhost/admin/settings.php?section=coursesettings">Configuracion</a></li>\r\n<li><a href="http://localhost/course/">Materias</a></li>\r\n<li><a href="http://localhost/admin/user.php">Miembros</a></li>\r\n<li><a href="http://localhost/admin/roles/assign.php?contextid=1">Asignar roles</a></li>\r\n</ul></div>', 1317933091),
(192, 'fcae613ca343f1fc20774ccb4bb3a912', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/mod/forum/view.php?id=1">Cartelera</a></li>\r\n<li><a href="http://localhost/admin/settings.php?section=coursesettings">Configuracion</a></li>\r\n<li><a href="http://localhost/course/">Materias</a></li>\r\n<li><a href="http://localhost/admin/user.php">Miembros</a></li>\r\n<li><a href="http://localhost/admin/roles/assign.php?contextid=1">Asignar roles</a></li>\r\n</ul></div>', 1317929971),
(193, 'cddb8aa75771cac9f5f5356c25157a66', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/mod/forum/view.php?id=1">Cartelera</a></li>\r\n<li><a href="http://localhost/admin/settings.php?section=coursesettings">Configuracion</a></li>\r\n<li><a href="http://localhost/course/">Materias</a></li>\r\n<li><a href="http://localhost/admin/user.php">Miembros</a></li>\r\n<li><a href="http://localhost/admin/roles/assign.php?contextid=1">Asignar roles</a></li>\r\n</ul></div>', 1317929968),
(194, '8adbea1a87ece698b1e97a9c9ce97ff6', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/mod/forum/view.php?id=1">Cartelera</a></li>\r\n<li><a href="http://localhost/admin/settings.php?section=coursesettings">Configuracion</a></li>\r\n<li><a href="http://localhost/course/">Materias</a></li>\r\n<li><a href="http://localhost/admin/user.php">Miembros</a></li>\r\n<li><a href="http://localhost/admin/roles/assign.php?contextid=1">Asignar roles</a></li>\r\n</ul>\r\n<!--#include FILE="http://localhost/admin/user.php" --></div>', 1317930381),
(195, '0a53396ef905aa6aa5d9e750e0b5a880', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/mod/forum/view.php?id=1">Cartelera</a></li>\r\n<li><a href="http://localhost/admin/settings.php?section=coursesettings">Configuracion</a></li>\r\n<li><a href="http://localhost/course/">Materias</a></li>\r\n<li><a href="http://localhost/admin/user.php">Miembros</a></li>\r\n<li><a href="http://localhost/admin/roles/assign.php?contextid=1">Asignar roles</a></li>\r\n</ul>\r\n<!--#include FILE="la concha de tu madre" --></div>', 1317930414),
(196, 'd553cbace851c3f36a651926e4e0f2ec', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/mod/forum/view.php?id=1">Cartelera</a></li>\r\n<li><a href="http://localhost/admin/settings.php?section=coursesettings">Configuracion</a></li>\r\n<li><a href="http://localhost/course/">Materias</a></li>\r\n<li><a href="http://localhost/admin/user.php">Miembros</a></li>\r\n<li><a href="http://localhost/admin/roles/assign.php?contextid=1">Asignar roles</a></li>\r\n</ul>\r\n<script type="text/javascript">// <![CDATA[\r\ndocument.write("<p>Hola mundo</p>");\r\n// ]]></script></div>', 1317930781),
(197, 'e050611db39a9fbce8190918fa727c89', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/mod/forum/view.php?id=1">Cartelera</a></li>\r\n<li><a href="http://localhost/admin/settings.php?section=coursesettings">Configuracion</a></li>\r\n<li><a href="http://localhost/course/">Materias</a></li>\r\n<li><a href="http://localhost/admin/user.php">Miembros</a></li>\r\n<li><a href="http://localhost/admin/roles/assign.php?contextid=1">Asignar roles</a></li>\r\n</ul>\r\n<script type="text/javascript">// <![CDATA[\r\ndocument.write("Hola mundo");\r\n// ]]></script></div>', 1317930871),
(198, 'b8cc076a9e909903bacc07095dfdde2a', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/mod/forum/view.php?id=1">Cartelera</a></li>\r\n<li><a href="http://localhost/admin/settings.php?section=coursesettings">Configuracion</a></li>\r\n<li><a href="http://localhost/course/">Materias</a></li>\r\n<li><a href="http://localhost/admin/user.php">Miembros</a></li>\r\n<li><a href="http://localhost/admin/roles/assign.php?contextid=1">Asignar roles</a></li>\r\n</ul>\r\n<script type="text/javascript">// <![CDATA[\r\ndocument.write("<p>" + Date() + "</p>");\r\n// ]]></script></div>', 1317930939),
(199, '70512e26e319f0b6c569da6e492fcd65', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/mod/forum/view.php?id=1">Cartelera</a></li>\r\n<li><a href="http://localhost/admin/settings.php?section=coursesettings">Configuracion</a></li>\r\n<li><a href="http://localhost/course/">Materias</a></li>\r\n<li><a href="http://localhost/admin/user.php">Miembros</a></li>\r\n<li><a href="http://localhost/admin/roles/assign.php?contextid=1">Asignar roles</a></li>\r\n<![CDATA[\r\n<?php\r\necho "hola mundo";\r\n?>\r\n// ]]></ul></div>', 1317931193),
(200, '811349cbc99796592c6399beb9214df9', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/mod/forum/view.php?id=1">Cartelera</a></li>\r\n<li><a href="http://localhost/admin/settings.php?section=coursesettings">Configuracion</a></li>\r\n<li><a href="http://localhost/course/">Materias</a></li>\r\n<li><a href="http://localhost/admin/user.php">Miembros</a></li>\r\n<li><a href="http://localhost/admin/roles/assign.php?contextid=1">Asignar roles</a></li>\r\n</ul></div>', 1317934134),
(201, '24efdd457b2ec602a526b31dc09d775c', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/mod/forum/view.php?id=1">Cartelera</a></li>\r\n<li><a href="http://localhost/admin/settings.php?section=coursesettings">Configuracion</a></li>\r\n<li><a href="http://localhost/course/">Materias</a></li>\r\n<li><a href="http://localhost/admin/user.php">Miembros</a></li>\r\n<li><a href="http://localhost/admin/roles/assign.php?contextid=1">Asignar roles</a></li>\r\n<li><a href="http://localhost/course/enrolment.php">Asignar mediadores</a></li>\r\n</ul></div>', 1318012400),
(202, '0ee373016fe13c60d22c70e91519da2e', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="#">Mis cursos</a></li>\r\n<li><a href="http://localhost/course/enrolment.php">Agregar aprendices</a></li>\r\n</ul></div>', 1318012400),
(203, 'b348f447ebda2054c35f7d3e357e9084', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/mod/forum/view.php?id=1">Cartelera</a></li>\r\n<li><a href="http://localhost/admin/settings.php?section=coursesettings">Configuracion</a></li>\r\n<li><a href="http://localhost/course/">Materias</a></li>\r\n<li><a href="http://localhost/admin/user.php">Miembros</a></li>\r\n<li><a href="http://localhost/admin/roles/assign.php?contextid=1">Asignar roles</a></li>\r\n<li><a href="http://localhost/course/enrolment.php">Asignar mediadores</a></li>\r\n</ul></div>', 1318012354),
(204, 'd4620aa317e8246c765656fc1a5e039b', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="#">Mis cursos</a></li>\r\n<li><a href="http://localhost/course/enrolment.php">Agregar aprendices</a></li>\r\n</ul></div>', 1318012354),
(205, 'aeaee86689ade33c454f2bc7b901e8dd', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/mod/forum/view.php?id=1">Cartelera</a></li>\r\n<li><a href="http://localhost/admin/settings.php?section=coursesettings">Configuracion</a></li>\r\n<li><a href="http://localhost/course/">Materias</a></li>\r\n<li><a href="http://localhost/admin/user.php">Miembros</a></li>\r\n<li><a href="http://localhost/admin/roles/assign.php?contextid=1">Asignar roles</a></li>\r\n<li><a href="http://localhost/course/enrolment.php">Asignar mediadores</a></li>\r\n</ul></div>', 1317955527),
(206, 'e300fe80d258762653a93cdf307cad8d', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="#">Mis cursos</a></li>\r\n<li><a href="http://localhost/course/enrolment.php">Agregar aprendices</a></li>\r\n</ul></div>', 1317955527),
(207, '82be1c4032aedeb0de37f965cd480f1e', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/mod/forum/view.php?id=1">Cartelera</a></li>\r\n<li><a href="http://localhost/admin/settings.php?section=coursesettings">Configuracion</a></li>\r\n<li><a href="http://localhost/course/">Materias</a></li>\r\n<li><a href="http://localhost/admin/user.php">Miembros</a></li>\r\n<li><a href="http://localhost/admin/roles/assign.php?contextid=1">Asignar roles</a></li>\r\n<li><a href="http://localhost/course/enrolment.php">Asignar mediadores</a></li>\r\n</ul></div>', 1318011634),
(208, '29e614729f44084bc69dca05de480edf', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="#">Mis cursos</a></li>\r\n<li><a href="http://localhost/course/enrolment.php">Agregar aprendices</a></li>\r\n</ul></div>', 1318011635),
(209, '3f08bbd027f4d5eaf06bcad803ca7818', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/mod/forum/view.php?id=1">Cartelera</a></li>\r\n<li><a href="http://localhost/admin/settings.php?section=coursesettings">Configuracion</a></li>\r\n<li><a href="http://localhost/course/">Materias</a></li>\r\n<li><a href="http://localhost/admin/user.php">Miembros</a></li>\r\n<li><a href="http://localhost/admin/roles/assign.php?contextid=1">Asignar roles</a></li>\r\n<li><a href="http://localhost/course/enrolment.php">Asignar mediadores</a></li>\r\n</ul></div>', 1318010599),
(210, '5255d883e112dac5cd3f609be70b55a7', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="#">Mis cursos</a></li>\r\n<li><a href="http://localhost/course/enrolment.php">Agregar aprendices</a></li>\r\n</ul></div>', 1318010599),
(211, '60e18ca1bd1d4f58a951bf78e0451994', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/mod/forum/view.php?id=1">Cartelera</a></li>\r\n<li><a href="http://localhost/admin/settings.php?section=coursesettings">Configuracion</a></li>\r\n<li><a href="http://localhost/course/">Materias</a></li>\r\n<li><a href="http://localhost/admin/user.php">Miembros</a></li>\r\n<li><a href="http://localhost/admin/roles/assign.php?contextid=1">Asignar roles</a></li>\r\n<li><a href="http://localhost/course/enrolment.php">Asignar mediadores</a></li>\r\n</ul></div>', 1318012394),
(212, '2d9ff571ca80541d997cd80a223298a1', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="#">Mis cursos</a></li>\r\n<li><a href="http://localhost/course/enrolment.php">Agregar aprendices</a></li>\r\n</ul></div>', 1318012394),
(213, 'f479d2e679e74ec54a50711ea8fd8fb1', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/mod/forum/view.php?id=1">Cartelera</a></li>\r\n<li><a href="http://localhost/admin/settings.php?section=coursesettings">Configuracion</a></li>\r\n<li><a href="http://localhost/course/">Materias</a></li>\r\n<li><a href="http://localhost/admin/user.php">Miembros</a></li>\r\n<li><a href="http://localhost/admin/roles/assign.php?contextid=1">Asignar roles</a></li>\r\n<li><a href="http://localhost/course/enrolment.php">Asignar mediadores</a></li>\r\n</ul></div>', 1317936945),
(214, '84312e11f1f9f081380529137cf3648e', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/login/">Conectarse</a></li>\r\n<li><a href="http://localhost/login/signup.php">Registrarse</a></li>\r\n</ul></div>', 1317936945),
(215, 'aa4872bfdd1635280d50e1b91a008bb8', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n</ul></div>', 1317936946),
(216, '298d51e575582dcbab493642e69f7997', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="#">Mis cursos</a></li>\r\n<li><a href="http://localhost/course/enrolment.php">Agregar aprendices</a></li>\r\n</ul></div>', 1317936946),
(217, '7c87a59d596a18642d299053d22e76ba', '<div class="no-overflow"><p>Foro Posta</p></div>', 1317936875),
(218, 'fa40be534cd6d2ddf07534f89f74f247', '<p>hghjg</p>', 1317936901),
(219, '2870216756a26a5ee898c82e03364099', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/course/solicitud.php">Registrarse en curso</a></li>\r\n</ul></div>', 1318012354),
(220, '2a9be49ba7f9897278f8cc04bb222149', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/course/solicitud.php">Registrarse en curso</a></li>\r\n</ul></div>', 1317955527),
(221, '778433aed46c63430d3b9d34b4cf9334', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/mod/forum/view.php?id=1">Cartelera</a></li>\r\n<li><a href="http://localhost/admin/settings.php?section=coursesettings">Configuracion</a></li>\r\n<li><a href="http://localhost/course/">Materias</a></li>\r\n<li><a href="http://localhost/admin/user.php">Miembros</a></li>\r\n<li><a href="http://localhost/admin/roles/assign.php?contextid=1">Asignar roles</a></li>\r\n<li><a href="http://localhost/course/enrolment.php">Asignar mediadores</a></li>\r\n</ul></div>', 1317945544),
(222, '9344b9ea4978fdeeeb94416ee5d8448d', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/login/">Conectarse</a></li>\r\n<li><a href="http://localhost/login/signup.php">Registrarse</a></li>\r\n</ul></div>', 1317945544),
(223, '2a4b674648c918721c98d7c5de856034', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n</ul></div>', 1317945544),
(224, 'feea3b4f84c4e9357cbe24bba6eb9075', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/course/solicitud.php">Registrarse en curso</a></li>\r\n</ul></div>', 1317945544),
(225, '97370f305ae0ff9c591f887e759a82d2', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="#">Mis cursos</a></li>\r\n<li><a href="http://localhost/course/enrolment.php">Agregar aprendices</a></li>\r\n</ul></div>', 1317945544),
(226, '738d7aafdfd56dddae8732e736b6dd18', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/course/solicitud.php">Registrarse en curso</a></li>\r\n</ul></div>', 1318012400),
(227, '3ad1769c32a85befdd4d0985604b7490', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/course/solicitud.php">Registrarse en curso</a></li>\r\n</ul></div>', 1318010599),
(228, '87bc2846997da2fdb219d10cee864c58', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/course/solicitud.php">Registrarse en curso</a></li>\r\n</ul></div>', 1318011635),
(229, '6ff444e251415aecceb6732def467354', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/mod/forum/view.php?id=1">Cartelera</a></li>\r\n<li><a href="http://localhost/admin/settings.php?section=coursesettings">Configuracion</a></li>\r\n<li><a href="http://localhost/course/">Materias</a></li>\r\n<li><a href="http://localhost/admin/user.php">Miembros</a></li>\r\n<li><a href="http://localhost/admin/roles/assign.php?contextid=1">Asignar roles</a></li>\r\n<li><a href="http://localhost/course/enrolment.php">Asignar mediadores</a></li>\r\n</ul></div>', 1318012356),
(230, '8d1620d24d0bc2d52d94d86c2fbf7aeb', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/course/solicitud.php">Registrarse en curso</a></li>\r\n</ul></div>', 1318012357),
(231, 'ed5fcce243674f0687aea39cb8b60f89', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="#">Mis cursos</a></li>\r\n<li><a href="http://localhost/course/enrolment.php">Agregar aprendices</a></li>\r\n</ul></div>', 1318012357),
(232, '93d9c259f982ce19e42bb4704a7c74dd', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/course/solicitud.php">Registrarse en curso</a></li>\r\n</ul></div>', 1318012394),
(233, '69e6573fca8e3ce37f8727231f5297f7', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/mod/forum/view.php?id=1">Cartelera</a></li>\r\n<li><a href="http://localhost/admin/settings.php?section=coursesettings">Configuracion</a></li>\r\n<li><a href="http://localhost/course/">Materias</a></li>\r\n<li><a href="http://localhost/admin/user.php">Miembros</a></li>\r\n<li><a href="http://localhost/admin/roles/assign.php?contextid=1">Asignar roles</a></li>\r\n<li><a href="http://localhost/course/enrolment.php">Asignar mediadores</a></li>\r\n</ul></div>', 1317997736),
(234, '74d15bc489870346a5081b097f66377e', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/course/solicitud.php">Registrarse en curso</a></li>\r\n</ul></div>', 1317997736),
(235, 'f160b3c1581dc73a879006a4b34779f1', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="#">Mis cursos</a></li>\r\n<li><a href="http://localhost/course/enrolment.php">Agregar aprendices</a></li>\r\n</ul></div>', 1317997736),
(236, '9c429b059a2ae071fd862e4e3e47c2bd', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/mod/forum/view.php?id=1">Cartelera</a></li>\r\n<li><a href="http://localhost/admin/settings.php?section=coursesettings">Configuracion</a></li>\r\n<li><a href="http://localhost/course/">Materias</a></li>\r\n<li><a href="http://localhost/admin/user.php">Miembros</a></li>\r\n<li><a href="http://localhost/admin/roles/assign.php?contextid=1">Asignar roles</a></li>\r\n<li><a href="http://localhost/course/enrolment.php">Asignar mediadores</a></li>\r\n</ul></div>', 1318006617),
(237, '802b2bf79ba6d819a0c6c25c16f78419', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="http://localhost/course/solicitud.php">Registrarse en curso</a></li>\r\n</ul></div>', 1318006617),
(238, '0f8d2b1159e8540787a25ec46209bdfd', '<div class="no-overflow"><ul>\r\n<li><a href="http://localhost/">Pagina principal</a></li>\r\n<li><a href="#">Mis cursos</a></li>\r\n<li><a href="http://localhost/course/enrolment.php">Agregar aprendices</a></li>\r\n</ul></div>', 1318006617);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_capabilities`
--

CREATE TABLE IF NOT EXISTS `mdl_capabilities` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `captype` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contextlevel` bigint(10) unsigned NOT NULL DEFAULT '0',
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `riskbitmask` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_capa_nam_uix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='this defines all capabilities' AUTO_INCREMENT=368 ;

--
-- Volcado de datos para la tabla `mdl_capabilities`
--

INSERT INTO `mdl_capabilities` (`id`, `name`, `captype`, `contextlevel`, `component`, `riskbitmask`) VALUES
(1, 'moodle/site:config', 'write', 10, 'moodle', 62),
(2, 'moodle/site:readallmessages', 'read', 10, 'moodle', 8),
(3, 'moodle/site:sendmessage', 'write', 10, 'moodle', 16),
(4, 'moodle/site:approvecourse', 'write', 10, 'moodle', 4),
(5, 'moodle/backup:backupcourse', 'write', 50, 'moodle', 28),
(6, 'moodle/backup:backupsection', 'write', 50, 'moodle', 28),
(7, 'moodle/backup:backupactivity', 'write', 70, 'moodle', 28),
(8, 'moodle/backup:backuptargethub', 'write', 50, 'moodle', 28),
(9, 'moodle/backup:backuptargetimport', 'write', 50, 'moodle', 28),
(10, 'moodle/backup:downloadfile', 'write', 50, 'moodle', 28),
(11, 'moodle/backup:configure', 'write', 50, 'moodle', 28),
(12, 'moodle/backup:userinfo', 'read', 50, 'moodle', 8),
(13, 'moodle/backup:anonymise', 'read', 50, 'moodle', 8),
(14, 'moodle/restore:restorecourse', 'write', 50, 'moodle', 28),
(15, 'moodle/restore:restoresection', 'write', 50, 'moodle', 28),
(16, 'moodle/restore:restoreactivity', 'write', 50, 'moodle', 28),
(17, 'moodle/restore:viewautomatedfilearea', 'write', 50, 'moodle', 28),
(18, 'moodle/restore:restoretargethub', 'write', 50, 'moodle', 28),
(19, 'moodle/restore:restoretargetimport', 'write', 50, 'moodle', 28),
(20, 'moodle/restore:uploadfile', 'write', 50, 'moodle', 28),
(21, 'moodle/restore:configure', 'write', 50, 'moodle', 28),
(22, 'moodle/restore:rolldates', 'write', 50, 'moodle', 0),
(23, 'moodle/restore:userinfo', 'write', 50, 'moodle', 30),
(24, 'moodle/restore:createuser', 'write', 10, 'moodle', 24),
(25, 'moodle/site:manageblocks', 'write', 80, 'moodle', 20),
(26, 'moodle/site:accessallgroups', 'read', 50, 'moodle', 0),
(27, 'moodle/site:viewfullnames', 'read', 50, 'moodle', 0),
(28, 'moodle/site:viewreports', 'read', 50, 'moodle', 8),
(29, 'moodle/site:trustcontent', 'write', 50, 'moodle', 4),
(30, 'moodle/site:uploadusers', 'write', 10, 'moodle', 24),
(31, 'moodle/filter:manage', 'write', 50, 'moodle', 0),
(32, 'moodle/user:create', 'write', 10, 'moodle', 24),
(33, 'moodle/user:delete', 'write', 10, 'moodle', 8),
(34, 'moodle/user:update', 'write', 10, 'moodle', 24),
(35, 'moodle/user:viewdetails', 'read', 50, 'moodle', 0),
(36, 'moodle/user:viewalldetails', 'read', 30, 'moodle', 8),
(37, 'moodle/user:viewhiddendetails', 'read', 50, 'moodle', 8),
(38, 'moodle/user:loginas', 'write', 50, 'moodle', 30),
(39, 'moodle/user:managesyspages', 'write', 10, 'moodle', 0),
(40, 'moodle/user:manageblocks', 'write', 30, 'moodle', 0),
(41, 'moodle/user:manageownblocks', 'write', 10, 'moodle', 0),
(42, 'moodle/user:manageownfiles', 'write', 10, 'moodle', 0),
(43, 'moodle/my:configsyspages', 'write', 10, 'moodle', 0),
(44, 'moodle/role:assign', 'write', 50, 'moodle', 28),
(45, 'moodle/role:review', 'read', 50, 'moodle', 8),
(46, 'moodle/role:override', 'write', 50, 'moodle', 28),
(47, 'moodle/role:safeoverride', 'write', 50, 'moodle', 16),
(48, 'moodle/role:manage', 'write', 10, 'moodle', 28),
(49, 'moodle/role:switchroles', 'read', 50, 'moodle', 12),
(50, 'moodle/category:manage', 'write', 40, 'moodle', 4),
(51, 'moodle/category:viewhiddencategories', 'read', 40, 'moodle', 0),
(52, 'moodle/cohort:manage', 'write', 40, 'moodle', 0),
(53, 'moodle/cohort:assign', 'write', 40, 'moodle', 0),
(54, 'moodle/cohort:view', 'read', 50, 'moodle', 0),
(55, 'moodle/course:create', 'write', 40, 'moodle', 4),
(56, 'moodle/course:request', 'write', 10, 'moodle', 0),
(57, 'moodle/course:delete', 'write', 50, 'moodle', 32),
(58, 'moodle/course:update', 'write', 50, 'moodle', 4),
(59, 'moodle/course:view', 'read', 50, 'moodle', 0),
(60, 'moodle/course:enrolreview', 'read', 50, 'moodle', 8),
(61, 'moodle/course:enrolconfig', 'write', 50, 'moodle', 8),
(62, 'moodle/course:bulkmessaging', 'write', 50, 'moodle', 16),
(63, 'moodle/course:viewhiddenuserfields', 'read', 50, 'moodle', 8),
(64, 'moodle/course:viewhiddencourses', 'read', 50, 'moodle', 0),
(65, 'moodle/course:visibility', 'write', 50, 'moodle', 0),
(66, 'moodle/course:managefiles', 'write', 50, 'moodle', 4),
(67, 'moodle/course:manageactivities', 'write', 50, 'moodle', 4),
(68, 'moodle/course:activityvisibility', 'write', 50, 'moodle', 0),
(69, 'moodle/course:viewhiddenactivities', 'write', 50, 'moodle', 0),
(70, 'moodle/course:viewparticipants', 'read', 50, 'moodle', 0),
(71, 'moodle/course:changefullname', 'write', 50, 'moodle', 4),
(72, 'moodle/course:changeshortname', 'write', 50, 'moodle', 4),
(73, 'moodle/course:changeidnumber', 'write', 50, 'moodle', 4),
(74, 'moodle/course:changecategory', 'write', 50, 'moodle', 4),
(75, 'moodle/course:changesummary', 'write', 50, 'moodle', 4),
(76, 'moodle/site:viewparticipants', 'read', 10, 'moodle', 0),
(77, 'moodle/course:viewscales', 'read', 50, 'moodle', 0),
(78, 'moodle/course:managescales', 'write', 50, 'moodle', 0),
(79, 'moodle/course:managegroups', 'write', 50, 'moodle', 0),
(80, 'moodle/course:reset', 'write', 50, 'moodle', 32),
(81, 'moodle/blog:view', 'read', 10, 'moodle', 0),
(82, 'moodle/blog:search', 'read', 10, 'moodle', 0),
(83, 'moodle/blog:viewdrafts', 'read', 10, 'moodle', 8),
(84, 'moodle/blog:create', 'write', 10, 'moodle', 16),
(85, 'moodle/blog:manageentries', 'write', 10, 'moodle', 16),
(86, 'moodle/blog:manageexternal', 'write', 10, 'moodle', 16),
(87, 'moodle/blog:associatecourse', 'write', 50, 'moodle', 0),
(88, 'moodle/blog:associatemodule', 'write', 70, 'moodle', 0),
(89, 'moodle/calendar:manageownentries', 'write', 50, 'moodle', 16),
(90, 'moodle/calendar:managegroupentries', 'write', 50, 'moodle', 16),
(91, 'moodle/calendar:manageentries', 'write', 50, 'moodle', 16),
(92, 'moodle/user:editprofile', 'write', 30, 'moodle', 24),
(93, 'moodle/user:editownprofile', 'write', 10, 'moodle', 16),
(94, 'moodle/user:changeownpassword', 'write', 10, 'moodle', 0),
(95, 'moodle/user:readuserposts', 'read', 30, 'moodle', 0),
(96, 'moodle/user:readuserblogs', 'read', 30, 'moodle', 0),
(97, 'moodle/user:viewuseractivitiesreport', 'read', 30, 'moodle', 8),
(98, 'moodle/user:editmessageprofile', 'write', 30, 'moodle', 16),
(99, 'moodle/user:editownmessageprofile', 'write', 10, 'moodle', 0),
(100, 'moodle/question:managecategory', 'write', 50, 'moodle', 20),
(101, 'moodle/question:add', 'write', 50, 'moodle', 20),
(102, 'moodle/question:editmine', 'write', 50, 'moodle', 20),
(103, 'moodle/question:editall', 'write', 50, 'moodle', 20),
(104, 'moodle/question:viewmine', 'read', 50, 'moodle', 0),
(105, 'moodle/question:viewall', 'read', 50, 'moodle', 0),
(106, 'moodle/question:usemine', 'read', 50, 'moodle', 0),
(107, 'moodle/question:useall', 'read', 50, 'moodle', 0),
(108, 'moodle/question:movemine', 'write', 50, 'moodle', 0),
(109, 'moodle/question:moveall', 'write', 50, 'moodle', 0),
(110, 'moodle/question:config', 'write', 10, 'moodle', 2),
(111, 'moodle/question:flag', 'write', 50, 'moodle', 0),
(112, 'moodle/site:doclinks', 'read', 10, 'moodle', 0),
(113, 'moodle/course:sectionvisibility', 'write', 50, 'moodle', 0),
(114, 'moodle/course:useremail', 'write', 50, 'moodle', 0),
(115, 'moodle/course:viewhiddensections', 'write', 50, 'moodle', 0),
(116, 'moodle/course:setcurrentsection', 'write', 50, 'moodle', 0),
(117, 'moodle/site:mnetlogintoremote', 'read', 10, 'moodle', 0),
(118, 'moodle/grade:viewall', 'read', 50, 'moodle', 8),
(119, 'moodle/grade:view', 'read', 50, 'moodle', 0),
(120, 'moodle/grade:viewhidden', 'read', 50, 'moodle', 8),
(121, 'moodle/grade:import', 'write', 50, 'moodle', 12),
(122, 'moodle/grade:export', 'read', 50, 'moodle', 8),
(123, 'moodle/grade:manage', 'write', 50, 'moodle', 12),
(124, 'moodle/grade:edit', 'write', 50, 'moodle', 12),
(125, 'moodle/grade:manageoutcomes', 'write', 50, 'moodle', 0),
(126, 'moodle/grade:manageletters', 'write', 50, 'moodle', 0),
(127, 'moodle/grade:hide', 'write', 50, 'moodle', 0),
(128, 'moodle/grade:lock', 'write', 50, 'moodle', 0),
(129, 'moodle/grade:unlock', 'write', 50, 'moodle', 0),
(130, 'moodle/my:manageblocks', 'write', 10, 'moodle', 0),
(131, 'moodle/notes:view', 'read', 50, 'moodle', 0),
(132, 'moodle/notes:manage', 'write', 50, 'moodle', 16),
(133, 'moodle/tag:manage', 'write', 10, 'moodle', 16),
(134, 'moodle/tag:create', 'write', 10, 'moodle', 16),
(135, 'moodle/tag:edit', 'write', 10, 'moodle', 16),
(136, 'moodle/tag:editblocks', 'write', 10, 'moodle', 0),
(137, 'moodle/block:view', 'read', 80, 'moodle', 0),
(138, 'moodle/block:edit', 'write', 80, 'moodle', 20),
(139, 'moodle/portfolio:export', 'read', 10, 'moodle', 0),
(140, 'moodle/comment:view', 'read', 50, 'moodle', 0),
(141, 'moodle/comment:post', 'write', 50, 'moodle', 24),
(142, 'moodle/comment:delete', 'write', 50, 'moodle', 32),
(143, 'moodle/webservice:createtoken', 'write', 10, 'moodle', 62),
(144, 'moodle/webservice:createmobiletoken', 'write', 10, 'moodle', 62),
(145, 'moodle/rating:view', 'read', 50, 'moodle', 0),
(146, 'moodle/rating:viewany', 'read', 50, 'moodle', 8),
(147, 'moodle/rating:viewall', 'read', 50, 'moodle', 8),
(148, 'moodle/rating:rate', 'write', 50, 'moodle', 0),
(149, 'moodle/course:publish', 'write', 10, 'moodle', 24),
(150, 'moodle/course:markcomplete', 'write', 50, 'moodle', 0),
(151, 'moodle/community:add', 'write', 10, 'moodle', 0),
(152, 'moodle/community:download', 'write', 10, 'moodle', 0),
(153, 'mod/assignment:view', 'read', 70, 'mod_assignment', 0),
(154, 'mod/assignment:submit', 'write', 70, 'mod_assignment', 0),
(155, 'mod/assignment:grade', 'write', 70, 'mod_assignment', 4),
(156, 'mod/assignment:exportownsubmission', 'read', 70, 'mod_assignment', 0),
(157, 'mod/chat:chat', 'write', 70, 'mod_chat', 16),
(158, 'mod/chat:readlog', 'read', 70, 'mod_chat', 0),
(159, 'mod/chat:deletelog', 'write', 70, 'mod_chat', 0),
(160, 'mod/chat:exportparticipatedsession', 'read', 70, 'mod_chat', 8),
(161, 'mod/chat:exportsession', 'read', 70, 'mod_chat', 8),
(162, 'mod/choice:choose', 'write', 70, 'mod_choice', 0),
(163, 'mod/choice:readresponses', 'read', 70, 'mod_choice', 0),
(164, 'mod/choice:deleteresponses', 'write', 70, 'mod_choice', 0),
(165, 'mod/choice:downloadresponses', 'read', 70, 'mod_choice', 0),
(166, 'mod/data:viewentry', 'read', 70, 'mod_data', 0),
(167, 'mod/data:writeentry', 'write', 70, 'mod_data', 16),
(168, 'mod/data:comment', 'write', 70, 'mod_data', 16),
(169, 'mod/data:rate', 'write', 70, 'mod_data', 0),
(170, 'mod/data:viewrating', 'read', 70, 'mod_data', 0),
(171, 'mod/data:viewanyrating', 'read', 70, 'mod_data', 8),
(172, 'mod/data:viewallratings', 'read', 70, 'mod_data', 8),
(173, 'mod/data:approve', 'write', 70, 'mod_data', 16),
(174, 'mod/data:manageentries', 'write', 70, 'mod_data', 16),
(175, 'mod/data:managecomments', 'write', 70, 'mod_data', 16),
(176, 'mod/data:managetemplates', 'write', 70, 'mod_data', 20),
(177, 'mod/data:viewalluserpresets', 'read', 70, 'mod_data', 0),
(178, 'mod/data:manageuserpresets', 'write', 70, 'mod_data', 20),
(179, 'mod/data:exportentry', 'read', 70, 'mod_data', 8),
(180, 'mod/data:exportownentry', 'read', 70, 'mod_data', 0),
(181, 'mod/data:exportallentries', 'read', 70, 'mod_data', 8),
(182, 'mod/feedback:view', 'read', 70, 'mod_feedback', 0),
(183, 'mod/feedback:complete', 'write', 70, 'mod_feedback', 16),
(184, 'mod/feedback:viewanalysepage', 'read', 70, 'mod_feedback', 8),
(185, 'mod/feedback:deletesubmissions', 'write', 70, 'mod_feedback', 0),
(186, 'mod/feedback:mapcourse', 'write', 70, 'mod_feedback', 0),
(187, 'mod/feedback:edititems', 'write', 70, 'mod_feedback', 20),
(188, 'mod/feedback:createprivatetemplate', 'write', 70, 'mod_feedback', 16),
(189, 'mod/feedback:createpublictemplate', 'write', 70, 'mod_feedback', 16),
(190, 'mod/feedback:deletetemplate', 'write', 70, 'mod_feedback', 0),
(191, 'mod/feedback:viewreports', 'read', 70, 'mod_feedback', 8),
(192, 'mod/feedback:receivemail', 'read', 70, 'mod_feedback', 8),
(193, 'mod/folder:view', 'read', 70, 'mod_folder', 0),
(194, 'mod/folder:managefiles', 'write', 70, 'mod_folder', 16),
(195, 'mod/forum:viewdiscussion', 'read', 70, 'mod_forum', 0),
(196, 'mod/forum:viewhiddentimedposts', 'read', 70, 'mod_forum', 0),
(197, 'mod/forum:startdiscussion', 'write', 70, 'mod_forum', 16),
(198, 'mod/forum:replypost', 'write', 70, 'mod_forum', 16),
(199, 'mod/forum:addnews', 'write', 70, 'mod_forum', 16),
(200, 'mod/forum:replynews', 'write', 70, 'mod_forum', 16),
(201, 'mod/forum:viewrating', 'read', 70, 'mod_forum', 0),
(202, 'mod/forum:viewanyrating', 'read', 70, 'mod_forum', 8),
(203, 'mod/forum:viewallratings', 'read', 70, 'mod_forum', 8),
(204, 'mod/forum:rate', 'write', 70, 'mod_forum', 0),
(205, 'mod/forum:createattachment', 'write', 70, 'mod_forum', 16),
(206, 'mod/forum:deleteownpost', 'read', 70, 'mod_forum', 0),
(207, 'mod/forum:deleteanypost', 'read', 70, 'mod_forum', 0),
(208, 'mod/forum:splitdiscussions', 'read', 70, 'mod_forum', 0),
(209, 'mod/forum:movediscussions', 'read', 70, 'mod_forum', 0),
(210, 'mod/forum:editanypost', 'write', 70, 'mod_forum', 16),
(211, 'mod/forum:viewqandawithoutposting', 'read', 70, 'mod_forum', 0),
(212, 'mod/forum:viewsubscribers', 'read', 70, 'mod_forum', 0),
(213, 'mod/forum:managesubscriptions', 'read', 70, 'mod_forum', 16),
(214, 'mod/forum:initialsubscriptions', 'read', 70, 'mod_forum', 0),
(215, 'mod/forum:postwithoutthrottling', 'write', 70, 'mod_forum', 16),
(216, 'mod/forum:exportdiscussion', 'read', 70, 'mod_forum', 8),
(217, 'mod/forum:exportpost', 'read', 70, 'mod_forum', 8),
(218, 'mod/forum:exportownpost', 'read', 70, 'mod_forum', 8),
(219, 'mod/glossary:write', 'write', 70, 'mod_glossary', 16),
(220, 'mod/glossary:manageentries', 'write', 70, 'mod_glossary', 16),
(221, 'mod/glossary:managecategories', 'write', 70, 'mod_glossary', 16),
(222, 'mod/glossary:comment', 'write', 70, 'mod_glossary', 16),
(223, 'mod/glossary:managecomments', 'write', 70, 'mod_glossary', 16),
(224, 'mod/glossary:import', 'write', 70, 'mod_glossary', 16),
(225, 'mod/glossary:export', 'read', 70, 'mod_glossary', 0),
(226, 'mod/glossary:approve', 'write', 70, 'mod_glossary', 16),
(227, 'mod/glossary:rate', 'write', 70, 'mod_glossary', 0),
(228, 'mod/glossary:viewrating', 'read', 70, 'mod_glossary', 0),
(229, 'mod/glossary:viewanyrating', 'read', 70, 'mod_glossary', 8),
(230, 'mod/glossary:viewallratings', 'read', 70, 'mod_glossary', 8),
(231, 'mod/glossary:exportentry', 'read', 70, 'mod_glossary', 8),
(232, 'mod/glossary:exportownentry', 'read', 70, 'mod_glossary', 0),
(233, 'mod/imscp:view', 'read', 70, 'mod_imscp', 0),
(234, 'mod/lesson:edit', 'write', 70, 'mod_lesson', 4),
(235, 'mod/lesson:manage', 'write', 70, 'mod_lesson', 0),
(236, 'mod/page:view', 'read', 70, 'mod_page', 0),
(237, 'mod/quiz:view', 'read', 70, 'mod_quiz', 0),
(238, 'mod/quiz:attempt', 'write', 70, 'mod_quiz', 16),
(239, 'mod/quiz:reviewmyattempts', 'read', 70, 'mod_quiz', 0),
(240, 'mod/quiz:manage', 'write', 70, 'mod_quiz', 16),
(241, 'mod/quiz:manageoverrides', 'write', 70, 'mod_quiz', 0),
(242, 'mod/quiz:preview', 'write', 70, 'mod_quiz', 0),
(243, 'mod/quiz:grade', 'write', 70, 'mod_quiz', 16),
(244, 'mod/quiz:regrade', 'write', 70, 'mod_quiz', 16),
(245, 'mod/quiz:viewreports', 'read', 70, 'mod_quiz', 8),
(246, 'mod/quiz:deleteattempts', 'write', 70, 'mod_quiz', 32),
(247, 'mod/quiz:ignoretimelimits', 'read', 70, 'mod_quiz', 0),
(248, 'mod/quiz:emailconfirmsubmission', 'read', 70, 'mod_quiz', 0),
(249, 'mod/quiz:emailnotifysubmission', 'read', 70, 'mod_quiz', 0),
(250, 'mod/resource:view', 'read', 70, 'mod_resource', 0),
(251, 'mod/scorm:viewreport', 'read', 70, 'mod_scorm', 0),
(252, 'mod/scorm:skipview', 'write', 70, 'mod_scorm', 0),
(253, 'mod/scorm:savetrack', 'write', 70, 'mod_scorm', 0),
(254, 'mod/scorm:viewscores', 'read', 70, 'mod_scorm', 0),
(255, 'mod/scorm:deleteresponses', 'read', 70, 'mod_scorm', 0),
(256, 'mod/survey:participate', 'read', 70, 'mod_survey', 0),
(257, 'mod/survey:readresponses', 'read', 70, 'mod_survey', 0),
(258, 'mod/survey:download', 'read', 70, 'mod_survey', 0),
(259, 'mod/url:view', 'read', 70, 'mod_url', 0),
(260, 'mod/wiki:viewpage', 'read', 70, 'mod_wiki', 0),
(261, 'mod/wiki:editpage', 'write', 70, 'mod_wiki', 16),
(262, 'mod/wiki:createpage', 'write', 70, 'mod_wiki', 16),
(263, 'mod/wiki:viewcomment', 'read', 70, 'mod_wiki', 0),
(264, 'mod/wiki:editcomment', 'write', 70, 'mod_wiki', 16),
(265, 'mod/wiki:managecomment', 'write', 70, 'mod_wiki', 0),
(266, 'mod/wiki:managefiles', 'write', 70, 'mod_wiki', 0),
(267, 'mod/wiki:overridelock', 'write', 70, 'mod_wiki', 0),
(268, 'mod/wiki:managewiki', 'write', 70, 'mod_wiki', 0),
(269, 'mod/workshop:view', 'read', 70, 'mod_workshop', 0),
(270, 'mod/workshop:switchphase', 'write', 70, 'mod_workshop', 0),
(271, 'mod/workshop:editdimensions', 'write', 70, 'mod_workshop', 4),
(272, 'mod/workshop:submit', 'write', 70, 'mod_workshop', 0),
(273, 'mod/workshop:peerassess', 'write', 70, 'mod_workshop', 0),
(274, 'mod/workshop:manageexamples', 'write', 70, 'mod_workshop', 0),
(275, 'mod/workshop:allocate', 'write', 70, 'mod_workshop', 0),
(276, 'mod/workshop:publishsubmissions', 'write', 70, 'mod_workshop', 0),
(277, 'mod/workshop:viewauthornames', 'read', 70, 'mod_workshop', 0),
(278, 'mod/workshop:viewreviewernames', 'read', 70, 'mod_workshop', 0),
(279, 'mod/workshop:viewallsubmissions', 'read', 70, 'mod_workshop', 0),
(280, 'mod/workshop:viewpublishedsubmissions', 'read', 70, 'mod_workshop', 0),
(281, 'mod/workshop:viewauthorpublished', 'read', 70, 'mod_workshop', 0),
(282, 'mod/workshop:viewallassessments', 'read', 70, 'mod_workshop', 0),
(283, 'mod/workshop:overridegrades', 'write', 70, 'mod_workshop', 0),
(284, 'mod/workshop:ignoredeadlines', 'write', 70, 'mod_workshop', 0),
(285, 'enrol/authorize:config', 'write', 50, 'enrol_authorize', 0),
(286, 'enrol/authorize:manage', 'write', 50, 'enrol_authorize', 0),
(287, 'enrol/authorize:unenrol', 'write', 50, 'enrol_authorize', 0),
(288, 'enrol/authorize:unenrolself', 'write', 50, 'enrol_authorize', 0),
(289, 'enrol/authorize:managepayments', 'write', 10, 'enrol_authorize', 8),
(290, 'enrol/authorize:uploadcsv', 'write', 10, 'enrol_authorize', 4),
(291, 'enrol/category:synchronised', 'write', 10, 'enrol_category', 0),
(292, 'enrol/cohort:config', 'write', 50, 'enrol_cohort', 0),
(293, 'enrol/guest:config', 'write', 50, 'enrol_guest', 0),
(294, 'enrol/ldap:manage', 'write', 50, 'enrol_ldap', 0),
(295, 'enrol/manual:config', 'write', 50, 'enrol_manual', 0),
(296, 'enrol/manual:enrol', 'write', 50, 'enrol_manual', 0),
(297, 'enrol/manual:manage', 'write', 50, 'enrol_manual', 0),
(298, 'enrol/manual:unenrol', 'write', 50, 'enrol_manual', 0),
(299, 'enrol/manual:unenrolself', 'write', 50, 'enrol_manual', 0),
(300, 'enrol/meta:config', 'write', 50, 'enrol_meta', 0),
(301, 'enrol/meta:selectaslinked', 'read', 50, 'enrol_meta', 0),
(302, 'enrol/paypal:config', 'write', 50, 'enrol_paypal', 0),
(303, 'enrol/paypal:manage', 'write', 50, 'enrol_paypal', 0),
(304, 'enrol/paypal:unenrol', 'write', 50, 'enrol_paypal', 0),
(305, 'enrol/paypal:unenrolself', 'write', 50, 'enrol_paypal', 0),
(306, 'enrol/self:config', 'write', 50, 'enrol_self', 0),
(307, 'enrol/self:manage', 'write', 50, 'enrol_self', 0),
(308, 'enrol/self:unenrolself', 'write', 50, 'enrol_self', 0),
(309, 'enrol/self:unenrol', 'write', 50, 'enrol_self', 0),
(310, 'block/online_users:viewlist', 'read', 80, 'block_online_users', 0),
(311, 'block/rss_client:manageownfeeds', 'write', 80, 'block_rss_client', 0),
(312, 'block/rss_client:manageanyfeeds', 'write', 80, 'block_rss_client', 16),
(313, 'report/courseoverview:view', 'read', 10, 'report_courseoverview', 8),
(314, 'report/customlang:view', 'read', 10, 'report_customlang', 2),
(315, 'report/customlang:edit', 'write', 10, 'report_customlang', 6),
(316, 'report/questioninstances:view', 'read', 10, 'report_questioninstances', 0),
(317, 'report/security:view', 'read', 10, 'report_security', 2),
(318, 'report/unittest:view', 'read', 10, 'report_unittest', 32),
(319, 'coursereport/completion:view', 'read', 50, 'coursereport_completion', 8),
(320, 'coursereport/log:view', 'read', 50, 'coursereport_log', 8),
(321, 'coursereport/log:viewlive', 'read', 50, 'coursereport_log', 8),
(322, 'coursereport/log:viewtoday', 'read', 50, 'coursereport_log', 8),
(323, 'coursereport/outline:view', 'read', 50, 'coursereport_outline', 8),
(324, 'coursereport/participation:view', 'read', 50, 'coursereport_participation', 8),
(325, 'coursereport/progress:view', 'read', 50, 'coursereport_progress', 8),
(326, 'coursereport/stats:view', 'read', 50, 'coursereport_stats', 8),
(327, 'gradeexport/ods:view', 'read', 50, 'gradeexport_ods', 8),
(328, 'gradeexport/ods:publish', 'read', 50, 'gradeexport_ods', 8),
(329, 'gradeexport/txt:view', 'read', 50, 'gradeexport_txt', 8),
(330, 'gradeexport/txt:publish', 'read', 50, 'gradeexport_txt', 8),
(331, 'gradeexport/xls:view', 'read', 50, 'gradeexport_xls', 8),
(332, 'gradeexport/xls:publish', 'read', 50, 'gradeexport_xls', 8),
(333, 'gradeexport/xml:view', 'read', 50, 'gradeexport_xml', 8),
(334, 'gradeexport/xml:publish', 'read', 50, 'gradeexport_xml', 8),
(335, 'gradeimport/csv:view', 'write', 50, 'gradeimport_csv', 0),
(336, 'gradeimport/xml:view', 'write', 50, 'gradeimport_xml', 0),
(337, 'gradeimport/xml:publish', 'write', 50, 'gradeimport_xml', 0),
(338, 'gradereport/grader:view', 'read', 50, 'gradereport_grader', 8),
(339, 'gradereport/outcomes:view', 'read', 50, 'gradereport_outcomes', 8),
(340, 'gradereport/overview:view', 'read', 50, 'gradereport_overview', 8),
(341, 'gradereport/user:view', 'read', 50, 'gradereport_user', 8),
(342, 'webservice/amf:use', 'read', 50, 'webservice_amf', 62),
(343, 'webservice/rest:use', 'read', 50, 'webservice_rest', 62),
(344, 'webservice/soap:use', 'read', 50, 'webservice_soap', 62),
(345, 'webservice/xmlrpc:use', 'read', 50, 'webservice_xmlrpc', 62),
(346, 'repository/alfresco:view', 'read', 70, 'repository_alfresco', 0),
(347, 'repository/boxnet:view', 'read', 70, 'repository_boxnet', 0),
(348, 'repository/coursefiles:view', 'read', 70, 'repository_coursefiles', 0),
(349, 'repository/dropbox:view', 'read', 70, 'repository_dropbox', 0),
(350, 'repository/filesystem:view', 'read', 70, 'repository_filesystem', 0),
(351, 'repository/flickr:view', 'read', 70, 'repository_flickr', 0),
(352, 'repository/flickr_public:view', 'read', 70, 'repository_flickr_public', 0),
(353, 'repository/googledocs:view', 'read', 70, 'repository_googledocs', 0),
(354, 'repository/local:view', 'read', 70, 'repository_local', 0),
(355, 'repository/merlot:view', 'read', 70, 'repository_merlot', 0),
(356, 'repository/picasa:view', 'read', 70, 'repository_picasa', 0),
(357, 'repository/recent:view', 'read', 70, 'repository_recent', 0),
(358, 'repository/s3:view', 'read', 70, 'repository_s3', 0),
(359, 'repository/upload:view', 'read', 70, 'repository_upload', 0),
(360, 'repository/url:view', 'read', 70, 'repository_url', 0),
(361, 'repository/user:view', 'read', 70, 'repository_user', 0),
(362, 'repository/webdav:view', 'read', 70, 'repository_webdav', 0),
(363, 'repository/wikimedia:view', 'read', 70, 'repository_wikimedia', 0),
(364, 'repository/youtube:view', 'read', 70, 'repository_youtube', 0),
(365, 'quiz/grading:viewstudentnames', 'read', 70, 'quiz_grading', 0),
(366, 'quiz/grading:viewidnumber', 'read', 70, 'quiz_grading', 0),
(367, 'quiz/statistics:view', 'read', 70, 'quiz_statistics', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_chat`
--

CREATE TABLE IF NOT EXISTS `mdl_chat` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` text COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  `keepdays` bigint(11) NOT NULL DEFAULT '0',
  `studentlogs` smallint(4) NOT NULL DEFAULT '0',
  `chattime` bigint(10) unsigned NOT NULL DEFAULT '0',
  `schedule` smallint(4) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_chat_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each of these is a chat room' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_chat_messages`
--

CREATE TABLE IF NOT EXISTS `mdl_chat_messages` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `chatid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `system` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_chatmess_use_ix` (`userid`),
  KEY `mdl_chatmess_gro_ix` (`groupid`),
  KEY `mdl_chatmess_timcha_ix` (`timestamp`,`chatid`),
  KEY `mdl_chatmess_cha_ix` (`chatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores all the actual chat messages' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_chat_messages_current`
--

CREATE TABLE IF NOT EXISTS `mdl_chat_messages_current` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `chatid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `system` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_chatmesscurr_use_ix` (`userid`),
  KEY `mdl_chatmesscurr_gro_ix` (`groupid`),
  KEY `mdl_chatmesscurr_timcha_ix` (`timestamp`,`chatid`),
  KEY `mdl_chatmesscurr_cha_ix` (`chatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores current session' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_chat_users`
--

CREATE TABLE IF NOT EXISTS `mdl_chat_users` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `chatid` bigint(11) NOT NULL DEFAULT '0',
  `userid` bigint(11) NOT NULL DEFAULT '0',
  `groupid` bigint(11) NOT NULL DEFAULT '0',
  `version` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ip` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `firstping` bigint(10) unsigned NOT NULL DEFAULT '0',
  `lastping` bigint(10) unsigned NOT NULL DEFAULT '0',
  `lastmessageping` bigint(10) unsigned NOT NULL DEFAULT '0',
  `sid` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `lang` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_chatuser_use_ix` (`userid`),
  KEY `mdl_chatuser_las_ix` (`lastping`),
  KEY `mdl_chatuser_gro_ix` (`groupid`),
  KEY `mdl_chatuser_cha_ix` (`chatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Keeps track of which users are in which chat rooms' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_choice`
--

CREATE TABLE IF NOT EXISTS `mdl_choice` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` text COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  `publish` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `showresults` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `display` smallint(4) unsigned NOT NULL DEFAULT '0',
  `allowupdate` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `showunanswered` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `limitanswers` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `timeopen` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeclose` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `completionsubmit` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_choi_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Available choices are stored here' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_choice_answers`
--

CREATE TABLE IF NOT EXISTS `mdl_choice_answers` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `choiceid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `optionid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_choiansw_use_ix` (`userid`),
  KEY `mdl_choiansw_cho_ix` (`choiceid`),
  KEY `mdl_choiansw_opt_ix` (`optionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='choices performed by users' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_choice_options`
--

CREATE TABLE IF NOT EXISTS `mdl_choice_options` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `choiceid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `text` text COLLATE utf8_unicode_ci,
  `maxanswers` bigint(10) unsigned DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_choiopti_cho_ix` (`choiceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='available options to choice' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_cohort`
--

CREATE TABLE IF NOT EXISTS `mdl_cohort` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) unsigned NOT NULL,
  `name` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `idnumber` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) unsigned NOT NULL,
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) unsigned NOT NULL,
  `timemodified` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_coho_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each record represents one cohort (aka site-wide group).' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_cohort_members`
--

CREATE TABLE IF NOT EXISTS `mdl_cohort_members` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `cohortid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeadded` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_cohomemb_cohuse_uix` (`cohortid`,`userid`),
  KEY `mdl_cohomemb_coh_ix` (`cohortid`),
  KEY `mdl_cohomemb_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Link a user to a cohort.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_comments`
--

CREATE TABLE IF NOT EXISTS `mdl_comments` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) unsigned NOT NULL,
  `commentarea` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) unsigned NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `format` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL,
  `timecreated` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='moodle comments module' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_config`
--

CREATE TABLE IF NOT EXISTS `mdl_config` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_conf_nam_uix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Moodle configuration variables' AUTO_INCREMENT=395 ;

--
-- Volcado de datos para la tabla `mdl_config`
--

INSERT INTO `mdl_config` (`id`, `name`, `value`) VALUES
(2, 'rolesactive', '1'),
(3, 'auth', 'email'),
(4, 'auth_pop3mailbox', 'INBOX'),
(5, 'enrol_plugins_enabled', 'manual,guest,cohort,self'),
(6, 'theme', 'boxxie'),
(7, 'filter_multilang_converted', '1'),
(8, 'siteidentifier', 'rnSXXzYmFqSh99D8StpWQ2RlVY8pXxtElocalhost'),
(9, 'backup_version', '2008111700'),
(10, 'backup_release', '2.0 dev'),
(11, 'mnet_dispatcher_mode', 'off'),
(12, 'sessiontimeout', '7200'),
(13, 'stringfilters', ''),
(14, 'filterall', '0'),
(15, 'texteditors', 'tinymce,textarea'),
(16, 'mnet_localhost_id', '1'),
(17, 'mnet_all_hosts_id', '2'),
(18, 'siteguest', '1'),
(19, 'siteadmins', '2'),
(20, 'themerev', '171'),
(21, 'licenses', 'unknown,allrightsreserved,public,cc,cc-nd,cc-nc-nd,cc-nc,cc-nc-sa,cc-sa'),
(22, 'version', '2011070101'),
(23, 'enableoutcomes', '0'),
(24, 'usecomments', '1'),
(25, 'usetags', '0'),
(26, 'enablenotes', '0'),
(27, 'enableportfolios', '0'),
(28, 'enablewebservices', '0'),
(29, 'messaging', '1'),
(30, 'messaginghidereadnotifications', '0'),
(31, 'messagingdeletereadnotificationsdelay', '604800'),
(32, 'enablestats', '0'),
(33, 'enablerssfeeds', '0'),
(34, 'bloglevel', '0'),
(35, 'enablecompletion', '0'),
(36, 'enableavailability', '0'),
(37, 'enableplagiarism', '0'),
(38, 'autologinguests', '0'),
(39, 'hiddenuserfields', 'icqnumber,skypeid,yahooid,aimid,msnid,firstaccess,lastaccess'),
(40, 'extrauserselectorfields', 'email'),
(41, 'enablecourserequests', '0'),
(43, 'courserequestnotify', ''),
(44, 'grade_profilereport', 'user'),
(45, 'grade_aggregationposition', '1'),
(46, 'grade_includescalesinaggregation', '1'),
(47, 'grade_hiddenasdate', '0'),
(48, 'gradepublishing', '0'),
(49, 'grade_export_displaytype', '1'),
(50, 'grade_export_decimalpoints', '2'),
(51, 'grade_navmethod', '0'),
(52, 'gradeexport', ''),
(53, 'unlimitedgrades', '0'),
(54, 'grade_hideforcedsettings', '1'),
(55, 'grade_aggregation', '11'),
(56, 'grade_aggregation_flag', '0'),
(57, 'grade_aggregations_visible', '0,10,11,12,2,4,6,8,13'),
(58, 'grade_aggregateonlygraded', '1'),
(59, 'grade_aggregateonlygraded_flag', '2'),
(60, 'grade_aggregateoutcomes', '0'),
(61, 'grade_aggregateoutcomes_flag', '2'),
(62, 'grade_aggregatesubcats', '0'),
(63, 'grade_aggregatesubcats_flag', '2'),
(64, 'grade_keephigh', '0'),
(65, 'grade_keephigh_flag', '3'),
(66, 'grade_droplow', '0'),
(67, 'grade_droplow_flag', '2'),
(68, 'grade_displaytype', '1'),
(69, 'grade_decimalpoints', '2'),
(70, 'grade_item_advanced', 'iteminfo,idnumber,gradepass,plusfactor,multfactor,display,decimals,hiddenuntil,locktime'),
(71, 'grade_report_studentsperpage', '100'),
(72, 'grade_report_quickgrading', '1'),
(73, 'grade_report_showquickfeedback', '0'),
(74, 'grade_report_fixedstudents', '0'),
(75, 'grade_report_meanselection', '1'),
(76, 'grade_report_enableajax', '0'),
(77, 'grade_report_showcalculations', '0'),
(78, 'grade_report_showeyecons', '0'),
(79, 'grade_report_showaverages', '1'),
(80, 'grade_report_showlocks', '0'),
(81, 'grade_report_showranges', '0'),
(82, 'grade_report_showuserimage', '1'),
(83, 'grade_report_showuseridnumber', '0'),
(84, 'grade_report_showactivityicons', '1'),
(85, 'grade_report_shownumberofgrades', '0'),
(86, 'grade_report_averagesdisplaytype', 'inherit'),
(87, 'grade_report_rangesdisplaytype', 'inherit'),
(88, 'grade_report_averagesdecimalpoints', 'inherit'),
(89, 'grade_report_rangesdecimalpoints', 'inherit'),
(90, 'grade_report_overview_showrank', '0'),
(91, 'grade_report_overview_showtotalsifcontainhidden', '0'),
(92, 'grade_report_user_showrank', '0'),
(93, 'grade_report_user_showpercentage', '1'),
(94, 'grade_report_user_showgrade', '1'),
(95, 'grade_report_user_showfeedback', '1'),
(96, 'grade_report_user_showrange', '1'),
(97, 'grade_report_user_showweight', '0'),
(98, 'grade_report_user_showaverage', '0'),
(99, 'grade_report_user_showlettergrade', '0'),
(100, 'grade_report_user_rangedecimals', '0'),
(101, 'grade_report_user_showhiddenitems', '1'),
(102, 'grade_report_user_showtotalsifcontainhidden', '0'),
(103, 'timezone', '99'),
(104, 'forcetimezone', '99'),
(105, 'country', '0'),
(106, 'defaultcity', ''),
(107, 'geoipfile', '/home/damian/moodledata/geoip/GeoLiteCity.dat'),
(108, 'googlemapkey', ''),
(109, 'allcountrycodes', ''),
(110, 'autolang', '1'),
(111, 'lang', 'es_ar'),
(112, 'langmenu', '1'),
(113, 'langlist', ''),
(114, 'langcache', '1'),
(115, 'langstringcache', '1'),
(116, 'locale', ''),
(117, 'latinexcelexport', '0'),
(119, 'loginpageautofocus', '0'),
(120, 'guestloginbutton', '1'),
(121, 'alternateloginurl', ''),
(122, 'forgottenpasswordurl', ''),
(123, 'auth_instructions', ''),
(124, 'allowemailaddresses', ''),
(125, 'denyemailaddresses', ''),
(126, 'verifychangedemail', '1'),
(127, 'recaptchapublickey', ''),
(128, 'recaptchaprivatekey', ''),
(129, 'sitedefaultlicense', 'allrightsreserved'),
(130, 'cachetext', '60'),
(131, 'filteruploadedfiles', '0'),
(132, 'filtermatchoneperpage', '0'),
(133, 'filtermatchonepertext', '0'),
(134, 'filter_censor_badwords', ''),
(135, 'filter_mediaplugin_enable_youtube', '1'),
(136, 'filter_mediaplugin_enable_vimeo', '0'),
(137, 'filter_mediaplugin_enable_mp3', '1'),
(138, 'filter_mediaplugin_enable_flv', '1'),
(139, 'filter_mediaplugin_enable_swf', '1'),
(140, 'filter_mediaplugin_enable_html5audio', '0'),
(141, 'filter_mediaplugin_enable_html5video', '0'),
(142, 'filter_mediaplugin_enable_qt', '1'),
(143, 'filter_mediaplugin_enable_wmp', '1'),
(144, 'filter_mediaplugin_enable_rm', '1'),
(145, 'filter_multilang_force_old', '0'),
(146, 'filter_tex_latexpreamble', '\\usepackage[latin1]{inputenc}\n\\usepackage{amsmath}\n\\usepackage{amsfonts}\n\\RequirePackage{amsmath,amssymb,latexsym}\n'),
(147, 'filter_tex_latexbackground', '#FFFFFF'),
(148, 'filter_tex_density', '120'),
(149, 'filter_tex_pathlatex', '/usr/bin/latex'),
(150, 'filter_tex_pathdvips', '/usr/bin/dvips'),
(151, 'filter_tex_pathconvert', '/usr/bin/convert'),
(152, 'filter_tex_convertformat', 'gif'),
(153, 'portfolio_moderate_filesize_threshold', '1048576'),
(154, 'portfolio_high_filesize_threshold', '5242880'),
(155, 'portfolio_moderate_db_threshold', '20'),
(156, 'portfolio_high_db_threshold', '50'),
(157, 'repositorycacheexpire', '120'),
(158, 'repositoryallowexternallinks', '1'),
(159, 'legacyfilesinnewcourses', '0'),
(160, 'enablewsdocumentation', '0'),
(161, 'allowbeforeblock', '0'),
(162, 'allowedip', ''),
(163, 'blockedip', ''),
(164, 'protectusernames', '1'),
(165, 'forcelogin', '0'),
(166, 'forceloginforprofiles', '1'),
(167, 'opentogoogle', '0'),
(168, 'maxbytes', '0'),
(169, 'userquota', '104857600'),
(170, 'enablehtmlpurifier', '1'),
(171, 'allowobjectembed', '0'),
(172, 'enabletrusttext', '0'),
(173, 'maxeditingtime', '1800'),
(174, 'fullnamedisplay', 'language'),
(175, 'extendedusernamechars', '0'),
(176, 'sitepolicy', ''),
(177, 'sitepolicyguest', ''),
(178, 'keeptagnamecase', '1'),
(179, 'profilesforenrolledusersonly', '1'),
(180, 'cronclionly', '0'),
(181, 'cronremotepassword', ''),
(182, 'passwordpolicy', '1'),
(183, 'minpasswordlength', '6'),
(184, 'minpassworddigits', '0'),
(185, 'minpasswordlower', '0'),
(186, 'minpasswordupper', '0'),
(187, 'minpasswordnonalphanum', '0'),
(188, 'maxconsecutiveidentchars', '0'),
(189, 'groupenrolmentkeypolicy', '1'),
(190, 'disableuserimages', '0'),
(191, 'emailchangeconfirmation', '1'),
(192, 'loginhttps', '0'),
(193, 'cookiesecure', '0'),
(194, 'cookiehttponly', '0'),
(195, 'excludeoldflashclients', '10.0.12'),
(196, 'restrictmodulesfor', 'none'),
(197, 'restrictbydefault', '0'),
(198, 'displayloginfailures', ''),
(199, 'notifyloginfailures', ''),
(200, 'notifyloginthreshold', '10'),
(201, 'runclamonupload', '0'),
(202, 'pathtoclam', ''),
(203, 'quarantinedir', ''),
(204, 'clamfailureonupload', 'donothing'),
(205, 'themelist', ''),
(206, 'themedesignermode', '0'),
(207, 'allowuserthemes', '0'),
(208, 'allowcoursethemes', '0'),
(209, 'allowcategorythemes', '0'),
(210, 'allowthemechangeonurl', '0'),
(211, 'allowuserblockhiding', '1'),
(212, 'allowblockstodock', '1'),
(213, 'custommenuitems', ''),
(214, 'enabledevicedetection', '1'),
(215, 'devicedetectregex', '[]'),
(216, 'calendar_adminseesall', '0'),
(217, 'calendar_site_timeformat', '0'),
(218, 'calendar_startwday', '0'),
(219, 'calendar_weekend', '65'),
(220, 'calendar_lookahead', '21'),
(221, 'calendar_maxevents', '10'),
(222, 'enablecalendarexport', '1'),
(223, 'calendar_exportsalt', 'vexZzFVQtDgZqTtMy5JlxwtjqCLGHfSLvghOcDcOEJyUrBglXbCwHrNS2kZq'),
(224, 'useblogassociations', '1'),
(225, 'useexternalblogs', '1'),
(226, 'externalblogcrontime', '86400'),
(227, 'maxexternalblogsperuser', '1'),
(228, 'blogusecomments', '1'),
(229, 'blogshowcommentscount', '1'),
(230, 'defaulthomepage', '0'),
(231, 'navshowcategories', '1'),
(232, 'navshowallcourses', '0'),
(233, 'navcourselimit', '20'),
(234, 'formatstringstriptags', '1'),
(235, 'emoticons', '[{"text":":-)","imagename":"s\\/smiley","imagecomponent":"core","altidentifier":"smiley","altcomponent":"core_pix"},{"text":":)","imagename":"s\\/smiley","imagecomponent":"core","altidentifier":"smiley","altcomponent":"core_pix"},{"text":":-D","imagename":"s\\/biggrin","imagecomponent":"core","altidentifier":"biggrin","altcomponent":"core_pix"},{"text":";-)","imagename":"s\\/wink","imagecomponent":"core","altidentifier":"wink","altcomponent":"core_pix"},{"text":":-\\/","imagename":"s\\/mixed","imagecomponent":"core","altidentifier":"mixed","altcomponent":"core_pix"},{"text":"V-.","imagename":"s\\/thoughtful","imagecomponent":"core","altidentifier":"thoughtful","altcomponent":"core_pix"},{"text":":-P","imagename":"s\\/tongueout","imagecomponent":"core","altidentifier":"tongueout","altcomponent":"core_pix"},{"text":":-p","imagename":"s\\/tongueout","imagecomponent":"core","altidentifier":"tongueout","altcomponent":"core_pix"},{"text":"B-)","imagename":"s\\/cool","imagecomponent":"core","altidentifier":"cool","altcomponent":"core_pix"},{"text":"^-)","imagename":"s\\/approve","imagecomponent":"core","altidentifier":"approve","altcomponent":"core_pix"},{"text":"8-)","imagename":"s\\/wideeyes","imagecomponent":"core","altidentifier":"wideeyes","altcomponent":"core_pix"},{"text":":o)","imagename":"s\\/clown","imagecomponent":"core","altidentifier":"clown","altcomponent":"core_pix"},{"text":":-(","imagename":"s\\/sad","imagecomponent":"core","altidentifier":"sad","altcomponent":"core_pix"},{"text":":(","imagename":"s\\/sad","imagecomponent":"core","altidentifier":"sad","altcomponent":"core_pix"},{"text":"8-.","imagename":"s\\/shy","imagecomponent":"core","altidentifier":"shy","altcomponent":"core_pix"},{"text":":-I","imagename":"s\\/blush","imagecomponent":"core","altidentifier":"blush","altcomponent":"core_pix"},{"text":":-X","imagename":"s\\/kiss","imagecomponent":"core","altidentifier":"kiss","altcomponent":"core_pix"},{"text":"8-o","imagename":"s\\/surprise","imagecomponent":"core","altidentifier":"surprise","altcomponent":"core_pix"},{"text":"P-|","imagename":"s\\/blackeye","imagecomponent":"core","altidentifier":"blackeye","altcomponent":"core_pix"},{"text":"8-[","imagename":"s\\/angry","imagecomponent":"core","altidentifier":"angry","altcomponent":"core_pix"},{"text":"(grr)","imagename":"s\\/angry","imagecomponent":"core","altidentifier":"angry","altcomponent":"core_pix"},{"text":"xx-P","imagename":"s\\/dead","imagecomponent":"core","altidentifier":"dead","altcomponent":"core_pix"},{"text":"|-.","imagename":"s\\/sleepy","imagecomponent":"core","altidentifier":"sleepy","altcomponent":"core_pix"},{"text":"}-]","imagename":"s\\/evil","imagecomponent":"core","altidentifier":"evil","altcomponent":"core_pix"},{"text":"(h)","imagename":"s\\/heart","imagecomponent":"core","altidentifier":"heart","altcomponent":"core_pix"},{"text":"(heart)","imagename":"s\\/heart","imagecomponent":"core","altidentifier":"heart","altcomponent":"core_pix"},{"text":"(y)","imagename":"s\\/yes","imagecomponent":"core","altidentifier":"yes","altcomponent":"core"},{"text":"(n)","imagename":"s\\/no","imagecomponent":"core","altidentifier":"no","altcomponent":"core"},{"text":"(martin)","imagename":"s\\/martin","imagecomponent":"core","altidentifier":"martin","altcomponent":"core_pix"},{"text":"( )","imagename":"s\\/egg","imagecomponent":"core","altidentifier":"egg","altcomponent":"core_pix"}]'),
(236, 'docroot', 'http://docs.moodle.org'),
(237, 'doctonewwindow', '0'),
(238, 'enableajax', '1'),
(239, 'useexternalyui', '0'),
(240, 'yuicomboloading', '1'),
(241, 'cachejs', '1'),
(242, 'enablecourseajax', '1'),
(243, 'additionalhtmlhead', ''),
(244, 'additionalhtmltopofbody', ''),
(245, 'additionalhtmlfooter', ''),
(246, 'gdversion', '2'),
(247, 'pathtodu', ''),
(248, 'aspellpath', ''),
(249, 'pathtodot', ''),
(250, 'supportpage', ''),
(251, 'dbsessions', '1'),
(252, 'sessioncookie', ''),
(253, 'sessioncookiepath', '/'),
(254, 'sessioncookiedomain', ''),
(255, 'statsfirstrun', 'none'),
(256, 'statsmaxruntime', '0'),
(257, 'statsruntimedays', '31'),
(258, 'statsruntimestarthour', '0'),
(259, 'statsruntimestartminute', '0'),
(260, 'statsuserthreshold', '0'),
(261, 'framename', '_top'),
(262, 'slasharguments', '1'),
(263, 'getremoteaddrconf', '0'),
(264, 'proxyhost', ''),
(265, 'proxyport', '0'),
(266, 'proxytype', 'HTTP'),
(267, 'proxyuser', ''),
(268, 'proxypassword', ''),
(269, 'proxybypass', 'localhost, 127.0.0.1'),
(270, 'maintenance_enabled', '0'),
(271, 'maintenance_message', ''),
(272, 'deleteunconfirmed', '168'),
(273, 'deleteincompleteusers', '0'),
(274, 'logguests', '1'),
(275, 'loglifetime', '0'),
(276, 'disablegradehistory', '0'),
(277, 'gradehistorylifetime', '0'),
(278, 'numcoursesincombo', '500'),
(279, 'extramemorylimit', '512M'),
(280, 'curlcache', '120'),
(281, 'curltimeoutkbitrate', '56'),
(282, 'enableglobalsearch', '0'),
(283, 'enablesafebrowserintegration', '0'),
(284, 'enablegroupmembersonly', '0'),
(285, 'debug', '0'),
(286, 'debugdisplay', '1'),
(287, 'xmlstrictheaders', '0'),
(288, 'debugsmtp', '0'),
(289, 'perfdebug', '7'),
(290, 'debugstringids', '0'),
(291, 'debugvalidators', '0'),
(292, 'debugpageinfo', '0'),
(293, 'release', '2.1.1 (Build: 20110801)'),
(294, 'jsrev', '170'),
(296, 'notloggedinroleid', '6'),
(297, 'guestroleid', '6'),
(298, 'defaultuserroleid', '7'),
(299, 'creatornewroleid', '3'),
(300, 'gradebookroles', '5'),
(301, 'assignment_maxbytes', '1048576'),
(302, 'assignment_itemstocount', '1'),
(303, 'assignment_showrecentsubmissions', '1'),
(304, 'chat_method', 'ajax'),
(305, 'chat_refresh_userlist', '10'),
(306, 'chat_old_ping', '35'),
(307, 'chat_refresh_room', '5'),
(308, 'chat_normal_updatemode', 'jsupdate'),
(309, 'chat_serverhost', 'localhost'),
(310, 'chat_serverip', '127.0.0.1'),
(311, 'chat_serverport', '9111'),
(312, 'chat_servermax', '100'),
(313, 'data_enablerssfeeds', '0'),
(314, 'feedback_allowfullanonymous', '0'),
(315, 'forum_displaymode', '3'),
(316, 'forum_replytouser', '1'),
(317, 'forum_shortpost', '300'),
(318, 'forum_longpost', '600'),
(319, 'forum_manydiscussions', '100'),
(320, 'forum_maxbytes', '0'),
(321, 'forum_maxattachments', '0'),
(322, 'forum_trackreadposts', '1'),
(323, 'forum_oldpostdays', '14'),
(324, 'forum_usermarksread', '0'),
(325, 'forum_cleanreadtime', '2'),
(326, 'digestmailtime', '17'),
(327, 'forum_enablerssfeeds', '0'),
(328, 'forum_enabletimedposts', '0'),
(329, 'glossary_entbypage', '10'),
(330, 'glossary_dupentries', '0'),
(331, 'glossary_allowcomments', '0'),
(332, 'glossary_linkbydefault', '1'),
(333, 'glossary_defaultapproval', '1'),
(334, 'glossary_enablerssfeeds', '0'),
(335, 'glossary_linkentries', '0'),
(336, 'glossary_casesensitive', '0'),
(337, 'glossary_fullmatch', '0'),
(338, 'lesson_slideshowwidth', '640'),
(339, 'lesson_slideshowheight', '480'),
(340, 'lesson_slideshowbgcolor', '#FFFFFF'),
(341, 'lesson_mediawidth', '640'),
(342, 'lesson_mediaheight', '480'),
(343, 'lesson_mediaclose', '0'),
(344, 'lesson_maxhighscores', '10'),
(345, 'lesson_maxanswers', '4'),
(346, 'lesson_defaultnextpage', '0'),
(347, 'block_course_list_adminview', 'all'),
(348, 'block_course_list_hideallcourseslink', '0'),
(349, 'block_online_users_timetosee', '5'),
(350, 'block_rss_client_num_entries', '5'),
(351, 'block_rss_client_timeout', '30'),
(352, 'block_search_enable_file_indexing', '0'),
(353, 'block_search_filetypes', 'PDF,TXT,HTML,PPT,XML,DOC,HTM'),
(354, 'block_search_usemoodleroot', '1'),
(355, 'block_search_limit_index_body', '0'),
(356, 'block_search_pdf_to_text_cmd', 'lib/xpdf/linux/pdftotext -enc UTF-8 -eol unix -q'),
(357, 'block_search_word_to_text_cmd', 'lib/antiword/linux/usr/bin/antiword'),
(358, 'block_search_word_to_text_env', 'ANTIWORDHOME=/home/damian/moodle/lib/antiword/linux/usr/share/antiword'),
(359, 'search_in_assignment', '1'),
(360, 'search_in_chat', '1'),
(361, 'search_in_data', '1'),
(362, 'search_in_forum', '1'),
(363, 'search_in_glossary', '1'),
(364, 'search_in_label', '1'),
(365, 'search_in_lesson', '1'),
(366, 'search_in_resource', '1'),
(367, 'search_in_wiki', '1'),
(368, 'block_tags_showcoursetags', '0'),
(369, 'jabberhost', ''),
(370, 'jabberserver', ''),
(371, 'jabberusername', ''),
(372, 'jabberpassword', ''),
(373, 'jabberport', '5222'),
(374, 'smtphosts', ''),
(375, 'smtpuser', ''),
(376, 'smtppass', ''),
(377, 'smtpmaxbulk', '1'),
(378, 'noreplyaddress', 'noreply@localhost'),
(379, 'sitemailcharset', '0'),
(380, 'allowusermailcharset', '0'),
(381, 'mailnewline', 'LF'),
(382, 'profileroles', '3,4,5'),
(383, 'defaultallowedmodules', ''),
(384, 'coursecontact', '3'),
(385, 'frontpage', '0'),
(386, 'frontpageloggedin', '0'),
(387, 'maxcategorydepth', '0'),
(388, 'commentsperpage', '15'),
(389, 'coursesperpage', '20'),
(390, 'defaultfrontpageroleid', '0'),
(391, 'supportname', 'admin Usuario'),
(392, 'supportemail', 'tallerdeprogramacioniifiuba2011@googlegroups.com'),
(393, 'registerauth', 'email'),
(394, 'themelegacy', 'arialist');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_config_log`
--

CREATE TABLE IF NOT EXISTS `mdl_config_log` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL,
  `timemodified` bigint(10) unsigned NOT NULL,
  `plugin` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` text COLLATE utf8_unicode_ci,
  `oldvalue` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_conflog_tim_ix` (`timemodified`),
  KEY `mdl_conflog_use_ix` (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Changes done in server configuration through admin UI' AUTO_INCREMENT=753 ;

--
-- Volcado de datos para la tabla `mdl_config_log`
--

INSERT INTO `mdl_config_log` (`id`, `userid`, `timemodified`, `plugin`, `name`, `value`, `oldvalue`) VALUES
(1, 0, 1316566455, NULL, 'enableoutcomes', '0', NULL),
(2, 0, 1316566455, NULL, 'usecomments', '1', NULL),
(3, 0, 1316566455, NULL, 'usetags', '1', NULL),
(4, 0, 1316566455, NULL, 'enablenotes', '1', NULL),
(5, 0, 1316566455, NULL, 'enableportfolios', '0', NULL),
(6, 0, 1316566455, NULL, 'enablewebservices', '0', NULL),
(7, 0, 1316566455, NULL, 'messaging', '1', NULL),
(8, 0, 1316566455, NULL, 'messaginghidereadnotifications', '0', NULL),
(9, 0, 1316566456, NULL, 'messagingdeletereadnotificationsdelay', '604800', NULL),
(10, 0, 1316566456, NULL, 'enablestats', '0', NULL),
(11, 0, 1316566456, NULL, 'enablerssfeeds', '0', NULL),
(12, 0, 1316566456, NULL, 'bloglevel', '4', NULL),
(13, 0, 1316566456, NULL, 'enablecompletion', '0', NULL),
(14, 0, 1316566456, NULL, 'enableavailability', '0', NULL),
(15, 0, 1316566456, NULL, 'enableplagiarism', '0', NULL),
(16, 0, 1316566456, NULL, 'autologinguests', '0', NULL),
(17, 0, 1316566457, NULL, 'hiddenuserfields', '', NULL),
(18, 0, 1316566457, NULL, 'extrauserselectorfields', 'email', NULL),
(19, 0, 1316566457, 'moodlecourse', 'format', 'weeks', NULL),
(20, 0, 1316566457, 'moodlecourse', 'maxsections', '52', NULL),
(21, 0, 1316566457, 'moodlecourse', 'numsections', '10', NULL),
(22, 0, 1316566457, 'moodlecourse', 'hiddensections', '0', NULL),
(23, 0, 1316566458, 'moodlecourse', 'newsitems', '5', NULL),
(24, 0, 1316566458, 'moodlecourse', 'showgrades', '1', NULL),
(25, 0, 1316566458, 'moodlecourse', 'showreports', '0', NULL),
(26, 0, 1316566458, 'moodlecourse', 'maxbytes', '2097152', NULL),
(27, 0, 1316566458, 'moodlecourse', 'groupmode', '0', NULL),
(28, 0, 1316566458, 'moodlecourse', 'groupmodeforce', '0', NULL),
(29, 0, 1316566458, 'moodlecourse', 'visible', '1', NULL),
(30, 0, 1316566458, 'moodlecourse', 'lang', '', NULL),
(31, 0, 1316566459, 'moodlecourse', 'enablecompletion', '0', NULL),
(32, 0, 1316566459, 'moodlecourse', 'completionstartonenrol', '0', NULL),
(33, 0, 1316566459, NULL, 'enablecourserequests', '0', NULL),
(34, 0, 1316566459, NULL, 'defaultrequestcategory', '1', NULL),
(35, 0, 1316566459, NULL, 'courserequestnotify', '', NULL),
(36, 0, 1316566459, 'backup', 'backup_general_users', '1', NULL),
(37, 0, 1316566459, 'backup', 'backup_general_users_locked', '0', NULL),
(38, 0, 1316566459, 'backup', 'backup_general_anonymize', '0', NULL),
(39, 0, 1316566460, 'backup', 'backup_general_anonymize_locked', '0', NULL),
(40, 0, 1316566460, 'backup', 'backup_general_role_assignments', '1', NULL),
(41, 0, 1316566460, 'backup', 'backup_general_role_assignments_locked', '0', NULL),
(42, 0, 1316566460, 'backup', 'backup_general_user_files', '1', NULL),
(43, 0, 1316566460, 'backup', 'backup_general_user_files_locked', '0', NULL),
(44, 0, 1316566461, 'backup', 'backup_general_activities', '1', NULL),
(45, 0, 1316566461, 'backup', 'backup_general_activities_locked', '0', NULL),
(46, 0, 1316566461, 'backup', 'backup_general_blocks', '1', NULL),
(47, 0, 1316566461, 'backup', 'backup_general_blocks_locked', '0', NULL),
(48, 0, 1316566461, 'backup', 'backup_general_filters', '1', NULL),
(49, 0, 1316566462, 'backup', 'backup_general_filters_locked', '0', NULL),
(50, 0, 1316566462, 'backup', 'backup_general_comments', '1', NULL),
(51, 0, 1316566462, 'backup', 'backup_general_comments_locked', '0', NULL),
(52, 0, 1316566462, 'backup', 'backup_general_userscompletion', '1', NULL),
(53, 0, 1316566462, 'backup', 'backup_general_userscompletion_locked', '0', NULL),
(54, 0, 1316566462, 'backup', 'backup_general_logs', '0', NULL),
(55, 0, 1316566463, 'backup', 'backup_general_logs_locked', '0', NULL),
(56, 0, 1316566463, 'backup', 'backup_general_histories', '0', NULL),
(57, 0, 1316566463, 'backup', 'backup_general_histories_locked', '0', NULL),
(58, 0, 1316566463, 'backup', 'backup_auto_active', '0', NULL),
(59, 0, 1316566463, 'backup', 'backup_auto_weekdays', '0000000', NULL),
(60, 0, 1316566463, 'backup', 'backup_auto_hour', '0', NULL),
(61, 0, 1316566463, 'backup', 'backup_auto_minute', '0', NULL),
(62, 0, 1316566463, 'backup', 'backup_auto_storage', '0', NULL),
(63, 0, 1316566463, 'backup', 'backup_auto_destination', '', NULL),
(64, 0, 1316566464, 'backup', 'backup_auto_keep', '1', NULL),
(65, 0, 1316566464, 'backup', 'backup_auto_users', '1', NULL),
(66, 0, 1316566464, 'backup', 'backup_auto_role_assignments', '1', NULL),
(67, 0, 1316566464, 'backup', 'backup_auto_user_files', '1', NULL),
(68, 0, 1316566464, 'backup', 'backup_auto_activities', '1', NULL),
(69, 0, 1316566464, 'backup', 'backup_auto_blocks', '1', NULL),
(70, 0, 1316566464, 'backup', 'backup_auto_filters', '1', NULL),
(71, 0, 1316566464, 'backup', 'backup_auto_comments', '1', NULL),
(72, 0, 1316566465, 'backup', 'backup_auto_userscompletion', '1', NULL),
(73, 0, 1316566465, 'backup', 'backup_auto_logs', '0', NULL),
(74, 0, 1316566465, 'backup', 'backup_auto_histories', '0', NULL),
(75, 0, 1316566465, NULL, 'grade_profilereport', 'user', NULL),
(76, 0, 1316566465, NULL, 'grade_aggregationposition', '1', NULL),
(77, 0, 1316566465, NULL, 'grade_includescalesinaggregation', '1', NULL),
(78, 0, 1316566465, NULL, 'grade_hiddenasdate', '0', NULL),
(79, 0, 1316566465, NULL, 'gradepublishing', '0', NULL),
(80, 0, 1316566465, NULL, 'grade_export_displaytype', '1', NULL),
(81, 0, 1316566466, NULL, 'grade_export_decimalpoints', '2', NULL),
(82, 0, 1316566466, NULL, 'grade_navmethod', '0', NULL),
(83, 0, 1316566466, NULL, 'gradeexport', '', NULL),
(84, 0, 1316566466, NULL, 'unlimitedgrades', '0', NULL),
(85, 0, 1316566466, NULL, 'grade_hideforcedsettings', '1', NULL),
(86, 0, 1316566466, NULL, 'grade_aggregation', '11', NULL),
(87, 0, 1316566466, NULL, 'grade_aggregation_flag', '0', NULL),
(88, 0, 1316566467, NULL, 'grade_aggregations_visible', '0,10,11,12,2,4,6,8,13', NULL),
(89, 0, 1316566467, NULL, 'grade_aggregateonlygraded', '1', NULL),
(90, 0, 1316566467, NULL, 'grade_aggregateonlygraded_flag', '2', NULL),
(91, 0, 1316566467, NULL, 'grade_aggregateoutcomes', '0', NULL),
(92, 0, 1316566467, NULL, 'grade_aggregateoutcomes_flag', '2', NULL),
(93, 0, 1316566467, NULL, 'grade_aggregatesubcats', '0', NULL),
(94, 0, 1316566467, NULL, 'grade_aggregatesubcats_flag', '2', NULL),
(95, 0, 1316566467, NULL, 'grade_keephigh', '0', NULL),
(96, 0, 1316566468, NULL, 'grade_keephigh_flag', '3', NULL),
(97, 0, 1316566468, NULL, 'grade_droplow', '0', NULL),
(98, 0, 1316566468, NULL, 'grade_droplow_flag', '2', NULL),
(99, 0, 1316566468, NULL, 'grade_displaytype', '1', NULL),
(100, 0, 1316566468, NULL, 'grade_decimalpoints', '2', NULL),
(101, 0, 1316566468, NULL, 'grade_item_advanced', 'iteminfo,idnumber,gradepass,plusfactor,multfactor,display,decimals,hiddenuntil,locktime', NULL),
(102, 0, 1316566468, NULL, 'grade_report_studentsperpage', '100', NULL),
(103, 0, 1316566468, NULL, 'grade_report_quickgrading', '1', NULL),
(104, 0, 1316566468, NULL, 'grade_report_showquickfeedback', '0', NULL),
(105, 0, 1316566469, NULL, 'grade_report_fixedstudents', '0', NULL),
(106, 0, 1316566469, NULL, 'grade_report_meanselection', '1', NULL),
(107, 0, 1316566469, NULL, 'grade_report_enableajax', '0', NULL),
(108, 0, 1316566469, NULL, 'grade_report_showcalculations', '0', NULL),
(109, 0, 1316566469, NULL, 'grade_report_showeyecons', '0', NULL),
(110, 0, 1316566469, NULL, 'grade_report_showaverages', '1', NULL),
(111, 0, 1316566469, NULL, 'grade_report_showlocks', '0', NULL),
(112, 0, 1316566469, NULL, 'grade_report_showranges', '0', NULL),
(113, 0, 1316566469, NULL, 'grade_report_showuserimage', '1', NULL),
(114, 0, 1316566469, NULL, 'grade_report_showuseridnumber', '0', NULL),
(115, 0, 1316566470, NULL, 'grade_report_showactivityicons', '1', NULL),
(116, 0, 1316566470, NULL, 'grade_report_shownumberofgrades', '0', NULL),
(117, 0, 1316566470, NULL, 'grade_report_averagesdisplaytype', 'inherit', NULL),
(118, 0, 1316566470, NULL, 'grade_report_rangesdisplaytype', 'inherit', NULL),
(119, 0, 1316566471, NULL, 'grade_report_averagesdecimalpoints', 'inherit', NULL),
(120, 0, 1316566471, NULL, 'grade_report_rangesdecimalpoints', 'inherit', NULL),
(121, 0, 1316566471, NULL, 'grade_report_overview_showrank', '0', NULL),
(122, 0, 1316566472, NULL, 'grade_report_overview_showtotalsifcontainhidden', '0', NULL),
(123, 0, 1316566472, NULL, 'grade_report_user_showrank', '0', NULL),
(124, 0, 1316566472, NULL, 'grade_report_user_showpercentage', '1', NULL),
(125, 0, 1316566472, NULL, 'grade_report_user_showgrade', '1', NULL),
(126, 0, 1316566473, NULL, 'grade_report_user_showfeedback', '1', NULL),
(127, 0, 1316566473, NULL, 'grade_report_user_showrange', '1', NULL),
(128, 0, 1316566473, NULL, 'grade_report_user_showweight', '0', NULL),
(129, 0, 1316566473, NULL, 'grade_report_user_showaverage', '0', NULL),
(130, 0, 1316566473, NULL, 'grade_report_user_showlettergrade', '0', NULL),
(131, 0, 1316566473, NULL, 'grade_report_user_rangedecimals', '0', NULL),
(132, 0, 1316566473, NULL, 'grade_report_user_showhiddenitems', '1', NULL),
(133, 0, 1316566473, NULL, 'grade_report_user_showtotalsifcontainhidden', '0', NULL),
(134, 0, 1316566474, NULL, 'timezone', '99', NULL),
(135, 0, 1316566474, NULL, 'forcetimezone', '99', NULL),
(136, 0, 1316566474, NULL, 'country', '0', NULL),
(137, 0, 1316566474, NULL, 'defaultcity', '', NULL),
(138, 0, 1316566474, NULL, 'geoipfile', '/home/damian/moodledata/geoip/GeoLiteCity.dat', NULL),
(139, 0, 1316566474, NULL, 'googlemapkey', '', NULL),
(140, 0, 1316566475, NULL, 'allcountrycodes', '', NULL),
(141, 0, 1316566475, NULL, 'autolang', '1', NULL),
(142, 0, 1316566475, NULL, 'lang', 'es_ar', NULL),
(143, 0, 1316566476, NULL, 'langmenu', '1', NULL),
(144, 0, 1316566476, NULL, 'langlist', '', NULL),
(145, 0, 1316566476, NULL, 'langcache', '1', NULL),
(146, 0, 1316566476, NULL, 'langstringcache', '1', NULL),
(147, 0, 1316566476, NULL, 'locale', '', NULL),
(148, 0, 1316566477, NULL, 'latinexcelexport', '0', NULL),
(149, 0, 1316566477, NULL, 'registerauth', '', NULL),
(150, 0, 1316566477, NULL, 'loginpageautofocus', '0', NULL),
(151, 0, 1316566478, NULL, 'guestloginbutton', '1', NULL),
(152, 0, 1316566478, NULL, 'alternateloginurl', '', NULL),
(153, 0, 1316566478, NULL, 'forgottenpasswordurl', '', NULL),
(154, 0, 1316566478, NULL, 'auth_instructions', '', NULL),
(155, 0, 1316566479, NULL, 'allowemailaddresses', '', NULL),
(156, 0, 1316566479, NULL, 'denyemailaddresses', '', NULL),
(157, 0, 1316566479, NULL, 'verifychangedemail', '1', NULL),
(158, 0, 1316566479, NULL, 'recaptchapublickey', '', NULL),
(159, 0, 1316566479, NULL, 'recaptchaprivatekey', '', NULL),
(160, 0, 1316566480, 'enrol_database', 'dbtype', '', NULL),
(161, 0, 1316566480, 'enrol_database', 'dbhost', 'localhost', NULL),
(162, 0, 1316566480, 'enrol_database', 'dbuser', '', NULL),
(163, 0, 1316566480, 'enrol_database', 'dbpass', '', NULL),
(164, 0, 1316566481, 'enrol_database', 'dbname', '', NULL),
(165, 0, 1316566481, 'enrol_database', 'dbencoding', 'utf-8', NULL),
(166, 0, 1316566481, 'enrol_database', 'dbsetupsql', '', NULL),
(167, 0, 1316566481, 'enrol_database', 'dbsybasequoting', '0', NULL),
(168, 0, 1316566482, 'enrol_database', 'debugdb', '0', NULL),
(169, 0, 1316566482, 'enrol_database', 'localcoursefield', 'idnumber', NULL),
(170, 0, 1316566482, 'enrol_database', 'localuserfield', 'idnumber', NULL),
(171, 0, 1316566482, 'enrol_database', 'localrolefield', 'shortname', NULL),
(172, 0, 1316566483, 'enrol_database', 'remoteenroltable', '', NULL),
(173, 0, 1316566483, 'enrol_database', 'remotecoursefield', '', NULL),
(174, 0, 1316566483, 'enrol_database', 'remoteuserfield', '', NULL),
(175, 0, 1316566484, 'enrol_database', 'remoterolefield', '', NULL),
(176, 0, 1316566484, 'enrol_database', 'ignorehiddencourses', '0', NULL),
(177, 0, 1316566484, 'enrol_database', 'unenrolaction', '0', NULL),
(178, 0, 1316566484, 'enrol_database', 'newcoursetable', '', NULL),
(179, 0, 1316566484, 'enrol_database', 'newcoursefullname', 'fullname', NULL),
(180, 0, 1316566484, 'enrol_database', 'newcourseshortname', 'shortname', NULL),
(181, 0, 1316566485, 'enrol_database', 'newcourseidnumber', 'idnumber', NULL),
(182, 0, 1316566485, 'enrol_database', 'newcoursecategory', '', NULL),
(183, 0, 1316566485, 'enrol_database', 'templatecourse', '', NULL),
(184, 0, 1316566485, 'enrol_flatfile', 'location', '', NULL),
(185, 0, 1316566485, 'enrol_flatfile', 'mailstudents', '0', NULL),
(186, 0, 1316566486, 'enrol_flatfile', 'mailteachers', '0', NULL),
(187, 0, 1316566486, 'enrol_flatfile', 'mailadmins', '0', NULL),
(188, 0, 1316566486, 'enrol_guest', 'requirepassword', '0', NULL),
(189, 0, 1316566486, 'enrol_guest', 'usepasswordpolicy', '0', NULL),
(190, 0, 1316566487, 'enrol_guest', 'showhint', '0', NULL),
(191, 0, 1316566487, 'enrol_guest', 'defaultenrol', '1', NULL),
(192, 0, 1316566487, 'enrol_guest', 'status', '1', NULL),
(193, 0, 1316566487, 'enrol_guest', 'status_adv', '0', NULL),
(194, 0, 1316566487, 'enrol_imsenterprise', 'imsfilelocation', '', NULL),
(195, 0, 1316566488, 'enrol_imsenterprise', 'logtolocation', '', NULL),
(196, 0, 1316566488, 'enrol_imsenterprise', 'mailadmins', '0', NULL),
(197, 0, 1316566488, 'enrol_imsenterprise', 'createnewusers', '0', NULL),
(198, 0, 1316566488, 'enrol_imsenterprise', 'imsdeleteusers', '0', NULL),
(199, 0, 1316566489, 'enrol_imsenterprise', 'fixcaseusernames', '0', NULL),
(200, 0, 1316566489, 'enrol_imsenterprise', 'fixcasepersonalnames', '0', NULL),
(201, 0, 1316566489, 'enrol_imsenterprise', 'imssourcedidfallback', '0', NULL),
(202, 0, 1316566490, 'enrol_imsenterprise', 'truncatecoursecodes', '0', NULL),
(203, 0, 1316566490, 'enrol_imsenterprise', 'createnewcourses', '0', NULL),
(204, 0, 1316566490, 'enrol_imsenterprise', 'createnewcategories', '0', NULL),
(205, 0, 1316566490, 'enrol_imsenterprise', 'imsunenrol', '0', NULL),
(206, 0, 1316566491, 'enrol_imsenterprise', 'imsrestricttarget', '', NULL),
(207, 0, 1316566491, 'enrol_imsenterprise', 'imscapitafix', '0', NULL),
(208, 0, 1316566491, 'enrol_ldap', 'host_url', '', NULL),
(209, 0, 1316566492, 'enrol_ldap', 'ldap_version', '3', NULL),
(210, 0, 1316566492, 'enrol_ldap', 'ldapencoding', 'utf-8', NULL),
(211, 0, 1316566492, 'enrol_ldap', 'bind_dn', '', NULL),
(212, 0, 1316566492, 'enrol_ldap', 'bind_pw', '', NULL),
(213, 0, 1316566493, 'enrol_ldap', 'course_search_sub', '0', NULL),
(214, 0, 1316566493, 'enrol_ldap', 'memberattribute_isdn', '0', NULL),
(215, 0, 1316566493, 'enrol_ldap', 'user_contexts', '', NULL),
(216, 0, 1316566493, 'enrol_ldap', 'user_search_sub', '0', NULL),
(217, 0, 1316566493, 'enrol_ldap', 'user_type', 'default', NULL),
(218, 0, 1316566493, 'enrol_ldap', 'opt_deref', '0', NULL),
(219, 0, 1316566494, 'enrol_ldap', 'idnumber_attribute', '', NULL),
(220, 0, 1316566494, 'enrol_ldap', 'objectclass', '', NULL),
(221, 0, 1316566494, 'enrol_ldap', 'course_idnumber', '', NULL),
(222, 0, 1316566494, 'enrol_ldap', 'course_shortname', '', NULL),
(223, 0, 1316566494, 'enrol_ldap', 'course_fullname', '', NULL),
(224, 0, 1316566494, 'enrol_ldap', 'course_summary', '', NULL),
(225, 0, 1316566494, 'enrol_ldap', 'ignorehiddencourses', '0', NULL),
(226, 0, 1316566495, 'enrol_ldap', 'unenrolaction', '0', NULL),
(227, 0, 1316566495, 'enrol_ldap', 'autocreate', '0', NULL),
(228, 0, 1316566495, 'enrol_ldap', 'template', '', NULL),
(229, 0, 1316566495, 'enrol_ldap', 'nested_groups', '0', NULL),
(230, 0, 1316566495, 'enrol_ldap', 'group_memberofattribute', '', NULL),
(231, 0, 1316566495, 'enrol_manual', 'defaultenrol', '1', NULL),
(232, 0, 1316566495, 'enrol_manual', 'status', '0', NULL),
(233, 0, 1316566495, 'enrol_manual', 'enrolperiod', '0', NULL),
(234, 0, 1316566495, 'enrol_paypal', 'paypalbusiness', '', NULL),
(235, 0, 1316566495, 'enrol_paypal', 'mailstudents', '0', NULL),
(236, 0, 1316566496, 'enrol_paypal', 'mailteachers', '0', NULL),
(237, 0, 1316566496, 'enrol_paypal', 'mailadmins', '0', NULL),
(238, 0, 1316566496, 'enrol_paypal', 'status', '1', NULL),
(239, 0, 1316566496, 'enrol_paypal', 'cost', '0', NULL),
(240, 0, 1316566496, 'enrol_paypal', 'currency', 'USD', NULL),
(241, 0, 1316566497, 'enrol_paypal', 'enrolperiod', '0', NULL),
(242, 0, 1316566497, 'enrol_self', 'requirepassword', '0', NULL),
(243, 0, 1316566497, 'enrol_self', 'usepasswordpolicy', '0', NULL),
(244, 0, 1316566497, 'enrol_self', 'showhint', '0', NULL),
(245, 0, 1316566497, 'enrol_self', 'defaultenrol', '1', NULL),
(246, 0, 1316566498, 'enrol_self', 'status', '1', NULL),
(247, 0, 1316566498, 'enrol_self', 'groupkey', '0', NULL),
(248, 0, 1316566498, 'enrol_self', 'enrolperiod', '0', NULL),
(249, 0, 1316566498, 'enrol_self', 'longtimenosee', '0', NULL),
(250, 0, 1316566498, 'enrol_self', 'maxenrolled', '0', NULL),
(251, 0, 1316566498, 'enrol_self', 'sendcoursewelcomemessage', '1', NULL),
(252, 0, 1316566498, 'editor_tinymce', 'spellengine', 'GoogleSpell', NULL),
(253, 0, 1316566499, NULL, 'sitedefaultlicense', 'allrightsreserved', NULL),
(254, 0, 1316566499, NULL, 'cachetext', '60', NULL),
(255, 0, 1316566499, NULL, 'filteruploadedfiles', '0', NULL),
(256, 0, 1316566499, NULL, 'filtermatchoneperpage', '0', NULL),
(257, 0, 1316566499, NULL, 'filtermatchonepertext', '0', NULL),
(258, 0, 1316566499, NULL, 'filter_censor_badwords', '', NULL),
(259, 0, 1316566499, NULL, 'filter_mediaplugin_enable_youtube', '1', NULL),
(260, 0, 1316566499, NULL, 'filter_mediaplugin_enable_vimeo', '0', NULL),
(261, 0, 1316566500, NULL, 'filter_mediaplugin_enable_mp3', '1', NULL),
(262, 0, 1316566500, NULL, 'filter_mediaplugin_enable_flv', '1', NULL),
(263, 0, 1316566500, NULL, 'filter_mediaplugin_enable_swf', '1', NULL),
(264, 0, 1316566500, NULL, 'filter_mediaplugin_enable_html5audio', '0', NULL),
(265, 0, 1316566500, NULL, 'filter_mediaplugin_enable_html5video', '0', NULL),
(266, 0, 1316566500, NULL, 'filter_mediaplugin_enable_qt', '1', NULL),
(267, 0, 1316566500, NULL, 'filter_mediaplugin_enable_wmp', '1', NULL),
(268, 0, 1316566500, NULL, 'filter_mediaplugin_enable_rm', '1', NULL),
(269, 0, 1316566501, NULL, 'filter_multilang_force_old', '0', NULL),
(270, 0, 1316566501, 'filter_urltolink', 'formats', '0', NULL),
(271, 0, 1316566501, 'filter_urltolink', 'embedimages', '1', NULL),
(272, 0, 1316566501, 'filter_emoticon', 'formats', '1,4,0', NULL),
(273, 0, 1316566501, NULL, 'filter_tex_latexpreamble', '\\usepackage[latin1]{inputenc}\n\\usepackage{amsmath}\n\\usepackage{amsfonts}\n\\RequirePackage{amsmath,amssymb,latexsym}\n', NULL),
(274, 0, 1316566501, NULL, 'filter_tex_latexbackground', '#FFFFFF', NULL),
(275, 0, 1316566501, NULL, 'filter_tex_density', '120', NULL),
(276, 0, 1316566501, NULL, 'filter_tex_pathlatex', '/usr/bin/latex', NULL),
(277, 0, 1316566502, NULL, 'filter_tex_pathdvips', '/usr/bin/dvips', NULL),
(278, 0, 1316566502, NULL, 'filter_tex_pathconvert', '/usr/bin/convert', NULL),
(279, 0, 1316566502, NULL, 'filter_tex_convertformat', 'gif', NULL),
(280, 0, 1316566502, NULL, 'portfolio_moderate_filesize_threshold', '1048576', NULL),
(281, 0, 1316566502, NULL, 'portfolio_high_filesize_threshold', '5242880', NULL),
(282, 0, 1316566502, NULL, 'portfolio_moderate_db_threshold', '20', NULL),
(283, 0, 1316566502, NULL, 'portfolio_high_db_threshold', '50', NULL),
(284, 0, 1316566502, NULL, 'repositorycacheexpire', '120', NULL),
(285, 0, 1316566502, NULL, 'repositoryallowexternallinks', '1', NULL),
(286, 0, 1316566502, NULL, 'legacyfilesinnewcourses', '0', NULL),
(287, 0, 1316566503, NULL, 'enablewsdocumentation', '0', NULL),
(288, 0, 1316566503, NULL, 'allowbeforeblock', '0', NULL),
(289, 0, 1316566503, NULL, 'allowedip', '', NULL),
(290, 0, 1316566503, NULL, 'blockedip', '', NULL),
(291, 0, 1316566503, NULL, 'protectusernames', '1', NULL),
(292, 0, 1316566503, NULL, 'forcelogin', '0', NULL),
(293, 0, 1316566503, NULL, 'forceloginforprofiles', '1', NULL),
(294, 0, 1316566503, NULL, 'opentogoogle', '0', NULL),
(295, 0, 1316566504, NULL, 'maxbytes', '0', NULL),
(296, 0, 1316566504, NULL, 'userquota', '104857600', NULL),
(297, 0, 1316566504, NULL, 'enablehtmlpurifier', '1', NULL),
(298, 0, 1316566504, NULL, 'allowobjectembed', '0', NULL),
(299, 0, 1316566504, NULL, 'enabletrusttext', '0', NULL),
(300, 0, 1316566505, NULL, 'maxeditingtime', '1800', NULL),
(301, 0, 1316566505, NULL, 'fullnamedisplay', 'language', NULL),
(302, 0, 1316566505, NULL, 'extendedusernamechars', '0', NULL),
(303, 0, 1316566505, NULL, 'sitepolicy', '', NULL),
(304, 0, 1316566506, NULL, 'sitepolicyguest', '', NULL),
(305, 0, 1316566506, NULL, 'keeptagnamecase', '1', NULL),
(306, 0, 1316566506, NULL, 'profilesforenrolledusersonly', '1', NULL),
(307, 0, 1316566506, NULL, 'cronclionly', '0', NULL),
(308, 0, 1316566506, NULL, 'cronremotepassword', '', NULL),
(309, 0, 1316566506, NULL, 'passwordpolicy', '1', NULL),
(310, 0, 1316566507, NULL, 'minpasswordlength', '8', NULL),
(311, 0, 1316566507, NULL, 'minpassworddigits', '1', NULL),
(312, 0, 1316566507, NULL, 'minpasswordlower', '1', NULL),
(313, 0, 1316566507, NULL, 'minpasswordupper', '1', NULL),
(314, 0, 1316566507, NULL, 'minpasswordnonalphanum', '1', NULL),
(315, 0, 1316566507, NULL, 'maxconsecutiveidentchars', '0', NULL),
(316, 0, 1316566507, NULL, 'groupenrolmentkeypolicy', '1', NULL),
(317, 0, 1316566507, NULL, 'disableuserimages', '0', NULL),
(318, 0, 1316566508, NULL, 'emailchangeconfirmation', '1', NULL),
(319, 0, 1316566508, NULL, 'loginhttps', '0', NULL),
(320, 0, 1316566508, NULL, 'cookiesecure', '0', NULL),
(321, 0, 1316566508, NULL, 'cookiehttponly', '0', NULL),
(322, 0, 1316566508, NULL, 'excludeoldflashclients', '10.0.12', NULL),
(323, 0, 1316566508, NULL, 'restrictmodulesfor', 'none', NULL),
(324, 0, 1316566508, NULL, 'restrictbydefault', '0', NULL),
(325, 0, 1316566508, NULL, 'displayloginfailures', '', NULL),
(326, 0, 1316566508, NULL, 'notifyloginfailures', '', NULL),
(327, 0, 1316566508, NULL, 'notifyloginthreshold', '10', NULL),
(328, 0, 1316566509, NULL, 'runclamonupload', '0', NULL),
(329, 0, 1316566509, NULL, 'pathtoclam', '', NULL),
(330, 0, 1316566509, NULL, 'quarantinedir', '', NULL),
(331, 0, 1316566509, NULL, 'clamfailureonupload', 'donothing', NULL),
(332, 0, 1316566509, NULL, 'themelist', '', NULL),
(333, 0, 1316566509, NULL, 'themedesignermode', '0', NULL),
(334, 0, 1316566509, NULL, 'allowuserthemes', '0', NULL),
(335, 0, 1316566509, NULL, 'allowcoursethemes', '0', NULL),
(336, 0, 1316566509, NULL, 'allowcategorythemes', '0', NULL),
(337, 0, 1316566510, NULL, 'allowthemechangeonurl', '0', NULL),
(338, 0, 1316566510, NULL, 'allowuserblockhiding', '1', NULL),
(339, 0, 1316566510, NULL, 'allowblockstodock', '1', NULL),
(340, 0, 1316566510, NULL, 'custommenuitems', '', NULL),
(341, 0, 1316566510, NULL, 'enabledevicedetection', '1', NULL),
(342, 0, 1316566510, NULL, 'devicedetectregex', '[]', NULL),
(343, 0, 1316566511, 'theme_arialist', 'logo', '', NULL),
(344, 0, 1316566511, 'theme_arialist', 'tagline', '', NULL),
(345, 0, 1316566511, 'theme_arialist', 'linkcolor', '#f25f0f', NULL),
(346, 0, 1316566511, 'theme_arialist', 'regionwidth', '250', NULL),
(347, 0, 1316566511, 'theme_arialist', 'customcss', '', NULL),
(348, 0, 1316566511, 'theme_brick', 'logo', '', NULL),
(349, 0, 1316566511, 'theme_brick', 'linkcolor', '#06365b', NULL),
(350, 0, 1316566511, 'theme_brick', 'linkhover', '#5487ad', NULL),
(351, 0, 1316566511, 'theme_brick', 'maincolor', '#8e2800', NULL),
(352, 0, 1316566512, 'theme_brick', 'maincolorlink', '#fff0a5', NULL),
(353, 0, 1316566512, 'theme_brick', 'headingcolor', '#5c3500', NULL),
(354, 0, 1316566512, 'theme_formal_white', 'fontsizereference', '13', NULL),
(355, 0, 1316566512, 'theme_formal_white', 'noframe', '0', NULL),
(356, 0, 1316566512, 'theme_formal_white', 'displaylogo', '1', NULL),
(357, 0, 1316566512, 'theme_formal_white', 'logo', '', NULL),
(358, 0, 1316566512, 'theme_formal_white', 'headerbgc', '#E3DFD4', NULL),
(359, 0, 1316566512, 'theme_formal_white', 'blockcontentbgc', '#F6F6F6', NULL),
(360, 0, 1316566512, 'theme_formal_white', 'lblockcolumnbgc', '#E3DFD4', NULL),
(361, 0, 1316566512, 'theme_formal_white', 'rblockcolumnbgc', '', NULL),
(362, 0, 1316566512, 'theme_formal_white', 'blockcolumnwidth', '200', NULL),
(363, 0, 1316566513, 'theme_formal_white', 'footnote', '', NULL),
(364, 0, 1316566513, 'theme_formal_white', 'customcss', '', NULL),
(365, 0, 1316566513, 'theme_fusion', 'linkcolor', '#2d83d5', NULL),
(366, 0, 1316566513, 'theme_fusion', 'tagline', '', NULL),
(367, 0, 1316566513, 'theme_fusion', 'footertext', '', NULL),
(368, 0, 1316566513, 'theme_fusion', 'customcss', '', NULL),
(369, 0, 1316566514, 'theme_magazine', 'background', '', NULL),
(370, 0, 1316566514, 'theme_magazine', 'logo', '', NULL),
(371, 0, 1316566514, 'theme_magazine', 'linkcolor', '#32529a', NULL),
(372, 0, 1316566514, 'theme_magazine', 'linkhover', '#4e2300', NULL),
(373, 0, 1316566514, 'theme_magazine', 'maincolor', '#002f2f', NULL),
(374, 0, 1316566514, 'theme_magazine', 'maincoloraccent', '#092323', NULL),
(375, 0, 1316566514, 'theme_magazine', 'headingcolor', '#4e0000', NULL),
(376, 0, 1316566514, 'theme_magazine', 'blockcolor', '#002f2f', NULL),
(377, 0, 1316566514, 'theme_magazine', 'forumback', '#e6e2af', NULL),
(378, 0, 1316566515, 'theme_nimble', 'tagline', '', NULL),
(379, 0, 1316566515, 'theme_nimble', 'footerline', '', NULL),
(380, 0, 1316566515, 'theme_nimble', 'backgroundcolor', '#454545', NULL),
(381, 0, 1316566515, 'theme_nimble', 'linkcolor', '#2a65b1', NULL),
(382, 0, 1316566515, 'theme_nimble', 'linkhover', '#222222', NULL),
(383, 0, 1316566516, 'theme_nonzero', 'regionprewidth', '200', NULL),
(384, 0, 1316566516, 'theme_nonzero', 'regionpostwidth', '200', NULL),
(385, 0, 1316566516, 'theme_nonzero', 'customcss', '', NULL),
(386, 0, 1316566516, 'theme_overlay', 'linkcolor', '#428ab5', NULL),
(387, 0, 1316566516, 'theme_overlay', 'headercolor', '#2a4c7b', NULL),
(388, 0, 1316566516, 'theme_overlay', 'footertext', '', NULL),
(389, 0, 1316566516, 'theme_overlay', 'customcss', '', NULL),
(390, 0, 1316566516, 'theme_sky_high', 'logo', '', NULL),
(391, 0, 1316566516, 'theme_sky_high', 'regionwidth', '240', NULL),
(392, 0, 1316566517, 'theme_sky_high', 'footnote', '', NULL),
(393, 0, 1316566517, 'theme_sky_high', 'customcss', '', NULL),
(394, 0, 1316566517, 'theme_splash', 'logo', '', NULL),
(395, 0, 1316566517, 'theme_splash', 'tagline', 'Centro de aprendizaje virtual', NULL),
(396, 0, 1316566517, 'theme_splash', 'hide_tagline', '0', NULL),
(397, 0, 1316566517, 'theme_splash', 'footnote', '', NULL),
(398, 0, 1316566517, 'theme_splash', 'customcss', '', NULL),
(399, 0, 1316566517, NULL, 'calendar_adminseesall', '0', NULL),
(400, 0, 1316566517, NULL, 'calendar_site_timeformat', '0', NULL),
(401, 0, 1316566518, NULL, 'calendar_startwday', '0', NULL),
(402, 0, 1316566518, NULL, 'calendar_weekend', '65', NULL),
(403, 0, 1316566518, NULL, 'calendar_lookahead', '21', NULL),
(404, 0, 1316566518, NULL, 'calendar_maxevents', '10', NULL),
(405, 0, 1316566518, NULL, 'enablecalendarexport', '1', NULL),
(406, 0, 1316566518, NULL, 'calendar_exportsalt', 'vexZzFVQtDgZqTtMy5JlxwtjqCLGHfSLvghOcDcOEJyUrBglXbCwHrNS2kZq', NULL),
(407, 0, 1316566518, NULL, 'useblogassociations', '1', NULL),
(408, 0, 1316566518, NULL, 'useexternalblogs', '1', NULL),
(409, 0, 1316566518, NULL, 'externalblogcrontime', '86400', NULL),
(410, 0, 1316566519, NULL, 'maxexternalblogsperuser', '1', NULL),
(411, 0, 1316566519, NULL, 'blogusecomments', '1', NULL),
(412, 0, 1316566519, NULL, 'blogshowcommentscount', '1', NULL),
(413, 0, 1316566519, NULL, 'defaulthomepage', '0', NULL),
(414, 0, 1316566519, NULL, 'navshowcategories', '1', NULL),
(415, 0, 1316566519, NULL, 'navshowallcourses', '0', NULL),
(416, 0, 1316566519, NULL, 'navcourselimit', '20', NULL),
(417, 0, 1316566520, NULL, 'formatstringstriptags', '1', NULL),
(418, 0, 1316566520, NULL, 'emoticons', '[{"text":":-)","imagename":"s\\/smiley","imagecomponent":"core","altidentifier":"smiley","altcomponent":"core_pix"},{"text":":)","imagename":"s\\/smiley","imagecomponent":"core","altidentifier":"smiley","altcomponent":"core_pix"},{"text":":-D","imagename":"s\\/biggrin","imagecomponent":"core","altidentifier":"biggrin","altcomponent":"core_pix"},{"text":";-)","imagename":"s\\/wink","imagecomponent":"core","altidentifier":"wink","altcomponent":"core_pix"},{"text":":-\\/","imagename":"s\\/mixed","imagecomponent":"core","altidentifier":"mixed","altcomponent":"core_pix"},{"text":"V-.","imagename":"s\\/thoughtful","imagecomponent":"core","altidentifier":"thoughtful","altcomponent":"core_pix"},{"text":":-P","imagename":"s\\/tongueout","imagecomponent":"core","altidentifier":"tongueout","altcomponent":"core_pix"},{"text":":-p","imagename":"s\\/tongueout","imagecomponent":"core","altidentifier":"tongueout","altcomponent":"core_pix"},{"text":"B-)","imagename":"s\\/cool","imagecomponent":"core","altidentifier":"cool","altcomponent":"core_pix"},{"text":"^-)","imagename":"s\\/approve","imagecomponent":"core","altidentifier":"approve","altcomponent":"core_pix"},{"text":"8-)","imagename":"s\\/wideeyes","imagecomponent":"core","altidentifier":"wideeyes","altcomponent":"core_pix"},{"text":":o)","imagename":"s\\/clown","imagecomponent":"core","altidentifier":"clown","altcomponent":"core_pix"},{"text":":-(","imagename":"s\\/sad","imagecomponent":"core","altidentifier":"sad","altcomponent":"core_pix"},{"text":":(","imagename":"s\\/sad","imagecomponent":"core","altidentifier":"sad","altcomponent":"core_pix"},{"text":"8-.","imagename":"s\\/shy","imagecomponent":"core","altidentifier":"shy","altcomponent":"core_pix"},{"text":":-I","imagename":"s\\/blush","imagecomponent":"core","altidentifier":"blush","altcomponent":"core_pix"},{"text":":-X","imagename":"s\\/kiss","imagecomponent":"core","altidentifier":"kiss","altcomponent":"core_pix"},{"text":"8-o","imagename":"s\\/surprise","imagecomponent":"core","altidentifier":"surprise","altcomponent":"core_pix"},{"text":"P-|","imagename":"s\\/blackeye","imagecomponent":"core","altidentifier":"blackeye","altcomponent":"core_pix"},{"text":"8-[","imagename":"s\\/angry","imagecomponent":"core","altidentifier":"angry","altcomponent":"core_pix"},{"text":"(grr)","imagename":"s\\/angry","imagecomponent":"core","altidentifier":"angry","altcomponent":"core_pix"},{"text":"xx-P","imagename":"s\\/dead","imagecomponent":"core","altidentifier":"dead","altcomponent":"core_pix"},{"text":"|-.","imagename":"s\\/sleepy","imagecomponent":"core","altidentifier":"sleepy","altcomponent":"core_pix"},{"text":"}-]","imagename":"s\\/evil","imagecomponent":"core","altidentifier":"evil","altcomponent":"core_pix"},{"text":"(h)","imagename":"s\\/heart","imagecomponent":"core","altidentifier":"heart","altcomponent":"core_pix"},{"text":"(heart)","imagename":"s\\/heart","imagecomponent":"core","altidentifier":"heart","altcomponent":"core_pix"},{"text":"(y)","imagename":"s\\/yes","imagecomponent":"core","altidentifier":"yes","altcomponent":"core"},{"text":"(n)","imagename":"s\\/no","imagecomponent":"core","altidentifier":"no","altcomponent":"core"},{"text":"(martin)","imagename":"s\\/martin","imagecomponent":"core","altidentifier":"martin","altcomponent":"core_pix"},{"text":"( )","imagename":"s\\/egg","imagecomponent":"core","altidentifier":"egg","altcomponent":"core_pix"}]', NULL),
(419, 0, 1316566520, NULL, 'docroot', 'http://docs.moodle.org', NULL),
(420, 0, 1316566520, NULL, 'doctonewwindow', '0', NULL),
(421, 0, 1316566520, NULL, 'enableajax', '1', NULL),
(422, 0, 1316566520, NULL, 'useexternalyui', '0', NULL),
(423, 0, 1316566520, NULL, 'yuicomboloading', '1', NULL),
(424, 0, 1316566520, NULL, 'cachejs', '1', NULL),
(425, 0, 1316566520, NULL, 'enablecourseajax', '1', NULL),
(426, 0, 1316566521, NULL, 'additionalhtmlhead', '', NULL),
(427, 0, 1316566521, NULL, 'additionalhtmltopofbody', '', NULL),
(428, 0, 1316566521, NULL, 'additionalhtmlfooter', '', NULL),
(429, 0, 1316566521, NULL, 'gdversion', '2', NULL),
(430, 0, 1316566521, NULL, 'pathtodu', '', NULL),
(431, 0, 1316566521, NULL, 'aspellpath', '', NULL),
(432, 0, 1316566521, NULL, 'pathtodot', '', NULL),
(433, 0, 1316566521, NULL, 'supportpage', '', NULL),
(434, 0, 1316566521, NULL, 'dbsessions', '1', NULL),
(435, 0, 1316566522, NULL, 'sessioncookie', '', NULL),
(436, 0, 1316566522, NULL, 'sessioncookiepath', '/', NULL),
(437, 0, 1316566522, NULL, 'sessioncookiedomain', '', NULL),
(438, 0, 1316566522, NULL, 'statsfirstrun', 'none', NULL),
(439, 0, 1316566522, NULL, 'statsmaxruntime', '0', NULL),
(440, 0, 1316566522, NULL, 'statsruntimedays', '31', NULL),
(441, 0, 1316566522, NULL, 'statsruntimestarthour', '0', NULL),
(442, 0, 1316566522, NULL, 'statsruntimestartminute', '0', NULL),
(443, 0, 1316566522, NULL, 'statsuserthreshold', '0', NULL),
(444, 0, 1316566523, NULL, 'framename', '_top', NULL),
(445, 0, 1316566523, NULL, 'slasharguments', '1', NULL),
(446, 0, 1316566523, NULL, 'getremoteaddrconf', '0', NULL),
(447, 0, 1316566523, NULL, 'proxyhost', '', NULL),
(448, 0, 1316566523, NULL, 'proxyport', '0', NULL),
(449, 0, 1316566523, NULL, 'proxytype', 'HTTP', NULL),
(450, 0, 1316566523, NULL, 'proxyuser', '', NULL),
(451, 0, 1316566523, NULL, 'proxypassword', '', NULL),
(452, 0, 1316566524, NULL, 'proxybypass', 'localhost, 127.0.0.1', NULL),
(453, 0, 1316566524, NULL, 'maintenance_enabled', '0', NULL),
(454, 0, 1316566524, NULL, 'maintenance_message', '', NULL),
(455, 0, 1316566524, NULL, 'deleteunconfirmed', '168', NULL),
(456, 0, 1316566524, NULL, 'deleteincompleteusers', '0', NULL),
(457, 0, 1316566524, NULL, 'logguests', '1', NULL),
(458, 0, 1316566524, NULL, 'loglifetime', '0', NULL),
(459, 0, 1316566524, NULL, 'disablegradehistory', '0', NULL),
(460, 0, 1316566525, NULL, 'gradehistorylifetime', '0', NULL),
(461, 0, 1316566525, NULL, 'numcoursesincombo', '500', NULL),
(462, 0, 1316566525, NULL, 'extramemorylimit', '512M', NULL),
(463, 0, 1316566525, NULL, 'curlcache', '120', NULL),
(464, 0, 1316566525, NULL, 'curltimeoutkbitrate', '56', NULL),
(465, 0, 1316566525, NULL, 'enableglobalsearch', '0', NULL),
(466, 0, 1316566525, NULL, 'enablesafebrowserintegration', '0', NULL),
(467, 0, 1316566525, NULL, 'enablegroupmembersonly', '0', NULL),
(468, 0, 1316566526, NULL, 'debug', '0', NULL),
(469, 0, 1316566526, NULL, 'debugdisplay', '1', NULL),
(470, 0, 1316566526, NULL, 'xmlstrictheaders', '0', NULL),
(471, 0, 1316566527, NULL, 'debugsmtp', '0', NULL),
(472, 0, 1316566527, NULL, 'perfdebug', '7', NULL),
(473, 0, 1316566527, NULL, 'debugstringids', '0', NULL),
(474, 0, 1316566527, NULL, 'debugvalidators', '0', NULL),
(475, 0, 1316566527, NULL, 'debugpageinfo', '0', NULL),
(476, 2, 1316567508, NULL, 'notloggedinroleid', '6', NULL),
(477, 2, 1316567508, NULL, 'guestroleid', '6', NULL),
(478, 2, 1316567508, NULL, 'defaultuserroleid', '7', NULL),
(479, 2, 1316567508, NULL, 'creatornewroleid', '3', NULL),
(480, 2, 1316567508, NULL, 'gradebookroles', '5', NULL),
(481, 2, 1316567508, NULL, 'assignment_maxbytes', '1048576', NULL),
(482, 2, 1316567508, NULL, 'assignment_itemstocount', '1', NULL),
(483, 2, 1316567509, NULL, 'assignment_showrecentsubmissions', '1', NULL),
(484, 2, 1316567509, NULL, 'chat_method', 'ajax', NULL),
(485, 2, 1316567509, NULL, 'chat_refresh_userlist', '10', NULL),
(486, 2, 1316567509, NULL, 'chat_old_ping', '35', NULL),
(487, 2, 1316567509, NULL, 'chat_refresh_room', '5', NULL),
(488, 2, 1316567509, NULL, 'chat_normal_updatemode', 'jsupdate', NULL),
(489, 2, 1316567509, NULL, 'chat_serverhost', 'localhost', NULL),
(490, 2, 1316567509, NULL, 'chat_serverip', '127.0.0.1', NULL),
(491, 2, 1316567510, NULL, 'chat_serverport', '9111', NULL),
(492, 2, 1316567510, NULL, 'chat_servermax', '100', NULL),
(493, 2, 1316567510, NULL, 'data_enablerssfeeds', '0', NULL),
(494, 2, 1316567510, NULL, 'feedback_allowfullanonymous', '0', NULL),
(495, 2, 1316567510, 'folder', 'requiremodintro', '1', NULL),
(496, 2, 1316567510, NULL, 'forum_displaymode', '3', NULL),
(497, 2, 1316567510, NULL, 'forum_replytouser', '1', NULL),
(498, 2, 1316567510, NULL, 'forum_shortpost', '300', NULL),
(499, 2, 1316567510, NULL, 'forum_longpost', '600', NULL),
(500, 2, 1316567511, NULL, 'forum_manydiscussions', '100', NULL),
(501, 2, 1316567511, NULL, 'forum_maxbytes', '512000', NULL),
(502, 2, 1316567511, NULL, 'forum_maxattachments', '9', NULL),
(503, 2, 1316567511, NULL, 'forum_trackreadposts', '1', NULL),
(504, 2, 1316567511, NULL, 'forum_oldpostdays', '14', NULL),
(505, 2, 1316567511, NULL, 'forum_usermarksread', '0', NULL),
(506, 2, 1316567511, NULL, 'forum_cleanreadtime', '2', NULL),
(507, 2, 1316567511, NULL, 'digestmailtime', '17', NULL),
(508, 2, 1316567512, NULL, 'forum_enablerssfeeds', '0', NULL),
(509, 2, 1316567512, NULL, 'forum_enabletimedposts', '0', NULL),
(510, 2, 1316567512, NULL, 'glossary_entbypage', '10', NULL),
(511, 2, 1316567512, NULL, 'glossary_dupentries', '0', NULL),
(512, 2, 1316567512, NULL, 'glossary_allowcomments', '0', NULL),
(513, 2, 1316567513, NULL, 'glossary_linkbydefault', '1', NULL),
(514, 2, 1316567513, NULL, 'glossary_defaultapproval', '1', NULL),
(515, 2, 1316567513, NULL, 'glossary_enablerssfeeds', '0', NULL),
(516, 2, 1316567513, NULL, 'glossary_linkentries', '0', NULL),
(517, 2, 1316567513, NULL, 'glossary_casesensitive', '0', NULL),
(518, 2, 1316567514, NULL, 'glossary_fullmatch', '0', NULL),
(519, 2, 1316567514, 'imscp', 'requiremodintro', '1', NULL),
(520, 2, 1316567514, 'imscp', 'keepold', '1', NULL),
(521, 2, 1316567514, 'imscp', 'keepold_adv', '0', NULL),
(522, 2, 1316567514, NULL, 'lesson_slideshowwidth', '640', NULL),
(523, 2, 1316567514, NULL, 'lesson_slideshowheight', '480', NULL),
(524, 2, 1316567514, NULL, 'lesson_slideshowbgcolor', '#FFFFFF', NULL),
(525, 2, 1316567514, NULL, 'lesson_mediawidth', '640', NULL),
(526, 2, 1316567514, NULL, 'lesson_mediaheight', '480', NULL),
(527, 2, 1316567515, NULL, 'lesson_mediaclose', '0', NULL),
(528, 2, 1316567515, NULL, 'lesson_maxhighscores', '10', NULL),
(529, 2, 1316567515, NULL, 'lesson_maxanswers', '4', NULL),
(530, 2, 1316567515, NULL, 'lesson_defaultnextpage', '0', NULL),
(531, 2, 1316567515, 'page', 'requiremodintro', '1', NULL),
(532, 2, 1316567515, 'page', 'displayoptions', '5', NULL),
(533, 2, 1316567515, 'page', 'printheading', '1', NULL),
(534, 2, 1316567515, 'page', 'printheading_adv', '0', NULL),
(535, 2, 1316567515, 'page', 'printintro', '0', NULL),
(536, 2, 1316567516, 'page', 'printintro_adv', '0', NULL),
(537, 2, 1316567516, 'page', 'display', '5', NULL),
(538, 2, 1316567516, 'page', 'display_adv', '1', NULL),
(539, 2, 1316567516, 'page', 'popupwidth', '620', NULL),
(540, 2, 1316567516, 'page', 'popupwidth_adv', '1', NULL),
(541, 2, 1316567516, 'page', 'popupheight', '450', NULL),
(542, 2, 1316567516, 'page', 'popupheight_adv', '1', NULL),
(543, 2, 1316567516, 'quiz', 'timelimit', '0', NULL),
(544, 2, 1316567516, 'quiz', 'timelimit_adv', '0', NULL),
(545, 2, 1316567517, 'quiz', 'attempts', '0', NULL),
(546, 2, 1316567517, 'quiz', 'attempts_adv', '0', NULL),
(547, 2, 1316567517, 'quiz', 'grademethod', '1', NULL),
(548, 2, 1316567517, 'quiz', 'grademethod_adv', '0', NULL),
(549, 2, 1316567517, 'quiz', 'maximumgrade', '10', NULL),
(550, 2, 1316567517, 'quiz', 'shufflequestions', '0', NULL),
(551, 2, 1316567517, 'quiz', 'shufflequestions_adv', '0', NULL),
(552, 2, 1316567517, 'quiz', 'questionsperpage', '1', NULL),
(553, 2, 1316567518, 'quiz', 'questionsperpage_adv', '0', NULL),
(554, 2, 1316567518, 'quiz', 'shuffleanswers', '1', NULL),
(555, 2, 1316567518, 'quiz', 'shuffleanswers_adv', '0', NULL),
(556, 2, 1316567518, 'quiz', 'preferredbehaviour', 'deferredfeedback', NULL),
(557, 2, 1316567518, 'quiz', 'attemptonlast', '0', NULL),
(558, 2, 1316567518, 'quiz', 'attemptonlast_adv', '1', NULL),
(559, 2, 1316567519, 'quiz', 'reviewattempt', '69904', NULL),
(560, 2, 1316567519, 'quiz', 'reviewcorrectness', '69904', NULL),
(561, 2, 1316567519, 'quiz', 'reviewmarks', '69904', NULL),
(562, 2, 1316567519, 'quiz', 'reviewspecificfeedback', '69904', NULL),
(563, 2, 1316567519, 'quiz', 'reviewgeneralfeedback', '69904', NULL),
(564, 2, 1316567519, 'quiz', 'reviewrightanswer', '69904', NULL),
(565, 2, 1316567519, 'quiz', 'reviewoverallfeedback', '4368', NULL),
(566, 2, 1316567519, 'quiz', 'showuserpicture', '0', NULL),
(567, 2, 1316567520, 'quiz', 'showuserpicture_adv', '0', NULL),
(568, 2, 1316567520, 'quiz', 'decimalpoints', '2', NULL),
(569, 2, 1316567520, 'quiz', 'decimalpoints_adv', '0', NULL),
(570, 2, 1316567520, 'quiz', 'questiondecimalpoints', '-1', NULL),
(571, 2, 1316567520, 'quiz', 'questiondecimalpoints_adv', '0', NULL),
(572, 2, 1316567520, 'quiz', 'showblocks', '0', NULL),
(573, 2, 1316567520, 'quiz', 'showblocks_adv', '1', NULL),
(574, 2, 1316567520, 'quiz', 'password', '', NULL),
(575, 2, 1316567520, 'quiz', 'password_adv', '0', NULL),
(576, 2, 1316567521, 'quiz', 'subnet', '', NULL),
(577, 2, 1316567521, 'quiz', 'subnet_adv', '0', NULL),
(578, 2, 1316567521, 'quiz', 'delay1', '0', NULL),
(579, 2, 1316567521, 'quiz', 'delay1_adv', '0', NULL),
(580, 2, 1316567521, 'quiz', 'delay2', '0', NULL),
(581, 2, 1316567521, 'quiz', 'delay2_adv', '0', NULL),
(582, 2, 1316567521, 'quiz', 'popup', '0', NULL),
(583, 2, 1316567521, 'quiz', 'popup_adv', '1', NULL),
(584, 2, 1316567521, 'resource', 'framesize', '130', NULL),
(585, 2, 1316567522, 'resource', 'requiremodintro', '1', NULL),
(586, 2, 1316567522, 'resource', 'displayoptions', '0,1,4,5,6', NULL),
(587, 2, 1316567522, 'resource', 'printheading', '0', NULL),
(588, 2, 1316567522, 'resource', 'printheading_adv', '0', NULL),
(589, 2, 1316567522, 'resource', 'printintro', '1', NULL),
(590, 2, 1316567522, 'resource', 'printintro_adv', '0', NULL),
(591, 2, 1316567522, 'resource', 'display', '0', NULL),
(592, 2, 1316567522, 'resource', 'display_adv', '0', NULL),
(593, 2, 1316567522, 'resource', 'popupwidth', '620', NULL),
(594, 2, 1316567523, 'resource', 'popupwidth_adv', '1', NULL),
(595, 2, 1316567523, 'resource', 'popupheight', '450', NULL),
(596, 2, 1316567523, 'resource', 'popupheight_adv', '1', NULL),
(597, 2, 1316567523, 'resource', 'filterfiles', '0', NULL),
(598, 2, 1316567523, 'resource', 'filterfiles_adv', '1', NULL),
(599, 2, 1316567523, 'scorm', 'grademethod', '1', NULL),
(600, 2, 1316567524, 'scorm', 'maxgrade', '100', NULL),
(601, 2, 1316567524, 'scorm', 'maxattempts', '0', NULL),
(602, 2, 1316567524, 'scorm', 'displayattemptstatus', '0', NULL),
(603, 2, 1316567524, 'scorm', 'displaycoursestructure', '0', NULL),
(604, 2, 1316567524, 'scorm', 'forcecompleted', '0', NULL),
(605, 2, 1316567525, 'scorm', 'forcenewattempt', '0', NULL),
(606, 2, 1316567525, 'scorm', 'lastattemptlock', '0', NULL),
(607, 2, 1316567525, 'scorm', 'whatgrade', '0', NULL),
(608, 2, 1316567525, 'scorm', 'framewidth', '100', NULL),
(609, 2, 1316567525, 'scorm', 'frameheight', '500', NULL),
(610, 2, 1316567525, 'scorm', 'popup', '0', NULL),
(611, 2, 1316567525, 'scorm', 'resizable', '0', NULL),
(612, 2, 1316567525, 'scorm', 'scrollbars', '0', NULL),
(613, 2, 1316567525, 'scorm', 'directories', '0', NULL),
(614, 2, 1316567526, 'scorm', 'location', '0', NULL),
(615, 2, 1316567526, 'scorm', 'menubar', '0', NULL),
(616, 2, 1316567526, 'scorm', 'toolbar', '0', NULL),
(617, 2, 1316567526, 'scorm', 'status', '0', NULL),
(618, 2, 1316567526, 'scorm', 'skipview', '0', NULL),
(619, 2, 1316567526, 'scorm', 'hidebrowse', '0', NULL),
(620, 2, 1316567526, 'scorm', 'hidetoc', '0', NULL),
(621, 2, 1316567527, 'scorm', 'hidenav', '0', NULL),
(622, 2, 1316567527, 'scorm', 'auto', '0', NULL),
(623, 2, 1316567527, 'scorm', 'updatefreq', '0', NULL),
(624, 2, 1316567527, 'scorm', 'allowtypeexternal', '0', NULL),
(625, 2, 1316567527, 'scorm', 'allowtypelocalsync', '0', NULL),
(626, 2, 1316567527, 'scorm', 'allowtypeimsrepository', '0', NULL),
(627, 2, 1316567527, 'scorm', 'forcejavascript', '1', NULL),
(628, 2, 1316567527, 'scorm', 'allowapidebug', '0', NULL),
(629, 2, 1316567527, 'scorm', 'apidebugmask', '.*', NULL),
(630, 2, 1316567528, 'url', 'framesize', '130', NULL),
(631, 2, 1316567528, 'url', 'requiremodintro', '1', NULL),
(632, 2, 1316567528, 'url', 'secretphrase', '', NULL),
(633, 2, 1316567528, 'url', 'rolesinparams', '0', NULL),
(634, 2, 1316567528, 'url', 'displayoptions', '0,1,5,6', NULL),
(635, 2, 1316567528, 'url', 'printheading', '0', NULL),
(636, 2, 1316567528, 'url', 'printheading_adv', '0', NULL),
(637, 2, 1316567528, 'url', 'printintro', '1', NULL),
(638, 2, 1316567528, 'url', 'printintro_adv', '0', NULL),
(639, 2, 1316567528, 'url', 'display', '0', NULL),
(640, 2, 1316567529, 'url', 'display_adv', '0', NULL),
(641, 2, 1316567529, 'url', 'popupwidth', '620', NULL),
(642, 2, 1316567529, 'url', 'popupwidth_adv', '1', NULL),
(643, 2, 1316567529, 'url', 'popupheight', '450', NULL),
(644, 2, 1316567529, 'url', 'popupheight_adv', '1', NULL),
(645, 2, 1316567529, 'workshop', 'grade', '80', NULL),
(646, 2, 1316567529, 'workshop', 'gradinggrade', '20', NULL),
(647, 2, 1316567529, 'workshop', 'gradedecimals', '0', NULL),
(648, 2, 1316567530, 'workshop', 'maxbytes', '0', NULL),
(649, 2, 1316567530, 'workshop', 'strategy', 'accumulative', NULL),
(650, 2, 1316567530, 'workshop', 'examplesmode', '0', NULL),
(651, 2, 1316567530, 'workshopallocation_random', 'numofreviews', '5', NULL),
(652, 2, 1316567530, 'workshopform_numerrors', 'grade0', 'No', NULL),
(653, 2, 1316567530, 'workshopform_numerrors', 'grade1', 'Sí', NULL),
(654, 2, 1316567530, 'workshopeval_best', 'comparison', '5', NULL),
(655, 2, 1316567531, NULL, 'block_course_list_adminview', 'all', NULL),
(656, 2, 1316567531, NULL, 'block_course_list_hideallcourseslink', '0', NULL),
(657, 2, 1316567531, NULL, 'block_online_users_timetosee', '5', NULL),
(658, 2, 1316567531, NULL, 'block_rss_client_num_entries', '5', NULL),
(659, 2, 1316567531, NULL, 'block_rss_client_timeout', '30', NULL),
(660, 2, 1316567531, NULL, 'block_search_enable_file_indexing', '0', NULL),
(661, 2, 1316567531, NULL, 'block_search_filetypes', 'PDF,TXT,HTML,PPT,XML,DOC,HTM', NULL),
(662, 2, 1316567531, NULL, 'block_search_usemoodleroot', '1', NULL),
(663, 2, 1316567531, NULL, 'block_search_limit_index_body', '0', NULL),
(664, 2, 1316567532, NULL, 'block_search_pdf_to_text_cmd', 'lib/xpdf/linux/pdftotext -enc UTF-8 -eol unix -q', NULL),
(665, 2, 1316567532, NULL, 'block_search_word_to_text_cmd', 'lib/antiword/linux/usr/bin/antiword', NULL),
(666, 2, 1316567532, NULL, 'block_search_word_to_text_env', 'ANTIWORDHOME=/home/damian/moodle/lib/antiword/linux/usr/share/antiword', NULL),
(667, 2, 1316567532, NULL, 'search_in_assignment', '1', NULL),
(668, 2, 1316567532, NULL, 'search_in_chat', '1', NULL),
(669, 2, 1316567532, NULL, 'search_in_data', '1', NULL),
(670, 2, 1316567532, NULL, 'search_in_forum', '1', NULL),
(671, 2, 1316567532, NULL, 'search_in_glossary', '1', NULL),
(672, 2, 1316567533, NULL, 'search_in_label', '1', NULL),
(673, 2, 1316567533, NULL, 'search_in_lesson', '1', NULL),
(674, 2, 1316567533, NULL, 'search_in_resource', '1', NULL),
(675, 2, 1316567533, NULL, 'search_in_wiki', '1', NULL),
(676, 2, 1316567533, 'blocks/section_links', 'numsections1', '22', NULL),
(677, 2, 1316567533, 'blocks/section_links', 'incby1', '2', NULL),
(678, 2, 1316567533, 'blocks/section_links', 'numsections2', '40', NULL),
(679, 2, 1316567533, 'blocks/section_links', 'incby2', '5', NULL),
(680, 2, 1316567533, NULL, 'block_tags_showcoursetags', '0', NULL),
(681, 2, 1316567534, NULL, 'jabberhost', '', NULL),
(682, 2, 1316567534, NULL, 'jabberserver', '', NULL),
(683, 2, 1316567534, NULL, 'jabberusername', '', NULL),
(684, 2, 1316567534, NULL, 'jabberpassword', '', NULL),
(685, 2, 1316567534, NULL, 'jabberport', '5222', NULL),
(686, 2, 1316567535, NULL, 'smtphosts', '', NULL),
(687, 2, 1316567535, NULL, 'smtpuser', '', NULL),
(688, 2, 1316567535, NULL, 'smtppass', '', NULL),
(689, 2, 1316567535, NULL, 'smtpmaxbulk', '1', NULL),
(690, 2, 1316567535, NULL, 'noreplyaddress', 'noreply@localhost', NULL),
(691, 2, 1316567535, NULL, 'sitemailcharset', '0', NULL),
(692, 2, 1316567535, NULL, 'allowusermailcharset', '0', NULL),
(693, 2, 1316567535, NULL, 'mailnewline', 'LF', NULL),
(694, 2, 1316567536, 'enrol_cohort', 'roleid', '5', NULL),
(695, 2, 1316567536, 'enrol_database', 'defaultrole', '5', NULL),
(696, 2, 1316567536, 'enrol_database', 'defaultcategory', '1', NULL),
(697, 2, 1316567536, 'enrol_flatfile', 'map_1', 'manager', NULL),
(698, 2, 1316567536, 'enrol_flatfile', 'map_2', 'coursecreator', NULL),
(699, 2, 1316567536, 'enrol_flatfile', 'map_3', 'editingteacher', NULL),
(700, 2, 1316567536, 'enrol_flatfile', 'map_4', 'teacher', NULL),
(701, 2, 1316567536, 'enrol_flatfile', 'map_5', 'student', NULL),
(702, 2, 1316567536, 'enrol_flatfile', 'map_6', 'guest', NULL),
(703, 2, 1316567537, 'enrol_flatfile', 'map_7', 'user', NULL),
(704, 2, 1316567537, 'enrol_flatfile', 'map_8', 'frontpage', NULL),
(705, 2, 1316567537, 'enrol_imsenterprise', 'imsrolemap01', '5', NULL),
(706, 2, 1316567537, 'enrol_imsenterprise', 'imsrolemap02', '3', NULL),
(707, 2, 1316567537, 'enrol_imsenterprise', 'imsrolemap03', '3', NULL),
(708, 2, 1316567537, 'enrol_imsenterprise', 'imsrolemap04', '5', NULL),
(709, 2, 1316567538, 'enrol_imsenterprise', 'imsrolemap05', '0', NULL),
(710, 2, 1316567538, 'enrol_imsenterprise', 'imsrolemap06', '4', NULL),
(711, 2, 1316567538, 'enrol_imsenterprise', 'imsrolemap07', '0', NULL),
(712, 2, 1316567538, 'enrol_imsenterprise', 'imsrolemap08', '4', NULL),
(713, 2, 1316567538, 'enrol_ldap', 'category', '1', NULL),
(714, 2, 1316567538, 'enrol_manual', 'roleid', '5', NULL),
(715, 2, 1316567538, 'enrol_meta', 'nosyncroleids', '', NULL),
(716, 2, 1316567538, 'enrol_mnet', 'roleid', '5', NULL),
(717, 2, 1316567538, 'enrol_mnet', 'roleid_adv', '1', NULL),
(718, 2, 1316567539, 'enrol_paypal', 'roleid', '5', NULL),
(719, 2, 1316567539, 'enrol_self', 'roleid', '5', NULL),
(720, 2, 1316567539, NULL, 'profileroles', '5,4,3', NULL),
(721, 2, 1316567539, NULL, 'defaultallowedmodules', '', NULL),
(722, 2, 1316567539, NULL, 'coursecontact', '3', NULL),
(723, 2, 1316567540, NULL, 'frontpage', '1', NULL),
(724, 2, 1316567540, NULL, 'frontpageloggedin', '1', NULL),
(725, 2, 1316567540, NULL, 'maxcategorydepth', '0', NULL),
(726, 2, 1316567540, NULL, 'commentsperpage', '15', NULL),
(727, 2, 1316567540, NULL, 'coursesperpage', '20', NULL),
(728, 2, 1316567540, NULL, 'defaultfrontpageroleid', '8', NULL),
(729, 2, 1316567540, NULL, 'supportname', 'admin Usuario', NULL),
(730, 2, 1316567540, NULL, 'supportemail', 'tallerdeprogramacioniifiuba2011@googlegroups.com', NULL),
(731, 2, 1316568553, NULL, 'registerauth', 'email', NULL),
(732, 2, 1316641636, NULL, 'profileroles', '3,4,5', '5,4,3'),
(733, 2, 1316641637, NULL, 'minpasswordlength', '6', '8'),
(734, 2, 1316641637, NULL, 'minpassworddigits', '0', '1'),
(735, 2, 1316641637, NULL, 'minpasswordlower', '0', '1'),
(736, 2, 1316641637, NULL, 'minpasswordupper', '0', '1'),
(737, 2, 1316641637, NULL, 'minpasswordnonalphanum', '0', '1'),
(738, 2, 1316715774, NULL, 'defaultfrontpageroleid', '0', '8'),
(739, 2, 1316715819, NULL, 'frontpage', '0', '1'),
(740, 2, 1316715819, NULL, 'frontpageloggedin', '0', '1'),
(741, 2, 1316810951, NULL, 'hiddenuserfields', 'icqnumber,skypeid,yahooid,aimid,msnid,firstaccess,lastaccess', ''),
(742, 2, 1317391417, NULL, 'usetags', '0', '1'),
(743, 2, 1317391418, NULL, 'enablenotes', '0', '1'),
(744, 2, 1317391418, NULL, 'bloglevel', '0', '4'),
(745, 2, 1317393444, 'moodlecourse', 'format', 'topics', 'weeks'),
(746, 2, 1317393444, 'moodlecourse', 'numsections', '16', '10'),
(747, 2, 1317393444, 'moodlecourse', 'maxbytes', '0', '2097152');
INSERT INTO `mdl_config_log` (`id`, `userid`, `timemodified`, `plugin`, `name`, `value`, `oldvalue`) VALUES
(748, 2, 1317393554, 'moodlecourse', 'format', 'weeks', 'topics'),
(749, 2, 1317397005, NULL, 'forum_maxbytes', '0', '512000'),
(750, 2, 1317397005, NULL, 'forum_maxattachments', '0', '9'),
(751, 2, 1317937489, 'enrol_manual', 'roleid', '3', '5'),
(752, 2, 1318001550, 'enrol_self', 'status', '0', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_config_plugins`
--

CREATE TABLE IF NOT EXISTS `mdl_config_plugins` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `plugin` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'core',
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_confplug_plunam_uix` (`plugin`,`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Moodle modules and plugins configuration variables' AUTO_INCREMENT=597 ;

--
-- Volcado de datos para la tabla `mdl_config_plugins`
--

INSERT INTO `mdl_config_plugins` (`id`, `plugin`, `name`, `value`) VALUES
(1, 'moodlecourse', 'format', 'weeks'),
(2, 'moodlecourse', 'maxsections', '52'),
(3, 'moodlecourse', 'numsections', '16'),
(4, 'moodlecourse', 'hiddensections', '0'),
(5, 'moodlecourse', 'newsitems', '5'),
(6, 'moodlecourse', 'showgrades', '1'),
(7, 'moodlecourse', 'showreports', '0'),
(8, 'moodlecourse', 'maxbytes', '0'),
(9, 'moodlecourse', 'groupmode', '0'),
(10, 'moodlecourse', 'groupmodeforce', '0'),
(11, 'moodlecourse', 'visible', '1'),
(12, 'moodlecourse', 'lang', ''),
(13, 'moodlecourse', 'enablecompletion', '0'),
(14, 'moodlecourse', 'completionstartonenrol', '0'),
(15, 'backup', 'backup_general_users', '1'),
(16, 'backup', 'backup_general_users_locked', '0'),
(17, 'backup', 'backup_general_anonymize', '0'),
(18, 'backup', 'backup_general_anonymize_locked', '0'),
(19, 'backup', 'backup_general_role_assignments', '1'),
(20, 'backup', 'backup_general_role_assignments_locked', '0'),
(21, 'backup', 'backup_general_user_files', '1'),
(22, 'backup', 'backup_general_user_files_locked', '0'),
(23, 'backup', 'backup_general_activities', '1'),
(24, 'backup', 'backup_general_activities_locked', '0'),
(25, 'backup', 'backup_general_blocks', '1'),
(26, 'backup', 'backup_general_blocks_locked', '0'),
(27, 'backup', 'backup_general_filters', '1'),
(28, 'backup', 'backup_general_filters_locked', '0'),
(29, 'backup', 'backup_general_comments', '1'),
(30, 'backup', 'backup_general_comments_locked', '0'),
(31, 'backup', 'backup_general_userscompletion', '1'),
(32, 'backup', 'backup_general_userscompletion_locked', '0'),
(33, 'backup', 'backup_general_logs', '0'),
(34, 'backup', 'backup_general_logs_locked', '0'),
(35, 'backup', 'backup_general_histories', '0'),
(36, 'backup', 'backup_general_histories_locked', '0'),
(37, 'backup', 'backup_auto_active', '0'),
(38, 'backup', 'backup_auto_weekdays', '0000000'),
(39, 'backup', 'backup_auto_hour', '0'),
(40, 'backup', 'backup_auto_minute', '0'),
(41, 'backup', 'backup_auto_storage', '0'),
(42, 'backup', 'backup_auto_destination', ''),
(43, 'backup', 'backup_auto_keep', '1'),
(44, 'backup', 'backup_auto_users', '1'),
(45, 'backup', 'backup_auto_role_assignments', '1'),
(46, 'backup', 'backup_auto_user_files', '1'),
(47, 'backup', 'backup_auto_activities', '1'),
(48, 'backup', 'backup_auto_blocks', '1'),
(49, 'backup', 'backup_auto_filters', '1'),
(50, 'backup', 'backup_auto_comments', '1'),
(51, 'backup', 'backup_auto_userscompletion', '1'),
(52, 'backup', 'backup_auto_logs', '0'),
(53, 'backup', 'backup_auto_histories', '0'),
(54, 'enrol_database', 'dbtype', ''),
(55, 'enrol_database', 'dbhost', 'localhost'),
(56, 'enrol_database', 'dbuser', ''),
(57, 'enrol_database', 'dbpass', ''),
(58, 'enrol_database', 'dbname', ''),
(59, 'enrol_database', 'dbencoding', 'utf-8'),
(60, 'enrol_database', 'dbsetupsql', ''),
(61, 'enrol_database', 'dbsybasequoting', '0'),
(62, 'enrol_database', 'debugdb', '0'),
(63, 'enrol_database', 'localcoursefield', 'idnumber'),
(64, 'enrol_database', 'localuserfield', 'idnumber'),
(65, 'enrol_database', 'localrolefield', 'shortname'),
(66, 'enrol_database', 'remoteenroltable', ''),
(67, 'enrol_database', 'remotecoursefield', ''),
(68, 'enrol_database', 'remoteuserfield', ''),
(69, 'enrol_database', 'remoterolefield', ''),
(70, 'enrol_database', 'ignorehiddencourses', '0'),
(71, 'enrol_database', 'unenrolaction', '0'),
(72, 'enrol_database', 'newcoursetable', ''),
(73, 'enrol_database', 'newcoursefullname', 'fullname'),
(74, 'enrol_database', 'newcourseshortname', 'shortname'),
(75, 'enrol_database', 'newcourseidnumber', 'idnumber'),
(76, 'enrol_database', 'newcoursecategory', ''),
(77, 'enrol_database', 'templatecourse', ''),
(78, 'enrol_flatfile', 'location', ''),
(79, 'enrol_flatfile', 'mailstudents', '0'),
(80, 'enrol_flatfile', 'mailteachers', '0'),
(81, 'enrol_flatfile', 'mailadmins', '0'),
(82, 'enrol_guest', 'requirepassword', '0'),
(83, 'enrol_guest', 'usepasswordpolicy', '0'),
(84, 'enrol_guest', 'showhint', '0'),
(85, 'enrol_guest', 'defaultenrol', '1'),
(86, 'enrol_guest', 'status', '1'),
(87, 'enrol_guest', 'status_adv', '0'),
(88, 'enrol_imsenterprise', 'imsfilelocation', ''),
(89, 'enrol_imsenterprise', 'logtolocation', ''),
(90, 'enrol_imsenterprise', 'mailadmins', '0'),
(91, 'enrol_imsenterprise', 'createnewusers', '0'),
(92, 'enrol_imsenterprise', 'imsdeleteusers', '0'),
(93, 'enrol_imsenterprise', 'fixcaseusernames', '0'),
(94, 'enrol_imsenterprise', 'fixcasepersonalnames', '0'),
(95, 'enrol_imsenterprise', 'imssourcedidfallback', '0'),
(96, 'enrol_imsenterprise', 'truncatecoursecodes', '0'),
(97, 'enrol_imsenterprise', 'createnewcourses', '0'),
(98, 'enrol_imsenterprise', 'createnewcategories', '0'),
(99, 'enrol_imsenterprise', 'imsunenrol', '0'),
(100, 'enrol_imsenterprise', 'imsrestricttarget', ''),
(101, 'enrol_imsenterprise', 'imscapitafix', '0'),
(102, 'enrol_ldap', 'host_url', ''),
(103, 'enrol_ldap', 'ldap_version', '3'),
(104, 'enrol_ldap', 'ldapencoding', 'utf-8'),
(105, 'enrol_ldap', 'bind_dn', ''),
(106, 'enrol_ldap', 'bind_pw', ''),
(107, 'enrol_ldap', 'course_search_sub', '0'),
(108, 'enrol_ldap', 'memberattribute_isdn', '0'),
(109, 'enrol_ldap', 'user_contexts', ''),
(110, 'enrol_ldap', 'user_search_sub', '0'),
(111, 'enrol_ldap', 'user_type', 'default'),
(112, 'enrol_ldap', 'opt_deref', '0'),
(113, 'enrol_ldap', 'idnumber_attribute', ''),
(114, 'enrol_ldap', 'objectclass', '(objectClass=*)'),
(115, 'enrol_ldap', 'course_idnumber', ''),
(116, 'enrol_ldap', 'course_shortname', ''),
(117, 'enrol_ldap', 'course_fullname', ''),
(118, 'enrol_ldap', 'course_summary', ''),
(119, 'enrol_ldap', 'ignorehiddencourses', '0'),
(120, 'enrol_ldap', 'unenrolaction', '0'),
(121, 'enrol_ldap', 'autocreate', '0'),
(122, 'enrol_ldap', 'template', ''),
(123, 'enrol_ldap', 'nested_groups', '0'),
(124, 'enrol_ldap', 'group_memberofattribute', ''),
(125, 'enrol_manual', 'defaultenrol', '1'),
(126, 'enrol_manual', 'status', '0'),
(127, 'enrol_manual', 'enrolperiod', '0'),
(128, 'enrol_paypal', 'paypalbusiness', ''),
(129, 'enrol_paypal', 'mailstudents', '0'),
(130, 'enrol_paypal', 'mailteachers', '0'),
(131, 'enrol_paypal', 'mailadmins', '0'),
(132, 'enrol_paypal', 'status', '1'),
(133, 'enrol_paypal', 'cost', '0'),
(134, 'enrol_paypal', 'currency', 'USD'),
(135, 'enrol_paypal', 'enrolperiod', '0'),
(136, 'enrol_self', 'requirepassword', '0'),
(137, 'enrol_self', 'usepasswordpolicy', '0'),
(138, 'enrol_self', 'showhint', '0'),
(139, 'enrol_self', 'defaultenrol', '1'),
(140, 'enrol_self', 'status', '0'),
(141, 'enrol_self', 'groupkey', '0'),
(142, 'enrol_self', 'enrolperiod', '0'),
(143, 'enrol_self', 'longtimenosee', '0'),
(144, 'enrol_self', 'maxenrolled', '0'),
(145, 'enrol_self', 'sendcoursewelcomemessage', '1'),
(146, 'editor_tinymce', 'spellengine', 'GoogleSpell'),
(147, 'filter_urltolink', 'formats', '0'),
(148, 'filter_urltolink', 'embedimages', '1'),
(149, 'filter_emoticon', 'formats', '1,4,0'),
(150, 'theme_arialist', 'logo', ''),
(151, 'theme_arialist', 'tagline', ''),
(152, 'theme_arialist', 'linkcolor', '#f25f0f'),
(153, 'theme_arialist', 'regionwidth', '250'),
(154, 'theme_arialist', 'customcss', ''),
(155, 'theme_brick', 'logo', ''),
(156, 'theme_brick', 'linkcolor', '#06365b'),
(157, 'theme_brick', 'linkhover', '#5487ad'),
(158, 'theme_brick', 'maincolor', '#8e2800'),
(159, 'theme_brick', 'maincolorlink', '#fff0a5'),
(160, 'theme_brick', 'headingcolor', '#5c3500'),
(161, 'theme_formal_white', 'fontsizereference', '13'),
(162, 'theme_formal_white', 'noframe', '0'),
(163, 'theme_formal_white', 'displaylogo', '1'),
(164, 'theme_formal_white', 'logo', ''),
(165, 'theme_formal_white', 'headerbgc', '#E3DFD4'),
(166, 'theme_formal_white', 'blockcontentbgc', '#F6F6F6'),
(167, 'theme_formal_white', 'lblockcolumnbgc', '#E3DFD4'),
(168, 'theme_formal_white', 'rblockcolumnbgc', ''),
(169, 'theme_formal_white', 'blockcolumnwidth', '200'),
(170, 'theme_formal_white', 'footnote', ''),
(171, 'theme_formal_white', 'customcss', ''),
(172, 'theme_fusion', 'linkcolor', '#2d83d5'),
(173, 'theme_fusion', 'tagline', ''),
(174, 'theme_fusion', 'footertext', ''),
(175, 'theme_fusion', 'customcss', ''),
(176, 'theme_magazine', 'background', ''),
(177, 'theme_magazine', 'logo', ''),
(178, 'theme_magazine', 'linkcolor', '#32529a'),
(179, 'theme_magazine', 'linkhover', '#4e2300'),
(180, 'theme_magazine', 'maincolor', '#002f2f'),
(181, 'theme_magazine', 'maincoloraccent', '#092323'),
(182, 'theme_magazine', 'headingcolor', '#4e0000'),
(183, 'theme_magazine', 'blockcolor', '#002f2f'),
(184, 'theme_magazine', 'forumback', '#e6e2af'),
(185, 'theme_nimble', 'tagline', ''),
(186, 'theme_nimble', 'footerline', ''),
(187, 'theme_nimble', 'backgroundcolor', '#454545'),
(188, 'theme_nimble', 'linkcolor', '#2a65b1'),
(189, 'theme_nimble', 'linkhover', '#222222'),
(190, 'theme_nonzero', 'regionprewidth', '200'),
(191, 'theme_nonzero', 'regionpostwidth', '200'),
(192, 'theme_nonzero', 'customcss', ''),
(193, 'theme_overlay', 'linkcolor', '#428ab5'),
(194, 'theme_overlay', 'headercolor', '#2a4c7b'),
(195, 'theme_overlay', 'footertext', ''),
(196, 'theme_overlay', 'customcss', ''),
(197, 'theme_sky_high', 'logo', ''),
(198, 'theme_sky_high', 'regionwidth', '240'),
(199, 'theme_sky_high', 'footnote', ''),
(200, 'theme_sky_high', 'customcss', ''),
(201, 'theme_splash', 'logo', ''),
(202, 'theme_splash', 'tagline', 'Centro de aprendizaje virtual'),
(203, 'theme_splash', 'hide_tagline', '0'),
(204, 'theme_splash', 'footnote', ''),
(205, 'theme_splash', 'customcss', ''),
(206, 'qtype_calculated', 'version', '2011051900'),
(207, 'qtype_calculatedmulti', 'version', '2011051900'),
(208, 'qtype_calculatedsimple', 'version', '2011051900'),
(209, 'qtype_description', 'version', '2011051200'),
(210, 'qtype_essay', 'version', '2011060300'),
(211, 'qtype_match', 'version', '2011051200'),
(212, 'qtype_missingtype', 'version', '2011051200'),
(213, 'qtype_multianswer', 'version', '2011051200'),
(214, 'qtype_multichoice', 'version', '2011051200'),
(215, 'qtype_numerical', 'version', '2011051200'),
(216, 'qtype_random', 'version', '2011051200'),
(217, 'qtype_randomsamatch', 'version', '2010090501'),
(218, 'qtype_shortanswer', 'version', '2011051200'),
(219, 'qtype_truefalse', 'version', '2011051200'),
(228, 'auth_cas', 'version', '2010072600'),
(230, 'auth_db', 'version', '2009112400'),
(232, 'auth_fc', 'version', '2009112400'),
(234, 'auth_imap', 'version', '2009112400'),
(236, 'auth_ldap', 'version', '2010072600'),
(238, 'auth_manual', 'version', '2011022700'),
(239, 'auth_mnet', 'version', '2010071300'),
(241, 'auth_nntp', 'version', '2009112400'),
(243, 'auth_pam', 'version', '2009112400'),
(245, 'auth_pop3', 'version', '2009112400'),
(247, 'auth_radius', 'version', '2009112400'),
(249, 'auth_shibboleth', 'version', '2009112400'),
(251, 'enrol_authorize', 'version', '2010081203'),
(252, 'enrol_category', 'version', '2010061500'),
(254, 'enrol_cohort', 'version', '2010073100'),
(255, 'enrol_database', 'version', '2010073101'),
(257, 'enrol_flatfile', 'version', '2010091400'),
(258, 'enrol_guest', 'version', '2010081800'),
(259, 'enrol_imsenterprise', 'version', '2011013000'),
(261, 'enrol_ldap', 'version', '2010071100'),
(263, 'enrol_manual', 'version', '2010071201'),
(265, 'enrol_meta', 'version', '2010073100'),
(267, 'enrol_mnet', 'version', '2010071701'),
(268, 'enrol_paypal', 'version', '2010073100'),
(269, 'enrol_self', 'version', '2010090501'),
(271, 'message_email', 'version', '2010090501'),
(273, 'message', 'email_provider_mod_assignment_assignment_updates_permitted', 'permitted'),
(274, 'message', 'message_provider_mod_assignment_assignment_updates_loggedin', 'email'),
(275, 'message', 'message_provider_mod_assignment_assignment_updates_loggedoff', 'email'),
(276, 'message', 'email_provider_mod_feedback_submission_permitted', 'permitted'),
(277, 'message', 'message_provider_mod_feedback_submission_loggedin', 'email'),
(278, 'message', 'message_provider_mod_feedback_submission_loggedoff', 'email'),
(279, 'message', 'email_provider_mod_feedback_message_permitted', 'permitted'),
(280, 'message', 'message_provider_mod_feedback_message_loggedin', 'email'),
(281, 'message', 'message_provider_mod_feedback_message_loggedoff', 'email'),
(282, 'message', 'email_provider_mod_forum_posts_permitted', 'permitted'),
(283, 'message', 'message_provider_mod_forum_posts_loggedin', 'email'),
(284, 'message', 'message_provider_mod_forum_posts_loggedoff', 'email'),
(285, 'message', 'email_provider_mod_lesson_graded_essay_permitted', 'permitted'),
(286, 'message', 'message_provider_mod_lesson_graded_essay_loggedin', 'email'),
(287, 'message', 'message_provider_mod_lesson_graded_essay_loggedoff', 'email'),
(288, 'message', 'email_provider_mod_quiz_submission_permitted', 'permitted'),
(289, 'message', 'message_provider_mod_quiz_submission_loggedin', 'email'),
(290, 'message', 'message_provider_mod_quiz_submission_loggedoff', 'email'),
(291, 'message', 'email_provider_mod_quiz_confirmation_permitted', 'permitted'),
(292, 'message', 'message_provider_mod_quiz_confirmation_loggedin', 'email'),
(293, 'message', 'message_provider_mod_quiz_confirmation_loggedoff', 'email'),
(294, 'message', 'email_provider_moodle_notices_permitted', 'permitted'),
(295, 'message', 'message_provider_moodle_notices_loggedin', 'email'),
(296, 'message', 'message_provider_moodle_notices_loggedoff', 'email'),
(297, 'message', 'email_provider_moodle_errors_permitted', 'permitted'),
(298, 'message', 'message_provider_moodle_errors_loggedin', 'email'),
(299, 'message', 'message_provider_moodle_errors_loggedoff', 'email'),
(300, 'message', 'email_provider_moodle_instantmessage_permitted', 'permitted'),
(301, 'message', 'message_provider_moodle_instantmessage_loggedoff', 'popup,email'),
(302, 'message', 'email_provider_moodle_backup_permitted', 'permitted'),
(303, 'message', 'message_provider_moodle_backup_loggedin', 'email'),
(304, 'message', 'message_provider_moodle_backup_loggedoff', 'email'),
(305, 'message', 'email_provider_moodle_courserequested_permitted', 'permitted'),
(306, 'message', 'message_provider_moodle_courserequested_loggedin', 'email'),
(307, 'message', 'message_provider_moodle_courserequested_loggedoff', 'email'),
(308, 'message', 'email_provider_moodle_courserequestapproved_permitted', 'permitted'),
(309, 'message', 'message_provider_moodle_courserequestapproved_loggedin', 'email'),
(310, 'message', 'message_provider_moodle_courserequestapproved_loggedoff', 'email'),
(311, 'message', 'email_provider_moodle_courserequestrejected_permitted', 'permitted'),
(312, 'message', 'message_provider_moodle_courserequestrejected_loggedin', 'email'),
(313, 'message', 'message_provider_moodle_courserequestrejected_loggedoff', 'email'),
(314, 'message_jabber', 'version', '2010090501'),
(316, 'message', 'jabber_provider_mod_assignment_assignment_updates_permitted', 'permitted'),
(317, 'message', 'jabber_provider_mod_feedback_submission_permitted', 'permitted'),
(318, 'message', 'jabber_provider_mod_feedback_message_permitted', 'permitted'),
(319, 'message', 'jabber_provider_mod_forum_posts_permitted', 'permitted'),
(320, 'message', 'jabber_provider_mod_lesson_graded_essay_permitted', 'permitted'),
(321, 'message', 'jabber_provider_mod_quiz_submission_permitted', 'permitted'),
(322, 'message', 'jabber_provider_mod_quiz_confirmation_permitted', 'permitted'),
(323, 'message', 'jabber_provider_moodle_notices_permitted', 'permitted'),
(324, 'message', 'jabber_provider_moodle_errors_permitted', 'permitted'),
(325, 'message', 'jabber_provider_moodle_instantmessage_permitted', 'permitted'),
(326, 'message', 'jabber_provider_moodle_backup_permitted', 'permitted'),
(327, 'message', 'jabber_provider_moodle_courserequested_permitted', 'permitted'),
(328, 'message', 'jabber_provider_moodle_courserequestapproved_permitted', 'permitted'),
(329, 'message', 'jabber_provider_moodle_courserequestrejected_permitted', 'permitted'),
(330, 'message_popup', 'version', '2010090501'),
(332, 'message', 'popup_provider_mod_assignment_assignment_updates_permitted', 'permitted'),
(333, 'message', 'popup_provider_mod_feedback_submission_permitted', 'permitted'),
(334, 'message', 'popup_provider_mod_feedback_message_permitted', 'permitted'),
(335, 'message', 'popup_provider_mod_forum_posts_permitted', 'permitted'),
(336, 'message', 'popup_provider_mod_lesson_graded_essay_permitted', 'permitted'),
(337, 'message', 'popup_provider_mod_quiz_submission_permitted', 'permitted'),
(338, 'message', 'popup_provider_mod_quiz_confirmation_permitted', 'permitted'),
(339, 'message', 'popup_provider_moodle_notices_permitted', 'permitted'),
(340, 'message', 'popup_provider_moodle_errors_permitted', 'permitted'),
(341, 'message', 'popup_provider_moodle_instantmessage_permitted', 'permitted'),
(342, 'message', 'message_provider_moodle_instantmessage_loggedin', 'popup'),
(343, 'message', 'popup_provider_moodle_backup_permitted', 'permitted'),
(344, 'message', 'popup_provider_moodle_courserequested_permitted', 'permitted'),
(345, 'message', 'popup_provider_moodle_courserequestapproved_permitted', 'permitted'),
(346, 'message', 'popup_provider_moodle_courserequestrejected_permitted', 'permitted'),
(349, 'filter_emoticon', 'version', '2010102300'),
(350, 'filter_mediaplugin', 'version', '2011030900'),
(352, 'filter_tex', 'version', '2011031301'),
(354, 'filter_urltolink', 'version', '2010100500'),
(355, 'editor_textarea', 'version', '2010090501'),
(356, 'editor_tinymce', 'version', '2010093000'),
(357, 'report_courseoverview', 'version', '2010090501'),
(358, 'report_customlang', 'version', '2011041900'),
(359, 'report_questioninstances', 'version', '2010090501'),
(360, 'report_security', 'version', '2010090501'),
(361, 'report_unittest', 'version', '2010090501'),
(362, 'report_unsuproles', 'version', '2010071800'),
(363, 'coursereport_completion', 'version', '2010090501'),
(364, 'coursereport_log', 'version', '2010090501'),
(365, 'coursereport_outline', 'version', '2010090501'),
(366, 'coursereport_participation', 'version', '2010090501'),
(367, 'coursereport_progress', 'version', '2010090501'),
(368, 'coursereport_stats', 'version', '2010090501'),
(369, 'gradeexport_ods', 'version', '2010090501'),
(370, 'gradeexport_txt', 'version', '2010090501'),
(371, 'gradeexport_xls', 'version', '2010090501'),
(372, 'gradeexport_xml', 'version', '2010090501'),
(373, 'gradeimport_csv', 'version', '2010090501'),
(374, 'gradeimport_xml', 'version', '2010090501'),
(375, 'gradereport_grader', 'version', '2010090501'),
(376, 'gradereport_outcomes', 'version', '2010090501'),
(377, 'gradereport_overview', 'version', '2010090501'),
(378, 'gradereport_user', 'version', '2010090501'),
(379, 'mnetservice_enrol', 'version', '2010071700'),
(380, 'webservice_amf', 'version', '2009101900'),
(381, 'webservice_rest', 'version', '2009100800'),
(382, 'webservice_soap', 'version', '2009101900'),
(383, 'webservice_xmlrpc', 'version', '2009101900'),
(384, 'repository_alfresco', 'version', '2010050700'),
(385, 'repository_boxnet', 'version', '2009080105'),
(386, 'repository_coursefiles', 'version', '2010083100'),
(387, 'repository_dropbox', 'version', '2010051400'),
(388, 'repository_filesystem', 'version', '2009080102'),
(389, 'repository_flickr', 'version', '2009080102'),
(390, 'repository_flickr_public', 'version', '2009080102'),
(391, 'repository_googledocs', 'version', '2009080102'),
(392, 'repository_local', 'version', '2009080102'),
(394, 'local', 'enablecourseinstances', '0'),
(395, 'local', 'enableuserinstances', '0'),
(396, 'repository_merlot', 'version', '2009111301'),
(397, 'repository_picasa', 'version', '2009080102'),
(398, 'repository_recent', 'version', '2010042202'),
(400, 'recent', 'enablecourseinstances', '0'),
(401, 'recent', 'enableuserinstances', '0'),
(402, 'repository_s3', 'version', '2009080102'),
(403, 'repository_upload', 'version', '2009080102'),
(405, 'upload', 'enablecourseinstances', '0'),
(406, 'upload', 'enableuserinstances', '0'),
(407, 'repository_url', 'version', '2009080102'),
(408, 'repository_user', 'version', '2010052700'),
(410, 'user', 'enablecourseinstances', '0'),
(411, 'user', 'enableuserinstances', '0'),
(412, 'repository_webdav', 'version', '2009080102'),
(413, 'repository_wikimedia', 'version', '2009080102'),
(414, 'repository_youtube', 'version', '2009080102'),
(415, 'portfolio_boxnet', 'version', '2010090501'),
(416, 'portfolio_download', 'version', '2010090501'),
(417, 'portfolio_flickr', 'version', '2010090501'),
(418, 'portfolio_googledocs', 'version', '2010090501'),
(419, 'portfolio_mahara', 'version', '2010090501'),
(420, 'portfolio_picasa', 'version', '2010090501'),
(421, 'theme_formal_white', 'version', '2011061301'),
(423, 'assignment_online', 'version', '2010090501'),
(424, 'quiz_grading', 'version', '2011051200'),
(425, 'quiz_overview', 'version', '2011051200'),
(426, 'quiz_responses', 'version', '2011051200'),
(427, 'quiz_statistics', 'version', '2011062600'),
(429, 'workshopform_accumulative', 'version', '2010091700'),
(431, 'workshopform_comments', 'version', '2010091700'),
(433, 'workshopform_numerrors', 'version', '2010091700'),
(435, 'workshopform_rubric', 'version', '2010091700'),
(437, 'workshopeval_best', 'version', '2010090501'),
(438, 'local_qeupgradehelper', 'version', '2011040400'),
(439, 'folder', 'requiremodintro', '1'),
(440, 'imscp', 'requiremodintro', '1'),
(441, 'imscp', 'keepold', '1'),
(442, 'imscp', 'keepold_adv', '0'),
(443, 'page', 'requiremodintro', '1'),
(444, 'page', 'displayoptions', '5'),
(445, 'page', 'printheading', '1'),
(446, 'page', 'printheading_adv', '0'),
(447, 'page', 'printintro', '0'),
(448, 'page', 'printintro_adv', '0'),
(449, 'page', 'display', '5'),
(450, 'page', 'display_adv', '1'),
(451, 'page', 'popupwidth', '620'),
(452, 'page', 'popupwidth_adv', '1'),
(453, 'page', 'popupheight', '450'),
(454, 'page', 'popupheight_adv', '1'),
(455, 'quiz', 'timelimit', '0'),
(456, 'quiz', 'timelimit_adv', '0'),
(457, 'quiz', 'attempts', '0'),
(458, 'quiz', 'attempts_adv', '0'),
(459, 'quiz', 'grademethod', '1'),
(460, 'quiz', 'grademethod_adv', '0'),
(461, 'quiz', 'maximumgrade', '10'),
(462, 'quiz', 'shufflequestions', '0'),
(463, 'quiz', 'shufflequestions_adv', '0'),
(464, 'quiz', 'questionsperpage', '1'),
(465, 'quiz', 'questionsperpage_adv', '0'),
(466, 'quiz', 'shuffleanswers', '1'),
(467, 'quiz', 'shuffleanswers_adv', '0'),
(468, 'quiz', 'preferredbehaviour', 'deferredfeedback'),
(469, 'quiz', 'attemptonlast', '0'),
(470, 'quiz', 'attemptonlast_adv', '1'),
(471, 'quiz', 'reviewattempt', '69904'),
(472, 'quiz', 'reviewcorrectness', '69904'),
(473, 'quiz', 'reviewmarks', '69904'),
(474, 'quiz', 'reviewspecificfeedback', '69904'),
(475, 'quiz', 'reviewgeneralfeedback', '69904'),
(476, 'quiz', 'reviewrightanswer', '69904'),
(477, 'quiz', 'reviewoverallfeedback', '4368'),
(478, 'quiz', 'showuserpicture', '0'),
(479, 'quiz', 'showuserpicture_adv', '0'),
(480, 'quiz', 'decimalpoints', '2'),
(481, 'quiz', 'decimalpoints_adv', '0'),
(482, 'quiz', 'questiondecimalpoints', '-1'),
(483, 'quiz', 'questiondecimalpoints_adv', '0'),
(484, 'quiz', 'showblocks', '0'),
(485, 'quiz', 'showblocks_adv', '1'),
(486, 'quiz', 'password', ''),
(487, 'quiz', 'password_adv', '0'),
(488, 'quiz', 'subnet', ''),
(489, 'quiz', 'subnet_adv', '0'),
(490, 'quiz', 'delay1', '0'),
(491, 'quiz', 'delay1_adv', '0'),
(492, 'quiz', 'delay2', '0'),
(493, 'quiz', 'delay2_adv', '0'),
(494, 'quiz', 'popup', '0'),
(495, 'quiz', 'popup_adv', '1'),
(496, 'resource', 'framesize', '130'),
(497, 'resource', 'requiremodintro', '1'),
(498, 'resource', 'displayoptions', '0,1,4,5,6'),
(499, 'resource', 'printheading', '0'),
(500, 'resource', 'printheading_adv', '0'),
(501, 'resource', 'printintro', '1'),
(502, 'resource', 'printintro_adv', '0'),
(503, 'resource', 'display', '0'),
(504, 'resource', 'display_adv', '0'),
(505, 'resource', 'popupwidth', '620'),
(506, 'resource', 'popupwidth_adv', '1'),
(507, 'resource', 'popupheight', '450'),
(508, 'resource', 'popupheight_adv', '1'),
(509, 'resource', 'filterfiles', '0'),
(510, 'resource', 'filterfiles_adv', '1'),
(511, 'scorm', 'grademethod', '1'),
(512, 'scorm', 'maxgrade', '100'),
(513, 'scorm', 'maxattempts', '0'),
(514, 'scorm', 'displayattemptstatus', '0'),
(515, 'scorm', 'displaycoursestructure', '0'),
(516, 'scorm', 'forcecompleted', '0'),
(517, 'scorm', 'forcenewattempt', '0'),
(518, 'scorm', 'lastattemptlock', '0'),
(519, 'scorm', 'whatgrade', '0'),
(520, 'scorm', 'framewidth', '100'),
(521, 'scorm', 'frameheight', '500'),
(522, 'scorm', 'popup', '0'),
(523, 'scorm', 'resizable', '0'),
(524, 'scorm', 'scrollbars', '0'),
(525, 'scorm', 'directories', '0'),
(526, 'scorm', 'location', '0'),
(527, 'scorm', 'menubar', '0'),
(528, 'scorm', 'toolbar', '0'),
(529, 'scorm', 'status', '0'),
(530, 'scorm', 'skipview', '0'),
(531, 'scorm', 'hidebrowse', '0'),
(532, 'scorm', 'hidetoc', '0'),
(533, 'scorm', 'hidenav', '0'),
(534, 'scorm', 'auto', '0'),
(535, 'scorm', 'updatefreq', '0'),
(536, 'scorm', 'allowtypeexternal', '0'),
(537, 'scorm', 'allowtypelocalsync', '0'),
(538, 'scorm', 'allowtypeimsrepository', '0'),
(539, 'scorm', 'forcejavascript', '1'),
(540, 'scorm', 'allowapidebug', '0'),
(541, 'scorm', 'apidebugmask', '.*'),
(542, 'url', 'framesize', '130'),
(543, 'url', 'requiremodintro', '1'),
(544, 'url', 'secretphrase', ''),
(545, 'url', 'rolesinparams', '0'),
(546, 'url', 'displayoptions', '0,1,5,6'),
(547, 'url', 'printheading', '0'),
(548, 'url', 'printheading_adv', '0'),
(549, 'url', 'printintro', '1'),
(550, 'url', 'printintro_adv', '0'),
(551, 'url', 'display', '0'),
(552, 'url', 'display_adv', '0'),
(553, 'url', 'popupwidth', '620'),
(554, 'url', 'popupwidth_adv', '1'),
(555, 'url', 'popupheight', '450'),
(556, 'url', 'popupheight_adv', '1'),
(557, 'workshop', 'grade', '80'),
(558, 'workshop', 'gradinggrade', '20'),
(559, 'workshop', 'gradedecimals', '0'),
(560, 'workshop', 'maxbytes', '0'),
(561, 'workshop', 'strategy', 'accumulative'),
(562, 'workshop', 'examplesmode', '0'),
(563, 'workshopallocation_random', 'numofreviews', '5'),
(564, 'workshopform_numerrors', 'grade0', 'No'),
(565, 'workshopform_numerrors', 'grade1', 'Sí'),
(566, 'workshopeval_best', 'comparison', '5'),
(567, 'blocks/section_links', 'numsections1', '22'),
(568, 'blocks/section_links', 'incby1', '2'),
(569, 'blocks/section_links', 'numsections2', '40'),
(570, 'blocks/section_links', 'incby2', '5'),
(571, 'enrol_cohort', 'roleid', '5'),
(572, 'enrol_database', 'defaultrole', '5'),
(573, 'enrol_database', 'defaultcategory', '1'),
(574, 'enrol_flatfile', 'map_1', 'manager'),
(575, 'enrol_flatfile', 'map_2', 'coursecreator'),
(576, 'enrol_flatfile', 'map_3', 'editingteacher'),
(577, 'enrol_flatfile', 'map_4', 'teacher'),
(578, 'enrol_flatfile', 'map_5', 'student'),
(579, 'enrol_flatfile', 'map_6', 'guest'),
(580, 'enrol_flatfile', 'map_7', 'user'),
(581, 'enrol_flatfile', 'map_8', 'frontpage'),
(582, 'enrol_imsenterprise', 'imsrolemap01', '5'),
(583, 'enrol_imsenterprise', 'imsrolemap02', '3'),
(584, 'enrol_imsenterprise', 'imsrolemap03', '3'),
(585, 'enrol_imsenterprise', 'imsrolemap04', '5'),
(586, 'enrol_imsenterprise', 'imsrolemap05', '0'),
(587, 'enrol_imsenterprise', 'imsrolemap06', '4'),
(588, 'enrol_imsenterprise', 'imsrolemap07', '0'),
(589, 'enrol_imsenterprise', 'imsrolemap08', '4'),
(590, 'enrol_ldap', 'category', '1'),
(591, 'enrol_manual', 'roleid', '3'),
(592, 'enrol_meta', 'nosyncroleids', ''),
(593, 'enrol_mnet', 'roleid', '5'),
(594, 'enrol_mnet', 'roleid_adv', '1'),
(595, 'enrol_paypal', 'roleid', '5'),
(596, 'enrol_self', 'roleid', '5');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_context`
--

CREATE TABLE IF NOT EXISTS `mdl_context` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `contextlevel` bigint(10) unsigned NOT NULL DEFAULT '0',
  `instanceid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `depth` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_cont_conins_uix` (`contextlevel`,`instanceid`),
  KEY `mdl_cont_ins_ix` (`instanceid`),
  KEY `mdl_cont_pat_ix` (`path`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='one of these must be set' AUTO_INCREMENT=53 ;

--
-- Volcado de datos para la tabla `mdl_context`
--

INSERT INTO `mdl_context` (`id`, `contextlevel`, `instanceid`, `path`, `depth`) VALUES
(1, 10, 0, '/1', 1),
(2, 50, 1, '/1/2', 2),
(4, 80, 1, '/1/2/4', 3),
(5, 80, 2, '/1/2/5', 3),
(7, 80, 4, '/1/7', 2),
(8, 80, 5, '/1/8', 2),
(9, 80, 6, '/1/9', 2),
(10, 80, 7, '/1/10', 2),
(11, 80, 8, '/1/11', 2),
(12, 80, 9, '/1/12', 2),
(13, 30, 2, '/1/13', 2),
(15, 80, 10, '/1/2/15', 3),
(17, 70, 1, '/1/2/17', 3),
(22, 40, 6, '/1/22', 2),
(23, 40, 7, '/1/23', 2),
(24, 50, 2, '/1/23/24', 3),
(25, 80, 11, '/1/23/24/25', 4),
(26, 80, 12, '/1/23/24/26', 4),
(28, 80, 14, '/1/23/24/28', 4),
(29, 70, 2, '/1/23/24/29', 4),
(31, 30, 11, '/1/31', 2),
(32, 30, 12, '/1/32', 2),
(33, 80, 15, '/1/2/33', 3),
(34, 80, 16, '/1/2/34', 3),
(35, 80, 17, '/1/2/35', 3),
(36, 80, 18, '/1/2/36', 3),
(37, 80, 19, '/1/2/37', 3),
(38, 30, 14, '/1/38', 2),
(39, 30, 13, '/1/39', 2),
(40, 50, 3, '/1/22/40', 3),
(41, 80, 20, '/1/22/40/41', 4),
(42, 80, 21, '/1/22/40/42', 4),
(43, 80, 22, '/1/22/40/43', 4),
(44, 80, 23, '/1/22/40/44', 4),
(45, 70, 3, '/1/22/40/45', 4),
(46, 50, 4, '/1/23/46', 3),
(48, 80, 25, '/1/23/46/48', 4),
(49, 80, 26, '/1/23/46/49', 4),
(50, 80, 27, '/1/23/46/50', 4),
(51, 70, 4, '/1/23/46/51', 4),
(52, 70, 5, '/1/2/52', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_context_temp`
--

CREATE TABLE IF NOT EXISTS `mdl_context_temp` (
  `id` bigint(10) unsigned NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `depth` tinyint(2) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Used by build_context_path() in upgrade and cron to keep con';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_course`
--

CREATE TABLE IF NOT EXISTS `mdl_course` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `category` bigint(10) unsigned NOT NULL DEFAULT '0',
  `sortorder` bigint(10) unsigned NOT NULL DEFAULT '0',
  `fullname` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shortname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `idnumber` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `summary` text COLLATE utf8_unicode_ci,
  `summaryformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `format` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'topics',
  `showgrades` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `modinfo` longtext COLLATE utf8_unicode_ci,
  `newsitems` mediumint(5) unsigned NOT NULL DEFAULT '1',
  `startdate` bigint(10) unsigned NOT NULL DEFAULT '0',
  `numsections` mediumint(5) unsigned NOT NULL DEFAULT '1',
  `marker` bigint(10) unsigned NOT NULL DEFAULT '0',
  `maxbytes` bigint(10) unsigned NOT NULL DEFAULT '0',
  `legacyfiles` smallint(4) unsigned NOT NULL DEFAULT '0',
  `showreports` smallint(4) unsigned NOT NULL DEFAULT '0',
  `visible` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `visibleold` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `hiddensections` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `groupmode` smallint(4) unsigned NOT NULL DEFAULT '0',
  `groupmodeforce` smallint(4) unsigned NOT NULL DEFAULT '0',
  `defaultgroupingid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `lang` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `theme` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `requested` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `restrictmodules` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `enablecompletion` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `completionstartonenrol` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `completionnotify` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_cour_cat_ix` (`category`),
  KEY `mdl_cour_idn_ix` (`idnumber`),
  KEY `mdl_cour_sho_ix` (`shortname`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Central course table' AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `mdl_course`
--

INSERT INTO `mdl_course` (`id`, `category`, `sortorder`, `fullname`, `shortname`, `idnumber`, `summary`, `summaryformat`, `format`, `showgrades`, `modinfo`, `newsitems`, `startdate`, `numsections`, `marker`, `maxbytes`, `legacyfiles`, `showreports`, `visible`, `visibleold`, `hiddensections`, `groupmode`, `groupmodeforce`, `defaultgroupingid`, `lang`, `theme`, `timecreated`, `timemodified`, `requested`, `restrictmodules`, `enablecompletion`, `completionstartonenrol`, `completionnotify`) VALUES
(1, 0, 1, 'Red Social FIUBA', 'Red Social FIUBA', '', '<p>Red social de la Facultad de Ingeniería<br /><br /></p>', 0, 'site', 1, 'a:2:{i:1;O:8:"stdClass":10:{s:2:"id";s:1:"1";s:2:"cm";s:1:"1";s:3:"mod";s:5:"forum";s:7:"section";s:1:"0";s:9:"sectionid";s:1:"1";s:6:"module";s:1:"7";s:5:"added";s:10:"1316715825";s:7:"visible";s:1:"1";s:10:"visibleold";s:1:"1";s:4:"name";s:9:"Cartelera";}i:5;O:8:"stdClass":10:{s:2:"id";s:1:"5";s:2:"cm";s:1:"5";s:3:"mod";s:5:"forum";s:7:"section";s:1:"0";s:9:"sectionid";s:1:"1";s:6:"module";s:1:"7";s:5:"added";s:10:"1317936873";s:7:"visible";s:1:"1";s:10:"visibleold";s:1:"1";s:4:"name";s:22:"Foro General de la Red";}}', 3, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, '', '', 1316566411, 1316715819, 0, 0, 0, 0, 0),
(2, 7, 10001, 'Azcurra', 'Azcurra', '1', '', 1, 'weeks', 1, 'a:1:{i:2;O:8:"stdClass":10:{s:2:"id";s:1:"2";s:2:"cm";s:1:"2";s:3:"mod";s:5:"forum";s:7:"section";s:1:"0";s:9:"sectionid";s:1:"2";s:6:"module";s:1:"7";s:5:"added";s:10:"1316810832";s:7:"visible";s:1:"1";s:10:"visibleold";s:1:"1";s:4:"name";s:9:"Novedades";}}', 5, 1316815200, 10, 0, 2097152, 0, 0, 1, 1, 0, 0, 0, 0, '', '', 1316810792, 1316813550, 0, 0, 0, 0, 0),
(3, 6, 20001, 'Carolo', 'Carolo', '45', '', 1, 'topics', 1, 'a:1:{i:3;O:8:"stdClass":10:{s:2:"id";s:1:"3";s:2:"cm";s:1:"3";s:3:"mod";s:5:"forum";s:7:"section";s:1:"0";s:9:"sectionid";s:2:"13";s:6:"module";s:1:"7";s:5:"added";s:10:"1317391095";s:7:"visible";s:1:"1";s:10:"visibleold";s:1:"1";s:4:"name";s:9:"Novedades";}}', 5, 1317420000, 10, 0, 2097152, 0, 0, 1, 1, 0, 0, 0, 0, '', '', 1317391019, 1317391019, 0, 0, 0, 0, 0),
(4, 7, 10002, 'Vega', 'Vega', '2', '', 1, 'topics', 1, 'a:1:{i:4;O:8:"stdClass":10:{s:2:"id";s:1:"4";s:2:"cm";s:1:"4";s:3:"mod";s:5:"forum";s:7:"section";s:1:"0";s:9:"sectionid";s:2:"24";s:6:"module";s:1:"7";s:5:"added";s:10:"1317396438";s:7:"visible";s:1:"1";s:10:"visibleold";s:1:"1";s:4:"name";s:9:"Novedades";}}', 1, 1317420000, 16, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, '', '', 1317396102, 1317396102, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_course_allowed_modules`
--

CREATE TABLE IF NOT EXISTS `mdl_course_allowed_modules` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `module` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_courallomodu_cou_ix` (`course`),
  KEY `mdl_courallomodu_mod_ix` (`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='allowed modules foreach course' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_course_categories`
--

CREATE TABLE IF NOT EXISTS `mdl_course_categories` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `parent` bigint(10) unsigned NOT NULL DEFAULT '0',
  `sortorder` bigint(10) unsigned NOT NULL DEFAULT '0',
  `coursecount` bigint(10) unsigned NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `visibleold` tinyint(1) NOT NULL DEFAULT '1',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `depth` bigint(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `theme` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_courcate_par_ix` (`parent`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Course categories' AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `mdl_course_categories`
--

INSERT INTO `mdl_course_categories` (`id`, `name`, `description`, `descriptionformat`, `parent`, `sortorder`, `coursecount`, `visible`, `visibleold`, `timemodified`, `depth`, `path`, `theme`) VALUES
(6, 'Algoritmos y Programacion II', '<p>Algoritmos y Programacion II</p>', 1, 0, 20000, 1, 1, 1, 0, 1, '/6', NULL),
(7, 'Taller de programación', '', 1, 0, 10000, 2, 1, 1, 0, 1, '/7', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_course_completions`
--

CREATE TABLE IF NOT EXISTS `mdl_course_completions` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(1) unsigned DEFAULT NULL,
  `timenotified` bigint(10) unsigned DEFAULT NULL,
  `timeenrolled` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timestarted` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timecompleted` bigint(10) unsigned DEFAULT NULL,
  `reaggregate` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_courcomp_use_ix` (`userid`),
  KEY `mdl_courcomp_cou_ix` (`course`),
  KEY `mdl_courcomp_tim_ix` (`timecompleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Course completion records' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_course_completion_aggr_methd`
--

CREATE TABLE IF NOT EXISTS `mdl_course_completion_aggr_methd` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `criteriatype` bigint(20) unsigned DEFAULT NULL,
  `method` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `value` decimal(10,5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_courcompaggrmeth_cou_ix` (`course`),
  KEY `mdl_courcompaggrmeth_cri_ix` (`criteriatype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Course completion aggregation methods for criteria' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_course_completion_criteria`
--

CREATE TABLE IF NOT EXISTS `mdl_course_completion_criteria` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `criteriatype` bigint(20) unsigned NOT NULL DEFAULT '0',
  `module` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `moduleinstance` bigint(10) unsigned DEFAULT NULL,
  `courseinstance` bigint(10) unsigned DEFAULT NULL,
  `enrolperiod` bigint(10) unsigned DEFAULT NULL,
  `timeend` bigint(10) unsigned DEFAULT NULL,
  `gradepass` decimal(10,5) DEFAULT NULL,
  `role` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_courcompcrit_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Course completion criteria' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_course_completion_crit_compl`
--

CREATE TABLE IF NOT EXISTS `mdl_course_completion_crit_compl` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `criteriaid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `gradefinal` decimal(10,5) DEFAULT NULL,
  `unenroled` bigint(10) unsigned DEFAULT NULL,
  `deleted` tinyint(1) unsigned DEFAULT NULL,
  `timecompleted` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_courcompcritcomp_use_ix` (`userid`),
  KEY `mdl_courcompcritcomp_cou_ix` (`course`),
  KEY `mdl_courcompcritcomp_cri_ix` (`criteriaid`),
  KEY `mdl_courcompcritcomp_tim_ix` (`timecompleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Course completion user records' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_course_completion_notify`
--

CREATE TABLE IF NOT EXISTS `mdl_course_completion_notify` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `role` bigint(10) unsigned NOT NULL DEFAULT '0',
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `timesent` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_courcompnoti_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Course completion notification emails' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_course_display`
--

CREATE TABLE IF NOT EXISTS `mdl_course_display` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `display` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_courdisp_couuse_ix` (`course`,`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores info about how to display the course' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_course_modules`
--

CREATE TABLE IF NOT EXISTS `mdl_course_modules` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `module` bigint(10) unsigned NOT NULL DEFAULT '0',
  `instance` bigint(10) unsigned NOT NULL DEFAULT '0',
  `section` bigint(10) unsigned NOT NULL DEFAULT '0',
  `idnumber` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `added` bigint(10) unsigned NOT NULL DEFAULT '0',
  `score` smallint(4) NOT NULL DEFAULT '0',
  `indent` mediumint(5) unsigned NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `visibleold` tinyint(1) NOT NULL DEFAULT '1',
  `groupmode` smallint(4) NOT NULL DEFAULT '0',
  `groupingid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `groupmembersonly` smallint(4) unsigned NOT NULL DEFAULT '0',
  `completion` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `completiongradeitemnumber` bigint(10) unsigned DEFAULT NULL,
  `completionview` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `completionexpected` bigint(10) unsigned NOT NULL DEFAULT '0',
  `availablefrom` bigint(10) unsigned NOT NULL DEFAULT '0',
  `availableuntil` bigint(10) unsigned NOT NULL DEFAULT '0',
  `showavailability` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_courmodu_vis_ix` (`visible`),
  KEY `mdl_courmodu_cou_ix` (`course`),
  KEY `mdl_courmodu_mod_ix` (`module`),
  KEY `mdl_courmodu_ins_ix` (`instance`),
  KEY `mdl_courmodu_idncou_ix` (`idnumber`,`course`),
  KEY `mdl_courmodu_gro_ix` (`groupingid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='course_modules table retrofitted from MySQL' AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `mdl_course_modules`
--

INSERT INTO `mdl_course_modules` (`id`, `course`, `module`, `instance`, `section`, `idnumber`, `added`, `score`, `indent`, `visible`, `visibleold`, `groupmode`, `groupingid`, `groupmembersonly`, `completion`, `completiongradeitemnumber`, `completionview`, `completionexpected`, `availablefrom`, `availableuntil`, `showavailability`) VALUES
(1, 1, 7, 1, 1, '', 1316715825, 0, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0),
(2, 2, 7, 2, 2, NULL, 1316810832, 0, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0),
(3, 3, 7, 3, 13, NULL, 1317391095, 0, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0),
(4, 4, 7, 4, 24, '', 1317396438, 0, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0),
(5, 1, 7, 5, 1, '', 1317936873, 0, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_course_modules_availability`
--

CREATE TABLE IF NOT EXISTS `mdl_course_modules_availability` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `coursemoduleid` bigint(10) unsigned NOT NULL,
  `sourcecmid` bigint(10) unsigned DEFAULT NULL,
  `requiredcompletion` tinyint(1) unsigned DEFAULT NULL,
  `gradeitemid` bigint(10) unsigned DEFAULT NULL,
  `grademin` decimal(10,5) DEFAULT NULL,
  `grademax` decimal(10,5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_courmoduavai_cou_ix` (`coursemoduleid`),
  KEY `mdl_courmoduavai_sou_ix` (`sourcecmid`),
  KEY `mdl_courmoduavai_gra_ix` (`gradeitemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Table stores conditions that affect whether a module/activit' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_course_modules_completion`
--

CREATE TABLE IF NOT EXISTS `mdl_course_modules_completion` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `coursemoduleid` bigint(10) unsigned NOT NULL,
  `userid` bigint(10) unsigned NOT NULL,
  `completionstate` tinyint(1) unsigned NOT NULL,
  `viewed` tinyint(1) unsigned DEFAULT NULL,
  `timemodified` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courmoducomp_usecou_uix` (`userid`,`coursemoduleid`),
  KEY `mdl_courmoducomp_cou_ix` (`coursemoduleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the completion state (completed or not completed, etc' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_course_published`
--

CREATE TABLE IF NOT EXISTS `mdl_course_published` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `huburl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `courseid` bigint(10) unsigned NOT NULL,
  `timepublished` bigint(10) unsigned NOT NULL,
  `enrollable` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `hubcourseid` bigint(10) unsigned NOT NULL,
  `status` tinyint(1) unsigned DEFAULT '0',
  `timechecked` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Information about how and when an local courses were publish' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_course_request`
--

CREATE TABLE IF NOT EXISTS `mdl_course_request` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `fullname` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shortname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `summary` text COLLATE utf8_unicode_ci NOT NULL,
  `summaryformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `reason` text COLLATE utf8_unicode_ci NOT NULL,
  `requester` bigint(10) unsigned NOT NULL DEFAULT '0',
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_courrequ_sho_ix` (`shortname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='course requests' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_course_sections`
--

CREATE TABLE IF NOT EXISTS `mdl_course_sections` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `section` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `summary` text COLLATE utf8_unicode_ci,
  `summaryformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `sequence` text COLLATE utf8_unicode_ci,
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_coursect_cousec_ix` (`course`,`section`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='to define the sections for each course' AUTO_INCREMENT=41 ;

--
-- Volcado de datos para la tabla `mdl_course_sections`
--

INSERT INTO `mdl_course_sections` (`id`, `course`, `section`, `name`, `summary`, `summaryformat`, `sequence`, `visible`) VALUES
(1, 1, 0, NULL, '', 1, '1,5', 1),
(2, 2, 0, NULL, NULL, 1, '2', 1),
(3, 2, 1, NULL, '', 1, NULL, 1),
(4, 2, 2, NULL, '', 1, NULL, 1),
(5, 2, 3, NULL, '', 1, NULL, 1),
(6, 2, 4, NULL, '', 1, NULL, 1),
(7, 2, 5, NULL, '', 1, NULL, 1),
(8, 2, 6, NULL, '', 1, NULL, 1),
(9, 2, 7, NULL, '', 1, NULL, 1),
(10, 2, 8, NULL, '', 1, NULL, 1),
(11, 2, 9, NULL, '', 1, NULL, 1),
(12, 2, 10, NULL, '', 1, NULL, 1),
(13, 3, 0, NULL, NULL, 1, '3', 1),
(14, 3, 1, NULL, '', 1, NULL, 1),
(15, 3, 2, NULL, '', 1, NULL, 1),
(16, 3, 3, NULL, '', 1, NULL, 1),
(17, 3, 4, NULL, '', 1, NULL, 1),
(18, 3, 5, NULL, '', 1, NULL, 1),
(19, 3, 6, NULL, '', 1, NULL, 1),
(20, 3, 7, NULL, '', 1, NULL, 1),
(21, 3, 8, NULL, '', 1, NULL, 1),
(22, 3, 9, NULL, '', 1, NULL, 1),
(23, 3, 10, NULL, '', 1, NULL, 1),
(24, 4, 0, NULL, NULL, 1, '4', 1),
(25, 4, 1, NULL, '', 1, NULL, 1),
(26, 4, 2, NULL, '', 1, NULL, 1),
(27, 4, 3, NULL, '', 1, NULL, 1),
(28, 4, 4, NULL, '', 1, NULL, 1),
(29, 4, 5, NULL, '', 1, NULL, 1),
(30, 4, 6, NULL, '', 1, NULL, 1),
(31, 4, 7, NULL, '', 1, NULL, 1),
(32, 4, 8, NULL, '', 1, NULL, 1),
(33, 4, 9, NULL, '', 1, NULL, 1),
(34, 4, 10, NULL, '', 1, NULL, 1),
(35, 4, 11, NULL, '', 1, NULL, 1),
(36, 4, 12, NULL, '', 1, NULL, 1),
(37, 4, 13, NULL, '', 1, NULL, 1),
(38, 4, 14, NULL, '', 1, NULL, 1),
(39, 4, 15, NULL, '', 1, NULL, 1),
(40, 4, 16, NULL, '', 1, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_data`
--

CREATE TABLE IF NOT EXISTS `mdl_data` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` text COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  `comments` smallint(4) unsigned NOT NULL DEFAULT '0',
  `timeavailablefrom` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeavailableto` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeviewfrom` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeviewto` bigint(10) unsigned NOT NULL DEFAULT '0',
  `requiredentries` int(8) unsigned NOT NULL DEFAULT '0',
  `requiredentriestoview` int(8) unsigned NOT NULL DEFAULT '0',
  `maxentries` int(8) unsigned NOT NULL DEFAULT '0',
  `rssarticles` smallint(4) unsigned NOT NULL DEFAULT '0',
  `singletemplate` text COLLATE utf8_unicode_ci,
  `listtemplate` text COLLATE utf8_unicode_ci,
  `listtemplateheader` text COLLATE utf8_unicode_ci,
  `listtemplatefooter` text COLLATE utf8_unicode_ci,
  `addtemplate` text COLLATE utf8_unicode_ci,
  `rsstemplate` text COLLATE utf8_unicode_ci,
  `rsstitletemplate` text COLLATE utf8_unicode_ci,
  `csstemplate` text COLLATE utf8_unicode_ci,
  `jstemplate` text COLLATE utf8_unicode_ci,
  `asearchtemplate` text COLLATE utf8_unicode_ci,
  `approval` smallint(4) unsigned NOT NULL DEFAULT '0',
  `scale` bigint(10) NOT NULL DEFAULT '0',
  `assessed` bigint(10) unsigned NOT NULL DEFAULT '0',
  `assesstimestart` bigint(10) unsigned NOT NULL DEFAULT '0',
  `assesstimefinish` bigint(10) unsigned NOT NULL DEFAULT '0',
  `defaultsort` bigint(10) unsigned NOT NULL DEFAULT '0',
  `defaultsortdir` smallint(4) unsigned NOT NULL DEFAULT '0',
  `editany` smallint(4) unsigned NOT NULL DEFAULT '0',
  `notification` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_data_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='all database activities' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_data_content`
--

CREATE TABLE IF NOT EXISTS `mdl_data_content` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `fieldid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `recordid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `content` longtext COLLATE utf8_unicode_ci,
  `content1` longtext COLLATE utf8_unicode_ci,
  `content2` longtext COLLATE utf8_unicode_ci,
  `content3` longtext COLLATE utf8_unicode_ci,
  `content4` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_datacont_rec_ix` (`recordid`),
  KEY `mdl_datacont_fie_ix` (`fieldid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='the content introduced in each record/fields' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_data_fields`
--

CREATE TABLE IF NOT EXISTS `mdl_data_fields` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `dataid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `param1` text COLLATE utf8_unicode_ci,
  `param2` text COLLATE utf8_unicode_ci,
  `param3` text COLLATE utf8_unicode_ci,
  `param4` text COLLATE utf8_unicode_ci,
  `param5` text COLLATE utf8_unicode_ci,
  `param6` text COLLATE utf8_unicode_ci,
  `param7` text COLLATE utf8_unicode_ci,
  `param8` text COLLATE utf8_unicode_ci,
  `param9` text COLLATE utf8_unicode_ci,
  `param10` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_datafiel_typdat_ix` (`type`,`dataid`),
  KEY `mdl_datafiel_dat_ix` (`dataid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='every field available' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_data_records`
--

CREATE TABLE IF NOT EXISTS `mdl_data_records` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `groupid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `dataid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `approved` smallint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_datareco_dat_ix` (`dataid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='every record introduced' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_enrol`
--

CREATE TABLE IF NOT EXISTS `mdl_enrol` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `enrol` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `status` bigint(10) unsigned NOT NULL DEFAULT '0',
  `courseid` bigint(10) unsigned NOT NULL,
  `sortorder` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enrolperiod` bigint(10) unsigned DEFAULT '0',
  `enrolstartdate` bigint(10) unsigned DEFAULT '0',
  `enrolenddate` bigint(10) unsigned DEFAULT '0',
  `expirynotify` tinyint(1) unsigned DEFAULT '0',
  `expirythreshold` bigint(10) unsigned DEFAULT '0',
  `notifyall` tinyint(1) unsigned DEFAULT '0',
  `password` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cost` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `roleid` bigint(10) unsigned DEFAULT '0',
  `customint1` bigint(10) DEFAULT NULL,
  `customint2` bigint(10) DEFAULT NULL,
  `customint3` bigint(10) DEFAULT NULL,
  `customint4` bigint(10) DEFAULT NULL,
  `customchar1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customchar2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customdec1` decimal(12,7) DEFAULT NULL,
  `customdec2` decimal(12,7) DEFAULT NULL,
  `customtext1` longtext COLLATE utf8_unicode_ci,
  `customtext2` longtext COLLATE utf8_unicode_ci,
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_enro_enr_ix` (`enrol`),
  KEY `mdl_enro_cou_ix` (`courseid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Instances of enrolment plugins used in courses, fields marke' AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `mdl_enrol`
--

INSERT INTO `mdl_enrol` (`id`, `enrol`, `status`, `courseid`, `sortorder`, `name`, `enrolperiod`, `enrolstartdate`, `enrolenddate`, `expirynotify`, `expirythreshold`, `notifyall`, `password`, `cost`, `currency`, `roleid`, `customint1`, `customint2`, `customint3`, `customint4`, `customchar1`, `customchar2`, `customdec1`, `customdec2`, `customtext1`, `customtext2`, `timecreated`, `timemodified`) VALUES
(1, 'manual', 0, 2, 0, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1316810794, 1317846078),
(2, 'guest', 1, 2, 1, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1316810794, 1316813550),
(3, 'self', 0, 2, 2, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 5, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1316810794, 1316810794),
(4, 'manual', 0, 3, 0, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1317391019, 1317391019),
(5, 'guest', 1, 3, 1, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1317391019, 1317391019),
(6, 'self', 1, 3, 2, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 5, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1317391019, 1317391019),
(7, 'manual', 0, 4, 0, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1317396103, 1317396103),
(8, 'self', 1, 4, 1, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 5, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1317396103, 1317396103);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_enrol_authorize`
--

CREATE TABLE IF NOT EXISTS `mdl_enrol_authorize` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `paymentmethod` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'cc',
  `refundinfo` smallint(4) unsigned NOT NULL DEFAULT '0',
  `ccname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `courseid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `instanceid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `transid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `status` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `settletime` bigint(10) unsigned NOT NULL DEFAULT '0',
  `amount` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `currency` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'USD',
  PRIMARY KEY (`id`),
  KEY `mdl_enroauth_cou_ix` (`courseid`),
  KEY `mdl_enroauth_use_ix` (`userid`),
  KEY `mdl_enroauth_sta_ix` (`status`),
  KEY `mdl_enroauth_tra_ix` (`transid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Holds all known information about authorize.net transactions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_enrol_authorize_refunds`
--

CREATE TABLE IF NOT EXISTS `mdl_enrol_authorize_refunds` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `orderid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `amount` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `transid` bigint(20) unsigned DEFAULT '0',
  `settletime` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_enroauthrefu_tra_ix` (`transid`),
  KEY `mdl_enroauthrefu_ord_ix` (`orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Authorize.net refunds' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_enrol_flatfile`
--

CREATE TABLE IF NOT EXISTS `mdl_enrol_flatfile` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `roleid` bigint(10) unsigned NOT NULL,
  `userid` bigint(10) unsigned NOT NULL,
  `courseid` bigint(10) unsigned NOT NULL,
  `timestart` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeend` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_enroflat_cou_ix` (`courseid`),
  KEY `mdl_enroflat_use_ix` (`userid`),
  KEY `mdl_enroflat_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='enrol_flatfile table retrofitted from MySQL' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_enrol_paypal`
--

CREATE TABLE IF NOT EXISTS `mdl_enrol_paypal` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `business` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `receiver_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `receiver_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `item_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `courseid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `instanceid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `memo` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tax` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `option_name1` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `option_selection1_x` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `option_name2` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `option_selection2_x` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `payment_status` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pending_reason` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reason_code` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `txn_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `parent_txn_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `payment_type` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timeupdated` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Holds all known information about PayPal transactions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_event`
--

CREATE TABLE IF NOT EXISTS `mdl_event` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `format` smallint(4) unsigned NOT NULL DEFAULT '0',
  `courseid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `groupid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `repeatid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `modulename` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `instance` bigint(10) unsigned NOT NULL DEFAULT '0',
  `eventtype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timestart` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeduration` bigint(10) unsigned NOT NULL DEFAULT '0',
  `visible` smallint(4) NOT NULL DEFAULT '1',
  `uuid` varchar(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sequence` bigint(10) unsigned NOT NULL DEFAULT '1',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_even_cou_ix` (`courseid`),
  KEY `mdl_even_use_ix` (`userid`),
  KEY `mdl_even_tim_ix` (`timestart`),
  KEY `mdl_even_tim2_ix` (`timeduration`),
  KEY `mdl_even_grocouvisuse_ix` (`groupid`,`courseid`,`visible`,`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='For everything with a time associated to it' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_events_handlers`
--

CREATE TABLE IF NOT EXISTS `mdl_events_handlers` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `eventname` varchar(166) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `component` varchar(166) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `handlerfile` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `handlerfunction` mediumtext COLLATE utf8_unicode_ci,
  `schedule` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` bigint(10) unsigned NOT NULL DEFAULT '0',
  `internal` tinyint(2) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_evenhand_evecom_uix` (`eventname`,`component`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table is for storing which components requests what typ' AUTO_INCREMENT=18 ;

--
-- Volcado de datos para la tabla `mdl_events_handlers`
--

INSERT INTO `mdl_events_handlers` (`id`, `eventname`, `component`, `handlerfile`, `handlerfunction`, `schedule`, `status`, `internal`) VALUES
(1, 'portfolio_send', 'moodle', '/lib/portfolio.php', 's:22:"portfolio_handle_event";', 'cron', 0, 0),
(2, 'user_logout', 'mod_chat', '/mod/chat/lib.php', 's:16:"chat_user_logout";', 'instant', 0, 1),
(3, 'user_enrolled', 'mod_forum', '/mod/forum/lib.php', 's:19:"forum_user_enrolled";', 'instant', 0, 1),
(4, 'user_unenrolled', 'mod_forum', '/mod/forum/lib.php', 's:21:"forum_user_unenrolled";', 'instant', 0, 1),
(5, 'quiz_attempt_submitted', 'mod_quiz', '/mod/quiz/locallib.php', 's:30:"quiz_attempt_submitted_handler";', 'cron', 0, 1),
(6, 'role_assigned', 'enrol_category', '/enrol/category/locallib.php', 'a:2:{i:0;s:22:"enrol_category_handler";i:1;s:13:"role_assigned";}', 'instant', 0, 1),
(7, 'role_unassigned', 'enrol_category', '/enrol/category/locallib.php', 'a:2:{i:0;s:22:"enrol_category_handler";i:1;s:15:"role_unassigned";}', 'instant', 0, 1),
(8, 'cohort_member_added', 'enrol_cohort', '/enrol/cohort/locallib.php', 'a:2:{i:0;s:20:"enrol_cohort_handler";i:1;s:12:"member_added";}', 'instant', 0, 1),
(9, 'cohort_member_removed', 'enrol_cohort', '/enrol/cohort/locallib.php', 'a:2:{i:0;s:20:"enrol_cohort_handler";i:1;s:14:"member_removed";}', 'instant', 0, 1),
(10, 'cohort_deleted', 'enrol_cohort', '/enrol/cohort/locallib.php', 'a:2:{i:0;s:20:"enrol_cohort_handler";i:1;s:7:"deleted";}', 'instant', 0, 1),
(11, 'role_assigned', 'enrol_meta', '/enrol/meta/locallib.php', 'a:2:{i:0;s:18:"enrol_meta_handler";i:1;s:13:"role_assigned";}', 'instant', 0, 1),
(12, 'role_unassigned', 'enrol_meta', '/enrol/meta/locallib.php', 'a:2:{i:0;s:18:"enrol_meta_handler";i:1;s:15:"role_unassigned";}', 'instant', 0, 1),
(13, 'user_enrolled', 'enrol_meta', '/enrol/meta/locallib.php', 'a:2:{i:0;s:18:"enrol_meta_handler";i:1;s:13:"user_enrolled";}', 'instant', 0, 1),
(14, 'user_unenrolled', 'enrol_meta', '/enrol/meta/locallib.php', 'a:2:{i:0;s:18:"enrol_meta_handler";i:1;s:15:"user_unenrolled";}', 'instant', 0, 1),
(15, 'course_deleted', 'enrol_meta', '/enrol/meta/locallib.php', 'a:2:{i:0;s:18:"enrol_meta_handler";i:1;s:14:"course_deleted";}', 'instant', 0, 1),
(16, 'user_deleted', 'portfolio_googledocs', '/portfolio/googledocs/lib.php', 's:33:"portfolio_googledocs_user_deleted";', 'cron', 0, 0),
(17, 'user_deleted', 'portfolio_picasa', '/portfolio/picasa/lib.php', 's:29:"portfolio_picasa_user_deleted";', 'cron', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_events_queue`
--

CREATE TABLE IF NOT EXISTS `mdl_events_queue` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `eventdata` longtext COLLATE utf8_unicode_ci NOT NULL,
  `stackdump` mediumtext COLLATE utf8_unicode_ci,
  `userid` bigint(10) unsigned DEFAULT NULL,
  `timecreated` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_evenqueu_use_ix` (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table is for storing queued events. It stores only one ' AUTO_INCREMENT=17 ;

--
-- Volcado de datos para la tabla `mdl_events_queue`
--

INSERT INTO `mdl_events_queue` (`id`, `eventdata`, `stackdump`, `userid`, `timecreated`) VALUES
(1, 'Tzo4OiJzdGRDbGFzcyI6NTE6e3M6MjoiaWQiO3M6MToiOCI7czo0OiJhdXRoIjtzOjU6ImVtYWlsIjtzOjk6ImNvbmZpcm1lZCI7czoxOiIwIjtzOjEyOiJwb2xpY3lhZ3JlZWQiO3M6MToiMCI7czo3OiJkZWxldGVkIjtzOjE6IjAiO3M6OToic3VzcGVuZGVkIjtzOjE6IjAiO3M6MTA6Im1uZXRob3N0aWQiO3M6MToiMSI7czo4OiJ1c2VybmFtZSI7czo3OiJkYW1pYW42IjtzOjg6InBhc3N3b3JkIjtzOjMyOiI0NTM0ZTM5MGY4OTViNGZhOWM3Zjk5YjJiNmVmNDRiNSI7czo4OiJpZG51bWJlciI7czowOiIiO3M6OToiZmlyc3RuYW1lIjtzOjY6IkRhbWlhbiI7czo4OiJsYXN0bmFtZSI7czo5OiJDYWxhYnJlc2kiO3M6NToiZW1haWwiO3M6MjY6ImRhbWlhbmNhbGFicmVzaTdAZ21haWwuY29tIjtzOjk6ImVtYWlsc3RvcCI7czoxOiIwIjtzOjM6ImljcSI7czowOiIiO3M6NToic2t5cGUiO3M6MDoiIjtzOjU6InlhaG9vIjtzOjA6IiI7czozOiJhaW0iO3M6MDoiIjtzOjM6Im1zbiI7czowOiIiO3M6NjoicGhvbmUxIjtzOjA6IiI7czo2OiJwaG9uZTIiO3M6MDoiIjtzOjExOiJpbnN0aXR1dGlvbiI7czowOiIiO3M6MTA6ImRlcGFydG1lbnQiO3M6MDoiIjtzOjc6ImFkZHJlc3MiO3M6MDoiIjtzOjQ6ImNpdHkiO3M6MzoiQnVlIjtzOjc6ImNvdW50cnkiO3M6MjoiQVIiO3M6NDoibGFuZyI7czo1OiJlc19hciI7czo1OiJ0aGVtZSI7czowOiIiO3M6ODoidGltZXpvbmUiO3M6MjoiOTkiO3M6MTE6ImZpcnN0YWNjZXNzIjtzOjEwOiIxMzE2NzE0OTQ5IjtzOjEwOiJsYXN0YWNjZXNzIjtzOjE6IjAiO3M6OToibGFzdGxvZ2luIjtzOjE6IjAiO3M6MTI6ImN1cnJlbnRsb2dpbiI7czoxOiIwIjtzOjY6Imxhc3RpcCI7czowOiIiO3M6Njoic2VjcmV0IjtzOjE1OiJnUEhTM3dRM3JKU1FmUmciO3M6NzoicGljdHVyZSI7czoxOiIwIjtzOjM6InVybCI7czowOiIiO3M6MTE6ImRlc2NyaXB0aW9uIjtOO3M6MTc6ImRlc2NyaXB0aW9uZm9ybWF0IjtzOjE6IjAiO3M6MTA6Im1haWxmb3JtYXQiO3M6MToiMSI7czoxMDoibWFpbGRpZ2VzdCI7czoxOiIwIjtzOjExOiJtYWlsZGlzcGxheSI7czoxOiIyIjtzOjEwOiJodG1sZWRpdG9yIjtzOjE6IjEiO3M6NDoiYWpheCI7czoxOiIxIjtzOjEzOiJhdXRvc3Vic2NyaWJlIjtzOjE6IjEiO3M6MTE6InRyYWNrZm9ydW1zIjtzOjE6IjAiO3M6MTE6InRpbWVjcmVhdGVkIjtzOjEwOiIxMzE2NzE0OTQ5IjtzOjEyOiJ0aW1lbW9kaWZpZWQiO3M6MToiMCI7czoxMjoidHJ1c3RiaXRtYXNrIjtzOjE6IjAiO3M6ODoiaW1hZ2VhbHQiO047czoxMjoic2NyZWVucmVhZGVyIjtzOjE6IjAiO30=', '', 2, 1316715373),
(2, 'Tzo4OiJzdGRDbGFzcyI6NTE6e3M6MjoiaWQiO3M6MToiOCI7czo0OiJhdXRoIjtzOjU6ImVtYWlsIjtzOjk6ImNvbmZpcm1lZCI7czoxOiIwIjtzOjEyOiJwb2xpY3lhZ3JlZWQiO3M6MToiMCI7czo3OiJkZWxldGVkIjtzOjE6IjAiO3M6OToic3VzcGVuZGVkIjtzOjE6IjAiO3M6MTA6Im1uZXRob3N0aWQiO3M6MToiMSI7czo4OiJ1c2VybmFtZSI7czo3OiJkYW1pYW42IjtzOjg6InBhc3N3b3JkIjtzOjMyOiI0NTM0ZTM5MGY4OTViNGZhOWM3Zjk5YjJiNmVmNDRiNSI7czo4OiJpZG51bWJlciI7czowOiIiO3M6OToiZmlyc3RuYW1lIjtzOjY6IkRhbWlhbiI7czo4OiJsYXN0bmFtZSI7czo5OiJDYWxhYnJlc2kiO3M6NToiZW1haWwiO3M6MjY6ImRhbWlhbmNhbGFicmVzaTdAZ21haWwuY29tIjtzOjk6ImVtYWlsc3RvcCI7czoxOiIwIjtzOjM6ImljcSI7czowOiIiO3M6NToic2t5cGUiO3M6MDoiIjtzOjU6InlhaG9vIjtzOjA6IiI7czozOiJhaW0iO3M6MDoiIjtzOjM6Im1zbiI7czowOiIiO3M6NjoicGhvbmUxIjtzOjA6IiI7czo2OiJwaG9uZTIiO3M6MDoiIjtzOjExOiJpbnN0aXR1dGlvbiI7czowOiIiO3M6MTA6ImRlcGFydG1lbnQiO3M6MDoiIjtzOjc6ImFkZHJlc3MiO3M6MDoiIjtzOjQ6ImNpdHkiO3M6MzoiQnVlIjtzOjc6ImNvdW50cnkiO3M6MjoiQVIiO3M6NDoibGFuZyI7czo1OiJlc19hciI7czo1OiJ0aGVtZSI7czowOiIiO3M6ODoidGltZXpvbmUiO3M6MjoiOTkiO3M6MTE6ImZpcnN0YWNjZXNzIjtzOjEwOiIxMzE2NzE0OTQ5IjtzOjEwOiJsYXN0YWNjZXNzIjtzOjE6IjAiO3M6OToibGFzdGxvZ2luIjtzOjE6IjAiO3M6MTI6ImN1cnJlbnRsb2dpbiI7czoxOiIwIjtzOjY6Imxhc3RpcCI7czowOiIiO3M6Njoic2VjcmV0IjtzOjE1OiJnUEhTM3dRM3JKU1FmUmciO3M6NzoicGljdHVyZSI7czoxOiIwIjtzOjM6InVybCI7czowOiIiO3M6MTE6ImRlc2NyaXB0aW9uIjtOO3M6MTc6ImRlc2NyaXB0aW9uZm9ybWF0IjtzOjE6IjAiO3M6MTA6Im1haWxmb3JtYXQiO3M6MToiMSI7czoxMDoibWFpbGRpZ2VzdCI7czoxOiIwIjtzOjExOiJtYWlsZGlzcGxheSI7czoxOiIyIjtzOjEwOiJodG1sZWRpdG9yIjtzOjE6IjEiO3M6NDoiYWpheCI7czoxOiIxIjtzOjEzOiJhdXRvc3Vic2NyaWJlIjtzOjE6IjEiO3M6MTE6InRyYWNrZm9ydW1zIjtzOjE6IjAiO3M6MTE6InRpbWVjcmVhdGVkIjtzOjEwOiIxMzE2NzE0OTQ5IjtzOjEyOiJ0aW1lbW9kaWZpZWQiO3M6MToiMCI7czoxMjoidHJ1c3RiaXRtYXNrIjtzOjE6IjAiO3M6ODoiaW1hZ2VhbHQiO047czoxMjoic2NyZWVucmVhZGVyIjtzOjE6IjAiO30=', '', 2, 1316715373),
(3, 'Tzo4OiJzdGRDbGFzcyI6NTE6e3M6MjoiaWQiO3M6MToiMyI7czo0OiJhdXRoIjtzOjU6ImVtYWlsIjtzOjk6ImNvbmZpcm1lZCI7czoxOiIxIjtzOjEyOiJwb2xpY3lhZ3JlZWQiO3M6MToiMCI7czo3OiJkZWxldGVkIjtzOjE6IjAiO3M6OToic3VzcGVuZGVkIjtzOjE6IjAiO3M6MTA6Im1uZXRob3N0aWQiO3M6MToiMSI7czo4OiJ1c2VybmFtZSI7czo3OiJkYW1pYW4xIjtzOjg6InBhc3N3b3JkIjtzOjMyOiI0NTM0ZTM5MGY4OTViNGZhOWM3Zjk5YjJiNmVmNDRiNSI7czo4OiJpZG51bWJlciI7czowOiIiO3M6OToiZmlyc3RuYW1lIjtzOjY6IkRhbWlhbiI7czo4OiJsYXN0bmFtZSI7czo5OiJDYWxhYnJlc2kiO3M6NToiZW1haWwiO3M6MjU6ImRhbWlhbmNhbGFicmVzaUBnbWFpbC5jb20iO3M6OToiZW1haWxzdG9wIjtzOjE6IjAiO3M6MzoiaWNxIjtzOjA6IiI7czo1OiJza3lwZSI7czowOiIiO3M6NToieWFob28iO3M6MDoiIjtzOjM6ImFpbSI7czowOiIiO3M6MzoibXNuIjtzOjA6IiI7czo2OiJwaG9uZTEiO3M6MDoiIjtzOjY6InBob25lMiI7czowOiIiO3M6MTE6Imluc3RpdHV0aW9uIjtzOjA6IiI7czoxMDoiZGVwYXJ0bWVudCI7czowOiIiO3M6NzoiYWRkcmVzcyI7czowOiIiO3M6NDoiY2l0eSI7czoxMjoiQnVlbm9zIEFpcmVzIjtzOjc6ImNvdW50cnkiO3M6MjoiQVIiO3M6NDoibGFuZyI7czoyOiJlcyI7czo1OiJ0aGVtZSI7czowOiIiO3M6ODoidGltZXpvbmUiO3M6MjoiOTkiO3M6MTE6ImZpcnN0YWNjZXNzIjtzOjEwOiIxMzE2NjUwNTU1IjtzOjEwOiJsYXN0YWNjZXNzIjtzOjE6IjAiO3M6OToibGFzdGxvZ2luIjtzOjE6IjAiO3M6MTI6ImN1cnJlbnRsb2dpbiI7czoxOiIwIjtzOjY6Imxhc3RpcCI7czowOiIiO3M6Njoic2VjcmV0IjtzOjE1OiJreVE0VGo5bm5rZ1h5T08iO3M6NzoicGljdHVyZSI7czoxOiIwIjtzOjM6InVybCI7czowOiIiO3M6MTE6ImRlc2NyaXB0aW9uIjtOO3M6MTc6ImRlc2NyaXB0aW9uZm9ybWF0IjtzOjE6IjAiO3M6MTA6Im1haWxmb3JtYXQiO3M6MToiMSI7czoxMDoibWFpbGRpZ2VzdCI7czoxOiIwIjtzOjExOiJtYWlsZGlzcGxheSI7czoxOiIyIjtzOjEwOiJodG1sZWRpdG9yIjtzOjE6IjEiO3M6NDoiYWpheCI7czoxOiIxIjtzOjEzOiJhdXRvc3Vic2NyaWJlIjtzOjE6IjEiO3M6MTE6InRyYWNrZm9ydW1zIjtzOjE6IjAiO3M6MTE6InRpbWVjcmVhdGVkIjtzOjEwOiIxMzE2NjQ0ODUyIjtzOjEyOiJ0aW1lbW9kaWZpZWQiO3M6MToiMCI7czoxMjoidHJ1c3RiaXRtYXNrIjtzOjE6IjAiO3M6ODoiaW1hZ2VhbHQiO047czoxMjoic2NyZWVucmVhZGVyIjtzOjE6IjAiO30=', '', 2, 1316715379),
(4, 'Tzo4OiJzdGRDbGFzcyI6NTE6e3M6MjoiaWQiO3M6MToiMyI7czo0OiJhdXRoIjtzOjU6ImVtYWlsIjtzOjk6ImNvbmZpcm1lZCI7czoxOiIxIjtzOjEyOiJwb2xpY3lhZ3JlZWQiO3M6MToiMCI7czo3OiJkZWxldGVkIjtzOjE6IjAiO3M6OToic3VzcGVuZGVkIjtzOjE6IjAiO3M6MTA6Im1uZXRob3N0aWQiO3M6MToiMSI7czo4OiJ1c2VybmFtZSI7czo3OiJkYW1pYW4xIjtzOjg6InBhc3N3b3JkIjtzOjMyOiI0NTM0ZTM5MGY4OTViNGZhOWM3Zjk5YjJiNmVmNDRiNSI7czo4OiJpZG51bWJlciI7czowOiIiO3M6OToiZmlyc3RuYW1lIjtzOjY6IkRhbWlhbiI7czo4OiJsYXN0bmFtZSI7czo5OiJDYWxhYnJlc2kiO3M6NToiZW1haWwiO3M6MjU6ImRhbWlhbmNhbGFicmVzaUBnbWFpbC5jb20iO3M6OToiZW1haWxzdG9wIjtzOjE6IjAiO3M6MzoiaWNxIjtzOjA6IiI7czo1OiJza3lwZSI7czowOiIiO3M6NToieWFob28iO3M6MDoiIjtzOjM6ImFpbSI7czowOiIiO3M6MzoibXNuIjtzOjA6IiI7czo2OiJwaG9uZTEiO3M6MDoiIjtzOjY6InBob25lMiI7czowOiIiO3M6MTE6Imluc3RpdHV0aW9uIjtzOjA6IiI7czoxMDoiZGVwYXJ0bWVudCI7czowOiIiO3M6NzoiYWRkcmVzcyI7czowOiIiO3M6NDoiY2l0eSI7czoxMjoiQnVlbm9zIEFpcmVzIjtzOjc6ImNvdW50cnkiO3M6MjoiQVIiO3M6NDoibGFuZyI7czoyOiJlcyI7czo1OiJ0aGVtZSI7czowOiIiO3M6ODoidGltZXpvbmUiO3M6MjoiOTkiO3M6MTE6ImZpcnN0YWNjZXNzIjtzOjEwOiIxMzE2NjUwNTU1IjtzOjEwOiJsYXN0YWNjZXNzIjtzOjE6IjAiO3M6OToibGFzdGxvZ2luIjtzOjE6IjAiO3M6MTI6ImN1cnJlbnRsb2dpbiI7czoxOiIwIjtzOjY6Imxhc3RpcCI7czowOiIiO3M6Njoic2VjcmV0IjtzOjE1OiJreVE0VGo5bm5rZ1h5T08iO3M6NzoicGljdHVyZSI7czoxOiIwIjtzOjM6InVybCI7czowOiIiO3M6MTE6ImRlc2NyaXB0aW9uIjtOO3M6MTc6ImRlc2NyaXB0aW9uZm9ybWF0IjtzOjE6IjAiO3M6MTA6Im1haWxmb3JtYXQiO3M6MToiMSI7czoxMDoibWFpbGRpZ2VzdCI7czoxOiIwIjtzOjExOiJtYWlsZGlzcGxheSI7czoxOiIyIjtzOjEwOiJodG1sZWRpdG9yIjtzOjE6IjEiO3M6NDoiYWpheCI7czoxOiIxIjtzOjEzOiJhdXRvc3Vic2NyaWJlIjtzOjE6IjEiO3M6MTE6InRyYWNrZm9ydW1zIjtzOjE6IjAiO3M6MTE6InRpbWVjcmVhdGVkIjtzOjEwOiIxMzE2NjQ0ODUyIjtzOjEyOiJ0aW1lbW9kaWZpZWQiO3M6MToiMCI7czoxMjoidHJ1c3RiaXRtYXNrIjtzOjE6IjAiO3M6ODoiaW1hZ2VhbHQiO047czoxMjoic2NyZWVucmVhZGVyIjtzOjE6IjAiO30=', '', 2, 1316715380),
(5, 'Tzo4OiJzdGRDbGFzcyI6NTE6e3M6MjoiaWQiO3M6MToiNCI7czo0OiJhdXRoIjtzOjU6ImVtYWlsIjtzOjk6ImNvbmZpcm1lZCI7czoxOiIwIjtzOjEyOiJwb2xpY3lhZ3JlZWQiO3M6MToiMCI7czo3OiJkZWxldGVkIjtzOjE6IjAiO3M6OToic3VzcGVuZGVkIjtzOjE6IjAiO3M6MTA6Im1uZXRob3N0aWQiO3M6MToiMSI7czo4OiJ1c2VybmFtZSI7czo3OiJkYW1pYW4yIjtzOjg6InBhc3N3b3JkIjtzOjMyOiI0NTM0ZTM5MGY4OTViNGZhOWM3Zjk5YjJiNmVmNDRiNSI7czo4OiJpZG51bWJlciI7czowOiIiO3M6OToiZmlyc3RuYW1lIjtzOjY6IkRhbWlhbiI7czo4OiJsYXN0bmFtZSI7czo5OiJDYWxhYnJlc2kiO3M6NToiZW1haWwiO3M6MjY6ImRhbWlhbmNhbGFicmVzaTJAZ21haWwuY29tIjtzOjk6ImVtYWlsc3RvcCI7czoxOiIwIjtzOjM6ImljcSI7czowOiIiO3M6NToic2t5cGUiO3M6MDoiIjtzOjU6InlhaG9vIjtzOjA6IiI7czozOiJhaW0iO3M6MDoiIjtzOjM6Im1zbiI7czowOiIiO3M6NjoicGhvbmUxIjtzOjA6IiI7czo2OiJwaG9uZTIiO3M6MDoiIjtzOjExOiJpbnN0aXR1dGlvbiI7czowOiIiO3M6MTA6ImRlcGFydG1lbnQiO3M6MDoiIjtzOjc6ImFkZHJlc3MiO3M6MDoiIjtzOjQ6ImNpdHkiO3M6MTI6IkJ1ZW5vcyBBaXJlcyI7czo3OiJjb3VudHJ5IjtzOjI6IkFSIjtzOjQ6ImxhbmciO3M6NToiZXNfYXIiO3M6NToidGhlbWUiO3M6MDoiIjtzOjg6InRpbWV6b25lIjtzOjI6Ijk5IjtzOjExOiJmaXJzdGFjY2VzcyI7czoxMDoiMTMxNjcxMzkzMCI7czoxMDoibGFzdGFjY2VzcyI7czoxOiIwIjtzOjk6Imxhc3Rsb2dpbiI7czoxOiIwIjtzOjEyOiJjdXJyZW50bG9naW4iO3M6MToiMCI7czo2OiJsYXN0aXAiO3M6MDoiIjtzOjY6InNlY3JldCI7czoxNToiclFNOEZuSlBQNlRiT041IjtzOjc6InBpY3R1cmUiO3M6MToiMCI7czozOiJ1cmwiO3M6MDoiIjtzOjExOiJkZXNjcmlwdGlvbiI7TjtzOjE3OiJkZXNjcmlwdGlvbmZvcm1hdCI7czoxOiIwIjtzOjEwOiJtYWlsZm9ybWF0IjtzOjE6IjEiO3M6MTA6Im1haWxkaWdlc3QiO3M6MToiMCI7czoxMToibWFpbGRpc3BsYXkiO3M6MToiMiI7czoxMDoiaHRtbGVkaXRvciI7czoxOiIxIjtzOjQ6ImFqYXgiO3M6MToiMSI7czoxMzoiYXV0b3N1YnNjcmliZSI7czoxOiIxIjtzOjExOiJ0cmFja2ZvcnVtcyI7czoxOiIwIjtzOjExOiJ0aW1lY3JlYXRlZCI7czoxMDoiMTMxNjcxMzkzMCI7czoxMjoidGltZW1vZGlmaWVkIjtzOjE6IjAiO3M6MTI6InRydXN0Yml0bWFzayI7czoxOiIwIjtzOjg6ImltYWdlYWx0IjtOO3M6MTI6InNjcmVlbnJlYWRlciI7czoxOiIwIjt9', '', 2, 1316715386),
(6, 'Tzo4OiJzdGRDbGFzcyI6NTE6e3M6MjoiaWQiO3M6MToiNCI7czo0OiJhdXRoIjtzOjU6ImVtYWlsIjtzOjk6ImNvbmZpcm1lZCI7czoxOiIwIjtzOjEyOiJwb2xpY3lhZ3JlZWQiO3M6MToiMCI7czo3OiJkZWxldGVkIjtzOjE6IjAiO3M6OToic3VzcGVuZGVkIjtzOjE6IjAiO3M6MTA6Im1uZXRob3N0aWQiO3M6MToiMSI7czo4OiJ1c2VybmFtZSI7czo3OiJkYW1pYW4yIjtzOjg6InBhc3N3b3JkIjtzOjMyOiI0NTM0ZTM5MGY4OTViNGZhOWM3Zjk5YjJiNmVmNDRiNSI7czo4OiJpZG51bWJlciI7czowOiIiO3M6OToiZmlyc3RuYW1lIjtzOjY6IkRhbWlhbiI7czo4OiJsYXN0bmFtZSI7czo5OiJDYWxhYnJlc2kiO3M6NToiZW1haWwiO3M6MjY6ImRhbWlhbmNhbGFicmVzaTJAZ21haWwuY29tIjtzOjk6ImVtYWlsc3RvcCI7czoxOiIwIjtzOjM6ImljcSI7czowOiIiO3M6NToic2t5cGUiO3M6MDoiIjtzOjU6InlhaG9vIjtzOjA6IiI7czozOiJhaW0iO3M6MDoiIjtzOjM6Im1zbiI7czowOiIiO3M6NjoicGhvbmUxIjtzOjA6IiI7czo2OiJwaG9uZTIiO3M6MDoiIjtzOjExOiJpbnN0aXR1dGlvbiI7czowOiIiO3M6MTA6ImRlcGFydG1lbnQiO3M6MDoiIjtzOjc6ImFkZHJlc3MiO3M6MDoiIjtzOjQ6ImNpdHkiO3M6MTI6IkJ1ZW5vcyBBaXJlcyI7czo3OiJjb3VudHJ5IjtzOjI6IkFSIjtzOjQ6ImxhbmciO3M6NToiZXNfYXIiO3M6NToidGhlbWUiO3M6MDoiIjtzOjg6InRpbWV6b25lIjtzOjI6Ijk5IjtzOjExOiJmaXJzdGFjY2VzcyI7czoxMDoiMTMxNjcxMzkzMCI7czoxMDoibGFzdGFjY2VzcyI7czoxOiIwIjtzOjk6Imxhc3Rsb2dpbiI7czoxOiIwIjtzOjEyOiJjdXJyZW50bG9naW4iO3M6MToiMCI7czo2OiJsYXN0aXAiO3M6MDoiIjtzOjY6InNlY3JldCI7czoxNToiclFNOEZuSlBQNlRiT041IjtzOjc6InBpY3R1cmUiO3M6MToiMCI7czozOiJ1cmwiO3M6MDoiIjtzOjExOiJkZXNjcmlwdGlvbiI7TjtzOjE3OiJkZXNjcmlwdGlvbmZvcm1hdCI7czoxOiIwIjtzOjEwOiJtYWlsZm9ybWF0IjtzOjE6IjEiO3M6MTA6Im1haWxkaWdlc3QiO3M6MToiMCI7czoxMToibWFpbGRpc3BsYXkiO3M6MToiMiI7czoxMDoiaHRtbGVkaXRvciI7czoxOiIxIjtzOjQ6ImFqYXgiO3M6MToiMSI7czoxMzoiYXV0b3N1YnNjcmliZSI7czoxOiIxIjtzOjExOiJ0cmFja2ZvcnVtcyI7czoxOiIwIjtzOjExOiJ0aW1lY3JlYXRlZCI7czoxMDoiMTMxNjcxMzkzMCI7czoxMjoidGltZW1vZGlmaWVkIjtzOjE6IjAiO3M6MTI6InRydXN0Yml0bWFzayI7czoxOiIwIjtzOjg6ImltYWdlYWx0IjtOO3M6MTI6InNjcmVlbnJlYWRlciI7czoxOiIwIjt9', '', 2, 1316715386),
(7, 'Tzo4OiJzdGRDbGFzcyI6NTE6e3M6MjoiaWQiO3M6MToiNSI7czo0OiJhdXRoIjtzOjU6ImVtYWlsIjtzOjk6ImNvbmZpcm1lZCI7czoxOiIwIjtzOjEyOiJwb2xpY3lhZ3JlZWQiO3M6MToiMCI7czo3OiJkZWxldGVkIjtzOjE6IjAiO3M6OToic3VzcGVuZGVkIjtzOjE6IjAiO3M6MTA6Im1uZXRob3N0aWQiO3M6MToiMSI7czo4OiJ1c2VybmFtZSI7czo3OiJkYW1pYW4zIjtzOjg6InBhc3N3b3JkIjtzOjMyOiI0NTM0ZTM5MGY4OTViNGZhOWM3Zjk5YjJiNmVmNDRiNSI7czo4OiJpZG51bWJlciI7czowOiIiO3M6OToiZmlyc3RuYW1lIjtzOjY6IkRhbWlhbiI7czo4OiJsYXN0bmFtZSI7czo5OiJDYWxhYnJlc2kiO3M6NToiZW1haWwiO3M6MjY6ImRhbWlhbmNhbGFicmVzaTNAZ21haWwuY29tIjtzOjk6ImVtYWlsc3RvcCI7czoxOiIwIjtzOjM6ImljcSI7czowOiIiO3M6NToic2t5cGUiO3M6MDoiIjtzOjU6InlhaG9vIjtzOjA6IiI7czozOiJhaW0iO3M6MDoiIjtzOjM6Im1zbiI7czowOiIiO3M6NjoicGhvbmUxIjtzOjA6IiI7czo2OiJwaG9uZTIiO3M6MDoiIjtzOjExOiJpbnN0aXR1dGlvbiI7czowOiIiO3M6MTA6ImRlcGFydG1lbnQiO3M6MDoiIjtzOjc6ImFkZHJlc3MiO3M6MDoiIjtzOjQ6ImNpdHkiO3M6MTI6IkJ1ZW5vcyBBaXJlcyI7czo3OiJjb3VudHJ5IjtzOjI6IkFSIjtzOjQ6ImxhbmciO3M6NToiZXNfYXIiO3M6NToidGhlbWUiO3M6MDoiIjtzOjg6InRpbWV6b25lIjtzOjI6Ijk5IjtzOjExOiJmaXJzdGFjY2VzcyI7czoxMDoiMTMxNjcxNDQzNCI7czoxMDoibGFzdGFjY2VzcyI7czoxOiIwIjtzOjk6Imxhc3Rsb2dpbiI7czoxOiIwIjtzOjEyOiJjdXJyZW50bG9naW4iO3M6MToiMCI7czo2OiJsYXN0aXAiO3M6MDoiIjtzOjY6InNlY3JldCI7czoxNToiMDZxY3MwcG9oNFhCNXJrIjtzOjc6InBpY3R1cmUiO3M6MToiMCI7czozOiJ1cmwiO3M6MDoiIjtzOjExOiJkZXNjcmlwdGlvbiI7TjtzOjE3OiJkZXNjcmlwdGlvbmZvcm1hdCI7czoxOiIwIjtzOjEwOiJtYWlsZm9ybWF0IjtzOjE6IjEiO3M6MTA6Im1haWxkaWdlc3QiO3M6MToiMCI7czoxMToibWFpbGRpc3BsYXkiO3M6MToiMiI7czoxMDoiaHRtbGVkaXRvciI7czoxOiIxIjtzOjQ6ImFqYXgiO3M6MToiMSI7czoxMzoiYXV0b3N1YnNjcmliZSI7czoxOiIxIjtzOjExOiJ0cmFja2ZvcnVtcyI7czoxOiIwIjtzOjExOiJ0aW1lY3JlYXRlZCI7czoxMDoiMTMxNjcxNDQzNCI7czoxMjoidGltZW1vZGlmaWVkIjtzOjE6IjAiO3M6MTI6InRydXN0Yml0bWFzayI7czoxOiIwIjtzOjg6ImltYWdlYWx0IjtOO3M6MTI6InNjcmVlbnJlYWRlciI7czoxOiIwIjt9', '', 2, 1316715393),
(8, 'Tzo4OiJzdGRDbGFzcyI6NTE6e3M6MjoiaWQiO3M6MToiNSI7czo0OiJhdXRoIjtzOjU6ImVtYWlsIjtzOjk6ImNvbmZpcm1lZCI7czoxOiIwIjtzOjEyOiJwb2xpY3lhZ3JlZWQiO3M6MToiMCI7czo3OiJkZWxldGVkIjtzOjE6IjAiO3M6OToic3VzcGVuZGVkIjtzOjE6IjAiO3M6MTA6Im1uZXRob3N0aWQiO3M6MToiMSI7czo4OiJ1c2VybmFtZSI7czo3OiJkYW1pYW4zIjtzOjg6InBhc3N3b3JkIjtzOjMyOiI0NTM0ZTM5MGY4OTViNGZhOWM3Zjk5YjJiNmVmNDRiNSI7czo4OiJpZG51bWJlciI7czowOiIiO3M6OToiZmlyc3RuYW1lIjtzOjY6IkRhbWlhbiI7czo4OiJsYXN0bmFtZSI7czo5OiJDYWxhYnJlc2kiO3M6NToiZW1haWwiO3M6MjY6ImRhbWlhbmNhbGFicmVzaTNAZ21haWwuY29tIjtzOjk6ImVtYWlsc3RvcCI7czoxOiIwIjtzOjM6ImljcSI7czowOiIiO3M6NToic2t5cGUiO3M6MDoiIjtzOjU6InlhaG9vIjtzOjA6IiI7czozOiJhaW0iO3M6MDoiIjtzOjM6Im1zbiI7czowOiIiO3M6NjoicGhvbmUxIjtzOjA6IiI7czo2OiJwaG9uZTIiO3M6MDoiIjtzOjExOiJpbnN0aXR1dGlvbiI7czowOiIiO3M6MTA6ImRlcGFydG1lbnQiO3M6MDoiIjtzOjc6ImFkZHJlc3MiO3M6MDoiIjtzOjQ6ImNpdHkiO3M6MTI6IkJ1ZW5vcyBBaXJlcyI7czo3OiJjb3VudHJ5IjtzOjI6IkFSIjtzOjQ6ImxhbmciO3M6NToiZXNfYXIiO3M6NToidGhlbWUiO3M6MDoiIjtzOjg6InRpbWV6b25lIjtzOjI6Ijk5IjtzOjExOiJmaXJzdGFjY2VzcyI7czoxMDoiMTMxNjcxNDQzNCI7czoxMDoibGFzdGFjY2VzcyI7czoxOiIwIjtzOjk6Imxhc3Rsb2dpbiI7czoxOiIwIjtzOjEyOiJjdXJyZW50bG9naW4iO3M6MToiMCI7czo2OiJsYXN0aXAiO3M6MDoiIjtzOjY6InNlY3JldCI7czoxNToiMDZxY3MwcG9oNFhCNXJrIjtzOjc6InBpY3R1cmUiO3M6MToiMCI7czozOiJ1cmwiO3M6MDoiIjtzOjExOiJkZXNjcmlwdGlvbiI7TjtzOjE3OiJkZXNjcmlwdGlvbmZvcm1hdCI7czoxOiIwIjtzOjEwOiJtYWlsZm9ybWF0IjtzOjE6IjEiO3M6MTA6Im1haWxkaWdlc3QiO3M6MToiMCI7czoxMToibWFpbGRpc3BsYXkiO3M6MToiMiI7czoxMDoiaHRtbGVkaXRvciI7czoxOiIxIjtzOjQ6ImFqYXgiO3M6MToiMSI7czoxMzoiYXV0b3N1YnNjcmliZSI7czoxOiIxIjtzOjExOiJ0cmFja2ZvcnVtcyI7czoxOiIwIjtzOjExOiJ0aW1lY3JlYXRlZCI7czoxMDoiMTMxNjcxNDQzNCI7czoxMjoidGltZW1vZGlmaWVkIjtzOjE6IjAiO3M6MTI6InRydXN0Yml0bWFzayI7czoxOiIwIjtzOjg6ImltYWdlYWx0IjtOO3M6MTI6InNjcmVlbnJlYWRlciI7czoxOiIwIjt9', '', 2, 1316715393),
(9, 'Tzo4OiJzdGRDbGFzcyI6NTE6e3M6MjoiaWQiO3M6MToiNiI7czo0OiJhdXRoIjtzOjU6ImVtYWlsIjtzOjk6ImNvbmZpcm1lZCI7czoxOiIwIjtzOjEyOiJwb2xpY3lhZ3JlZWQiO3M6MToiMCI7czo3OiJkZWxldGVkIjtzOjE6IjAiO3M6OToic3VzcGVuZGVkIjtzOjE6IjAiO3M6MTA6Im1uZXRob3N0aWQiO3M6MToiMSI7czo4OiJ1c2VybmFtZSI7czo3OiJkYW1pYW40IjtzOjg6InBhc3N3b3JkIjtzOjMyOiI0NTM0ZTM5MGY4OTViNGZhOWM3Zjk5YjJiNmVmNDRiNSI7czo4OiJpZG51bWJlciI7czowOiIiO3M6OToiZmlyc3RuYW1lIjtzOjY6IkRhbWlhbiI7czo4OiJsYXN0bmFtZSI7czo5OiJDYWxhYnJlc2kiO3M6NToiZW1haWwiO3M6MjY6ImRhbWlhbmNhbGFicmVzaTRAZ21haWwuY29tIjtzOjk6ImVtYWlsc3RvcCI7czoxOiIwIjtzOjM6ImljcSI7czowOiIiO3M6NToic2t5cGUiO3M6MDoiIjtzOjU6InlhaG9vIjtzOjA6IiI7czozOiJhaW0iO3M6MDoiIjtzOjM6Im1zbiI7czowOiIiO3M6NjoicGhvbmUxIjtzOjA6IiI7czo2OiJwaG9uZTIiO3M6MDoiIjtzOjExOiJpbnN0aXR1dGlvbiI7czowOiIiO3M6MTA6ImRlcGFydG1lbnQiO3M6MDoiIjtzOjc6ImFkZHJlc3MiO3M6MDoiIjtzOjQ6ImNpdHkiO3M6MTI6IkJ1ZW5vcyBBaXJlcyI7czo3OiJjb3VudHJ5IjtzOjI6IkFSIjtzOjQ6ImxhbmciO3M6NToiZXNfYXIiO3M6NToidGhlbWUiO3M6MDoiIjtzOjg6InRpbWV6b25lIjtzOjI6Ijk5IjtzOjExOiJmaXJzdGFjY2VzcyI7czoxMDoiMTMxNjcxNDUzNCI7czoxMDoibGFzdGFjY2VzcyI7czoxOiIwIjtzOjk6Imxhc3Rsb2dpbiI7czoxOiIwIjtzOjEyOiJjdXJyZW50bG9naW4iO3M6MToiMCI7czo2OiJsYXN0aXAiO3M6MDoiIjtzOjY6InNlY3JldCI7czoxNToiUWdPb3BOYkpIdWlCR2I2IjtzOjc6InBpY3R1cmUiO3M6MToiMCI7czozOiJ1cmwiO3M6MDoiIjtzOjExOiJkZXNjcmlwdGlvbiI7TjtzOjE3OiJkZXNjcmlwdGlvbmZvcm1hdCI7czoxOiIwIjtzOjEwOiJtYWlsZm9ybWF0IjtzOjE6IjEiO3M6MTA6Im1haWxkaWdlc3QiO3M6MToiMCI7czoxMToibWFpbGRpc3BsYXkiO3M6MToiMiI7czoxMDoiaHRtbGVkaXRvciI7czoxOiIxIjtzOjQ6ImFqYXgiO3M6MToiMSI7czoxMzoiYXV0b3N1YnNjcmliZSI7czoxOiIxIjtzOjExOiJ0cmFja2ZvcnVtcyI7czoxOiIwIjtzOjExOiJ0aW1lY3JlYXRlZCI7czoxMDoiMTMxNjcxNDUzNCI7czoxMjoidGltZW1vZGlmaWVkIjtzOjE6IjAiO3M6MTI6InRydXN0Yml0bWFzayI7czoxOiIwIjtzOjg6ImltYWdlYWx0IjtOO3M6MTI6InNjcmVlbnJlYWRlciI7czoxOiIwIjt9', '', 2, 1316715400),
(10, 'Tzo4OiJzdGRDbGFzcyI6NTE6e3M6MjoiaWQiO3M6MToiNiI7czo0OiJhdXRoIjtzOjU6ImVtYWlsIjtzOjk6ImNvbmZpcm1lZCI7czoxOiIwIjtzOjEyOiJwb2xpY3lhZ3JlZWQiO3M6MToiMCI7czo3OiJkZWxldGVkIjtzOjE6IjAiO3M6OToic3VzcGVuZGVkIjtzOjE6IjAiO3M6MTA6Im1uZXRob3N0aWQiO3M6MToiMSI7czo4OiJ1c2VybmFtZSI7czo3OiJkYW1pYW40IjtzOjg6InBhc3N3b3JkIjtzOjMyOiI0NTM0ZTM5MGY4OTViNGZhOWM3Zjk5YjJiNmVmNDRiNSI7czo4OiJpZG51bWJlciI7czowOiIiO3M6OToiZmlyc3RuYW1lIjtzOjY6IkRhbWlhbiI7czo4OiJsYXN0bmFtZSI7czo5OiJDYWxhYnJlc2kiO3M6NToiZW1haWwiO3M6MjY6ImRhbWlhbmNhbGFicmVzaTRAZ21haWwuY29tIjtzOjk6ImVtYWlsc3RvcCI7czoxOiIwIjtzOjM6ImljcSI7czowOiIiO3M6NToic2t5cGUiO3M6MDoiIjtzOjU6InlhaG9vIjtzOjA6IiI7czozOiJhaW0iO3M6MDoiIjtzOjM6Im1zbiI7czowOiIiO3M6NjoicGhvbmUxIjtzOjA6IiI7czo2OiJwaG9uZTIiO3M6MDoiIjtzOjExOiJpbnN0aXR1dGlvbiI7czowOiIiO3M6MTA6ImRlcGFydG1lbnQiO3M6MDoiIjtzOjc6ImFkZHJlc3MiO3M6MDoiIjtzOjQ6ImNpdHkiO3M6MTI6IkJ1ZW5vcyBBaXJlcyI7czo3OiJjb3VudHJ5IjtzOjI6IkFSIjtzOjQ6ImxhbmciO3M6NToiZXNfYXIiO3M6NToidGhlbWUiO3M6MDoiIjtzOjg6InRpbWV6b25lIjtzOjI6Ijk5IjtzOjExOiJmaXJzdGFjY2VzcyI7czoxMDoiMTMxNjcxNDUzNCI7czoxMDoibGFzdGFjY2VzcyI7czoxOiIwIjtzOjk6Imxhc3Rsb2dpbiI7czoxOiIwIjtzOjEyOiJjdXJyZW50bG9naW4iO3M6MToiMCI7czo2OiJsYXN0aXAiO3M6MDoiIjtzOjY6InNlY3JldCI7czoxNToiUWdPb3BOYkpIdWlCR2I2IjtzOjc6InBpY3R1cmUiO3M6MToiMCI7czozOiJ1cmwiO3M6MDoiIjtzOjExOiJkZXNjcmlwdGlvbiI7TjtzOjE3OiJkZXNjcmlwdGlvbmZvcm1hdCI7czoxOiIwIjtzOjEwOiJtYWlsZm9ybWF0IjtzOjE6IjEiO3M6MTA6Im1haWxkaWdlc3QiO3M6MToiMCI7czoxMToibWFpbGRpc3BsYXkiO3M6MToiMiI7czoxMDoiaHRtbGVkaXRvciI7czoxOiIxIjtzOjQ6ImFqYXgiO3M6MToiMSI7czoxMzoiYXV0b3N1YnNjcmliZSI7czoxOiIxIjtzOjExOiJ0cmFja2ZvcnVtcyI7czoxOiIwIjtzOjExOiJ0aW1lY3JlYXRlZCI7czoxMDoiMTMxNjcxNDUzNCI7czoxMjoidGltZW1vZGlmaWVkIjtzOjE6IjAiO3M6MTI6InRydXN0Yml0bWFzayI7czoxOiIwIjtzOjg6ImltYWdlYWx0IjtOO3M6MTI6InNjcmVlbnJlYWRlciI7czoxOiIwIjt9', '', 2, 1316715400),
(11, 'Tzo4OiJzdGRDbGFzcyI6NTE6e3M6MjoiaWQiO3M6MToiNyI7czo0OiJhdXRoIjtzOjU6ImVtYWlsIjtzOjk6ImNvbmZpcm1lZCI7czoxOiIwIjtzOjEyOiJwb2xpY3lhZ3JlZWQiO3M6MToiMCI7czo3OiJkZWxldGVkIjtzOjE6IjAiO3M6OToic3VzcGVuZGVkIjtzOjE6IjAiO3M6MTA6Im1uZXRob3N0aWQiO3M6MToiMSI7czo4OiJ1c2VybmFtZSI7czo3OiJkYW1pYW41IjtzOjg6InBhc3N3b3JkIjtzOjMyOiI0NTM0ZTM5MGY4OTViNGZhOWM3Zjk5YjJiNmVmNDRiNSI7czo4OiJpZG51bWJlciI7czowOiIiO3M6OToiZmlyc3RuYW1lIjtzOjY6IkRhbWlhbiI7czo4OiJsYXN0bmFtZSI7czo5OiJDYWxhYnJlc2kiO3M6NToiZW1haWwiO3M6MjY6ImRhbWlhbmNhbGFicmVzaTZAZ21haWwuY29tIjtzOjk6ImVtYWlsc3RvcCI7czoxOiIwIjtzOjM6ImljcSI7czowOiIiO3M6NToic2t5cGUiO3M6MDoiIjtzOjU6InlhaG9vIjtzOjA6IiI7czozOiJhaW0iO3M6MDoiIjtzOjM6Im1zbiI7czowOiIiO3M6NjoicGhvbmUxIjtzOjA6IiI7czo2OiJwaG9uZTIiO3M6MDoiIjtzOjExOiJpbnN0aXR1dGlvbiI7czowOiIiO3M6MTA6ImRlcGFydG1lbnQiO3M6MDoiIjtzOjc6ImFkZHJlc3MiO3M6MDoiIjtzOjQ6ImNpdHkiO3M6MTI6IkJ1ZW5vcyBBaXJlcyI7czo3OiJjb3VudHJ5IjtzOjI6IkFSIjtzOjQ6ImxhbmciO3M6NToiZXNfYXIiO3M6NToidGhlbWUiO3M6MDoiIjtzOjg6InRpbWV6b25lIjtzOjI6Ijk5IjtzOjExOiJmaXJzdGFjY2VzcyI7czoxMDoiMTMxNjcxNDg0NCI7czoxMDoibGFzdGFjY2VzcyI7czoxOiIwIjtzOjk6Imxhc3Rsb2dpbiI7czoxOiIwIjtzOjEyOiJjdXJyZW50bG9naW4iO3M6MToiMCI7czo2OiJsYXN0aXAiO3M6MDoiIjtzOjY6InNlY3JldCI7czoxNToiUGxreW9aY0FvSmpzR1NNIjtzOjc6InBpY3R1cmUiO3M6MToiMCI7czozOiJ1cmwiO3M6MDoiIjtzOjExOiJkZXNjcmlwdGlvbiI7TjtzOjE3OiJkZXNjcmlwdGlvbmZvcm1hdCI7czoxOiIwIjtzOjEwOiJtYWlsZm9ybWF0IjtzOjE6IjEiO3M6MTA6Im1haWxkaWdlc3QiO3M6MToiMCI7czoxMToibWFpbGRpc3BsYXkiO3M6MToiMiI7czoxMDoiaHRtbGVkaXRvciI7czoxOiIxIjtzOjQ6ImFqYXgiO3M6MToiMSI7czoxMzoiYXV0b3N1YnNjcmliZSI7czoxOiIxIjtzOjExOiJ0cmFja2ZvcnVtcyI7czoxOiIwIjtzOjExOiJ0aW1lY3JlYXRlZCI7czoxMDoiMTMxNjcxNDg0NCI7czoxMjoidGltZW1vZGlmaWVkIjtzOjE6IjAiO3M6MTI6InRydXN0Yml0bWFzayI7czoxOiIwIjtzOjg6ImltYWdlYWx0IjtOO3M6MTI6InNjcmVlbnJlYWRlciI7czoxOiIwIjt9', '', 2, 1316715408),
(12, 'Tzo4OiJzdGRDbGFzcyI6NTE6e3M6MjoiaWQiO3M6MToiNyI7czo0OiJhdXRoIjtzOjU6ImVtYWlsIjtzOjk6ImNvbmZpcm1lZCI7czoxOiIwIjtzOjEyOiJwb2xpY3lhZ3JlZWQiO3M6MToiMCI7czo3OiJkZWxldGVkIjtzOjE6IjAiO3M6OToic3VzcGVuZGVkIjtzOjE6IjAiO3M6MTA6Im1uZXRob3N0aWQiO3M6MToiMSI7czo4OiJ1c2VybmFtZSI7czo3OiJkYW1pYW41IjtzOjg6InBhc3N3b3JkIjtzOjMyOiI0NTM0ZTM5MGY4OTViNGZhOWM3Zjk5YjJiNmVmNDRiNSI7czo4OiJpZG51bWJlciI7czowOiIiO3M6OToiZmlyc3RuYW1lIjtzOjY6IkRhbWlhbiI7czo4OiJsYXN0bmFtZSI7czo5OiJDYWxhYnJlc2kiO3M6NToiZW1haWwiO3M6MjY6ImRhbWlhbmNhbGFicmVzaTZAZ21haWwuY29tIjtzOjk6ImVtYWlsc3RvcCI7czoxOiIwIjtzOjM6ImljcSI7czowOiIiO3M6NToic2t5cGUiO3M6MDoiIjtzOjU6InlhaG9vIjtzOjA6IiI7czozOiJhaW0iO3M6MDoiIjtzOjM6Im1zbiI7czowOiIiO3M6NjoicGhvbmUxIjtzOjA6IiI7czo2OiJwaG9uZTIiO3M6MDoiIjtzOjExOiJpbnN0aXR1dGlvbiI7czowOiIiO3M6MTA6ImRlcGFydG1lbnQiO3M6MDoiIjtzOjc6ImFkZHJlc3MiO3M6MDoiIjtzOjQ6ImNpdHkiO3M6MTI6IkJ1ZW5vcyBBaXJlcyI7czo3OiJjb3VudHJ5IjtzOjI6IkFSIjtzOjQ6ImxhbmciO3M6NToiZXNfYXIiO3M6NToidGhlbWUiO3M6MDoiIjtzOjg6InRpbWV6b25lIjtzOjI6Ijk5IjtzOjExOiJmaXJzdGFjY2VzcyI7czoxMDoiMTMxNjcxNDg0NCI7czoxMDoibGFzdGFjY2VzcyI7czoxOiIwIjtzOjk6Imxhc3Rsb2dpbiI7czoxOiIwIjtzOjEyOiJjdXJyZW50bG9naW4iO3M6MToiMCI7czo2OiJsYXN0aXAiO3M6MDoiIjtzOjY6InNlY3JldCI7czoxNToiUGxreW9aY0FvSmpzR1NNIjtzOjc6InBpY3R1cmUiO3M6MToiMCI7czozOiJ1cmwiO3M6MDoiIjtzOjExOiJkZXNjcmlwdGlvbiI7TjtzOjE3OiJkZXNjcmlwdGlvbmZvcm1hdCI7czoxOiIwIjtzOjEwOiJtYWlsZm9ybWF0IjtzOjE6IjEiO3M6MTA6Im1haWxkaWdlc3QiO3M6MToiMCI7czoxMToibWFpbGRpc3BsYXkiO3M6MToiMiI7czoxMDoiaHRtbGVkaXRvciI7czoxOiIxIjtzOjQ6ImFqYXgiO3M6MToiMSI7czoxMzoiYXV0b3N1YnNjcmliZSI7czoxOiIxIjtzOjExOiJ0cmFja2ZvcnVtcyI7czoxOiIwIjtzOjExOiJ0aW1lY3JlYXRlZCI7czoxMDoiMTMxNjcxNDg0NCI7czoxMjoidGltZW1vZGlmaWVkIjtzOjE6IjAiO3M6MTI6InRydXN0Yml0bWFzayI7czoxOiIwIjtzOjg6ImltYWdlYWx0IjtOO3M6MTI6InNjcmVlbnJlYWRlciI7czoxOiIwIjt9', '', 2, 1316715408),
(13, 'Tzo4OiJzdGRDbGFzcyI6NTE6e3M6MjoiaWQiO3M6MToiOSI7czo0OiJhdXRoIjtzOjU6ImVtYWlsIjtzOjk6ImNvbmZpcm1lZCI7czoxOiIxIjtzOjEyOiJwb2xpY3lhZ3JlZWQiO3M6MToiMCI7czo3OiJkZWxldGVkIjtzOjE6IjAiO3M6OToic3VzcGVuZGVkIjtzOjE6IjAiO3M6MTA6Im1uZXRob3N0aWQiO3M6MToiMSI7czo4OiJ1c2VybmFtZSI7czo3OiJkYW1pYW43IjtzOjg6InBhc3N3b3JkIjtzOjMyOiI0NTM0ZTM5MGY4OTViNGZhOWM3Zjk5YjJiNmVmNDRiNSI7czo4OiJpZG51bWJlciI7czowOiIiO3M6OToiZmlyc3RuYW1lIjtzOjY6IkRhbWlhbiI7czo4OiJsYXN0bmFtZSI7czo5OiJDYWxhYnJlc2kiO3M6NToiZW1haWwiO3M6MjY6ImRhbWlhbmNhbGFicmVzaThAZ21haWwuY29tIjtzOjk6ImVtYWlsc3RvcCI7czoxOiIwIjtzOjM6ImljcSI7czowOiIiO3M6NToic2t5cGUiO3M6MDoiIjtzOjU6InlhaG9vIjtzOjA6IiI7czozOiJhaW0iO3M6MDoiIjtzOjM6Im1zbiI7czowOiIiO3M6NjoicGhvbmUxIjtzOjA6IiI7czo2OiJwaG9uZTIiO3M6MDoiIjtzOjExOiJpbnN0aXR1dGlvbiI7czowOiIiO3M6MTA6ImRlcGFydG1lbnQiO3M6MDoiIjtzOjc6ImFkZHJlc3MiO3M6MDoiIjtzOjQ6ImNpdHkiO3M6MTI6IkJ1ZW5vcyBBaXJlcyI7czo3OiJjb3VudHJ5IjtzOjI6IkFSIjtzOjQ6ImxhbmciO3M6NToiZXNfYXIiO3M6NToidGhlbWUiO3M6MDoiIjtzOjg6InRpbWV6b25lIjtzOjI6Ijk5IjtzOjExOiJmaXJzdGFjY2VzcyI7czoxMDoiMTMxNjcxNTU5NSI7czoxMDoibGFzdGFjY2VzcyI7czoxMDoiMTMxNjcxNTYxNiI7czo5OiJsYXN0bG9naW4iO3M6MToiMCI7czoxMjoiY3VycmVudGxvZ2luIjtzOjEwOiIxMzE2NzE1NjE2IjtzOjY6Imxhc3RpcCI7czo5OiIxMjcuMC4wLjEiO3M6Njoic2VjcmV0IjtzOjE1OiJ3cXNoNkpkaXZOa3ZEN0EiO3M6NzoicGljdHVyZSI7czoxOiIwIjtzOjM6InVybCI7czowOiIiO3M6MTE6ImRlc2NyaXB0aW9uIjtOO3M6MTc6ImRlc2NyaXB0aW9uZm9ybWF0IjtzOjE6IjAiO3M6MTA6Im1haWxmb3JtYXQiO3M6MToiMSI7czoxMDoibWFpbGRpZ2VzdCI7czoxOiIwIjtzOjExOiJtYWlsZGlzcGxheSI7czoxOiIyIjtzOjEwOiJodG1sZWRpdG9yIjtzOjE6IjEiO3M6NDoiYWpheCI7czoxOiIxIjtzOjEzOiJhdXRvc3Vic2NyaWJlIjtzOjE6IjEiO3M6MTE6InRyYWNrZm9ydW1zIjtzOjE6IjAiO3M6MTE6InRpbWVjcmVhdGVkIjtzOjEwOiIxMzE2NzE1MzM5IjtzOjEyOiJ0aW1lbW9kaWZpZWQiO3M6MToiMCI7czoxMjoidHJ1c3RiaXRtYXNrIjtzOjE6IjAiO3M6ODoiaW1hZ2VhbHQiO047czoxMjoic2NyZWVucmVhZGVyIjtzOjE6IjAiO30=', '', 2, 1317244268),
(14, 'Tzo4OiJzdGRDbGFzcyI6NTE6e3M6MjoiaWQiO3M6MToiOSI7czo0OiJhdXRoIjtzOjU6ImVtYWlsIjtzOjk6ImNvbmZpcm1lZCI7czoxOiIxIjtzOjEyOiJwb2xpY3lhZ3JlZWQiO3M6MToiMCI7czo3OiJkZWxldGVkIjtzOjE6IjAiO3M6OToic3VzcGVuZGVkIjtzOjE6IjAiO3M6MTA6Im1uZXRob3N0aWQiO3M6MToiMSI7czo4OiJ1c2VybmFtZSI7czo3OiJkYW1pYW43IjtzOjg6InBhc3N3b3JkIjtzOjMyOiI0NTM0ZTM5MGY4OTViNGZhOWM3Zjk5YjJiNmVmNDRiNSI7czo4OiJpZG51bWJlciI7czowOiIiO3M6OToiZmlyc3RuYW1lIjtzOjY6IkRhbWlhbiI7czo4OiJsYXN0bmFtZSI7czo5OiJDYWxhYnJlc2kiO3M6NToiZW1haWwiO3M6MjY6ImRhbWlhbmNhbGFicmVzaThAZ21haWwuY29tIjtzOjk6ImVtYWlsc3RvcCI7czoxOiIwIjtzOjM6ImljcSI7czowOiIiO3M6NToic2t5cGUiO3M6MDoiIjtzOjU6InlhaG9vIjtzOjA6IiI7czozOiJhaW0iO3M6MDoiIjtzOjM6Im1zbiI7czowOiIiO3M6NjoicGhvbmUxIjtzOjA6IiI7czo2OiJwaG9uZTIiO3M6MDoiIjtzOjExOiJpbnN0aXR1dGlvbiI7czowOiIiO3M6MTA6ImRlcGFydG1lbnQiO3M6MDoiIjtzOjc6ImFkZHJlc3MiO3M6MDoiIjtzOjQ6ImNpdHkiO3M6MTI6IkJ1ZW5vcyBBaXJlcyI7czo3OiJjb3VudHJ5IjtzOjI6IkFSIjtzOjQ6ImxhbmciO3M6NToiZXNfYXIiO3M6NToidGhlbWUiO3M6MDoiIjtzOjg6InRpbWV6b25lIjtzOjI6Ijk5IjtzOjExOiJmaXJzdGFjY2VzcyI7czoxMDoiMTMxNjcxNTU5NSI7czoxMDoibGFzdGFjY2VzcyI7czoxMDoiMTMxNjcxNTYxNiI7czo5OiJsYXN0bG9naW4iO3M6MToiMCI7czoxMjoiY3VycmVudGxvZ2luIjtzOjEwOiIxMzE2NzE1NjE2IjtzOjY6Imxhc3RpcCI7czo5OiIxMjcuMC4wLjEiO3M6Njoic2VjcmV0IjtzOjE1OiJ3cXNoNkpkaXZOa3ZEN0EiO3M6NzoicGljdHVyZSI7czoxOiIwIjtzOjM6InVybCI7czowOiIiO3M6MTE6ImRlc2NyaXB0aW9uIjtOO3M6MTc6ImRlc2NyaXB0aW9uZm9ybWF0IjtzOjE6IjAiO3M6MTA6Im1haWxmb3JtYXQiO3M6MToiMSI7czoxMDoibWFpbGRpZ2VzdCI7czoxOiIwIjtzOjExOiJtYWlsZGlzcGxheSI7czoxOiIyIjtzOjEwOiJodG1sZWRpdG9yIjtzOjE6IjEiO3M6NDoiYWpheCI7czoxOiIxIjtzOjEzOiJhdXRvc3Vic2NyaWJlIjtzOjE6IjEiO3M6MTE6InRyYWNrZm9ydW1zIjtzOjE6IjAiO3M6MTE6InRpbWVjcmVhdGVkIjtzOjEwOiIxMzE2NzE1MzM5IjtzOjEyOiJ0aW1lbW9kaWZpZWQiO3M6MToiMCI7czoxMjoidHJ1c3RiaXRtYXNrIjtzOjE6IjAiO3M6ODoiaW1hZ2VhbHQiO047czoxMjoic2NyZWVucmVhZGVyIjtzOjE6IjAiO30=', '', 2, 1317244268),
(15, 'Tzo4OiJzdGRDbGFzcyI6NTE6e3M6MjoiaWQiO3M6MjoiMTAiO3M6NDoiYXV0aCI7czo1OiJlbWFpbCI7czo5OiJjb25maXJtZWQiO3M6MToiMSI7czoxMjoicG9saWN5YWdyZWVkIjtzOjE6IjAiO3M6NzoiZGVsZXRlZCI7czoxOiIwIjtzOjk6InN1c3BlbmRlZCI7czoxOiIwIjtzOjEwOiJtbmV0aG9zdGlkIjtzOjE6IjEiO3M6ODoidXNlcm5hbWUiO3M6OToiYXByZW5kaXoxIjtzOjg6InBhc3N3b3JkIjtzOjMyOiJlNmQwYTI5OGUwZTA0NTQ1YzkwZjRmZTI4NzIwNWJkMSI7czo4OiJpZG51bWJlciI7czowOiIiO3M6OToiZmlyc3RuYW1lIjtzOjY6IkRhbWlhbiI7czo4OiJsYXN0bmFtZSI7czo4OiJBcHJlbmRpeiI7czo1OiJlbWFpbCI7czoyNzoiZGFtaWFuY2FsYWJyZXNpMTBAZ21haWwuY29tIjtzOjk6ImVtYWlsc3RvcCI7czoxOiIwIjtzOjM6ImljcSI7czowOiIiO3M6NToic2t5cGUiO3M6MDoiIjtzOjU6InlhaG9vIjtzOjA6IiI7czozOiJhaW0iO3M6MDoiIjtzOjM6Im1zbiI7czowOiIiO3M6NjoicGhvbmUxIjtzOjA6IiI7czo2OiJwaG9uZTIiO3M6MDoiIjtzOjExOiJpbnN0aXR1dGlvbiI7czowOiIiO3M6MTA6ImRlcGFydG1lbnQiO3M6MDoiIjtzOjc6ImFkZHJlc3MiO3M6MDoiIjtzOjQ6ImNpdHkiO3M6MTI6IkJ1ZW5vcyBBaXJlcyI7czo3OiJjb3VudHJ5IjtzOjI6IkFSIjtzOjQ6ImxhbmciO3M6NToiZXNfYXIiO3M6NToidGhlbWUiO3M6MDoiIjtzOjg6InRpbWV6b25lIjtzOjI6Ijk5IjtzOjExOiJmaXJzdGFjY2VzcyI7czoxMDoiMTMxNjgxMzExNiI7czoxMDoibGFzdGFjY2VzcyI7czoxOiIwIjtzOjk6Imxhc3Rsb2dpbiI7czoxOiIwIjtzOjEyOiJjdXJyZW50bG9naW4iO3M6MToiMCI7czo2OiJsYXN0aXAiO3M6MDoiIjtzOjY6InNlY3JldCI7czoxNToiNUxGUGJRWG5panFOR3paIjtzOjc6InBpY3R1cmUiO3M6MToiMCI7czozOiJ1cmwiO3M6MDoiIjtzOjExOiJkZXNjcmlwdGlvbiI7TjtzOjE3OiJkZXNjcmlwdGlvbmZvcm1hdCI7czoxOiIwIjtzOjEwOiJtYWlsZm9ybWF0IjtzOjE6IjEiO3M6MTA6Im1haWxkaWdlc3QiO3M6MToiMCI7czoxMToibWFpbGRpc3BsYXkiO3M6MToiMiI7czoxMDoiaHRtbGVkaXRvciI7czoxOiIxIjtzOjQ6ImFqYXgiO3M6MToiMSI7czoxMzoiYXV0b3N1YnNjcmliZSI7czoxOiIxIjtzOjExOiJ0cmFja2ZvcnVtcyI7czoxOiIwIjtzOjExOiJ0aW1lY3JlYXRlZCI7czoxMDoiMTMxNjgxMzA0MCI7czoxMjoidGltZW1vZGlmaWVkIjtzOjE6IjAiO3M6MTI6InRydXN0Yml0bWFzayI7czoxOiIwIjtzOjg6ImltYWdlYWx0IjtOO3M6MTI6InNjcmVlbnJlYWRlciI7czoxOiIwIjt9', '', 2, 1317244276),
(16, 'Tzo4OiJzdGRDbGFzcyI6NTE6e3M6MjoiaWQiO3M6MjoiMTAiO3M6NDoiYXV0aCI7czo1OiJlbWFpbCI7czo5OiJjb25maXJtZWQiO3M6MToiMSI7czoxMjoicG9saWN5YWdyZWVkIjtzOjE6IjAiO3M6NzoiZGVsZXRlZCI7czoxOiIwIjtzOjk6InN1c3BlbmRlZCI7czoxOiIwIjtzOjEwOiJtbmV0aG9zdGlkIjtzOjE6IjEiO3M6ODoidXNlcm5hbWUiO3M6OToiYXByZW5kaXoxIjtzOjg6InBhc3N3b3JkIjtzOjMyOiJlNmQwYTI5OGUwZTA0NTQ1YzkwZjRmZTI4NzIwNWJkMSI7czo4OiJpZG51bWJlciI7czowOiIiO3M6OToiZmlyc3RuYW1lIjtzOjY6IkRhbWlhbiI7czo4OiJsYXN0bmFtZSI7czo4OiJBcHJlbmRpeiI7czo1OiJlbWFpbCI7czoyNzoiZGFtaWFuY2FsYWJyZXNpMTBAZ21haWwuY29tIjtzOjk6ImVtYWlsc3RvcCI7czoxOiIwIjtzOjM6ImljcSI7czowOiIiO3M6NToic2t5cGUiO3M6MDoiIjtzOjU6InlhaG9vIjtzOjA6IiI7czozOiJhaW0iO3M6MDoiIjtzOjM6Im1zbiI7czowOiIiO3M6NjoicGhvbmUxIjtzOjA6IiI7czo2OiJwaG9uZTIiO3M6MDoiIjtzOjExOiJpbnN0aXR1dGlvbiI7czowOiIiO3M6MTA6ImRlcGFydG1lbnQiO3M6MDoiIjtzOjc6ImFkZHJlc3MiO3M6MDoiIjtzOjQ6ImNpdHkiO3M6MTI6IkJ1ZW5vcyBBaXJlcyI7czo3OiJjb3VudHJ5IjtzOjI6IkFSIjtzOjQ6ImxhbmciO3M6NToiZXNfYXIiO3M6NToidGhlbWUiO3M6MDoiIjtzOjg6InRpbWV6b25lIjtzOjI6Ijk5IjtzOjExOiJmaXJzdGFjY2VzcyI7czoxMDoiMTMxNjgxMzExNiI7czoxMDoibGFzdGFjY2VzcyI7czoxOiIwIjtzOjk6Imxhc3Rsb2dpbiI7czoxOiIwIjtzOjEyOiJjdXJyZW50bG9naW4iO3M6MToiMCI7czo2OiJsYXN0aXAiO3M6MDoiIjtzOjY6InNlY3JldCI7czoxNToiNUxGUGJRWG5panFOR3paIjtzOjc6InBpY3R1cmUiO3M6MToiMCI7czozOiJ1cmwiO3M6MDoiIjtzOjExOiJkZXNjcmlwdGlvbiI7TjtzOjE3OiJkZXNjcmlwdGlvbmZvcm1hdCI7czoxOiIwIjtzOjEwOiJtYWlsZm9ybWF0IjtzOjE6IjEiO3M6MTA6Im1haWxkaWdlc3QiO3M6MToiMCI7czoxMToibWFpbGRpc3BsYXkiO3M6MToiMiI7czoxMDoiaHRtbGVkaXRvciI7czoxOiIxIjtzOjQ6ImFqYXgiO3M6MToiMSI7czoxMzoiYXV0b3N1YnNjcmliZSI7czoxOiIxIjtzOjExOiJ0cmFja2ZvcnVtcyI7czoxOiIwIjtzOjExOiJ0aW1lY3JlYXRlZCI7czoxMDoiMTMxNjgxMzA0MCI7czoxMjoidGltZW1vZGlmaWVkIjtzOjE6IjAiO3M6MTI6InRydXN0Yml0bWFzayI7czoxOiIwIjtzOjg6ImltYWdlYWx0IjtOO3M6MTI6InNjcmVlbnJlYWRlciI7czoxOiIwIjt9', '', 2, 1317244276);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_events_queue_handlers`
--

CREATE TABLE IF NOT EXISTS `mdl_events_queue_handlers` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `queuedeventid` bigint(10) unsigned NOT NULL,
  `handlerid` bigint(10) unsigned NOT NULL,
  `status` bigint(10) DEFAULT NULL,
  `errormessage` mediumtext COLLATE utf8_unicode_ci,
  `timemodified` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_evenqueuhand_que_ix` (`queuedeventid`),
  KEY `mdl_evenqueuhand_han_ix` (`handlerid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This is the list of queued handlers for processing. The even' AUTO_INCREMENT=17 ;

--
-- Volcado de datos para la tabla `mdl_events_queue_handlers`
--

INSERT INTO `mdl_events_queue_handlers` (`id`, `queuedeventid`, `handlerid`, `status`, `errormessage`, `timemodified`) VALUES
(1, 1, 16, 0, '', 1316715373),
(2, 2, 17, 0, '', 1316715373),
(3, 3, 16, 0, '', 1316715379),
(4, 4, 17, 0, '', 1316715380),
(5, 5, 16, 0, '', 1316715386),
(6, 6, 17, 0, '', 1316715386),
(7, 7, 16, 0, '', 1316715393),
(8, 8, 17, 0, '', 1316715393),
(9, 9, 16, 0, '', 1316715400),
(10, 10, 17, 0, '', 1316715401),
(11, 11, 16, 0, '', 1316715408),
(12, 12, 17, 0, '', 1316715408),
(13, 13, 16, 0, '', 1317244268),
(14, 14, 17, 0, '', 1317244268),
(15, 15, 16, 0, '', 1317244276),
(16, 16, 17, 0, '', 1317244276);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_external_functions`
--

CREATE TABLE IF NOT EXISTS `mdl_external_functions` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `classname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `methodname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `classpath` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `capabilities` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_extefunc_nam_uix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='list of all external functions' AUTO_INCREMENT=26 ;

--
-- Volcado de datos para la tabla `mdl_external_functions`
--

INSERT INTO `mdl_external_functions` (`id`, `name`, `classname`, `methodname`, `classpath`, `component`, `capabilities`) VALUES
(1, 'moodle_group_create_groups', 'moodle_group_external', 'create_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(2, 'moodle_group_get_groups', 'moodle_group_external', 'get_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(3, 'moodle_group_get_course_groups', 'moodle_group_external', 'get_course_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(4, 'moodle_group_delete_groups', 'moodle_group_external', 'delete_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(5, 'moodle_group_get_groupmembers', 'moodle_group_external', 'get_groupmembers', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(6, 'moodle_group_add_groupmembers', 'moodle_group_external', 'add_groupmembers', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(7, 'moodle_group_delete_groupmembers', 'moodle_group_external', 'delete_groupmembers', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(8, 'moodle_file_get_files', 'moodle_file_external', 'get_files', 'files/externallib.php', 'moodle', ''),
(9, 'moodle_file_upload', 'moodle_file_external', 'upload', 'files/externallib.php', 'moodle', ''),
(10, 'moodle_user_create_users', 'moodle_user_external', 'create_users', 'user/externallib.php', 'moodle', 'moodle/user:create'),
(11, 'moodle_user_get_users_by_id', 'moodle_user_external', 'get_users_by_id', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update'),
(12, 'moodle_user_get_users_by_courseid', 'moodle_user_external', 'get_users_by_courseid', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update, moodle/site:accessallgroups'),
(13, 'moodle_user_get_course_participants_by_id', 'moodle_user_external', 'get_course_participants_by_id', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update, moodle/site:accessallgroups'),
(14, 'moodle_user_delete_users', 'moodle_user_external', 'delete_users', 'user/externallib.php', 'moodle', 'moodle/user:delete'),
(15, 'moodle_user_update_users', 'moodle_user_external', 'update_users', 'user/externallib.php', 'moodle', 'moodle/user:update'),
(16, 'moodle_enrol_get_enrolled_users', 'moodle_enrol_external', 'get_enrolled_users', 'enrol/externallib.php', 'moodle', 'moodle/site:viewparticipants, moodle/course:viewparticipants,\n            moodle/role:review, moodle/site:accessallgroups, moodle/course:enrolreview'),
(17, 'moodle_enrol_get_users_courses', 'moodle_enrol_external', 'get_users_courses', 'enrol/externallib.php', 'moodle', 'moodle/course:viewparticipants'),
(18, 'moodle_role_assign', 'moodle_enrol_external', 'role_assign', 'enrol/externallib.php', 'moodle', 'moodle/role:assign'),
(19, 'moodle_role_unassign', 'moodle_enrol_external', 'role_unassign', 'enrol/externallib.php', 'moodle', 'moodle/role:assign'),
(20, 'moodle_course_get_courses', 'moodle_course_external', 'get_courses', 'course/externallib.php', 'moodle', 'moodle/course:view,moodle/course:update,moodle/course:viewhiddencourses'),
(21, 'moodle_course_create_courses', 'moodle_course_external', 'create_courses', 'course/externallib.php', 'moodle', 'moodle/course:create,moodle/course:visibility'),
(22, 'moodle_message_send_instantmessages', 'moodle_message_external', 'send_instantmessages', 'message/externallib.php', 'moodle', 'moodle/site:sendmessage'),
(23, 'moodle_notes_create_notes', 'moodle_notes_external', 'create_notes', 'notes/externallib.php', 'moodle', 'moodle/notes:manage'),
(24, 'moodle_webservice_get_siteinfo', 'moodle_webservice_external', 'get_siteinfo', 'webservice/externallib.php', 'moodle', ''),
(25, 'moodle_enrol_manual_enrol_users', 'moodle_enrol_manual_external', 'manual_enrol_users', 'enrol/manual/externallib.php', 'enrol_manual', 'enrol/manual:enrol');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_external_services`
--

CREATE TABLE IF NOT EXISTS `mdl_external_services` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `enabled` tinyint(1) unsigned NOT NULL,
  `requiredcapability` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `restrictedusers` tinyint(1) unsigned NOT NULL,
  `component` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timecreated` bigint(10) unsigned NOT NULL,
  `timemodified` bigint(10) unsigned DEFAULT NULL,
  `shortname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_exteserv_nam_uix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='built in and custom external services' AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `mdl_external_services`
--

INSERT INTO `mdl_external_services` (`id`, `name`, `enabled`, `requiredcapability`, `restrictedusers`, `component`, `timecreated`, `timemodified`, `shortname`) VALUES
(1, 'Moodle mobile web service', 0, NULL, 0, 'moodle', 1316566453, NULL, 'moodle_mobile_app');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_external_services_functions`
--

CREATE TABLE IF NOT EXISTS `mdl_external_services_functions` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `externalserviceid` bigint(10) unsigned NOT NULL,
  `functionname` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_exteservfunc_ext_ix` (`externalserviceid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='lists functions available in each service group' AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `mdl_external_services_functions`
--

INSERT INTO `mdl_external_services_functions` (`id`, `externalserviceid`, `functionname`) VALUES
(1, 1, 'moodle_enrol_get_users_courses'),
(2, 1, 'moodle_enrol_get_enrolled_users'),
(3, 1, 'moodle_user_get_users_by_id'),
(4, 1, 'moodle_webservice_get_siteinfo'),
(5, 1, 'moodle_notes_create_notes'),
(6, 1, 'moodle_user_get_course_participants_by_id'),
(7, 1, 'moodle_user_get_users_by_courseid'),
(8, 1, 'moodle_message_send_instantmessages');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_external_services_users`
--

CREATE TABLE IF NOT EXISTS `mdl_external_services_users` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `externalserviceid` bigint(10) unsigned NOT NULL,
  `userid` bigint(10) unsigned NOT NULL,
  `iprestriction` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `validuntil` bigint(10) unsigned DEFAULT NULL,
  `timecreated` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_exteservuser_ext_ix` (`externalserviceid`),
  KEY `mdl_exteservuser_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='users allowed to use services with restricted users flag' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_external_tokens`
--

CREATE TABLE IF NOT EXISTS `mdl_external_tokens` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tokentype` smallint(4) unsigned NOT NULL,
  `userid` bigint(10) unsigned NOT NULL,
  `externalserviceid` bigint(10) unsigned NOT NULL,
  `sid` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contextid` bigint(10) unsigned NOT NULL,
  `creatorid` bigint(20) unsigned NOT NULL DEFAULT '1',
  `iprestriction` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `validuntil` bigint(10) unsigned DEFAULT NULL,
  `timecreated` bigint(10) unsigned NOT NULL,
  `lastaccess` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_extetoke_use_ix` (`userid`),
  KEY `mdl_extetoke_ext_ix` (`externalserviceid`),
  KEY `mdl_extetoke_con_ix` (`contextid`),
  KEY `mdl_extetoke_cre_ix` (`creatorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Security tokens for accessing of external services' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_feedback`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` text COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  `anonymous` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `email_notification` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `multiple_submit` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `autonumbering` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `site_after_submit` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `page_after_submit` text COLLATE utf8_unicode_ci NOT NULL,
  `page_after_submitformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `publish_stats` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `timeopen` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeclose` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `completionsubmit` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feed_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='all feedbacks' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_feedback_completed`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_completed` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `feedback` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `random_response` bigint(10) unsigned NOT NULL DEFAULT '0',
  `anonymous_response` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feedcomp_use_ix` (`userid`),
  KEY `mdl_feedcomp_fee_ix` (`feedback`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='filled out feedback' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_feedback_completedtmp`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_completedtmp` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `feedback` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `guestid` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `random_response` bigint(10) unsigned NOT NULL DEFAULT '0',
  `anonymous_response` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feedcomp_use2_ix` (`userid`),
  KEY `mdl_feedcomp_fee2_ix` (`feedback`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='filled out feedback' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_feedback_item`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_item` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `feedback` bigint(10) unsigned NOT NULL DEFAULT '0',
  `template` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `presentation` text COLLATE utf8_unicode_ci NOT NULL,
  `typ` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `hasvalue` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `position` smallint(3) unsigned NOT NULL DEFAULT '0',
  `required` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dependitem` bigint(10) unsigned NOT NULL DEFAULT '0',
  `dependvalue` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `options` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_feeditem_fee_ix` (`feedback`),
  KEY `mdl_feeditem_tem_ix` (`template`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='feedback_items' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_feedback_sitecourse_map`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_sitecourse_map` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `feedbackid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `courseid` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feedsitemap_cou_ix` (`courseid`),
  KEY `mdl_feedsitemap_fee_ix` (`feedbackid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='feedback sitecourse map' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_feedback_template`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_template` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `ispublic` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_feedtemp_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='templates of feedbackstructures' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_feedback_tracking`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_tracking` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `feedback` bigint(10) unsigned NOT NULL DEFAULT '0',
  `completed` bigint(10) unsigned NOT NULL DEFAULT '0',
  `tmp_completed` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feedtrac_use_ix` (`userid`),
  KEY `mdl_feedtrac_fee_ix` (`feedback`),
  KEY `mdl_feedtrac_com_ix` (`completed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='feedback trackingdata' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_feedback_value`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_value` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` bigint(10) unsigned NOT NULL DEFAULT '0',
  `item` bigint(10) unsigned NOT NULL DEFAULT '0',
  `completed` bigint(10) unsigned NOT NULL DEFAULT '0',
  `tmp_completed` bigint(10) unsigned NOT NULL DEFAULT '0',
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_feedvalu_cou_ix` (`course_id`),
  KEY `mdl_feedvalu_ite_ix` (`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='values of the completeds' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_feedback_valuetmp`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_valuetmp` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` bigint(10) unsigned NOT NULL DEFAULT '0',
  `item` bigint(10) unsigned NOT NULL DEFAULT '0',
  `completed` bigint(10) unsigned NOT NULL DEFAULT '0',
  `tmp_completed` bigint(10) unsigned NOT NULL DEFAULT '0',
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_feedvalu_cou2_ix` (`course_id`),
  KEY `mdl_feedvalu_ite2_ix` (`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='values of the completedstmp' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_files`
--

CREATE TABLE IF NOT EXISTS `mdl_files` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `contenthash` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pathnamehash` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contextid` bigint(10) unsigned NOT NULL,
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `filearea` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) unsigned NOT NULL,
  `filepath` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `userid` bigint(10) unsigned DEFAULT NULL,
  `filesize` bigint(10) unsigned NOT NULL,
  `mimetype` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` bigint(10) unsigned NOT NULL DEFAULT '0',
  `source` text COLLATE utf8_unicode_ci,
  `author` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `license` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timecreated` bigint(10) unsigned NOT NULL,
  `timemodified` bigint(10) unsigned NOT NULL,
  `sortorder` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_file_pat_uix` (`pathnamehash`),
  KEY `mdl_file_comfilconite_ix` (`component`,`filearea`,`contextid`,`itemid`),
  KEY `mdl_file_con_ix` (`contenthash`),
  KEY `mdl_file_con2_ix` (`contextid`),
  KEY `mdl_file_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='description of files, content is stored in sha1 file pool' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_filter_active`
--

CREATE TABLE IF NOT EXISTS `mdl_filter_active` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `filter` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contextid` bigint(10) unsigned NOT NULL,
  `active` smallint(4) NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_filtacti_confil_uix` (`contextid`,`filter`),
  KEY `mdl_filtacti_con_ix` (`contextid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores information about which filters are active in which c' AUTO_INCREMENT=13 ;

--
-- Volcado de datos para la tabla `mdl_filter_active`
--

INSERT INTO `mdl_filter_active` (`id`, `filter`, `contextid`, `active`, `sortorder`) VALUES
(1, 'mod/data', 1, -9999, 1),
(2, 'mod/glossary', 1, -9999, 2),
(3, 'filter/activitynames', 1, -9999, 3),
(4, 'filter/censor', 1, -9999, 4),
(5, 'filter/mediaplugin', 1, -9999, 5),
(6, 'filter/multilang', 1, -9999, 6),
(7, 'filter/urltolink', 1, -9999, 7),
(8, 'filter/tidy', 1, -9999, 8),
(9, 'filter/emoticon', 1, -9999, 9),
(10, 'filter/algebra', 1, -9999, 10),
(11, 'filter/tex', 1, -9999, 11),
(12, 'filter/emailprotect', 1, -9999, 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_filter_config`
--

CREATE TABLE IF NOT EXISTS `mdl_filter_config` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `filter` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contextid` bigint(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_filtconf_confilnam_uix` (`contextid`,`filter`,`name`),
  KEY `mdl_filtconf_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores per-context configuration settings for filters which ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_folder`
--

CREATE TABLE IF NOT EXISTS `mdl_folder` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` text COLLATE utf8_unicode_ci,
  `introformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  `revision` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_fold_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='each record is one folder resource' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_forum`
--

CREATE TABLE IF NOT EXISTS `mdl_forum` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'general',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` text COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  `assessed` bigint(10) unsigned NOT NULL DEFAULT '0',
  `assesstimestart` bigint(10) unsigned NOT NULL DEFAULT '0',
  `assesstimefinish` bigint(10) unsigned NOT NULL DEFAULT '0',
  `scale` bigint(10) NOT NULL DEFAULT '0',
  `maxbytes` bigint(10) unsigned NOT NULL DEFAULT '0',
  `maxattachments` bigint(10) unsigned NOT NULL DEFAULT '1',
  `forcesubscribe` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `trackingtype` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `rsstype` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `rssarticles` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `warnafter` bigint(10) unsigned NOT NULL DEFAULT '0',
  `blockafter` bigint(10) unsigned NOT NULL DEFAULT '0',
  `blockperiod` bigint(10) unsigned NOT NULL DEFAULT '0',
  `completiondiscussions` int(9) unsigned NOT NULL DEFAULT '0',
  `completionreplies` int(9) unsigned NOT NULL DEFAULT '0',
  `completionposts` int(9) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_foru_cou_ix` (`course`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Forums contain and structure discussion' AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `mdl_forum`
--

INSERT INTO `mdl_forum` (`id`, `course`, `type`, `name`, `intro`, `introformat`, `assessed`, `assesstimestart`, `assesstimefinish`, `scale`, `maxbytes`, `maxattachments`, `forcesubscribe`, `trackingtype`, `rsstype`, `rssarticles`, `timemodified`, `warnafter`, `blockafter`, `blockperiod`, `completiondiscussions`, `completionreplies`, `completionposts`) VALUES
(1, 1, 'news', 'Cartelera', 'Cartelera', 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1317396423, 0, 0, 0, 0, 0, 0),
(2, 2, 'news', 'Novedades', 'Novedades y anuncios', 0, 0, 0, 0, 1, 0, 1, 1, 1, 0, 0, 1316810832, 0, 0, 0, 0, 0, 0),
(3, 3, 'news', 'Novedades', 'Cartelera', 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1317391095, 0, 0, 0, 0, 0, 0),
(4, 4, 'news', 'Novedades', 'Cartelera', 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1317396505, 0, 0, 0, 0, 0, 0),
(5, 1, 'blog', 'Foro General de la Red', '<p>Foro Posta</p>', 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1317936873, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_forum_discussions`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_discussions` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `forum` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `firstpost` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '-1',
  `assessed` tinyint(1) NOT NULL DEFAULT '1',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `usermodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timestart` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeend` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_forudisc_use_ix` (`userid`),
  KEY `mdl_forudisc_for_ix` (`forum`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Forums are composed of discussions' AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `mdl_forum_discussions`
--

INSERT INTO `mdl_forum_discussions` (`id`, `course`, `forum`, `name`, `firstpost`, `userid`, `groupid`, `assessed`, `timemodified`, `usermodified`, `timestart`, `timeend`) VALUES
(2, 2, 2, 'Tema 1', 2, 2, -1, 1, 1316813778, 2, 0, 0),
(3, 1, 1, 'Cartelera mensaje 1', 3, 12, -1, 1, 1317332152, 12, 0, 0),
(4, 1, 5, 'ghrfhrfghd', 4, 2, -1, 1, 1317936896, 2, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_forum_posts`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_posts` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `discussion` bigint(10) unsigned NOT NULL DEFAULT '0',
  `parent` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `created` bigint(10) unsigned NOT NULL DEFAULT '0',
  `modified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `mailed` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `messageformat` tinyint(2) NOT NULL DEFAULT '0',
  `messagetrust` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `attachment` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `totalscore` smallint(4) NOT NULL DEFAULT '0',
  `mailnow` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_forupost_use_ix` (`userid`),
  KEY `mdl_forupost_cre_ix` (`created`),
  KEY `mdl_forupost_mai_ix` (`mailed`),
  KEY `mdl_forupost_dis_ix` (`discussion`),
  KEY `mdl_forupost_par_ix` (`parent`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='All posts are stored in this table' AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `mdl_forum_posts`
--

INSERT INTO `mdl_forum_posts` (`id`, `discussion`, `parent`, `userid`, `created`, `modified`, `mailed`, `subject`, `message`, `messageformat`, `messagetrust`, `attachment`, `totalscore`, `mailnow`) VALUES
(2, 2, 0, 2, 1316813778, 1316813778, 0, 'Tema 1', '<p>sdfsadgf adsf dsfg dfs sdfd</p>', 1, 0, '', 0, 0),
(3, 3, 0, 12, 1317332152, 1317332152, 0, 'Cartelera mensaje 1', '<p>Hola</p>', 1, 0, '', 0, 0),
(4, 4, 0, 2, 1317936896, 1317936896, 0, 'ghrfhrfghd', '<p>hghjg</p>', 1, 0, '', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_forum_queue`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_queue` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `discussionid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `postid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_foruqueu_use_ix` (`userid`),
  KEY `mdl_foruqueu_dis_ix` (`discussionid`),
  KEY `mdl_foruqueu_pos_ix` (`postid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='For keeping track of posts that will be mailed in digest for' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_forum_read`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_read` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `forumid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `discussionid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `postid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `firstread` bigint(10) unsigned NOT NULL DEFAULT '0',
  `lastread` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_foruread_usefor_ix` (`userid`,`forumid`),
  KEY `mdl_foruread_usedis_ix` (`userid`,`discussionid`),
  KEY `mdl_foruread_usepos_ix` (`userid`,`postid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tracks each users read posts' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_forum_subscriptions`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_subscriptions` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `forum` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_forusubs_use_ix` (`userid`),
  KEY `mdl_forusubs_for_ix` (`forum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Keeps track of who is subscribed to what forum' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_forum_track_prefs`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_track_prefs` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `forumid` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_forutracpref_usefor_ix` (`userid`,`forumid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tracks each users untracked forums' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_glossary`
--

CREATE TABLE IF NOT EXISTS `mdl_glossary` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` text COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  `allowduplicatedentries` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `displayformat` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'dictionary',
  `mainglossary` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `showspecial` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `showalphabet` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `showall` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `allowcomments` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `allowprintview` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `usedynalink` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `defaultapproval` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `globalglossary` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `entbypage` smallint(3) unsigned NOT NULL DEFAULT '10',
  `editalways` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `rsstype` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `rssarticles` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `assessed` bigint(10) unsigned NOT NULL DEFAULT '0',
  `assesstimestart` bigint(10) unsigned NOT NULL DEFAULT '0',
  `assesstimefinish` bigint(10) unsigned NOT NULL DEFAULT '0',
  `scale` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `completionentries` int(9) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_glos_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='all glossaries' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_glossary_alias`
--

CREATE TABLE IF NOT EXISTS `mdl_glossary_alias` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `entryid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_glosalia_ent_ix` (`entryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='entries alias' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_glossary_categories`
--

CREATE TABLE IF NOT EXISTS `mdl_glossary_categories` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `glossaryid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `usedynalink` tinyint(2) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_gloscate_glo_ix` (`glossaryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='all categories for glossary entries' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_glossary_entries`
--

CREATE TABLE IF NOT EXISTS `mdl_glossary_entries` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `glossaryid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `concept` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `definition` text COLLATE utf8_unicode_ci NOT NULL,
  `definitionformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `definitiontrust` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `attachment` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `teacherentry` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `sourceglossaryid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `usedynalink` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `casesensitive` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `fullmatch` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `approved` tinyint(2) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_glosentr_use_ix` (`userid`),
  KEY `mdl_glosentr_con_ix` (`concept`),
  KEY `mdl_glosentr_glo_ix` (`glossaryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='all glossary entries' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_glossary_entries_categories`
--

CREATE TABLE IF NOT EXISTS `mdl_glossary_entries_categories` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `categoryid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `entryid` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_glosentrcate_cat_ix` (`categoryid`),
  KEY `mdl_glosentrcate_ent_ix` (`entryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='categories of each glossary entry' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_glossary_formats`
--

CREATE TABLE IF NOT EXISTS `mdl_glossary_formats` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `popupformatname` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `visible` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `showgroup` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `defaultmode` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `defaulthook` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sortkey` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sortorder` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Setting of the display formats' AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `mdl_glossary_formats`
--

INSERT INTO `mdl_glossary_formats` (`id`, `name`, `popupformatname`, `visible`, `showgroup`, `defaultmode`, `defaulthook`, `sortkey`, `sortorder`) VALUES
(1, 'continuous', 'continuous', 1, 1, '', '', '', ''),
(2, 'dictionary', 'dictionary', 1, 1, '', '', '', ''),
(3, 'encyclopedia', 'encyclopedia', 1, 1, '', '', '', ''),
(4, 'entrylist', 'entrylist', 1, 1, '', '', '', ''),
(5, 'faq', 'faq', 1, 1, '', '', '', ''),
(6, 'fullwithauthor', 'fullwithauthor', 1, 1, '', '', '', ''),
(7, 'fullwithoutauthor', 'fullwithoutauthor', 1, 1, '', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_grade_categories`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_categories` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) unsigned NOT NULL,
  `parent` bigint(10) unsigned DEFAULT NULL,
  `depth` bigint(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `aggregation` bigint(10) NOT NULL DEFAULT '0',
  `keephigh` bigint(10) NOT NULL DEFAULT '0',
  `droplow` bigint(10) NOT NULL DEFAULT '0',
  `aggregateonlygraded` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `aggregateoutcomes` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `aggregatesubcats` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `timecreated` bigint(10) unsigned NOT NULL,
  `timemodified` bigint(10) unsigned NOT NULL,
  `hidden` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradcate_cou_ix` (`courseid`),
  KEY `mdl_gradcate_par_ix` (`parent`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table keeps information about categories, used for grou' AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `mdl_grade_categories`
--

INSERT INTO `mdl_grade_categories` (`id`, `courseid`, `parent`, `depth`, `path`, `fullname`, `aggregation`, `keephigh`, `droplow`, `aggregateonlygraded`, `aggregateoutcomes`, `aggregatesubcats`, `timecreated`, `timemodified`, `hidden`) VALUES
(1, 1, NULL, 1, '/1/', '?', 11, 0, 0, 1, 0, 0, 1317331334, 1317331335, 0),
(2, 4, NULL, 1, '/2/', '?', 11, 0, 0, 1, 0, 0, 1317396466, 1317396466, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_grade_categories_history`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_categories_history` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `action` bigint(10) unsigned NOT NULL DEFAULT '0',
  `oldid` bigint(10) unsigned NOT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timemodified` bigint(10) unsigned DEFAULT NULL,
  `loggeduser` bigint(10) unsigned DEFAULT NULL,
  `courseid` bigint(10) unsigned NOT NULL,
  `parent` bigint(10) unsigned DEFAULT NULL,
  `depth` bigint(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `aggregation` bigint(10) NOT NULL DEFAULT '0',
  `keephigh` bigint(10) NOT NULL DEFAULT '0',
  `droplow` bigint(10) NOT NULL DEFAULT '0',
  `aggregateonlygraded` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `aggregateoutcomes` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `aggregatesubcats` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradcatehist_act_ix` (`action`),
  KEY `mdl_gradcatehist_old_ix` (`oldid`),
  KEY `mdl_gradcatehist_cou_ix` (`courseid`),
  KEY `mdl_gradcatehist_par_ix` (`parent`),
  KEY `mdl_gradcatehist_log_ix` (`loggeduser`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='History of grade_categories' AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `mdl_grade_categories_history`
--

INSERT INTO `mdl_grade_categories_history` (`id`, `action`, `oldid`, `source`, `timemodified`, `loggeduser`, `courseid`, `parent`, `depth`, `path`, `fullname`, `aggregation`, `keephigh`, `droplow`, `aggregateonlygraded`, `aggregateoutcomes`, `aggregatesubcats`) VALUES
(1, 1, 1, 'system', 1317331334, 2, 1, NULL, 0, NULL, '?', 11, 0, 0, 1, 0, 0),
(2, 2, 1, 'system', 1317331335, 2, 1, NULL, 1, '/1/', '?', 11, 0, 0, 1, 0, 0),
(3, 1, 2, 'system', 1317396466, 2, 4, NULL, 0, NULL, '?', 11, 0, 0, 1, 0, 0),
(4, 2, 2, 'system', 1317396466, 2, 4, NULL, 1, '/2/', '?', 11, 0, 0, 1, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_grade_grades`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_grades` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `itemid` bigint(10) unsigned NOT NULL,
  `userid` bigint(10) unsigned NOT NULL,
  `rawgrade` decimal(10,5) DEFAULT NULL,
  `rawgrademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `rawgrademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `rawscaleid` bigint(10) unsigned DEFAULT NULL,
  `usermodified` bigint(10) unsigned DEFAULT NULL,
  `finalgrade` decimal(10,5) DEFAULT NULL,
  `hidden` bigint(10) unsigned NOT NULL DEFAULT '0',
  `locked` bigint(10) unsigned NOT NULL DEFAULT '0',
  `locktime` bigint(10) unsigned NOT NULL DEFAULT '0',
  `exported` bigint(10) unsigned NOT NULL DEFAULT '0',
  `overridden` bigint(10) unsigned NOT NULL DEFAULT '0',
  `excluded` bigint(10) unsigned NOT NULL DEFAULT '0',
  `feedback` mediumtext COLLATE utf8_unicode_ci,
  `feedbackformat` bigint(10) unsigned NOT NULL DEFAULT '0',
  `information` mediumtext COLLATE utf8_unicode_ci,
  `informationformat` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timecreated` bigint(10) unsigned DEFAULT NULL,
  `timemodified` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradgrad_useite_uix` (`userid`,`itemid`),
  KEY `mdl_gradgrad_locloc_ix` (`locked`,`locktime`),
  KEY `mdl_gradgrad_ite_ix` (`itemid`),
  KEY `mdl_gradgrad_use_ix` (`userid`),
  KEY `mdl_gradgrad_raw_ix` (`rawscaleid`),
  KEY `mdl_gradgrad_use2_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='grade_grades  This table keeps individual grades for each us' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_grade_grades_history`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_grades_history` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `action` bigint(10) unsigned NOT NULL DEFAULT '0',
  `oldid` bigint(10) unsigned NOT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timemodified` bigint(10) unsigned DEFAULT NULL,
  `loggeduser` bigint(10) unsigned DEFAULT NULL,
  `itemid` bigint(10) unsigned NOT NULL,
  `userid` bigint(10) unsigned NOT NULL,
  `rawgrade` decimal(10,5) DEFAULT NULL,
  `rawgrademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `rawgrademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `rawscaleid` bigint(10) unsigned DEFAULT NULL,
  `usermodified` bigint(10) unsigned DEFAULT NULL,
  `finalgrade` decimal(10,5) DEFAULT NULL,
  `hidden` bigint(10) unsigned NOT NULL DEFAULT '0',
  `locked` bigint(10) unsigned NOT NULL DEFAULT '0',
  `locktime` bigint(10) unsigned NOT NULL DEFAULT '0',
  `exported` bigint(10) unsigned NOT NULL DEFAULT '0',
  `overridden` bigint(10) unsigned NOT NULL DEFAULT '0',
  `excluded` bigint(10) unsigned NOT NULL DEFAULT '0',
  `feedback` mediumtext COLLATE utf8_unicode_ci,
  `feedbackformat` bigint(10) unsigned NOT NULL DEFAULT '0',
  `information` mediumtext COLLATE utf8_unicode_ci,
  `informationformat` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradgradhist_act_ix` (`action`),
  KEY `mdl_gradgradhist_old_ix` (`oldid`),
  KEY `mdl_gradgradhist_ite_ix` (`itemid`),
  KEY `mdl_gradgradhist_use_ix` (`userid`),
  KEY `mdl_gradgradhist_raw_ix` (`rawscaleid`),
  KEY `mdl_gradgradhist_use2_ix` (`usermodified`),
  KEY `mdl_gradgradhist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='History table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_grade_import_newitem`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_import_newitem` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `itemname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `importcode` bigint(10) unsigned NOT NULL,
  `importer` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradimponewi_imp_ix` (`importer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='temporary table for storing new grade_item names from grade ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_grade_import_values`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_import_values` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `itemid` bigint(10) unsigned DEFAULT NULL,
  `newgradeitem` bigint(10) unsigned DEFAULT NULL,
  `userid` bigint(10) unsigned NOT NULL,
  `finalgrade` decimal(10,5) DEFAULT NULL,
  `feedback` mediumtext COLLATE utf8_unicode_ci,
  `importcode` bigint(10) unsigned NOT NULL,
  `importer` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradimpovalu_ite_ix` (`itemid`),
  KEY `mdl_gradimpovalu_new_ix` (`newgradeitem`),
  KEY `mdl_gradimpovalu_imp_ix` (`importer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Temporary table for importing grades' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_grade_items`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_items` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) unsigned DEFAULT NULL,
  `categoryid` bigint(10) unsigned DEFAULT NULL,
  `itemname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `itemtype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemmodule` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `iteminstance` bigint(10) unsigned DEFAULT NULL,
  `itemnumber` bigint(10) unsigned DEFAULT NULL,
  `iteminfo` mediumtext COLLATE utf8_unicode_ci,
  `idnumber` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `calculation` mediumtext COLLATE utf8_unicode_ci,
  `gradetype` smallint(4) NOT NULL DEFAULT '1',
  `grademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `grademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `scaleid` bigint(10) unsigned DEFAULT NULL,
  `outcomeid` bigint(10) unsigned DEFAULT NULL,
  `gradepass` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `multfactor` decimal(10,5) NOT NULL DEFAULT '1.00000',
  `plusfactor` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `aggregationcoef` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `display` bigint(10) NOT NULL DEFAULT '0',
  `decimals` tinyint(1) unsigned DEFAULT NULL,
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) unsigned NOT NULL DEFAULT '0',
  `needsupdate` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) unsigned DEFAULT NULL,
  `timemodified` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_graditem_locloc_ix` (`locked`,`locktime`),
  KEY `mdl_graditem_itenee_ix` (`itemtype`,`needsupdate`),
  KEY `mdl_graditem_gra_ix` (`gradetype`),
  KEY `mdl_graditem_idncou_ix` (`idnumber`,`courseid`),
  KEY `mdl_graditem_cou_ix` (`courseid`),
  KEY `mdl_graditem_cat_ix` (`categoryid`),
  KEY `mdl_graditem_sca_ix` (`scaleid`),
  KEY `mdl_graditem_out_ix` (`outcomeid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table keeps information about gradeable items (ie colum' AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `mdl_grade_items`
--

INSERT INTO `mdl_grade_items` (`id`, `courseid`, `categoryid`, `itemname`, `itemtype`, `itemmodule`, `iteminstance`, `itemnumber`, `iteminfo`, `idnumber`, `calculation`, `gradetype`, `grademax`, `grademin`, `scaleid`, `outcomeid`, `gradepass`, `multfactor`, `plusfactor`, `aggregationcoef`, `sortorder`, `display`, `decimals`, `hidden`, `locked`, `locktime`, `needsupdate`, `timecreated`, `timemodified`) VALUES
(1, 1, NULL, NULL, 'course', NULL, 1, NULL, NULL, NULL, NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 1, 0, NULL, 0, 0, 0, 0, 1317331334, 1317331334),
(2, 4, NULL, NULL, 'course', NULL, 2, NULL, NULL, NULL, NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 1, 0, NULL, 0, 0, 0, 0, 1317396466, 1317396466);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_grade_items_history`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_items_history` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `action` bigint(10) unsigned NOT NULL DEFAULT '0',
  `oldid` bigint(10) unsigned NOT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timemodified` bigint(10) unsigned DEFAULT NULL,
  `loggeduser` bigint(10) unsigned DEFAULT NULL,
  `courseid` bigint(10) unsigned DEFAULT NULL,
  `categoryid` bigint(10) unsigned DEFAULT NULL,
  `itemname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `itemtype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemmodule` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `iteminstance` bigint(10) unsigned DEFAULT NULL,
  `itemnumber` bigint(10) unsigned DEFAULT NULL,
  `iteminfo` mediumtext COLLATE utf8_unicode_ci,
  `idnumber` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `calculation` mediumtext COLLATE utf8_unicode_ci,
  `gradetype` smallint(4) NOT NULL DEFAULT '1',
  `grademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `grademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `scaleid` bigint(10) unsigned DEFAULT NULL,
  `outcomeid` bigint(10) unsigned DEFAULT NULL,
  `gradepass` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `multfactor` decimal(10,5) NOT NULL DEFAULT '1.00000',
  `plusfactor` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `aggregationcoef` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) unsigned NOT NULL DEFAULT '0',
  `needsupdate` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_graditemhist_act_ix` (`action`),
  KEY `mdl_graditemhist_old_ix` (`oldid`),
  KEY `mdl_graditemhist_cou_ix` (`courseid`),
  KEY `mdl_graditemhist_cat_ix` (`categoryid`),
  KEY `mdl_graditemhist_sca_ix` (`scaleid`),
  KEY `mdl_graditemhist_out_ix` (`outcomeid`),
  KEY `mdl_graditemhist_log_ix` (`loggeduser`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='History of grade_items' AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `mdl_grade_items_history`
--

INSERT INTO `mdl_grade_items_history` (`id`, `action`, `oldid`, `source`, `timemodified`, `loggeduser`, `courseid`, `categoryid`, `itemname`, `itemtype`, `itemmodule`, `iteminstance`, `itemnumber`, `iteminfo`, `idnumber`, `calculation`, `gradetype`, `grademax`, `grademin`, `scaleid`, `outcomeid`, `gradepass`, `multfactor`, `plusfactor`, `aggregationcoef`, `sortorder`, `hidden`, `locked`, `locktime`, `needsupdate`) VALUES
(1, 1, 1, 'system', 1317331334, 2, 1, NULL, NULL, 'course', NULL, 1, NULL, NULL, NULL, NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 1, 0, 0, 0, 1),
(2, 1, 2, 'system', 1317396466, 2, 4, NULL, NULL, 'course', NULL, 2, NULL, NULL, NULL, NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 1, 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_grade_letters`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_letters` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) unsigned NOT NULL,
  `lowerboundary` decimal(10,5) NOT NULL,
  `letter` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradlett_conlowlet_uix` (`contextid`,`lowerboundary`,`letter`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Repository for grade letters, for courses and other moodle e' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_grade_outcomes`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_outcomes` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) unsigned DEFAULT NULL,
  `shortname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fullname` text COLLATE utf8_unicode_ci NOT NULL,
  `scaleid` bigint(10) unsigned DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `timecreated` bigint(10) unsigned DEFAULT NULL,
  `timemodified` bigint(10) unsigned DEFAULT NULL,
  `usermodified` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradoutc_cousho_uix` (`courseid`,`shortname`),
  KEY `mdl_gradoutc_cou_ix` (`courseid`),
  KEY `mdl_gradoutc_sca_ix` (`scaleid`),
  KEY `mdl_gradoutc_use_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table describes the outcomes used in the system. An out' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_grade_outcomes_courses`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_outcomes_courses` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) unsigned NOT NULL,
  `outcomeid` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradoutccour_couout_uix` (`courseid`,`outcomeid`),
  KEY `mdl_gradoutccour_cou_ix` (`courseid`),
  KEY `mdl_gradoutccour_out_ix` (`outcomeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='stores what outcomes are used in what courses.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_grade_outcomes_history`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_outcomes_history` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `action` bigint(10) unsigned NOT NULL DEFAULT '0',
  `oldid` bigint(10) unsigned NOT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timemodified` bigint(10) unsigned DEFAULT NULL,
  `loggeduser` bigint(10) unsigned DEFAULT NULL,
  `courseid` bigint(10) unsigned DEFAULT NULL,
  `shortname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fullname` text COLLATE utf8_unicode_ci NOT NULL,
  `scaleid` bigint(10) unsigned DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_gradoutchist_act_ix` (`action`),
  KEY `mdl_gradoutchist_old_ix` (`oldid`),
  KEY `mdl_gradoutchist_cou_ix` (`courseid`),
  KEY `mdl_gradoutchist_sca_ix` (`scaleid`),
  KEY `mdl_gradoutchist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='History table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_grade_settings`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_settings` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradsett_counam_uix` (`courseid`,`name`),
  KEY `mdl_gradsett_cou_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='gradebook settings' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_groupings`
--

CREATE TABLE IF NOT EXISTS `mdl_groupings` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `configdata` text COLLATE utf8_unicode_ci,
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_grou_cou2_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='A grouping is a collection of groups. WAS: groups_groupings' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_groupings_groups`
--

CREATE TABLE IF NOT EXISTS `mdl_groupings_groups` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupingid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `groupid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeadded` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_grougrou_gro_ix` (`groupingid`),
  KEY `mdl_grougrou_gro2_ix` (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Link a grouping to a group (note, groups can be in multiple ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_groups`
--

CREATE TABLE IF NOT EXISTS `mdl_groups` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) unsigned NOT NULL,
  `name` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `enrolmentkey` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picture` bigint(10) unsigned NOT NULL DEFAULT '0',
  `hidepicture` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_grou_cou_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each record represents a group.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_groups_members`
--

CREATE TABLE IF NOT EXISTS `mdl_groups_members` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeadded` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_groumemb_gro_ix` (`groupid`),
  KEY `mdl_groumemb_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Link a user to a group.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_imscp`
--

CREATE TABLE IF NOT EXISTS `mdl_imscp` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` text COLLATE utf8_unicode_ci,
  `introformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  `revision` bigint(10) unsigned NOT NULL DEFAULT '0',
  `keepold` bigint(10) NOT NULL DEFAULT '-1',
  `structure` mediumtext COLLATE utf8_unicode_ci,
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_imsc_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='each record is one imscp resource' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_label`
--

CREATE TABLE IF NOT EXISTS `mdl_label` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` text COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) unsigned DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_labe_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines labels' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_lesson`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `practice` smallint(3) unsigned NOT NULL DEFAULT '0',
  `modattempts` smallint(3) unsigned NOT NULL DEFAULT '0',
  `usepassword` smallint(3) unsigned NOT NULL DEFAULT '0',
  `password` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dependency` bigint(10) unsigned NOT NULL DEFAULT '0',
  `conditions` text COLLATE utf8_unicode_ci NOT NULL,
  `grade` smallint(3) NOT NULL DEFAULT '0',
  `custom` smallint(3) unsigned NOT NULL DEFAULT '0',
  `ongoing` smallint(3) unsigned NOT NULL DEFAULT '0',
  `usemaxgrade` smallint(3) NOT NULL DEFAULT '0',
  `maxanswers` smallint(3) unsigned NOT NULL DEFAULT '4',
  `maxattempts` smallint(3) unsigned NOT NULL DEFAULT '5',
  `review` smallint(3) unsigned NOT NULL DEFAULT '0',
  `nextpagedefault` smallint(3) unsigned NOT NULL DEFAULT '0',
  `feedback` smallint(3) unsigned NOT NULL DEFAULT '1',
  `minquestions` smallint(3) unsigned NOT NULL DEFAULT '0',
  `maxpages` smallint(3) unsigned NOT NULL DEFAULT '0',
  `timed` smallint(3) unsigned NOT NULL DEFAULT '0',
  `maxtime` bigint(10) unsigned NOT NULL DEFAULT '0',
  `retake` smallint(3) unsigned NOT NULL DEFAULT '1',
  `activitylink` bigint(10) unsigned NOT NULL DEFAULT '0',
  `mediafile` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mediaheight` bigint(10) unsigned NOT NULL DEFAULT '100',
  `mediawidth` bigint(10) unsigned NOT NULL DEFAULT '650',
  `mediaclose` smallint(3) unsigned NOT NULL DEFAULT '0',
  `slideshow` smallint(3) unsigned NOT NULL DEFAULT '0',
  `width` bigint(10) unsigned NOT NULL DEFAULT '640',
  `height` bigint(10) unsigned NOT NULL DEFAULT '480',
  `bgcolor` varchar(7) COLLATE utf8_unicode_ci NOT NULL DEFAULT '#FFFFFF',
  `displayleft` smallint(3) unsigned NOT NULL DEFAULT '0',
  `displayleftif` smallint(3) unsigned NOT NULL DEFAULT '0',
  `progressbar` smallint(3) unsigned NOT NULL DEFAULT '0',
  `highscores` smallint(3) unsigned NOT NULL DEFAULT '0',
  `maxhighscores` bigint(10) unsigned NOT NULL DEFAULT '0',
  `available` bigint(10) unsigned NOT NULL DEFAULT '0',
  `deadline` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_less_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines lesson' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_lesson_answers`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_answers` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `pageid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `jumpto` bigint(11) NOT NULL DEFAULT '0',
  `grade` smallint(4) NOT NULL DEFAULT '0',
  `score` bigint(10) NOT NULL DEFAULT '0',
  `flags` smallint(3) unsigned NOT NULL DEFAULT '0',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `answer` text COLLATE utf8_unicode_ci,
  `answerformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `response` text COLLATE utf8_unicode_ci,
  `responseformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lessansw_les_ix` (`lessonid`),
  KEY `mdl_lessansw_pag_ix` (`pageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines lesson_answers' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_lesson_attempts`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_attempts` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `pageid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `answerid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `retry` smallint(3) unsigned NOT NULL DEFAULT '0',
  `correct` bigint(10) unsigned NOT NULL DEFAULT '0',
  `useranswer` text COLLATE utf8_unicode_ci,
  `timeseen` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lessatte_use_ix` (`userid`),
  KEY `mdl_lessatte_les_ix` (`lessonid`),
  KEY `mdl_lessatte_pag_ix` (`pageid`),
  KEY `mdl_lessatte_ans_ix` (`answerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines lesson_attempts' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_lesson_branch`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_branch` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `pageid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `retry` bigint(10) unsigned NOT NULL DEFAULT '0',
  `flag` smallint(3) unsigned NOT NULL DEFAULT '0',
  `timeseen` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lessbran_use_ix` (`userid`),
  KEY `mdl_lessbran_les_ix` (`lessonid`),
  KEY `mdl_lessbran_pag_ix` (`pageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='branches for each lesson/user' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_lesson_grades`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_grades` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `grade` double unsigned NOT NULL DEFAULT '0',
  `late` smallint(3) unsigned NOT NULL DEFAULT '0',
  `completed` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lessgrad_use_ix` (`userid`),
  KEY `mdl_lessgrad_les_ix` (`lessonid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines lesson_grades' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_lesson_high_scores`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_high_scores` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `gradeid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `nickname` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_lesshighscor_use_ix` (`userid`),
  KEY `mdl_lesshighscor_les_ix` (`lessonid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='high scores for each lesson' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_lesson_pages`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_pages` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `prevpageid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `nextpageid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `qtype` smallint(3) unsigned NOT NULL DEFAULT '0',
  `qoption` smallint(3) unsigned NOT NULL DEFAULT '0',
  `layout` smallint(3) unsigned NOT NULL DEFAULT '1',
  `display` smallint(3) unsigned NOT NULL DEFAULT '1',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contents` text COLLATE utf8_unicode_ci NOT NULL,
  `contentsformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lesspage_les_ix` (`lessonid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines lesson_pages' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_lesson_timer`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_timer` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `starttime` bigint(10) unsigned NOT NULL DEFAULT '0',
  `lessontime` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lesstime_use_ix` (`userid`),
  KEY `mdl_lesstime_les_ix` (`lessonid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='lesson timer for each lesson' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_license`
--

CREATE TABLE IF NOT EXISTS `mdl_license` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `shortname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fullname` text COLLATE utf8_unicode_ci,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `version` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='store licenses used by moodle' AUTO_INCREMENT=10 ;

--
-- Volcado de datos para la tabla `mdl_license`
--

INSERT INTO `mdl_license` (`id`, `shortname`, `fullname`, `source`, `enabled`, `version`) VALUES
(1, 'unknown', 'Unknown license', '', 1, 2010033100),
(2, 'allrightsreserved', 'All rights reserved', 'http://en.wikipedia.org/wiki/All_rights_reserved', 1, 2010033100),
(3, 'public', 'Public Domain', 'http://creativecommons.org/licenses/publicdomain/', 1, 2010033100),
(4, 'cc', 'Creative Commons', 'http://creativecommons.org/licenses/by/3.0/', 1, 2010033100),
(5, 'cc-nd', 'Creative Commons - NoDerivs', 'http://creativecommons.org/licenses/by-nd/3.0/', 1, 2010033100),
(6, 'cc-nc-nd', 'Creative Commons - No Commercial NoDerivs', 'http://creativecommons.org/licenses/by-nc-nd/3.0/', 1, 2010033100),
(7, 'cc-nc', 'Creative Commons - No Commercial', 'http://creativecommons.org/licenses/by-nd/3.0/', 1, 2010033100),
(8, 'cc-nc-sa', 'Creative Commons - No Commercial ShareAlike', 'http://creativecommons.org/licenses/by-nc-sa/3.0/', 1, 2010033100),
(9, 'cc-sa', 'Creative Commons - ShareAlike', 'http://creativecommons.org/licenses/by-sa/3.0/', 1, 2010033100);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_log`
--

CREATE TABLE IF NOT EXISTS `mdl_log` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `time` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `ip` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `module` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cmid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `action` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `info` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_log_coumodact_ix` (`course`,`module`,`action`),
  KEY `mdl_log_tim_ix` (`time`),
  KEY `mdl_log_act_ix` (`action`),
  KEY `mdl_log_usecou_ix` (`userid`,`course`),
  KEY `mdl_log_cmi_ix` (`cmid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Every action is logged as far as possible' AUTO_INCREMENT=1034 ;

--
-- Volcado de datos para la tabla `mdl_log`
--

INSERT INTO `mdl_log` (`id`, `time`, `userid`, `ip`, `course`, `module`, `cmid`, `action`, `url`, `info`) VALUES
(1, 1316567502, 2, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=2&course=1', ''),
(2, 1316568554, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(3, 1316638744, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(4, 1316638764, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(5, 1316639696, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(6, 1316641120, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(7, 1316641153, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(8, 1316641425, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(9, 1316641449, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(10, 1316641518, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(11, 1316643877, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(12, 1316643879, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(13, 1316644852, 0, '127.0.0.1', 1, 'library', 0, 'mailer', 'http://localhost/login/signup.php', 'ERROR: Could not instantiate mail function.'),
(14, 1316650434, 2, '127.0.0.1', 1, 'role', 0, 'delete', 'admin/roles/action=delete&roleid=4', 'Profesor sin permiso de edición'),
(15, 1316650434, 2, '127.0.0.1', 1, 'role', 0, 'delete', 'admin/roles/manage.php', 'Profesor sin permiso de edición'),
(16, 1316650443, 2, '127.0.0.1', 1, 'role', 0, 'delete', 'admin/roles/action=delete&roleid=2', 'Creador de curso'),
(17, 1316650443, 2, '127.0.0.1', 1, 'role', 0, 'delete', 'admin/roles/manage.php', 'Creador de curso'),
(18, 1316650455, 2, '127.0.0.1', 1, 'role', 0, 'delete', 'admin/roles/action=delete&roleid=1', 'Gestor'),
(19, 1316650455, 2, '127.0.0.1', 1, 'role', 0, 'delete', 'admin/roles/manage.php', 'Gestor'),
(20, 1316650537, 2, '127.0.0.1', 1, 'role', 0, 'delete', 'admin/roles/action=delete&roleid=8', 'Usuario identificado en la página principal'),
(21, 1316650537, 2, '127.0.0.1', 1, 'role', 0, 'delete', 'admin/roles/manage.php', 'Usuario identificado en la página principal'),
(22, 1316650562, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(23, 1316650566, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(24, 1316650567, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(25, 1316650568, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(26, 1316650573, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(27, 1316650592, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(28, 1316650593, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(29, 1316650859, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(30, 1316650860, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(31, 1316650862, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(32, 1316650863, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(33, 1316650869, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(34, 1316650870, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(35, 1316650872, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(36, 1316650914, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(37, 1316650915, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(38, 1316650920, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(39, 1316651048, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(40, 1316651048, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(41, 1316651062, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(42, 1316651070, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(43, 1316651071, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(44, 1316651074, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(45, 1316651074, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(46, 1316651075, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(47, 1316651088, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(48, 1316651092, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(49, 1316651092, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(50, 1316651093, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(51, 1316651101, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(52, 1316651116, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(53, 1316651117, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(54, 1316713856, 0, '127.0.0.1', 1, 'login', 0, 'error', 'index.php', 'damian1'),
(55, 1316713930, 0, '127.0.0.1', 1, 'library', 0, 'mailer', 'http://localhost/login/signup.php', 'ERROR: Could not instantiate mail function.'),
(56, 1316714434, 0, '127.0.0.1', 1, 'library', 0, 'mailer', 'http://localhost/login/signup.php', 'ERROR: Could not instantiate mail function.'),
(57, 1316714535, 0, '127.0.0.1', 1, 'library', 0, 'mailer', 'http://localhost/login/signup.php', 'ERROR: Could not instantiate mail function.'),
(58, 1316715353, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(59, 1316715354, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(60, 1316715411, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(61, 1316715424, 0, '127.0.0.1', 1, 'login', 0, 'error', 'index.php', 'damian8'),
(62, 1316715429, 0, '127.0.0.1', 1, 'login', 0, 'error', 'index.php', 'damian8'),
(63, 1316715547, 0, '127.0.0.1', 1, 'login', 0, 'error', 'index.php', 'damian7'),
(64, 1316715573, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(65, 1316715574, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(66, 1316715600, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(67, 1316715616, 9, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '9'),
(68, 1316715616, 9, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(69, 1316715627, 9, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=9&course=1', '9'),
(70, 1316715636, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(71, 1316715637, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(72, 1316715643, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(73, 1316715643, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(74, 1316715644, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(75, 1316715747, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(76, 1316715781, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(77, 1316715781, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(78, 1316715782, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(79, 1316715823, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(80, 1316715846, 2, '127.0.0.1', 1, 'forum', 1, 'add discussion', 'discuss.php?d=1', '1'),
(81, 1316715851, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(82, 1316715947, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(83, 1316715953, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(84, 1316715964, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(85, 1316715979, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(86, 1316716019, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(87, 1316716394, 0, '127.0.0.1', 1, 'forum', 1, 'view forum', 'view.php?id=1', '1'),
(88, 1316724743, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(89, 1316724745, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(90, 1316726060, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(91, 1316726746, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(92, 1316728578, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(93, 1316728580, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(94, 1316728743, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(95, 1316728778, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(96, 1316728783, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(97, 1316728786, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(98, 1316728789, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(99, 1316728795, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(100, 1316728798, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(101, 1316729154, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(102, 1316731376, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(103, 1316731382, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(104, 1316731416, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(105, 1316732447, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(106, 1316800115, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(107, 1316800117, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(108, 1316800147, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(109, 1316800162, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(110, 1316800163, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(111, 1316800548, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(112, 1316800617, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(113, 1316800624, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(114, 1316800687, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(115, 1316800697, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(116, 1316809503, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(117, 1316809514, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(118, 1316810065, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(119, 1316810078, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(120, 1316810615, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(121, 1316810794, 2, '127.0.0.1', 1, 'course', 0, 'new', 'view.php?id=2', 'Azcurra (ID 2)'),
(122, 1316810831, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(123, 1316811067, 2, '127.0.0.1', 1, 'role', 0, 'edit', 'admin/roles/define.php?action=view&roleid=7', 'Miembro'),
(124, 1316811085, 2, '127.0.0.1', 1, 'role', 0, 'edit', 'admin/roles/define.php?action=view&roleid=6', 'Visitante'),
(125, 1316811100, 2, '127.0.0.1', 1, 'role', 0, 'edit', 'admin/roles/define.php?action=view&roleid=5', 'Aprendiz'),
(126, 1316811114, 2, '127.0.0.1', 1, 'role', 0, 'edit', 'admin/roles/define.php?action=view&roleid=3', 'Mediador'),
(127, 1316811391, 2, '127.0.0.1', 1, 'role', 0, 'add', 'admin/roles/define.php?action=view&roleid=8', 'Adminstrador'),
(128, 1316811774, 2, '127.0.0.1', 1, 'role', 0, 'edit', 'admin/roles/define.php?action=view&roleid=8', 'Adminstrador'),
(129, 1316811858, 2, '127.0.0.1', 1, 'role', 0, 'edit', 'admin/roles/define.php?action=view&roleid=8', 'Adminstrador'),
(130, 1316813049, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(131, 1316813052, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(132, 1316813154, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(133, 1316813550, 2, '127.0.0.1', 2, 'course', 0, 'update', 'edit.php?id=2', '2'),
(134, 1316813555, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(135, 1316813732, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(136, 1316813750, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(137, 1316813750, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(138, 1316813778, 2, '127.0.0.1', 2, 'forum', 2, 'add discussion', 'discuss.php?d=2', '2'),
(139, 1316813780, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(140, 1316813786, 2, '127.0.0.1', 2, 'forum', 2, 'view forum', 'view.php?id=2', '2'),
(141, 1317244247, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(142, 1317244250, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(143, 1317244286, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(144, 1317244308, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(145, 1317244316, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(146, 1317244317, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(147, 1317244574, 2, '127.0.0.1', 1, 'role', 0, 'edit', 'admin/roles/define.php?action=view&roleid=8', 'Administrador'),
(148, 1317244617, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(149, 1317244666, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(150, 1317244672, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(151, 1317244863, 2, '127.0.0.1', 1, 'role', 0, 'edit', 'admin/roles/define.php?action=view&roleid=3', 'Mediador'),
(152, 1317244905, 2, '127.0.0.1', 1, 'role', 0, 'edit', 'admin/roles/define.php?action=view&roleid=5', 'Aprendiz'),
(153, 1317244923, 2, '127.0.0.1', 1, 'role', 0, 'edit', 'admin/roles/define.php?action=view&roleid=6', 'Visitante'),
(154, 1317244939, 2, '127.0.0.1', 1, 'role', 0, 'edit', 'admin/roles/define.php?action=view&roleid=7', 'Miembro'),
(155, 1317244969, 2, '127.0.0.1', 1, 'role', 0, 'edit', 'admin/roles/define.php?action=view&roleid=5', 'Aprendiz'),
(156, 1317245011, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(157, 1317245154, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(158, 1317245155, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(159, 1317245293, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(160, 1317245445, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(161, 1317245476, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(162, 1317245559, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(163, 1317245692, 2, '127.0.0.1', 1, 'role', 0, 'assign', 'admin/roles/assign.php?contextid=1&roleid=8', 'Administrador'),
(164, 1317245709, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(165, 1317245727, 12, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '12'),
(166, 1317245728, 12, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(167, 1317245827, 12, '127.0.0.1', 1, 'user', 0, 'view all', 'index.php?id=1', ''),
(168, 1317245841, 12, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(169, 1317245875, 12, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(170, 1317247691, 12, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '12'),
(171, 1317247693, 12, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(172, 1317247695, 12, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=12&course=1', '12'),
(173, 1317247696, 12, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(174, 1317247868, 12, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=12&course=1', '12'),
(175, 1317247878, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(176, 1317247879, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(177, 1317247983, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(178, 1317247988, 2, '127.0.0.1', 2, 'user', 0, 'view all', 'index.php?id=2', ''),
(179, 1317248167, 2, '127.0.0.1', 1, 'role', 0, 'edit allow assign', 'admin/roles/allow.php?mode=assign', ''),
(180, 1317248177, 2, '127.0.0.1', 1, 'role', 0, 'edit allow assign', 'admin/roles/allow.php?mode=assign', ''),
(181, 1317248198, 2, '127.0.0.1', 1, 'role', 0, 'edit allow assign', 'admin/roles/allow.php?mode=assign', ''),
(182, 1317248227, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(183, 1317325143, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(184, 1317325145, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(185, 1317325153, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(186, 1317325174, 0, '127.0.0.1', 1, 'login', 0, 'error', 'index.php', 'administradorpopper1'),
(187, 1317325182, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(188, 1317325183, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(189, 1317325259, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(190, 1317325264, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(191, 1317325265, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(192, 1317325295, 2, '127.0.0.1', 1, 'user', 0, 'change password', 'view.php?id=2&course=1', '2'),
(193, 1317325492, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(194, 1317325500, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(195, 1317325501, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(196, 1317325523, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(197, 1317325533, 11, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '11'),
(198, 1317325534, 11, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(199, 1317325860, 11, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=11&course=1', '11'),
(200, 1317325873, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(201, 1317325874, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(202, 1317325965, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(203, 1317326176, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(204, 1317326177, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(205, 1317326279, 2, '127.0.0.1', 1, 'role', 0, 'assign', 'admin/roles/assign.php?contextid=1&roleid=3', 'Mediador'),
(206, 1317326290, 2, '127.0.0.1', 1, 'role', 0, 'assign', 'admin/roles/assign.php?contextid=1&roleid=5', 'Aprendiz'),
(207, 1317326307, 2, '127.0.0.1', 1, 'role', 0, 'assign', 'admin/roles/assign.php?contextid=1&roleid=7', 'Miembro'),
(208, 1317326322, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(209, 1317326327, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(210, 1317326328, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(211, 1317326336, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(212, 1317326337, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(213, 1317326337, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(214, 1317326393, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(215, 1317326394, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(216, 1317326400, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(217, 1317326442, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(218, 1317326558, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(219, 1317326559, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(220, 1317326569, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(221, 1317326606, 2, '127.0.0.1', 1, 'forum', 1, 'view forum', 'view.php?id=1', '1'),
(222, 1317326618, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(223, 1317326638, 2, '127.0.0.1', 1, 'forum', 1, 'view forum', 'view.php?id=1', '1'),
(224, 1317326905, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(225, 1317326924, 2, '127.0.0.1', 2, 'user', 0, 'view all', 'index.php?id=2', ''),
(226, 1317327015, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(227, 1317327125, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(228, 1317327126, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(229, 1317327134, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(230, 1317327155, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(231, 1317327156, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(232, 1317327250, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(233, 1317327296, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(234, 1317327297, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(235, 1317327306, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(236, 1317327306, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(237, 1317327307, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(238, 1317327324, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(239, 1317327325, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(240, 1317327335, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(241, 1317327338, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(242, 1317327339, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(243, 1317327346, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(244, 1317327400, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(245, 1317327401, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(246, 1317327406, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(247, 1317327413, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(248, 1317327419, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(249, 1317327420, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(250, 1317327441, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(251, 1317327454, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(252, 1317327455, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(253, 1317327495, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(254, 1317327496, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(255, 1317327501, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(256, 1317327506, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(257, 1317327507, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(258, 1317327512, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(259, 1317327518, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(260, 1317327533, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(261, 1317327621, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(262, 1317327621, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(263, 1317327642, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(264, 1317327668, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(265, 1317327669, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(266, 1317327675, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(267, 1317327689, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(268, 1317327690, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(269, 1317327742, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(270, 1317327743, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(271, 1317327755, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(272, 1317327771, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(273, 1317327775, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(274, 1317327797, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(275, 1317327797, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(276, 1317327804, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(277, 1317327819, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(278, 1317327820, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(279, 1317327829, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(280, 1317327836, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(281, 1317327836, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(282, 1317327942, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(283, 1317327943, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(284, 1317327951, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(285, 1317327999, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(286, 1317328000, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(287, 1317328127, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(288, 1317328131, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(289, 1317328132, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(290, 1317328139, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(291, 1317328142, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(292, 1317328142, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(293, 1317328148, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(294, 1317328151, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(295, 1317328151, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(296, 1317328155, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(297, 1317328158, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(298, 1317328159, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(299, 1317328164, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(300, 1317328168, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(301, 1317328168, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(302, 1317328184, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(303, 1317328185, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(304, 1317328193, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(305, 1317328243, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(306, 1317328243, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(307, 1317328253, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(308, 1317328263, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(309, 1317328263, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(310, 1317328267, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(311, 1317328272, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(312, 1317328273, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(313, 1317328401, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(314, 1317328406, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(315, 1317328413, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(316, 1317328414, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(317, 1317328452, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(318, 1317328452, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(319, 1317328453, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(320, 1317328490, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(321, 1317328558, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(322, 1317328565, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(323, 1317328573, 12, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '12'),
(324, 1317328574, 12, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(325, 1317328597, 12, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(326, 1317328598, 12, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(327, 1317328598, 12, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(328, 1317328666, 12, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=12&course=1', '12'),
(329, 1317328679, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(330, 1317328680, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(331, 1317328689, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(332, 1317328689, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(333, 1317328690, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(334, 1317328792, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(335, 1317328803, 12, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '12'),
(336, 1317328804, 12, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(337, 1317328836, 12, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=12&course=1', '12'),
(338, 1317328850, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(339, 1317328851, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(340, 1317328861, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(341, 1317328862, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(342, 1317328862, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(343, 1317328925, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(344, 1317328930, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(345, 1317328947, 12, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '12'),
(346, 1317328948, 12, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(347, 1317328970, 12, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=12&course=1', '12'),
(348, 1317328978, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(349, 1317328979, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(350, 1317328986, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(351, 1317328986, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(352, 1317328987, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(353, 1317329151, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(354, 1317329162, 12, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '12'),
(355, 1317329163, 12, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(356, 1317329177, 12, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=12&course=1', '12'),
(357, 1317329187, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(358, 1317329188, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(359, 1317329276, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(360, 1317329277, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(361, 1317329277, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(362, 1317329305, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(363, 1317329319, 12, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '12'),
(364, 1317329320, 12, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(365, 1317329353, 12, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=12&course=1', '12'),
(366, 1317329375, 0, '127.0.0.1', 1, 'login', 0, 'error', 'index.php', 'mediadorpopper1'),
(367, 1317329381, 0, '127.0.0.1', 1, 'login', 0, 'error', 'index.php', 'mediadorpopper1'),
(368, 1317329401, 0, '127.0.0.1', 1, 'login', 0, 'error', 'index.php', 'mediadorpopper1'),
(369, 1317329421, 11, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '11'),
(370, 1317329422, 11, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(371, 1317329425, 11, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=11&course=1', '11'),
(372, 1317329437, 12, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '12'),
(373, 1317329438, 12, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(374, 1317329502, 12, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=14&course=1', ''),
(375, 1317329505, 12, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=12&course=1', '12'),
(376, 1317329522, 14, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '14'),
(377, 1317329522, 14, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(378, 1317329528, 14, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(379, 1317329561, 14, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=14&course=1', '14'),
(380, 1317329571, 0, '127.0.0.1', 1, 'login', 0, 'error', 'index.php', 'admin}'),
(381, 1317329578, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(382, 1317329579, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(383, 1317329735, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(384, 1317329737, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(385, 1317329743, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(386, 1317329743, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(387, 1317329744, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(388, 1317329850, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(389, 1317329921, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(390, 1317329925, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(391, 1317329933, 12, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '12'),
(392, 1317329934, 12, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(393, 1317329942, 12, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=12&course=1', '12'),
(394, 1317329958, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(395, 1317329959, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(396, 1317329999, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(397, 1317330000, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(398, 1317330000, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(399, 1317330083, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(400, 1317330145, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(401, 1317330152, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(402, 1317330167, 12, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '12'),
(403, 1317330168, 12, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(404, 1317330176, 12, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=12&course=1', '12'),
(405, 1317330197, 11, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '11'),
(406, 1317330198, 11, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(407, 1317330224, 11, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=11&course=1', '11'),
(408, 1317330240, 14, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '14'),
(409, 1317330241, 14, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(410, 1317330251, 14, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=14&course=1', '14'),
(411, 1317330263, 13, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '13'),
(412, 1317330264, 13, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(413, 1317330272, 13, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=13&course=1', '13'),
(414, 1317330294, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(415, 1317330295, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(416, 1317330302, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(417, 1317330303, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(418, 1317330303, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(419, 1317330326, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(420, 1317330527, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(421, 1317330536, 12, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '12'),
(422, 1317330537, 12, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(423, 1317330566, 12, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=12&course=1', '12'),
(424, 1317330577, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(425, 1317330578, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(426, 1317330595, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(427, 1317330595, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(428, 1317330595, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(429, 1317330612, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(430, 1317330626, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(431, 1317330626, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(432, 1317330649, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(433, 1317330961, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(434, 1317330962, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(435, 1317330995, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(436, 1317330995, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(437, 1317330996, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(438, 1317331025, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(439, 1317331026, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(440, 1317331026, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(441, 1317331029, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(442, 1317331039, 13, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '13'),
(443, 1317331040, 13, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(444, 1317331044, 13, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=13&course=1', '13'),
(445, 1317331053, 13, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '13'),
(446, 1317331053, 13, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(447, 1317331058, 13, '127.0.0.1', 1, 'forum', 1, 'subscribe', 'view.php?f=1', '1'),
(448, 1317331060, 13, '127.0.0.1', 1, 'forum', 1, 'view forum', 'view.php?id=1', '1'),
(449, 1317331072, 13, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=13&course=1', '13'),
(450, 1317331079, 13, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '13'),
(451, 1317331080, 13, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(452, 1317331082, 13, '127.0.0.1', 1, 'forum', 1, 'unsubscribe', 'view.php?f=1', '1'),
(453, 1317331084, 13, '127.0.0.1', 1, 'forum', 1, 'view forum', 'view.php?id=1', '1'),
(454, 1317331085, 13, '127.0.0.1', 1, 'forum', 1, 'view forum', 'view.php?id=1', '1'),
(455, 1317331087, 13, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=13&course=1', '13'),
(456, 1317331098, 0, '127.0.0.1', 1, 'login', 0, 'error', 'index.php', 'med'),
(457, 1317331102, 0, '127.0.0.1', 1, 'login', 0, 'error', 'index.php', 'media'),
(458, 1317331107, 14, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '14'),
(459, 1317331108, 14, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(460, 1317331113, 14, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=14&course=1', '14'),
(461, 1317331122, 11, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '11'),
(462, 1317331123, 11, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(463, 1317331177, 11, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=11&course=1', '11'),
(464, 1317331184, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(465, 1317331185, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(466, 1317331197, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(467, 1317331198, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(468, 1317331198, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(469, 1317331279, 2, '127.0.0.1', 1, 'forum', 1, 'view forum', 'view.php?id=1', '1'),
(470, 1317331324, 2, '127.0.0.1', 1, 'forum', 1, 'view subscribers', 'subscribers.php?id=1', '1'),
(471, 1317331511, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(472, 1317331993, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(473, 1317331998, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(474, 1317332009, 11, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '11'),
(475, 1317332010, 11, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(476, 1317332020, 11, '127.0.0.1', 1, 'forum', 1, 'subscribe', 'view.php?f=1', '1'),
(477, 1317332022, 11, '127.0.0.1', 1, 'forum', 1, 'view forum', 'view.php?id=1', '1'),
(478, 1317332034, 11, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(479, 1317332037, 11, '127.0.0.1', 1, 'forum', 1, 'unsubscribe', 'view.php?f=1', '1'),
(480, 1317332039, 11, '127.0.0.1', 1, 'forum', 1, 'view forum', 'view.php?id=1', '1'),
(481, 1317332039, 11, '127.0.0.1', 1, 'forum', 1, 'view forum', 'view.php?id=1', '1'),
(482, 1317332044, 11, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(483, 1317332047, 11, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=11&course=1', '11'),
(484, 1317332063, 11, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '11'),
(485, 1317332069, 11, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(486, 1317332081, 11, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=11&course=1', '11'),
(487, 1317332096, 13, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '13'),
(488, 1317332097, 13, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(489, 1317332100, 13, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=13&course=1', '13'),
(490, 1317332110, 12, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '12'),
(491, 1317332111, 12, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(492, 1317332123, 12, '127.0.0.1', 1, 'forum', 1, 'delete discussion', 'view.php?id=1', '1'),
(493, 1317332124, 12, '127.0.0.1', 1, 'forum', 1, 'view forum', 'view.php?id=1', '1'),
(494, 1317332153, 12, '127.0.0.1', 1, 'forum', 1, 'add discussion', 'discuss.php?d=3', '3'),
(495, 1317332156, 12, '127.0.0.1', 1, 'forum', 1, 'view forum', 'view.php?id=1', '1'),
(496, 1317332163, 12, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(497, 1317332174, 12, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=12&course=1', '12'),
(498, 1317332182, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(499, 1317332183, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(500, 1317332399, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(501, 1317332415, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(502, 1317332416, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(503, 1317332617, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(504, 1317332623, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(505, 1317332624, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(506, 1317332633, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(507, 1317332634, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(508, 1317332634, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(509, 1317332755, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(510, 1317332763, 2, '127.0.0.1', 1, 'forum', 1, 'unsubscribe', 'view.php?f=1', '1'),
(511, 1317332765, 2, '127.0.0.1', 1, 'forum', 1, 'view forum', 'view.php?id=1', '1'),
(512, 1317332766, 2, '127.0.0.1', 1, 'forum', 1, 'view forum', 'view.php?id=1', '1'),
(513, 1317332769, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(514, 1317333067, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(515, 1317333077, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(516, 1317333088, 14, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '14'),
(517, 1317333089, 14, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(518, 1317333107, 14, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=14&course=1', '14'),
(519, 1317333124, 12, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '12'),
(520, 1317333125, 12, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(521, 1317333131, 12, '127.0.0.1', 1, 'forum', 1, 'view forum', 'view.php?id=1', '1'),
(522, 1317333329, 12, '127.0.0.1', 1, 'forum', 1, 'view forum', 'view.php?id=1', '1'),
(523, 1317333396, 12, '127.0.0.1', 1, 'forum', 1, 'view forum', 'view.php?id=1', '1'),
(524, 1317333399, 12, '127.0.0.1', 2, 'forum', 2, 'view forum', 'view.php?id=2', '2'),
(525, 1317333404, 12, '127.0.0.1', 1, 'forum', 1, 'view forum', 'view.php?id=1', '1'),
(526, 1317333407, 12, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(527, 1317333626, 12, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(528, 1317333631, 12, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(529, 1317333666, 12, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(530, 1317333717, 12, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(531, 1317333747, 12, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(532, 1317333798, 12, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(533, 1317333817, 12, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=12&course=1', '12'),
(534, 1317333828, 11, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '11'),
(535, 1317333829, 11, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(536, 1317333832, 11, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(537, 1317333835, 11, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(538, 1317333838, 11, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(539, 1317334539, 11, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '11'),
(540, 1317334547, 11, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(541, 1317334568, 11, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(542, 1317334575, 11, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=11&course=1', '11'),
(543, 1317334587, 14, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '14'),
(544, 1317334588, 14, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(545, 1317334617, 14, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=14&course=1', '14'),
(546, 1317334629, 13, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '13'),
(547, 1317334630, 13, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(548, 1317334663, 13, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=13&course=1', '13'),
(549, 1317334681, 12, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '12'),
(550, 1317334683, 12, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(551, 1317334692, 12, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(552, 1317334695, 12, '127.0.0.1', 1, 'forum', 1, 'view forum', 'view.php?id=1', '1'),
(553, 1317334763, 12, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(554, 1317334768, 12, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=12&course=1', '12'),
(555, 1317334775, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(556, 1317334776, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(557, 1317334786, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(558, 1317334786, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(559, 1317334786, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(560, 1317334795, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(561, 1317334823, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(562, 1317334834, 12, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '12'),
(563, 1317334835, 12, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(564, 1317334850, 12, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=12&course=1', '12'),
(565, 1317334858, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(566, 1317334859, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(567, 1317334872, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(568, 1317334872, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(569, 1317334873, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(570, 1317334877, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(571, 1317334898, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(572, 1317334899, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(573, 1317334902, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(574, 1317334910, 12, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '12'),
(575, 1317334911, 12, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(576, 1317334981, 12, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(577, 1317335180, 12, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(578, 1317389093, 0, '127.0.0.1', 1, 'login', 0, 'error', 'index.php', 'admin'),
(579, 1317389097, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(580, 1317389100, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(581, 1317389226, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(582, 1317389234, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(583, 1317389235, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(584, 1317389321, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(585, 1317389326, 2, '127.0.0.1', 1, 'forum', 1, 'view forum', 'view.php?id=1', '1'),
(586, 1317389337, 2, '127.0.0.1', 1, 'user', 0, 'view all', 'index.php?id=1', ''),
(587, 1317389426, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(588, 1317389436, 0, '127.0.0.1', 1, 'login', 0, 'error', 'index.php', 'mediador1'),
(589, 1317389445, 0, '127.0.0.1', 1, 'login', 0, 'error', 'index.php', 'aprendiz1 popper'),
(590, 1317389450, 1, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '1'),
(591, 1317389451, 1, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(592, 1317389705, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=1&course=1', '2');
INSERT INTO `mdl_log` (`id`, `time`, `userid`, `ip`, `course`, `module`, `cmid`, `action`, `url`, `info`) VALUES
(593, 1317389705, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(594, 1317389716, 2, '127.0.0.1', 2, 'forum', 2, 'view forum', 'view.php?id=2', '2'),
(595, 1317389723, 2, '127.0.0.1', 2, 'forum', 2, 'view discussion', 'http://localhost/mod/forum/discuss.php?d=2', '2'),
(596, 1317389793, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(597, 1317389801, 12, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '12'),
(598, 1317389803, 12, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(599, 1317389819, 12, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(600, 1317389826, 12, '127.0.0.1', 2, 'forum', 2, 'view forum', 'view.php?id=2', '2'),
(601, 1317389839, 12, '127.0.0.1', 1, 'forum', 1, 'view forum', 'view.php?id=1', '1'),
(602, 1317390303, 12, '127.0.0.1', 1, 'forum', 1, 'view forum', 'view.php?id=1', '1'),
(603, 1317390307, 12, '127.0.0.1', 1, 'forum', 1, 'view discussion', 'http://localhost/mod/forum/discuss.php?d=3', '3'),
(604, 1317390320, 12, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=12&course=1', '12'),
(605, 1317390328, 0, '127.0.0.1', 1, 'login', 0, 'error', 'index.php', 'aprendizpopper1'),
(606, 1317390332, 13, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '13'),
(607, 1317390333, 13, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(608, 1317390339, 13, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(609, 1317390350, 13, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(610, 1317390352, 13, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=13&course=1', '13'),
(611, 1317390362, 1, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '1'),
(612, 1317390363, 1, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(613, 1317390372, 13, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=1&course=1', '13'),
(614, 1317390372, 13, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(615, 1317390384, 13, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=13&course=1', '13'),
(616, 1317390392, 0, '127.0.0.1', 1, 'login', 0, 'error', 'index.php', 'mediadorpopper1'),
(617, 1317390396, 14, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '14'),
(618, 1317390397, 14, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(619, 1317390417, 14, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(620, 1317390433, 14, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(621, 1317390441, 14, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=14&course=1', '14'),
(622, 1317390450, 0, '127.0.0.1', 1, 'login', 0, 'error', 'index.php', 'administradorpopper1'),
(623, 1317390454, 0, '127.0.0.1', 1, 'login', 0, 'error', 'index.php', 'administradorpopper1'),
(624, 1317390463, 0, '127.0.0.1', 1, 'login', 0, 'error', 'index.php', 'administradorpopper1'),
(625, 1317390478, 12, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '12'),
(626, 1317390479, 12, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(627, 1317390498, 12, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(628, 1317390509, 12, '127.0.0.1', 2, 'forum', 2, 'view forum', 'view.php?id=2', '2'),
(629, 1317390530, 12, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(630, 1317390535, 12, '127.0.0.1', 1, 'forum', 1, 'view forum', 'view.php?id=1', '1'),
(631, 1317390571, 12, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(632, 1317390926, 12, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(633, 1317390941, 12, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(634, 1317390952, 12, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(635, 1317390953, 12, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(636, 1317390970, 12, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(637, 1317390971, 12, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(638, 1317390975, 12, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(639, 1317390976, 12, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(640, 1317391019, 12, '127.0.0.1', 1, 'course', 0, 'new', 'view.php?id=3', 'Carolo (ID 3)'),
(641, 1317391094, 12, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(642, 1317391107, 12, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=12&course=1', '12'),
(643, 1317391118, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(644, 1317391119, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(645, 1317391248, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(646, 1317391260, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(647, 1317391260, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(648, 1317391320, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(649, 1317391333, 0, '127.0.0.1', 1, 'login', 0, 'error', 'index.php', 'aprendiz1popper'),
(650, 1317391345, 13, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '13'),
(651, 1317391345, 13, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(652, 1317391349, 13, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(653, 1317391358, 13, '127.0.0.1', 3, 'forum', 3, 'view forum', 'view.php?id=3', '3'),
(654, 1317391366, 13, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=13&course=1', '13'),
(655, 1317391377, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(656, 1317391378, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(657, 1317391483, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(658, 1317391502, 2, '127.0.0.1', 3, 'user', 0, 'view all', 'index.php?id=3', ''),
(659, 1317391526, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(660, 1317391542, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(661, 1317393447, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(662, 1317393462, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(663, 1317393463, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(664, 1317395997, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(665, 1317396008, 14, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '14'),
(666, 1317396009, 14, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(667, 1317396025, 14, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=14&course=1', '14'),
(668, 1317396051, 0, '127.0.0.1', 1, 'login', 0, 'error', 'index.php', 'administradorpopper1'),
(669, 1317396060, 12, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '12'),
(670, 1317396061, 12, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(671, 1317396103, 12, '127.0.0.1', 1, 'course', 0, 'new', 'view.php?id=4', 'Vega (ID 4)'),
(672, 1317396118, 12, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(673, 1317396358, 12, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(674, 1317396370, 12, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=12&course=1', '12'),
(675, 1317396380, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(676, 1317396381, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(677, 1317396394, 2, '127.0.0.1', 1, 'forum', 1, 'view forum', 'view.php?id=1', '1'),
(678, 1317396423, 2, '127.0.0.1', 1, 'course', 0, 'update mod', '../mod/forum/view.php?id=1', 'forum 1'),
(679, 1317396423, 2, '127.0.0.1', 1, 'forum', 1, 'update', 'view.php?id=1', '1'),
(680, 1317396423, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(681, 1317396424, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(682, 1317396438, 2, '127.0.0.1', 4, 'course', 0, 'view', 'view.php?id=4', '4'),
(683, 1317396460, 2, '127.0.0.1', 4, 'forum', 4, 'view forum', 'view.php?id=4', '4'),
(684, 1317396505, 2, '127.0.0.1', 4, 'course', 0, 'update mod', '../mod/forum/view.php?id=4', 'forum 4'),
(685, 1317396505, 2, '127.0.0.1', 4, 'forum', 4, 'update', 'view.php?id=4', '4'),
(686, 1317396505, 2, '127.0.0.1', 4, 'course', 0, 'view', 'view.php?id=4', '4'),
(687, 1317396510, 2, '127.0.0.1', 4, 'forum', 4, 'view forum', 'view.php?id=4', '4'),
(688, 1317396518, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(689, 1317396521, 2, '127.0.0.1', 2, 'forum', 2, 'view forum', 'view.php?id=2', '2'),
(690, 1317397022, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(691, 1317397026, 2, '127.0.0.1', 3, 'forum', 3, 'view forum', 'view.php?id=3', '3'),
(692, 1317397086, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(693, 1317397318, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(694, 1317397322, 2, '127.0.0.1', 3, 'forum', 3, 'view forum', 'view.php?id=3', '3'),
(695, 1317397337, 2, '127.0.0.1', 3, 'forum', 3, 'view forum', 'view.php?id=3', '3'),
(696, 1317397578, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(697, 1317397583, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(698, 1317397647, 2, '127.0.0.1', 3, 'forum', 3, 'view forum', 'view.php?id=3', '3'),
(699, 1317397683, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(700, 1317397697, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(701, 1317397698, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(702, 1317397699, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(703, 1317397710, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(704, 1317397878, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(705, 1317397879, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(706, 1317397895, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(707, 1317397904, 12, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '12'),
(708, 1317397905, 12, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(709, 1317397949, 12, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=12&course=1', '12'),
(710, 1317845760, 2, '0:0:0:0:0:0:0:1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(711, 1317845762, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(712, 1317845799, 2, '0:0:0:0:0:0:0:1', 4, 'course', 0, 'view', 'view.php?id=4', '4'),
(713, 1317845844, 11, '0:0:0:0:0:0:0:1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '11'),
(714, 1317845849, 11, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(715, 1317845854, 11, '0:0:0:0:0:0:0:1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(716, 1317845858, 11, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(717, 1317845877, 2, '0:0:0:0:0:0:0:1', 4, 'course', 0, 'view', 'view.php?id=4', '4'),
(718, 1317845889, 2, '0:0:0:0:0:0:0:1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(719, 1317845926, 11, '0:0:0:0:0:0:0:1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(720, 1317845929, 11, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(721, 1317845936, 11, '0:0:0:0:0:0:0:1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(722, 1317845951, 11, '0:0:0:0:0:0:0:1', 1, 'user', 0, 'logout', 'view.php?id=11&course=1', '11'),
(723, 1317845984, 11, '0:0:0:0:0:0:0:1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '11'),
(724, 1317845988, 11, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(725, 1317845997, 11, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(726, 1317846006, 11, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(727, 1317846137, 11, '0:0:0:0:0:0:0:1', 1, 'user', 0, 'logout', 'view.php?id=11&course=1', '11'),
(728, 1317846150, 14, '0:0:0:0:0:0:0:1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '14'),
(729, 1317846151, 14, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(730, 1317846169, 2, '0:0:0:0:0:0:0:1', 2, 'course', 0, 'enrol', '../enrol/users.php?id=2', '2'),
(731, 1317846181, 14, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(732, 1317846203, 2, '0:0:0:0:0:0:0:1', 4, 'course', 0, 'view', 'view.php?id=4', '4'),
(733, 1317846238, 14, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(734, 1317846275, 2, '0:0:0:0:0:0:0:1', 4, 'course', 0, 'enrol', '../enrol/users.php?id=4', '4'),
(735, 1317846671, 2, '0:0:0:0:0:0:0:1', 4, 'course', 0, 'view', 'view.php?id=4', '4'),
(736, 1317847654, 2, '0:0:0:0:0:0:0:1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(737, 1317847707, 14, '0:0:0:0:0:0:0:1', 4, 'course', 0, 'view', 'view.php?id=4', '4'),
(738, 1317847893, 14, '0:0:0:0:0:0:0:1', 4, 'course', 0, 'view', 'view.php?id=4', '4'),
(739, 1317847900, 14, '0:0:0:0:0:0:0:1', 4, 'course', 0, 'view', 'view.php?id=4', '4'),
(740, 1317848135, 14, '0:0:0:0:0:0:0:1', 4, 'course', 0, 'view', 'view.php?id=4', '4'),
(741, 1317848479, 2, '0:0:0:0:0:0:0:1', 4, 'course', 0, 'view', 'view.php?id=4', '4'),
(742, 1317848532, 2, '0:0:0:0:0:0:0:1', 4, 'course', 0, 'view', 'view.php?id=4', '4'),
(743, 1317848533, 2, '0:0:0:0:0:0:0:1', 4, 'course', 0, 'view', 'view.php?id=4', '4'),
(744, 1317848546, 2, '0:0:0:0:0:0:0:1', 4, 'course', 0, 'view', 'view.php?id=4', '4'),
(745, 1317848547, 2, '0:0:0:0:0:0:0:1', 4, 'course', 0, 'view', 'view.php?id=4', '4'),
(746, 1317848563, 2, '0:0:0:0:0:0:0:1', 4, 'course', 0, 'view', 'view.php?id=4', '4'),
(747, 1317848564, 2, '0:0:0:0:0:0:0:1', 4, 'course', 0, 'view', 'view.php?id=4', '4'),
(748, 1317848599, 2, '0:0:0:0:0:0:0:1', 4, 'course', 0, 'view', 'view.php?id=4', '4'),
(749, 1317848610, 2, '0:0:0:0:0:0:0:1', 4, 'course', 0, 'view', 'view.php?id=4', '4'),
(750, 1317848611, 2, '0:0:0:0:0:0:0:1', 4, 'course', 0, 'view', 'view.php?id=4', '4'),
(751, 1317848644, 2, '0:0:0:0:0:0:0:1', 4, 'course', 0, 'view', 'view.php?id=4', '4'),
(752, 1317848645, 2, '0:0:0:0:0:0:0:1', 4, 'course', 0, 'view', 'view.php?id=4', '4'),
(753, 1317848729, 2, '0:0:0:0:0:0:0:1', 4, 'course', 0, 'view', 'view.php?id=4', '4'),
(754, 1317848985, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(755, 1317849001, 2, '0:0:0:0:0:0:0:1', 4, 'course', 0, 'view', 'view.php?id=4', '4'),
(756, 1317849008, 2, '0:0:0:0:0:0:0:1', 4, 'course', 0, 'view', 'view.php?id=4', '4'),
(757, 1317849009, 2, '0:0:0:0:0:0:0:1', 4, 'course', 0, 'view', 'view.php?id=4', '4'),
(758, 1317849112, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(759, 1317849127, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(760, 1317849128, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(761, 1317849129, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(762, 1317849140, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(763, 1317849450, 14, '0:0:0:0:0:0:0:1', 4, 'course', 0, 'view', 'view.php?id=4', '4'),
(764, 1317850419, 2, '0:0:0:0:0:0:0:1', 4, 'course', 0, 'view', 'view.php?id=4', '4'),
(765, 1317929929, 12, '0:0:0:0:0:0:0:1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '12'),
(766, 1317929933, 12, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(767, 1317929969, 12, '0:0:0:0:0:0:0:1', 1, 'forum', 1, 'view forum', 'view.php?id=1', '1'),
(768, 1317930113, 12, '0:0:0:0:0:0:0:1', 1, 'user', 0, 'logout', 'view.php?id=12&course=1', '12'),
(769, 1317930130, 2, '0:0:0:0:0:0:0:1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(770, 1317930131, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(771, 1317930156, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(772, 1317930157, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(773, 1317930158, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(774, 1317930159, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(775, 1317930160, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(776, 1317930161, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(777, 1317930204, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(778, 1317930380, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(779, 1317930381, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(780, 1317930389, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(781, 1317930412, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(782, 1317930413, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(783, 1317930418, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(784, 1317930575, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(785, 1317930577, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(786, 1317930621, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(787, 1317930625, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(788, 1317930779, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(789, 1317930781, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(790, 1317930792, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(791, 1317930869, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(792, 1317930871, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(793, 1317930876, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(794, 1317930883, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(795, 1317930891, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(796, 1317930938, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(797, 1317930939, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(798, 1317930944, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(799, 1317931191, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(800, 1317931192, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(801, 1317931203, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(802, 1317931232, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(803, 1317931233, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(804, 1317931877, 2, '0:0:0:0:0:0:0:1', 4, 'course', 0, 'view', 'view.php?id=4', '4'),
(805, 1317932055, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(806, 1317933078, 14, '0:0:0:0:0:0:0:1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '14'),
(807, 1317934674, 14, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(808, 1317934685, 2, '0:0:0:0:0:0:0:1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(809, 1317934715, 2, '0:0:0:0:0:0:0:1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(810, 1317934718, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(811, 1317934740, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(812, 1317934740, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(813, 1317934741, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(814, 1317934746, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(815, 1317934834, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(816, 1317934836, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(817, 1317934842, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(818, 1317934891, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(819, 1317934893, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(820, 1317934968, 2, '0:0:0:0:0:0:0:1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(821, 1317934977, 12, '0:0:0:0:0:0:0:1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '12'),
(822, 1317934979, 12, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(823, 1317934984, 12, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(824, 1317935566, 14, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(825, 1317936639, 14, '0:0:0:0:0:0:0:1', 4, 'course', 0, 'enrol', '../enrol/users.php?id=4', '4'),
(826, 1317936662, 12, '0:0:0:0:0:0:0:1', 4, 'course', 0, 'enrol', '../enrol/users.php?id=4', '4'),
(827, 1317936672, 12, '0:0:0:0:0:0:0:1', 1, 'user', 0, 'logout', 'view.php?id=12&course=1', '12'),
(828, 1317936684, 2, '0:0:0:0:0:0:0:1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(829, 1317936686, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(830, 1317936707, 2, '0:0:0:0:0:0:0:1', 4, 'course', 0, 'view', 'view.php?id=4', '4'),
(831, 1317936786, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(832, 1317936800, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(833, 1317936801, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(834, 1317936802, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(835, 1317936874, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'add mod', '../mod/forum/view.php?id=5', 'forum 5'),
(836, 1317936874, 2, '0:0:0:0:0:0:0:1', 1, 'forum', 5, 'add', 'view.php?id=5', '5'),
(837, 1317936875, 2, '0:0:0:0:0:0:0:1', 1, 'forum', 5, 'view forum', 'view.php?id=5', '5'),
(838, 1317936897, 2, '0:0:0:0:0:0:0:1', 1, 'forum', 5, 'add discussion', 'discuss.php?d=4', '4'),
(839, 1317936900, 2, '0:0:0:0:0:0:0:1', 1, 'forum', 5, 'view forum', 'view.php?id=5', '5'),
(840, 1317936907, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(841, 1317937110, 14, '0:0:0:0:0:0:0:1', 1, 'user', 0, 'logout', 'view.php?id=14&course=1', '14'),
(842, 1317937139, 13, '0:0:0:0:0:0:0:1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '13'),
(843, 1317945556, 2, '0:0:0:0:0:0:0:1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(844, 1317955573, 2, '0:0:0:0:0:0:0:1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(845, 1317955610, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(846, 1317955641, 2, '0:0:0:0:0:0:0:1', 4, 'course', 0, 'view', 'view.php?id=4', '4'),
(847, 1317955643, 2, '0:0:0:0:0:0:0:1', 4, 'course', 0, 'view', 'view.php?id=4', '4'),
(848, 1317957278, 2, '0:0:0:0:0:0:0:1', 3, 'course', 0, 'enrol', '../enrol/users.php?id=3', '3'),
(849, 1317957296, 2, '0:0:0:0:0:0:0:1', 3, 'course', 0, 'unenrol', '../enrol/users.php?id=3', '3'),
(850, 1317997655, 0, '127.0.0.1', 1, 'login', 0, 'error', 'index.php', 'admin1popper'),
(851, 1317997661, 12, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '12'),
(852, 1317997662, 12, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(853, 1317997736, 12, '127.0.0.1', 1, 'forum', 1, 'view forum', 'view.php?id=1', '1'),
(854, 1317997794, 12, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=12&course=1', '12'),
(855, 1317997808, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(856, 1317997809, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(857, 1317998057, 2, '127.0.0.1', 1, 'role', 0, 'edit', 'admin/roles/define.php?action=view&roleid=8', 'Administrador'),
(858, 1317998140, 2, '127.0.0.1', 1, 'role', 0, 'edit', 'admin/roles/define.php?action=view&roleid=8', 'Administrador'),
(859, 1317998146, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(860, 1317998158, 12, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '12'),
(861, 1317998159, 12, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(862, 1317998188, 12, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(863, 1317998262, 12, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(864, 1317999351, 12, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(865, 1317999599, 12, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(866, 1317999708, 12, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=12&course=1', '12'),
(867, 1317999744, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(868, 1317999745, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(869, 1317999849, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(870, 1317999853, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(871, 1317999863, 14, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '14'),
(872, 1317999864, 14, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(873, 1317999904, 14, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(874, 1317999906, 14, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(875, 1317999918, 14, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(876, 1317999954, 14, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=14&course=1', '14'),
(877, 1317999961, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(878, 1317999962, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(879, 1318000071, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(880, 1318000137, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(881, 1318000148, 13, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '13'),
(882, 1318000149, 13, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(883, 1318000177, 13, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(884, 1318000180, 13, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(885, 1318000198, 13, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(886, 1318000667, 13, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(887, 1318000670, 13, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=13&course=1', '13'),
(888, 1318000677, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(889, 1318000864, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(890, 1318000893, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(891, 1318001368, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(892, 1318001371, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(893, 1318001381, 14, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '14'),
(894, 1318001382, 14, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(895, 1318001448, 14, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=14&course=1', '14'),
(896, 1318001459, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(897, 1318001459, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(898, 1318001657, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(899, 1318001710, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(900, 1318001717, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(901, 1318001726, 13, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '13'),
(902, 1318001727, 13, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(903, 1318001745, 13, '127.0.0.1', 2, 'course', 0, 'enrol', '../enrol/users.php?id=2', '2'),
(904, 1318001746, 13, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(905, 1318002787, 13, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(906, 1318002789, 13, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(907, 1318002792, 13, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(908, 1318002795, 13, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(909, 1318002798, 13, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(910, 1318002800, 13, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(911, 1318002836, 13, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=13&course=1', '13'),
(912, 1318002845, 14, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '14'),
(913, 1318002846, 14, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(914, 1318002887, 14, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=14&course=1', '14'),
(915, 1318002899, 12, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '12'),
(916, 1318002900, 12, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(917, 1318003785, 12, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=12&course=1', '12'),
(918, 1318003798, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(919, 1318003798, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(920, 1318003811, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(921, 1318003812, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(922, 1318003812, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(923, 1318003829, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(924, 1318003892, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(925, 1318003906, 12, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '12'),
(926, 1318003907, 12, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(927, 1318005848, 12, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=12&course=1', '12'),
(928, 1318005855, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(929, 1318005856, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(930, 1318006017, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(931, 1318006036, 12, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '12'),
(932, 1318006037, 12, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(933, 1318006066, 12, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=12&course=1', '12'),
(934, 1318006074, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(935, 1318006075, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(936, 1318006176, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(937, 1318006183, 12, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '12'),
(938, 1318006184, 12, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(939, 1318006373, 12, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=12&course=1', '12'),
(940, 1318006383, 14, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '14'),
(941, 1318006384, 14, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(942, 1318006393, 14, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=14&course=1', '14'),
(943, 1318006463, 12, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '12'),
(944, 1318006463, 12, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(945, 1318006498, 12, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=12&course=1', '12'),
(946, 1318006510, 14, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '14'),
(947, 1318006511, 14, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(948, 1318006622, 14, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(949, 1318006883, 14, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=14&course=1', '14'),
(950, 1318006895, 12, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '12'),
(951, 1318006896, 12, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(952, 1318006957, 12, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=12&course=1', '12'),
(953, 1318006970, 14, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '14'),
(954, 1318006970, 14, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(955, 1318007194, 14, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=14&course=1', '14'),
(956, 1318007203, 12, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '12'),
(957, 1318007204, 12, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(958, 1318007879, 12, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(959, 1318007893, 12, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=12&course=1', '12'),
(960, 1318007905, 14, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '14'),
(961, 1318007906, 14, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(962, 1318008723, 14, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=14&course=1', '14'),
(963, 1318008734, 13, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '13'),
(964, 1318008734, 13, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(965, 1318008739, 13, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(966, 1318008754, 13, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(967, 1318008760, 13, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=13&course=1', '13'),
(968, 1318008769, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(969, 1318008769, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(970, 1318008788, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(971, 1318008828, 2, '127.0.0.1', 2, 'user', 0, 'view all', 'index.php?id=2', ''),
(972, 1318008872, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(973, 1318008884, 14, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '14'),
(974, 1318008885, 14, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(975, 1318009294, 14, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=14&course=1', '14'),
(976, 1318009303, 13, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '13'),
(977, 1318009304, 13, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(978, 1318009313, 13, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=13&course=1', '13'),
(979, 1318009321, 14, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '14'),
(980, 1318009322, 14, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(981, 1318009331, 14, '127.0.0.1', 2, 'course', 0, 'enrol', '../enrol/users.php?id=2', '2'),
(982, 1318009370, 14, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=14&course=1', '14'),
(983, 1318009379, 13, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '13'),
(984, 1318009380, 13, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(985, 1318009385, 13, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(986, 1318009387, 13, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=13&course=1', '13'),
(987, 1318009396, 12, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '12'),
(988, 1318009397, 12, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(989, 1318009410, 12, '127.0.0.1', 4, 'course', 0, 'unenrol', '../enrol/users.php?id=4', '4'),
(990, 1318009419, 12, '127.0.0.1', 4, 'course', 0, 'enrol', '../enrol/users.php?id=4', '4'),
(991, 1318009437, 12, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=12&course=1', '12'),
(992, 1318009810, 12, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '12'),
(993, 1318009811, 12, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(994, 1318009828, 12, '127.0.0.1', 2, 'course', 0, 'unenrol', '../enrol/users.php?id=2', '2'),
(995, 1318009867, 12, '127.0.0.1', 2, 'course', 0, 'enrol', '../enrol/users.php?id=2', '2'),
(996, 1318009903, 12, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(997, 1318009914, 12, '127.0.0.1', 4, 'course', 0, 'unenrol', '../enrol/users.php?id=4', '4'),
(998, 1318009918, 12, '127.0.0.1', 4, 'course', 0, 'enrol', '../enrol/users.php?id=4', '4'),
(999, 1318009979, 12, '127.0.0.1', 2, 'course', 0, 'unenrol', '../enrol/users.php?id=2', '2'),
(1000, 1318009984, 12, '127.0.0.1', 2, 'course', 0, 'enrol', '../enrol/users.php?id=2', '2'),
(1001, 1318010122, 12, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(1002, 1318010576, 12, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(1003, 1318010581, 12, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=12&course=1', '12'),
(1004, 1318010590, 0, '127.0.0.1', 1, 'login', 0, 'error', 'index.php', 'mediadorpopper1'),
(1005, 1318010593, 14, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '14'),
(1006, 1318010594, 14, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(1007, 1318010612, 14, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(1008, 1318011620, 14, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=14&course=1', '14'),
(1009, 1318011629, 13, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '13'),
(1010, 1318011630, 13, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(1011, 1318011632, 13, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(1012, 1318011634, 13, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(1013, 1318011636, 13, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(1014, 1318011640, 13, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=13&course=1', '13'),
(1015, 1318011647, 0, '127.0.0.1', 1, 'login', 0, 'error', 'index.php', 'mediadorpopper1'),
(1016, 1318011650, 0, '127.0.0.1', 1, 'login', 0, 'error', 'index.php', 'mediadorpopper1'),
(1017, 1318011654, 0, '127.0.0.1', 1, 'login', 0, 'error', 'index.php', 'mediadorpopper1'),
(1018, 1318011660, 14, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '14'),
(1019, 1318011660, 14, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(1020, 1318011668, 14, '127.0.0.1', 2, 'course', 0, 'unenrol', '../enrol/users.php?id=2', '2'),
(1021, 1318011670, 14, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=14&course=1', '14'),
(1022, 1318011680, 13, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '13'),
(1023, 1318011680, 13, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(1024, 1318012330, 13, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '13'),
(1025, 1318012331, 13, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(1026, 1318012335, 13, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=13&course=1', '13'),
(1027, 1318012349, 0, '127.0.0.1', 1, 'login', 0, 'error', 'index.php', 'mediadorpopper1'),
(1028, 1318012351, 14, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '14'),
(1029, 1318012352, 14, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(1030, 1318012376, 14, '127.0.0.1', 2, 'course', 0, 'enrol', '../enrol/users.php?id=2', '2'),
(1031, 1318012380, 14, '127.0.0.1', 2, 'course', 0, 'unenrol', '../enrol/users.php?id=2', '2'),
(1032, 1318012391, 14, '127.0.0.1', 2, 'course', 0, 'enrol', '../enrol/users.php?id=2', '2'),
(1033, 1318012399, 14, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_log_display`
--

CREATE TABLE IF NOT EXISTS `mdl_log_display` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `action` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mtable` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `field` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_logdisp_modact_uix` (`module`,`action`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='For a particular module/action, specifies a moodle table/fie' AUTO_INCREMENT=141 ;

--
-- Volcado de datos para la tabla `mdl_log_display`
--

INSERT INTO `mdl_log_display` (`id`, `module`, `action`, `mtable`, `field`, `component`) VALUES
(1, 'user', 'view', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(2, 'course', 'user report', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(3, 'course', 'view', 'course', 'fullname', 'moodle'),
(4, 'course', 'update', 'course', 'fullname', 'moodle'),
(5, 'course', 'enrol', 'course', 'fullname', 'moodle'),
(6, 'course', 'unenrol', 'course', 'fullname', 'moodle'),
(7, 'course', 'report log', 'course', 'fullname', 'moodle'),
(8, 'course', 'report live', 'course', 'fullname', 'moodle'),
(9, 'course', 'report outline', 'course', 'fullname', 'moodle'),
(10, 'course', 'report participation', 'course', 'fullname', 'moodle'),
(11, 'course', 'report stats', 'course', 'fullname', 'moodle'),
(12, 'message', 'write', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(13, 'message', 'read', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(14, 'message', 'add contact', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(15, 'message', 'remove contact', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(16, 'message', 'block contact', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(17, 'message', 'unblock contact', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(18, 'group', 'view', 'groups', 'name', 'moodle'),
(19, 'tag', 'update', 'tag', 'name', 'moodle'),
(20, 'assignment', 'view', 'assignment', 'name', 'mod_assignment'),
(21, 'assignment', 'add', 'assignment', 'name', 'mod_assignment'),
(22, 'assignment', 'update', 'assignment', 'name', 'mod_assignment'),
(23, 'assignment', 'view submission', 'assignment', 'name', 'mod_assignment'),
(24, 'assignment', 'upload', 'assignment', 'name', 'mod_assignment'),
(25, 'chat', 'view', 'chat', 'name', 'mod_chat'),
(26, 'chat', 'add', 'chat', 'name', 'mod_chat'),
(27, 'chat', 'update', 'chat', 'name', 'mod_chat'),
(28, 'chat', 'report', 'chat', 'name', 'mod_chat'),
(29, 'chat', 'talk', 'chat', 'name', 'mod_chat'),
(30, 'choice', 'view', 'choice', 'name', 'mod_choice'),
(31, 'choice', 'update', 'choice', 'name', 'mod_choice'),
(32, 'choice', 'add', 'choice', 'name', 'mod_choice'),
(33, 'choice', 'report', 'choice', 'name', 'mod_choice'),
(34, 'choice', 'choose', 'choice', 'name', 'mod_choice'),
(35, 'choice', 'choose again', 'choice', 'name', 'mod_choice'),
(36, 'data', 'view', 'data', 'name', 'mod_data'),
(37, 'data', 'add', 'data', 'name', 'mod_data'),
(38, 'data', 'update', 'data', 'name', 'mod_data'),
(39, 'data', 'record delete', 'data', 'name', 'mod_data'),
(40, 'data', 'fields add', 'data_fields', 'name', 'mod_data'),
(41, 'data', 'fields update', 'data_fields', 'name', 'mod_data'),
(42, 'data', 'templates saved', 'data', 'name', 'mod_data'),
(43, 'data', 'templates def', 'data', 'name', 'mod_data'),
(44, 'feedback', 'startcomplete', 'feedback', 'name', 'mod_feedback'),
(45, 'feedback', 'submit', 'feedback', 'name', 'mod_feedback'),
(46, 'feedback', 'delete', 'feedback', 'name', 'mod_feedback'),
(47, 'feedback', 'view', 'feedback', 'name', 'mod_feedback'),
(48, 'feedback', 'view all', 'course', 'shortname', 'mod_feedback'),
(49, 'folder', 'view', 'folder', 'name', 'mod_folder'),
(50, 'folder', 'view all', 'folder', 'name', 'mod_folder'),
(51, 'folder', 'update', 'folder', 'name', 'mod_folder'),
(52, 'folder', 'add', 'folder', 'name', 'mod_folder'),
(53, 'forum', 'add', 'forum', 'name', 'mod_forum'),
(54, 'forum', 'update', 'forum', 'name', 'mod_forum'),
(55, 'forum', 'add discussion', 'forum_discussions', 'name', 'mod_forum'),
(56, 'forum', 'add post', 'forum_posts', 'subject', 'mod_forum'),
(57, 'forum', 'update post', 'forum_posts', 'subject', 'mod_forum'),
(58, 'forum', 'user report', 'user', 'CONCAT(firstname, '' '', lastname)', 'mod_forum'),
(59, 'forum', 'move discussion', 'forum_discussions', 'name', 'mod_forum'),
(60, 'forum', 'view subscribers', 'forum', 'name', 'mod_forum'),
(61, 'forum', 'view discussion', 'forum_discussions', 'name', 'mod_forum'),
(62, 'forum', 'view forum', 'forum', 'name', 'mod_forum'),
(63, 'forum', 'subscribe', 'forum', 'name', 'mod_forum'),
(64, 'forum', 'unsubscribe', 'forum', 'name', 'mod_forum'),
(65, 'glossary', 'add', 'glossary', 'name', 'mod_glossary'),
(66, 'glossary', 'update', 'glossary', 'name', 'mod_glossary'),
(67, 'glossary', 'view', 'glossary', 'name', 'mod_glossary'),
(68, 'glossary', 'view all', 'glossary', 'name', 'mod_glossary'),
(69, 'glossary', 'add entry', 'glossary', 'name', 'mod_glossary'),
(70, 'glossary', 'update entry', 'glossary', 'name', 'mod_glossary'),
(71, 'glossary', 'add category', 'glossary', 'name', 'mod_glossary'),
(72, 'glossary', 'update category', 'glossary', 'name', 'mod_glossary'),
(73, 'glossary', 'delete category', 'glossary', 'name', 'mod_glossary'),
(74, 'glossary', 'approve entry', 'glossary', 'name', 'mod_glossary'),
(75, 'glossary', 'view entry', 'glossary_entries', 'concept', 'mod_glossary'),
(76, 'imscp', 'view', 'imscp', 'name', 'mod_imscp'),
(77, 'imscp', 'view all', 'imscp', 'name', 'mod_imscp'),
(78, 'imscp', 'update', 'imscp', 'name', 'mod_imscp'),
(79, 'imscp', 'add', 'imscp', 'name', 'mod_imscp'),
(80, 'label', 'add', 'label', 'name', 'mod_label'),
(81, 'label', 'update', 'label', 'name', 'mod_label'),
(82, 'lesson', 'start', 'lesson', 'name', 'mod_lesson'),
(83, 'lesson', 'end', 'lesson', 'name', 'mod_lesson'),
(84, 'lesson', 'view', 'lesson_pages', 'title', 'mod_lesson'),
(85, 'page', 'view', 'page', 'name', 'mod_page'),
(86, 'page', 'view all', 'page', 'name', 'mod_page'),
(87, 'page', 'update', 'page', 'name', 'mod_page'),
(88, 'page', 'add', 'page', 'name', 'mod_page'),
(89, 'quiz', 'add', 'quiz', 'name', 'mod_quiz'),
(90, 'quiz', 'update', 'quiz', 'name', 'mod_quiz'),
(91, 'quiz', 'view', 'quiz', 'name', 'mod_quiz'),
(92, 'quiz', 'report', 'quiz', 'name', 'mod_quiz'),
(93, 'quiz', 'attempt', 'quiz', 'name', 'mod_quiz'),
(94, 'quiz', 'submit', 'quiz', 'name', 'mod_quiz'),
(95, 'quiz', 'review', 'quiz', 'name', 'mod_quiz'),
(96, 'quiz', 'editquestions', 'quiz', 'name', 'mod_quiz'),
(97, 'quiz', 'preview', 'quiz', 'name', 'mod_quiz'),
(98, 'quiz', 'start attempt', 'quiz', 'name', 'mod_quiz'),
(99, 'quiz', 'close attempt', 'quiz', 'name', 'mod_quiz'),
(100, 'quiz', 'continue attempt', 'quiz', 'name', 'mod_quiz'),
(101, 'quiz', 'edit override', 'quiz', 'name', 'mod_quiz'),
(102, 'quiz', 'delete override', 'quiz', 'name', 'mod_quiz'),
(103, 'resource', 'view', 'resource', 'name', 'mod_resource'),
(104, 'resource', 'view all', 'resource', 'name', 'mod_resource'),
(105, 'resource', 'update', 'resource', 'name', 'mod_resource'),
(106, 'resource', 'add', 'resource', 'name', 'mod_resource'),
(107, 'scorm', 'view', 'scorm', 'name', 'mod_scorm'),
(108, 'scorm', 'review', 'scorm', 'name', 'mod_scorm'),
(109, 'scorm', 'update', 'scorm', 'name', 'mod_scorm'),
(110, 'scorm', 'add', 'scorm', 'name', 'mod_scorm'),
(111, 'survey', 'add', 'survey', 'name', 'mod_survey'),
(112, 'survey', 'update', 'survey', 'name', 'mod_survey'),
(113, 'survey', 'download', 'survey', 'name', 'mod_survey'),
(114, 'survey', 'view form', 'survey', 'name', 'mod_survey'),
(115, 'survey', 'view graph', 'survey', 'name', 'mod_survey'),
(116, 'survey', 'view report', 'survey', 'name', 'mod_survey'),
(117, 'survey', 'submit', 'survey', 'name', 'mod_survey'),
(118, 'url', 'view', 'url', 'name', 'mod_url'),
(119, 'url', 'view all', 'url', 'name', 'mod_url'),
(120, 'url', 'update', 'url', 'name', 'mod_url'),
(121, 'url', 'add', 'url', 'name', 'mod_url'),
(122, 'workshop', 'add', 'workshop', 'name', 'mod_workshop'),
(123, 'workshop', 'update', 'workshop', 'name', 'mod_workshop'),
(124, 'workshop', 'view', 'workshop', 'name', 'mod_workshop'),
(125, 'workshop', 'view all', 'workshop', 'name', 'mod_workshop'),
(126, 'workshop', 'add submission', 'workshop_submissions', 'title', 'mod_workshop'),
(127, 'workshop', 'update submission', 'workshop_submissions', 'title', 'mod_workshop'),
(128, 'workshop', 'view submission', 'workshop_submissions', 'title', 'mod_workshop'),
(129, 'workshop', 'add assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(130, 'workshop', 'update assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(131, 'workshop', 'add example', 'workshop_submissions', 'title', 'mod_workshop'),
(132, 'workshop', 'update example', 'workshop_submissions', 'title', 'mod_workshop'),
(133, 'workshop', 'view example', 'workshop_submissions', 'title', 'mod_workshop'),
(134, 'workshop', 'add reference assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(135, 'workshop', 'update reference assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(136, 'workshop', 'add example assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(137, 'workshop', 'update example assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(138, 'workshop', 'update aggregate grades', 'workshop', 'name', 'mod_workshop'),
(139, 'workshop', 'update clear aggregated grades', 'workshop', 'name', 'mod_workshop'),
(140, 'workshop', 'update clear assessments', 'workshop', 'name', 'mod_workshop');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_log_queries`
--

CREATE TABLE IF NOT EXISTS `mdl_log_queries` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `qtype` mediumint(5) unsigned NOT NULL,
  `sqltext` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `sqlparams` longtext COLLATE utf8_unicode_ci,
  `error` mediumint(5) unsigned NOT NULL DEFAULT '0',
  `info` text COLLATE utf8_unicode_ci,
  `backtrace` text COLLATE utf8_unicode_ci,
  `exectime` decimal(10,5) NOT NULL,
  `timelogged` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Logged database queries.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_message`
--

CREATE TABLE IF NOT EXISTS `mdl_message` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `useridfrom` bigint(10) unsigned NOT NULL DEFAULT '0',
  `useridto` bigint(10) unsigned NOT NULL DEFAULT '0',
  `subject` text COLLATE utf8_unicode_ci,
  `fullmessage` text COLLATE utf8_unicode_ci,
  `fullmessageformat` smallint(4) unsigned DEFAULT '0',
  `fullmessagehtml` mediumtext COLLATE utf8_unicode_ci,
  `smallmessage` text COLLATE utf8_unicode_ci,
  `notification` tinyint(1) unsigned DEFAULT '0',
  `contexturl` text COLLATE utf8_unicode_ci,
  `contexturlname` text COLLATE utf8_unicode_ci,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_mess_use_ix` (`useridfrom`),
  KEY `mdl_mess_use2_ix` (`useridto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores all unread messages' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_message_contacts`
--

CREATE TABLE IF NOT EXISTS `mdl_message_contacts` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `contactid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `blocked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_messcont_usecon_uix` (`userid`,`contactid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Maintains lists of relationships between users' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_message_processors`
--

CREATE TABLE IF NOT EXISTS `mdl_message_processors` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(166) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='List of message output plugins' AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `mdl_message_processors`
--

INSERT INTO `mdl_message_processors` (`id`, `name`, `enabled`) VALUES
(1, 'email', 1),
(2, 'jabber', 1),
(3, 'popup', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_message_providers`
--

CREATE TABLE IF NOT EXISTS `mdl_message_providers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `component` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `capability` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_messprov_comnam_uix` (`component`,`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table stores the message providers (modules and core sy' AUTO_INCREMENT=15 ;

--
-- Volcado de datos para la tabla `mdl_message_providers`
--

INSERT INTO `mdl_message_providers` (`id`, `name`, `component`, `capability`) VALUES
(1, 'notices', 'moodle', 'moodle/site:config'),
(2, 'errors', 'moodle', 'moodle/site:config'),
(3, 'instantmessage', 'moodle', NULL),
(4, 'backup', 'moodle', 'moodle/site:config'),
(5, 'courserequested', 'moodle', 'moodle/site:approvecourse'),
(6, 'courserequestapproved', 'moodle', 'moodle/course:request'),
(7, 'courserequestrejected', 'moodle', 'moodle/course:request'),
(8, 'assignment_updates', 'mod_assignment', NULL),
(9, 'submission', 'mod_feedback', NULL),
(10, 'message', 'mod_feedback', NULL),
(11, 'posts', 'mod_forum', NULL),
(12, 'graded_essay', 'mod_lesson', NULL),
(13, 'submission', 'mod_quiz', 'mod/quiz:emailnotifysubmission'),
(14, 'confirmation', 'mod_quiz', 'mod/quiz:emailconfirmsubmission');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_message_read`
--

CREATE TABLE IF NOT EXISTS `mdl_message_read` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `useridfrom` bigint(10) unsigned NOT NULL DEFAULT '0',
  `useridto` bigint(10) unsigned NOT NULL DEFAULT '0',
  `subject` text COLLATE utf8_unicode_ci,
  `fullmessage` text COLLATE utf8_unicode_ci,
  `fullmessageformat` smallint(4) unsigned DEFAULT '0',
  `fullmessagehtml` mediumtext COLLATE utf8_unicode_ci,
  `smallmessage` text COLLATE utf8_unicode_ci,
  `notification` tinyint(1) unsigned DEFAULT '0',
  `contexturl` text COLLATE utf8_unicode_ci,
  `contexturlname` text COLLATE utf8_unicode_ci,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timeread` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_messread_use_ix` (`useridfrom`),
  KEY `mdl_messread_use2_ix` (`useridto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores all messages that have been read' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_message_working`
--

CREATE TABLE IF NOT EXISTS `mdl_message_working` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `unreadmessageid` bigint(10) unsigned NOT NULL,
  `processorid` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Lists all the messages and processors that need to be proces' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_mnetservice_enrol_courses`
--

CREATE TABLE IF NOT EXISTS `mdl_mnetservice_enrol_courses` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `hostid` bigint(10) unsigned NOT NULL,
  `remoteid` bigint(10) unsigned NOT NULL,
  `categoryid` bigint(10) unsigned NOT NULL,
  `categoryname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sortorder` bigint(10) unsigned NOT NULL DEFAULT '0',
  `fullname` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shortname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `idnumber` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `summary` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `summaryformat` smallint(3) unsigned DEFAULT '0',
  `startdate` bigint(10) unsigned NOT NULL,
  `roleid` bigint(10) unsigned NOT NULL,
  `rolename` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetenrocour_hosrem_uix` (`hostid`,`remoteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Caches the information fetched via XML-RPC about courses on ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_mnetservice_enrol_enrolments`
--

CREATE TABLE IF NOT EXISTS `mdl_mnetservice_enrol_enrolments` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `hostid` bigint(10) unsigned NOT NULL,
  `userid` bigint(10) unsigned NOT NULL,
  `remotecourseid` bigint(10) unsigned NOT NULL,
  `rolename` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `enroltime` bigint(10) unsigned NOT NULL DEFAULT '0',
  `enroltype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_mnetenroenro_use_ix` (`userid`),
  KEY `mdl_mnetenroenro_hos_ix` (`hostid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Caches the information about enrolments of our local users i' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_mnet_application`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_application` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `display_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `xmlrpc_server_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sso_land_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sso_jump_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Information about applications on remote hosts' AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `mdl_mnet_application`
--

INSERT INTO `mdl_mnet_application` (`id`, `name`, `display_name`, `xmlrpc_server_url`, `sso_land_url`, `sso_jump_url`) VALUES
(1, 'moodle', 'Moodle', '/mnet/xmlrpc/server.php', '/auth/mnet/land.php', '/auth/mnet/jump.php'),
(2, 'mahara', 'Mahara', '/api/xmlrpc/server.php', '/auth/xmlrpc/land.php', '/auth/xmlrpc/jump.php');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_mnet_host`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_host` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `wwwroot` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `public_key` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `public_key_expires` bigint(10) unsigned NOT NULL DEFAULT '0',
  `transport` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `portno` mediumint(5) unsigned NOT NULL DEFAULT '0',
  `last_connect_time` bigint(10) unsigned NOT NULL DEFAULT '0',
  `last_log_id` bigint(10) unsigned NOT NULL DEFAULT '0',
  `force_theme` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `theme` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `applicationid` bigint(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_mnethost_app_ix` (`applicationid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Information about the local and remote hosts for RPC' AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `mdl_mnet_host`
--

INSERT INTO `mdl_mnet_host` (`id`, `deleted`, `wwwroot`, `ip_address`, `name`, `public_key`, `public_key_expires`, `transport`, `portno`, `last_connect_time`, `last_log_id`, `force_theme`, `theme`, `applicationid`) VALUES
(1, 0, 'http://localhost', '127.0.0.1', '', '', 0, 0, 0, 0, 0, 0, NULL, 1),
(2, 0, '', '', 'All Hosts', '', 0, 0, 0, 0, 0, 0, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_mnet_host2service`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_host2service` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `hostid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `serviceid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `publish` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `subscribe` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnethost_hosser_uix` (`hostid`,`serviceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Information about the services for a given host' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_mnet_log`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_log` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `hostid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `remoteid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `time` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `ip` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `coursename` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `module` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cmid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `action` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `info` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_mnetlog_hosusecou_ix` (`hostid`,`userid`,`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Store session data from users migrating to other sites' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_mnet_remote_rpc`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_remote_rpc` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `functionname` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `xmlrpcpath` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `plugintype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pluginname` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table describes functions that might be called remotely' AUTO_INCREMENT=17 ;

--
-- Volcado de datos para la tabla `mdl_mnet_remote_rpc`
--

INSERT INTO `mdl_mnet_remote_rpc` (`id`, `functionname`, `xmlrpcpath`, `plugintype`, `pluginname`, `enabled`) VALUES
(1, 'user_authorise', 'auth/mnet/auth.php/user_authorise', 'auth', 'mnet', 1),
(2, 'keepalive_server', 'auth/mnet/auth.php/keepalive_server', 'auth', 'mnet', 1),
(3, 'kill_children', 'auth/mnet/auth.php/kill_children', 'auth', 'mnet', 1),
(4, 'refresh_log', 'auth/mnet/auth.php/refresh_log', 'auth', 'mnet', 1),
(5, 'fetch_user_image', 'auth/mnet/auth.php/fetch_user_image', 'auth', 'mnet', 1),
(6, 'fetch_theme_info', 'auth/mnet/auth.php/fetch_theme_info', 'auth', 'mnet', 1),
(7, 'update_enrolments', 'auth/mnet/auth.php/update_enrolments', 'auth', 'mnet', 1),
(8, 'keepalive_client', 'auth/mnet/auth.php/keepalive_client', 'auth', 'mnet', 1),
(9, 'kill_child', 'auth/mnet/auth.php/kill_child', 'auth', 'mnet', 1),
(10, 'available_courses', 'enrol/mnet/enrol.php/available_courses', 'enrol', 'mnet', 1),
(11, 'user_enrolments', 'enrol/mnet/enrol.php/user_enrolments', 'enrol', 'mnet', 1),
(12, 'enrol_user', 'enrol/mnet/enrol.php/enrol_user', 'enrol', 'mnet', 1),
(13, 'unenrol_user', 'enrol/mnet/enrol.php/unenrol_user', 'enrol', 'mnet', 1),
(14, 'course_enrolments', 'enrol/mnet/enrol.php/course_enrolments', 'enrol', 'mnet', 1),
(15, 'send_content_intent', 'portfolio/mahara/lib.php/send_content_intent', 'portfolio', 'mahara', 1),
(16, 'send_content_ready', 'portfolio/mahara/lib.php/send_content_ready', 'portfolio', 'mahara', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_mnet_remote_service2rpc`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_remote_service2rpc` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `serviceid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `rpcid` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetremoserv_rpcser_uix` (`rpcid`,`serviceid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Group functions or methods under a service' AUTO_INCREMENT=17 ;

--
-- Volcado de datos para la tabla `mdl_mnet_remote_service2rpc`
--

INSERT INTO `mdl_mnet_remote_service2rpc` (`id`, `serviceid`, `rpcid`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 2, 8),
(9, 2, 9),
(10, 3, 10),
(11, 3, 11),
(12, 3, 12),
(13, 3, 13),
(14, 3, 14),
(15, 4, 15),
(16, 4, 16);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_mnet_rpc`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_rpc` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `functionname` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `xmlrpcpath` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `plugintype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pluginname` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `help` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `profile` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `filename` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `classname` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `static` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_mnetrpc_enaxml_ix` (`enabled`,`xmlrpcpath`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Functions or methods that we may publish or subscribe to' AUTO_INCREMENT=16 ;

--
-- Volcado de datos para la tabla `mdl_mnet_rpc`
--

INSERT INTO `mdl_mnet_rpc` (`id`, `functionname`, `xmlrpcpath`, `plugintype`, `pluginname`, `enabled`, `help`, `profile`, `filename`, `classname`, `static`) VALUES
(1, 'user_authorise', 'auth/mnet/auth.php/user_authorise', 'auth', 'mnet', 1, 'Return user data for the provided token, compare with user_agent string.', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:5:"token";s:4:"type";s:6:"string";s:11:"description";s:37:"The unique ID provided by remotehost.";}i:1;a:3:{s:4:"name";s:9:"useragent";s:4:"type";s:6:"string";s:11:"description";s:0:"";}}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:44:"$userdata Array of user info for remote host";}}', 'auth.php', 'auth_plugin_mnet', 0),
(2, 'keepalive_server', 'auth/mnet/auth.php/keepalive_server', 'auth', 'mnet', 1, 'Receives an array of usernames from a remote machine and prods their\nsessions to keep them alive', 'a:2:{s:10:"parameters";a:1:{i:0;a:3:{s:4:"name";s:5:"array";s:4:"type";s:5:"array";s:11:"description";s:21:"An array of usernames";}}s:6:"return";a:2:{s:4:"type";s:6:"string";s:11:"description";s:28:""All ok" or an error message";}}', 'auth.php', 'auth_plugin_mnet', 0),
(3, 'kill_children', 'auth/mnet/auth.php/kill_children', 'auth', 'mnet', 1, 'The IdP uses this function to kill child sessions on other hosts', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:6:"string";s:11:"description";s:28:"Username for session to kill";}i:1;a:3:{s:4:"name";s:9:"useragent";s:4:"type";s:6:"string";s:11:"description";s:0:"";}}s:6:"return";a:2:{s:4:"type";s:6:"string";s:11:"description";s:39:"A plaintext report of what has happened";}}', 'auth.php', 'auth_plugin_mnet', 0),
(4, 'refresh_log', 'auth/mnet/auth.php/refresh_log', 'auth', 'mnet', 1, 'Receives an array of log entries from an SP and adds them to the mnet_log\ntable', 'a:2:{s:10:"parameters";a:1:{i:0;a:3:{s:4:"name";s:5:"array";s:4:"type";s:5:"array";s:11:"description";s:21:"An array of usernames";}}s:6:"return";a:2:{s:4:"type";s:6:"string";s:11:"description";s:28:""All ok" or an error message";}}', 'auth.php', 'auth_plugin_mnet', 0),
(5, 'fetch_user_image', 'auth/mnet/auth.php/fetch_user_image', 'auth', 'mnet', 1, 'Returns the user''s profile image info\nIf the user exists and has a profile picture, the returned array will contain keys:\n f1          - the content of the default 100x100px image\n f1_mimetype - the mimetype of the f1 file\n f2          - the content of the 35x35px variant of the image\n f2_mimetype - the mimetype of the f2 file\nThe mimetype information was added in Moodle 2.0. In Moodle 1.x, images are always jpegs.', 'a:2:{s:10:"parameters";a:1:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:3:"int";s:11:"description";s:18:"The id of the user";}}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:84:"false if user not found, empty array if no picture exists, array with data otherwise";}}', 'auth.php', 'auth_plugin_mnet', 0),
(6, 'fetch_theme_info', 'auth/mnet/auth.php/fetch_theme_info', 'auth', 'mnet', 1, 'Returns the theme information and logo url as strings.', 'a:2:{s:10:"parameters";a:0:{}s:6:"return";a:2:{s:4:"type";s:6:"string";s:11:"description";s:14:"The theme info";}}', 'auth.php', 'auth_plugin_mnet', 0),
(7, 'update_enrolments', 'auth/mnet/auth.php/update_enrolments', 'auth', 'mnet', 1, 'Invoke this function _on_ the IDP to update it with enrolment info local to\nthe SP right after calling user_authorise()\nNormally called by the SP after calling user_authorise()', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:6:"string";s:11:"description";s:12:"The username";}i:1;a:3:{s:4:"name";s:7:"courses";s:4:"type";s:5:"array";s:11:"description";s:0:"";}}s:6:"return";a:2:{s:4:"type";s:4:"bool";s:11:"description";s:0:"";}}', 'auth.php', 'auth_plugin_mnet', 0),
(8, 'keepalive_client', 'auth/mnet/auth.php/keepalive_client', 'auth', 'mnet', 1, 'Poll the IdP server to let it know that a user it has authenticated is still\nonline', 'a:2:{s:10:"parameters";a:0:{}s:6:"return";a:2:{s:4:"type";s:4:"void";s:11:"description";s:0:"";}}', 'auth.php', 'auth_plugin_mnet', 0),
(9, 'kill_child', 'auth/mnet/auth.php/kill_child', 'auth', 'mnet', 1, 'When the IdP requests that child sessions are terminated,\nthis function will be called on each of the child hosts. The machine that\ncalls the function (over xmlrpc) provides us with the mnethostid we need.', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:6:"string";s:11:"description";s:28:"Username for session to kill";}i:1;a:3:{s:4:"name";s:9:"useragent";s:4:"type";s:6:"string";s:11:"description";s:0:"";}}s:6:"return";a:2:{s:4:"type";s:4:"bool";s:11:"description";s:15:"True on success";}}', 'auth.php', 'auth_plugin_mnet', 0),
(10, 'available_courses', 'enrol/mnet/enrol.php/available_courses', 'enrol', 'mnet', 1, 'Returns list of courses that we offer to the caller for remote enrolment of their users\nSince Moodle 2.0, courses are made available for MNet peers by creating an instance\nof enrol_mnet plugin for the course. Hidden courses are not returned. If there are two\ninstances - one specific for the host and one for ''All hosts'', the setting of the specific\none is used. The id of the peer is kept in customint1, no other custom fields are used.', 'a:2:{s:10:"parameters";a:0:{}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:0:"";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(11, 'user_enrolments', 'enrol/mnet/enrol.php/user_enrolments', 'enrol', 'mnet', 1, 'This method has never been implemented in Moodle MNet API', 'a:2:{s:10:"parameters";a:0:{}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:11:"empty array";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(12, 'enrol_user', 'enrol/mnet/enrol.php/enrol_user', 'enrol', 'mnet', 1, 'Enrol remote user to our course\nIf we do not have local record for the remote user in our database,\nit gets created here.', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"userdata";s:4:"type";s:5:"array";s:11:"description";s:14:"user details {";}i:1;a:3:{s:4:"name";s:8:"courseid";s:4:"type";s:3:"int";s:11:"description";s:19:"our local course id";}}s:6:"return";a:2:{s:4:"type";s:4:"bool";s:11:"description";s:69:"true if the enrolment has been successful, throws exception otherwise";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(13, 'unenrol_user', 'enrol/mnet/enrol.php/unenrol_user', 'enrol', 'mnet', 1, 'Unenrol remote user from our course\nOnly users enrolled via enrol_mnet plugin can be unenrolled remotely. If the\nremote user is enrolled into the local course via some other enrol plugin\n(enrol_manual for example), the remote host can''t touch such enrolment. Please\ndo not report this behaviour as bug, it is a feature ;-)', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:6:"string";s:11:"description";s:18:"of the remote user";}i:1;a:3:{s:4:"name";s:8:"courseid";s:4:"type";s:3:"int";s:11:"description";s:0:"";}}s:6:"return";a:2:{s:4:"type";s:4:"bool";s:11:"description";s:71:"true if the unenrolment has been successful, throws exception otherwise";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(14, 'course_enrolments', 'enrol/mnet/enrol.php/course_enrolments', 'enrol', 'mnet', 1, 'Returns a list of users from the client server who are enrolled in our course\nSuitable instance of enrol_mnet must be created in the course. This method will not\nreturn any information about the enrolments in courses that are not available for\nremote enrolment, even if their users are enrolled into them via other plugin\n(note the difference from {@link self::user_enrolments()}).\nThis method will return enrolment information for users from hosts regardless\nthe enrolment plugin. It does not matter if the user was enrolled remotely by\ntheir admin or locally. Once the course is available for remote enrolments, we\nwill tell them everything about their users.\nIn Moodle 1.x the returned array used to be indexed by username. The side effect\nof MDL-19219 fix is that we do not need to use such index and therefore we can\nreturn all enrolment records. MNet clients 1.x will only use the last record for\nthe student, if she is enrolled via multiple plugins.', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"courseid";s:4:"type";s:3:"int";s:11:"description";s:16:"ID of our course";}i:1;a:3:{s:4:"name";s:5:"roles";s:4:"type";s:5:"array";s:11:"description";s:0:"";}}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:0:"";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(15, 'fetch_file', 'portfolio/mahara/lib.php/fetch_file', 'portfolio', 'mahara', 1, 'xmlrpc (mnet) function to get the file.\nreads in the file and returns it base_64 encoded\nso that it can be enrypted by mnet.', 'a:2:{s:10:"parameters";a:1:{i:0;a:3:{s:4:"name";s:5:"token";s:4:"type";s:6:"string";s:11:"description";s:56:"the token recieved previously during send_content_intent";}}s:6:"return";a:2:{s:4:"type";s:4:"void";s:11:"description";s:0:"";}}', 'lib.php', 'portfolio_plugin_mahara', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_mnet_service`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_service` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `apiversion` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `offer` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='A service is a group of functions' AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `mdl_mnet_service`
--

INSERT INTO `mdl_mnet_service` (`id`, `name`, `description`, `apiversion`, `offer`) VALUES
(1, 'sso_idp', '', '1', 1),
(2, 'sso_sp', '', '1', 1),
(3, 'mnet_enrol', '', '1', 1),
(4, 'pf', '', '1', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_mnet_service2rpc`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_service2rpc` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `serviceid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `rpcid` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetserv_rpcser_uix` (`rpcid`,`serviceid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Group functions or methods under a service' AUTO_INCREMENT=16 ;

--
-- Volcado de datos para la tabla `mdl_mnet_service2rpc`
--

INSERT INTO `mdl_mnet_service2rpc` (`id`, `serviceid`, `rpcid`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 2, 8),
(9, 2, 9),
(10, 3, 10),
(11, 3, 11),
(12, 3, 12),
(13, 3, 13),
(14, 3, 14),
(15, 4, 15);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_mnet_session`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_session` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `token` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mnethostid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `useragent` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `confirm_timeout` bigint(10) unsigned NOT NULL DEFAULT '0',
  `session_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expires` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetsess_tok_uix` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Store session data from users migrating to other sites' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_mnet_sso_access_control`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_sso_access_control` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mnet_host_id` bigint(10) unsigned NOT NULL DEFAULT '0',
  `accessctrl` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'allow',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetssoaccecont_mneuse_uix` (`mnet_host_id`,`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Users by host permitted (or not) to login from a remote prov' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_modules`
--

CREATE TABLE IF NOT EXISTS `mdl_modules` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `version` bigint(10) NOT NULL DEFAULT '0',
  `cron` bigint(10) unsigned NOT NULL DEFAULT '0',
  `lastcron` bigint(10) unsigned NOT NULL DEFAULT '0',
  `search` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_modu_nam_ix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='modules available in the site' AUTO_INCREMENT=20 ;

--
-- Volcado de datos para la tabla `mdl_modules`
--

INSERT INTO `mdl_modules` (`id`, `name`, `version`, `cron`, `lastcron`, `search`, `visible`) VALUES
(1, 'assignment', 2010102600, 60, 0, '', 1),
(2, 'chat', 2010080302, 300, 0, '', 1),
(3, 'choice', 2010101300, 0, 0, '', 1),
(4, 'data', 2011052300, 60, 0, '', 1),
(5, 'feedback', 2011051600, 0, 0, '', 0),
(6, 'folder', 2010101400, 0, 0, '', 1),
(7, 'forum', 2011052300, 60, 0, '', 1),
(8, 'glossary', 2011052300, 0, 0, '', 1),
(9, 'imscp', 2010101400, 0, 0, '', 1),
(10, 'label', 2010080300, 0, 0, '', 1),
(11, 'lesson', 2010122200, 0, 0, '', 1),
(12, 'page', 2010101400, 0, 0, '', 1),
(13, 'quiz', 2011070100, 0, 0, '', 1),
(14, 'resource', 2011022700, 0, 0, '', 1),
(15, 'scorm', 2011021402, 300, 0, '', 1),
(16, 'survey', 2010080300, 0, 0, '', 1),
(17, 'url', 2010101400, 0, 0, '', 1),
(18, 'wiki', 2011011001, 0, 0, '', 1),
(19, 'workshop', 2011061000, 0, 0, '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_my_pages`
--

CREATE TABLE IF NOT EXISTS `mdl_my_pages` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned DEFAULT '0',
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `private` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `sortorder` mediumint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_mypage_usepri_ix` (`userid`,`private`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Extra user pages for the My Moodle system' AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `mdl_my_pages`
--

INSERT INTO `mdl_my_pages` (`id`, `userid`, `name`, `private`, `sortorder`) VALUES
(1, NULL, '__default', 0, 0),
(2, NULL, '__default', 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_page`
--

CREATE TABLE IF NOT EXISTS `mdl_page` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` text COLLATE utf8_unicode_ci,
  `introformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  `content` mediumtext COLLATE utf8_unicode_ci,
  `contentformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  `legacyfiles` smallint(4) unsigned NOT NULL DEFAULT '0',
  `legacyfileslast` bigint(10) unsigned DEFAULT NULL,
  `display` smallint(4) unsigned NOT NULL DEFAULT '0',
  `displayoptions` text COLLATE utf8_unicode_ci,
  `revision` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_page_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each record is one page and its config data' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_portfolio_instance`
--

CREATE TABLE IF NOT EXISTS `mdl_portfolio_instance` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `plugin` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `visible` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='base table (not including config data) for instances of port' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_portfolio_instance_config`
--

CREATE TABLE IF NOT EXISTS `mdl_portfolio_instance_config` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `instance` bigint(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_portinstconf_nam_ix` (`name`),
  KEY `mdl_portinstconf_ins_ix` (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='config for portfolio plugin instances' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_portfolio_instance_user`
--

CREATE TABLE IF NOT EXISTS `mdl_portfolio_instance_user` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `instance` bigint(10) unsigned NOT NULL,
  `userid` bigint(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_portinstuser_ins_ix` (`instance`),
  KEY `mdl_portinstuser_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='user data for portfolio instances.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_portfolio_log`
--

CREATE TABLE IF NOT EXISTS `mdl_portfolio_log` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL,
  `time` bigint(10) unsigned NOT NULL,
  `portfolio` bigint(10) unsigned NOT NULL,
  `caller_class` varchar(150) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `caller_file` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `caller_sha1` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tempdataid` bigint(10) NOT NULL DEFAULT '0',
  `returnurl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `continueurl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_portlog_use_ix` (`userid`),
  KEY `mdl_portlog_por_ix` (`portfolio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='log of portfolio transfers (used to later check for duplicat' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_portfolio_mahara_queue`
--

CREATE TABLE IF NOT EXISTS `mdl_portfolio_mahara_queue` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `transferid` bigint(10) unsigned NOT NULL,
  `token` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_portmahaqueu_tok_ix` (`token`),
  KEY `mdl_portmahaqueu_tra_ix` (`transferid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='maps mahara tokens to transfer ids' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_portfolio_tempdata`
--

CREATE TABLE IF NOT EXISTS `mdl_portfolio_tempdata` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext COLLATE utf8_unicode_ci,
  `expirytime` bigint(10) unsigned NOT NULL,
  `userid` bigint(10) unsigned NOT NULL,
  `instance` bigint(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_porttemp_use_ix` (`userid`),
  KEY `mdl_porttemp_ins_ix` (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='stores temporary data for portfolio exports. the id of this ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_post`
--

CREATE TABLE IF NOT EXISTS `mdl_post` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `courseid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `groupid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `moduleid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `coursemoduleid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `summary` longtext COLLATE utf8_unicode_ci,
  `content` longtext COLLATE utf8_unicode_ci,
  `uniquehash` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rating` bigint(10) unsigned NOT NULL DEFAULT '0',
  `format` bigint(10) unsigned NOT NULL DEFAULT '0',
  `summaryformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `attachment` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `publishstate` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'draft',
  `lastmodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `created` bigint(10) unsigned NOT NULL DEFAULT '0',
  `usermodified` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_post_iduse_uix` (`id`,`userid`),
  KEY `mdl_post_las_ix` (`lastmodified`),
  KEY `mdl_post_mod_ix` (`module`),
  KEY `mdl_post_sub_ix` (`subject`),
  KEY `mdl_post_use_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Generic post table to hold data blog entries etc in differen' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_profiling`
--

CREATE TABLE IF NOT EXISTS `mdl_profiling` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `runid` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `totalexecutiontime` bigint(10) unsigned NOT NULL,
  `totalcputime` bigint(10) unsigned NOT NULL,
  `totalcalls` bigint(10) unsigned NOT NULL,
  `totalmemory` bigint(10) unsigned NOT NULL,
  `runreference` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `runcomment` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_prof_run_uix` (`runid`),
  KEY `mdl_prof_urlrun_ix` (`url`,`runreference`),
  KEY `mdl_prof_timrun_ix` (`timecreated`,`runreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the results of all the profiling runs' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_qtype_essay_options`
--

CREATE TABLE IF NOT EXISTS `mdl_qtype_essay_options` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) unsigned NOT NULL,
  `responseformat` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'editor',
  `responsefieldlines` smallint(4) NOT NULL DEFAULT '15',
  `attachments` smallint(4) NOT NULL DEFAULT '0',
  `graderinfo` text COLLATE utf8_unicode_ci,
  `graderinfoformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_qtypessaopti_que_uix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Extra options for essay questions.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_question`
--

CREATE TABLE IF NOT EXISTS `mdl_question` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `category` bigint(10) NOT NULL DEFAULT '0',
  `parent` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `questiontext` text COLLATE utf8_unicode_ci NOT NULL,
  `questiontextformat` tinyint(2) NOT NULL DEFAULT '0',
  `generalfeedback` text COLLATE utf8_unicode_ci NOT NULL,
  `generalfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `defaultmark` decimal(12,7) NOT NULL DEFAULT '1.0000000',
  `penalty` decimal(12,7) NOT NULL DEFAULT '0.3333333',
  `qtype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `length` bigint(10) unsigned NOT NULL DEFAULT '1',
  `stamp` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `hidden` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `createdby` bigint(10) unsigned DEFAULT NULL,
  `modifiedby` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_ques_cat_ix` (`category`),
  KEY `mdl_ques_par_ix` (`parent`),
  KEY `mdl_ques_cre_ix` (`createdby`),
  KEY `mdl_ques_mod_ix` (`modifiedby`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The questions themselves' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_question_answers`
--

CREATE TABLE IF NOT EXISTS `mdl_question_answers` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` bigint(10) unsigned NOT NULL DEFAULT '0',
  `answer` text COLLATE utf8_unicode_ci NOT NULL,
  `answerformat` tinyint(2) NOT NULL DEFAULT '0',
  `fraction` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  `feedback` text COLLATE utf8_unicode_ci NOT NULL,
  `feedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesansw_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Answers, with a fractional grade (0-1) and feedback' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_question_attempts`
--

CREATE TABLE IF NOT EXISTS `mdl_question_attempts` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `questionusageid` bigint(10) unsigned NOT NULL,
  `slot` bigint(10) unsigned NOT NULL,
  `behaviour` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `questionid` bigint(10) unsigned NOT NULL,
  `variant` bigint(10) unsigned NOT NULL DEFAULT '1',
  `maxmark` decimal(12,7) NOT NULL,
  `minfraction` decimal(12,7) NOT NULL,
  `flagged` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `questionsummary` text COLLATE utf8_unicode_ci,
  `rightanswer` text COLLATE utf8_unicode_ci,
  `responsesummary` text COLLATE utf8_unicode_ci,
  `timemodified` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quesatte_queslo_uix` (`questionusageid`,`slot`),
  KEY `mdl_quesatte_que_ix` (`questionid`),
  KEY `mdl_quesatte_que2_ix` (`questionusageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each row here corresponds to an attempt at one question, as ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_question_attempt_steps`
--

CREATE TABLE IF NOT EXISTS `mdl_question_attempt_steps` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `questionattemptid` bigint(10) unsigned NOT NULL,
  `sequencenumber` bigint(10) unsigned NOT NULL,
  `state` varchar(13) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fraction` decimal(12,7) DEFAULT NULL,
  `timecreated` bigint(10) unsigned NOT NULL,
  `userid` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quesattestep_queseq_uix` (`questionattemptid`,`sequencenumber`),
  KEY `mdl_quesattestep_que_ix` (`questionattemptid`),
  KEY `mdl_quesattestep_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores one step in in a question attempt. As well as the dat' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_question_attempt_step_data`
--

CREATE TABLE IF NOT EXISTS `mdl_question_attempt_step_data` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `attemptstepid` bigint(10) unsigned NOT NULL,
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quesattestepdata_attna_uix` (`attemptstepid`,`name`),
  KEY `mdl_quesattestepdata_att_ix` (`attemptstepid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each question_attempt_step has an associative array of the d' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_question_calculated`
--

CREATE TABLE IF NOT EXISTS `mdl_question_calculated` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` bigint(10) unsigned NOT NULL DEFAULT '0',
  `answer` bigint(10) unsigned NOT NULL DEFAULT '0',
  `tolerance` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0.0',
  `tolerancetype` bigint(10) NOT NULL DEFAULT '1',
  `correctanswerlength` bigint(10) NOT NULL DEFAULT '2',
  `correctanswerformat` bigint(10) NOT NULL DEFAULT '2',
  PRIMARY KEY (`id`),
  KEY `mdl_quescalc_ans_ix` (`answer`),
  KEY `mdl_quescalc_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for questions of type calculated' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_question_calculated_options`
--

CREATE TABLE IF NOT EXISTS `mdl_question_calculated_options` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` bigint(10) unsigned NOT NULL DEFAULT '0',
  `synchronize` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `single` smallint(4) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '0',
  `correctfeedback` text COLLATE utf8_unicode_ci,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` text COLLATE utf8_unicode_ci,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` text COLLATE utf8_unicode_ci,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `answernumbering` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'abc',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quescalcopti_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for questions of type calculated' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_question_categories`
--

CREATE TABLE IF NOT EXISTS `mdl_question_categories` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contextid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `info` text COLLATE utf8_unicode_ci NOT NULL,
  `infoformat` tinyint(2) NOT NULL DEFAULT '0',
  `stamp` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `parent` bigint(10) unsigned NOT NULL DEFAULT '0',
  `sortorder` bigint(10) unsigned NOT NULL DEFAULT '999',
  PRIMARY KEY (`id`),
  KEY `mdl_quescate_con_ix` (`contextid`),
  KEY `mdl_quescate_par_ix` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Categories are for grouping questions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_question_datasets`
--

CREATE TABLE IF NOT EXISTS `mdl_question_datasets` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` bigint(10) unsigned NOT NULL DEFAULT '0',
  `datasetdefinition` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesdata_quedat_ix` (`question`,`datasetdefinition`),
  KEY `mdl_quesdata_que_ix` (`question`),
  KEY `mdl_quesdata_dat_ix` (`datasetdefinition`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Many-many relation between questions and dataset definitions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_question_dataset_definitions`
--

CREATE TABLE IF NOT EXISTS `mdl_question_dataset_definitions` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `category` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` bigint(10) NOT NULL DEFAULT '0',
  `options` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemcount` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesdatadefi_cat_ix` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Organises and stores properties for dataset items' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_question_dataset_items`
--

CREATE TABLE IF NOT EXISTS `mdl_question_dataset_items` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `definition` bigint(10) unsigned NOT NULL DEFAULT '0',
  `itemnumber` bigint(10) unsigned NOT NULL DEFAULT '0',
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_quesdataitem_def_ix` (`definition`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Individual dataset items' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_question_hints`
--

CREATE TABLE IF NOT EXISTS `mdl_question_hints` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) unsigned NOT NULL,
  `hint` text COLLATE utf8_unicode_ci NOT NULL,
  `hintformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(1) unsigned DEFAULT NULL,
  `clearwrong` tinyint(1) unsigned DEFAULT NULL,
  `options` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_queshint_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the the part of the question definition that gives di' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_question_match`
--

CREATE TABLE IF NOT EXISTS `mdl_question_match` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` bigint(10) unsigned NOT NULL DEFAULT '0',
  `subquestions` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '1',
  `correctfeedback` text COLLATE utf8_unicode_ci NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` text COLLATE utf8_unicode_ci NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` text COLLATE utf8_unicode_ci NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesmatc_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines fixed matching questions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_question_match_sub`
--

CREATE TABLE IF NOT EXISTS `mdl_question_match_sub` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` bigint(10) unsigned NOT NULL DEFAULT '0',
  `question` bigint(10) unsigned NOT NULL DEFAULT '0',
  `questiontext` text COLLATE utf8_unicode_ci NOT NULL,
  `questiontextformat` tinyint(2) NOT NULL DEFAULT '0',
  `answertext` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_quesmatcsub_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines the subquestions that make up a matching question' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_question_multianswer`
--

CREATE TABLE IF NOT EXISTS `mdl_question_multianswer` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` bigint(10) unsigned NOT NULL DEFAULT '0',
  `sequence` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_quesmult_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for multianswer questions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_question_multichoice`
--

CREATE TABLE IF NOT EXISTS `mdl_question_multichoice` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` bigint(10) unsigned NOT NULL DEFAULT '0',
  `layout` smallint(4) NOT NULL DEFAULT '0',
  `answers` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `single` smallint(4) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '1',
  `correctfeedback` text COLLATE utf8_unicode_ci NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` text COLLATE utf8_unicode_ci NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` text COLLATE utf8_unicode_ci NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `answernumbering` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'abc',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesmult_que2_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for multiple choice questions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_question_numerical`
--

CREATE TABLE IF NOT EXISTS `mdl_question_numerical` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` bigint(10) unsigned NOT NULL DEFAULT '0',
  `answer` bigint(10) unsigned NOT NULL DEFAULT '0',
  `tolerance` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0.0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesnume_ans_ix` (`answer`),
  KEY `mdl_quesnume_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for numerical questions.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_question_numerical_options`
--

CREATE TABLE IF NOT EXISTS `mdl_question_numerical_options` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` bigint(10) unsigned NOT NULL DEFAULT '0',
  `showunits` smallint(4) unsigned NOT NULL DEFAULT '0',
  `unitsleft` smallint(4) NOT NULL DEFAULT '0',
  `unitgradingtype` smallint(4) unsigned NOT NULL DEFAULT '0',
  `unitpenalty` decimal(12,7) unsigned NOT NULL DEFAULT '0.1000000',
  PRIMARY KEY (`id`),
  KEY `mdl_quesnumeopti_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for questions of type numerical This table is also u' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_question_numerical_units`
--

CREATE TABLE IF NOT EXISTS `mdl_question_numerical_units` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` bigint(10) unsigned NOT NULL DEFAULT '0',
  `multiplier` decimal(40,20) NOT NULL DEFAULT '1.00000000000000000000',
  `unit` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quesnumeunit_queuni_uix` (`question`,`unit`),
  KEY `mdl_quesnumeunit_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Optional unit options for numerical questions. This table is' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_question_randomsamatch`
--

CREATE TABLE IF NOT EXISTS `mdl_question_randomsamatch` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` bigint(10) unsigned NOT NULL DEFAULT '0',
  `choose` bigint(10) unsigned NOT NULL DEFAULT '4',
  PRIMARY KEY (`id`),
  KEY `mdl_quesrand_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Info about a random short-answer matching question' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_question_sessions`
--

CREATE TABLE IF NOT EXISTS `mdl_question_sessions` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `attemptid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `questionid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `newest` bigint(10) unsigned NOT NULL DEFAULT '0',
  `newgraded` bigint(10) unsigned NOT NULL DEFAULT '0',
  `sumpenalty` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  `manualcomment` text COLLATE utf8_unicode_ci NOT NULL,
  `manualcommentformat` tinyint(2) NOT NULL DEFAULT '0',
  `flagged` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quessess_attque_uix` (`attemptid`,`questionid`),
  KEY `mdl_quessess_att_ix` (`attemptid`),
  KEY `mdl_quessess_que_ix` (`questionid`),
  KEY `mdl_quessess_new_ix` (`newest`),
  KEY `mdl_quessess_new2_ix` (`newgraded`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Gives ids of the newest open and newest graded states' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_question_shortanswer`
--

CREATE TABLE IF NOT EXISTS `mdl_question_shortanswer` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` bigint(10) unsigned NOT NULL DEFAULT '0',
  `answers` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `usecase` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesshor_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for short answer questions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_question_states`
--

CREATE TABLE IF NOT EXISTS `mdl_question_states` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `attempt` bigint(10) unsigned NOT NULL DEFAULT '0',
  `question` bigint(10) unsigned NOT NULL DEFAULT '0',
  `seq_number` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `answer` text COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` bigint(10) unsigned NOT NULL DEFAULT '0',
  `event` smallint(4) unsigned NOT NULL DEFAULT '0',
  `grade` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  `raw_grade` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  `penalty` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  PRIMARY KEY (`id`),
  KEY `mdl_quesstat_att_ix` (`attempt`),
  KEY `mdl_quesstat_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores user responses to an attempt, and percentage grades' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_question_truefalse`
--

CREATE TABLE IF NOT EXISTS `mdl_question_truefalse` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` bigint(10) unsigned NOT NULL DEFAULT '0',
  `trueanswer` bigint(10) unsigned NOT NULL DEFAULT '0',
  `falseanswer` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_questrue_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for True-False questions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_question_usages`
--

CREATE TABLE IF NOT EXISTS `mdl_question_usages` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) unsigned NOT NULL,
  `component` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `preferredbehaviour` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_quesusag_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table''s main purpose it to assign a unique id to each a' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_quiz`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` text COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  `timeopen` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeclose` bigint(10) unsigned NOT NULL DEFAULT '0',
  `preferredbehaviour` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `attempts` mediumint(6) NOT NULL DEFAULT '0',
  `attemptonlast` smallint(4) NOT NULL DEFAULT '0',
  `grademethod` smallint(4) NOT NULL DEFAULT '1',
  `decimalpoints` smallint(4) NOT NULL DEFAULT '2',
  `questiondecimalpoints` smallint(4) NOT NULL DEFAULT '-2',
  `reviewattempt` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `reviewcorrectness` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `reviewmarks` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `reviewspecificfeedback` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `reviewgeneralfeedback` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `reviewrightanswer` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `reviewoverallfeedback` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `questionsperpage` bigint(10) NOT NULL DEFAULT '0',
  `shufflequestions` smallint(4) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '0',
  `questions` text COLLATE utf8_unicode_ci NOT NULL,
  `sumgrades` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `grade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timelimit` bigint(10) unsigned NOT NULL DEFAULT '0',
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subnet` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `popup` smallint(4) NOT NULL DEFAULT '0',
  `delay1` bigint(10) NOT NULL DEFAULT '0',
  `delay2` bigint(10) NOT NULL DEFAULT '0',
  `showuserpicture` smallint(4) NOT NULL DEFAULT '0',
  `showblocks` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quiz_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Main information about each quiz' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_quiz_attempts`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_attempts` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniqueid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `quiz` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `attempt` mediumint(6) NOT NULL DEFAULT '0',
  `sumgrades` decimal(10,5) DEFAULT NULL,
  `timestart` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timefinish` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `layout` text COLLATE utf8_unicode_ci NOT NULL,
  `preview` smallint(3) unsigned NOT NULL DEFAULT '0',
  `needsupgradetonewqe` smallint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quizatte_uni_uix` (`uniqueid`),
  KEY `mdl_quizatte_use_ix` (`userid`),
  KEY `mdl_quizatte_qui_ix` (`quiz`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores various attempts on a quiz' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_quiz_feedback`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_feedback` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `quizid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `feedbacktext` text COLLATE utf8_unicode_ci NOT NULL,
  `feedbacktextformat` tinyint(2) NOT NULL DEFAULT '0',
  `mingrade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `maxgrade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  PRIMARY KEY (`id`),
  KEY `mdl_quizfeed_qui_ix` (`quizid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Feedback given to students based on which grade band their o' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_quiz_grades`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_grades` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `quiz` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `grade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quizgrad_use_ix` (`userid`),
  KEY `mdl_quizgrad_qui_ix` (`quiz`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The overall grade for each user on the quiz, based on their ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_quiz_overrides`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_overrides` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `quiz` bigint(10) unsigned NOT NULL DEFAULT '0',
  `groupid` bigint(10) unsigned DEFAULT NULL,
  `userid` bigint(10) unsigned DEFAULT NULL,
  `timeopen` bigint(10) unsigned DEFAULT NULL,
  `timeclose` bigint(10) unsigned DEFAULT NULL,
  `timelimit` bigint(10) unsigned DEFAULT NULL,
  `attempts` mediumint(6) unsigned DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_quizover_qui_ix` (`quiz`),
  KEY `mdl_quizover_gro_ix` (`groupid`),
  KEY `mdl_quizover_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The overrides to quiz settings on a per-user and per-group b' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_quiz_overview_regrades`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_overview_regrades` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `questionusageid` bigint(10) unsigned NOT NULL,
  `slot` bigint(10) unsigned NOT NULL,
  `newfraction` decimal(12,7) DEFAULT NULL,
  `oldfraction` decimal(12,7) DEFAULT NULL,
  `regraded` smallint(4) unsigned NOT NULL,
  `timemodified` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table records which question attempts need regrading an' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_quiz_question_instances`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_question_instances` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `quiz` bigint(10) unsigned NOT NULL DEFAULT '0',
  `question` bigint(10) unsigned NOT NULL DEFAULT '0',
  `grade` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  PRIMARY KEY (`id`),
  KEY `mdl_quizquesinst_qui_ix` (`quiz`),
  KEY `mdl_quizquesinst_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the maximum possible grade (weight) for each question' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_quiz_question_response_stats`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_question_response_stats` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `quizstatisticsid` bigint(10) unsigned NOT NULL,
  `questionid` bigint(10) unsigned NOT NULL,
  `subqid` bigint(10) unsigned NOT NULL,
  `aid` bigint(10) unsigned DEFAULT NULL,
  `response` longtext COLLATE utf8_unicode_ci,
  `rcount` bigint(10) unsigned DEFAULT NULL,
  `credit` decimal(15,5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Quiz question responses.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_quiz_question_statistics`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_question_statistics` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `quizstatisticsid` bigint(10) unsigned NOT NULL,
  `questionid` bigint(10) unsigned NOT NULL,
  `slot` bigint(10) unsigned DEFAULT NULL,
  `subquestion` smallint(4) unsigned NOT NULL,
  `s` bigint(10) unsigned NOT NULL DEFAULT '0',
  `effectiveweight` decimal(15,5) DEFAULT NULL,
  `negcovar` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `discriminationindex` decimal(15,5) DEFAULT NULL,
  `discriminativeefficiency` decimal(15,5) DEFAULT NULL,
  `sd` decimal(15,10) DEFAULT NULL,
  `facility` decimal(15,10) DEFAULT NULL,
  `subquestions` mediumtext COLLATE utf8_unicode_ci,
  `maxmark` decimal(12,7) DEFAULT NULL,
  `positions` mediumtext COLLATE utf8_unicode_ci,
  `randomguessscore` decimal(12,7) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Default comment for the table, please edit me' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_quiz_reports`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_reports` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `displayorder` bigint(10) unsigned NOT NULL,
  `lastcron` bigint(10) unsigned NOT NULL DEFAULT '0',
  `cron` bigint(10) unsigned NOT NULL DEFAULT '0',
  `capability` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quizrepo_nam_uix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Lists all the installed quiz reports and their display order' AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `mdl_quiz_reports`
--

INSERT INTO `mdl_quiz_reports` (`id`, `name`, `displayorder`, `lastcron`, `cron`, `capability`) VALUES
(1, 'overview', 10000, 0, 0, NULL),
(2, 'responses', 9000, 0, 0, NULL),
(3, 'grading', 6000, 0, 0, NULL),
(4, 'statistics', 8000, 0, 18000, 'quiz/statistics:view');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_quiz_statistics`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_statistics` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `quizid` bigint(10) unsigned NOT NULL,
  `groupid` bigint(10) unsigned NOT NULL,
  `allattempts` smallint(4) unsigned NOT NULL,
  `timemodified` bigint(10) unsigned NOT NULL,
  `firstattemptscount` bigint(10) unsigned NOT NULL,
  `allattemptscount` bigint(10) unsigned NOT NULL,
  `firstattemptsavg` decimal(15,5) DEFAULT NULL,
  `allattemptsavg` decimal(15,5) DEFAULT NULL,
  `median` decimal(15,5) DEFAULT NULL,
  `standarddeviation` decimal(15,5) DEFAULT NULL,
  `skewness` decimal(15,10) DEFAULT NULL,
  `kurtosis` decimal(15,5) DEFAULT NULL,
  `cic` decimal(15,10) DEFAULT NULL,
  `errorratio` decimal(15,10) DEFAULT NULL,
  `standarderror` decimal(15,10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='table to cache results from analysis done in statistics repo' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_rating`
--

CREATE TABLE IF NOT EXISTS `mdl_rating` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) unsigned NOT NULL,
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ratingarea` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) unsigned NOT NULL,
  `scaleid` bigint(10) NOT NULL,
  `rating` bigint(10) unsigned NOT NULL,
  `userid` bigint(10) unsigned NOT NULL,
  `timecreated` bigint(10) unsigned NOT NULL,
  `timemodified` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_rati_comratconite_ix` (`component`,`ratingarea`,`contextid`,`itemid`),
  KEY `mdl_rati_con_ix` (`contextid`),
  KEY `mdl_rati_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='moodle ratings' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_registration_hubs`
--

CREATE TABLE IF NOT EXISTS `mdl_registration_hubs` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `hubname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `huburl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `confirmed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `secret` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='hub where the site is registered on with their associated to' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_report_customlang`
--

CREATE TABLE IF NOT EXISTS `mdl_report_customlang` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `componentid` bigint(10) unsigned NOT NULL,
  `stringid` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `original` longtext COLLATE utf8_unicode_ci NOT NULL,
  `master` longtext COLLATE utf8_unicode_ci,
  `local` longtext COLLATE utf8_unicode_ci,
  `timemodified` bigint(10) unsigned NOT NULL,
  `timecustomized` bigint(10) unsigned DEFAULT NULL,
  `outdated` smallint(3) unsigned DEFAULT '0',
  `modified` smallint(3) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_repocust_lancomstr_uix` (`lang`,`componentid`,`stringid`),
  KEY `mdl_repocust_com_ix` (`componentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Contains the working checkout of all strings and their custo' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_report_customlang_components`
--

CREATE TABLE IF NOT EXISTS `mdl_report_customlang_components` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `version` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Contains the list of all installed plugins that provide thei' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_repository`
--

CREATE TABLE IF NOT EXISTS `mdl_repository` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `visible` tinyint(1) unsigned DEFAULT '1',
  `sortorder` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table contains one entry for every configured external ' AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `mdl_repository`
--

INSERT INTO `mdl_repository` (`id`, `type`, `visible`, `sortorder`) VALUES
(1, 'local', 1, 1),
(2, 'recent', 1, 2),
(3, 'upload', 1, 3),
(4, 'user', 1, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_repository_instances`
--

CREATE TABLE IF NOT EXISTS `mdl_repository_instances` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `typeid` bigint(10) unsigned NOT NULL,
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `contextid` bigint(10) unsigned NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timecreated` bigint(10) unsigned DEFAULT NULL,
  `timemodified` bigint(10) unsigned DEFAULT NULL,
  `readonly` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table contains one entry for every configured external ' AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `mdl_repository_instances`
--

INSERT INTO `mdl_repository_instances` (`id`, `name`, `typeid`, `userid`, `contextid`, `username`, `password`, `timecreated`, `timemodified`, `readonly`) VALUES
(1, '', 1, 0, 1, NULL, NULL, 1316566918, 1316566918, 0),
(2, '', 2, 0, 1, NULL, NULL, 1316566921, 1316566921, 0),
(3, '', 3, 0, 1, NULL, NULL, 1316566923, 1316566923, 0),
(4, '', 4, 0, 1, NULL, NULL, 1316566927, 1316566927, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_repository_instance_config`
--

CREATE TABLE IF NOT EXISTS `mdl_repository_instance_config` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `instanceid` bigint(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The config for intances' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_resource`
--

CREATE TABLE IF NOT EXISTS `mdl_resource` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` text COLLATE utf8_unicode_ci,
  `introformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  `tobemigrated` smallint(4) unsigned NOT NULL DEFAULT '0',
  `legacyfiles` smallint(4) unsigned NOT NULL DEFAULT '0',
  `legacyfileslast` bigint(10) unsigned DEFAULT NULL,
  `display` smallint(4) unsigned NOT NULL DEFAULT '0',
  `displayoptions` text COLLATE utf8_unicode_ci,
  `filterfiles` smallint(4) unsigned NOT NULL DEFAULT '0',
  `revision` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_reso_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each record is one resource and its config data' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_resource_old`
--

CREATE TABLE IF NOT EXISTS `mdl_resource_old` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reference` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` text COLLATE utf8_unicode_ci,
  `introformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  `alltext` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `popup` text COLLATE utf8_unicode_ci NOT NULL,
  `options` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `oldid` bigint(10) unsigned NOT NULL,
  `cmid` bigint(10) unsigned DEFAULT NULL,
  `newmodule` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) unsigned DEFAULT NULL,
  `migrated` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_resoold_old_uix` (`oldid`),
  KEY `mdl_resoold_cmi_ix` (`cmid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='backup of all old resource instances from 1.9' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_role`
--

CREATE TABLE IF NOT EXISTS `mdl_role` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shortname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `sortorder` bigint(10) unsigned NOT NULL DEFAULT '0',
  `archetype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_role_sor_uix` (`sortorder`),
  UNIQUE KEY `mdl_role_nam_uix` (`name`),
  UNIQUE KEY `mdl_role_sho_uix` (`shortname`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='moodle roles' AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `mdl_role`
--

INSERT INTO `mdl_role` (`id`, `name`, `shortname`, `description`, `sortorder`, `archetype`) VALUES
(3, 'Mediador', 'editingteacher', '<p>Los profesores pueden realizar cualquier acción dentro de un curso, incluyendo cambiar actividades y calificar a los estudiantes.</p>', 5, 'editingteacher'),
(5, 'Aprendiz', 'student', '<p>Los estudiantes tienen por lo general menos privilegios dentro de un curso.</p>', 6, 'student'),
(6, 'Visitante', 'guest', '<p>Los invitados tienen privilegios mínimos y normalmente no están autorizados para escribir.</p>', 7, 'guest'),
(7, 'Miembro', 'user', '<p>Todos los usuarios identificados.</p>', 8, 'user'),
(8, 'Administrador', 'admin', '', 3, 'manager');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_role_allow_assign`
--

CREATE TABLE IF NOT EXISTS `mdl_role_allow_assign` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `allowassign` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolealloassi_rolall_uix` (`roleid`,`allowassign`),
  KEY `mdl_rolealloassi_rol_ix` (`roleid`),
  KEY `mdl_rolealloassi_all_ix` (`allowassign`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='this defines what role can assign what role' AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `mdl_role_allow_assign`
--

INSERT INTO `mdl_role_allow_assign` (`id`, `roleid`, `allowassign`) VALUES
(6, 3, 5),
(2, 8, 3),
(3, 8, 5),
(4, 8, 6),
(5, 8, 7),
(1, 8, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_role_allow_override`
--

CREATE TABLE IF NOT EXISTS `mdl_role_allow_override` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `allowoverride` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolealloover_rolall_uix` (`roleid`,`allowoverride`),
  KEY `mdl_rolealloover_rol_ix` (`roleid`),
  KEY `mdl_rolealloover_all_ix` (`allowoverride`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='this defines what role can override what role' AUTO_INCREMENT=12 ;

--
-- Volcado de datos para la tabla `mdl_role_allow_override`
--

INSERT INTO `mdl_role_allow_override` (`id`, `roleid`, `allowoverride`) VALUES
(10, 3, 5),
(11, 3, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_role_allow_switch`
--

CREATE TABLE IF NOT EXISTS `mdl_role_allow_switch` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) unsigned NOT NULL,
  `allowswitch` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolealloswit_rolall_uix` (`roleid`,`allowswitch`),
  KEY `mdl_rolealloswit_rol_ix` (`roleid`),
  KEY `mdl_rolealloswit_all_ix` (`allowswitch`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table stores which which other roles a user is allowed ' AUTO_INCREMENT=10 ;

--
-- Volcado de datos para la tabla `mdl_role_allow_switch`
--

INSERT INTO `mdl_role_allow_switch` (`id`, `roleid`, `allowswitch`) VALUES
(1, 1, 3),
(2, 1, 4),
(3, 1, 5),
(4, 1, 6),
(5, 3, 4),
(6, 3, 5),
(7, 3, 6),
(8, 4, 5),
(9, 4, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_role_assignments`
--

CREATE TABLE IF NOT EXISTS `mdl_role_assignments` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `contextid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `modifierid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `sortorder` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_roleassi_sor_ix` (`sortorder`),
  KEY `mdl_roleassi_rol_ix` (`roleid`),
  KEY `mdl_roleassi_con_ix` (`contextid`),
  KEY `mdl_roleassi_use_ix` (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='assigning roles in different context' AUTO_INCREMENT=18 ;

--
-- Volcado de datos para la tabla `mdl_role_assignments`
--

INSERT INTO `mdl_role_assignments` (`id`, `roleid`, `contextid`, `userid`, `timemodified`, `modifierid`, `component`, `itemid`, `sortorder`) VALUES
(2, 8, 1, 12, 1317245692, 2, '', 0, 0),
(3, 3, 1, 14, 1317326278, 2, '', 0, 0),
(4, 5, 1, 13, 1317326290, 2, '', 0, 0),
(5, 7, 1, 11, 1317326306, 2, '', 0, 0),
(6, 5, 40, 13, 1317391057, 12, '', 0, 0),
(14, 3, 46, 14, 1318009918, 12, '', 0, 0),
(15, 3, 24, 14, 1318009984, 12, '', 0, 0),
(17, 5, 24, 13, 1318012391, 14, '', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_role_capabilities`
--

CREATE TABLE IF NOT EXISTS `mdl_role_capabilities` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `roleid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `capability` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `permission` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `modifierid` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolecapa_rolconcap_uix` (`roleid`,`contextid`,`capability`),
  KEY `mdl_rolecapa_rol_ix` (`roleid`),
  KEY `mdl_rolecapa_con_ix` (`contextid`),
  KEY `mdl_rolecapa_mod_ix` (`modifierid`),
  KEY `mdl_rolecapa_cap_ix` (`capability`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='permission has to be signed, overriding a capability for a p' AUTO_INCREMENT=1326 ;

--
-- Volcado de datos para la tabla `mdl_role_capabilities`
--

INSERT INTO `mdl_role_capabilities` (`id`, `contextid`, `roleid`, `capability`, `permission`, `timemodified`, `modifierid`) VALUES
(2, 1, 3, 'moodle/site:readallmessages', 1, 1316566414, 0),
(4, 1, 7, 'moodle/site:sendmessage', 1, 1316566414, 0),
(6, 1, 3, 'moodle/backup:backupcourse', 1, 1316566414, 0),
(8, 1, 3, 'moodle/backup:backupsection', 1, 1316566415, 0),
(10, 1, 3, 'moodle/backup:backupactivity', 1, 1316566415, 0),
(12, 1, 3, 'moodle/backup:backuptargethub', 1, 1316566415, 0),
(14, 1, 3, 'moodle/backup:backuptargetimport', 1, 1316566415, 0),
(16, 1, 3, 'moodle/backup:downloadfile', 1, 1316566415, 0),
(18, 1, 3, 'moodle/backup:configure', 1, 1316566415, 0),
(22, 1, 3, 'moodle/restore:restorecourse', 1, 1316566416, 0),
(24, 1, 3, 'moodle/restore:restoresection', 1, 1316566417, 0),
(26, 1, 3, 'moodle/restore:restoreactivity', 1, 1316566417, 0),
(28, 1, 3, 'moodle/restore:restoretargethub', 1, 1316566417, 0),
(30, 1, 3, 'moodle/restore:restoretargetimport', 1, 1316566418, 0),
(32, 1, 3, 'moodle/restore:uploadfile', 1, 1316566418, 0),
(34, 1, 3, 'moodle/restore:configure', 1, 1316566418, 0),
(40, 1, 3, 'moodle/site:manageblocks', 1, 1316566419, 0),
(43, 1, 3, 'moodle/site:accessallgroups', 1, 1316566419, 0),
(46, 1, 3, 'moodle/site:viewfullnames', 1, 1316566419, 0),
(49, 1, 3, 'moodle/site:viewreports', 1, 1316566420, 0),
(51, 1, 3, 'moodle/site:trustcontent', 1, 1316566420, 0),
(54, 1, 3, 'moodle/filter:manage', 1, 1316566420, 0),
(59, 1, 6, 'moodle/user:viewdetails', 1, 1316566421, 0),
(60, 1, 5, 'moodle/user:viewdetails', 1, 1316566421, 0),
(62, 1, 3, 'moodle/user:viewdetails', 1, 1316566421, 0),
(66, 1, 3, 'moodle/user:viewhiddendetails', 1, 1316566421, 0),
(70, 1, 7, 'moodle/user:manageownblocks', 1, 1316566422, 0),
(71, 1, 7, 'moodle/user:manageownfiles', 1, 1316566422, 0),
(73, 1, 3, 'moodle/role:assign', 1, 1316566422, 0),
(76, 1, 3, 'moodle/role:review', 1, 1316566422, 0),
(79, 1, 3, 'moodle/role:safeoverride', 1, 1316566422, 0),
(81, 1, 3, 'moodle/role:switchroles', 1, 1316566423, 0),
(88, 1, 3, 'moodle/cohort:view', 1, 1316566423, 0),
(92, 1, 7, 'moodle/course:request', 1, 1316566424, 0),
(94, 1, 3, 'moodle/course:update', 1, 1316566424, 0),
(97, 1, 3, 'moodle/course:enrolreview', 1, 1316566424, 0),
(99, 1, 3, 'moodle/course:enrolconfig', 1, 1316566425, 0),
(102, 1, 3, 'moodle/course:bulkmessaging', 1, 1316566425, 0),
(105, 1, 3, 'moodle/course:viewhiddenuserfields', 1, 1316566425, 0),
(109, 1, 3, 'moodle/course:viewhiddencourses', 1, 1316566426, 0),
(111, 1, 3, 'moodle/course:visibility', 1, 1316566426, 0),
(113, 1, 3, 'moodle/course:managefiles', 1, 1316566426, 0),
(115, 1, 3, 'moodle/course:manageactivities', 1, 1316566426, 0),
(117, 1, 3, 'moodle/course:activityvisibility', 1, 1316566426, 0),
(120, 1, 3, 'moodle/course:viewhiddenactivities', 1, 1316566427, 0),
(122, 1, 5, 'moodle/course:viewparticipants', 1, 1316566427, 0),
(124, 1, 3, 'moodle/course:viewparticipants', 1, 1316566427, 0),
(126, 1, 3, 'moodle/course:changefullname', 1, 1316566427, 0),
(128, 1, 3, 'moodle/course:changeshortname', 1, 1316566427, 0),
(130, 1, 3, 'moodle/course:changeidnumber', 1, 1316566428, 0),
(132, 1, 3, 'moodle/course:changecategory', 1, 1316566428, 0),
(134, 1, 3, 'moodle/course:changesummary', 1, 1316566428, 0),
(137, 1, 5, 'moodle/course:viewscales', 1, 1316566429, 0),
(139, 1, 3, 'moodle/course:viewscales', 1, 1316566429, 0),
(141, 1, 3, 'moodle/course:managescales', 1, 1316566429, 0),
(143, 1, 3, 'moodle/course:managegroups', 1, 1316566429, 0),
(145, 1, 3, 'moodle/course:reset', 1, 1316566429, 0),
(147, 1, 6, 'moodle/blog:view', 1, 1316566429, 0),
(148, 1, 7, 'moodle/blog:view', 1, 1316566429, 0),
(149, 1, 5, 'moodle/blog:view', 1, 1316566429, 0),
(151, 1, 3, 'moodle/blog:view', 1, 1316566430, 0),
(153, 1, 6, 'moodle/blog:search', 1, 1316566430, 0),
(154, 1, 7, 'moodle/blog:search', 1, 1316566430, 0),
(155, 1, 5, 'moodle/blog:search', 1, 1316566430, 0),
(157, 1, 3, 'moodle/blog:search', 1, 1316566430, 0),
(160, 1, 7, 'moodle/blog:create', 1, 1316566431, 0),
(163, 1, 3, 'moodle/blog:manageentries', 1, 1316566431, 0),
(165, 1, 5, 'moodle/blog:manageexternal', 1, 1316566431, 0),
(166, 1, 7, 'moodle/blog:manageexternal', 1, 1316566431, 0),
(168, 1, 3, 'moodle/blog:manageexternal', 1, 1316566431, 0),
(170, 1, 5, 'moodle/blog:associatecourse', 1, 1316566431, 0),
(171, 1, 7, 'moodle/blog:associatecourse', 1, 1316566432, 0),
(173, 1, 3, 'moodle/blog:associatecourse', 1, 1316566432, 0),
(175, 1, 5, 'moodle/blog:associatemodule', 1, 1316566432, 0),
(176, 1, 7, 'moodle/blog:associatemodule', 1, 1316566432, 0),
(178, 1, 3, 'moodle/blog:associatemodule', 1, 1316566432, 0),
(180, 1, 7, 'moodle/calendar:manageownentries', 1, 1316566432, 0),
(183, 1, 3, 'moodle/calendar:managegroupentries', 1, 1316566432, 0),
(186, 1, 3, 'moodle/calendar:manageentries', 1, 1316566433, 0),
(189, 1, 6, 'moodle/user:editownprofile', -1000, 1316566433, 0),
(190, 1, 7, 'moodle/user:editownprofile', 1, 1316566433, 0),
(192, 1, 6, 'moodle/user:changeownpassword', -1000, 1316566433, 0),
(193, 1, 7, 'moodle/user:changeownpassword', 1, 1316566433, 0),
(195, 1, 5, 'moodle/user:readuserposts', 1, 1316566433, 0),
(197, 1, 3, 'moodle/user:readuserposts', 1, 1316566434, 0),
(199, 1, 5, 'moodle/user:readuserblogs', 1, 1316566434, 0),
(201, 1, 3, 'moodle/user:readuserblogs', 1, 1316566434, 0),
(204, 1, 6, 'moodle/user:editownmessageprofile', -1000, 1316566434, 0),
(205, 1, 7, 'moodle/user:editownmessageprofile', 1, 1316566434, 0),
(207, 1, 3, 'moodle/question:managecategory', 1, 1316566435, 0),
(209, 1, 3, 'moodle/question:add', 1, 1316566435, 0),
(211, 1, 3, 'moodle/question:editmine', 1, 1316566435, 0),
(213, 1, 3, 'moodle/question:editall', 1, 1316566435, 0),
(215, 1, 3, 'moodle/question:viewmine', 1, 1316566435, 0),
(217, 1, 3, 'moodle/question:viewall', 1, 1316566436, 0),
(219, 1, 3, 'moodle/question:usemine', 1, 1316566436, 0),
(221, 1, 3, 'moodle/question:useall', 1, 1316566436, 0),
(223, 1, 3, 'moodle/question:movemine', 1, 1316566436, 0),
(225, 1, 3, 'moodle/question:moveall', 1, 1316566436, 0),
(228, 1, 5, 'moodle/question:flag', 1, 1316566437, 0),
(230, 1, 3, 'moodle/question:flag', 1, 1316566437, 0),
(233, 1, 3, 'moodle/site:doclinks', 1, 1316566437, 0),
(235, 1, 3, 'moodle/course:sectionvisibility', 1, 1316566437, 0),
(237, 1, 3, 'moodle/course:useremail', 1, 1316566437, 0),
(239, 1, 3, 'moodle/course:viewhiddensections', 1, 1316566438, 0),
(241, 1, 3, 'moodle/course:setcurrentsection', 1, 1316566438, 0),
(244, 1, 3, 'moodle/grade:viewall', 1, 1316566439, 0),
(246, 1, 5, 'moodle/grade:view', 1, 1316566439, 0),
(248, 1, 3, 'moodle/grade:viewhidden', 1, 1316566439, 0),
(250, 1, 3, 'moodle/grade:import', 1, 1316566440, 0),
(253, 1, 3, 'moodle/grade:export', 1, 1316566440, 0),
(255, 1, 3, 'moodle/grade:manage', 1, 1316566440, 0),
(257, 1, 3, 'moodle/grade:edit', 1, 1316566440, 0),
(259, 1, 3, 'moodle/grade:manageoutcomes', 1, 1316566440, 0),
(261, 1, 3, 'moodle/grade:manageletters', 1, 1316566440, 0),
(263, 1, 3, 'moodle/grade:hide', 1, 1316566441, 0),
(265, 1, 3, 'moodle/grade:lock', 1, 1316566441, 0),
(267, 1, 3, 'moodle/grade:unlock', 1, 1316566441, 0),
(269, 1, 7, 'moodle/my:manageblocks', 1, 1316566441, 0),
(271, 1, 3, 'moodle/notes:view', 1, 1316566441, 0),
(274, 1, 3, 'moodle/notes:manage', 1, 1316566442, 0),
(277, 1, 3, 'moodle/tag:manage', 1, 1316566442, 0),
(280, 1, 7, 'moodle/tag:create', 1, 1316566442, 0),
(282, 1, 7, 'moodle/tag:edit', 1, 1316566442, 0),
(284, 1, 3, 'moodle/tag:editblocks', 1, 1316566442, 0),
(286, 1, 6, 'moodle/block:view', 1, 1316566443, 0),
(287, 1, 7, 'moodle/block:view', 1, 1316566443, 0),
(288, 1, 5, 'moodle/block:view', 1, 1316566443, 0),
(290, 1, 3, 'moodle/block:view', 1, 1316566443, 0),
(291, 1, 3, 'moodle/block:edit', 1, 1316566443, 0),
(292, 1, 7, 'moodle/portfolio:export', 1, 1316566443, 0),
(293, 1, 5, 'moodle/portfolio:export', 1, 1316566443, 0),
(295, 1, 3, 'moodle/portfolio:export', 1, 1316566443, 0),
(297, 1, 6, 'moodle/comment:view', 1, 1316566443, 0),
(298, 1, 7, 'moodle/comment:view', 1, 1316566443, 0),
(299, 1, 5, 'moodle/comment:view', 1, 1316566444, 0),
(301, 1, 3, 'moodle/comment:view', 1, 1316566444, 0),
(303, 1, 7, 'moodle/comment:post', 1, 1316566444, 0),
(304, 1, 5, 'moodle/comment:post', 1, 1316566444, 0),
(306, 1, 3, 'moodle/comment:post', 1, 1316566444, 0),
(308, 1, 3, 'moodle/comment:delete', 1, 1316566444, 0),
(311, 1, 7, 'moodle/webservice:createmobiletoken', 1, 1316566445, 0),
(312, 1, 7, 'moodle/rating:view', 1, 1316566445, 0),
(313, 1, 5, 'moodle/rating:view', 1, 1316566445, 0),
(315, 1, 3, 'moodle/rating:view', 1, 1316566445, 0),
(317, 1, 7, 'moodle/rating:viewany', 1, 1316566445, 0),
(318, 1, 5, 'moodle/rating:viewany', 1, 1316566445, 0),
(320, 1, 3, 'moodle/rating:viewany', 1, 1316566445, 0),
(322, 1, 7, 'moodle/rating:viewall', 1, 1316566445, 0),
(323, 1, 5, 'moodle/rating:viewall', 1, 1316566446, 0),
(325, 1, 3, 'moodle/rating:viewall', 1, 1316566446, 0),
(327, 1, 7, 'moodle/rating:rate', 1, 1316566446, 0),
(328, 1, 5, 'moodle/rating:rate', 1, 1316566446, 0),
(330, 1, 3, 'moodle/rating:rate', 1, 1316566446, 0),
(334, 1, 3, 'moodle/course:markcomplete', 1, 1316566446, 0),
(338, 1, 3, 'moodle/community:add', 1, 1316566447, 0),
(340, 1, 3, 'moodle/community:download', 1, 1316566447, 0),
(341, 1, 6, 'mod/assignment:view', 1, 1316566552, 0),
(342, 1, 5, 'mod/assignment:view', 1, 1316566552, 0),
(344, 1, 3, 'mod/assignment:view', 1, 1316566552, 0),
(346, 1, 5, 'mod/assignment:submit', 1, 1316566552, 0),
(348, 1, 3, 'mod/assignment:grade', 1, 1316566552, 0),
(351, 1, 3, 'mod/assignment:exportownsubmission', 1, 1316566553, 0),
(353, 1, 5, 'mod/assignment:exportownsubmission', 1, 1316566553, 0),
(354, 1, 5, 'mod/chat:chat', 1, 1316566562, 0),
(356, 1, 3, 'mod/chat:chat', 1, 1316566562, 0),
(358, 1, 5, 'mod/chat:readlog', 1, 1316566563, 0),
(360, 1, 3, 'mod/chat:readlog', 1, 1316566563, 0),
(363, 1, 3, 'mod/chat:deletelog', 1, 1316566563, 0),
(366, 1, 3, 'mod/chat:exportparticipatedsession', 1, 1316566564, 0),
(369, 1, 3, 'mod/chat:exportsession', 1, 1316566564, 0),
(371, 1, 5, 'mod/choice:choose', 1, 1316566571, 0),
(373, 1, 3, 'mod/choice:choose', 1, 1316566571, 0),
(375, 1, 3, 'mod/choice:readresponses', 1, 1316566571, 0),
(378, 1, 3, 'mod/choice:deleteresponses', 1, 1316566572, 0),
(381, 1, 3, 'mod/choice:downloadresponses', 1, 1316566572, 0),
(384, 1, 6, 'mod/data:viewentry', 1, 1316566582, 0),
(385, 1, 5, 'mod/data:viewentry', 1, 1316566582, 0),
(387, 1, 3, 'mod/data:viewentry', 1, 1316566583, 0),
(389, 1, 5, 'mod/data:writeentry', 1, 1316566583, 0),
(391, 1, 3, 'mod/data:writeentry', 1, 1316566583, 0),
(393, 1, 5, 'mod/data:comment', 1, 1316566583, 0),
(395, 1, 3, 'mod/data:comment', 1, 1316566584, 0),
(398, 1, 3, 'mod/data:rate', 1, 1316566584, 0),
(401, 1, 3, 'mod/data:viewrating', 1, 1316566585, 0),
(404, 1, 3, 'mod/data:viewanyrating', 1, 1316566585, 0),
(407, 1, 3, 'mod/data:viewallratings', 1, 1316566586, 0),
(410, 1, 3, 'mod/data:approve', 1, 1316566586, 0),
(413, 1, 3, 'mod/data:manageentries', 1, 1316566587, 0),
(416, 1, 3, 'mod/data:managecomments', 1, 1316566587, 0),
(418, 1, 3, 'mod/data:managetemplates', 1, 1316566588, 0),
(421, 1, 3, 'mod/data:viewalluserpresets', 1, 1316566589, 0),
(426, 1, 3, 'mod/data:exportentry', 1, 1316566591, 0),
(429, 1, 3, 'mod/data:exportownentry', 1, 1316566592, 0),
(430, 1, 5, 'mod/data:exportownentry', 1, 1316566592, 0),
(433, 1, 3, 'mod/data:exportallentries', 1, 1316566593, 0),
(434, 1, 6, 'mod/feedback:view', 1, 1316566612, 0),
(435, 1, 5, 'mod/feedback:view', 1, 1316566612, 0),
(437, 1, 3, 'mod/feedback:view', 1, 1316566613, 0),
(439, 1, 5, 'mod/feedback:complete', 1, 1316566613, 0),
(440, 1, 5, 'mod/feedback:viewanalysepage', 1, 1316566613, 0),
(441, 1, 3, 'mod/feedback:viewanalysepage', 1, 1316566613, 0),
(443, 1, 3, 'mod/feedback:deletesubmissions', 1, 1316566614, 0),
(446, 1, 3, 'mod/feedback:edititems', 1, 1316566614, 0),
(448, 1, 3, 'mod/feedback:createprivatetemplate', 1, 1316566614, 0),
(450, 1, 3, 'mod/feedback:createpublictemplate', 1, 1316566615, 0),
(452, 1, 3, 'mod/feedback:deletetemplate', 1, 1316566615, 0),
(455, 1, 3, 'mod/feedback:viewreports', 1, 1316566615, 0),
(458, 1, 3, 'mod/feedback:receivemail', 1, 1316566616, 0),
(459, 1, 6, 'mod/folder:view', 1, 1316566621, 0),
(460, 1, 7, 'mod/folder:view', 1, 1316566621, 0),
(461, 1, 3, 'mod/folder:managefiles', 1, 1316566621, 0),
(463, 1, 6, 'mod/forum:viewdiscussion', 1, 1316566635, 0),
(464, 1, 5, 'mod/forum:viewdiscussion', 1, 1316566635, 0),
(466, 1, 3, 'mod/forum:viewdiscussion', 1, 1316566635, 0),
(469, 1, 3, 'mod/forum:viewhiddentimedposts', 1, 1316566636, 0),
(471, 1, 5, 'mod/forum:startdiscussion', 1, 1316566636, 0),
(473, 1, 3, 'mod/forum:startdiscussion', 1, 1316566636, 0),
(475, 1, 5, 'mod/forum:replypost', 1, 1316566636, 0),
(477, 1, 3, 'mod/forum:replypost', 1, 1316566636, 0),
(480, 1, 3, 'mod/forum:addnews', 1, 1316566637, 0),
(483, 1, 3, 'mod/forum:replynews', 1, 1316566637, 0),
(485, 1, 5, 'mod/forum:viewrating', 1, 1316566637, 0),
(487, 1, 3, 'mod/forum:viewrating', 1, 1316566637, 0),
(490, 1, 3, 'mod/forum:viewanyrating', 1, 1316566637, 0),
(493, 1, 3, 'mod/forum:viewallratings', 1, 1316566637, 0),
(496, 1, 3, 'mod/forum:rate', 1, 1316566638, 0),
(498, 1, 5, 'mod/forum:createattachment', 1, 1316566638, 0),
(500, 1, 3, 'mod/forum:createattachment', 1, 1316566638, 0),
(502, 1, 5, 'mod/forum:deleteownpost', 1, 1316566638, 0),
(504, 1, 3, 'mod/forum:deleteownpost', 1, 1316566638, 0),
(507, 1, 3, 'mod/forum:deleteanypost', 1, 1316566639, 0),
(510, 1, 3, 'mod/forum:splitdiscussions', 1, 1316566639, 0),
(513, 1, 3, 'mod/forum:movediscussions', 1, 1316566639, 0),
(516, 1, 3, 'mod/forum:editanypost', 1, 1316566639, 0),
(519, 1, 3, 'mod/forum:viewqandawithoutposting', 1, 1316566640, 0),
(522, 1, 3, 'mod/forum:viewsubscribers', 1, 1316566640, 0),
(525, 1, 3, 'mod/forum:managesubscriptions', 1, 1316566640, 0),
(528, 1, 3, 'mod/forum:initialsubscriptions', 1, 1316566640, 0),
(529, 1, 5, 'mod/forum:initialsubscriptions', 1, 1316566640, 0),
(531, 1, 3, 'mod/forum:postwithoutthrottling', 1, 1316566641, 0),
(534, 1, 3, 'mod/forum:exportdiscussion', 1, 1316566641, 0),
(537, 1, 3, 'mod/forum:exportpost', 1, 1316566642, 0),
(540, 1, 3, 'mod/forum:exportownpost', 1, 1316566642, 0),
(542, 1, 5, 'mod/forum:exportownpost', 1, 1316566642, 0),
(543, 1, 5, 'mod/glossary:write', 1, 1316566658, 0),
(545, 1, 3, 'mod/glossary:write', 1, 1316566658, 0),
(548, 1, 3, 'mod/glossary:manageentries', 1, 1316566659, 0),
(551, 1, 3, 'mod/glossary:managecategories', 1, 1316566659, 0),
(553, 1, 5, 'mod/glossary:comment', 1, 1316566659, 0),
(555, 1, 3, 'mod/glossary:comment', 1, 1316566659, 0),
(558, 1, 3, 'mod/glossary:managecomments', 1, 1316566660, 0),
(561, 1, 3, 'mod/glossary:import', 1, 1316566660, 0),
(564, 1, 3, 'mod/glossary:export', 1, 1316566661, 0),
(567, 1, 3, 'mod/glossary:approve', 1, 1316566661, 0),
(570, 1, 3, 'mod/glossary:rate', 1, 1316566662, 0),
(573, 1, 3, 'mod/glossary:viewrating', 1, 1316566662, 0),
(576, 1, 3, 'mod/glossary:viewanyrating', 1, 1316566662, 0),
(579, 1, 3, 'mod/glossary:viewallratings', 1, 1316566663, 0),
(582, 1, 3, 'mod/glossary:exportentry', 1, 1316566663, 0),
(585, 1, 3, 'mod/glossary:exportownentry', 1, 1316566663, 0),
(587, 1, 5, 'mod/glossary:exportownentry', 1, 1316566663, 0),
(588, 1, 6, 'mod/imscp:view', 1, 1316566665, 0),
(589, 1, 7, 'mod/imscp:view', 1, 1316566665, 0),
(590, 1, 3, 'mod/lesson:edit', 1, 1316566677, 0),
(593, 1, 3, 'mod/lesson:manage', 1, 1316566677, 0),
(595, 1, 6, 'mod/page:view', 1, 1316566680, 0),
(596, 1, 7, 'mod/page:view', 1, 1316566680, 0),
(597, 1, 6, 'mod/quiz:view', 1, 1316566692, 0),
(598, 1, 5, 'mod/quiz:view', 1, 1316566692, 0),
(600, 1, 3, 'mod/quiz:view', 1, 1316566692, 0),
(602, 1, 5, 'mod/quiz:attempt', 1, 1316566693, 0),
(603, 1, 5, 'mod/quiz:reviewmyattempts', 1, 1316566693, 0),
(604, 1, 3, 'mod/quiz:manage', 1, 1316566693, 0),
(606, 1, 3, 'mod/quiz:manageoverrides', 1, 1316566693, 0),
(609, 1, 3, 'mod/quiz:preview', 1, 1316566694, 0),
(612, 1, 3, 'mod/quiz:grade', 1, 1316566694, 0),
(615, 1, 3, 'mod/quiz:regrade', 1, 1316566695, 0),
(618, 1, 3, 'mod/quiz:viewreports', 1, 1316566695, 0),
(620, 1, 3, 'mod/quiz:deleteattempts', 1, 1316566696, 0),
(622, 1, 6, 'mod/resource:view', 1, 1316566703, 0),
(623, 1, 7, 'mod/resource:view', 1, 1316566703, 0),
(625, 1, 3, 'mod/scorm:viewreport', 1, 1316566728, 0),
(627, 1, 5, 'mod/scorm:skipview', 1, 1316566728, 0),
(628, 1, 5, 'mod/scorm:savetrack', 1, 1316566728, 0),
(630, 1, 3, 'mod/scorm:savetrack', 1, 1316566729, 0),
(632, 1, 5, 'mod/scorm:viewscores', 1, 1316566729, 0),
(634, 1, 3, 'mod/scorm:viewscores', 1, 1316566729, 0),
(637, 1, 3, 'mod/scorm:deleteresponses', 1, 1316566729, 0),
(639, 1, 5, 'mod/survey:participate', 1, 1316566747, 0),
(641, 1, 3, 'mod/survey:participate', 1, 1316566748, 0),
(644, 1, 3, 'mod/survey:readresponses', 1, 1316566748, 0),
(647, 1, 3, 'mod/survey:download', 1, 1316566749, 0),
(649, 1, 6, 'mod/url:view', 1, 1316566753, 0),
(650, 1, 7, 'mod/url:view', 1, 1316566753, 0),
(651, 1, 6, 'mod/wiki:viewpage', 1, 1316566764, 0),
(652, 1, 5, 'mod/wiki:viewpage', 1, 1316566764, 0),
(654, 1, 3, 'mod/wiki:viewpage', 1, 1316566764, 0),
(656, 1, 5, 'mod/wiki:editpage', 1, 1316566765, 0),
(658, 1, 3, 'mod/wiki:editpage', 1, 1316566765, 0),
(660, 1, 5, 'mod/wiki:createpage', 1, 1316566765, 0),
(662, 1, 3, 'mod/wiki:createpage', 1, 1316566765, 0),
(664, 1, 5, 'mod/wiki:viewcomment', 1, 1316566765, 0),
(666, 1, 3, 'mod/wiki:viewcomment', 1, 1316566766, 0),
(668, 1, 5, 'mod/wiki:editcomment', 1, 1316566766, 0),
(670, 1, 3, 'mod/wiki:editcomment', 1, 1316566766, 0),
(673, 1, 3, 'mod/wiki:managecomment', 1, 1316566767, 0),
(676, 1, 3, 'mod/wiki:managefiles', 1, 1316566767, 0),
(679, 1, 3, 'mod/wiki:overridelock', 1, 1316566767, 0),
(682, 1, 3, 'mod/wiki:managewiki', 1, 1316566768, 0),
(684, 1, 6, 'mod/workshop:view', 1, 1316566790, 0),
(685, 1, 5, 'mod/workshop:view', 1, 1316566790, 0),
(687, 1, 3, 'mod/workshop:view', 1, 1316566790, 0),
(690, 1, 3, 'mod/workshop:switchphase', 1, 1316566791, 0),
(692, 1, 3, 'mod/workshop:editdimensions', 1, 1316566791, 0),
(694, 1, 5, 'mod/workshop:submit', 1, 1316566791, 0),
(695, 1, 5, 'mod/workshop:peerassess', 1, 1316566791, 0),
(697, 1, 3, 'mod/workshop:manageexamples', 1, 1316566792, 0),
(700, 1, 3, 'mod/workshop:allocate', 1, 1316566792, 0),
(703, 1, 3, 'mod/workshop:publishsubmissions', 1, 1316566792, 0),
(705, 1, 5, 'mod/workshop:viewauthornames', 1, 1316566793, 0),
(707, 1, 3, 'mod/workshop:viewauthornames', 1, 1316566793, 0),
(710, 1, 3, 'mod/workshop:viewreviewernames', 1, 1316566793, 0),
(713, 1, 3, 'mod/workshop:viewallsubmissions', 1, 1316566793, 0),
(715, 1, 5, 'mod/workshop:viewpublishedsubmissions', 1, 1316566794, 0),
(717, 1, 3, 'mod/workshop:viewpublishedsubmissions', 1, 1316566794, 0),
(719, 1, 5, 'mod/workshop:viewauthorpublished', 1, 1316566794, 0),
(721, 1, 3, 'mod/workshop:viewauthorpublished', 1, 1316566794, 0),
(724, 1, 3, 'mod/workshop:viewallassessments', 1, 1316566794, 0),
(727, 1, 3, 'mod/workshop:overridegrades', 1, 1316566795, 0),
(730, 1, 3, 'mod/workshop:ignoredeadlines', 1, 1316566795, 0),
(734, 1, 3, 'enrol/authorize:manage', 1, 1316566817, 0),
(738, 1, 3, 'enrol/cohort:config', 1, 1316566820, 0),
(741, 1, 3, 'enrol/guest:config', 1, 1316566824, 0),
(745, 1, 3, 'enrol/manual:enrol', 1, 1316566827, 0),
(747, 1, 3, 'enrol/manual:manage', 1, 1316566827, 0),
(749, 1, 3, 'enrol/manual:unenrol', 1, 1316566827, 0),
(751, 1, 3, 'enrol/meta:config', 1, 1316566828, 0),
(755, 1, 3, 'enrol/paypal:manage', 1, 1316566833, 0),
(757, 1, 3, 'enrol/self:config', 1, 1316566834, 0),
(759, 1, 3, 'enrol/self:manage', 1, 1316566835, 0),
(761, 1, 5, 'enrol/self:unenrolself', 1, 1316566835, 0),
(762, 1, 3, 'enrol/self:unenrol', 1, 1316566835, 0),
(764, 1, 7, 'block/online_users:viewlist', 1, 1316566855, 0),
(765, 1, 6, 'block/online_users:viewlist', 1, 1316566855, 0),
(766, 1, 5, 'block/online_users:viewlist', 1, 1316566855, 0),
(768, 1, 3, 'block/online_users:viewlist', 1, 1316566855, 0),
(771, 1, 3, 'block/rss_client:manageownfeeds', 1, 1316566859, 0),
(775, 1, 3, 'report/courseoverview:view', 1, 1316566876, 0),
(783, 1, 3, 'coursereport/completion:view', 1, 1316566884, 0),
(786, 1, 3, 'coursereport/log:view', 1, 1316566885, 0),
(789, 1, 3, 'coursereport/log:viewlive', 1, 1316566885, 0),
(792, 1, 3, 'coursereport/log:viewtoday', 1, 1316566885, 0),
(795, 1, 3, 'coursereport/outline:view', 1, 1316566887, 0),
(798, 1, 3, 'coursereport/participation:view', 1, 1316566888, 0),
(801, 1, 3, 'coursereport/progress:view', 1, 1316566891, 0),
(804, 1, 3, 'coursereport/stats:view', 1, 1316566892, 0),
(807, 1, 3, 'gradeexport/ods:view', 1, 1316566893, 0),
(811, 1, 3, 'gradeexport/txt:view', 1, 1316566894, 0),
(815, 1, 3, 'gradeexport/xls:view', 1, 1316566895, 0),
(819, 1, 3, 'gradeexport/xml:view', 1, 1316566897, 0),
(822, 1, 3, 'gradeimport/csv:view', 1, 1316566898, 0),
(824, 1, 3, 'gradeimport/xml:view', 1, 1316566898, 0),
(828, 1, 3, 'gradereport/grader:view', 1, 1316566899, 0),
(831, 1, 3, 'gradereport/outcomes:view', 1, 1316566900, 0),
(833, 1, 5, 'gradereport/overview:view', 1, 1316566901, 0),
(835, 1, 5, 'gradereport/user:view', 1, 1316566902, 0),
(837, 1, 3, 'gradereport/user:view', 1, 1316566902, 0),
(839, 1, 7, 'repository/alfresco:view', 1, 1316566909, 0),
(840, 1, 7, 'repository/boxnet:view', 1, 1316566910, 0),
(841, 1, 7, 'repository/coursefiles:view', 1, 1316566910, 0),
(842, 1, 7, 'repository/dropbox:view', 1, 1316566911, 0),
(843, 1, 7, 'repository/filesystem:view', 1, 1316566912, 0),
(844, 1, 7, 'repository/flickr:view', 1, 1316566913, 0),
(845, 1, 7, 'repository/flickr_public:view', 1, 1316566915, 0),
(846, 1, 7, 'repository/googledocs:view', 1, 1316566916, 0),
(847, 1, 7, 'repository/local:view', 1, 1316566918, 0),
(848, 1, 7, 'repository/merlot:view', 1, 1316566919, 0),
(849, 1, 7, 'repository/picasa:view', 1, 1316566920, 0),
(850, 1, 7, 'repository/recent:view', 1, 1316566921, 0),
(851, 1, 7, 'repository/s3:view', 1, 1316566922, 0),
(852, 1, 7, 'repository/upload:view', 1, 1316566924, 0),
(853, 1, 7, 'repository/url:view', 1, 1316566925, 0),
(854, 1, 7, 'repository/user:view', 1, 1316566927, 0),
(855, 1, 7, 'repository/webdav:view', 1, 1316566928, 0),
(856, 1, 7, 'repository/wikimedia:view', 1, 1316566929, 0),
(857, 1, 7, 'repository/youtube:view', 1, 1316566930, 0),
(859, 1, 3, 'quiz/grading:viewstudentnames', 1, 1316566940, 0),
(861, 1, 3, 'quiz/grading:viewidnumber', 1, 1316566940, 0),
(863, 1, 3, 'quiz/statistics:view', 1, 1316566943, 0),
(864, 1, 8, 'enrol/authorize:managepayments', 1, 1316811759, 2),
(865, 1, 8, 'enrol/authorize:uploadcsv', 1, 1316811759, 2),
(866, 1, 8, 'enrol/category:synchronised', 1, 1316811759, 2),
(867, 1, 8, 'moodle/blog:create', 1, 1316811759, 2),
(870, 1, 8, 'moodle/blog:search', 1, 1316811759, 2),
(871, 1, 8, 'moodle/blog:view', 1, 1316811759, 2),
(872, 1, 8, 'moodle/blog:viewdrafts', 1, 1316811759, 2),
(873, 1, 8, 'moodle/community:add', 1, 1316811759, 2),
(874, 1, 8, 'moodle/community:download', 1, 1316811759, 2),
(875, 1, 8, 'moodle/course:publish', 1, 1316811759, 2),
(876, 1, 8, 'moodle/course:request', 1, 1316811759, 2),
(877, 1, 8, 'moodle/my:configsyspages', 1, 1316811759, 2),
(878, 1, 8, 'moodle/my:manageblocks', 1, 1316811759, 2),
(879, 1, 8, 'moodle/portfolio:export', 1, 1316811759, 2),
(880, 1, 8, 'moodle/question:config', 1, 1316811760, 2),
(881, 1, 8, 'moodle/restore:createuser', 1, 1316811760, 2),
(882, 1, 8, 'moodle/role:manage', 1, 1316811760, 2),
(883, 1, 8, 'moodle/site:approvecourse', 1, 1316811760, 2),
(884, 1, 8, 'moodle/site:config', 1, 1316811760, 2),
(885, 1, 8, 'moodle/site:doclinks', 1, 1316811760, 2),
(886, 1, 8, 'moodle/site:mnetlogintoremote', 1, 1316811760, 2),
(887, 1, 8, 'moodle/site:readallmessages', 1, 1316811760, 2),
(888, 1, 8, 'moodle/site:sendmessage', 1, 1316811760, 2),
(889, 1, 8, 'moodle/site:uploadusers', 1, 1316811760, 2),
(890, 1, 8, 'moodle/site:viewparticipants', 1, 1316811760, 2),
(891, 1, 8, 'moodle/tag:create', 1, 1316811760, 2),
(894, 1, 8, 'moodle/tag:manage', 1, 1316811760, 2),
(895, 1, 8, 'moodle/user:changeownpassword', 1, 1316811760, 2),
(896, 1, 8, 'moodle/user:create', 1, 1316811760, 2),
(897, 1, 8, 'moodle/user:delete', 1, 1316811760, 2),
(898, 1, 8, 'moodle/user:editownmessageprofile', 1, 1316811761, 2),
(899, 1, 8, 'moodle/user:editownprofile', 1, 1316811761, 2),
(900, 1, 8, 'moodle/user:manageownblocks', 1, 1316811761, 2),
(901, 1, 8, 'moodle/user:manageownfiles', 1, 1316811761, 2),
(902, 1, 8, 'moodle/user:managesyspages', 1, 1316811761, 2),
(903, 1, 8, 'moodle/user:update', 1, 1316811761, 2),
(904, 1, 8, 'moodle/webservice:createmobiletoken', 1, 1316811761, 2),
(905, 1, 8, 'moodle/webservice:createtoken', 1, 1316811761, 2),
(906, 1, 8, 'report/courseoverview:view', 1, 1316811761, 2),
(907, 1, 8, 'report/customlang:edit', 1, 1316811761, 2),
(908, 1, 8, 'report/customlang:view', 1, 1316811761, 2),
(909, 1, 8, 'report/questioninstances:view', 1, 1316811761, 2),
(910, 1, 8, 'report/security:view', 1, 1316811761, 2),
(911, 1, 8, 'report/unittest:view', 1, 1316811761, 2),
(912, 1, 8, 'moodle/user:editmessageprofile', 1, 1316811761, 2),
(913, 1, 8, 'moodle/user:editprofile', 1, 1316811761, 2),
(914, 1, 8, 'moodle/user:manageblocks', 1, 1316811761, 2),
(915, 1, 8, 'moodle/user:readuserblogs', 1, 1316811762, 2),
(916, 1, 8, 'moodle/user:readuserposts', 1, 1316811762, 2),
(917, 1, 8, 'moodle/user:viewalldetails', 1, 1316811762, 2),
(918, 1, 8, 'moodle/user:viewuseractivitiesreport', 1, 1316811762, 2),
(919, 1, 8, 'moodle/category:manage', 1, 1316811762, 2),
(920, 1, 8, 'moodle/category:viewhiddencategories', 1, 1316811762, 2),
(921, 1, 8, 'moodle/cohort:assign', 1, 1316811762, 2),
(922, 1, 8, 'moodle/cohort:manage', 1, 1316811762, 2),
(923, 1, 8, 'moodle/course:create', 1, 1316811762, 2),
(924, 1, 8, 'coursereport/completion:view', 1, 1316811762, 2),
(925, 1, 8, 'coursereport/log:view', 1, 1316811762, 2),
(926, 1, 8, 'coursereport/log:viewlive', 1, 1316811762, 2),
(927, 1, 8, 'coursereport/log:viewtoday', 1, 1316811762, 2),
(928, 1, 8, 'coursereport/outline:view', 1, 1316811762, 2),
(929, 1, 8, 'coursereport/participation:view', 1, 1316811762, 2),
(930, 1, 8, 'coursereport/progress:view', 1, 1316811762, 2),
(931, 1, 8, 'coursereport/stats:view', 1, 1316811762, 2),
(932, 1, 8, 'enrol/authorize:config', 1, 1316811763, 2),
(933, 1, 8, 'enrol/authorize:manage', 1, 1316811763, 2),
(934, 1, 8, 'enrol/authorize:unenrol', 1, 1316811763, 2),
(935, 1, 8, 'enrol/authorize:unenrolself', 1, 1316811763, 2),
(936, 1, 8, 'enrol/cohort:config', 1, 1316811763, 2),
(937, 1, 8, 'enrol/guest:config', 1, 1316811763, 2),
(938, 1, 8, 'enrol/ldap:manage', 1, 1316811763, 2),
(939, 1, 8, 'enrol/manual:config', 1, 1316811763, 2),
(940, 1, 8, 'enrol/manual:enrol', 1, 1316811763, 2),
(941, 1, 8, 'enrol/manual:manage', 1, 1316811763, 2),
(942, 1, 8, 'enrol/manual:unenrol', 1, 1316811763, 2),
(943, 1, 8, 'enrol/manual:unenrolself', 1, 1316811763, 2),
(944, 1, 8, 'enrol/meta:config', 1, 1316811763, 2),
(945, 1, 8, 'enrol/meta:selectaslinked', 1, 1316811764, 2),
(946, 1, 8, 'enrol/paypal:config', 1, 1316811764, 2),
(947, 1, 8, 'enrol/paypal:manage', 1, 1316811764, 2),
(948, 1, 8, 'enrol/paypal:unenrol', 1, 1316811764, 2),
(949, 1, 8, 'enrol/paypal:unenrolself', 1, 1316811764, 2),
(950, 1, 8, 'enrol/self:config', 1, 1316811764, 2),
(951, 1, 8, 'enrol/self:manage', 1, 1316811764, 2),
(952, 1, 8, 'enrol/self:unenrol', 1, 1316811764, 2),
(953, 1, 8, 'enrol/self:unenrolself', 1, 1316811764, 2),
(954, 1, 8, 'gradeexport/ods:publish', 1, 1316811764, 2),
(955, 1, 8, 'gradeexport/ods:view', 1, 1316811764, 2),
(956, 1, 8, 'gradeexport/txt:publish', 1, 1316811764, 2),
(957, 1, 8, 'gradeexport/txt:view', 1, 1316811764, 2),
(958, 1, 8, 'gradeexport/xls:publish', 1, 1316811764, 2),
(959, 1, 8, 'gradeexport/xls:view', 1, 1316811764, 2),
(960, 1, 8, 'gradeexport/xml:publish', 1, 1316811765, 2),
(961, 1, 8, 'gradeexport/xml:view', 1, 1316811765, 2),
(962, 1, 8, 'gradeimport/csv:view', 1, 1316811765, 2),
(963, 1, 8, 'gradeimport/xml:publish', 1, 1316811765, 2),
(964, 1, 8, 'gradeimport/xml:view', 1, 1316811765, 2),
(965, 1, 8, 'gradereport/grader:view', 1, 1316811765, 2),
(966, 1, 8, 'gradereport/outcomes:view', 1, 1316811765, 2),
(967, 1, 8, 'gradereport/overview:view', 1, 1316811765, 2),
(968, 1, 8, 'gradereport/user:view', 1, 1316811765, 2),
(969, 1, 8, 'moodle/backup:anonymise', 1, 1316811765, 2),
(970, 1, 8, 'moodle/backup:backupcourse', 1, 1316811765, 2),
(971, 1, 8, 'moodle/backup:backupsection', 1, 1316811765, 2),
(972, 1, 8, 'moodle/backup:backuptargethub', 1, 1316811765, 2),
(973, 1, 8, 'moodle/backup:backuptargetimport', 1, 1316811765, 2),
(974, 1, 8, 'moodle/backup:configure', 1, 1316811765, 2),
(975, 1, 8, 'moodle/backup:downloadfile', 1, 1316811766, 2),
(976, 1, 8, 'moodle/backup:userinfo', 1, 1316811766, 2),
(977, 1, 8, 'moodle/blog:associatecourse', 1, 1316811766, 2),
(978, 1, 8, 'moodle/calendar:manageentries', 1, 1316811766, 2),
(979, 1, 8, 'moodle/calendar:managegroupentries', 1, 1316811766, 2),
(980, 1, 8, 'moodle/calendar:manageownentries', 1, 1316811766, 2),
(981, 1, 8, 'moodle/cohort:view', 1, 1316811766, 2),
(982, 1, 8, 'moodle/comment:delete', 1, 1316811766, 2),
(983, 1, 8, 'moodle/comment:post', 1, 1316811766, 2),
(984, 1, 8, 'moodle/comment:view', 1, 1316811766, 2),
(985, 1, 8, 'moodle/course:activityvisibility', 1, 1316811766, 2),
(986, 1, 8, 'moodle/course:bulkmessaging', 1, 1316811766, 2),
(987, 1, 8, 'moodle/course:changecategory', 1, 1316811766, 2),
(988, 1, 8, 'moodle/course:changefullname', 1, 1316811766, 2),
(989, 1, 8, 'moodle/course:changeidnumber', 1, 1316811766, 2),
(990, 1, 8, 'moodle/course:changeshortname', 1, 1316811766, 2),
(991, 1, 8, 'moodle/course:changesummary', 1, 1316811766, 2),
(992, 1, 8, 'moodle/course:delete', 1, 1316811767, 2),
(993, 1, 8, 'moodle/course:enrolconfig', 1, 1316811767, 2),
(994, 1, 8, 'moodle/course:enrolreview', 1, 1316811767, 2),
(995, 1, 8, 'moodle/course:manageactivities', 1, 1316811767, 2),
(996, 1, 8, 'moodle/course:managefiles', 1, 1316811767, 2),
(997, 1, 8, 'moodle/course:managegroups', 1, 1316811767, 2),
(998, 1, 8, 'moodle/course:managescales', 1, 1316811767, 2),
(999, 1, 8, 'moodle/course:markcomplete', 1, 1316811767, 2),
(1000, 1, 8, 'moodle/course:reset', 1, 1316811767, 2),
(1001, 1, 8, 'moodle/course:sectionvisibility', 1, 1316811767, 2),
(1002, 1, 8, 'moodle/course:setcurrentsection', 1, 1316811767, 2),
(1003, 1, 8, 'moodle/course:update', 1, 1316811767, 2),
(1004, 1, 8, 'moodle/course:useremail', 1, 1316811767, 2),
(1005, 1, 8, 'moodle/course:view', 1, 1316811767, 2),
(1006, 1, 8, 'moodle/course:viewhiddenactivities', 1, 1316811767, 2),
(1007, 1, 8, 'moodle/course:viewhiddencourses', 1, 1316811767, 2),
(1008, 1, 8, 'moodle/course:viewhiddensections', 1, 1316811767, 2),
(1009, 1, 8, 'moodle/course:viewhiddenuserfields', 1, 1316811768, 2),
(1010, 1, 8, 'moodle/course:viewparticipants', 1, 1316811768, 2),
(1011, 1, 8, 'moodle/course:viewscales', 1, 1316811768, 2),
(1012, 1, 8, 'moodle/course:visibility', 1, 1316811768, 2),
(1013, 1, 8, 'moodle/filter:manage', 1, 1316811768, 2),
(1014, 1, 8, 'moodle/grade:edit', 1, 1316811769, 2),
(1015, 1, 8, 'moodle/grade:export', 1, 1316811769, 2),
(1016, 1, 8, 'moodle/grade:hide', 1, 1316811769, 2),
(1017, 1, 8, 'moodle/grade:import', 1, 1316811769, 2),
(1018, 1, 8, 'moodle/grade:lock', 1, 1316811769, 2),
(1019, 1, 8, 'moodle/grade:manage', 1, 1316811769, 2),
(1020, 1, 8, 'moodle/grade:manageletters', 1, 1316811769, 2),
(1021, 1, 8, 'moodle/grade:manageoutcomes', 1, 1316811769, 2),
(1022, 1, 8, 'moodle/grade:unlock', 1, 1316811769, 2),
(1023, 1, 8, 'moodle/grade:view', 1, 1316811769, 2),
(1024, 1, 8, 'moodle/grade:viewall', 1, 1316811770, 2),
(1025, 1, 8, 'moodle/grade:viewhidden', 1, 1316811770, 2),
(1026, 1, 8, 'moodle/notes:manage', 1, 1316811770, 2),
(1027, 1, 8, 'moodle/notes:view', 1, 1316811770, 2),
(1028, 1, 8, 'moodle/question:add', 1, 1316811770, 2),
(1029, 1, 8, 'moodle/question:editall', 1, 1316811770, 2),
(1030, 1, 8, 'moodle/question:editmine', 1, 1316811770, 2),
(1031, 1, 8, 'moodle/question:flag', 1, 1316811770, 2),
(1032, 1, 8, 'moodle/question:managecategory', 1, 1316811770, 2),
(1033, 1, 8, 'moodle/question:moveall', 1, 1316811770, 2),
(1034, 1, 8, 'moodle/question:movemine', 1, 1316811770, 2),
(1035, 1, 8, 'moodle/question:useall', 1, 1316811770, 2),
(1036, 1, 8, 'moodle/question:usemine', 1, 1316811770, 2),
(1037, 1, 8, 'moodle/question:viewall', 1, 1316811770, 2),
(1038, 1, 8, 'moodle/question:viewmine', 1, 1316811770, 2),
(1039, 1, 8, 'moodle/rating:rate', 1, 1316811770, 2),
(1040, 1, 8, 'moodle/rating:view', 1, 1316811770, 2),
(1041, 1, 8, 'moodle/rating:viewall', 1, 1316811770, 2),
(1042, 1, 8, 'moodle/rating:viewany', 1, 1316811771, 2),
(1043, 1, 8, 'moodle/restore:configure', 1, 1316811771, 2),
(1044, 1, 8, 'moodle/restore:restoreactivity', 1, 1316811771, 2),
(1045, 1, 8, 'moodle/restore:restorecourse', 1, 1316811771, 2),
(1046, 1, 8, 'moodle/restore:restoresection', 1, 1316811771, 2),
(1047, 1, 8, 'moodle/restore:restoretargethub', 1, 1316811771, 2),
(1048, 1, 8, 'moodle/restore:restoretargetimport', 1, 1316811771, 2),
(1049, 1, 8, 'moodle/restore:rolldates', 1, 1316811771, 2),
(1050, 1, 8, 'moodle/restore:uploadfile', 1, 1316811771, 2),
(1051, 1, 8, 'moodle/restore:userinfo', 1, 1316811771, 2),
(1052, 1, 8, 'moodle/restore:viewautomatedfilearea', 1, 1316811771, 2),
(1053, 1, 8, 'moodle/role:assign', 1, 1316811771, 2),
(1054, 1, 8, 'moodle/role:override', 1, 1316811771, 2),
(1055, 1, 8, 'moodle/role:review', 1, 1316811771, 2),
(1056, 1, 8, 'moodle/role:safeoverride', 1, 1316811772, 2),
(1057, 1, 8, 'moodle/role:switchroles', 1, 1316811772, 2),
(1058, 1, 8, 'moodle/site:accessallgroups', 1, 1316811772, 2),
(1059, 1, 8, 'moodle/site:trustcontent', 1, 1316811772, 2),
(1060, 1, 8, 'moodle/site:viewfullnames', 1, 1316811772, 2),
(1061, 1, 8, 'moodle/site:viewreports', 1, 1316811772, 2),
(1062, 1, 8, 'moodle/user:loginas', 1, 1316811772, 2),
(1063, 1, 8, 'moodle/user:viewdetails', 1, 1316811772, 2),
(1064, 1, 8, 'moodle/user:viewhiddendetails', 1, 1316811772, 2),
(1065, 1, 8, 'webservice/amf:use', 1, 1316811772, 2),
(1066, 1, 8, 'webservice/rest:use', 1, 1316811772, 2),
(1067, 1, 8, 'webservice/soap:use', 1, 1316811772, 2),
(1068, 1, 8, 'webservice/xmlrpc:use', 1, 1316811772, 2),
(1069, 1, 8, 'mod/assignment:exportownsubmission', 1, 1316811772, 2),
(1070, 1, 8, 'mod/assignment:grade', 1, 1316811772, 2),
(1071, 1, 8, 'mod/assignment:submit', 1, 1316811772, 2),
(1072, 1, 8, 'mod/assignment:view', 1, 1316811772, 2),
(1073, 1, 8, 'mod/chat:chat', 1, 1316811773, 2),
(1074, 1, 8, 'mod/chat:deletelog', 1, 1316811773, 2),
(1075, 1, 8, 'mod/chat:exportparticipatedsession', 1, 1316811773, 2),
(1076, 1, 8, 'mod/chat:exportsession', 1, 1316811773, 2),
(1077, 1, 8, 'mod/chat:readlog', 1, 1316811773, 2),
(1078, 1, 8, 'mod/choice:choose', 1, 1316811773, 2),
(1079, 1, 8, 'mod/choice:deleteresponses', 1, 1316811773, 2),
(1080, 1, 8, 'mod/choice:downloadresponses', 1, 1316811773, 2),
(1081, 1, 8, 'mod/choice:readresponses', 1, 1316811773, 2),
(1082, 1, 8, 'mod/data:approve', 1, 1316811773, 2),
(1083, 1, 8, 'mod/data:comment', 1, 1316811773, 2),
(1084, 1, 8, 'mod/data:exportallentries', 1, 1316811773, 2),
(1085, 1, 8, 'mod/data:exportentry', 1, 1316811773, 2),
(1086, 1, 8, 'mod/data:exportownentry', 1, 1316811773, 2),
(1087, 1, 8, 'mod/data:managecomments', 1, 1316811773, 2),
(1088, 1, 8, 'mod/data:manageentries', 1, 1316811773, 2),
(1089, 1, 8, 'mod/data:managetemplates', 1, 1316811856, 2),
(1090, 1, 8, 'mod/data:manageuserpresets', 1, 1316811856, 2),
(1091, 1, 8, 'mod/data:rate', 1, 1316811856, 2),
(1092, 1, 8, 'mod/data:viewallratings', 1, 1316811856, 2),
(1093, 1, 8, 'mod/data:viewalluserpresets', 1, 1316811856, 2),
(1094, 1, 8, 'mod/data:viewanyrating', 1, 1316811856, 2),
(1095, 1, 8, 'mod/data:viewentry', 1, 1316811856, 2),
(1096, 1, 8, 'mod/data:viewrating', 1, 1316811856, 2),
(1097, 1, 8, 'mod/data:writeentry', 1, 1316811856, 2),
(1098, 1, 8, 'quiz/statistics:view', 1, 1316811856, 2),
(1099, 1, 8, 'repository/alfresco:view', 1, 1316811857, 2),
(1100, 1, 8, 'repository/boxnet:view', 1, 1316811857, 2),
(1101, 1, 8, 'repository/coursefiles:view', 1, 1316811857, 2),
(1102, 1, 8, 'repository/dropbox:view', 1, 1316811857, 2),
(1103, 1, 8, 'repository/filesystem:view', 1, 1316811857, 2),
(1104, 1, 8, 'repository/flickr:view', 1, 1316811857, 2),
(1105, 1, 8, 'repository/flickr_public:view', 1, 1316811857, 2),
(1106, 1, 8, 'repository/googledocs:view', 1, 1316811857, 2),
(1107, 1, 8, 'repository/local:view', 1, 1316811857, 2),
(1108, 1, 8, 'repository/merlot:view', 1, 1316811857, 2),
(1109, 1, 8, 'repository/picasa:view', 1, 1316811857, 2),
(1110, 1, 8, 'repository/recent:view', 1, 1316811857, 2),
(1111, 1, 8, 'repository/s3:view', 1, 1316811857, 2),
(1112, 1, 8, 'repository/upload:view', 1, 1316811857, 2),
(1113, 1, 8, 'repository/url:view', 1, 1316811857, 2),
(1114, 1, 8, 'repository/user:view', 1, 1316811857, 2),
(1115, 1, 8, 'repository/webdav:view', 1, 1316811857, 2),
(1116, 1, 8, 'repository/wikimedia:view', 1, 1316811857, 2),
(1117, 1, 8, 'repository/youtube:view', 1, 1316811857, 2),
(1118, 1, 8, 'block/online_users:viewlist', 1, 1316811857, 2),
(1119, 1, 8, 'block/rss_client:manageanyfeeds', 1, 1316811858, 2),
(1120, 1, 8, 'block/rss_client:manageownfeeds', 1, 1316811858, 2),
(1124, 1, 8, 'mod/feedback:complete', 1, 1317244566, 2),
(1125, 1, 8, 'mod/feedback:createprivatetemplate', 1, 1317244566, 2),
(1126, 1, 8, 'mod/feedback:createpublictemplate', 1, 1317244567, 2),
(1127, 1, 8, 'mod/feedback:deletesubmissions', 1, 1317244567, 2),
(1128, 1, 8, 'mod/feedback:deletetemplate', 1, 1317244567, 2),
(1129, 1, 8, 'mod/feedback:edititems', 1, 1317244567, 2),
(1130, 1, 8, 'mod/feedback:mapcourse', 1, 1317244567, 2),
(1131, 1, 8, 'mod/feedback:receivemail', 1, 1317244567, 2),
(1132, 1, 8, 'mod/feedback:view', 1, 1317244567, 2),
(1133, 1, 8, 'mod/feedback:viewanalysepage', 1, 1317244567, 2),
(1134, 1, 8, 'mod/feedback:viewreports', 1, 1317244567, 2),
(1135, 1, 8, 'mod/folder:managefiles', 1, 1317244567, 2),
(1136, 1, 8, 'mod/folder:view', 1, 1317244567, 2),
(1137, 1, 8, 'mod/forum:addnews', 1, 1317244567, 2),
(1138, 1, 8, 'mod/forum:createattachment', 1, 1317244567, 2),
(1139, 1, 8, 'mod/forum:deleteanypost', 1, 1317244567, 2),
(1140, 1, 8, 'mod/forum:deleteownpost', 1, 1317244567, 2),
(1141, 1, 8, 'mod/forum:editanypost', 1, 1317244567, 2),
(1142, 1, 8, 'mod/forum:exportdiscussion', 1, 1317244567, 2),
(1143, 1, 8, 'mod/forum:exportownpost', 1, 1317244568, 2),
(1144, 1, 8, 'mod/forum:exportpost', 1, 1317244568, 2),
(1145, 1, 8, 'mod/forum:initialsubscriptions', 1, 1317244568, 2),
(1146, 1, 8, 'mod/forum:managesubscriptions', 1, 1317244568, 2),
(1147, 1, 8, 'mod/forum:movediscussions', 1, 1317244568, 2),
(1148, 1, 8, 'mod/forum:postwithoutthrottling', 1, 1317244568, 2),
(1149, 1, 8, 'mod/forum:rate', 1, 1317244568, 2),
(1150, 1, 8, 'mod/forum:replynews', 1, 1317244568, 2),
(1151, 1, 8, 'mod/forum:replypost', 1, 1317244568, 2),
(1152, 1, 8, 'mod/forum:splitdiscussions', 1, 1317244568, 2),
(1153, 1, 8, 'mod/forum:startdiscussion', 1, 1317244568, 2),
(1154, 1, 8, 'mod/forum:viewallratings', 1, 1317244568, 2),
(1155, 1, 8, 'mod/forum:viewanyrating', 1, 1317244568, 2),
(1156, 1, 8, 'mod/forum:viewdiscussion', 1, 1317244568, 2),
(1157, 1, 8, 'mod/forum:viewhiddentimedposts', 1, 1317244569, 2),
(1158, 1, 8, 'mod/forum:viewqandawithoutposting', 1, 1317244569, 2),
(1159, 1, 8, 'mod/forum:viewrating', 1, 1317244569, 2),
(1160, 1, 8, 'mod/forum:viewsubscribers', 1, 1317244569, 2),
(1161, 1, 8, 'mod/glossary:approve', 1, 1317244569, 2),
(1162, 1, 8, 'mod/glossary:comment', 1, 1317244569, 2),
(1163, 1, 8, 'mod/glossary:export', 1, 1317244569, 2),
(1164, 1, 8, 'mod/glossary:exportentry', 1, 1317244569, 2),
(1165, 1, 8, 'mod/glossary:exportownentry', 1, 1317244569, 2),
(1166, 1, 8, 'mod/glossary:import', 1, 1317244569, 2),
(1167, 1, 8, 'mod/glossary:managecategories', 1, 1317244569, 2),
(1168, 1, 8, 'mod/glossary:managecomments', 1, 1317244569, 2),
(1169, 1, 8, 'mod/glossary:manageentries', 1, 1317244569, 2),
(1170, 1, 8, 'mod/glossary:rate', 1, 1317244569, 2),
(1171, 1, 8, 'mod/glossary:viewallratings', 1, 1317244570, 2),
(1172, 1, 8, 'mod/glossary:viewanyrating', 1, 1317244570, 2),
(1173, 1, 8, 'mod/glossary:viewrating', 1, 1317244570, 2),
(1174, 1, 8, 'mod/glossary:write', 1, 1317244570, 2),
(1175, 1, 8, 'mod/imscp:view', 1, 1317244570, 2),
(1176, 1, 8, 'mod/lesson:edit', 1, 1317244570, 2),
(1177, 1, 8, 'mod/lesson:manage', 1, 1317244570, 2),
(1178, 1, 8, 'mod/page:view', 1, 1317244570, 2),
(1179, 1, 8, 'mod/quiz:attempt', 1, 1317244570, 2),
(1180, 1, 8, 'mod/quiz:deleteattempts', 1, 1317244570, 2),
(1181, 1, 8, 'mod/quiz:emailconfirmsubmission', 1, 1317244570, 2),
(1182, 1, 8, 'mod/quiz:emailnotifysubmission', 1, 1317244570, 2),
(1183, 1, 8, 'mod/quiz:grade', 1, 1317244570, 2),
(1184, 1, 8, 'mod/quiz:ignoretimelimits', 1, 1317244570, 2),
(1185, 1, 8, 'mod/quiz:manage', 1, 1317244570, 2),
(1186, 1, 8, 'mod/quiz:manageoverrides', 1, 1317244570, 2),
(1187, 1, 8, 'mod/quiz:preview', 1, 1317244570, 2),
(1188, 1, 8, 'mod/quiz:regrade', 1, 1317244570, 2),
(1189, 1, 8, 'mod/quiz:reviewmyattempts', 1, 1317244571, 2),
(1190, 1, 8, 'mod/quiz:view', 1, 1317244571, 2),
(1191, 1, 8, 'mod/quiz:viewreports', 1, 1317244571, 2),
(1192, 1, 8, 'mod/resource:view', 1, 1317244571, 2),
(1193, 1, 8, 'mod/scorm:deleteresponses', 1, 1317244571, 2),
(1194, 1, 8, 'mod/scorm:savetrack', 1, 1317244571, 2),
(1195, 1, 8, 'mod/scorm:skipview', 1, 1317244571, 2),
(1196, 1, 8, 'mod/scorm:viewreport', 1, 1317244571, 2),
(1197, 1, 8, 'mod/scorm:viewscores', 1, 1317244571, 2),
(1198, 1, 8, 'mod/survey:download', 1, 1317244571, 2),
(1199, 1, 8, 'mod/survey:participate', 1, 1317244572, 2),
(1200, 1, 8, 'mod/survey:readresponses', 1, 1317244572, 2),
(1201, 1, 8, 'mod/url:view', 1, 1317244572, 2),
(1202, 1, 8, 'mod/wiki:createpage', 1, 1317244572, 2),
(1203, 1, 8, 'mod/wiki:editcomment', 1, 1317244572, 2),
(1204, 1, 8, 'mod/wiki:editpage', 1, 1317244572, 2),
(1205, 1, 8, 'mod/wiki:managecomment', 1, 1317244572, 2),
(1206, 1, 8, 'mod/wiki:managefiles', 1, 1317244572, 2),
(1207, 1, 8, 'mod/wiki:managewiki', 1, 1317244572, 2),
(1208, 1, 8, 'mod/wiki:overridelock', 1, 1317244572, 2),
(1209, 1, 8, 'mod/wiki:viewcomment', 1, 1317244572, 2),
(1210, 1, 8, 'mod/wiki:viewpage', 1, 1317244572, 2),
(1211, 1, 8, 'mod/workshop:allocate', 1, 1317244572, 2),
(1212, 1, 8, 'mod/workshop:editdimensions', 1, 1317244572, 2),
(1213, 1, 8, 'mod/workshop:ignoredeadlines', 1, 1317244572, 2),
(1214, 1, 8, 'mod/workshop:manageexamples', 1, 1317244572, 2),
(1215, 1, 8, 'mod/workshop:overridegrades', 1, 1317244573, 2),
(1216, 1, 8, 'mod/workshop:peerassess', 1, 1317244573, 2),
(1217, 1, 8, 'mod/workshop:publishsubmissions', 1, 1317244573, 2),
(1218, 1, 8, 'mod/workshop:submit', 1, 1317244573, 2),
(1219, 1, 8, 'mod/workshop:switchphase', 1, 1317244573, 2),
(1220, 1, 8, 'mod/workshop:view', 1, 1317244573, 2),
(1221, 1, 8, 'mod/workshop:viewallassessments', 1, 1317244573, 2),
(1222, 1, 8, 'mod/workshop:viewallsubmissions', 1, 1317244573, 2),
(1223, 1, 8, 'mod/workshop:viewauthornames', 1, 1317244573, 2),
(1224, 1, 8, 'mod/workshop:viewauthorpublished', 1, 1317244573, 2),
(1225, 1, 8, 'mod/workshop:viewpublishedsubmissions', 1, 1317244574, 2),
(1226, 1, 8, 'mod/workshop:viewreviewernames', 1, 1317244574, 2),
(1227, 1, 8, 'moodle/backup:backupactivity', 1, 1317244574, 2),
(1228, 1, 8, 'moodle/blog:associatemodule', 1, 1317244574, 2),
(1229, 1, 8, 'quiz/grading:viewidnumber', 1, 1317244574, 2),
(1230, 1, 8, 'quiz/grading:viewstudentnames', 1, 1317244574, 2),
(1231, 15, 3, 'moodle/block:edit', -1, 1317248262, 2),
(1232, 15, 7, 'moodle/block:view', -1, 1317248268, 2),
(1233, 15, 6, 'moodle/block:view', -1, 1317248274, 2),
(1234, 15, 5, 'moodle/block:view', -1, 1317248281, 2),
(1235, 15, 3, 'moodle/block:view', -1, 1317328396, 2),
(1236, 35, 3, 'moodle/block:edit', -1, 1317328475, 2),
(1237, 35, 6, 'moodle/block:view', -1, 1317328512, 2),
(1238, 35, 5, 'moodle/block:view', -1000, 1317330318, 2),
(1239, 35, 3, 'moodle/block:view', -1000, 1317329765, 2),
(1240, 35, 8, 'moodle/block:edit', -1, 1317328531, 2),
(1241, 35, 8, 'moodle/block:view', -1000, 1317329300, 2),
(1242, 36, 3, 'moodle/block:edit', -1, 1317328716, 2),
(1243, 36, 8, 'moodle/block:edit', -1, 1317328722, 2),
(1244, 36, 7, 'moodle/block:view', -1, 1317328743, 2),
(1245, 36, 6, 'moodle/block:view', -1, 1317328748, 2),
(1247, 36, 8, 'moodle/block:view', -1000, 1317328787, 2),
(1248, 34, 3, 'moodle/block:edit', -1, 1317328882, 2),
(1249, 34, 8, 'moodle/block:edit', -1, 1317328887, 2),
(1250, 34, 7, 'moodle/block:view', -1, 1317328894, 2),
(1251, 34, 5, 'moodle/block:view', -1, 1317328899, 2),
(1252, 34, 3, 'moodle/block:view', -1, 1317328904, 2),
(1253, 34, 8, 'moodle/block:view', -1, 1317328910, 2),
(1254, 37, 8, 'moodle/block:edit', -1, 1317329008, 2),
(1255, 37, 3, 'moodle/block:edit', -1, 1317329013, 2),
(1256, 37, 7, 'moodle/block:view', -1, 1317329019, 2),
(1257, 37, 6, 'moodle/block:view', -1, 1317329025, 2),
(1258, 37, 5, 'moodle/block:view', -1, 1317329030, 2),
(1259, 37, 8, 'moodle/block:view', -1, 1317329034, 2),
(1260, 36, 3, 'moodle/block:view', -1, 1317329845, 2),
(1261, 7, 3, 'moodle/block:edit', -1, 1317329879, 2),
(1262, 7, 8, 'moodle/block:edit', -1, 1317329883, 2),
(1263, 7, 7, 'moodle/block:view', -1, 1317329888, 2),
(1264, 7, 6, 'moodle/block:view', -1, 1317329892, 2),
(1265, 7, 5, 'moodle/block:view', -1, 1317329897, 2),
(1266, 7, 3, 'moodle/block:view', -1, 1317329901, 2),
(1267, 7, 8, 'moodle/block:view', -1, 1317329906, 2),
(1268, 8, 7, 'moodle/block:view', -1, 1317330019, 2),
(1269, 8, 3, 'moodle/block:edit', -1, 1317330024, 2),
(1270, 8, 8, 'moodle/block:edit', -1, 1317330029, 2),
(1271, 8, 6, 'moodle/block:view', -1, 1317330034, 2),
(1272, 8, 5, 'moodle/block:view', -1, 1317330039, 2),
(1273, 8, 3, 'moodle/block:view', -1, 1317330045, 2),
(1274, 8, 8, 'moodle/block:view', -1, 1317330050, 2),
(1275, 4, 3, 'moodle/block:edit', -1, 1317330101, 2),
(1276, 4, 8, 'moodle/block:edit', -1, 1317330106, 2),
(1277, 4, 7, 'moodle/block:view', -1, 1317330111, 2),
(1278, 4, 6, 'moodle/block:view', -1, 1317330116, 2),
(1279, 4, 5, 'moodle/block:view', -1, 1317330121, 2),
(1280, 4, 3, 'moodle/block:view', -1, 1317330128, 2),
(1281, 4, 8, 'moodle/block:view', -1, 1317330134, 2),
(1282, 17, 3, 'mod/forum:addnews', -1, 1317331550, 2),
(1283, 17, 5, 'mod/forum:createattachment', -1, 1317331576, 2),
(1284, 17, 3, 'mod/forum:createattachment', -1, 1317331587, 2),
(1285, 17, 3, 'mod/forum:deleteanypost', -1, 1317331594, 2),
(1286, 17, 5, 'mod/forum:deleteownpost', -1, 1317331610, 2),
(1287, 17, 3, 'mod/forum:deleteownpost', -1, 1317331618, 2),
(1288, 17, 3, 'mod/forum:editanypost', -1, 1317331627, 2),
(1289, 17, 3, 'mod/forum:exportdiscussion', -1, 1317331636, 2),
(1290, 17, 5, 'mod/forum:exportownpost', -1, 1317331675, 2),
(1291, 17, 3, 'mod/forum:exportownpost', -1, 1317331685, 2),
(1292, 17, 8, 'mod/forum:exportdiscussion', -1, 1317331703, 2),
(1293, 17, 8, 'mod/forum:exportownpost', -1, 1317331712, 2),
(1294, 17, 3, 'mod/forum:exportpost', -1, 1317331721, 2),
(1295, 17, 8, 'mod/forum:exportpost', -1, 1317331733, 2),
(1296, 17, 5, 'mod/forum:initialsubscriptions', -1, 1317331740, 2),
(1297, 17, 3, 'mod/forum:initialsubscriptions', -1, 1317331750, 2),
(1298, 17, 8, 'mod/forum:initialsubscriptions', -1, 1317331757, 2),
(1299, 17, 3, 'mod/forum:managesubscriptions', -1, 1317331765, 2),
(1300, 17, 8, 'mod/forum:managesubscriptions', -1, 1317331773, 2),
(1301, 17, 3, 'mod/forum:movediscussions', -1, 1317331781, 2),
(1302, 17, 3, 'mod/forum:splitdiscussions', -1, 1317331795, 2),
(1303, 17, 3, 'mod/forum:postwithoutthrottling', -1, 1317331806, 2),
(1304, 17, 3, 'mod/forum:rate', -1, 1317331816, 2),
(1305, 17, 3, 'mod/forum:replynews', -1, 1317331824, 2),
(1306, 17, 5, 'mod/forum:replypost', -1, 1317331831, 2),
(1307, 17, 3, 'mod/forum:replypost', -1, 1317331838, 2),
(1308, 17, 5, 'mod/forum:startdiscussion', -1, 1317331845, 2),
(1309, 17, 3, 'mod/forum:startdiscussion', -1, 1317331853, 2),
(1310, 17, 3, 'mod/forum:viewallratings', -1, 1317331885, 2),
(1311, 17, 3, 'mod/forum:viewanyrating', -1, 1317331892, 2),
(1312, 17, 7, 'mod/forum:viewdiscussion', 1, 1317331916, 2),
(1313, 17, 3, 'mod/forum:viewsubscribers', -1, 1317331926, 2),
(1314, 17, 3, 'mod/forum:viewrating', -1, 1317331938, 2),
(1315, 17, 5, 'mod/forum:viewrating', -1, 1317331944, 2),
(1316, 17, 3, 'mod/forum:viewhiddentimedposts', -1, 1317331974, 2),
(1317, 17, 3, 'mod/forum:viewqandawithoutposting', -1, 1317331986, 2),
(1318, 17, 3, 'moodle/course:viewhiddenactivities', -1, 1317332700, 2),
(1319, 17, 7, 'moodle/rating:rate', -1, 1317332706, 2),
(1320, 17, 5, 'moodle/rating:rate', -1, 1317332710, 2),
(1321, 17, 3, 'moodle/rating:rate', -1, 1317332715, 2),
(1322, 17, 7, 'moodle/rating:view', -1, 1317332720, 2),
(1323, 17, 5, 'moodle/rating:view', -1, 1317332725, 2),
(1324, 17, 3, 'moodle/rating:view', -1, 1317332730, 2),
(1325, 1, 8, 'moodle/block:view', 1, 1317998140, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_role_context_levels`
--

CREATE TABLE IF NOT EXISTS `mdl_role_context_levels` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) unsigned NOT NULL,
  `contextlevel` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolecontleve_conrol_uix` (`contextlevel`,`roleid`),
  KEY `mdl_rolecontleve_rol_ix` (`roleid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Lists which roles can be assigned at which context levels. T' AUTO_INCREMENT=82 ;

--
-- Volcado de datos para la tabla `mdl_role_context_levels`
--

INSERT INTO `mdl_role_context_levels` (`id`, `roleid`, `contextlevel`) VALUES
(42, 3, 10),
(64, 5, 10),
(52, 6, 10),
(58, 7, 10),
(76, 8, 10),
(43, 3, 30),
(65, 5, 30),
(53, 6, 30),
(59, 7, 30),
(77, 8, 30),
(44, 3, 40),
(66, 5, 40),
(54, 6, 40),
(60, 7, 40),
(78, 8, 40),
(40, 3, 50),
(67, 5, 50),
(55, 6, 50),
(61, 7, 50),
(79, 8, 50),
(41, 3, 70),
(68, 5, 70),
(56, 6, 70),
(62, 7, 70),
(80, 8, 70),
(45, 3, 80),
(69, 5, 80),
(57, 6, 80),
(63, 7, 80),
(81, 8, 80);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_role_names`
--

CREATE TABLE IF NOT EXISTS `mdl_role_names` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `contextid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolename_rolcon_uix` (`roleid`,`contextid`),
  KEY `mdl_rolename_rol_ix` (`roleid`),
  KEY `mdl_rolename_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='role names in native strings' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_role_sortorder`
--

CREATE TABLE IF NOT EXISTS `mdl_role_sortorder` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL,
  `roleid` bigint(10) unsigned NOT NULL,
  `contextid` bigint(10) unsigned NOT NULL,
  `sortoder` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolesort_userolcon_uix` (`userid`,`roleid`,`contextid`),
  KEY `mdl_rolesort_use_ix` (`userid`),
  KEY `mdl_rolesort_rol_ix` (`roleid`),
  KEY `mdl_rolesort_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='sort order of course managers in a course' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_scale`
--

CREATE TABLE IF NOT EXISTS `mdl_scale` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `scale` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `descriptionformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_scal_cou_ix` (`courseid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines grading scales' AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `mdl_scale`
--

INSERT INTO `mdl_scale` (`id`, `courseid`, `userid`, `name`, `scale`, `description`, `descriptionformat`, `timemodified`) VALUES
(1, 0, 0, 'Vías de conocimiento separadas y conectadas', 'Muy individualista,Término medio,Muy comunicativo', 'La escala está basada en la teoría de las vías de conocimiento separadas (aprendizaje individual)  y conectadas (aprendizaje colaborativo). Esta teoría describe dos maneras diferentes con las que podemos evaluar y aprender a partir de lo que vemos y oímos. <li><strong> Conocedores separados (individulaistas) </strong> se mantiene lo la más objetivso posible, sin incluir sentimientos y emociones. En una discusión con otras personas, les gusta defender sus propias ideas, usando la lógica para encontrar fisuras en las ideas del adversario. </li> <li> <strong> Conocedores conectados (colaborativos) </strong> son más sensibles a otras personas. Son expertos en empatía y tienden a escuchar y hacer preguntas hasta que sienten que pueden conectar y "entender las cosas desde otros punto de vista". Aprenden tratando de compartir experiencias lo que les permite encontrar el conocimiento en las demás personas.', 0, 1317331335);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_scale_history`
--

CREATE TABLE IF NOT EXISTS `mdl_scale_history` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `action` bigint(10) unsigned NOT NULL DEFAULT '0',
  `oldid` bigint(10) unsigned NOT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timemodified` bigint(10) unsigned DEFAULT NULL,
  `loggeduser` bigint(10) unsigned DEFAULT NULL,
  `courseid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `scale` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_scalhist_act_ix` (`action`),
  KEY `mdl_scalhist_old_ix` (`oldid`),
  KEY `mdl_scalhist_cou_ix` (`courseid`),
  KEY `mdl_scalhist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='History table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_scorm`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `scormtype` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'local',
  `reference` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` text COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  `version` varchar(9) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `maxgrade` double NOT NULL DEFAULT '0',
  `grademethod` tinyint(2) NOT NULL DEFAULT '0',
  `whatgrade` bigint(10) NOT NULL DEFAULT '0',
  `maxattempt` bigint(10) NOT NULL DEFAULT '1',
  `forcecompleted` tinyint(1) NOT NULL DEFAULT '1',
  `forcenewattempt` tinyint(1) NOT NULL DEFAULT '0',
  `lastattemptlock` tinyint(1) NOT NULL DEFAULT '0',
  `displayattemptstatus` tinyint(1) NOT NULL DEFAULT '1',
  `displaycoursestructure` tinyint(1) NOT NULL DEFAULT '1',
  `updatefreq` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sha1hash` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `md5hash` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `revision` bigint(10) unsigned NOT NULL DEFAULT '0',
  `launch` bigint(10) unsigned NOT NULL DEFAULT '0',
  `skipview` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `hidebrowse` tinyint(1) NOT NULL DEFAULT '0',
  `hidetoc` tinyint(1) NOT NULL DEFAULT '0',
  `hidenav` tinyint(1) NOT NULL DEFAULT '0',
  `auto` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `popup` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `options` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `width` bigint(10) unsigned NOT NULL DEFAULT '100',
  `height` bigint(10) unsigned NOT NULL DEFAULT '600',
  `timeopen` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeclose` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_scor_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='each table is one SCORM module and its configuration' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_scorm_scoes`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_scoes` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `scorm` bigint(10) unsigned NOT NULL DEFAULT '0',
  `manifest` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `organization` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `parent` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `identifier` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `launch` text COLLATE utf8_unicode_ci NOT NULL,
  `scormtype` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_scorscoe_sco_ix` (`scorm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='each SCO part of the SCORM module' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_scorm_scoes_data`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_scoes_data` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_scorscoedata_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Contains variable data get from packages' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_scorm_scoes_track`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_scoes_track` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `scormid` bigint(10) NOT NULL DEFAULT '0',
  `scoid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `attempt` bigint(10) unsigned NOT NULL DEFAULT '1',
  `element` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorscoetrac_usescosco_uix` (`userid`,`scormid`,`scoid`,`attempt`,`element`),
  KEY `mdl_scorscoetrac_use_ix` (`userid`),
  KEY `mdl_scorscoetrac_ele_ix` (`element`),
  KEY `mdl_scorscoetrac_sco_ix` (`scormid`),
  KEY `mdl_scorscoetrac_sco2_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='to track SCOes' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_scorm_seq_mapinfo`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_mapinfo` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `objectiveid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `targetobjectiveid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `readsatisfiedstatus` tinyint(1) NOT NULL DEFAULT '1',
  `readnormalizedmeasure` tinyint(1) NOT NULL DEFAULT '1',
  `writesatisfiedstatus` tinyint(1) NOT NULL DEFAULT '0',
  `writenormalizedmeasure` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqmapi_scoidobj_uix` (`scoid`,`id`,`objectiveid`),
  KEY `mdl_scorseqmapi_sco_ix` (`scoid`),
  KEY `mdl_scorseqmapi_obj_ix` (`objectiveid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='SCORM2004 objective mapinfo description' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_scorm_seq_objective`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_objective` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `primaryobj` tinyint(1) NOT NULL DEFAULT '0',
  `objectiveid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `satisfiedbymeasure` tinyint(1) NOT NULL DEFAULT '1',
  `minnormalizedmeasure` float(11,4) unsigned NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqobje_scoid_uix` (`scoid`,`id`),
  KEY `mdl_scorseqobje_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='SCORM2004 objective description' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_scorm_seq_rolluprule`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_rolluprule` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `childactivityset` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `minimumcount` bigint(10) unsigned NOT NULL DEFAULT '0',
  `minimumpercent` float(11,4) unsigned NOT NULL DEFAULT '0.0000',
  `conditioncombination` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'all',
  `action` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqroll_scoid_uix` (`scoid`,`id`),
  KEY `mdl_scorseqroll_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='SCORM2004 sequencing rule' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_scorm_seq_rolluprulecond`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_rolluprulecond` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `rollupruleid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `operator` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'noOp',
  `cond` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqroll_scorolid_uix` (`scoid`,`rollupruleid`,`id`),
  KEY `mdl_scorseqroll_sco2_ix` (`scoid`),
  KEY `mdl_scorseqroll_rol_ix` (`rollupruleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='SCORM2004 sequencing rule' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_scorm_seq_rulecond`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_rulecond` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `ruleconditionsid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `refrencedobjective` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `measurethreshold` float(11,4) NOT NULL DEFAULT '0.0000',
  `operator` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'noOp',
  `cond` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'always',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqrule_idscorul_uix` (`id`,`scoid`,`ruleconditionsid`),
  KEY `mdl_scorseqrule_sco2_ix` (`scoid`),
  KEY `mdl_scorseqrule_rul_ix` (`ruleconditionsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='SCORM2004 rule condition' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_scorm_seq_ruleconds`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_ruleconds` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `conditioncombination` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'all',
  `ruletype` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `action` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqrule_scoid_uix` (`scoid`,`id`),
  KEY `mdl_scorseqrule_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='SCORM2004 rule conditions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_sessions`
--

CREATE TABLE IF NOT EXISTS `mdl_sessions` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `state` bigint(10) unsigned NOT NULL DEFAULT '0',
  `sid` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `userid` bigint(10) unsigned NOT NULL,
  `sessdata` longtext COLLATE utf8_unicode_ci,
  `timecreated` bigint(10) unsigned NOT NULL,
  `timemodified` bigint(10) unsigned NOT NULL,
  `firstip` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastip` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_sess_sid_uix` (`sid`),
  KEY `mdl_sess_sta_ix` (`state`),
  KEY `mdl_sess_tim_ix` (`timecreated`),
  KEY `mdl_sess_tim2_ix` (`timemodified`),
  KEY `mdl_sess_use_ix` (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Database based session storage - now recommended' AUTO_INCREMENT=316 ;

--
-- Volcado de datos para la tabla `mdl_sessions`
--

INSERT INTO `mdl_sessions` (`id`, `state`, `sid`, `userid`, `sessdata`, `timecreated`, `timemodified`, `firstip`, `lastip`) VALUES
(156, 0, 'nkr1fulapb7tv5a0078sui5e72', 11, 'U0VTU0lPTnxPOjg6InN0ZENsYXNzIjo2OntzOjEwOiJsb2dpbmNvdW50IjtpOjA7czo4OiJuYXZjYWNoZSI7Tzo4OiJzdGRDbGFzcyI6MTp7czoxMDoibmF2aWdhdGlvbiI7YTo2OntzOjE3OiJjb3Vyc2Vfc2VjdGlvbnNfMSI7YTozOntpOjA7aToxMzE3MzMzODI5O2k6MTtzOjI6IjExIjtpOjI7czoyMjE6ImE6MTp7aTowO086ODoic3RkQ2xhc3MiOjk6e3M6Nzoic2VjdGlvbiI7czoxOiIwIjtzOjI6ImlkIjtzOjE6IjEiO3M6NjoiY291cnNlIjtzOjE6IjEiO3M6NDoibmFtZSI7TjtzOjc6InN1bW1hcnkiO3M6MDoiIjtzOjEzOiJzdW1tYXJ5Zm9ybWF0IjtzOjE6IjEiO3M6ODoic2VxdWVuY2UiO3M6MToiMSI7czo3OiJ2aXNpYmxlIjtzOjE6IjEiO3M6MTI6Imhhc2FjdGl2aXRlcyI7YjoxO319Ijt9czoxODoiY291cnNlX2FjdGl2aXRlc18xIjthOjM6e2k6MDtpOjEzMTczMzM4Mjk7aToxO3M6MjoiMTEiO2k6MjtzOjI5MToiYToxOntpOjE7Tzo4OiJzdGRDbGFzcyI6MTA6e3M6Nzoic2VjdGlvbiI7czoxOiIwIjtzOjQ6Im5hbWUiO3M6MTk6Ik5vdmVkYWRlcyBkZWwgc2l0aW8iO3M6NDoiaWNvbiI7czowOiIiO3M6MTM6Imljb25jb21wb25lbnQiO3M6MDoiIjtzOjI6ImlkIjtzOjE6IjEiO3M6NjoiaGlkZGVuIjtiOjA7czo3OiJtb2RuYW1lIjtzOjU6ImZvcnVtIjtzOjg6Im5vZGV0eXBlIjtpOjA7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly9sb2NhbGhvc3QvbW9kL2ZvcnVtL3ZpZXcucGhwP2lkPTEiO3M6NzoiZGlzcGxheSI7YjoxO319Ijt9czoxNzoidXNlcmJsb2dvcHRpb25zMTEiO2E6Mzp7aTowO2k6MTMxNzMzMzgyOTtpOjE7czoyOiIxMSI7aToyO3M6Njk0OiJhOjI6e3M6NDoidmlldyI7YToyOntzOjY6InN0cmluZyI7czoyMjoiVmVyIHRvZGFzIG1pcyBlbnRyYWRhcyI7czo0OiJsaW5rIjtPOjEwOiJtb29kbGVfdXJsIjo5OntzOjk6IgAqAHNjaGVtZSI7czo0OiJodHRwIjtzOjc6IgAqAGhvc3QiO3M6OToibG9jYWxob3N0IjtzOjc6IgAqAHBvcnQiO3M6MDoiIjtzOjc6IgAqAHVzZXIiO3M6MDoiIjtzOjc6IgAqAHBhc3MiO3M6MDoiIjtzOjc6IgAqAHBhdGgiO3M6MTU6Ii9ibG9nL2luZGV4LnBocCI7czoxNjoiACoAc2xhc2hhcmd1bWVudCI7czowOiIiO3M6OToiACoAYW5jaG9yIjtOO3M6OToiACoAcGFyYW1zIjthOjE6e3M6NjoidXNlcmlkIjtzOjI6IjExIjt9fX1zOjM6ImFkZCI7YToyOntzOjY6InN0cmluZyI7czoyNToiQWdyZWdhciB1bmEgbnVldmEgZW50cmFkYSI7czo0OiJsaW5rIjtPOjEwOiJtb29kbGVfdXJsIjo5OntzOjk6IgAqAHNjaGVtZSI7czo0OiJodHRwIjtzOjc6IgAqAGhvc3QiO3M6OToibG9jYWxob3N0IjtzOjc6IgAqAHBvcnQiO3M6MDoiIjtzOjc6IgAqAHVzZXIiO3M6MDoiIjtzOjc6IgAqAHBhc3MiO3M6MDoiIjtzOjc6IgAqAHBhdGgiO3M6MTQ6Ii9ibG9nL2VkaXQucGhwIjtzOjE2OiIAKgBzbGFzaGFyZ3VtZW50IjtzOjA6IiI7czo5OiIAKgBhbmNob3IiO047czo5OiIAKgBwYXJhbXMiO2E6MTp7czo2OiJhY3Rpb24iO3M6MzoiYWRkIjt9fX19Ijt9czoxNzoiY29udGV4dGhhc3JlcG9zMzEiO2E6Mzp7aTowO2k6MTMxNzMzMzgyOTtpOjE7czoyOiIxMSI7aToyO3M6NDoiYjowOyI7fXM6MTc6ImNvdXJzZV9zZWN0aW9uc18yIjthOjM6e2k6MDtpOjEzMTczMzM4MzU7aToxO3M6MjoiMTEiO2k6MjtzOjIzMTI6ImE6MTE6e2k6MDtPOjg6InN0ZENsYXNzIjo5OntzOjc6InNlY3Rpb24iO3M6MToiMCI7czoyOiJpZCI7czoxOiIyIjtzOjY6ImNvdXJzZSI7czoxOiIyIjtzOjQ6Im5hbWUiO047czo3OiJzdW1tYXJ5IjtOO3M6MTM6InN1bW1hcnlmb3JtYXQiO3M6MToiMSI7czo4OiJzZXF1ZW5jZSI7czoxOiIyIjtzOjc6InZpc2libGUiO3M6MToiMSI7czoxMjoiaGFzYWN0aXZpdGVzIjtiOjE7fWk6MTtPOjg6InN0ZENsYXNzIjo5OntzOjc6InNlY3Rpb24iO3M6MToiMSI7czoyOiJpZCI7czoxOiIzIjtzOjY6ImNvdXJzZSI7czoxOiIyIjtzOjQ6Im5hbWUiO047czo3OiJzdW1tYXJ5IjtzOjA6IiI7czoxMzoic3VtbWFyeWZvcm1hdCI7czoxOiIxIjtzOjg6InNlcXVlbmNlIjtOO3M6NzoidmlzaWJsZSI7czoxOiIxIjtzOjEyOiJoYXNhY3Rpdml0ZXMiO2I6MDt9aToyO086ODoic3RkQ2xhc3MiOjk6e3M6Nzoic2VjdGlvbiI7czoxOiIyIjtzOjI6ImlkIjtzOjE6IjQiO3M6NjoiY291cnNlIjtzOjE6IjIiO3M6NDoibmFtZSI7TjtzOjc6InN1bW1hcnkiO3M6MDoiIjtzOjEzOiJzdW1tYXJ5Zm9ybWF0IjtzOjE6IjEiO3M6ODoic2VxdWVuY2UiO047czo3OiJ2aXNpYmxlIjtzOjE6IjEiO3M6MTI6Imhhc2FjdGl2aXRlcyI7YjowO31pOjM7Tzo4OiJzdGRDbGFzcyI6OTp7czo3OiJzZWN0aW9uIjtzOjE6IjMiO3M6MjoiaWQiO3M6MToiNSI7czo2OiJjb3Vyc2UiO3M6MToiMiI7czo0OiJuYW1lIjtOO3M6Nzoic3VtbWFyeSI7czowOiIiO3M6MTM6InN1bW1hcnlmb3JtYXQiO3M6MToiMSI7czo4OiJzZXF1ZW5jZSI7TjtzOjc6InZpc2libGUiO3M6MToiMSI7czoxMjoiaGFzYWN0aXZpdGVzIjtiOjA7fWk6NDtPOjg6InN0ZENsYXNzIjo5OntzOjc6InNlY3Rpb24iO3M6MToiNCI7czoyOiJpZCI7czoxOiI2IjtzOjY6ImNvdXJzZSI7czoxOiIyIjtzOjQ6Im5hbWUiO047czo3OiJzdW1tYXJ5IjtzOjA6IiI7czoxMzoic3VtbWFyeWZvcm1hdCI7czoxOiIxIjtzOjg6InNlcXVlbmNlIjtOO3M6NzoidmlzaWJsZSI7czoxOiIxIjtzOjEyOiJoYXNhY3Rpdml0ZXMiO2I6MDt9aTo1O086ODoic3RkQ2xhc3MiOjk6e3M6Nzoic2VjdGlvbiI7czoxOiI1IjtzOjI6ImlkIjtzOjE6IjciO3M6NjoiY291cnNlIjtzOjE6IjIiO3M6NDoibmFtZSI7TjtzOjc6InN1bW1hcnkiO3M6MDoiIjtzOjEzOiJzdW1tYXJ5Zm9ybWF0IjtzOjE6IjEiO3M6ODoic2VxdWVuY2UiO047czo3OiJ2aXNpYmxlIjtzOjE6IjEiO3M6MTI6Imhhc2FjdGl2aXRlcyI7YjowO31pOjY7Tzo4OiJzdGRDbGFzcyI6OTp7czo3OiJzZWN0aW9uIjtzOjE6IjYiO3M6MjoiaWQiO3M6MToiOCI7czo2OiJjb3Vyc2UiO3M6MToiMiI7czo0OiJuYW1lIjtOO3M6Nzoic3VtbWFyeSI7czowOiIiO3M6MTM6InN1bW1hcnlmb3JtYXQiO3M6MToiMSI7czo4OiJzZXF1ZW5jZSI7TjtzOjc6InZpc2libGUiO3M6MToiMSI7czoxMjoiaGFzYWN0aXZpdGVzIjtiOjA7fWk6NztPOjg6InN0ZENsYXNzIjo5OntzOjc6InNlY3Rpb24iO3M6MToiNyI7czoyOiJpZCI7czoxOiI5IjtzOjY6ImNvdXJzZSI7czoxOiIyIjtzOjQ6Im5hbWUiO047czo3OiJzdW1tYXJ5IjtzOjA6IiI7czoxMzoic3VtbWFyeWZvcm1hdCI7czoxOiIxIjtzOjg6InNlcXVlbmNlIjtOO3M6NzoidmlzaWJsZSI7czoxOiIxIjtzOjEyOiJoYXNhY3Rpdml0ZXMiO2I6MDt9aTo4O086ODoic3RkQ2xhc3MiOjk6e3M6Nzoic2VjdGlvbiI7czoxOiI4IjtzOjI6ImlkIjtzOjI6IjEwIjtzOjY6ImNvdXJzZSI7czoxOiIyIjtzOjQ6Im5hbWUiO047czo3OiJzdW1tYXJ5IjtzOjA6IiI7czoxMzoic3VtbWFyeWZvcm1hdCI7czoxOiIxIjtzOjg6InNlcXVlbmNlIjtOO3M6NzoidmlzaWJsZSI7czoxOiIxIjtzOjEyOiJoYXNhY3Rpdml0ZXMiO2I6MDt9aTo5O086ODoic3RkQ2xhc3MiOjk6e3M6Nzoic2VjdGlvbiI7czoxOiI5IjtzOjI6ImlkIjtzOjI6IjExIjtzOjY6ImNvdXJzZSI7czoxOiIyIjtzOjQ6Im5hbWUiO047czo3OiJzdW1tYXJ5IjtzOjA6IiI7czoxMzoic3VtbWFyeWZvcm1hdCI7czoxOiIxIjtzOjg6InNlcXVlbmNlIjtOO3M6NzoidmlzaWJsZSI7czoxOiIxIjtzOjEyOiJoYXNhY3Rpdml0ZXMiO2I6MDt9aToxMDtPOjg6InN0ZENsYXNzIjo5OntzOjc6InNlY3Rpb24iO3M6MjoiMTAiO3M6MjoiaWQiO3M6MjoiMTIiO3M6NjoiY291cnNlIjtzOjE6IjIiO3M6NDoibmFtZSI7TjtzOjc6InN1bW1hcnkiO3M6MDoiIjtzOjEzOiJzdW1tYXJ5Zm9ybWF0IjtzOjE6IjEiO3M6ODoic2VxdWVuY2UiO047czo3OiJ2aXNpYmxlIjtzOjE6IjEiO3M6MTI6Imhhc2FjdGl2aXRlcyI7YjowO319Ijt9czoxODoiY291cnNlX2FjdGl2aXRlc18yIjthOjM6e2k6MDtpOjEzMTczMzM4MzU7aToxO3M6MjoiMTEiO2k6MjtzOjI4MDoiYToxOntpOjI7Tzo4OiJzdGRDbGFzcyI6MTA6e3M6Nzoic2VjdGlvbiI7czoxOiIwIjtzOjQ6Im5hbWUiO3M6OToiTm92ZWRhZGVzIjtzOjQ6Imljb24iO3M6MDoiIjtzOjEzOiJpY29uY29tcG9uZW50IjtzOjA6IiI7czoyOiJpZCI7czoxOiIyIjtzOjY6ImhpZGRlbiI7YjowO3M6NzoibW9kbmFtZSI7czo1OiJmb3J1bSI7czo4OiJub2RldHlwZSI7aTowO3M6MzoidXJsIjtzOjQwOiJodHRwOi8vbG9jYWxob3N0L21vZC9mb3J1bS92aWV3LnBocD9pZD0yIjtzOjc6ImRpc3BsYXkiO2I6MTt9fSI7fX19czoyMToibG9hZF9uYXZpZ2F0aW9uX2FkbWluIjtiOjA7czoxNDoiZnJvbWRpc2N1c3Npb24iO3M6MTY6Imh0dHA6Ly9sb2NhbGhvc3QiO3M6MTI6ImZsYXNodmVyc2lvbiI7czo4OiIxMC4zLjE4MyI7czoyMToiY2FsZW5kYXJzaG93ZXZlbnR0eXBlIjtpOjE1O31VU0VSfE86ODoic3RkQ2xhc3MiOjYyOntzOjI6ImlkIjtzOjI6IjExIjtzOjQ6ImF1dGgiO3M6NToiZW1haWwiO3M6OToiY29uZmlybWVkIjtzOjE6IjEiO3M6MTI6InBvbGljeWFncmVlZCI7czoxOiIwIjtzOjc6ImRlbGV0ZWQiO3M6MToiMCI7czo5OiJzdXNwZW5kZWQiO3M6MToiMCI7czoxMDoibW5ldGhvc3RpZCI7czoxOiIxIjtzOjg6InVzZXJuYW1lIjtzOjE0OiJtaWVtYnJvcG9wcGVyMSI7czo4OiJwYXNzd29yZCI7czozMjoiZTZkMGEyOThlMGUwNDU0NWM5MGY0ZmUyODcyMDViZDEiO3M6ODoiaWRudW1iZXIiO3M6MDoiIjtzOjk6ImZpcnN0bmFtZSI7czo4OiJtaWVtYnJvMSI7czo4OiJsYXN0bmFtZSI7czo2OiJwb3BwZXIiO3M6NToiZW1haWwiO3M6MjQ6Im1pZW1icm9wb3BwZXIxQGdtYWlsLmNvbSI7czo5OiJlbWFpbHN0b3AiO3M6MToiMCI7czozOiJpY3EiO3M6MDoiIjtzOjU6InNreXBlIjtzOjA6IiI7czo1OiJ5YWhvbyI7czowOiIiO3M6MzoiYWltIjtzOjA6IiI7czozOiJtc24iO3M6MDoiIjtzOjY6InBob25lMSI7czowOiIiO3M6NjoicGhvbmUyIjtzOjA6IiI7czoxMToiaW5zdGl0dXRpb24iO3M6MDoiIjtzOjEwOiJkZXBhcnRtZW50IjtzOjA6IiI7czo3OiJhZGRyZXNzIjtzOjA6IiI7czo0OiJjaXR5IjtzOjEyOiJCdWVub3MgQWlyZXMiO3M6NzoiY291bnRyeSI7czoyOiJBUiI7czo0OiJsYW5nIjtzOjU6ImVzX2FyIjtzOjU6InRoZW1lIjtzOjA6IiI7czo4OiJ0aW1lem9uZSI7czoyOiI5OSI7czoxMToiZmlyc3RhY2Nlc3MiO3M6MTA6IjEzMTcyNDU1NzgiO3M6MTA6Imxhc3RhY2Nlc3MiO2k6MTMxNzMzMzgyOTtzOjk6Imxhc3Rsb2dpbiI7czoxMDoiMTMxNzMzMjA2MyI7czoxMjoiY3VycmVudGxvZ2luIjtpOjEzMTczMzM4Mjg7czo2OiJsYXN0aXAiO3M6OToiMTI3LjAuMC4xIjtzOjY6InNlY3JldCI7czoxNToibVN5Qm40eE05Y1QzU2tCIjtzOjc6InBpY3R1cmUiO3M6MToiMCI7czozOiJ1cmwiO3M6MDoiIjtzOjE3OiJkZXNjcmlwdGlvbmZvcm1hdCI7czoxOiIwIjtzOjEwOiJtYWlsZm9ybWF0IjtzOjE6IjEiO3M6MTA6Im1haWxkaWdlc3QiO3M6MToiMCI7czoxMToibWFpbGRpc3BsYXkiO3M6MToiMiI7czoxMDoiaHRtbGVkaXRvciI7czoxOiIxIjtzOjQ6ImFqYXgiO3M6MToiMSI7czoxMzoiYXV0b3N1YnNjcmliZSI7czoxOiIxIjtzOjExOiJ0cmFja2ZvcnVtcyI7czoxOiIwIjtzOjExOiJ0aW1lY3JlYXRlZCI7czoxMDoiMTMxNzI0NTE0NiI7czoxMjoidGltZW1vZGlmaWVkIjtzOjE6IjAiO3M6MTI6InRydXN0Yml0bWFzayI7czoxOiIwIjtzOjg6ImltYWdlYWx0IjtOO3M6MTI6InNjcmVlbnJlYWRlciI7czoxOiIwIjtzOjE2OiJsYXN0Y291cnNlYWNjZXNzIjthOjA6e31zOjE5OiJjdXJyZW50Y291cnNlYWNjZXNzIjthOjE6e2k6MjtpOjEzMTczMzM4MzQ7fXM6MTE6Imdyb3VwbWVtYmVyIjthOjA6e31zOjc6InByb2ZpbGUiO2E6Mzp7czozOiJkbmkiO3M6ODoiMTIzNDU2NzgiO3M6NjoicGFkcm9uIjtzOjg6IjEyMzQ1Njc4IjtzOjEzOiJyb2xzb2xpY2l0YWRvIjtzOjc6Ik1pZW1icm8iO31zOjY6ImFjY2VzcyI7YTo1OntzOjI6InJhIjthOjI6e3M6MjoiLzEiO2E6MTp7aTo3O3M6MToiNyI7fXM6ODoiLzEvMjMvMjQiO2E6MDp7fX1zOjQ6InJkZWYiO2E6OTp7czo0OiIvMTo3IjthOjUxOntzOjI3OiJibG9jay9vbmxpbmVfdXNlcnM6dmlld2xpc3QiO3M6MToiMSI7czoxNToibW9kL2ZvbGRlcjp2aWV3IjtzOjE6IjEiO3M6MTQ6Im1vZC9pbXNjcDp2aWV3IjtzOjE6IjEiO3M6MTM6Im1vZC9wYWdlOnZpZXciO3M6MToiMSI7czoxNzoibW9kL3Jlc291cmNlOnZpZXciO3M6MToiMSI7czoxMjoibW9kL3VybDp2aWV3IjtzOjE6IjEiO3M6MTc6Im1vb2RsZS9ibG9jazp2aWV3IjtzOjE6IjEiO3M6Mjc6Im1vb2RsZS9ibG9nOmFzc29jaWF0ZWNvdXJzZSI7czoxOiIxIjtzOjI3OiJtb29kbGUvYmxvZzphc3NvY2lhdGVtb2R1bGUiO3M6MToiMSI7czoxODoibW9vZGxlL2Jsb2c6Y3JlYXRlIjtzOjE6IjEiO3M6MjY6Im1vb2RsZS9ibG9nOm1hbmFnZWV4dGVybmFsIjtzOjE6IjEiO3M6MTg6Im1vb2RsZS9ibG9nOnNlYXJjaCI7czoxOiIxIjtzOjE2OiJtb29kbGUvYmxvZzp2aWV3IjtzOjE6IjEiO3M6MzI6Im1vb2RsZS9jYWxlbmRhcjptYW5hZ2Vvd25lbnRyaWVzIjtzOjE6IjEiO3M6MTk6Im1vb2RsZS9jb21tZW50OnBvc3QiO3M6MToiMSI7czoxOToibW9vZGxlL2NvbW1lbnQ6dmlldyI7czoxOiIxIjtzOjIxOiJtb29kbGUvY291cnNlOnJlcXVlc3QiO3M6MToiMSI7czoyMjoibW9vZGxlL215Om1hbmFnZWJsb2NrcyI7czoxOiIxIjtzOjIzOiJtb29kbGUvcG9ydGZvbGlvOmV4cG9ydCI7czoxOiIxIjtzOjE4OiJtb29kbGUvcmF0aW5nOnJhdGUiO3M6MToiMSI7czoxODoibW9vZGxlL3JhdGluZzp2aWV3IjtzOjE6IjEiO3M6MjE6Im1vb2RsZS9yYXRpbmc6dmlld2FsbCI7czoxOiIxIjtzOjIxOiJtb29kbGUvcmF0aW5nOnZpZXdhbnkiO3M6MToiMSI7czoyMzoibW9vZGxlL3NpdGU6c2VuZG1lc3NhZ2UiO3M6MToiMSI7czoxNzoibW9vZGxlL3RhZzpjcmVhdGUiO3M6MToiMSI7czoxNToibW9vZGxlL3RhZzplZGl0IjtzOjE6IjEiO3M6Mjk6Im1vb2RsZS91c2VyOmNoYW5nZW93bnBhc3N3b3JkIjtzOjE6IjEiO3M6MzM6Im1vb2RsZS91c2VyOmVkaXRvd25tZXNzYWdlcHJvZmlsZSI7czoxOiIxIjtzOjI2OiJtb29kbGUvdXNlcjplZGl0b3ducHJvZmlsZSI7czoxOiIxIjtzOjI3OiJtb29kbGUvdXNlcjptYW5hZ2Vvd25ibG9ja3MiO3M6MToiMSI7czoyNjoibW9vZGxlL3VzZXI6bWFuYWdlb3duZmlsZXMiO3M6MToiMSI7czozNToibW9vZGxlL3dlYnNlcnZpY2U6Y3JlYXRlbW9iaWxldG9rZW4iO3M6MToiMSI7czoyNDoicmVwb3NpdG9yeS9hbGZyZXNjbzp2aWV3IjtzOjE6IjEiO3M6MjI6InJlcG9zaXRvcnkvYm94bmV0OnZpZXciO3M6MToiMSI7czoyNzoicmVwb3NpdG9yeS9jb3Vyc2VmaWxlczp2aWV3IjtzOjE6IjEiO3M6MjM6InJlcG9zaXRvcnkvZHJvcGJveDp2aWV3IjtzOjE6IjEiO3M6MjY6InJlcG9zaXRvcnkvZmlsZXN5c3RlbTp2aWV3IjtzOjE6IjEiO3M6Mjk6InJlcG9zaXRvcnkvZmxpY2tyX3B1YmxpYzp2aWV3IjtzOjE6IjEiO3M6MjI6InJlcG9zaXRvcnkvZmxpY2tyOnZpZXciO3M6MToiMSI7czoyNjoicmVwb3NpdG9yeS9nb29nbGVkb2NzOnZpZXciO3M6MToiMSI7czoyMToicmVwb3NpdG9yeS9sb2NhbDp2aWV3IjtzOjE6IjEiO3M6MjI6InJlcG9zaXRvcnkvbWVybG90OnZpZXciO3M6MToiMSI7czoyMjoicmVwb3NpdG9yeS9waWNhc2E6dmlldyI7czoxOiIxIjtzOjIyOiJyZXBvc2l0b3J5L3JlY2VudDp2aWV3IjtzOjE6IjEiO3M6MTg6InJlcG9zaXRvcnkvczM6dmlldyI7czoxOiIxIjtzOjIyOiJyZXBvc2l0b3J5L3VwbG9hZDp2aWV3IjtzOjE6IjEiO3M6MTk6InJlcG9zaXRvcnkvdXJsOnZpZXciO3M6MToiMSI7czoyMDoicmVwb3NpdG9yeS91c2VyOnZpZXciO3M6MToiMSI7czoyMjoicmVwb3NpdG9yeS93ZWJkYXY6dmlldyI7czoxOiIxIjtzOjI1OiJyZXBvc2l0b3J5L3dpa2ltZWRpYTp2aWV3IjtzOjE6IjEiO3M6MjM6InJlcG9zaXRvcnkveW91dHViZTp2aWV3IjtzOjE6IjEiO31zOjg6Ii8xLzIvNDo3IjthOjE6e3M6MTc6Im1vb2RsZS9ibG9jazp2aWV3IjtzOjI6Ii0xIjt9czo5OiIvMS8yLzM3OjciO2E6MTp7czoxNzoibW9vZGxlL2Jsb2NrOnZpZXciO3M6MjoiLTEiO31zOjk6Ii8xLzIvMzY6NyI7YToxOntzOjE3OiJtb29kbGUvYmxvY2s6dmlldyI7czoyOiItMSI7fXM6OToiLzEvMi8zNDo3IjthOjE6e3M6MTc6Im1vb2RsZS9ibG9jazp2aWV3IjtzOjI6Ii0xIjt9czo5OiIvMS8yLzE3OjciO2E6Mzp7czoxODoibW9vZGxlL3JhdGluZzpyYXRlIjtzOjI6Ii0xIjtzOjE4OiJtb29kbGUvcmF0aW5nOnZpZXciO3M6MjoiLTEiO3M6MjQ6Im1vZC9mb3J1bTp2aWV3ZGlzY3Vzc2lvbiI7czoxOiIxIjt9czo5OiIvMS8yLzE1OjciO2E6MTp7czoxNzoibW9vZGxlL2Jsb2NrOnZpZXciO3M6MjoiLTEiO31zOjY6Ii8xLzc6NyI7YToxOntzOjE3OiJtb29kbGUvYmxvY2s6dmlldyI7czoyOiItMSI7fXM6NjoiLzEvODo3IjthOjE6e3M6MTc6Im1vb2RsZS9ibG9jazp2aWV3IjtzOjI6Ii0xIjt9fXM6NjoibG9hZGVkIjthOjQ6e2k6MDtzOjQ6Ii8xLzIiO2k6MTtzOjQ6Ii8xLzciO2k6MjtzOjQ6Ii8xLzgiO2k6MztzOjg6Ii8xLzIzLzI0Ijt9czoyOiJkciI7czoxOiI3IjtzOjQ6InRpbWUiO2k6MTMxNzMzMzgyODt9czo3OiJzZXNza2V5IjtzOjEwOiJWN3JmcnR0R1liIjtzOjEwOiJwcmVmZXJlbmNlIjthOjE6e3M6MTE6Il9sYXN0bG9hZGVkIjtpOjEzMTczMzM4Mzk7fXM6MTc6Im1lc3NhZ2VfbGFzdHBvcHVwIjtpOjA7czo3OiJkaXNwbGF5IjthOjE6e2k6MTtpOjA7fXM6MjU6ImFqYXhfdXBkYXRhYmxlX3VzZXJfcHJlZnMiO2E6Nzp7czoyMzoiZG9ja2VkX2Jsb2NrX2luc3RhbmNlXzQiO3M6MzoiaW50IjtzOjIzOiJkb2NrZWRfYmxvY2tfaW5zdGFuY2VfNSI7czozOiJpbnQiO3M6MTM6ImJsb2NrMTdoaWRkZW4iO3M6NDoiYm9vbCI7czoxMzoiYmxvY2sxNWhpZGRlbiI7czo0OiJib29sIjtzOjEzOiJibG9jazExaGlkZGVuIjtzOjQ6ImJvb2wiO3M6MTM6ImJsb2NrMTNoaWRkZW4iO3M6NDoiYm9vbCI7czoxMzoiYmxvY2sxNGhpZGRlbiI7czo0OiJib29sIjt9czo1OiJlbnJvbCI7YToyOntzOjg6ImVucm9sbGVkIjthOjE6e2k6MjtpOjEzMTczMzU2MzQ7fXM6OToidGVtcGd1ZXN0IjthOjA6e319czo3OiJlZGl0aW5nIjtpOjA7fQ==', 1317333829, 1317333839, '127.0.0.1', '127.0.0.1'),
(172, 0, 'fnibcp78vqn2otqo931ka5gn23', 12, 'U0VTU0lPTnxPOjg6InN0ZENsYXNzIjo3OntzOjEwOiJsb2dpbmNvdW50IjtpOjA7czoyMjoiYWRtaW5fY3JpdGljYWxfd2FybmluZyI7aTowO3M6MjE6ImxvYWRfbmF2aWdhdGlvbl9hZG1pbiI7YjoxO3M6MTQ6ImZyb21kaXNjdXNzaW9uIjtzOjE2OiJodHRwOi8vbG9jYWxob3N0IjtzOjEyOiJmbGFzaHZlcnNpb24iO3M6ODoiMTAuMy4xODMiO3M6MTQ6InVzZXJfZmlsdGVyaW5nIjthOjA6e31zOjg6Im5hdmNhY2hlIjtPOjg6InN0ZENsYXNzIjoxOntzOjEwOiJuYXZpZ2F0aW9uIjthOjQ6e3M6MTc6ImNvdXJzZV9zZWN0aW9uc18xIjthOjM6e2k6MDtpOjEzMTczMzQ5ODE7aToxO3M6MjoiMTIiO2k6MjtzOjIyMToiYToxOntpOjA7Tzo4OiJzdGRDbGFzcyI6OTp7czo3OiJzZWN0aW9uIjtzOjE6IjAiO3M6MjoiaWQiO3M6MToiMSI7czo2OiJjb3Vyc2UiO3M6MToiMSI7czo0OiJuYW1lIjtOO3M6Nzoic3VtbWFyeSI7czowOiIiO3M6MTM6InN1bW1hcnlmb3JtYXQiO3M6MToiMSI7czo4OiJzZXF1ZW5jZSI7czoxOiIxIjtzOjc6InZpc2libGUiO3M6MToiMSI7czoxMjoiaGFzYWN0aXZpdGVzIjtiOjE7fX0iO31zOjE4OiJjb3Vyc2VfYWN0aXZpdGVzXzEiO2E6Mzp7aTowO2k6MTMxNzMzNDk4MTtpOjE7czoyOiIxMiI7aToyO3M6MjkxOiJhOjE6e2k6MTtPOjg6InN0ZENsYXNzIjoxMDp7czo3OiJzZWN0aW9uIjtzOjE6IjAiO3M6NDoibmFtZSI7czoxOToiTm92ZWRhZGVzIGRlbCBzaXRpbyI7czo0OiJpY29uIjtzOjA6IiI7czoxMzoiaWNvbmNvbXBvbmVudCI7czowOiIiO3M6MjoiaWQiO3M6MToiMSI7czo2OiJoaWRkZW4iO2I6MDtzOjc6Im1vZG5hbWUiO3M6NToiZm9ydW0iO3M6ODoibm9kZXR5cGUiO2k6MDtzOjM6InVybCI7czo0MDoiaHR0cDovL2xvY2FsaG9zdC9tb2QvZm9ydW0vdmlldy5waHA/aWQ9MSI7czo3OiJkaXNwbGF5IjtiOjE7fX0iO31zOjE3OiJ1c2VyYmxvZ29wdGlvbnMxMiI7YTozOntpOjA7aToxMzE3MzM0OTgxO2k6MTtzOjI6IjEyIjtpOjI7czo2OTQ6ImE6Mjp7czo0OiJ2aWV3IjthOjI6e3M6Njoic3RyaW5nIjtzOjIyOiJWZXIgdG9kYXMgbWlzIGVudHJhZGFzIjtzOjQ6ImxpbmsiO086MTA6Im1vb2RsZV91cmwiOjk6e3M6OToiACoAc2NoZW1lIjtzOjQ6Imh0dHAiO3M6NzoiACoAaG9zdCI7czo5OiJsb2NhbGhvc3QiO3M6NzoiACoAcG9ydCI7czowOiIiO3M6NzoiACoAdXNlciI7czowOiIiO3M6NzoiACoAcGFzcyI7czowOiIiO3M6NzoiACoAcGF0aCI7czoxNToiL2Jsb2cvaW5kZXgucGhwIjtzOjE2OiIAKgBzbGFzaGFyZ3VtZW50IjtzOjA6IiI7czo5OiIAKgBhbmNob3IiO047czo5OiIAKgBwYXJhbXMiO2E6MTp7czo2OiJ1c2VyaWQiO3M6MjoiMTIiO319fXM6MzoiYWRkIjthOjI6e3M6Njoic3RyaW5nIjtzOjI1OiJBZ3JlZ2FyIHVuYSBudWV2YSBlbnRyYWRhIjtzOjQ6ImxpbmsiO086MTA6Im1vb2RsZV91cmwiOjk6e3M6OToiACoAc2NoZW1lIjtzOjQ6Imh0dHAiO3M6NzoiACoAaG9zdCI7czo5OiJsb2NhbGhvc3QiO3M6NzoiACoAcG9ydCI7czowOiIiO3M6NzoiACoAdXNlciI7czowOiIiO3M6NzoiACoAcGFzcyI7czowOiIiO3M6NzoiACoAcGF0aCI7czoxNDoiL2Jsb2cvZWRpdC5waHAiO3M6MTY6IgAqAHNsYXNoYXJndW1lbnQiO3M6MDoiIjtzOjk6IgAqAGFuY2hvciI7TjtzOjk6IgAqAHBhcmFtcyI7YToxOntzOjY6ImFjdGlvbiI7czozOiJhZGQiO319fX0iO31zOjE3OiJjb250ZXh0aGFzcmVwb3MzMiI7YTozOntpOjA7aToxMzE3MzM0OTgxO2k6MTtzOjI6IjEyIjtpOjI7czo0OiJiOjA7Ijt9fX19VVNFUnxPOjg6InN0ZENsYXNzIjo2MTp7czoyOiJpZCI7czoyOiIxMiI7czo0OiJhdXRoIjtzOjU6ImVtYWlsIjtzOjk6ImNvbmZpcm1lZCI7czoxOiIxIjtzOjEyOiJwb2xpY3lhZ3JlZWQiO3M6MToiMCI7czo3OiJkZWxldGVkIjtzOjE6IjAiO3M6OToic3VzcGVuZGVkIjtzOjE6IjAiO3M6MTA6Im1uZXRob3N0aWQiO3M6MToiMSI7czo4OiJ1c2VybmFtZSI7czoxMjoiYWRtaW5wb3BwZXIxIjtzOjg6InBhc3N3b3JkIjtzOjMyOiJlNmQwYTI5OGUwZTA0NTQ1YzkwZjRmZTI4NzIwNWJkMSI7czo4OiJpZG51bWJlciI7czowOiIiO3M6OToiZmlyc3RuYW1lIjtzOjY6ImFkbWluMSI7czo4OiJsYXN0bmFtZSI7czo2OiJwb3BwZXIiO3M6NToiZW1haWwiO3M6MjI6ImFkbWlucG9wcGVyMUBnbWFpbC5jb20iO3M6OToiZW1haWxzdG9wIjtzOjE6IjAiO3M6MzoiaWNxIjtzOjA6IiI7czo1OiJza3lwZSI7czowOiIiO3M6NToieWFob28iO3M6MDoiIjtzOjM6ImFpbSI7czowOiIiO3M6MzoibXNuIjtzOjA6IiI7czo2OiJwaG9uZTEiO3M6MDoiIjtzOjY6InBob25lMiI7czowOiIiO3M6MTE6Imluc3RpdHV0aW9uIjtzOjA6IiI7czoxMDoiZGVwYXJ0bWVudCI7czowOiIiO3M6NzoiYWRkcmVzcyI7czowOiIiO3M6NDoiY2l0eSI7czoxMjoiQnVlbm9zIEFpcmVzIjtzOjc6ImNvdW50cnkiO3M6MjoiQVIiO3M6NDoibGFuZyI7czo1OiJlc19hciI7czo1OiJ0aGVtZSI7czowOiIiO3M6ODoidGltZXpvbmUiO3M6MjoiOTkiO3M6MTE6ImZpcnN0YWNjZXNzIjtzOjEwOiIxMzE3MjQ1NTc1IjtzOjEwOiJsYXN0YWNjZXNzIjtpOjEzMTczMzUxODA7czo5OiJsYXN0bG9naW4iO3M6MTA6IjEzMTczMzQ4MzQiO3M6MTI6ImN1cnJlbnRsb2dpbiI7aToxMzE3MzM0OTEwO3M6NjoibGFzdGlwIjtzOjk6IjEyNy4wLjAuMSI7czo2OiJzZWNyZXQiO3M6MTU6ImhPb3FGcHloMEh0MTJMUyI7czo3OiJwaWN0dXJlIjtzOjE6IjAiO3M6MzoidXJsIjtzOjA6IiI7czoxNzoiZGVzY3JpcHRpb25mb3JtYXQiO3M6MToiMCI7czoxMDoibWFpbGZvcm1hdCI7czoxOiIxIjtzOjEwOiJtYWlsZGlnZXN0IjtzOjE6IjAiO3M6MTE6Im1haWxkaXNwbGF5IjtzOjE6IjIiO3M6MTA6Imh0bWxlZGl0b3IiO3M6MToiMSI7czo0OiJhamF4IjtzOjE6IjEiO3M6MTM6ImF1dG9zdWJzY3JpYmUiO3M6MToiMSI7czoxMToidHJhY2tmb3J1bXMiO3M6MToiMCI7czoxMToidGltZWNyZWF0ZWQiO3M6MTA6IjEzMTcyNDU1NDUiO3M6MTI6InRpbWVtb2RpZmllZCI7czoxOiIwIjtzOjEyOiJ0cnVzdGJpdG1hc2siO3M6MToiMCI7czo4OiJpbWFnZWFsdCI7TjtzOjEyOiJzY3JlZW5yZWFkZXIiO3M6MToiMCI7czoxNjoibGFzdGNvdXJzZWFjY2VzcyI7YToxOntpOjI7czoxMDoiMTMxNzMzNDY5MSI7fXM6MTk6ImN1cnJlbnRjb3Vyc2VhY2Nlc3MiO2E6MDp7fXM6MTE6Imdyb3VwbWVtYmVyIjthOjA6e31zOjc6InByb2ZpbGUiO2E6Mzp7czozOiJkbmkiO3M6ODoiMTIzNDU2NzgiO3M6NjoicGFkcm9uIjtzOjg6IjEyMzQ1Njc4IjtzOjEzOiJyb2xzb2xpY2l0YWRvIjtzOjEzOiJBZG1pbmlzdHJhZG9yIjt9czo2OiJhY2Nlc3MiO2E6NTp7czoyOiJyYSI7YToxOntzOjI6Ii8xIjthOjI6e2k6ODtzOjE6IjgiO2k6NztzOjE6IjciO319czo0OiJyZGVmIjthOjE4OntzOjQ6Ii8xOjgiO2E6MzY3OntzOjI3OiJibG9jay9vbmxpbmVfdXNlcnM6dmlld2xpc3QiO3M6MToiMSI7czozMToiYmxvY2svcnNzX2NsaWVudDptYW5hZ2VhbnlmZWVkcyI7czoxOiIxIjtzOjMxOiJibG9jay9yc3NfY2xpZW50Om1hbmFnZW93bmZlZWRzIjtzOjE6IjEiO3M6Mjg6ImNvdXJzZXJlcG9ydC9jb21wbGV0aW9uOnZpZXciO3M6MToiMSI7czoyMToiY291cnNlcmVwb3J0L2xvZzp2aWV3IjtzOjE6IjEiO3M6MjU6ImNvdXJzZXJlcG9ydC9sb2c6dmlld2xpdmUiO3M6MToiMSI7czoyNjoiY291cnNlcmVwb3J0L2xvZzp2aWV3dG9kYXkiO3M6MToiMSI7czoyNToiY291cnNlcmVwb3J0L291dGxpbmU6dmlldyI7czoxOiIxIjtzOjMxOiJjb3Vyc2VyZXBvcnQvcGFydGljaXBhdGlvbjp2aWV3IjtzOjE6IjEiO3M6MjY6ImNvdXJzZXJlcG9ydC9wcm9ncmVzczp2aWV3IjtzOjE6IjEiO3M6MjM6ImNvdXJzZXJlcG9ydC9zdGF0czp2aWV3IjtzOjE6IjEiO3M6MjI6ImVucm9sL2F1dGhvcml6ZTpjb25maWciO3M6MToiMSI7czoyMjoiZW5yb2wvYXV0aG9yaXplOm1hbmFnZSI7czoxOiIxIjtzOjMwOiJlbnJvbC9hdXRob3JpemU6bWFuYWdlcGF5bWVudHMiO3M6MToiMSI7czoyMzoiZW5yb2wvYXV0aG9yaXplOnVuZW5yb2wiO3M6MToiMSI7czoyNzoiZW5yb2wvYXV0aG9yaXplOnVuZW5yb2xzZWxmIjtzOjE6IjEiO3M6MjU6ImVucm9sL2F1dGhvcml6ZTp1cGxvYWRjc3YiO3M6MToiMSI7czoyNzoiZW5yb2wvY2F0ZWdvcnk6c3luY2hyb25pc2VkIjtzOjE6IjEiO3M6MTk6ImVucm9sL2NvaG9ydDpjb25maWciO3M6MToiMSI7czoxODoiZW5yb2wvZ3Vlc3Q6Y29uZmlnIjtzOjE6IjEiO3M6MTc6ImVucm9sL2xkYXA6bWFuYWdlIjtzOjE6IjEiO3M6MTk6ImVucm9sL21hbnVhbDpjb25maWciO3M6MToiMSI7czoxODoiZW5yb2wvbWFudWFsOmVucm9sIjtzOjE6IjEiO3M6MTk6ImVucm9sL21hbnVhbDptYW5hZ2UiO3M6MToiMSI7czoyMDoiZW5yb2wvbWFudWFsOnVuZW5yb2wiO3M6MToiMSI7czoyNDoiZW5yb2wvbWFudWFsOnVuZW5yb2xzZWxmIjtzOjE6IjEiO3M6MTc6ImVucm9sL21ldGE6Y29uZmlnIjtzOjE6IjEiO3M6MjU6ImVucm9sL21ldGE6c2VsZWN0YXNsaW5rZWQiO3M6MToiMSI7czoxOToiZW5yb2wvcGF5cGFsOmNvbmZpZyI7czoxOiIxIjtzOjE5OiJlbnJvbC9wYXlwYWw6bWFuYWdlIjtzOjE6IjEiO3M6MjA6ImVucm9sL3BheXBhbDp1bmVucm9sIjtzOjE6IjEiO3M6MjQ6ImVucm9sL3BheXBhbDp1bmVucm9sc2VsZiI7czoxOiIxIjtzOjE3OiJlbnJvbC9zZWxmOmNvbmZpZyI7czoxOiIxIjtzOjE3OiJlbnJvbC9zZWxmOm1hbmFnZSI7czoxOiIxIjtzOjE4OiJlbnJvbC9zZWxmOnVuZW5yb2wiO3M6MToiMSI7czoyMjoiZW5yb2wvc2VsZjp1bmVucm9sc2VsZiI7czoxOiIxIjtzOjIzOiJncmFkZWV4cG9ydC9vZHM6cHVibGlzaCI7czoxOiIxIjtzOjIwOiJncmFkZWV4cG9ydC9vZHM6dmlldyI7czoxOiIxIjtzOjIzOiJncmFkZWV4cG9ydC90eHQ6cHVibGlzaCI7czoxOiIxIjtzOjIwOiJncmFkZWV4cG9ydC90eHQ6dmlldyI7czoxOiIxIjtzOjIzOiJncmFkZWV4cG9ydC94bHM6cHVibGlzaCI7czoxOiIxIjtzOjIwOiJncmFkZWV4cG9ydC94bHM6dmlldyI7czoxOiIxIjtzOjIzOiJncmFkZWV4cG9ydC94bWw6cHVibGlzaCI7czoxOiIxIjtzOjIwOiJncmFkZWV4cG9ydC94bWw6dmlldyI7czoxOiIxIjtzOjIwOiJncmFkZWltcG9ydC9jc3Y6dmlldyI7czoxOiIxIjtzOjIzOiJncmFkZWltcG9ydC94bWw6cHVibGlzaCI7czoxOiIxIjtzOjIwOiJncmFkZWltcG9ydC94bWw6dmlldyI7czoxOiIxIjtzOjIzOiJncmFkZXJlcG9ydC9ncmFkZXI6dmlldyI7czoxOiIxIjtzOjI1OiJncmFkZXJlcG9ydC9vdXRjb21lczp2aWV3IjtzOjE6IjEiO3M6MjU6ImdyYWRlcmVwb3J0L292ZXJ2aWV3OnZpZXciO3M6MToiMSI7czoyMToiZ3JhZGVyZXBvcnQvdXNlcjp2aWV3IjtzOjE6IjEiO3M6MzQ6Im1vZC9hc3NpZ25tZW50OmV4cG9ydG93bnN1Ym1pc3Npb24iO3M6MToiMSI7czoyMDoibW9kL2Fzc2lnbm1lbnQ6Z3JhZGUiO3M6MToiMSI7czoyMToibW9kL2Fzc2lnbm1lbnQ6c3VibWl0IjtzOjE6IjEiO3M6MTk6Im1vZC9hc3NpZ25tZW50OnZpZXciO3M6MToiMSI7czoxMzoibW9kL2NoYXQ6Y2hhdCI7czoxOiIxIjtzOjE4OiJtb2QvY2hhdDpkZWxldGVsb2ciO3M6MToiMSI7czozNDoibW9kL2NoYXQ6ZXhwb3J0cGFydGljaXBhdGVkc2Vzc2lvbiI7czoxOiIxIjtzOjIyOiJtb2QvY2hhdDpleHBvcnRzZXNzaW9uIjtzOjE6IjEiO3M6MTY6Im1vZC9jaGF0OnJlYWRsb2ciO3M6MToiMSI7czoxNzoibW9kL2Nob2ljZTpjaG9vc2UiO3M6MToiMSI7czoyNjoibW9kL2Nob2ljZTpkZWxldGVyZXNwb25zZXMiO3M6MToiMSI7czoyODoibW9kL2Nob2ljZTpkb3dubG9hZHJlc3BvbnNlcyI7czoxOiIxIjtzOjI0OiJtb2QvY2hvaWNlOnJlYWRyZXNwb25zZXMiO3M6MToiMSI7czoxNjoibW9kL2RhdGE6YXBwcm92ZSI7czoxOiIxIjtzOjE2OiJtb2QvZGF0YTpjb21tZW50IjtzOjE6IjEiO3M6MjU6Im1vZC9kYXRhOmV4cG9ydGFsbGVudHJpZXMiO3M6MToiMSI7czoyMDoibW9kL2RhdGE6ZXhwb3J0ZW50cnkiO3M6MToiMSI7czoyMzoibW9kL2RhdGE6ZXhwb3J0b3duZW50cnkiO3M6MToiMSI7czoyMzoibW9kL2RhdGE6bWFuYWdlY29tbWVudHMiO3M6MToiMSI7czoyMjoibW9kL2RhdGE6bWFuYWdlZW50cmllcyI7czoxOiIxIjtzOjI0OiJtb2QvZGF0YTptYW5hZ2V0ZW1wbGF0ZXMiO3M6MToiMSI7czoyNjoibW9kL2RhdGE6bWFuYWdldXNlcnByZXNldHMiO3M6MToiMSI7czoxMzoibW9kL2RhdGE6cmF0ZSI7czoxOiIxIjtzOjIzOiJtb2QvZGF0YTp2aWV3YWxscmF0aW5ncyI7czoxOiIxIjtzOjI3OiJtb2QvZGF0YTp2aWV3YWxsdXNlcnByZXNldHMiO3M6MToiMSI7czoyMjoibW9kL2RhdGE6dmlld2FueXJhdGluZyI7czoxOiIxIjtzOjE4OiJtb2QvZGF0YTp2aWV3ZW50cnkiO3M6MToiMSI7czoxOToibW9kL2RhdGE6dmlld3JhdGluZyI7czoxOiIxIjtzOjE5OiJtb2QvZGF0YTp3cml0ZWVudHJ5IjtzOjE6IjEiO3M6MjE6Im1vZC9mZWVkYmFjazpjb21wbGV0ZSI7czoxOiIxIjtzOjM0OiJtb2QvZmVlZGJhY2s6Y3JlYXRlcHJpdmF0ZXRlbXBsYXRlIjtzOjE6IjEiO3M6MzM6Im1vZC9mZWVkYmFjazpjcmVhdGVwdWJsaWN0ZW1wbGF0ZSI7czoxOiIxIjtzOjMwOiJtb2QvZmVlZGJhY2s6ZGVsZXRlc3VibWlzc2lvbnMiO3M6MToiMSI7czoyNzoibW9kL2ZlZWRiYWNrOmRlbGV0ZXRlbXBsYXRlIjtzOjE6IjEiO3M6MjI6Im1vZC9mZWVkYmFjazplZGl0aXRlbXMiO3M6MToiMSI7czoyMjoibW9kL2ZlZWRiYWNrOm1hcGNvdXJzZSI7czoxOiIxIjtzOjI0OiJtb2QvZmVlZGJhY2s6cmVjZWl2ZW1haWwiO3M6MToiMSI7czoxNzoibW9kL2ZlZWRiYWNrOnZpZXciO3M6MToiMSI7czoyODoibW9kL2ZlZWRiYWNrOnZpZXdhbmFseXNlcGFnZSI7czoxOiIxIjtzOjI0OiJtb2QvZmVlZGJhY2s6dmlld3JlcG9ydHMiO3M6MToiMSI7czoyMjoibW9kL2ZvbGRlcjptYW5hZ2VmaWxlcyI7czoxOiIxIjtzOjE1OiJtb2QvZm9sZGVyOnZpZXciO3M6MToiMSI7czoxNzoibW9kL2ZvcnVtOmFkZG5ld3MiO3M6MToiMSI7czoyNjoibW9kL2ZvcnVtOmNyZWF0ZWF0dGFjaG1lbnQiO3M6MToiMSI7czoyMzoibW9kL2ZvcnVtOmRlbGV0ZWFueXBvc3QiO3M6MToiMSI7czoyMzoibW9kL2ZvcnVtOmRlbGV0ZW93bnBvc3QiO3M6MToiMSI7czoyMToibW9kL2ZvcnVtOmVkaXRhbnlwb3N0IjtzOjE6IjEiO3M6MjY6Im1vZC9mb3J1bTpleHBvcnRkaXNjdXNzaW9uIjtzOjE6IjEiO3M6MjM6Im1vZC9mb3J1bTpleHBvcnRvd25wb3N0IjtzOjE6IjEiO3M6MjA6Im1vZC9mb3J1bTpleHBvcnRwb3N0IjtzOjE6IjEiO3M6MzA6Im1vZC9mb3J1bTppbml0aWFsc3Vic2NyaXB0aW9ucyI7czoxOiIxIjtzOjI5OiJtb2QvZm9ydW06bWFuYWdlc3Vic2NyaXB0aW9ucyI7czoxOiIxIjtzOjI1OiJtb2QvZm9ydW06bW92ZWRpc2N1c3Npb25zIjtzOjE6IjEiO3M6MzE6Im1vZC9mb3J1bTpwb3N0d2l0aG91dHRocm90dGxpbmciO3M6MToiMSI7czoxNDoibW9kL2ZvcnVtOnJhdGUiO3M6MToiMSI7czoxOToibW9kL2ZvcnVtOnJlcGx5bmV3cyI7czoxOiIxIjtzOjE5OiJtb2QvZm9ydW06cmVwbHlwb3N0IjtzOjE6IjEiO3M6MjY6Im1vZC9mb3J1bTpzcGxpdGRpc2N1c3Npb25zIjtzOjE6IjEiO3M6MjU6Im1vZC9mb3J1bTpzdGFydGRpc2N1c3Npb24iO3M6MToiMSI7czoyNDoibW9kL2ZvcnVtOnZpZXdhbGxyYXRpbmdzIjtzOjE6IjEiO3M6MjM6Im1vZC9mb3J1bTp2aWV3YW55cmF0aW5nIjtzOjE6IjEiO3M6MjQ6Im1vZC9mb3J1bTp2aWV3ZGlzY3Vzc2lvbiI7czoxOiIxIjtzOjMwOiJtb2QvZm9ydW06dmlld2hpZGRlbnRpbWVkcG9zdHMiO3M6MToiMSI7czozMzoibW9kL2ZvcnVtOnZpZXdxYW5kYXdpdGhvdXRwb3N0aW5nIjtzOjE6IjEiO3M6MjA6Im1vZC9mb3J1bTp2aWV3cmF0aW5nIjtzOjE6IjEiO3M6MjU6Im1vZC9mb3J1bTp2aWV3c3Vic2NyaWJlcnMiO3M6MToiMSI7czoyMDoibW9kL2dsb3NzYXJ5OmFwcHJvdmUiO3M6MToiMSI7czoyMDoibW9kL2dsb3NzYXJ5OmNvbW1lbnQiO3M6MToiMSI7czoxOToibW9kL2dsb3NzYXJ5OmV4cG9ydCI7czoxOiIxIjtzOjI0OiJtb2QvZ2xvc3Nhcnk6ZXhwb3J0ZW50cnkiO3M6MToiMSI7czoyNzoibW9kL2dsb3NzYXJ5OmV4cG9ydG93bmVudHJ5IjtzOjE6IjEiO3M6MTk6Im1vZC9nbG9zc2FyeTppbXBvcnQiO3M6MToiMSI7czoyOToibW9kL2dsb3NzYXJ5Om1hbmFnZWNhdGVnb3JpZXMiO3M6MToiMSI7czoyNzoibW9kL2dsb3NzYXJ5Om1hbmFnZWNvbW1lbnRzIjtzOjE6IjEiO3M6MjY6Im1vZC9nbG9zc2FyeTptYW5hZ2VlbnRyaWVzIjtzOjE6IjEiO3M6MTc6Im1vZC9nbG9zc2FyeTpyYXRlIjtzOjE6IjEiO3M6Mjc6Im1vZC9nbG9zc2FyeTp2aWV3YWxscmF0aW5ncyI7czoxOiIxIjtzOjI2OiJtb2QvZ2xvc3Nhcnk6dmlld2FueXJhdGluZyI7czoxOiIxIjtzOjIzOiJtb2QvZ2xvc3Nhcnk6dmlld3JhdGluZyI7czoxOiIxIjtzOjE4OiJtb2QvZ2xvc3Nhcnk6d3JpdGUiO3M6MToiMSI7czoxNDoibW9kL2ltc2NwOnZpZXciO3M6MToiMSI7czoxNToibW9kL2xlc3NvbjplZGl0IjtzOjE6IjEiO3M6MTc6Im1vZC9sZXNzb246bWFuYWdlIjtzOjE6IjEiO3M6MTM6Im1vZC9wYWdlOnZpZXciO3M6MToiMSI7czoxNjoibW9kL3F1aXo6YXR0ZW1wdCI7czoxOiIxIjtzOjIzOiJtb2QvcXVpejpkZWxldGVhdHRlbXB0cyI7czoxOiIxIjtzOjMxOiJtb2QvcXVpejplbWFpbGNvbmZpcm1zdWJtaXNzaW9uIjtzOjE6IjEiO3M6MzA6Im1vZC9xdWl6OmVtYWlsbm90aWZ5c3VibWlzc2lvbiI7czoxOiIxIjtzOjE0OiJtb2QvcXVpejpncmFkZSI7czoxOiIxIjtzOjI1OiJtb2QvcXVpejppZ25vcmV0aW1lbGltaXRzIjtzOjE6IjEiO3M6MTU6Im1vZC9xdWl6Om1hbmFnZSI7czoxOiIxIjtzOjI0OiJtb2QvcXVpejptYW5hZ2VvdmVycmlkZXMiO3M6MToiMSI7czoxNjoibW9kL3F1aXo6cHJldmlldyI7czoxOiIxIjtzOjE2OiJtb2QvcXVpejpyZWdyYWRlIjtzOjE6IjEiO3M6MjU6Im1vZC9xdWl6OnJldmlld215YXR0ZW1wdHMiO3M6MToiMSI7czoxMzoibW9kL3F1aXo6dmlldyI7czoxOiIxIjtzOjIwOiJtb2QvcXVpejp2aWV3cmVwb3J0cyI7czoxOiIxIjtzOjE3OiJtb2QvcmVzb3VyY2U6dmlldyI7czoxOiIxIjtzOjI1OiJtb2Qvc2Nvcm06ZGVsZXRlcmVzcG9uc2VzIjtzOjE6IjEiO3M6MTk6Im1vZC9zY29ybTpzYXZldHJhY2siO3M6MToiMSI7czoxODoibW9kL3Njb3JtOnNraXB2aWV3IjtzOjE6IjEiO3M6MjA6Im1vZC9zY29ybTp2aWV3cmVwb3J0IjtzOjE6IjEiO3M6MjA6Im1vZC9zY29ybTp2aWV3c2NvcmVzIjtzOjE6IjEiO3M6MTk6Im1vZC9zdXJ2ZXk6ZG93bmxvYWQiO3M6MToiMSI7czoyMjoibW9kL3N1cnZleTpwYXJ0aWNpcGF0ZSI7czoxOiIxIjtzOjI0OiJtb2Qvc3VydmV5OnJlYWRyZXNwb25zZXMiO3M6MToiMSI7czoxMjoibW9kL3VybDp2aWV3IjtzOjE6IjEiO3M6MTk6Im1vZC93aWtpOmNyZWF0ZXBhZ2UiO3M6MToiMSI7czoyMDoibW9kL3dpa2k6ZWRpdGNvbW1lbnQiO3M6MToiMSI7czoxNzoibW9kL3dpa2k6ZWRpdHBhZ2UiO3M6MToiMSI7czoyMjoibW9kL3dpa2k6bWFuYWdlY29tbWVudCI7czoxOiIxIjtzOjIwOiJtb2Qvd2lraTptYW5hZ2VmaWxlcyI7czoxOiIxIjtzOjE5OiJtb2Qvd2lraTptYW5hZ2V3aWtpIjtzOjE6IjEiO3M6MjE6Im1vZC93aWtpOm92ZXJyaWRlbG9jayI7czoxOiIxIjtzOjIwOiJtb2Qvd2lraTp2aWV3Y29tbWVudCI7czoxOiIxIjtzOjE3OiJtb2Qvd2lraTp2aWV3cGFnZSI7czoxOiIxIjtzOjIxOiJtb2Qvd29ya3Nob3A6YWxsb2NhdGUiO3M6MToiMSI7czoyNzoibW9kL3dvcmtzaG9wOmVkaXRkaW1lbnNpb25zIjtzOjE6IjEiO3M6Mjg6Im1vZC93b3Jrc2hvcDppZ25vcmVkZWFkbGluZXMiO3M6MToiMSI7czoyNzoibW9kL3dvcmtzaG9wOm1hbmFnZWV4YW1wbGVzIjtzOjE6IjEiO3M6Mjc6Im1vZC93b3Jrc2hvcDpvdmVycmlkZWdyYWRlcyI7czoxOiIxIjtzOjIzOiJtb2Qvd29ya3Nob3A6cGVlcmFzc2VzcyI7czoxOiIxIjtzOjMxOiJtb2Qvd29ya3Nob3A6cHVibGlzaHN1Ym1pc3Npb25zIjtzOjE6IjEiO3M6MTk6Im1vZC93b3Jrc2hvcDpzdWJtaXQiO3M6MToiMSI7czoyNDoibW9kL3dvcmtzaG9wOnN3aXRjaHBoYXNlIjtzOjE6IjEiO3M6MTc6Im1vZC93b3Jrc2hvcDp2aWV3IjtzOjE6IjEiO3M6MzE6Im1vZC93b3Jrc2hvcDp2aWV3YWxsYXNzZXNzbWVudHMiO3M6MToiMSI7czozMToibW9kL3dvcmtzaG9wOnZpZXdhbGxzdWJtaXNzaW9ucyI7czoxOiIxIjtzOjI4OiJtb2Qvd29ya3Nob3A6dmlld2F1dGhvcm5hbWVzIjtzOjE6IjEiO3M6MzI6Im1vZC93b3Jrc2hvcDp2aWV3YXV0aG9ycHVibGlzaGVkIjtzOjE6IjEiO3M6Mzc6Im1vZC93b3Jrc2hvcDp2aWV3cHVibGlzaGVkc3VibWlzc2lvbnMiO3M6MToiMSI7czozMDoibW9kL3dvcmtzaG9wOnZpZXdyZXZpZXdlcm5hbWVzIjtzOjE6IjEiO3M6MjM6Im1vb2RsZS9iYWNrdXA6YW5vbnltaXNlIjtzOjE6IjEiO3M6Mjg6Im1vb2RsZS9iYWNrdXA6YmFja3VwYWN0aXZpdHkiO3M6MToiMSI7czoyNjoibW9vZGxlL2JhY2t1cDpiYWNrdXBjb3Vyc2UiO3M6MToiMSI7czoyNzoibW9vZGxlL2JhY2t1cDpiYWNrdXBzZWN0aW9uIjtzOjE6IjEiO3M6Mjk6Im1vb2RsZS9iYWNrdXA6YmFja3VwdGFyZ2V0aHViIjtzOjE6IjEiO3M6MzI6Im1vb2RsZS9iYWNrdXA6YmFja3VwdGFyZ2V0aW1wb3J0IjtzOjE6IjEiO3M6MjM6Im1vb2RsZS9iYWNrdXA6Y29uZmlndXJlIjtzOjE6IjEiO3M6MjY6Im1vb2RsZS9iYWNrdXA6ZG93bmxvYWRmaWxlIjtzOjE6IjEiO3M6MjI6Im1vb2RsZS9iYWNrdXA6dXNlcmluZm8iO3M6MToiMSI7czoxNzoibW9vZGxlL2Jsb2NrOmVkaXQiO3M6MToiMSI7czoxNzoibW9vZGxlL2Jsb2NrOnZpZXciO3M6MToiMSI7czoyNzoibW9vZGxlL2Jsb2c6YXNzb2NpYXRlY291cnNlIjtzOjE6IjEiO3M6Mjc6Im1vb2RsZS9ibG9nOmFzc29jaWF0ZW1vZHVsZSI7czoxOiIxIjtzOjE4OiJtb29kbGUvYmxvZzpjcmVhdGUiO3M6MToiMSI7czoyNToibW9vZGxlL2Jsb2c6bWFuYWdlZW50cmllcyI7czoxOiIxIjtzOjI2OiJtb29kbGUvYmxvZzptYW5hZ2VleHRlcm5hbCI7czoxOiIxIjtzOjE4OiJtb29kbGUvYmxvZzpzZWFyY2giO3M6MToiMSI7czoxNjoibW9vZGxlL2Jsb2c6dmlldyI7czoxOiIxIjtzOjIyOiJtb29kbGUvYmxvZzp2aWV3ZHJhZnRzIjtzOjE6IjEiO3M6Mjk6Im1vb2RsZS9jYWxlbmRhcjptYW5hZ2VlbnRyaWVzIjtzOjE6IjEiO3M6MzQ6Im1vb2RsZS9jYWxlbmRhcjptYW5hZ2Vncm91cGVudHJpZXMiO3M6MToiMSI7czozMjoibW9vZGxlL2NhbGVuZGFyOm1hbmFnZW93bmVudHJpZXMiO3M6MToiMSI7czoyMjoibW9vZGxlL2NhdGVnb3J5Om1hbmFnZSI7czoxOiIxIjtzOjM2OiJtb29kbGUvY2F0ZWdvcnk6dmlld2hpZGRlbmNhdGVnb3JpZXMiO3M6MToiMSI7czoyMDoibW9vZGxlL2NvaG9ydDphc3NpZ24iO3M6MToiMSI7czoyMDoibW9vZGxlL2NvaG9ydDptYW5hZ2UiO3M6MToiMSI7czoxODoibW9vZGxlL2NvaG9ydDp2aWV3IjtzOjE6IjEiO3M6MjE6Im1vb2RsZS9jb21tZW50OmRlbGV0ZSI7czoxOiIxIjtzOjE5OiJtb29kbGUvY29tbWVudDpwb3N0IjtzOjE6IjEiO3M6MTk6Im1vb2RsZS9jb21tZW50OnZpZXciO3M6MToiMSI7czoyMDoibW9vZGxlL2NvbW11bml0eTphZGQiO3M6MToiMSI7czoyNToibW9vZGxlL2NvbW11bml0eTpkb3dubG9hZCI7czoxOiIxIjtzOjMyOiJtb29kbGUvY291cnNlOmFjdGl2aXR5dmlzaWJpbGl0eSI7czoxOiIxIjtzOjI3OiJtb29kbGUvY291cnNlOmJ1bGttZXNzYWdpbmciO3M6MToiMSI7czoyODoibW9vZGxlL2NvdXJzZTpjaGFuZ2VjYXRlZ29yeSI7czoxOiIxIjtzOjI4OiJtb29kbGUvY291cnNlOmNoYW5nZWZ1bGxuYW1lIjtzOjE6IjEiO3M6Mjg6Im1vb2RsZS9jb3Vyc2U6Y2hhbmdlaWRudW1iZXIiO3M6MToiMSI7czoyOToibW9vZGxlL2NvdXJzZTpjaGFuZ2VzaG9ydG5hbWUiO3M6MToiMSI7czoyNzoibW9vZGxlL2NvdXJzZTpjaGFuZ2VzdW1tYXJ5IjtzOjE6IjEiO3M6MjA6Im1vb2RsZS9jb3Vyc2U6Y3JlYXRlIjtzOjE6IjEiO3M6MjA6Im1vb2RsZS9jb3Vyc2U6ZGVsZXRlIjtzOjE6IjEiO3M6MjU6Im1vb2RsZS9jb3Vyc2U6ZW5yb2xjb25maWciO3M6MToiMSI7czoyNToibW9vZGxlL2NvdXJzZTplbnJvbHJldmlldyI7czoxOiIxIjtzOjMwOiJtb29kbGUvY291cnNlOm1hbmFnZWFjdGl2aXRpZXMiO3M6MToiMSI7czoyNToibW9vZGxlL2NvdXJzZTptYW5hZ2VmaWxlcyI7czoxOiIxIjtzOjI2OiJtb29kbGUvY291cnNlOm1hbmFnZWdyb3VwcyI7czoxOiIxIjtzOjI2OiJtb29kbGUvY291cnNlOm1hbmFnZXNjYWxlcyI7czoxOiIxIjtzOjI2OiJtb29kbGUvY291cnNlOm1hcmtjb21wbGV0ZSI7czoxOiIxIjtzOjIxOiJtb29kbGUvY291cnNlOnB1Ymxpc2giO3M6MToiMSI7czoyMToibW9vZGxlL2NvdXJzZTpyZXF1ZXN0IjtzOjE6IjEiO3M6MTk6Im1vb2RsZS9jb3Vyc2U6cmVzZXQiO3M6MToiMSI7czozMToibW9vZGxlL2NvdXJzZTpzZWN0aW9udmlzaWJpbGl0eSI7czoxOiIxIjtzOjMxOiJtb29kbGUvY291cnNlOnNldGN1cnJlbnRzZWN0aW9uIjtzOjE6IjEiO3M6MjA6Im1vb2RsZS9jb3Vyc2U6dXBkYXRlIjtzOjE6IjEiO3M6MjM6Im1vb2RsZS9jb3Vyc2U6dXNlcmVtYWlsIjtzOjE6IjEiO3M6MTg6Im1vb2RsZS9jb3Vyc2U6dmlldyI7czoxOiIxIjtzOjM0OiJtb29kbGUvY291cnNlOnZpZXdoaWRkZW5hY3Rpdml0aWVzIjtzOjE6IjEiO3M6MzE6Im1vb2RsZS9jb3Vyc2U6dmlld2hpZGRlbmNvdXJzZXMiO3M6MToiMSI7czozMjoibW9vZGxlL2NvdXJzZTp2aWV3aGlkZGVuc2VjdGlvbnMiO3M6MToiMSI7czozNDoibW9vZGxlL2NvdXJzZTp2aWV3aGlkZGVudXNlcmZpZWxkcyI7czoxOiIxIjtzOjMwOiJtb29kbGUvY291cnNlOnZpZXdwYXJ0aWNpcGFudHMiO3M6MToiMSI7czoyNDoibW9vZGxlL2NvdXJzZTp2aWV3c2NhbGVzIjtzOjE6IjEiO3M6MjQ6Im1vb2RsZS9jb3Vyc2U6dmlzaWJpbGl0eSI7czoxOiIxIjtzOjIwOiJtb29kbGUvZmlsdGVyOm1hbmFnZSI7czoxOiIxIjtzOjE3OiJtb29kbGUvZ3JhZGU6ZWRpdCI7czoxOiIxIjtzOjE5OiJtb29kbGUvZ3JhZGU6ZXhwb3J0IjtzOjE6IjEiO3M6MTc6Im1vb2RsZS9ncmFkZTpoaWRlIjtzOjE6IjEiO3M6MTk6Im1vb2RsZS9ncmFkZTppbXBvcnQiO3M6MToiMSI7czoxNzoibW9vZGxlL2dyYWRlOmxvY2siO3M6MToiMSI7czoxOToibW9vZGxlL2dyYWRlOm1hbmFnZSI7czoxOiIxIjtzOjI2OiJtb29kbGUvZ3JhZGU6bWFuYWdlbGV0dGVycyI7czoxOiIxIjtzOjI3OiJtb29kbGUvZ3JhZGU6bWFuYWdlb3V0Y29tZXMiO3M6MToiMSI7czoxOToibW9vZGxlL2dyYWRlOnVubG9jayI7czoxOiIxIjtzOjE3OiJtb29kbGUvZ3JhZGU6dmlldyI7czoxOiIxIjtzOjIwOiJtb29kbGUvZ3JhZGU6dmlld2FsbCI7czoxOiIxIjtzOjIzOiJtb29kbGUvZ3JhZGU6dmlld2hpZGRlbiI7czoxOiIxIjtzOjI0OiJtb29kbGUvbXk6Y29uZmlnc3lzcGFnZXMiO3M6MToiMSI7czoyMjoibW9vZGxlL215Om1hbmFnZWJsb2NrcyI7czoxOiIxIjtzOjE5OiJtb29kbGUvbm90ZXM6bWFuYWdlIjtzOjE6IjEiO3M6MTc6Im1vb2RsZS9ub3Rlczp2aWV3IjtzOjE6IjEiO3M6MjM6Im1vb2RsZS9wb3J0Zm9saW86ZXhwb3J0IjtzOjE6IjEiO3M6MTk6Im1vb2RsZS9xdWVzdGlvbjphZGQiO3M6MToiMSI7czoyMjoibW9vZGxlL3F1ZXN0aW9uOmNvbmZpZyI7czoxOiIxIjtzOjIzOiJtb29kbGUvcXVlc3Rpb246ZWRpdGFsbCI7czoxOiIxIjtzOjI0OiJtb29kbGUvcXVlc3Rpb246ZWRpdG1pbmUiO3M6MToiMSI7czoyMDoibW9vZGxlL3F1ZXN0aW9uOmZsYWciO3M6MToiMSI7czozMDoibW9vZGxlL3F1ZXN0aW9uOm1hbmFnZWNhdGVnb3J5IjtzOjE6IjEiO3M6MjM6Im1vb2RsZS9xdWVzdGlvbjptb3ZlYWxsIjtzOjE6IjEiO3M6MjQ6Im1vb2RsZS9xdWVzdGlvbjptb3ZlbWluZSI7czoxOiIxIjtzOjIyOiJtb29kbGUvcXVlc3Rpb246dXNlYWxsIjtzOjE6IjEiO3M6MjM6Im1vb2RsZS9xdWVzdGlvbjp1c2VtaW5lIjtzOjE6IjEiO3M6MjM6Im1vb2RsZS9xdWVzdGlvbjp2aWV3YWxsIjtzOjE6IjEiO3M6MjQ6Im1vb2RsZS9xdWVzdGlvbjp2aWV3bWluZSI7czoxOiIxIjtzOjE4OiJtb29kbGUvcmF0aW5nOnJhdGUiO3M6MToiMSI7czoxODoibW9vZGxlL3JhdGluZzp2aWV3IjtzOjE6IjEiO3M6MjE6Im1vb2RsZS9yYXRpbmc6dmlld2FsbCI7czoxOiIxIjtzOjIxOiJtb29kbGUvcmF0aW5nOnZpZXdhbnkiO3M6MToiMSI7czoyNDoibW9vZGxlL3Jlc3RvcmU6Y29uZmlndXJlIjtzOjE6IjEiO3M6MjU6Im1vb2RsZS9yZXN0b3JlOmNyZWF0ZXVzZXIiO3M6MToiMSI7czozMDoibW9vZGxlL3Jlc3RvcmU6cmVzdG9yZWFjdGl2aXR5IjtzOjE6IjEiO3M6Mjg6Im1vb2RsZS9yZXN0b3JlOnJlc3RvcmVjb3Vyc2UiO3M6MToiMSI7czoyOToibW9vZGxlL3Jlc3RvcmU6cmVzdG9yZXNlY3Rpb24iO3M6MToiMSI7czozMToibW9vZGxlL3Jlc3RvcmU6cmVzdG9yZXRhcmdldGh1YiI7czoxOiIxIjtzOjM0OiJtb29kbGUvcmVzdG9yZTpyZXN0b3JldGFyZ2V0aW1wb3J0IjtzOjE6IjEiO3M6MjQ6Im1vb2RsZS9yZXN0b3JlOnJvbGxkYXRlcyI7czoxOiIxIjtzOjI1OiJtb29kbGUvcmVzdG9yZTp1cGxvYWRmaWxlIjtzOjE6IjEiO3M6MjM6Im1vb2RsZS9yZXN0b3JlOnVzZXJpbmZvIjtzOjE6IjEiO3M6MzY6Im1vb2RsZS9yZXN0b3JlOnZpZXdhdXRvbWF0ZWRmaWxlYXJlYSI7czoxOiIxIjtzOjE4OiJtb29kbGUvcm9sZTphc3NpZ24iO3M6MToiMSI7czoxODoibW9vZGxlL3JvbGU6bWFuYWdlIjtzOjE6IjEiO3M6MjA6Im1vb2RsZS9yb2xlOm92ZXJyaWRlIjtzOjE6IjEiO3M6MTg6Im1vb2RsZS9yb2xlOnJldmlldyI7czoxOiIxIjtzOjI0OiJtb29kbGUvcm9sZTpzYWZlb3ZlcnJpZGUiO3M6MToiMSI7czoyMzoibW9vZGxlL3JvbGU6c3dpdGNocm9sZXMiO3M6MToiMSI7czoyNzoibW9vZGxlL3NpdGU6YWNjZXNzYWxsZ3JvdXBzIjtzOjE6IjEiO3M6MjU6Im1vb2RsZS9zaXRlOmFwcHJvdmVjb3Vyc2UiO3M6MToiMSI7czoxODoibW9vZGxlL3NpdGU6Y29uZmlnIjtzOjE6IjEiO3M6MjA6Im1vb2RsZS9zaXRlOmRvY2xpbmtzIjtzOjE6IjEiO3M6MjQ6Im1vb2RsZS9zaXRlOm1hbmFnZWJsb2NrcyI7czoxOiIxIjtzOjI5OiJtb29kbGUvc2l0ZTptbmV0bG9naW50b3JlbW90ZSI7czoxOiIxIjtzOjI3OiJtb29kbGUvc2l0ZTpyZWFkYWxsbWVzc2FnZXMiO3M6MToiMSI7czoyMzoibW9vZGxlL3NpdGU6c2VuZG1lc3NhZ2UiO3M6MToiMSI7czoyNDoibW9vZGxlL3NpdGU6dHJ1c3Rjb250ZW50IjtzOjE6IjEiO3M6MjM6Im1vb2RsZS9zaXRlOnVwbG9hZHVzZXJzIjtzOjE6IjEiO3M6MjU6Im1vb2RsZS9zaXRlOnZpZXdmdWxsbmFtZXMiO3M6MToiMSI7czoyODoibW9vZGxlL3NpdGU6dmlld3BhcnRpY2lwYW50cyI7czoxOiIxIjtzOjIzOiJtb29kbGUvc2l0ZTp2aWV3cmVwb3J0cyI7czoxOiIxIjtzOjE3OiJtb29kbGUvdGFnOmNyZWF0ZSI7czoxOiIxIjtzOjE1OiJtb29kbGUvdGFnOmVkaXQiO3M6MToiMSI7czoyMToibW9vZGxlL3RhZzplZGl0YmxvY2tzIjtzOjE6IjEiO3M6MTc6Im1vb2RsZS90YWc6bWFuYWdlIjtzOjE6IjEiO3M6Mjk6Im1vb2RsZS91c2VyOmNoYW5nZW93bnBhc3N3b3JkIjtzOjE6IjEiO3M6MTg6Im1vb2RsZS91c2VyOmNyZWF0ZSI7czoxOiIxIjtzOjE4OiJtb29kbGUvdXNlcjpkZWxldGUiO3M6MToiMSI7czozMDoibW9vZGxlL3VzZXI6ZWRpdG1lc3NhZ2Vwcm9maWxlIjtzOjE6IjEiO3M6MzM6Im1vb2RsZS91c2VyOmVkaXRvd25tZXNzYWdlcHJvZmlsZSI7czoxOiIxIjtzOjI2OiJtb29kbGUvdXNlcjplZGl0b3ducHJvZmlsZSI7czoxOiIxIjtzOjIzOiJtb29kbGUvdXNlcjplZGl0cHJvZmlsZSI7czoxOiIxIjtzOjE5OiJtb29kbGUvdXNlcjpsb2dpbmFzIjtzOjE6IjEiO3M6MjQ6Im1vb2RsZS91c2VyOm1hbmFnZWJsb2NrcyI7czoxOiIxIjtzOjI3OiJtb29kbGUvdXNlcjptYW5hZ2Vvd25ibG9ja3MiO3M6MToiMSI7czoyNjoibW9vZGxlL3VzZXI6bWFuYWdlb3duZmlsZXMiO3M6MToiMSI7czoyNjoibW9vZGxlL3VzZXI6bWFuYWdlc3lzcGFnZXMiO3M6MToiMSI7czoyNToibW9vZGxlL3VzZXI6cmVhZHVzZXJibG9ncyI7czoxOiIxIjtzOjI1OiJtb29kbGUvdXNlcjpyZWFkdXNlcnBvc3RzIjtzOjE6IjEiO3M6MTg6Im1vb2RsZS91c2VyOnVwZGF0ZSI7czoxOiIxIjtzOjI2OiJtb29kbGUvdXNlcjp2aWV3YWxsZGV0YWlscyI7czoxOiIxIjtzOjIzOiJtb29kbGUvdXNlcjp2aWV3ZGV0YWlscyI7czoxOiIxIjtzOjI5OiJtb29kbGUvdXNlcjp2aWV3aGlkZGVuZGV0YWlscyI7czoxOiIxIjtzOjM2OiJtb29kbGUvdXNlcjp2aWV3dXNlcmFjdGl2aXRpZXNyZXBvcnQiO3M6MToiMSI7czozNToibW9vZGxlL3dlYnNlcnZpY2U6Y3JlYXRlbW9iaWxldG9rZW4iO3M6MToiMSI7czoyOToibW9vZGxlL3dlYnNlcnZpY2U6Y3JlYXRldG9rZW4iO3M6MToiMSI7czoyNToicXVpei9ncmFkaW5nOnZpZXdpZG51bWJlciI7czoxOiIxIjtzOjI5OiJxdWl6L2dyYWRpbmc6dmlld3N0dWRlbnRuYW1lcyI7czoxOiIxIjtzOjIwOiJxdWl6L3N0YXRpc3RpY3M6dmlldyI7czoxOiIxIjtzOjI2OiJyZXBvcnQvY291cnNlb3ZlcnZpZXc6dmlldyI7czoxOiIxIjtzOjIyOiJyZXBvcnQvY3VzdG9tbGFuZzplZGl0IjtzOjE6IjEiO3M6MjI6InJlcG9ydC9jdXN0b21sYW5nOnZpZXciO3M6MToiMSI7czoyOToicmVwb3J0L3F1ZXN0aW9uaW5zdGFuY2VzOnZpZXciO3M6MToiMSI7czoyMDoicmVwb3J0L3NlY3VyaXR5OnZpZXciO3M6MToiMSI7czoyMDoicmVwb3J0L3VuaXR0ZXN0OnZpZXciO3M6MToiMSI7czoyNDoicmVwb3NpdG9yeS9hbGZyZXNjbzp2aWV3IjtzOjE6IjEiO3M6MjI6InJlcG9zaXRvcnkvYm94bmV0OnZpZXciO3M6MToiMSI7czoyNzoicmVwb3NpdG9yeS9jb3Vyc2VmaWxlczp2aWV3IjtzOjE6IjEiO3M6MjM6InJlcG9zaXRvcnkvZHJvcGJveDp2aWV3IjtzOjE6IjEiO3M6MjY6InJlcG9zaXRvcnkvZmlsZXN5c3RlbTp2aWV3IjtzOjE6IjEiO3M6Mjk6InJlcG9zaXRvcnkvZmxpY2tyX3B1YmxpYzp2aWV3IjtzOjE6IjEiO3M6MjI6InJlcG9zaXRvcnkvZmxpY2tyOnZpZXciO3M6MToiMSI7czoyNjoicmVwb3NpdG9yeS9nb29nbGVkb2NzOnZpZXciO3M6MToiMSI7czoyMToicmVwb3NpdG9yeS9sb2NhbDp2aWV3IjtzOjE6IjEiO3M6MjI6InJlcG9zaXRvcnkvbWVybG90OnZpZXciO3M6MToiMSI7czoyMjoicmVwb3NpdG9yeS9waWNhc2E6dmlldyI7czoxOiIxIjtzOjIyOiJyZXBvc2l0b3J5L3JlY2VudDp2aWV3IjtzOjE6IjEiO3M6MTg6InJlcG9zaXRvcnkvczM6dmlldyI7czoxOiIxIjtzOjIyOiJyZXBvc2l0b3J5L3VwbG9hZDp2aWV3IjtzOjE6IjEiO3M6MTk6InJlcG9zaXRvcnkvdXJsOnZpZXciO3M6MToiMSI7czoyMDoicmVwb3NpdG9yeS91c2VyOnZpZXciO3M6MToiMSI7czoyMjoicmVwb3NpdG9yeS93ZWJkYXY6dmlldyI7czoxOiIxIjtzOjI1OiJyZXBvc2l0b3J5L3dpa2ltZWRpYTp2aWV3IjtzOjE6IjEiO3M6MjM6InJlcG9zaXRvcnkveW91dHViZTp2aWV3IjtzOjE6IjEiO3M6MTg6IndlYnNlcnZpY2UvYW1mOnVzZSI7czoxOiIxIjtzOjE5OiJ3ZWJzZXJ2aWNlL3Jlc3Q6dXNlIjtzOjE6IjEiO3M6MTk6IndlYnNlcnZpY2Uvc29hcDp1c2UiO3M6MToiMSI7czoyMToid2Vic2VydmljZS94bWxycGM6dXNlIjtzOjE6IjEiO31zOjQ6Ii8xOjciO2E6NTE6e3M6MjM6InJlcG9zaXRvcnkveW91dHViZTp2aWV3IjtzOjE6IjEiO3M6MTc6Im1vZC9yZXNvdXJjZTp2aWV3IjtzOjE6IjEiO3M6Mjc6Im1vb2RsZS9ibG9nOmFzc29jaWF0ZWNvdXJzZSI7czoxOiIxIjtzOjEyOiJtb2QvdXJsOnZpZXciO3M6MToiMSI7czoyNzoibW9vZGxlL2Jsb2c6YXNzb2NpYXRlbW9kdWxlIjtzOjE6IjEiO3M6Mjc6ImJsb2NrL29ubGluZV91c2Vyczp2aWV3bGlzdCI7czoxOiIxIjtzOjMyOiJtb29kbGUvY2FsZW5kYXI6bWFuYWdlb3duZW50cmllcyI7czoxOiIxIjtzOjI0OiJyZXBvc2l0b3J5L2FsZnJlc2NvOnZpZXciO3M6MToiMSI7czoyNjoibW9vZGxlL3VzZXI6ZWRpdG93bnByb2ZpbGUiO3M6MToiMSI7czoyMjoicmVwb3NpdG9yeS9ib3huZXQ6dmlldyI7czoxOiIxIjtzOjI5OiJtb29kbGUvdXNlcjpjaGFuZ2Vvd25wYXNzd29yZCI7czoxOiIxIjtzOjI3OiJyZXBvc2l0b3J5L2NvdXJzZWZpbGVzOnZpZXciO3M6MToiMSI7czozMzoibW9vZGxlL3VzZXI6ZWRpdG93bm1lc3NhZ2Vwcm9maWxlIjtzOjE6IjEiO3M6MjM6InJlcG9zaXRvcnkvZHJvcGJveDp2aWV3IjtzOjE6IjEiO3M6MjI6Im1vb2RsZS9teTptYW5hZ2VibG9ja3MiO3M6MToiMSI7czoyNjoicmVwb3NpdG9yeS9maWxlc3lzdGVtOnZpZXciO3M6MToiMSI7czoxNzoibW9vZGxlL3RhZzpjcmVhdGUiO3M6MToiMSI7czoyMjoicmVwb3NpdG9yeS9mbGlja3I6dmlldyI7czoxOiIxIjtzOjE1OiJtb29kbGUvdGFnOmVkaXQiO3M6MToiMSI7czoyOToicmVwb3NpdG9yeS9mbGlja3JfcHVibGljOnZpZXciO3M6MToiMSI7czoxNzoibW9vZGxlL2Jsb2NrOnZpZXciO3M6MToiMSI7czoyNjoicmVwb3NpdG9yeS9nb29nbGVkb2NzOnZpZXciO3M6MToiMSI7czoyMzoibW9vZGxlL3BvcnRmb2xpbzpleHBvcnQiO3M6MToiMSI7czoyMToicmVwb3NpdG9yeS9sb2NhbDp2aWV3IjtzOjE6IjEiO3M6MTk6Im1vb2RsZS9jb21tZW50OnZpZXciO3M6MToiMSI7czoyMjoicmVwb3NpdG9yeS9tZXJsb3Q6dmlldyI7czoxOiIxIjtzOjE5OiJtb29kbGUvY29tbWVudDpwb3N0IjtzOjE6IjEiO3M6MjI6InJlcG9zaXRvcnkvcGljYXNhOnZpZXciO3M6MToiMSI7czozNToibW9vZGxlL3dlYnNlcnZpY2U6Y3JlYXRlbW9iaWxldG9rZW4iO3M6MToiMSI7czoyMzoibW9vZGxlL3NpdGU6c2VuZG1lc3NhZ2UiO3M6MToiMSI7czoyMjoicmVwb3NpdG9yeS9yZWNlbnQ6dmlldyI7czoxOiIxIjtzOjE4OiJtb29kbGUvcmF0aW5nOnZpZXciO3M6MToiMSI7czoyNzoibW9vZGxlL3VzZXI6bWFuYWdlb3duYmxvY2tzIjtzOjE6IjEiO3M6MTg6InJlcG9zaXRvcnkvczM6dmlldyI7czoxOiIxIjtzOjIxOiJtb29kbGUvcmF0aW5nOnZpZXdhbnkiO3M6MToiMSI7czoyNjoibW9vZGxlL3VzZXI6bWFuYWdlb3duZmlsZXMiO3M6MToiMSI7czoyMjoicmVwb3NpdG9yeS91cGxvYWQ6dmlldyI7czoxOiIxIjtzOjIxOiJtb29kbGUvcmF0aW5nOnZpZXdhbGwiO3M6MToiMSI7czoyMToibW9vZGxlL2NvdXJzZTpyZXF1ZXN0IjtzOjE6IjEiO3M6MTk6InJlcG9zaXRvcnkvdXJsOnZpZXciO3M6MToiMSI7czoxODoibW9vZGxlL3JhdGluZzpyYXRlIjtzOjE6IjEiO3M6MTY6Im1vb2RsZS9ibG9nOnZpZXciO3M6MToiMSI7czoyMDoicmVwb3NpdG9yeS91c2VyOnZpZXciO3M6MToiMSI7czoxNToibW9kL2ZvbGRlcjp2aWV3IjtzOjE6IjEiO3M6MTg6Im1vb2RsZS9ibG9nOnNlYXJjaCI7czoxOiIxIjtzOjIyOiJyZXBvc2l0b3J5L3dlYmRhdjp2aWV3IjtzOjE6IjEiO3M6MTQ6Im1vZC9pbXNjcDp2aWV3IjtzOjE6IjEiO3M6MTg6Im1vb2RsZS9ibG9nOmNyZWF0ZSI7czoxOiIxIjtzOjI1OiJyZXBvc2l0b3J5L3dpa2ltZWRpYTp2aWV3IjtzOjE6IjEiO3M6MTM6Im1vZC9wYWdlOnZpZXciO3M6MToiMSI7czoyNjoibW9vZGxlL2Jsb2c6bWFuYWdlZXh0ZXJuYWwiO3M6MToiMSI7fXM6ODoiLzEvMi80OjciO2E6MTp7czoxNzoibW9vZGxlL2Jsb2NrOnZpZXciO3M6MjoiLTEiO31zOjg6Ii8xLzIvNDo4IjthOjI6e3M6MTc6Im1vb2RsZS9ibG9jazp2aWV3IjtzOjI6Ii0xIjtzOjE3OiJtb29kbGUvYmxvY2s6ZWRpdCI7czoyOiItMSI7fXM6OToiLzEvMi8zNzo3IjthOjE6e3M6MTc6Im1vb2RsZS9ibG9jazp2aWV3IjtzOjI6Ii0xIjt9czo5OiIvMS8yLzM3OjgiO2E6Mjp7czoxNzoibW9vZGxlL2Jsb2NrOmVkaXQiO3M6MjoiLTEiO3M6MTc6Im1vb2RsZS9ibG9jazp2aWV3IjtzOjI6Ii0xIjt9czo5OiIvMS8yLzM2OjciO2E6MTp7czoxNzoibW9vZGxlL2Jsb2NrOnZpZXciO3M6MjoiLTEiO31zOjk6Ii8xLzIvMzY6OCI7YToyOntzOjE3OiJtb29kbGUvYmxvY2s6ZWRpdCI7czoyOiItMSI7czoxNzoibW9vZGxlL2Jsb2NrOnZpZXciO3M6NToiLTEwMDAiO31zOjk6Ii8xLzIvMzU6OCI7YToyOntzOjE3OiJtb29kbGUvYmxvY2s6ZWRpdCI7czoyOiItMSI7czoxNzoibW9vZGxlL2Jsb2NrOnZpZXciO3M6NToiLTEwMDAiO31zOjk6Ii8xLzIvMzQ6NyI7YToxOntzOjE3OiJtb29kbGUvYmxvY2s6dmlldyI7czoyOiItMSI7fXM6OToiLzEvMi8zNDo4IjthOjI6e3M6MTc6Im1vb2RsZS9ibG9jazplZGl0IjtzOjI6Ii0xIjtzOjE3OiJtb29kbGUvYmxvY2s6dmlldyI7czoyOiItMSI7fXM6OToiLzEvMi8xNzo3IjthOjM6e3M6MjQ6Im1vZC9mb3J1bTp2aWV3ZGlzY3Vzc2lvbiI7czoxOiIxIjtzOjE4OiJtb29kbGUvcmF0aW5nOnJhdGUiO3M6MjoiLTEiO3M6MTg6Im1vb2RsZS9yYXRpbmc6dmlldyI7czoyOiItMSI7fXM6OToiLzEvMi8xNzo4IjthOjU6e3M6MjY6Im1vZC9mb3J1bTpleHBvcnRkaXNjdXNzaW9uIjtzOjI6Ii0xIjtzOjIzOiJtb2QvZm9ydW06ZXhwb3J0b3ducG9zdCI7czoyOiItMSI7czoyMDoibW9kL2ZvcnVtOmV4cG9ydHBvc3QiO3M6MjoiLTEiO3M6MzA6Im1vZC9mb3J1bTppbml0aWFsc3Vic2NyaXB0aW9ucyI7czoyOiItMSI7czoyOToibW9kL2ZvcnVtOm1hbmFnZXN1YnNjcmlwdGlvbnMiO3M6MjoiLTEiO31zOjk6Ii8xLzIvMTU6NyI7YToxOntzOjE3OiJtb29kbGUvYmxvY2s6dmlldyI7czoyOiItMSI7fXM6NjoiLzEvNzo3IjthOjE6e3M6MTc6Im1vb2RsZS9ibG9jazp2aWV3IjtzOjI6Ii0xIjt9czo2OiIvMS83OjgiO2E6Mjp7czoxNzoibW9vZGxlL2Jsb2NrOmVkaXQiO3M6MjoiLTEiO3M6MTc6Im1vb2RsZS9ibG9jazp2aWV3IjtzOjI6Ii0xIjt9czo2OiIvMS84OjciO2E6MTp7czoxNzoibW9vZGxlL2Jsb2NrOnZpZXciO3M6MjoiLTEiO31zOjY6Ii8xLzg6OCI7YToyOntzOjE3OiJtb29kbGUvYmxvY2s6ZWRpdCI7czoyOiItMSI7czoxNzoibW9vZGxlL2Jsb2NrOnZpZXciO3M6MjoiLTEiO319czo2OiJsb2FkZWQiO2E6NDp7aTowO3M6NDoiLzEvMiI7aToxO3M6NDoiLzEvNyI7aToyO3M6NDoiLzEvOCI7aTozO3M6NDoiLzEvOSI7fXM6MjoiZHIiO3M6MToiNyI7czo0OiJ0aW1lIjtpOjEzMTczMzQ5MTA7fXM6Nzoic2Vzc2tleSI7czoxMDoiQWpuMUhpV1l0aiI7czoxMDoicHJlZmVyZW5jZSI7YTo0OntzOjI5OiJ1c2Vyc2VsZWN0b3JfYXV0b3NlbGVjdHVuaXF1ZSI7czoxOiIwIjtzOjI5OiJ1c2Vyc2VsZWN0b3JfcHJlc2VydmVzZWxlY3RlZCI7czoxOiIwIjtzOjI3OiJ1c2Vyc2VsZWN0b3Jfc2VhcmNoYW55d2hlcmUiO3M6MToiMCI7czoxMToiX2xhc3Rsb2FkZWQiO2k6MTMxNzMzNTE4MDt9czoxNzoibWVzc2FnZV9sYXN0cG9wdXAiO2k6MDtzOjc6ImRpc3BsYXkiO2E6MTp7aToxO2k6MDt9czoyNToiYWpheF91cGRhdGFibGVfdXNlcl9wcmVmcyI7YTo5OntzOjIzOiJkb2NrZWRfYmxvY2tfaW5zdGFuY2VfNCI7czozOiJpbnQiO3M6MjM6ImRvY2tlZF9ibG9ja19pbnN0YW5jZV81IjtzOjM6ImludCI7czoxMzoiYmxvY2sxMGhpZGRlbiI7czo0OiJib29sIjtzOjEzOiJibG9jazE1aGlkZGVuIjtzOjQ6ImJvb2wiO3M6MTI6ImJsb2NrNmhpZGRlbiI7czo0OiJib29sIjtzOjI5OiJ1c2Vyc2VsZWN0b3Jfb3B0aW9uc2NvbGxhcHNlZCI7czo0OiJib29sIjtzOjI5OiJ1c2Vyc2VsZWN0b3JfcHJlc2VydmVzZWxlY3RlZCI7czo0OiJib29sIjtzOjI5OiJ1c2Vyc2VsZWN0b3JfYXV0b3NlbGVjdHVuaXF1ZSI7czo0OiJib29sIjtzOjI3OiJ1c2Vyc2VsZWN0b3Jfc2VhcmNoYW55d2hlcmUiO3M6NDoiYm9vbCI7fXM6MTM6InVzZXJzZWxlY3RvcnMiO2E6Mjp7czozMjoiNmJmMTZkY2QyMmZjNTNmYWQzYzZlNjMwOGIxY2NlYTciO2E6ODp7czo1OiJjbGFzcyI7czoyMToiZXhpc3Rpbmdfcm9sZV9ob2xkZXJzIjtzOjQ6Im5hbWUiO3M6MTI6InJlbW92ZXNlbGVjdCI7czo3OiJleGNsdWRlIjthOjA6e31zOjExOiJleHRyYWZpZWxkcyI7YToxOntpOjA7czo1OiJlbWFpbCI7fXM6MTE6Im11bHRpc2VsZWN0IjtiOjE7czo0OiJmaWxlIjtzOjE5OiJhZG1pbi9yb2xlcy9saWIucGhwIjtzOjY6InJvbGVpZCI7aTo4O3M6OToiY29udGV4dGlkIjtzOjE6IjEiO31zOjMyOiI1MTBmY2NlYTZjZDQ0OTdkZmFhYmJkOGM4N2FiMDJhMiI7YTo4OntzOjU6ImNsYXNzIjtzOjM2OiJwb3RlbnRpYWxfYXNzaWduZWVzX2NvdXJzZV9hbmRfYWJvdmUiO3M6NDoibmFtZSI7czo5OiJhZGRzZWxlY3QiO3M6NzoiZXhjbHVkZSI7YTowOnt9czoxMToiZXh0cmFmaWVsZHMiO2E6MTp7aTowO3M6NToiZW1haWwiO31zOjExOiJtdWx0aXNlbGVjdCI7YjoxO3M6NDoiZmlsZSI7czoxOToiYWRtaW4vcm9sZXMvbGliLnBocCI7czo2OiJyb2xlaWQiO2k6ODtzOjk6ImNvbnRleHRpZCI7czoxOiIxIjt9fX0=', 1317334910, 1317335181, '127.0.0.1', '127.0.0.1'),
(207, 0, 'e7c6r2eicpkdcojd7r79nge8q2', 0, 'U0VTU0lPTnxPOjg6InN0ZENsYXNzIjoxOntzOjQ6ImxhbmciO3M6NToiZXNfYXIiO31VU0VSfE86ODoic3RkQ2xhc3MiOjc6e3M6MjoiaWQiO2k6MDtzOjEwOiJtbmV0aG9zdGlkIjtzOjE6IjEiO3M6MTA6InByZWZlcmVuY2UiO2E6MDp7fXM6NjoiYWNjZXNzIjthOjQ6e3M6MjoicmEiO2E6MTp7czoyOiIvMSI7YToxOntpOjY7czoxOiI2Ijt9fXM6NDoicmRlZiI7YTo4OntzOjQ6Ii8xOjYiO2E6MjE6e3M6MjY6Im1vb2RsZS91c2VyOmVkaXRvd25wcm9maWxlIjtzOjU6Ii0xMDAwIjtzOjIzOiJtb29kbGUvdXNlcjp2aWV3ZGV0YWlscyI7czoxOiIxIjtzOjI3OiJibG9jay9vbmxpbmVfdXNlcnM6dmlld2xpc3QiO3M6MToiMSI7czoxOToibW9kL2Fzc2lnbm1lbnQ6dmlldyI7czoxOiIxIjtzOjE4OiJtb2QvZGF0YTp2aWV3ZW50cnkiO3M6MToiMSI7czoxNzoibW9kL2ZlZWRiYWNrOnZpZXciO3M6MToiMSI7czoxNToibW9kL2ZvbGRlcjp2aWV3IjtzOjE6IjEiO3M6MjQ6Im1vZC9mb3J1bTp2aWV3ZGlzY3Vzc2lvbiI7czoxOiIxIjtzOjE0OiJtb2QvaW1zY3A6dmlldyI7czoxOiIxIjtzOjEzOiJtb2QvcGFnZTp2aWV3IjtzOjE6IjEiO3M6MTM6Im1vZC9xdWl6OnZpZXciO3M6MToiMSI7czoxNzoibW9kL3Jlc291cmNlOnZpZXciO3M6MToiMSI7czoxMjoibW9kL3VybDp2aWV3IjtzOjE6IjEiO3M6MTc6Im1vZC93aWtpOnZpZXdwYWdlIjtzOjE6IjEiO3M6MTc6Im1vZC93b3Jrc2hvcDp2aWV3IjtzOjE6IjEiO3M6MTc6Im1vb2RsZS9ibG9jazp2aWV3IjtzOjE6IjEiO3M6MTg6Im1vb2RsZS9ibG9nOnNlYXJjaCI7czoxOiIxIjtzOjE2OiJtb29kbGUvYmxvZzp2aWV3IjtzOjE6IjEiO3M6MTk6Im1vb2RsZS9jb21tZW50OnZpZXciO3M6MToiMSI7czoyOToibW9vZGxlL3VzZXI6Y2hhbmdlb3ducGFzc3dvcmQiO3M6NToiLTEwMDAiO3M6MzM6Im1vb2RsZS91c2VyOmVkaXRvd25tZXNzYWdlcHJvZmlsZSI7czo1OiItMTAwMCI7fXM6ODoiLzEvMi80OjYiO2E6MTp7czoxNzoibW9vZGxlL2Jsb2NrOnZpZXciO3M6MjoiLTEiO31zOjk6Ii8xLzIvMzc6NiI7YToxOntzOjE3OiJtb29kbGUvYmxvY2s6dmlldyI7czoyOiItMSI7fXM6OToiLzEvMi8zNjo2IjthOjE6e3M6MTc6Im1vb2RsZS9ibG9jazp2aWV3IjtzOjI6Ii0xIjt9czo5OiIvMS8yLzM1OjYiO2E6MTp7czoxNzoibW9vZGxlL2Jsb2NrOnZpZXciO3M6MjoiLTEiO31zOjk6Ii8xLzIvMTU6NiI7YToxOntzOjE3OiJtb29kbGUvYmxvY2s6dmlldyI7czoyOiItMSI7fXM6NjoiLzEvNzo2IjthOjE6e3M6MTc6Im1vb2RsZS9ibG9jazp2aWV3IjtzOjI6Ii0xIjt9czo2OiIvMS84OjYiO2E6MTp7czoxNzoibW9vZGxlL2Jsb2NrOnZpZXciO3M6MjoiLTEiO319czo2OiJsb2FkZWQiO2E6Mzp7aTowO3M6NDoiLzEvMiI7aToxO3M6NDoiLzEvNyI7aToyO3M6NDoiLzEvOCI7fXM6NDoidGltZSI7aToxMzE3Mzk3OTUwO31zOjU6ImVucm9sIjthOjI6e3M6ODoiZW5yb2xsZWQiO2E6MDp7fXM6OToidGVtcGd1ZXN0IjthOjA6e319czoyNToiYWpheF91cGRhdGFibGVfdXNlcl9wcmVmcyI7YTo0OntzOjIzOiJkb2NrZWRfYmxvY2tfaW5zdGFuY2VfNCI7czozOiJpbnQiO3M6MjM6ImRvY2tlZF9ibG9ja19pbnN0YW5jZV81IjtzOjM6ImludCI7czoxMzoiYmxvY2sxNmhpZGRlbiI7czo0OiJib29sIjtzOjEzOiJibG9jazE1aGlkZGVuIjtzOjQ6ImJvb2wiO31zOjc6InNlc3NrZXkiO3M6MTA6IlZWbWVsSGEzTHoiO30=', 1317397949, 1317398195, '127.0.0.1', '127.0.0.1');
INSERT INTO `mdl_sessions` (`id`, `state`, `sid`, `userid`, `sessdata`, `timecreated`, `timemodified`, `firstip`, `lastip`) VALUES
(209, 0, 'b5pe3sick0ef6bmbmcnkr0eo57', 2, 'U0VTU0lPTnxPOjg6InN0ZENsYXNzIjo2OntzOjEwOiJsb2dpbmNvdW50IjtpOjA7czoyMjoiYWRtaW5fY3JpdGljYWxfd2FybmluZyI7aTowO3M6MjE6ImxvYWRfbmF2aWdhdGlvbl9hZG1pbiI7YjoxO3M6MTQ6ImZyb21kaXNjdXNzaW9uIjtzOjM3OiJodHRwOi8vbG9jYWxob3N0L2NvdXJzZS92aWV3LnBocD9pZD00IjtzOjEyOiJmbGFzaHZlcnNpb24iO3M6ODoiMTAuMy4xODMiO3M6ODoibmF2Y2FjaGUiO086ODoic3RkQ2xhc3MiOjE6e3M6MTA6Im5hdmlnYXRpb24iO2E6NDp7czoxNzoiY291cnNlX3NlY3Rpb25zXzQiO2E6Mzp7aTowO2k6MTMxNzg1MDQxOTtpOjE7czoxOiIyIjtpOjI7czozNTkyOiJhOjE3OntpOjA7Tzo4OiJzdGRDbGFzcyI6OTp7czo3OiJzZWN0aW9uIjtzOjE6IjAiO3M6MjoiaWQiO3M6MjoiMjQiO3M6NjoiY291cnNlIjtzOjE6IjQiO3M6NDoibmFtZSI7TjtzOjc6InN1bW1hcnkiO047czoxMzoic3VtbWFyeWZvcm1hdCI7czoxOiIxIjtzOjg6InNlcXVlbmNlIjtzOjE6IjQiO3M6NzoidmlzaWJsZSI7czoxOiIxIjtzOjEyOiJoYXNhY3Rpdml0ZXMiO2I6MTt9aToxO086ODoic3RkQ2xhc3MiOjk6e3M6Nzoic2VjdGlvbiI7czoxOiIxIjtzOjI6ImlkIjtzOjI6IjI1IjtzOjY6ImNvdXJzZSI7czoxOiI0IjtzOjQ6Im5hbWUiO047czo3OiJzdW1tYXJ5IjtzOjA6IiI7czoxMzoic3VtbWFyeWZvcm1hdCI7czoxOiIxIjtzOjg6InNlcXVlbmNlIjtOO3M6NzoidmlzaWJsZSI7czoxOiIxIjtzOjEyOiJoYXNhY3Rpdml0ZXMiO2I6MDt9aToyO086ODoic3RkQ2xhc3MiOjk6e3M6Nzoic2VjdGlvbiI7czoxOiIyIjtzOjI6ImlkIjtzOjI6IjI2IjtzOjY6ImNvdXJzZSI7czoxOiI0IjtzOjQ6Im5hbWUiO047czo3OiJzdW1tYXJ5IjtzOjA6IiI7czoxMzoic3VtbWFyeWZvcm1hdCI7czoxOiIxIjtzOjg6InNlcXVlbmNlIjtOO3M6NzoidmlzaWJsZSI7czoxOiIxIjtzOjEyOiJoYXNhY3Rpdml0ZXMiO2I6MDt9aTozO086ODoic3RkQ2xhc3MiOjk6e3M6Nzoic2VjdGlvbiI7czoxOiIzIjtzOjI6ImlkIjtzOjI6IjI3IjtzOjY6ImNvdXJzZSI7czoxOiI0IjtzOjQ6Im5hbWUiO047czo3OiJzdW1tYXJ5IjtzOjA6IiI7czoxMzoic3VtbWFyeWZvcm1hdCI7czoxOiIxIjtzOjg6InNlcXVlbmNlIjtOO3M6NzoidmlzaWJsZSI7czoxOiIxIjtzOjEyOiJoYXNhY3Rpdml0ZXMiO2I6MDt9aTo0O086ODoic3RkQ2xhc3MiOjk6e3M6Nzoic2VjdGlvbiI7czoxOiI0IjtzOjI6ImlkIjtzOjI6IjI4IjtzOjY6ImNvdXJzZSI7czoxOiI0IjtzOjQ6Im5hbWUiO047czo3OiJzdW1tYXJ5IjtzOjA6IiI7czoxMzoic3VtbWFyeWZvcm1hdCI7czoxOiIxIjtzOjg6InNlcXVlbmNlIjtOO3M6NzoidmlzaWJsZSI7czoxOiIxIjtzOjEyOiJoYXNhY3Rpdml0ZXMiO2I6MDt9aTo1O086ODoic3RkQ2xhc3MiOjk6e3M6Nzoic2VjdGlvbiI7czoxOiI1IjtzOjI6ImlkIjtzOjI6IjI5IjtzOjY6ImNvdXJzZSI7czoxOiI0IjtzOjQ6Im5hbWUiO047czo3OiJzdW1tYXJ5IjtzOjA6IiI7czoxMzoic3VtbWFyeWZvcm1hdCI7czoxOiIxIjtzOjg6InNlcXVlbmNlIjtOO3M6NzoidmlzaWJsZSI7czoxOiIxIjtzOjEyOiJoYXNhY3Rpdml0ZXMiO2I6MDt9aTo2O086ODoic3RkQ2xhc3MiOjk6e3M6Nzoic2VjdGlvbiI7czoxOiI2IjtzOjI6ImlkIjtzOjI6IjMwIjtzOjY6ImNvdXJzZSI7czoxOiI0IjtzOjQ6Im5hbWUiO047czo3OiJzdW1tYXJ5IjtzOjA6IiI7czoxMzoic3VtbWFyeWZvcm1hdCI7czoxOiIxIjtzOjg6InNlcXVlbmNlIjtOO3M6NzoidmlzaWJsZSI7czoxOiIxIjtzOjEyOiJoYXNhY3Rpdml0ZXMiO2I6MDt9aTo3O086ODoic3RkQ2xhc3MiOjk6e3M6Nzoic2VjdGlvbiI7czoxOiI3IjtzOjI6ImlkIjtzOjI6IjMxIjtzOjY6ImNvdXJzZSI7czoxOiI0IjtzOjQ6Im5hbWUiO047czo3OiJzdW1tYXJ5IjtzOjA6IiI7czoxMzoic3VtbWFyeWZvcm1hdCI7czoxOiIxIjtzOjg6InNlcXVlbmNlIjtOO3M6NzoidmlzaWJsZSI7czoxOiIxIjtzOjEyOiJoYXNhY3Rpdml0ZXMiO2I6MDt9aTo4O086ODoic3RkQ2xhc3MiOjk6e3M6Nzoic2VjdGlvbiI7czoxOiI4IjtzOjI6ImlkIjtzOjI6IjMyIjtzOjY6ImNvdXJzZSI7czoxOiI0IjtzOjQ6Im5hbWUiO047czo3OiJzdW1tYXJ5IjtzOjA6IiI7czoxMzoic3VtbWFyeWZvcm1hdCI7czoxOiIxIjtzOjg6InNlcXVlbmNlIjtOO3M6NzoidmlzaWJsZSI7czoxOiIxIjtzOjEyOiJoYXNhY3Rpdml0ZXMiO2I6MDt9aTo5O086ODoic3RkQ2xhc3MiOjk6e3M6Nzoic2VjdGlvbiI7czoxOiI5IjtzOjI6ImlkIjtzOjI6IjMzIjtzOjY6ImNvdXJzZSI7czoxOiI0IjtzOjQ6Im5hbWUiO047czo3OiJzdW1tYXJ5IjtzOjA6IiI7czoxMzoic3VtbWFyeWZvcm1hdCI7czoxOiIxIjtzOjg6InNlcXVlbmNlIjtOO3M6NzoidmlzaWJsZSI7czoxOiIxIjtzOjEyOiJoYXNhY3Rpdml0ZXMiO2I6MDt9aToxMDtPOjg6InN0ZENsYXNzIjo5OntzOjc6InNlY3Rpb24iO3M6MjoiMTAiO3M6MjoiaWQiO3M6MjoiMzQiO3M6NjoiY291cnNlIjtzOjE6IjQiO3M6NDoibmFtZSI7TjtzOjc6InN1bW1hcnkiO3M6MDoiIjtzOjEzOiJzdW1tYXJ5Zm9ybWF0IjtzOjE6IjEiO3M6ODoic2VxdWVuY2UiO047czo3OiJ2aXNpYmxlIjtzOjE6IjEiO3M6MTI6Imhhc2FjdGl2aXRlcyI7YjowO31pOjExO086ODoic3RkQ2xhc3MiOjk6e3M6Nzoic2VjdGlvbiI7czoyOiIxMSI7czoyOiJpZCI7czoyOiIzNSI7czo2OiJjb3Vyc2UiO3M6MToiNCI7czo0OiJuYW1lIjtOO3M6Nzoic3VtbWFyeSI7czowOiIiO3M6MTM6InN1bW1hcnlmb3JtYXQiO3M6MToiMSI7czo4OiJzZXF1ZW5jZSI7TjtzOjc6InZpc2libGUiO3M6MToiMSI7czoxMjoiaGFzYWN0aXZpdGVzIjtiOjA7fWk6MTI7Tzo4OiJzdGRDbGFzcyI6OTp7czo3OiJzZWN0aW9uIjtzOjI6IjEyIjtzOjI6ImlkIjtzOjI6IjM2IjtzOjY6ImNvdXJzZSI7czoxOiI0IjtzOjQ6Im5hbWUiO047czo3OiJzdW1tYXJ5IjtzOjA6IiI7czoxMzoic3VtbWFyeWZvcm1hdCI7czoxOiIxIjtzOjg6InNlcXVlbmNlIjtOO3M6NzoidmlzaWJsZSI7czoxOiIxIjtzOjEyOiJoYXNhY3Rpdml0ZXMiO2I6MDt9aToxMztPOjg6InN0ZENsYXNzIjo5OntzOjc6InNlY3Rpb24iO3M6MjoiMTMiO3M6MjoiaWQiO3M6MjoiMzciO3M6NjoiY291cnNlIjtzOjE6IjQiO3M6NDoibmFtZSI7TjtzOjc6InN1bW1hcnkiO3M6MDoiIjtzOjEzOiJzdW1tYXJ5Zm9ybWF0IjtzOjE6IjEiO3M6ODoic2VxdWVuY2UiO047czo3OiJ2aXNpYmxlIjtzOjE6IjEiO3M6MTI6Imhhc2FjdGl2aXRlcyI7YjowO31pOjE0O086ODoic3RkQ2xhc3MiOjk6e3M6Nzoic2VjdGlvbiI7czoyOiIxNCI7czoyOiJpZCI7czoyOiIzOCI7czo2OiJjb3Vyc2UiO3M6MToiNCI7czo0OiJuYW1lIjtOO3M6Nzoic3VtbWFyeSI7czowOiIiO3M6MTM6InN1bW1hcnlmb3JtYXQiO3M6MToiMSI7czo4OiJzZXF1ZW5jZSI7TjtzOjc6InZpc2libGUiO3M6MToiMSI7czoxMjoiaGFzYWN0aXZpdGVzIjtiOjA7fWk6MTU7Tzo4OiJzdGRDbGFzcyI6OTp7czo3OiJzZWN0aW9uIjtzOjI6IjE1IjtzOjI6ImlkIjtzOjI6IjM5IjtzOjY6ImNvdXJzZSI7czoxOiI0IjtzOjQ6Im5hbWUiO047czo3OiJzdW1tYXJ5IjtzOjA6IiI7czoxMzoic3VtbWFyeWZvcm1hdCI7czoxOiIxIjtzOjg6InNlcXVlbmNlIjtOO3M6NzoidmlzaWJsZSI7czoxOiIxIjtzOjEyOiJoYXNhY3Rpdml0ZXMiO2I6MDt9aToxNjtPOjg6InN0ZENsYXNzIjo5OntzOjc6InNlY3Rpb24iO3M6MjoiMTYiO3M6MjoiaWQiO3M6MjoiNDAiO3M6NjoiY291cnNlIjtzOjE6IjQiO3M6NDoibmFtZSI7TjtzOjc6InN1bW1hcnkiO3M6MDoiIjtzOjEzOiJzdW1tYXJ5Zm9ybWF0IjtzOjE6IjEiO3M6ODoic2VxdWVuY2UiO047czo3OiJ2aXNpYmxlIjtzOjE6IjEiO3M6MTI6Imhhc2FjdGl2aXRlcyI7YjowO319Ijt9czoxODoiY291cnNlX2FjdGl2aXRlc180IjthOjM6e2k6MDtpOjEzMTc4NTA0MTk7aToxO3M6MToiMiI7aToyO3M6MjgwOiJhOjE6e2k6NDtPOjg6InN0ZENsYXNzIjoxMDp7czo3OiJzZWN0aW9uIjtzOjE6IjAiO3M6NDoibmFtZSI7czo5OiJOb3ZlZGFkZXMiO3M6NDoiaWNvbiI7czowOiIiO3M6MTM6Imljb25jb21wb25lbnQiO3M6MDoiIjtzOjI6ImlkIjtzOjE6IjQiO3M6NjoiaGlkZGVuIjtiOjA7czo3OiJtb2RuYW1lIjtzOjU6ImZvcnVtIjtzOjg6Im5vZGV0eXBlIjtpOjA7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly9sb2NhbGhvc3QvbW9kL2ZvcnVtL3ZpZXcucGhwP2lkPTQiO3M6NzoiZGlzcGxheSI7YjoxO319Ijt9czoxNzoiY29udGV4dGhhc3JlcG9zMTMiO2E6Mzp7aTowO2k6MTMxNzg1MDQxOTtpOjE7czoxOiIyIjtpOjI7czo0OiJiOjA7Ijt9czoxNzoiY29udGV4dGhhc3JlcG9zNDYiO2E6Mzp7aTowO2k6MTMxNzg1MDQyMDtpOjE7czoxOiIyIjtpOjI7czo0OiJiOjA7Ijt9fX19VVNFUnxPOjg6InN0ZENsYXNzIjo2Mjp7czoyOiJpZCI7czoxOiIyIjtzOjQ6ImF1dGgiO3M6NjoibWFudWFsIjtzOjk6ImNvbmZpcm1lZCI7czoxOiIxIjtzOjEyOiJwb2xpY3lhZ3JlZWQiO3M6MToiMCI7czo3OiJkZWxldGVkIjtzOjE6IjAiO3M6OToic3VzcGVuZGVkIjtzOjE6IjAiO3M6MTA6Im1uZXRob3N0aWQiO3M6MToiMSI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo4OiJwYXNzd29yZCI7czozMjoiZTZkMGEyOThlMGUwNDU0NWM5MGY0ZmUyODcyMDViZDEiO3M6ODoiaWRudW1iZXIiO3M6MDoiIjtzOjk6ImZpcnN0bmFtZSI7czo1OiJhZG1pbiI7czo4OiJsYXN0bmFtZSI7czo3OiJVc3VhcmlvIjtzOjU6ImVtYWlsIjtzOjQ4OiJ0YWxsZXJkZXByb2dyYW1hY2lvbmlpZml1YmEyMDExQGdvb2dsZWdyb3Vwcy5jb20iO3M6OToiZW1haWxzdG9wIjtzOjE6IjAiO3M6MzoiaWNxIjtzOjA6IiI7czo1OiJza3lwZSI7czowOiIiO3M6NToieWFob28iO3M6MDoiIjtzOjM6ImFpbSI7czowOiIiO3M6MzoibXNuIjtzOjA6IiI7czo2OiJwaG9uZTEiO3M6MDoiIjtzOjY6InBob25lMiI7czowOiIiO3M6MTE6Imluc3RpdHV0aW9uIjtzOjA6IiI7czoxMDoiZGVwYXJ0bWVudCI7czowOiIiO3M6NzoiYWRkcmVzcyI7czowOiIiO3M6NDoiY2l0eSI7czoxMjoiQnVlbm9zIEFpcmVzIjtzOjc6ImNvdW50cnkiO3M6MjoiQVIiO3M6NDoibGFuZyI7czo1OiJlc19hciI7czo1OiJ0aGVtZSI7czowOiIiO3M6ODoidGltZXpvbmUiO3M6MjoiOTkiO3M6MTE6ImZpcnN0YWNjZXNzIjtzOjEwOiIxMzE2NTY3NTAzIjtzOjEwOiJsYXN0YWNjZXNzIjtpOjEzMTc4NTA4NTA7czo5OiJsYXN0bG9naW4iO3M6MTA6IjEzMTczOTYzODAiO3M6MTI6ImN1cnJlbnRsb2dpbiI7aToxMzE3ODQ1NzYwO3M6NjoibGFzdGlwIjtzOjk6IjEyNy4wLjAuMSI7czo2OiJzZWNyZXQiO3M6MDoiIjtzOjc6InBpY3R1cmUiO3M6MToiMCI7czozOiJ1cmwiO3M6MDoiIjtzOjE3OiJkZXNjcmlwdGlvbmZvcm1hdCI7czoxOiIwIjtzOjEwOiJtYWlsZm9ybWF0IjtzOjE6IjEiO3M6MTA6Im1haWxkaWdlc3QiO3M6MToiMCI7czoxMToibWFpbGRpc3BsYXkiO3M6MToiMSI7czoxMDoiaHRtbGVkaXRvciI7czoxOiIxIjtzOjQ6ImFqYXgiO3M6MToiMSI7czoxMzoiYXV0b3N1YnNjcmliZSI7czoxOiIxIjtzOjExOiJ0cmFja2ZvcnVtcyI7czoxOiIwIjtzOjExOiJ0aW1lY3JlYXRlZCI7czoxOiIwIjtzOjEyOiJ0aW1lbW9kaWZpZWQiO3M6MTA6IjEzMTY1Njc1MDMiO3M6MTI6InRydXN0Yml0bWFzayI7czoxOiIwIjtzOjg6ImltYWdlYWx0IjtOO3M6MTI6InNjcmVlbnJlYWRlciI7czoxOiIxIjtzOjE2OiJsYXN0Y291cnNlYWNjZXNzIjthOjM6e2k6MjtzOjEwOiIxMzE3Mzk2NTE4IjtpOjM7czoxMDoiMTMxNzM5NzY0MCI7aTo0O3M6MTA6IjEzMTczOTY1MDUiO31zOjE5OiJjdXJyZW50Y291cnNlYWNjZXNzIjthOjI6e2k6NDtpOjEzMTc4NTA4NTA7aToyO2k6MTMxNzg0ODQyOTt9czoxMToiZ3JvdXBtZW1iZXIiO2E6MDp7fXM6NzoicHJvZmlsZSI7YTozOntzOjM6ImRuaSI7czowOiIiO3M6NjoicGFkcm9uIjtzOjA6IiI7czoxMzoicm9sc29saWNpdGFkbyI7czo3OiJNaWVtYnJvIjt9czo3OiJzZXNza2V5IjtzOjEwOiJzVVFPcGs0aVhBIjtzOjEwOiJwcmVmZXJlbmNlIjthOjk6e3M6MTg6ImVtYWlsX2JvdW5jZV9jb3VudCI7czoxOiIxIjtzOjE2OiJlbWFpbF9zZW5kX2NvdW50IjtzOjE6IjEiO3M6MjM6ImRlZmluZXJvbGVfc2hvd2FkdmFuY2VkIjtzOjA6IiI7czoyOToidXNlcnNlbGVjdG9yX3ByZXNlcnZlc2VsZWN0ZWQiO3M6MToiMCI7czoyOToidXNlcnNlbGVjdG9yX2F1dG9zZWxlY3R1bmlxdWUiO3M6MToiMCI7czoyNzoidXNlcnNlbGVjdG9yX3NlYXJjaGFueXdoZXJlIjtzOjE6IjAiO3M6MjQ6ImRvY2tlZF9ibG9ja19pbnN0YW5jZV8xMCI7czoxOiIwIjtzOjIzOiJkb2NrZWRfYmxvY2tfaW5zdGFuY2VfNSI7czoxOiIwIjtzOjExOiJfbGFzdGxvYWRlZCI7aToxMzE3ODUwODUwO31zOjE3OiJtZXNzYWdlX2xhc3Rwb3B1cCI7aTowO3M6NzoiZGlzcGxheSI7YToxOntpOjQ7aTowO31zOjI1OiJhamF4X3VwZGF0YWJsZV91c2VyX3ByZWZzIjthOjIwOntzOjIzOiJkb2NrZWRfYmxvY2tfaW5zdGFuY2VfNCI7czozOiJpbnQiO3M6MjM6ImRvY2tlZF9ibG9ja19pbnN0YW5jZV81IjtzOjM6ImludCI7czoxMzoiYmxvY2sxMGhpZGRlbiI7czo0OiJib29sIjtzOjEzOiJibG9jazE3aGlkZGVuIjtzOjQ6ImJvb2wiO3M6MTM6ImJsb2NrMThoaWRkZW4iO3M6NDoiYm9vbCI7czoxMzoiYmxvY2sxNmhpZGRlbiI7czo0OiJib29sIjtzOjEzOiJibG9jazE5aGlkZGVuIjtzOjQ6ImJvb2wiO3M6MTI6ImJsb2NrMWhpZGRlbiI7czo0OiJib29sIjtzOjEyOiJibG9jazRoaWRkZW4iO3M6NDoiYm9vbCI7czoxMzoiYmxvY2sxNWhpZGRlbiI7czo0OiJib29sIjtzOjEyOiJibG9jazVoaWRkZW4iO3M6NDoiYm9vbCI7czoxMzoiYmxvY2syNGhpZGRlbiI7czo0OiJib29sIjtzOjEzOiJibG9jazI1aGlkZGVuIjtzOjQ6ImJvb2wiO3M6MTM6ImJsb2NrMTFoaWRkZW4iO3M6NDoiYm9vbCI7czoxMzoiYmxvY2sxMmhpZGRlbiI7czo0OiJib29sIjtzOjI5OiJ1c2Vyc2VsZWN0b3Jfb3B0aW9uc2NvbGxhcHNlZCI7czo0OiJib29sIjtzOjI5OiJ1c2Vyc2VsZWN0b3JfcHJlc2VydmVzZWxlY3RlZCI7czo0OiJib29sIjtzOjI5OiJ1c2Vyc2VsZWN0b3JfYXV0b3NlbGVjdHVuaXF1ZSI7czo0OiJib29sIjtzOjI3OiJ1c2Vyc2VsZWN0b3Jfc2VhcmNoYW55d2hlcmUiO3M6NDoiYm9vbCI7czoxMjoiYmxvY2s2aGlkZGVuIjtzOjQ6ImJvb2wiO31zOjc6ImVkaXRpbmciO2k6MTtzOjEzOiJ1c2Vyc2VsZWN0b3JzIjthOjQ6e3M6MzI6ImQ0OTkxMDM0NWQ3ZGMwN2FmMjc0OTNkZWY3MDI3ZjY0IjthOjc6e3M6NToiY2xhc3MiO3M6MzI6ImVucm9sX21hbnVhbF9jdXJyZW50X3BhcnRpY2lwYW50IjtzOjQ6Im5hbWUiO3M6MTI6InJlbW92ZXNlbGVjdCI7czo3OiJleGNsdWRlIjthOjA6e31zOjExOiJleHRyYWZpZWxkcyI7YToxOntpOjA7czo1OiJlbWFpbCI7fXM6MTE6Im11bHRpc2VsZWN0IjtiOjE7czo3OiJlbnJvbGlkIjtpOjE7czo0OiJmaWxlIjtzOjI1OiJlbnJvbC9tYW51YWwvbG9jYWxsaWIucGhwIjt9czozMjoiODdmNjM1YzI0OTBkYjk2NjJhODU4YTRjYjU2NDcyMjIiO2E6Nzp7czo1OiJjbGFzcyI7czozNDoiZW5yb2xfbWFudWFsX3BvdGVudGlhbF9wYXJ0aWNpcGFudCI7czo0OiJuYW1lIjtzOjk6ImFkZHNlbGVjdCI7czo3OiJleGNsdWRlIjthOjA6e31zOjExOiJleHRyYWZpZWxkcyI7YToxOntpOjA7czo1OiJlbWFpbCI7fXM6MTE6Im11bHRpc2VsZWN0IjtiOjE7czo3OiJlbnJvbGlkIjtpOjE7czo0OiJmaWxlIjtzOjI1OiJlbnJvbC9tYW51YWwvbG9jYWxsaWIucGhwIjt9czozMjoiOWE1NjUwMzdmMDdhZTNlM2RkZTBjNjRlNjc2OGI0NDAiO2E6Nzp7czo1OiJjbGFzcyI7czozMjoiZW5yb2xfbWFudWFsX2N1cnJlbnRfcGFydGljaXBhbnQiO3M6NDoibmFtZSI7czoxMjoicmVtb3Zlc2VsZWN0IjtzOjc6ImV4Y2x1ZGUiO2E6MDp7fXM6MTE6ImV4dHJhZmllbGRzIjthOjE6e2k6MDtzOjU6ImVtYWlsIjt9czoxMToibXVsdGlzZWxlY3QiO2I6MTtzOjc6ImVucm9saWQiO2k6NztzOjQ6ImZpbGUiO3M6MjU6ImVucm9sL21hbnVhbC9sb2NhbGxpYi5waHAiO31zOjMyOiIyNDdjZGQyY2Q5YzdhODFjNTRkZTRlMWZkOTk2MTUwMyI7YTo3OntzOjU6ImNsYXNzIjtzOjM0OiJlbnJvbF9tYW51YWxfcG90ZW50aWFsX3BhcnRpY2lwYW50IjtzOjQ6Im5hbWUiO3M6OToiYWRkc2VsZWN0IjtzOjc6ImV4Y2x1ZGUiO2E6MDp7fXM6MTE6ImV4dHJhZmllbGRzIjthOjE6e2k6MDtzOjU6ImVtYWlsIjt9czoxMToibXVsdGlzZWxlY3QiO2I6MTtzOjc6ImVucm9saWQiO2k6NztzOjQ6ImZpbGUiO3M6MjU6ImVucm9sL21hbnVhbC9sb2NhbGxpYi5waHAiO319czo2OiJhY2Nlc3MiO2E6NTp7czoyOiJyYSI7YToxOntzOjI6Ii8xIjthOjE6e2k6NztzOjE6IjciO319czo0OiJyZGVmIjthOjE6e3M6NDoiLzE6NyI7YTo1MTp7czoyNjoicmVwb3NpdG9yeS9maWxlc3lzdGVtOnZpZXciO3M6MToiMSI7czoxOToibW9vZGxlL2NvbW1lbnQ6dmlldyI7czoxOiIxIjtzOjI5OiJyZXBvc2l0b3J5L2ZsaWNrcl9wdWJsaWM6dmlldyI7czoxOiIxIjtzOjIxOiJtb29kbGUvY291cnNlOnJlcXVlc3QiO3M6MToiMSI7czoyMjoicmVwb3NpdG9yeS9mbGlja3I6dmlldyI7czoxOiIxIjtzOjIyOiJtb29kbGUvbXk6bWFuYWdlYmxvY2tzIjtzOjE6IjEiO3M6MjY6InJlcG9zaXRvcnkvZ29vZ2xlZG9jczp2aWV3IjtzOjE6IjEiO3M6MjM6Im1vb2RsZS9wb3J0Zm9saW86ZXhwb3J0IjtzOjE6IjEiO3M6MjE6InJlcG9zaXRvcnkvbG9jYWw6dmlldyI7czoxOiIxIjtzOjE4OiJtb29kbGUvcmF0aW5nOnJhdGUiO3M6MToiMSI7czoyMjoicmVwb3NpdG9yeS9tZXJsb3Q6dmlldyI7czoxOiIxIjtzOjE4OiJtb29kbGUvcmF0aW5nOnZpZXciO3M6MToiMSI7czoyMjoicmVwb3NpdG9yeS9waWNhc2E6dmlldyI7czoxOiIxIjtzOjIxOiJtb29kbGUvcmF0aW5nOnZpZXdhbGwiO3M6MToiMSI7czoyNzoiYmxvY2svb25saW5lX3VzZXJzOnZpZXdsaXN0IjtzOjE6IjEiO3M6MjI6InJlcG9zaXRvcnkvcmVjZW50OnZpZXciO3M6MToiMSI7czoyMToibW9vZGxlL3JhdGluZzp2aWV3YW55IjtzOjE6IjEiO3M6MTU6Im1vZC9mb2xkZXI6dmlldyI7czoxOiIxIjtzOjE4OiJyZXBvc2l0b3J5L3MzOnZpZXciO3M6MToiMSI7czoyMzoibW9vZGxlL3NpdGU6c2VuZG1lc3NhZ2UiO3M6MToiMSI7czoxNDoibW9kL2ltc2NwOnZpZXciO3M6MToiMSI7czoyMjoicmVwb3NpdG9yeS91cGxvYWQ6dmlldyI7czoxOiIxIjtzOjE3OiJtb29kbGUvdGFnOmNyZWF0ZSI7czoxOiIxIjtzOjEzOiJtb2QvcGFnZTp2aWV3IjtzOjE6IjEiO3M6MTk6InJlcG9zaXRvcnkvdXJsOnZpZXciO3M6MToiMSI7czoxNToibW9vZGxlL3RhZzplZGl0IjtzOjE6IjEiO3M6MTc6Im1vZC9yZXNvdXJjZTp2aWV3IjtzOjE6IjEiO3M6MjA6InJlcG9zaXRvcnkvdXNlcjp2aWV3IjtzOjE6IjEiO3M6Mjk6Im1vb2RsZS91c2VyOmNoYW5nZW93bnBhc3N3b3JkIjtzOjE6IjEiO3M6MTI6Im1vZC91cmw6dmlldyI7czoxOiIxIjtzOjIyOiJyZXBvc2l0b3J5L3dlYmRhdjp2aWV3IjtzOjE6IjEiO3M6MzM6Im1vb2RsZS91c2VyOmVkaXRvd25tZXNzYWdlcHJvZmlsZSI7czoxOiIxIjtzOjE3OiJtb29kbGUvYmxvY2s6dmlldyI7czoxOiIxIjtzOjI1OiJyZXBvc2l0b3J5L3dpa2ltZWRpYTp2aWV3IjtzOjE6IjEiO3M6MjY6Im1vb2RsZS91c2VyOmVkaXRvd25wcm9maWxlIjtzOjE6IjEiO3M6Mjc6Im1vb2RsZS9ibG9nOmFzc29jaWF0ZWNvdXJzZSI7czoxOiIxIjtzOjIzOiJyZXBvc2l0b3J5L3lvdXR1YmU6dmlldyI7czoxOiIxIjtzOjI3OiJtb29kbGUvdXNlcjptYW5hZ2Vvd25ibG9ja3MiO3M6MToiMSI7czoyNzoibW9vZGxlL2Jsb2c6YXNzb2NpYXRlbW9kdWxlIjtzOjE6IjEiO3M6MjY6Im1vb2RsZS91c2VyOm1hbmFnZW93bmZpbGVzIjtzOjE6IjEiO3M6MTg6Im1vb2RsZS9ibG9nOmNyZWF0ZSI7czoxOiIxIjtzOjM1OiJtb29kbGUvd2Vic2VydmljZTpjcmVhdGVtb2JpbGV0b2tlbiI7czoxOiIxIjtzOjI2OiJtb29kbGUvYmxvZzptYW5hZ2VleHRlcm5hbCI7czoxOiIxIjtzOjI0OiJyZXBvc2l0b3J5L2FsZnJlc2NvOnZpZXciO3M6MToiMSI7czoxODoibW9vZGxlL2Jsb2c6c2VhcmNoIjtzOjE6IjEiO3M6MjI6InJlcG9zaXRvcnkvYm94bmV0OnZpZXciO3M6MToiMSI7czoxNjoibW9vZGxlL2Jsb2c6dmlldyI7czoxOiIxIjtzOjI3OiJyZXBvc2l0b3J5L2NvdXJzZWZpbGVzOnZpZXciO3M6MToiMSI7czozMjoibW9vZGxlL2NhbGVuZGFyOm1hbmFnZW93bmVudHJpZXMiO3M6MToiMSI7czoyMzoicmVwb3NpdG9yeS9kcm9wYm94OnZpZXciO3M6MToiMSI7czoxOToibW9vZGxlL2NvbW1lbnQ6cG9zdCI7czoxOiIxIjt9fXM6NjoibG9hZGVkIjthOjA6e31zOjI6ImRyIjtzOjE6IjciO3M6NDoidGltZSI7aToxMzE3ODQ2NjcxO319', 1317845761, 1317850851, '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1'),
(215, 0, 'o75vnrjrst28goh67eglml2fg2', 14, 'U0VTU0lPTnxPOjg6InN0ZENsYXNzIjo2OntzOjEwOiJsb2dpbmNvdW50IjtpOjA7czo4OiJuYXZjYWNoZSI7Tzo4OiJzdGRDbGFzcyI6MTp7czoxMDoibmF2aWdhdGlvbiI7YTo5OntzOjE3OiJjb3Vyc2Vfc2VjdGlvbnNfMSI7YTozOntpOjA7aToxMzE3ODQ2MTUxO2k6MTtzOjI6IjE0IjtpOjI7czoyMjE6ImE6MTp7aTowO086ODoic3RkQ2xhc3MiOjk6e3M6Nzoic2VjdGlvbiI7czoxOiIwIjtzOjI6ImlkIjtzOjE6IjEiO3M6NjoiY291cnNlIjtzOjE6IjEiO3M6NDoibmFtZSI7TjtzOjc6InN1bW1hcnkiO3M6MDoiIjtzOjEzOiJzdW1tYXJ5Zm9ybWF0IjtzOjE6IjEiO3M6ODoic2VxdWVuY2UiO3M6MToiMSI7czo3OiJ2aXNpYmxlIjtzOjE6IjEiO3M6MTI6Imhhc2FjdGl2aXRlcyI7YjoxO319Ijt9czoxODoiY291cnNlX2FjdGl2aXRlc18xIjthOjM6e2k6MDtpOjEzMTc4NDYxNTE7aToxO3M6MjoiMTQiO2k6MjtzOjI4MDoiYToxOntpOjE7Tzo4OiJzdGRDbGFzcyI6MTA6e3M6Nzoic2VjdGlvbiI7czoxOiIwIjtzOjQ6Im5hbWUiO3M6OToiQ2FydGVsZXJhIjtzOjQ6Imljb24iO3M6MDoiIjtzOjEzOiJpY29uY29tcG9uZW50IjtzOjA6IiI7czoyOiJpZCI7czoxOiIxIjtzOjY6ImhpZGRlbiI7YjowO3M6NzoibW9kbmFtZSI7czo1OiJmb3J1bSI7czo4OiJub2RldHlwZSI7aTowO3M6MzoidXJsIjtzOjQwOiJodHRwOi8vbG9jYWxob3N0L21vZC9mb3J1bS92aWV3LnBocD9pZD0xIjtzOjc6ImRpc3BsYXkiO2I6MTt9fSI7fXM6MTc6ImNvbnRleHRoYXNyZXBvczM4IjthOjM6e2k6MDtpOjEzMTc4NDk5ODk7aToxO3M6MjoiMTQiO2k6MjtzOjQ6ImI6MDsiO31zOjE3OiJjb250ZXh0aGFzcmVwb3MyNCI7YTozOntpOjA7aToxMzE3ODQ2MTU3O2k6MTtzOjI6IjE0IjtpOjI7czo0OiJiOjA7Ijt9czoxNzoiY291cnNlX3NlY3Rpb25zXzIiO2E6Mzp7aTowO2k6MTMxNzg0NjE3NTtpOjE7czoyOiIxNCI7aToyO3M6MjMxMjoiYToxMTp7aTowO086ODoic3RkQ2xhc3MiOjk6e3M6Nzoic2VjdGlvbiI7czoxOiIwIjtzOjI6ImlkIjtzOjE6IjIiO3M6NjoiY291cnNlIjtzOjE6IjIiO3M6NDoibmFtZSI7TjtzOjc6InN1bW1hcnkiO047czoxMzoic3VtbWFyeWZvcm1hdCI7czoxOiIxIjtzOjg6InNlcXVlbmNlIjtzOjE6IjIiO3M6NzoidmlzaWJsZSI7czoxOiIxIjtzOjEyOiJoYXNhY3Rpdml0ZXMiO2I6MTt9aToxO086ODoic3RkQ2xhc3MiOjk6e3M6Nzoic2VjdGlvbiI7czoxOiIxIjtzOjI6ImlkIjtzOjE6IjMiO3M6NjoiY291cnNlIjtzOjE6IjIiO3M6NDoibmFtZSI7TjtzOjc6InN1bW1hcnkiO3M6MDoiIjtzOjEzOiJzdW1tYXJ5Zm9ybWF0IjtzOjE6IjEiO3M6ODoic2VxdWVuY2UiO047czo3OiJ2aXNpYmxlIjtzOjE6IjEiO3M6MTI6Imhhc2FjdGl2aXRlcyI7YjowO31pOjI7Tzo4OiJzdGRDbGFzcyI6OTp7czo3OiJzZWN0aW9uIjtzOjE6IjIiO3M6MjoiaWQiO3M6MToiNCI7czo2OiJjb3Vyc2UiO3M6MToiMiI7czo0OiJuYW1lIjtOO3M6Nzoic3VtbWFyeSI7czowOiIiO3M6MTM6InN1bW1hcnlmb3JtYXQiO3M6MToiMSI7czo4OiJzZXF1ZW5jZSI7TjtzOjc6InZpc2libGUiO3M6MToiMSI7czoxMjoiaGFzYWN0aXZpdGVzIjtiOjA7fWk6MztPOjg6InN0ZENsYXNzIjo5OntzOjc6InNlY3Rpb24iO3M6MToiMyI7czoyOiJpZCI7czoxOiI1IjtzOjY6ImNvdXJzZSI7czoxOiIyIjtzOjQ6Im5hbWUiO047czo3OiJzdW1tYXJ5IjtzOjA6IiI7czoxMzoic3VtbWFyeWZvcm1hdCI7czoxOiIxIjtzOjg6InNlcXVlbmNlIjtOO3M6NzoidmlzaWJsZSI7czoxOiIxIjtzOjEyOiJoYXNhY3Rpdml0ZXMiO2I6MDt9aTo0O086ODoic3RkQ2xhc3MiOjk6e3M6Nzoic2VjdGlvbiI7czoxOiI0IjtzOjI6ImlkIjtzOjE6IjYiO3M6NjoiY291cnNlIjtzOjE6IjIiO3M6NDoibmFtZSI7TjtzOjc6InN1bW1hcnkiO3M6MDoiIjtzOjEzOiJzdW1tYXJ5Zm9ybWF0IjtzOjE6IjEiO3M6ODoic2VxdWVuY2UiO047czo3OiJ2aXNpYmxlIjtzOjE6IjEiO3M6MTI6Imhhc2FjdGl2aXRlcyI7YjowO31pOjU7Tzo4OiJzdGRDbGFzcyI6OTp7czo3OiJzZWN0aW9uIjtzOjE6IjUiO3M6MjoiaWQiO3M6MToiNyI7czo2OiJjb3Vyc2UiO3M6MToiMiI7czo0OiJuYW1lIjtOO3M6Nzoic3VtbWFyeSI7czowOiIiO3M6MTM6InN1bW1hcnlmb3JtYXQiO3M6MToiMSI7czo4OiJzZXF1ZW5jZSI7TjtzOjc6InZpc2libGUiO3M6MToiMSI7czoxMjoiaGFzYWN0aXZpdGVzIjtiOjA7fWk6NjtPOjg6InN0ZENsYXNzIjo5OntzOjc6InNlY3Rpb24iO3M6MToiNiI7czoyOiJpZCI7czoxOiI4IjtzOjY6ImNvdXJzZSI7czoxOiIyIjtzOjQ6Im5hbWUiO047czo3OiJzdW1tYXJ5IjtzOjA6IiI7czoxMzoic3VtbWFyeWZvcm1hdCI7czoxOiIxIjtzOjg6InNlcXVlbmNlIjtOO3M6NzoidmlzaWJsZSI7czoxOiIxIjtzOjEyOiJoYXNhY3Rpdml0ZXMiO2I6MDt9aTo3O086ODoic3RkQ2xhc3MiOjk6e3M6Nzoic2VjdGlvbiI7czoxOiI3IjtzOjI6ImlkIjtzOjE6IjkiO3M6NjoiY291cnNlIjtzOjE6IjIiO3M6NDoibmFtZSI7TjtzOjc6InN1bW1hcnkiO3M6MDoiIjtzOjEzOiJzdW1tYXJ5Zm9ybWF0IjtzOjE6IjEiO3M6ODoic2VxdWVuY2UiO047czo3OiJ2aXNpYmxlIjtzOjE6IjEiO3M6MTI6Imhhc2FjdGl2aXRlcyI7YjowO31pOjg7Tzo4OiJzdGRDbGFzcyI6OTp7czo3OiJzZWN0aW9uIjtzOjE6IjgiO3M6MjoiaWQiO3M6MjoiMTAiO3M6NjoiY291cnNlIjtzOjE6IjIiO3M6NDoibmFtZSI7TjtzOjc6InN1bW1hcnkiO3M6MDoiIjtzOjEzOiJzdW1tYXJ5Zm9ybWF0IjtzOjE6IjEiO3M6ODoic2VxdWVuY2UiO047czo3OiJ2aXNpYmxlIjtzOjE6IjEiO3M6MTI6Imhhc2FjdGl2aXRlcyI7YjowO31pOjk7Tzo4OiJzdGRDbGFzcyI6OTp7czo3OiJzZWN0aW9uIjtzOjE6IjkiO3M6MjoiaWQiO3M6MjoiMTEiO3M6NjoiY291cnNlIjtzOjE6IjIiO3M6NDoibmFtZSI7TjtzOjc6InN1bW1hcnkiO3M6MDoiIjtzOjEzOiJzdW1tYXJ5Zm9ybWF0IjtzOjE6IjEiO3M6ODoic2VxdWVuY2UiO047czo3OiJ2aXNpYmxlIjtzOjE6IjEiO3M6MTI6Imhhc2FjdGl2aXRlcyI7YjowO31pOjEwO086ODoic3RkQ2xhc3MiOjk6e3M6Nzoic2VjdGlvbiI7czoyOiIxMCI7czoyOiJpZCI7czoyOiIxMiI7czo2OiJjb3Vyc2UiO3M6MToiMiI7czo0OiJuYW1lIjtOO3M6Nzoic3VtbWFyeSI7czowOiIiO3M6MTM6InN1bW1hcnlmb3JtYXQiO3M6MToiMSI7czo4OiJzZXF1ZW5jZSI7TjtzOjc6InZpc2libGUiO3M6MToiMSI7czoxMjoiaGFzYWN0aXZpdGVzIjtiOjA7fX0iO31zOjE4OiJjb3Vyc2VfYWN0aXZpdGVzXzIiO2E6Mzp7aTowO2k6MTMxNzg0NjE3NTtpOjE7czoyOiIxNCI7aToyO3M6MjgwOiJhOjE6e2k6MjtPOjg6InN0ZENsYXNzIjoxMDp7czo3OiJzZWN0aW9uIjtzOjE6IjAiO3M6NDoibmFtZSI7czo5OiJOb3ZlZGFkZXMiO3M6NDoiaWNvbiI7czowOiIiO3M6MTM6Imljb25jb21wb25lbnQiO3M6MDoiIjtzOjI6ImlkIjtzOjE6IjIiO3M6NjoiaGlkZGVuIjtiOjA7czo3OiJtb2RuYW1lIjtzOjU6ImZvcnVtIjtzOjg6Im5vZGV0eXBlIjtpOjA7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly9sb2NhbGhvc3QvbW9kL2ZvcnVtL3ZpZXcucGhwP2lkPTIiO3M6NzoiZGlzcGxheSI7YjoxO319Ijt9czoxNzoiY29udGV4dGhhc3JlcG9zNDYiO2E6Mzp7aTowO2k6MTMxNzg1MDUyNDtpOjE7czoyOiIxNCI7aToyO3M6NDoiYjowOyI7fXM6MTc6ImNvdXJzZV9zZWN0aW9uc180IjthOjM6e2k6MDtpOjEzMTc4NTA1MjQ7aToxO3M6MjoiMTQiO2k6MjtzOjM1OTI6ImE6MTc6e2k6MDtPOjg6InN0ZENsYXNzIjo5OntzOjc6InNlY3Rpb24iO3M6MToiMCI7czoyOiJpZCI7czoyOiIyNCI7czo2OiJjb3Vyc2UiO3M6MToiNCI7czo0OiJuYW1lIjtOO3M6Nzoic3VtbWFyeSI7TjtzOjEzOiJzdW1tYXJ5Zm9ybWF0IjtzOjE6IjEiO3M6ODoic2VxdWVuY2UiO3M6MToiNCI7czo3OiJ2aXNpYmxlIjtzOjE6IjEiO3M6MTI6Imhhc2FjdGl2aXRlcyI7YjoxO31pOjE7Tzo4OiJzdGRDbGFzcyI6OTp7czo3OiJzZWN0aW9uIjtzOjE6IjEiO3M6MjoiaWQiO3M6MjoiMjUiO3M6NjoiY291cnNlIjtzOjE6IjQiO3M6NDoibmFtZSI7TjtzOjc6InN1bW1hcnkiO3M6MDoiIjtzOjEzOiJzdW1tYXJ5Zm9ybWF0IjtzOjE6IjEiO3M6ODoic2VxdWVuY2UiO047czo3OiJ2aXNpYmxlIjtzOjE6IjEiO3M6MTI6Imhhc2FjdGl2aXRlcyI7YjowO31pOjI7Tzo4OiJzdGRDbGFzcyI6OTp7czo3OiJzZWN0aW9uIjtzOjE6IjIiO3M6MjoiaWQiO3M6MjoiMjYiO3M6NjoiY291cnNlIjtzOjE6IjQiO3M6NDoibmFtZSI7TjtzOjc6InN1bW1hcnkiO3M6MDoiIjtzOjEzOiJzdW1tYXJ5Zm9ybWF0IjtzOjE6IjEiO3M6ODoic2VxdWVuY2UiO047czo3OiJ2aXNpYmxlIjtzOjE6IjEiO3M6MTI6Imhhc2FjdGl2aXRlcyI7YjowO31pOjM7Tzo4OiJzdGRDbGFzcyI6OTp7czo3OiJzZWN0aW9uIjtzOjE6IjMiO3M6MjoiaWQiO3M6MjoiMjciO3M6NjoiY291cnNlIjtzOjE6IjQiO3M6NDoibmFtZSI7TjtzOjc6InN1bW1hcnkiO3M6MDoiIjtzOjEzOiJzdW1tYXJ5Zm9ybWF0IjtzOjE6IjEiO3M6ODoic2VxdWVuY2UiO047czo3OiJ2aXNpYmxlIjtzOjE6IjEiO3M6MTI6Imhhc2FjdGl2aXRlcyI7YjowO31pOjQ7Tzo4OiJzdGRDbGFzcyI6OTp7czo3OiJzZWN0aW9uIjtzOjE6IjQiO3M6MjoiaWQiO3M6MjoiMjgiO3M6NjoiY291cnNlIjtzOjE6IjQiO3M6NDoibmFtZSI7TjtzOjc6InN1bW1hcnkiO3M6MDoiIjtzOjEzOiJzdW1tYXJ5Zm9ybWF0IjtzOjE6IjEiO3M6ODoic2VxdWVuY2UiO047czo3OiJ2aXNpYmxlIjtzOjE6IjEiO3M6MTI6Imhhc2FjdGl2aXRlcyI7YjowO31pOjU7Tzo4OiJzdGRDbGFzcyI6OTp7czo3OiJzZWN0aW9uIjtzOjE6IjUiO3M6MjoiaWQiO3M6MjoiMjkiO3M6NjoiY291cnNlIjtzOjE6IjQiO3M6NDoibmFtZSI7TjtzOjc6InN1bW1hcnkiO3M6MDoiIjtzOjEzOiJzdW1tYXJ5Zm9ybWF0IjtzOjE6IjEiO3M6ODoic2VxdWVuY2UiO047czo3OiJ2aXNpYmxlIjtzOjE6IjEiO3M6MTI6Imhhc2FjdGl2aXRlcyI7YjowO31pOjY7Tzo4OiJzdGRDbGFzcyI6OTp7czo3OiJzZWN0aW9uIjtzOjE6IjYiO3M6MjoiaWQiO3M6MjoiMzAiO3M6NjoiY291cnNlIjtzOjE6IjQiO3M6NDoibmFtZSI7TjtzOjc6InN1bW1hcnkiO3M6MDoiIjtzOjEzOiJzdW1tYXJ5Zm9ybWF0IjtzOjE6IjEiO3M6ODoic2VxdWVuY2UiO047czo3OiJ2aXNpYmxlIjtzOjE6IjEiO3M6MTI6Imhhc2FjdGl2aXRlcyI7YjowO31pOjc7Tzo4OiJzdGRDbGFzcyI6OTp7czo3OiJzZWN0aW9uIjtzOjE6IjciO3M6MjoiaWQiO3M6MjoiMzEiO3M6NjoiY291cnNlIjtzOjE6IjQiO3M6NDoibmFtZSI7TjtzOjc6InN1bW1hcnkiO3M6MDoiIjtzOjEzOiJzdW1tYXJ5Zm9ybWF0IjtzOjE6IjEiO3M6ODoic2VxdWVuY2UiO047czo3OiJ2aXNpYmxlIjtzOjE6IjEiO3M6MTI6Imhhc2FjdGl2aXRlcyI7YjowO31pOjg7Tzo4OiJzdGRDbGFzcyI6OTp7czo3OiJzZWN0aW9uIjtzOjE6IjgiO3M6MjoiaWQiO3M6MjoiMzIiO3M6NjoiY291cnNlIjtzOjE6IjQiO3M6NDoibmFtZSI7TjtzOjc6InN1bW1hcnkiO3M6MDoiIjtzOjEzOiJzdW1tYXJ5Zm9ybWF0IjtzOjE6IjEiO3M6ODoic2VxdWVuY2UiO047czo3OiJ2aXNpYmxlIjtzOjE6IjEiO3M6MTI6Imhhc2FjdGl2aXRlcyI7YjowO31pOjk7Tzo4OiJzdGRDbGFzcyI6OTp7czo3OiJzZWN0aW9uIjtzOjE6IjkiO3M6MjoiaWQiO3M6MjoiMzMiO3M6NjoiY291cnNlIjtzOjE6IjQiO3M6NDoibmFtZSI7TjtzOjc6InN1bW1hcnkiO3M6MDoiIjtzOjEzOiJzdW1tYXJ5Zm9ybWF0IjtzOjE6IjEiO3M6ODoic2VxdWVuY2UiO047czo3OiJ2aXNpYmxlIjtzOjE6IjEiO3M6MTI6Imhhc2FjdGl2aXRlcyI7YjowO31pOjEwO086ODoic3RkQ2xhc3MiOjk6e3M6Nzoic2VjdGlvbiI7czoyOiIxMCI7czoyOiJpZCI7czoyOiIzNCI7czo2OiJjb3Vyc2UiO3M6MToiNCI7czo0OiJuYW1lIjtOO3M6Nzoic3VtbWFyeSI7czowOiIiO3M6MTM6InN1bW1hcnlmb3JtYXQiO3M6MToiMSI7czo4OiJzZXF1ZW5jZSI7TjtzOjc6InZpc2libGUiO3M6MToiMSI7czoxMjoiaGFzYWN0aXZpdGVzIjtiOjA7fWk6MTE7Tzo4OiJzdGRDbGFzcyI6OTp7czo3OiJzZWN0aW9uIjtzOjI6IjExIjtzOjI6ImlkIjtzOjI6IjM1IjtzOjY6ImNvdXJzZSI7czoxOiI0IjtzOjQ6Im5hbWUiO047czo3OiJzdW1tYXJ5IjtzOjA6IiI7czoxMzoic3VtbWFyeWZvcm1hdCI7czoxOiIxIjtzOjg6InNlcXVlbmNlIjtOO3M6NzoidmlzaWJsZSI7czoxOiIxIjtzOjEyOiJoYXNhY3Rpdml0ZXMiO2I6MDt9aToxMjtPOjg6InN0ZENsYXNzIjo5OntzOjc6InNlY3Rpb24iO3M6MjoiMTIiO3M6MjoiaWQiO3M6MjoiMzYiO3M6NjoiY291cnNlIjtzOjE6IjQiO3M6NDoibmFtZSI7TjtzOjc6InN1bW1hcnkiO3M6MDoiIjtzOjEzOiJzdW1tYXJ5Zm9ybWF0IjtzOjE6IjEiO3M6ODoic2VxdWVuY2UiO047czo3OiJ2aXNpYmxlIjtzOjE6IjEiO3M6MTI6Imhhc2FjdGl2aXRlcyI7YjowO31pOjEzO086ODoic3RkQ2xhc3MiOjk6e3M6Nzoic2VjdGlvbiI7czoyOiIxMyI7czoyOiJpZCI7czoyOiIzNyI7czo2OiJjb3Vyc2UiO3M6MToiNCI7czo0OiJuYW1lIjtOO3M6Nzoic3VtbWFyeSI7czowOiIiO3M6MTM6InN1bW1hcnlmb3JtYXQiO3M6MToiMSI7czo4OiJzZXF1ZW5jZSI7TjtzOjc6InZpc2libGUiO3M6MToiMSI7czoxMjoiaGFzYWN0aXZpdGVzIjtiOjA7fWk6MTQ7Tzo4OiJzdGRDbGFzcyI6OTp7czo3OiJzZWN0aW9uIjtzOjI6IjE0IjtzOjI6ImlkIjtzOjI6IjM4IjtzOjY6ImNvdXJzZSI7czoxOiI0IjtzOjQ6Im5hbWUiO047czo3OiJzdW1tYXJ5IjtzOjA6IiI7czoxMzoic3VtbWFyeWZvcm1hdCI7czoxOiIxIjtzOjg6InNlcXVlbmNlIjtOO3M6NzoidmlzaWJsZSI7czoxOiIxIjtzOjEyOiJoYXNhY3Rpdml0ZXMiO2I6MDt9aToxNTtPOjg6InN0ZENsYXNzIjo5OntzOjc6InNlY3Rpb24iO3M6MjoiMTUiO3M6MjoiaWQiO3M6MjoiMzkiO3M6NjoiY291cnNlIjtzOjE6IjQiO3M6NDoibmFtZSI7TjtzOjc6InN1bW1hcnkiO3M6MDoiIjtzOjEzOiJzdW1tYXJ5Zm9ybWF0IjtzOjE6IjEiO3M6ODoic2VxdWVuY2UiO047czo3OiJ2aXNpYmxlIjtzOjE6IjEiO3M6MTI6Imhhc2FjdGl2aXRlcyI7YjowO31pOjE2O086ODoic3RkQ2xhc3MiOjk6e3M6Nzoic2VjdGlvbiI7czoyOiIxNiI7czoyOiJpZCI7czoyOiI0MCI7czo2OiJjb3Vyc2UiO3M6MToiNCI7czo0OiJuYW1lIjtOO3M6Nzoic3VtbWFyeSI7czowOiIiO3M6MTM6InN1bW1hcnlmb3JtYXQiO3M6MToiMSI7czo4OiJzZXF1ZW5jZSI7TjtzOjc6InZpc2libGUiO3M6MToiMSI7czoxMjoiaGFzYWN0aXZpdGVzIjtiOjA7fX0iO31zOjE4OiJjb3Vyc2VfYWN0aXZpdGVzXzQiO2E6Mzp7aTowO2k6MTMxNzg1MDUyNDtpOjE7czoyOiIxNCI7aToyO3M6MjgwOiJhOjE6e2k6NDtPOjg6InN0ZENsYXNzIjoxMDp7czo3OiJzZWN0aW9uIjtzOjE6IjAiO3M6NDoibmFtZSI7czo5OiJOb3ZlZGFkZXMiO3M6NDoiaWNvbiI7czowOiIiO3M6MTM6Imljb25jb21wb25lbnQiO3M6MDoiIjtzOjI6ImlkIjtzOjE6IjQiO3M6NjoiaGlkZGVuIjtiOjA7czo3OiJtb2RuYW1lIjtzOjU6ImZvcnVtIjtzOjg6Im5vZGV0eXBlIjtpOjA7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly9sb2NhbGhvc3QvbW9kL2ZvcnVtL3ZpZXcucGhwP2lkPTQiO3M6NzoiZGlzcGxheSI7YjoxO319Ijt9fX1zOjIxOiJsb2FkX25hdmlnYXRpb25fYWRtaW4iO2I6MTtzOjE0OiJmcm9tZGlzY3Vzc2lvbiI7czozNzoiaHR0cDovL2xvY2FsaG9zdC9jb3Vyc2Uvdmlldy5waHA/aWQ9NCI7czoxMjoiZmxhc2h2ZXJzaW9uIjtzOjc6IjEwLjEuNTMiO3M6ODoid2FudHN1cmwiO3M6NTA6Imh0dHA6Ly9sb2NhbGhvc3QvZW5yb2wvbWFudWFsL21hbmFnZS5waHA/ZW5yb2xpZD03Ijt9VVNFUnxPOjg6InN0ZENsYXNzIjo2Mzp7czoyOiJpZCI7czoyOiIxNCI7czo0OiJhdXRoIjtzOjU6ImVtYWlsIjtzOjk6ImNvbmZpcm1lZCI7czoxOiIxIjtzOjEyOiJwb2xpY3lhZ3JlZWQiO3M6MToiMCI7czo3OiJkZWxldGVkIjtzOjE6IjAiO3M6OToic3VzcGVuZGVkIjtzOjE6IjAiO3M6MTA6Im1uZXRob3N0aWQiO3M6MToiMSI7czo4OiJ1c2VybmFtZSI7czoxNToibWVkaWFkb3Jwb3BwZXIxIjtzOjg6InBhc3N3b3JkIjtzOjMyOiJlNmQwYTI5OGUwZTA0NTQ1YzkwZjRmZTI4NzIwNWJkMSI7czo4OiJpZG51bWJlciI7czowOiIiO3M6OToiZmlyc3RuYW1lIjtzOjk6Im1lZGlhZG9yMSI7czo4OiJsYXN0bmFtZSI7czo2OiJwb3BwZXIiO3M6NToiZW1haWwiO3M6MjU6Im1lZGlhZG9ycG9wcGVyMUBnbWFpbC5jb20iO3M6OToiZW1haWxzdG9wIjtzOjE6IjAiO3M6MzoiaWNxIjtzOjA6IiI7czo1OiJza3lwZSI7czowOiIiO3M6NToieWFob28iO3M6MDoiIjtzOjM6ImFpbSI7czowOiIiO3M6MzoibXNuIjtzOjA6IiI7czo2OiJwaG9uZTEiO3M6MDoiIjtzOjY6InBob25lMiI7czowOiIiO3M6MTE6Imluc3RpdHV0aW9uIjtzOjA6IiI7czoxMDoiZGVwYXJ0bWVudCI7czowOiIiO3M6NzoiYWRkcmVzcyI7czowOiIiO3M6NDoiY2l0eSI7czoxMjoiQnVlbm9zIEFpcmVzIjtzOjc6ImNvdW50cnkiO3M6MjoiQVIiO3M6NDoibGFuZyI7czo1OiJlc19hciI7czo1OiJ0aGVtZSI7czowOiIiO3M6ODoidGltZXpvbmUiO3M6MjoiOTkiO3M6MTE6ImZpcnN0YWNjZXNzIjtzOjEwOiIxMzE3MzI2MTg5IjtzOjEwOiJsYXN0YWNjZXNzIjtpOjEzMTc4NTA1MjQ7czo5OiJsYXN0bG9naW4iO3M6MTA6IjEzMTczOTYwMDgiO3M6MTI6ImN1cnJlbnRsb2dpbiI7aToxMzE3ODQ2MTUwO3M6NjoibGFzdGlwIjtzOjk6IjEyNy4wLjAuMSI7czo2OiJzZWNyZXQiO3M6MTU6IkxuaDZMNmVlTUMwMk04dSI7czo3OiJwaWN0dXJlIjtzOjE6IjAiO3M6MzoidXJsIjtzOjA6IiI7czoxNzoiZGVzY3JpcHRpb25mb3JtYXQiO3M6MToiMCI7czoxMDoibWFpbGZvcm1hdCI7czoxOiIxIjtzOjEwOiJtYWlsZGlnZXN0IjtzOjE6IjAiO3M6MTE6Im1haWxkaXNwbGF5IjtzOjE6IjIiO3M6MTA6Imh0bWxlZGl0b3IiO3M6MToiMSI7czo0OiJhamF4IjtzOjE6IjEiO3M6MTM6ImF1dG9zdWJzY3JpYmUiO3M6MToiMSI7czoxMToidHJhY2tmb3J1bXMiO3M6MToiMCI7czoxMToidGltZWNyZWF0ZWQiO3M6MTA6IjEzMTczMjYxNDciO3M6MTI6InRpbWVtb2RpZmllZCI7czoxMDoiMTMxNzMyOTUwMiI7czoxMjoidHJ1c3RiaXRtYXNrIjtzOjE6IjAiO3M6ODoiaW1hZ2VhbHQiO3M6MDoiIjtzOjEyOiJzY3JlZW5yZWFkZXIiO3M6MToiMCI7czoxNjoibGFzdGNvdXJzZWFjY2VzcyI7YTowOnt9czoxOToiY3VycmVudGNvdXJzZWFjY2VzcyI7YToyOntpOjI7aToxMzE3ODQ2MTc1O2k6NDtpOjEzMTc4NTA1MjQ7fXM6MTE6Imdyb3VwbWVtYmVyIjthOjA6e31zOjc6InByb2ZpbGUiO2E6Mzp7czozOiJkbmkiO3M6ODoiMTIzNDU2NzgiO3M6NjoicGFkcm9uIjtzOjg6IjEyMzQ1Njc4IjtzOjEzOiJyb2xzb2xpY2l0YWRvIjtzOjg6Ik1lZGlhZG9yIjt9czo3OiJzZXNza2V5IjtzOjEwOiJabkhQRkdSU2hkIjtzOjEwOiJwcmVmZXJlbmNlIjthOjI6e3M6MjQ6ImF1dGhfZm9yY2VwYXNzd29yZGNoYW5nZSI7czoxOiIwIjtzOjExOiJfbGFzdGxvYWRlZCI7aToxMzE3ODUxMTk4O31zOjE3OiJtZXNzYWdlX2xhc3Rwb3B1cCI7aTowO3M6NzoiZGlzcGxheSI7YToxOntpOjQ7aTowO31zOjI1OiJhamF4X3VwZGF0YWJsZV91c2VyX3ByZWZzIjthOjEwOntzOjIzOiJkb2NrZWRfYmxvY2tfaW5zdGFuY2VfNCI7czozOiJpbnQiO3M6MjM6ImRvY2tlZF9ibG9ja19pbnN0YW5jZV81IjtzOjM6ImludCI7czoxMzoiYmxvY2sxOWhpZGRlbiI7czo0OiJib29sIjtzOjEzOiJibG9jazE1aGlkZGVuIjtzOjQ6ImJvb2wiO3M6Mjk6InVzZXJzZWxlY3Rvcl9vcHRpb25zY29sbGFwc2VkIjtzOjQ6ImJvb2wiO3M6Mjk6InVzZXJzZWxlY3Rvcl9wcmVzZXJ2ZXNlbGVjdGVkIjtzOjQ6ImJvb2wiO3M6Mjk6InVzZXJzZWxlY3Rvcl9hdXRvc2VsZWN0dW5pcXVlIjtzOjQ6ImJvb2wiO3M6Mjc6InVzZXJzZWxlY3Rvcl9zZWFyY2hhbnl3aGVyZSI7czo0OiJib29sIjtzOjEzOiJibG9jazI0aGlkZGVuIjtzOjQ6ImJvb2wiO3M6MTM6ImJsb2NrMjVoaWRkZW4iO3M6NDoiYm9vbCI7fXM6NToiZW5yb2wiO2E6Mjp7czo4OiJlbnJvbGxlZCI7YToyOntpOjI7aToxMzE3ODQ3OTc1O2k6NDtpOjEzMTc4NTIzMjQ7fXM6OToidGVtcGd1ZXN0IjthOjA6e319czoxMzoidXNlcnNlbGVjdG9ycyI7YTo0OntzOjMyOiJkNDk5MTAzNDVkN2RjMDdhZjI3NDkzZGVmNzAyN2Y2NCI7YTo3OntzOjU6ImNsYXNzIjtzOjMyOiJlbnJvbF9tYW51YWxfY3VycmVudF9wYXJ0aWNpcGFudCI7czo0OiJuYW1lIjtzOjEyOiJyZW1vdmVzZWxlY3QiO3M6NzoiZXhjbHVkZSI7YTowOnt9czoxMToiZXh0cmFmaWVsZHMiO2E6MTp7aTowO3M6NToiZW1haWwiO31zOjExOiJtdWx0aXNlbGVjdCI7YjoxO3M6NzoiZW5yb2xpZCI7aToxO3M6NDoiZmlsZSI7czoyNToiZW5yb2wvbWFudWFsL2xvY2FsbGliLnBocCI7fXM6MzI6Ijg3ZjYzNWMyNDkwZGI5NjYyYTg1OGE0Y2I1NjQ3MjIyIjthOjc6e3M6NToiY2xhc3MiO3M6MzQ6ImVucm9sX21hbnVhbF9wb3RlbnRpYWxfcGFydGljaXBhbnQiO3M6NDoibmFtZSI7czo5OiJhZGRzZWxlY3QiO3M6NzoiZXhjbHVkZSI7YTowOnt9czoxMToiZXh0cmFmaWVsZHMiO2E6MTp7aTowO3M6NToiZW1haWwiO31zOjExOiJtdWx0aXNlbGVjdCI7YjoxO3M6NzoiZW5yb2xpZCI7aToxO3M6NDoiZmlsZSI7czoyNToiZW5yb2wvbWFudWFsL2xvY2FsbGliLnBocCI7fXM6MzI6IjlhNTY1MDM3ZjA3YWUzZTNkZGUwYzY0ZTY3NjhiNDQwIjthOjc6e3M6NToiY2xhc3MiO3M6MzI6ImVucm9sX21hbnVhbF9jdXJyZW50X3BhcnRpY2lwYW50IjtzOjQ6Im5hbWUiO3M6MTI6InJlbW92ZXNlbGVjdCI7czo3OiJleGNsdWRlIjthOjA6e31zOjExOiJleHRyYWZpZWxkcyI7YToxOntpOjA7czo1OiJlbWFpbCI7fXM6MTE6Im11bHRpc2VsZWN0IjtiOjE7czo3OiJlbnJvbGlkIjtpOjc7czo0OiJmaWxlIjtzOjI1OiJlbnJvbC9tYW51YWwvbG9jYWxsaWIucGhwIjt9czozMjoiMjQ3Y2RkMmNkOWM3YTgxYzU0ZGU0ZTFmZDk5NjE1MDMiO2E6Nzp7czo1OiJjbGFzcyI7czozNDoiZW5yb2xfbWFudWFsX3BvdGVudGlhbF9wYXJ0aWNpcGFudCI7czo0OiJuYW1lIjtzOjk6ImFkZHNlbGVjdCI7czo3OiJleGNsdWRlIjthOjA6e31zOjExOiJleHRyYWZpZWxkcyI7YToxOntpOjA7czo1OiJlbWFpbCI7fXM6MTE6Im11bHRpc2VsZWN0IjtiOjE7czo3OiJlbnJvbGlkIjtpOjc7czo0OiJmaWxlIjtzOjI1OiJlbnJvbC9tYW51YWwvbG9jYWxsaWIucGhwIjt9fXM6NjoiYWNjZXNzIjthOjU6e3M6MjoicmEiO2E6Mzp7czoyOiIvMSI7YToyOntpOjM7czoxOiIzIjtpOjc7czoxOiI3Ijt9czo4OiIvMS8yMy8yNCI7YToxOntpOjM7czoxOiIzIjt9czo4OiIvMS8yMy80NiI7YToxOntpOjM7aTozO319czo0OiJyZGVmIjthOjE5OntzOjQ6Ii8xOjMiO2E6MjUyOntzOjI3OiJibG9jay9vbmxpbmVfdXNlcnM6dmlld2xpc3QiO3M6MToiMSI7czozMToiYmxvY2svcnNzX2NsaWVudDptYW5hZ2Vvd25mZWVkcyI7czoxOiIxIjtzOjI4OiJjb3Vyc2VyZXBvcnQvY29tcGxldGlvbjp2aWV3IjtzOjE6IjEiO3M6MjE6ImNvdXJzZXJlcG9ydC9sb2c6dmlldyI7czoxOiIxIjtzOjI1OiJjb3Vyc2VyZXBvcnQvbG9nOnZpZXdsaXZlIjtzOjE6IjEiO3M6MjY6ImNvdXJzZXJlcG9ydC9sb2c6dmlld3RvZGF5IjtzOjE6IjEiO3M6MjU6ImNvdXJzZXJlcG9ydC9vdXRsaW5lOnZpZXciO3M6MToiMSI7czozMToiY291cnNlcmVwb3J0L3BhcnRpY2lwYXRpb246dmlldyI7czoxOiIxIjtzOjI2OiJjb3Vyc2VyZXBvcnQvcHJvZ3Jlc3M6dmlldyI7czoxOiIxIjtzOjIzOiJjb3Vyc2VyZXBvcnQvc3RhdHM6dmlldyI7czoxOiIxIjtzOjIyOiJlbnJvbC9hdXRob3JpemU6bWFuYWdlIjtzOjE6IjEiO3M6MTk6ImVucm9sL2NvaG9ydDpjb25maWciO3M6MToiMSI7czoxODoiZW5yb2wvZ3Vlc3Q6Y29uZmlnIjtzOjE6IjEiO3M6MTg6ImVucm9sL21hbnVhbDplbnJvbCI7czoxOiIxIjtzOjE5OiJlbnJvbC9tYW51YWw6bWFuYWdlIjtzOjE6IjEiO3M6MjA6ImVucm9sL21hbnVhbDp1bmVucm9sIjtzOjE6IjEiO3M6MTc6ImVucm9sL21ldGE6Y29uZmlnIjtzOjE6IjEiO3M6MTk6ImVucm9sL3BheXBhbDptYW5hZ2UiO3M6MToiMSI7czoxNzoiZW5yb2wvc2VsZjpjb25maWciO3M6MToiMSI7czoxNzoiZW5yb2wvc2VsZjptYW5hZ2UiO3M6MToiMSI7czoxODoiZW5yb2wvc2VsZjp1bmVucm9sIjtzOjE6IjEiO3M6MjA6ImdyYWRlZXhwb3J0L29kczp2aWV3IjtzOjE6IjEiO3M6MjA6ImdyYWRlZXhwb3J0L3R4dDp2aWV3IjtzOjE6IjEiO3M6MjA6ImdyYWRlZXhwb3J0L3hsczp2aWV3IjtzOjE6IjEiO3M6MjA6ImdyYWRlZXhwb3J0L3htbDp2aWV3IjtzOjE6IjEiO3M6MjA6ImdyYWRlaW1wb3J0L2Nzdjp2aWV3IjtzOjE6IjEiO3M6MjA6ImdyYWRlaW1wb3J0L3htbDp2aWV3IjtzOjE6IjEiO3M6MjM6ImdyYWRlcmVwb3J0L2dyYWRlcjp2aWV3IjtzOjE6IjEiO3M6MjU6ImdyYWRlcmVwb3J0L291dGNvbWVzOnZpZXciO3M6MToiMSI7czoyMToiZ3JhZGVyZXBvcnQvdXNlcjp2aWV3IjtzOjE6IjEiO3M6MzQ6Im1vZC9hc3NpZ25tZW50OmV4cG9ydG93bnN1Ym1pc3Npb24iO3M6MToiMSI7czoyMDoibW9kL2Fzc2lnbm1lbnQ6Z3JhZGUiO3M6MToiMSI7czoxOToibW9kL2Fzc2lnbm1lbnQ6dmlldyI7czoxOiIxIjtzOjEzOiJtb2QvY2hhdDpjaGF0IjtzOjE6IjEiO3M6MTg6Im1vZC9jaGF0OmRlbGV0ZWxvZyI7czoxOiIxIjtzOjM0OiJtb2QvY2hhdDpleHBvcnRwYXJ0aWNpcGF0ZWRzZXNzaW9uIjtzOjE6IjEiO3M6MjI6Im1vZC9jaGF0OmV4cG9ydHNlc3Npb24iO3M6MToiMSI7czoxNjoibW9kL2NoYXQ6cmVhZGxvZyI7czoxOiIxIjtzOjE3OiJtb2QvY2hvaWNlOmNob29zZSI7czoxOiIxIjtzOjI2OiJtb2QvY2hvaWNlOmRlbGV0ZXJlc3BvbnNlcyI7czoxOiIxIjtzOjI4OiJtb2QvY2hvaWNlOmRvd25sb2FkcmVzcG9uc2VzIjtzOjE6IjEiO3M6MjQ6Im1vZC9jaG9pY2U6cmVhZHJlc3BvbnNlcyI7czoxOiIxIjtzOjE2OiJtb2QvZGF0YTphcHByb3ZlIjtzOjE6IjEiO3M6MTY6Im1vZC9kYXRhOmNvbW1lbnQiO3M6MToiMSI7czoyNToibW9kL2RhdGE6ZXhwb3J0YWxsZW50cmllcyI7czoxOiIxIjtzOjIwOiJtb2QvZGF0YTpleHBvcnRlbnRyeSI7czoxOiIxIjtzOjIzOiJtb2QvZGF0YTpleHBvcnRvd25lbnRyeSI7czoxOiIxIjtzOjIzOiJtb2QvZGF0YTptYW5hZ2Vjb21tZW50cyI7czoxOiIxIjtzOjIyOiJtb2QvZGF0YTptYW5hZ2VlbnRyaWVzIjtzOjE6IjEiO3M6MjQ6Im1vZC9kYXRhOm1hbmFnZXRlbXBsYXRlcyI7czoxOiIxIjtzOjEzOiJtb2QvZGF0YTpyYXRlIjtzOjE6IjEiO3M6MjM6Im1vZC9kYXRhOnZpZXdhbGxyYXRpbmdzIjtzOjE6IjEiO3M6Mjc6Im1vZC9kYXRhOnZpZXdhbGx1c2VycHJlc2V0cyI7czoxOiIxIjtzOjIyOiJtb2QvZGF0YTp2aWV3YW55cmF0aW5nIjtzOjE6IjEiO3M6MTg6Im1vZC9kYXRhOnZpZXdlbnRyeSI7czoxOiIxIjtzOjE5OiJtb2QvZGF0YTp2aWV3cmF0aW5nIjtzOjE6IjEiO3M6MTk6Im1vZC9kYXRhOndyaXRlZW50cnkiO3M6MToiMSI7czozNDoibW9kL2ZlZWRiYWNrOmNyZWF0ZXByaXZhdGV0ZW1wbGF0ZSI7czoxOiIxIjtzOjMzOiJtb2QvZmVlZGJhY2s6Y3JlYXRlcHVibGljdGVtcGxhdGUiO3M6MToiMSI7czozMDoibW9kL2ZlZWRiYWNrOmRlbGV0ZXN1Ym1pc3Npb25zIjtzOjE6IjEiO3M6Mjc6Im1vZC9mZWVkYmFjazpkZWxldGV0ZW1wbGF0ZSI7czoxOiIxIjtzOjIyOiJtb2QvZmVlZGJhY2s6ZWRpdGl0ZW1zIjtzOjE6IjEiO3M6MjQ6Im1vZC9mZWVkYmFjazpyZWNlaXZlbWFpbCI7czoxOiIxIjtzOjE3OiJtb2QvZmVlZGJhY2s6dmlldyI7czoxOiIxIjtzOjI4OiJtb2QvZmVlZGJhY2s6dmlld2FuYWx5c2VwYWdlIjtzOjE6IjEiO3M6MjQ6Im1vZC9mZWVkYmFjazp2aWV3cmVwb3J0cyI7czoxOiIxIjtzOjIyOiJtb2QvZm9sZGVyOm1hbmFnZWZpbGVzIjtzOjE6IjEiO3M6MTc6Im1vZC9mb3J1bTphZGRuZXdzIjtzOjE6IjEiO3M6MjY6Im1vZC9mb3J1bTpjcmVhdGVhdHRhY2htZW50IjtzOjE6IjEiO3M6MjM6Im1vZC9mb3J1bTpkZWxldGVhbnlwb3N0IjtzOjE6IjEiO3M6MjM6Im1vZC9mb3J1bTpkZWxldGVvd25wb3N0IjtzOjE6IjEiO3M6MjE6Im1vZC9mb3J1bTplZGl0YW55cG9zdCI7czoxOiIxIjtzOjI2OiJtb2QvZm9ydW06ZXhwb3J0ZGlzY3Vzc2lvbiI7czoxOiIxIjtzOjIzOiJtb2QvZm9ydW06ZXhwb3J0b3ducG9zdCI7czoxOiIxIjtzOjIwOiJtb2QvZm9ydW06ZXhwb3J0cG9zdCI7czoxOiIxIjtzOjMwOiJtb2QvZm9ydW06aW5pdGlhbHN1YnNjcmlwdGlvbnMiO3M6MToiMSI7czoyOToibW9kL2ZvcnVtOm1hbmFnZXN1YnNjcmlwdGlvbnMiO3M6MToiMSI7czoyNToibW9kL2ZvcnVtOm1vdmVkaXNjdXNzaW9ucyI7czoxOiIxIjtzOjMxOiJtb2QvZm9ydW06cG9zdHdpdGhvdXR0aHJvdHRsaW5nIjtzOjE6IjEiO3M6MTQ6Im1vZC9mb3J1bTpyYXRlIjtzOjE6IjEiO3M6MTk6Im1vZC9mb3J1bTpyZXBseW5ld3MiO3M6MToiMSI7czoxOToibW9kL2ZvcnVtOnJlcGx5cG9zdCI7czoxOiIxIjtzOjI2OiJtb2QvZm9ydW06c3BsaXRkaXNjdXNzaW9ucyI7czoxOiIxIjtzOjI1OiJtb2QvZm9ydW06c3RhcnRkaXNjdXNzaW9uIjtzOjE6IjEiO3M6MjQ6Im1vZC9mb3J1bTp2aWV3YWxscmF0aW5ncyI7czoxOiIxIjtzOjIzOiJtb2QvZm9ydW06dmlld2FueXJhdGluZyI7czoxOiIxIjtzOjI0OiJtb2QvZm9ydW06dmlld2Rpc2N1c3Npb24iO3M6MToiMSI7czozMDoibW9kL2ZvcnVtOnZpZXdoaWRkZW50aW1lZHBvc3RzIjtzOjE6IjEiO3M6MzM6Im1vZC9mb3J1bTp2aWV3cWFuZGF3aXRob3V0cG9zdGluZyI7czoxOiIxIjtzOjIwOiJtb2QvZm9ydW06dmlld3JhdGluZyI7czoxOiIxIjtzOjI1OiJtb2QvZm9ydW06dmlld3N1YnNjcmliZXJzIjtzOjE6IjEiO3M6MjA6Im1vZC9nbG9zc2FyeTphcHByb3ZlIjtzOjE6IjEiO3M6MjA6Im1vZC9nbG9zc2FyeTpjb21tZW50IjtzOjE6IjEiO3M6MTk6Im1vZC9nbG9zc2FyeTpleHBvcnQiO3M6MToiMSI7czoyNDoibW9kL2dsb3NzYXJ5OmV4cG9ydGVudHJ5IjtzOjE6IjEiO3M6Mjc6Im1vZC9nbG9zc2FyeTpleHBvcnRvd25lbnRyeSI7czoxOiIxIjtzOjE5OiJtb2QvZ2xvc3Nhcnk6aW1wb3J0IjtzOjE6IjEiO3M6Mjk6Im1vZC9nbG9zc2FyeTptYW5hZ2VjYXRlZ29yaWVzIjtzOjE6IjEiO3M6Mjc6Im1vZC9nbG9zc2FyeTptYW5hZ2Vjb21tZW50cyI7czoxOiIxIjtzOjI2OiJtb2QvZ2xvc3Nhcnk6bWFuYWdlZW50cmllcyI7czoxOiIxIjtzOjE3OiJtb2QvZ2xvc3Nhcnk6cmF0ZSI7czoxOiIxIjtzOjI3OiJtb2QvZ2xvc3Nhcnk6dmlld2FsbHJhdGluZ3MiO3M6MToiMSI7czoyNjoibW9kL2dsb3NzYXJ5OnZpZXdhbnlyYXRpbmciO3M6MToiMSI7czoyMzoibW9kL2dsb3NzYXJ5OnZpZXdyYXRpbmciO3M6MToiMSI7czoxODoibW9kL2dsb3NzYXJ5OndyaXRlIjtzOjE6IjEiO3M6MTU6Im1vZC9sZXNzb246ZWRpdCI7czoxOiIxIjtzOjE3OiJtb2QvbGVzc29uOm1hbmFnZSI7czoxOiIxIjtzOjIzOiJtb2QvcXVpejpkZWxldGVhdHRlbXB0cyI7czoxOiIxIjtzOjE0OiJtb2QvcXVpejpncmFkZSI7czoxOiIxIjtzOjE1OiJtb2QvcXVpejptYW5hZ2UiO3M6MToiMSI7czoyNDoibW9kL3F1aXo6bWFuYWdlb3ZlcnJpZGVzIjtzOjE6IjEiO3M6MTY6Im1vZC9xdWl6OnByZXZpZXciO3M6MToiMSI7czoxNjoibW9kL3F1aXo6cmVncmFkZSI7czoxOiIxIjtzOjEzOiJtb2QvcXVpejp2aWV3IjtzOjE6IjEiO3M6MjA6Im1vZC9xdWl6OnZpZXdyZXBvcnRzIjtzOjE6IjEiO3M6MjU6Im1vZC9zY29ybTpkZWxldGVyZXNwb25zZXMiO3M6MToiMSI7czoxOToibW9kL3Njb3JtOnNhdmV0cmFjayI7czoxOiIxIjtzOjIwOiJtb2Qvc2Nvcm06dmlld3JlcG9ydCI7czoxOiIxIjtzOjIwOiJtb2Qvc2Nvcm06dmlld3Njb3JlcyI7czoxOiIxIjtzOjE5OiJtb2Qvc3VydmV5OmRvd25sb2FkIjtzOjE6IjEiO3M6MjI6Im1vZC9zdXJ2ZXk6cGFydGljaXBhdGUiO3M6MToiMSI7czoyNDoibW9kL3N1cnZleTpyZWFkcmVzcG9uc2VzIjtzOjE6IjEiO3M6MTk6Im1vZC93aWtpOmNyZWF0ZXBhZ2UiO3M6MToiMSI7czoyMDoibW9kL3dpa2k6ZWRpdGNvbW1lbnQiO3M6MToiMSI7czoxNzoibW9kL3dpa2k6ZWRpdHBhZ2UiO3M6MToiMSI7czoyMjoibW9kL3dpa2k6bWFuYWdlY29tbWVudCI7czoxOiIxIjtzOjIwOiJtb2Qvd2lraTptYW5hZ2VmaWxlcyI7czoxOiIxIjtzOjE5OiJtb2Qvd2lraTptYW5hZ2V3aWtpIjtzOjE6IjEiO3M6MjE6Im1vZC93aWtpOm92ZXJyaWRlbG9jayI7czoxOiIxIjtzOjIwOiJtb2Qvd2lraTp2aWV3Y29tbWVudCI7czoxOiIxIjtzOjE3OiJtb2Qvd2lraTp2aWV3cGFnZSI7czoxOiIxIjtzOjIxOiJtb2Qvd29ya3Nob3A6YWxsb2NhdGUiO3M6MToiMSI7czoyNzoibW9kL3dvcmtzaG9wOmVkaXRkaW1lbnNpb25zIjtzOjE6IjEiO3M6Mjg6Im1vZC93b3Jrc2hvcDppZ25vcmVkZWFkbGluZXMiO3M6MToiMSI7czoyNzoibW9kL3dvcmtzaG9wOm1hbmFnZWV4YW1wbGVzIjtzOjE6IjEiO3M6Mjc6Im1vZC93b3Jrc2hvcDpvdmVycmlkZWdyYWRlcyI7czoxOiIxIjtzOjMxOiJtb2Qvd29ya3Nob3A6cHVibGlzaHN1Ym1pc3Npb25zIjtzOjE6IjEiO3M6MjQ6Im1vZC93b3Jrc2hvcDpzd2l0Y2hwaGFzZSI7czoxOiIxIjtzOjE3OiJtb2Qvd29ya3Nob3A6dmlldyI7czoxOiIxIjtzOjMxOiJtb2Qvd29ya3Nob3A6dmlld2FsbGFzc2Vzc21lbnRzIjtzOjE6IjEiO3M6MzE6Im1vZC93b3Jrc2hvcDp2aWV3YWxsc3VibWlzc2lvbnMiO3M6MToiMSI7czoyODoibW9kL3dvcmtzaG9wOnZpZXdhdXRob3JuYW1lcyI7czoxOiIxIjtzOjMyOiJtb2Qvd29ya3Nob3A6dmlld2F1dGhvcnB1Ymxpc2hlZCI7czoxOiIxIjtzOjM3OiJtb2Qvd29ya3Nob3A6dmlld3B1Ymxpc2hlZHN1Ym1pc3Npb25zIjtzOjE6IjEiO3M6MzA6Im1vZC93b3Jrc2hvcDp2aWV3cmV2aWV3ZXJuYW1lcyI7czoxOiIxIjtzOjI4OiJtb29kbGUvYmFja3VwOmJhY2t1cGFjdGl2aXR5IjtzOjE6IjEiO3M6MjY6Im1vb2RsZS9iYWNrdXA6YmFja3VwY291cnNlIjtzOjE6IjEiO3M6Mjc6Im1vb2RsZS9iYWNrdXA6YmFja3Vwc2VjdGlvbiI7czoxOiIxIjtzOjI5OiJtb29kbGUvYmFja3VwOmJhY2t1cHRhcmdldGh1YiI7czoxOiIxIjtzOjMyOiJtb29kbGUvYmFja3VwOmJhY2t1cHRhcmdldGltcG9ydCI7czoxOiIxIjtzOjIzOiJtb29kbGUvYmFja3VwOmNvbmZpZ3VyZSI7czoxOiIxIjtzOjI2OiJtb29kbGUvYmFja3VwOmRvd25sb2FkZmlsZSI7czoxOiIxIjtzOjE3OiJtb29kbGUvYmxvY2s6ZWRpdCI7czoxOiIxIjtzOjE3OiJtb29kbGUvYmxvY2s6dmlldyI7czoxOiIxIjtzOjI3OiJtb29kbGUvYmxvZzphc3NvY2lhdGVjb3Vyc2UiO3M6MToiMSI7czoyNzoibW9vZGxlL2Jsb2c6YXNzb2NpYXRlbW9kdWxlIjtzOjE6IjEiO3M6MjU6Im1vb2RsZS9ibG9nOm1hbmFnZWVudHJpZXMiO3M6MToiMSI7czoyNjoibW9vZGxlL2Jsb2c6bWFuYWdlZXh0ZXJuYWwiO3M6MToiMSI7czoxODoibW9vZGxlL2Jsb2c6c2VhcmNoIjtzOjE6IjEiO3M6MTY6Im1vb2RsZS9ibG9nOnZpZXciO3M6MToiMSI7czoyOToibW9vZGxlL2NhbGVuZGFyOm1hbmFnZWVudHJpZXMiO3M6MToiMSI7czozNDoibW9vZGxlL2NhbGVuZGFyOm1hbmFnZWdyb3VwZW50cmllcyI7czoxOiIxIjtzOjE4OiJtb29kbGUvY29ob3J0OnZpZXciO3M6MToiMSI7czoyMToibW9vZGxlL2NvbW1lbnQ6ZGVsZXRlIjtzOjE6IjEiO3M6MTk6Im1vb2RsZS9jb21tZW50OnBvc3QiO3M6MToiMSI7czoxOToibW9vZGxlL2NvbW1lbnQ6dmlldyI7czoxOiIxIjtzOjIwOiJtb29kbGUvY29tbXVuaXR5OmFkZCI7czoxOiIxIjtzOjI1OiJtb29kbGUvY29tbXVuaXR5OmRvd25sb2FkIjtzOjE6IjEiO3M6MzI6Im1vb2RsZS9jb3Vyc2U6YWN0aXZpdHl2aXNpYmlsaXR5IjtzOjE6IjEiO3M6Mjc6Im1vb2RsZS9jb3Vyc2U6YnVsa21lc3NhZ2luZyI7czoxOiIxIjtzOjI4OiJtb29kbGUvY291cnNlOmNoYW5nZWNhdGVnb3J5IjtzOjE6IjEiO3M6Mjg6Im1vb2RsZS9jb3Vyc2U6Y2hhbmdlZnVsbG5hbWUiO3M6MToiMSI7czoyODoibW9vZGxlL2NvdXJzZTpjaGFuZ2VpZG51bWJlciI7czoxOiIxIjtzOjI5OiJtb29kbGUvY291cnNlOmNoYW5nZXNob3J0bmFtZSI7czoxOiIxIjtzOjI3OiJtb29kbGUvY291cnNlOmNoYW5nZXN1bW1hcnkiO3M6MToiMSI7czoyNToibW9vZGxlL2NvdXJzZTplbnJvbGNvbmZpZyI7czoxOiIxIjtzOjI1OiJtb29kbGUvY291cnNlOmVucm9scmV2aWV3IjtzOjE6IjEiO3M6MzA6Im1vb2RsZS9jb3Vyc2U6bWFuYWdlYWN0aXZpdGllcyI7czoxOiIxIjtzOjI1OiJtb29kbGUvY291cnNlOm1hbmFnZWZpbGVzIjtzOjE6IjEiO3M6MjY6Im1vb2RsZS9jb3Vyc2U6bWFuYWdlZ3JvdXBzIjtzOjE6IjEiO3M6MjY6Im1vb2RsZS9jb3Vyc2U6bWFuYWdlc2NhbGVzIjtzOjE6IjEiO3M6MjY6Im1vb2RsZS9jb3Vyc2U6bWFya2NvbXBsZXRlIjtzOjE6IjEiO3M6MTk6Im1vb2RsZS9jb3Vyc2U6cmVzZXQiO3M6MToiMSI7czozMToibW9vZGxlL2NvdXJzZTpzZWN0aW9udmlzaWJpbGl0eSI7czoxOiIxIjtzOjMxOiJtb29kbGUvY291cnNlOnNldGN1cnJlbnRzZWN0aW9uIjtzOjE6IjEiO3M6MjA6Im1vb2RsZS9jb3Vyc2U6dXBkYXRlIjtzOjE6IjEiO3M6MjM6Im1vb2RsZS9jb3Vyc2U6dXNlcmVtYWlsIjtzOjE6IjEiO3M6MzQ6Im1vb2RsZS9jb3Vyc2U6dmlld2hpZGRlbmFjdGl2aXRpZXMiO3M6MToiMSI7czozMToibW9vZGxlL2NvdXJzZTp2aWV3aGlkZGVuY291cnNlcyI7czoxOiIxIjtzOjMyOiJtb29kbGUvY291cnNlOnZpZXdoaWRkZW5zZWN0aW9ucyI7czoxOiIxIjtzOjM0OiJtb29kbGUvY291cnNlOnZpZXdoaWRkZW51c2VyZmllbGRzIjtzOjE6IjEiO3M6MzA6Im1vb2RsZS9jb3Vyc2U6dmlld3BhcnRpY2lwYW50cyI7czoxOiIxIjtzOjI0OiJtb29kbGUvY291cnNlOnZpZXdzY2FsZXMiO3M6MToiMSI7czoyNDoibW9vZGxlL2NvdXJzZTp2aXNpYmlsaXR5IjtzOjE6IjEiO3M6MjA6Im1vb2RsZS9maWx0ZXI6bWFuYWdlIjtzOjE6IjEiO3M6MTc6Im1vb2RsZS9ncmFkZTplZGl0IjtzOjE6IjEiO3M6MTk6Im1vb2RsZS9ncmFkZTpleHBvcnQiO3M6MToiMSI7czoxNzoibW9vZGxlL2dyYWRlOmhpZGUiO3M6MToiMSI7czoxOToibW9vZGxlL2dyYWRlOmltcG9ydCI7czoxOiIxIjtzOjE3OiJtb29kbGUvZ3JhZGU6bG9jayI7czoxOiIxIjtzOjE5OiJtb29kbGUvZ3JhZGU6bWFuYWdlIjtzOjE6IjEiO3M6MjY6Im1vb2RsZS9ncmFkZTptYW5hZ2VsZXR0ZXJzIjtzOjE6IjEiO3M6Mjc6Im1vb2RsZS9ncmFkZTptYW5hZ2VvdXRjb21lcyI7czoxOiIxIjtzOjE5OiJtb29kbGUvZ3JhZGU6dW5sb2NrIjtzOjE6IjEiO3M6MjA6Im1vb2RsZS9ncmFkZTp2aWV3YWxsIjtzOjE6IjEiO3M6MjM6Im1vb2RsZS9ncmFkZTp2aWV3aGlkZGVuIjtzOjE6IjEiO3M6MTk6Im1vb2RsZS9ub3RlczptYW5hZ2UiO3M6MToiMSI7czoxNzoibW9vZGxlL25vdGVzOnZpZXciO3M6MToiMSI7czoyMzoibW9vZGxlL3BvcnRmb2xpbzpleHBvcnQiO3M6MToiMSI7czoxOToibW9vZGxlL3F1ZXN0aW9uOmFkZCI7czoxOiIxIjtzOjIzOiJtb29kbGUvcXVlc3Rpb246ZWRpdGFsbCI7czoxOiIxIjtzOjI0OiJtb29kbGUvcXVlc3Rpb246ZWRpdG1pbmUiO3M6MToiMSI7czoyMDoibW9vZGxlL3F1ZXN0aW9uOmZsYWciO3M6MToiMSI7czozMDoibW9vZGxlL3F1ZXN0aW9uOm1hbmFnZWNhdGVnb3J5IjtzOjE6IjEiO3M6MjM6Im1vb2RsZS9xdWVzdGlvbjptb3ZlYWxsIjtzOjE6IjEiO3M6MjQ6Im1vb2RsZS9xdWVzdGlvbjptb3ZlbWluZSI7czoxOiIxIjtzOjIyOiJtb29kbGUvcXVlc3Rpb246dXNlYWxsIjtzOjE6IjEiO3M6MjM6Im1vb2RsZS9xdWVzdGlvbjp1c2VtaW5lIjtzOjE6IjEiO3M6MjM6Im1vb2RsZS9xdWVzdGlvbjp2aWV3YWxsIjtzOjE6IjEiO3M6MjQ6Im1vb2RsZS9xdWVzdGlvbjp2aWV3bWluZSI7czoxOiIxIjtzOjE4OiJtb29kbGUvcmF0aW5nOnJhdGUiO3M6MToiMSI7czoxODoibW9vZGxlL3JhdGluZzp2aWV3IjtzOjE6IjEiO3M6MjE6Im1vb2RsZS9yYXRpbmc6dmlld2FsbCI7czoxOiIxIjtzOjIxOiJtb29kbGUvcmF0aW5nOnZpZXdhbnkiO3M6MToiMSI7czoyNDoibW9vZGxlL3Jlc3RvcmU6Y29uZmlndXJlIjtzOjE6IjEiO3M6MzA6Im1vb2RsZS9yZXN0b3JlOnJlc3RvcmVhY3Rpdml0eSI7czoxOiIxIjtzOjI4OiJtb29kbGUvcmVzdG9yZTpyZXN0b3JlY291cnNlIjtzOjE6IjEiO3M6Mjk6Im1vb2RsZS9yZXN0b3JlOnJlc3RvcmVzZWN0aW9uIjtzOjE6IjEiO3M6MzE6Im1vb2RsZS9yZXN0b3JlOnJlc3RvcmV0YXJnZXRodWIiO3M6MToiMSI7czozNDoibW9vZGxlL3Jlc3RvcmU6cmVzdG9yZXRhcmdldGltcG9ydCI7czoxOiIxIjtzOjI1OiJtb29kbGUvcmVzdG9yZTp1cGxvYWRmaWxlIjtzOjE6IjEiO3M6MTg6Im1vb2RsZS9yb2xlOmFzc2lnbiI7czoxOiIxIjtzOjE4OiJtb29kbGUvcm9sZTpyZXZpZXciO3M6MToiMSI7czoyNDoibW9vZGxlL3JvbGU6c2FmZW92ZXJyaWRlIjtzOjE6IjEiO3M6MjM6Im1vb2RsZS9yb2xlOnN3aXRjaHJvbGVzIjtzOjE6IjEiO3M6Mjc6Im1vb2RsZS9zaXRlOmFjY2Vzc2FsbGdyb3VwcyI7czoxOiIxIjtzOjIwOiJtb29kbGUvc2l0ZTpkb2NsaW5rcyI7czoxOiIxIjtzOjI0OiJtb29kbGUvc2l0ZTptYW5hZ2VibG9ja3MiO3M6MToiMSI7czoyNzoibW9vZGxlL3NpdGU6cmVhZGFsbG1lc3NhZ2VzIjtzOjE6IjEiO3M6MjQ6Im1vb2RsZS9zaXRlOnRydXN0Y29udGVudCI7czoxOiIxIjtzOjI1OiJtb29kbGUvc2l0ZTp2aWV3ZnVsbG5hbWVzIjtzOjE6IjEiO3M6MjM6Im1vb2RsZS9zaXRlOnZpZXdyZXBvcnRzIjtzOjE6IjEiO3M6MjE6Im1vb2RsZS90YWc6ZWRpdGJsb2NrcyI7czoxOiIxIjtzOjE3OiJtb29kbGUvdGFnOm1hbmFnZSI7czoxOiIxIjtzOjI1OiJtb29kbGUvdXNlcjpyZWFkdXNlcmJsb2dzIjtzOjE6IjEiO3M6MjU6Im1vb2RsZS91c2VyOnJlYWR1c2VycG9zdHMiO3M6MToiMSI7czoyMzoibW9vZGxlL3VzZXI6dmlld2RldGFpbHMiO3M6MToiMSI7czoyOToibW9vZGxlL3VzZXI6dmlld2hpZGRlbmRldGFpbHMiO3M6MToiMSI7czoyNToicXVpei9ncmFkaW5nOnZpZXdpZG51bWJlciI7czoxOiIxIjtzOjI5OiJxdWl6L2dyYWRpbmc6dmlld3N0dWRlbnRuYW1lcyI7czoxOiIxIjtzOjIwOiJxdWl6L3N0YXRpc3RpY3M6dmlldyI7czoxOiIxIjtzOjI2OiJyZXBvcnQvY291cnNlb3ZlcnZpZXc6dmlldyI7czoxOiIxIjt9czo0OiIvMTo3IjthOjUxOntzOjI2OiJyZXBvc2l0b3J5L2ZpbGVzeXN0ZW06dmlldyI7czoxOiIxIjtzOjE5OiJtb29kbGUvY29tbWVudDp2aWV3IjtzOjE6IjEiO3M6Mjk6InJlcG9zaXRvcnkvZmxpY2tyX3B1YmxpYzp2aWV3IjtzOjE6IjEiO3M6MjE6Im1vb2RsZS9jb3Vyc2U6cmVxdWVzdCI7czoxOiIxIjtzOjIyOiJyZXBvc2l0b3J5L2ZsaWNrcjp2aWV3IjtzOjE6IjEiO3M6MjI6Im1vb2RsZS9teTptYW5hZ2VibG9ja3MiO3M6MToiMSI7czoyNjoicmVwb3NpdG9yeS9nb29nbGVkb2NzOnZpZXciO3M6MToiMSI7czoyMzoibW9vZGxlL3BvcnRmb2xpbzpleHBvcnQiO3M6MToiMSI7czoyMToicmVwb3NpdG9yeS9sb2NhbDp2aWV3IjtzOjE6IjEiO3M6MTg6Im1vb2RsZS9yYXRpbmc6cmF0ZSI7czoxOiIxIjtzOjIyOiJyZXBvc2l0b3J5L21lcmxvdDp2aWV3IjtzOjE6IjEiO3M6MTg6Im1vb2RsZS9yYXRpbmc6dmlldyI7czoxOiIxIjtzOjIyOiJyZXBvc2l0b3J5L3BpY2FzYTp2aWV3IjtzOjE6IjEiO3M6MjE6Im1vb2RsZS9yYXRpbmc6dmlld2FsbCI7czoxOiIxIjtzOjI3OiJibG9jay9vbmxpbmVfdXNlcnM6dmlld2xpc3QiO3M6MToiMSI7czoyMjoicmVwb3NpdG9yeS9yZWNlbnQ6dmlldyI7czoxOiIxIjtzOjIxOiJtb29kbGUvcmF0aW5nOnZpZXdhbnkiO3M6MToiMSI7czoxNToibW9kL2ZvbGRlcjp2aWV3IjtzOjE6IjEiO3M6MTg6InJlcG9zaXRvcnkvczM6dmlldyI7czoxOiIxIjtzOjIzOiJtb29kbGUvc2l0ZTpzZW5kbWVzc2FnZSI7czoxOiIxIjtzOjE0OiJtb2QvaW1zY3A6dmlldyI7czoxOiIxIjtzOjIyOiJyZXBvc2l0b3J5L3VwbG9hZDp2aWV3IjtzOjE6IjEiO3M6MTc6Im1vb2RsZS90YWc6Y3JlYXRlIjtzOjE6IjEiO3M6MTM6Im1vZC9wYWdlOnZpZXciO3M6MToiMSI7czoxOToicmVwb3NpdG9yeS91cmw6dmlldyI7czoxOiIxIjtzOjE1OiJtb29kbGUvdGFnOmVkaXQiO3M6MToiMSI7czoxNzoibW9kL3Jlc291cmNlOnZpZXciO3M6MToiMSI7czoyMDoicmVwb3NpdG9yeS91c2VyOnZpZXciO3M6MToiMSI7czoyOToibW9vZGxlL3VzZXI6Y2hhbmdlb3ducGFzc3dvcmQiO3M6MToiMSI7czoxMjoibW9kL3VybDp2aWV3IjtzOjE6IjEiO3M6MjI6InJlcG9zaXRvcnkvd2ViZGF2OnZpZXciO3M6MToiMSI7czozMzoibW9vZGxlL3VzZXI6ZWRpdG93bm1lc3NhZ2Vwcm9maWxlIjtzOjE6IjEiO3M6MTc6Im1vb2RsZS9ibG9jazp2aWV3IjtzOjE6IjEiO3M6MjU6InJlcG9zaXRvcnkvd2lraW1lZGlhOnZpZXciO3M6MToiMSI7czoyNjoibW9vZGxlL3VzZXI6ZWRpdG93bnByb2ZpbGUiO3M6MToiMSI7czoyNzoibW9vZGxlL2Jsb2c6YXNzb2NpYXRlY291cnNlIjtzOjE6IjEiO3M6MjM6InJlcG9zaXRvcnkveW91dHViZTp2aWV3IjtzOjE6IjEiO3M6Mjc6Im1vb2RsZS91c2VyOm1hbmFnZW93bmJsb2NrcyI7czoxOiIxIjtzOjI3OiJtb29kbGUvYmxvZzphc3NvY2lhdGVtb2R1bGUiO3M6MToiMSI7czoyNjoibW9vZGxlL3VzZXI6bWFuYWdlb3duZmlsZXMiO3M6MToiMSI7czoxODoibW9vZGxlL2Jsb2c6Y3JlYXRlIjtzOjE6IjEiO3M6MzU6Im1vb2RsZS93ZWJzZXJ2aWNlOmNyZWF0ZW1vYmlsZXRva2VuIjtzOjE6IjEiO3M6MjY6Im1vb2RsZS9ibG9nOm1hbmFnZWV4dGVybmFsIjtzOjE6IjEiO3M6MjQ6InJlcG9zaXRvcnkvYWxmcmVzY286dmlldyI7czoxOiIxIjtzOjE4OiJtb29kbGUvYmxvZzpzZWFyY2giO3M6MToiMSI7czoyMjoicmVwb3NpdG9yeS9ib3huZXQ6dmlldyI7czoxOiIxIjtzOjE2OiJtb29kbGUvYmxvZzp2aWV3IjtzOjE6IjEiO3M6Mjc6InJlcG9zaXRvcnkvY291cnNlZmlsZXM6dmlldyI7czoxOiIxIjtzOjMyOiJtb29kbGUvY2FsZW5kYXI6bWFuYWdlb3duZW50cmllcyI7czoxOiIxIjtzOjIzOiJyZXBvc2l0b3J5L2Ryb3Bib3g6dmlldyI7czoxOiIxIjtzOjE5OiJtb29kbGUvY29tbWVudDpwb3N0IjtzOjE6IjEiO31zOjY6Ii8xLzc6MyI7YToyOntzOjE3OiJtb29kbGUvYmxvY2s6ZWRpdCI7czoyOiItMSI7czoxNzoibW9vZGxlL2Jsb2NrOnZpZXciO3M6MjoiLTEiO31zOjY6Ii8xLzc6NyI7YToxOntzOjE3OiJtb29kbGUvYmxvY2s6dmlldyI7czoyOiItMSI7fXM6ODoiLzEvMi80OjMiO2E6Mjp7czoxNzoibW9vZGxlL2Jsb2NrOmVkaXQiO3M6MjoiLTEiO3M6MTc6Im1vb2RsZS9ibG9jazp2aWV3IjtzOjI6Ii0xIjt9czo4OiIvMS8yLzQ6NyI7YToxOntzOjE3OiJtb29kbGUvYmxvY2s6dmlldyI7czoyOiItMSI7fXM6OToiLzEvMi8zNzozIjthOjE6e3M6MTc6Im1vb2RsZS9ibG9jazplZGl0IjtzOjI6Ii0xIjt9czo5OiIvMS8yLzM3OjciO2E6MTp7czoxNzoibW9vZGxlL2Jsb2NrOnZpZXciO3M6MjoiLTEiO31zOjk6Ii8xLzIvMzY6MyI7YToyOntzOjE3OiJtb29kbGUvYmxvY2s6dmlldyI7czoyOiItMSI7czoxNzoibW9vZGxlL2Jsb2NrOmVkaXQiO3M6MjoiLTEiO31zOjk6Ii8xLzIvMzY6NyI7YToxOntzOjE3OiJtb29kbGUvYmxvY2s6dmlldyI7czoyOiItMSI7fXM6OToiLzEvMi8zNTozIjthOjI6e3M6MTc6Im1vb2RsZS9ibG9jazplZGl0IjtzOjI6Ii0xIjtzOjE3OiJtb29kbGUvYmxvY2s6dmlldyI7czo1OiItMTAwMCI7fXM6OToiLzEvMi8zNDozIjthOjI6e3M6MTc6Im1vb2RsZS9ibG9jazp2aWV3IjtzOjI6Ii0xIjtzOjE3OiJtb29kbGUvYmxvY2s6ZWRpdCI7czoyOiItMSI7fXM6OToiLzEvMi8zNDo3IjthOjE6e3M6MTc6Im1vb2RsZS9ibG9jazp2aWV3IjtzOjI6Ii0xIjt9czo5OiIvMS8yLzE3OjMiO2E6MjY6e3M6MjM6Im1vZC9mb3J1bTpleHBvcnRvd25wb3N0IjtzOjI6Ii0xIjtzOjIwOiJtb2QvZm9ydW06ZXhwb3J0cG9zdCI7czoyOiItMSI7czoyNToibW9kL2ZvcnVtOnZpZXdzdWJzY3JpYmVycyI7czoyOiItMSI7czozMDoibW9kL2ZvcnVtOmluaXRpYWxzdWJzY3JpcHRpb25zIjtzOjI6Ii0xIjtzOjIwOiJtb2QvZm9ydW06dmlld3JhdGluZyI7czoyOiItMSI7czoyOToibW9kL2ZvcnVtOm1hbmFnZXN1YnNjcmlwdGlvbnMiO3M6MjoiLTEiO3M6MzA6Im1vZC9mb3J1bTp2aWV3aGlkZGVudGltZWRwb3N0cyI7czoyOiItMSI7czoyNToibW9kL2ZvcnVtOm1vdmVkaXNjdXNzaW9ucyI7czoyOiItMSI7czozMzoibW9kL2ZvcnVtOnZpZXdxYW5kYXdpdGhvdXRwb3N0aW5nIjtzOjI6Ii0xIjtzOjI2OiJtb2QvZm9ydW06c3BsaXRkaXNjdXNzaW9ucyI7czoyOiItMSI7czozNDoibW9vZGxlL2NvdXJzZTp2aWV3aGlkZGVuYWN0aXZpdGllcyI7czoyOiItMSI7czozMToibW9kL2ZvcnVtOnBvc3R3aXRob3V0dGhyb3R0bGluZyI7czoyOiItMSI7czoxNzoibW9kL2ZvcnVtOmFkZG5ld3MiO3M6MjoiLTEiO3M6MTQ6Im1vZC9mb3J1bTpyYXRlIjtzOjI6Ii0xIjtzOjE4OiJtb29kbGUvcmF0aW5nOnJhdGUiO3M6MjoiLTEiO3M6MjY6Im1vZC9mb3J1bTpjcmVhdGVhdHRhY2htZW50IjtzOjI6Ii0xIjtzOjE5OiJtb2QvZm9ydW06cmVwbHluZXdzIjtzOjI6Ii0xIjtzOjIzOiJtb2QvZm9ydW06ZGVsZXRlYW55cG9zdCI7czoyOiItMSI7czoxOToibW9kL2ZvcnVtOnJlcGx5cG9zdCI7czoyOiItMSI7czoxODoibW9vZGxlL3JhdGluZzp2aWV3IjtzOjI6Ii0xIjtzOjIzOiJtb2QvZm9ydW06ZGVsZXRlb3ducG9zdCI7czoyOiItMSI7czoyNToibW9kL2ZvcnVtOnN0YXJ0ZGlzY3Vzc2lvbiI7czoyOiItMSI7czoyMToibW9kL2ZvcnVtOmVkaXRhbnlwb3N0IjtzOjI6Ii0xIjtzOjI0OiJtb2QvZm9ydW06dmlld2FsbHJhdGluZ3MiO3M6MjoiLTEiO3M6MjY6Im1vZC9mb3J1bTpleHBvcnRkaXNjdXNzaW9uIjtzOjI6Ii0xIjtzOjIzOiJtb2QvZm9ydW06dmlld2FueXJhdGluZyI7czoyOiItMSI7fXM6OToiLzEvMi8xNzo3IjthOjM6e3M6MjQ6Im1vZC9mb3J1bTp2aWV3ZGlzY3Vzc2lvbiI7czoxOiIxIjtzOjE4OiJtb29kbGUvcmF0aW5nOnJhdGUiO3M6MjoiLTEiO3M6MTg6Im1vb2RsZS9yYXRpbmc6dmlldyI7czoyOiItMSI7fXM6OToiLzEvMi8xNTozIjthOjI6e3M6MTc6Im1vb2RsZS9ibG9jazplZGl0IjtzOjI6Ii0xIjtzOjE3OiJtb29kbGUvYmxvY2s6dmlldyI7czoyOiItMSI7fXM6OToiLzEvMi8xNTo3IjthOjE6e3M6MTc6Im1vb2RsZS9ibG9jazp2aWV3IjtzOjI6Ii0xIjt9czo2OiIvMS84OjMiO2E6Mjp7czoxNzoibW9vZGxlL2Jsb2NrOmVkaXQiO3M6MjoiLTEiO3M6MTc6Im1vb2RsZS9ibG9jazp2aWV3IjtzOjI6Ii0xIjt9czo2OiIvMS84OjciO2E6MTp7czoxNzoibW9vZGxlL2Jsb2NrOnZpZXciO3M6MjoiLTEiO319czo2OiJsb2FkZWQiO2E6NDp7aTowO3M6NDoiLzEvNyI7aToxO3M6NDoiLzEvMiI7aToyO3M6NDoiLzEvOCI7aTozO3M6ODoiLzEvMjMvNDYiO31zOjI6ImRyIjtzOjE6IjciO3M6NDoidGltZSI7aToxMzE3ODQ2MjgxO31zOjc6ImVkaXRpbmciO2k6MDt9', 1317846150, 1317851199, '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `mdl_sessions` (`id`, `state`, `sid`, `userid`, `sessdata`, `timecreated`, `timemodified`, `firstip`, `lastip`) VALUES
(227, 0, 'i828m75faajdl1r670t4qitco6', 2, 'U0VTU0lPTnxPOjg6InN0ZENsYXNzIjo4OntzOjEwOiJsb2dpbmNvdW50IjtpOjA7czoyMjoiYWRtaW5fY3JpdGljYWxfd2FybmluZyI7aTowO3M6MjE6ImxvYWRfbmF2aWdhdGlvbl9hZG1pbiI7YjoxO3M6MTI6ImZsYXNodmVyc2lvbiI7czo2OiIxMS4wLjEiO3M6NzoiZnJvbXVybCI7czo0MzoiaHR0cDovL2xvY2FsaG9zdC9tb2QvZm9ydW0vcG9zdC5waHA/Zm9ydW09NSI7czoxNDoiZnJvbWRpc2N1c3Npb24iO3M6MTY6Imh0dHA6Ly9sb2NhbGhvc3QiO3M6OToiZmxleHRhYmxlIjthOjE6e3M6MzM6ImxvY2FscGx1Z2luc19hZG1pbmlzdHJhdGlvbl90YWJsZSI7Tzo4OiJzdGRDbGFzcyI6NTp7czo4OiJ1bmlxdWVpZCI7czozMzoibG9jYWxwbHVnaW5zX2FkbWluaXN0cmF0aW9uX3RhYmxlIjtzOjg6ImNvbGxhcHNlIjthOjA6e31zOjY6InNvcnRieSI7YTowOnt9czo3OiJpX2ZpcnN0IjtzOjA6IiI7czo2OiJpX2xhc3QiO3M6MDoiIjt9fXM6ODoibmF2Y2FjaGUiO086ODoic3RkQ2xhc3MiOjE6e3M6MTA6Im5hdmlnYXRpb24iO2E6MTp7czoxNzoiY29udGV4dGhhc3JlcG9zMTMiO2E6Mzp7aTowO2k6MTMxNzkzNzg4NTtpOjE7czoxOiIyIjtpOjI7czo0OiJiOjA7Ijt9fX19VVNFUnxPOjg6InN0ZENsYXNzIjo2MTp7czoyOiJpZCI7czoxOiIyIjtzOjQ6ImF1dGgiO3M6NjoibWFudWFsIjtzOjk6ImNvbmZpcm1lZCI7czoxOiIxIjtzOjEyOiJwb2xpY3lhZ3JlZWQiO3M6MToiMCI7czo3OiJkZWxldGVkIjtzOjE6IjAiO3M6OToic3VzcGVuZGVkIjtzOjE6IjAiO3M6MTA6Im1uZXRob3N0aWQiO3M6MToiMSI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo4OiJwYXNzd29yZCI7czozMjoiZTZkMGEyOThlMGUwNDU0NWM5MGY0ZmUyODcyMDViZDEiO3M6ODoiaWRudW1iZXIiO3M6MDoiIjtzOjk6ImZpcnN0bmFtZSI7czo1OiJhZG1pbiI7czo4OiJsYXN0bmFtZSI7czo3OiJVc3VhcmlvIjtzOjU6ImVtYWlsIjtzOjQ4OiJ0YWxsZXJkZXByb2dyYW1hY2lvbmlpZml1YmEyMDExQGdvb2dsZWdyb3Vwcy5jb20iO3M6OToiZW1haWxzdG9wIjtzOjE6IjAiO3M6MzoiaWNxIjtzOjA6IiI7czo1OiJza3lwZSI7czowOiIiO3M6NToieWFob28iO3M6MDoiIjtzOjM6ImFpbSI7czowOiIiO3M6MzoibXNuIjtzOjA6IiI7czo2OiJwaG9uZTEiO3M6MDoiIjtzOjY6InBob25lMiI7czowOiIiO3M6MTE6Imluc3RpdHV0aW9uIjtzOjA6IiI7czoxMDoiZGVwYXJ0bWVudCI7czowOiIiO3M6NzoiYWRkcmVzcyI7czowOiIiO3M6NDoiY2l0eSI7czoxMjoiQnVlbm9zIEFpcmVzIjtzOjc6ImNvdW50cnkiO3M6MjoiQVIiO3M6NDoibGFuZyI7czo1OiJlc19hciI7czo1OiJ0aGVtZSI7czowOiIiO3M6ODoidGltZXpvbmUiO3M6MjoiOTkiO3M6MTE6ImZpcnN0YWNjZXNzIjtzOjEwOiIxMzE2NTY3NTAzIjtzOjEwOiJsYXN0YWNjZXNzIjtpOjEzMTc5Mzc4ODE7czo5OiJsYXN0bG9naW4iO3M6MTA6IjEzMTc5MzQ3MTUiO3M6MTI6ImN1cnJlbnRsb2dpbiI7aToxMzE3OTM2Njg0O3M6NjoibGFzdGlwIjtzOjE1OiIwOjA6MDowOjA6MDowOjEiO3M6Njoic2VjcmV0IjtzOjA6IiI7czo3OiJwaWN0dXJlIjtzOjE6IjAiO3M6MzoidXJsIjtzOjA6IiI7czoxNzoiZGVzY3JpcHRpb25mb3JtYXQiO3M6MToiMCI7czoxMDoibWFpbGZvcm1hdCI7czoxOiIxIjtzOjEwOiJtYWlsZGlnZXN0IjtzOjE6IjAiO3M6MTE6Im1haWxkaXNwbGF5IjtzOjE6IjEiO3M6MTA6Imh0bWxlZGl0b3IiO3M6MToiMSI7czo0OiJhamF4IjtzOjE6IjEiO3M6MTM6ImF1dG9zdWJzY3JpYmUiO3M6MToiMSI7czoxMToidHJhY2tmb3J1bXMiO3M6MToiMCI7czoxMToidGltZWNyZWF0ZWQiO3M6MToiMCI7czoxMjoidGltZW1vZGlmaWVkIjtzOjEwOiIxMzE2NTY3NTAzIjtzOjEyOiJ0cnVzdGJpdG1hc2siO3M6MToiMCI7czo4OiJpbWFnZWFsdCI7TjtzOjEyOiJzY3JlZW5yZWFkZXIiO3M6MToiMSI7czoxNjoibGFzdGNvdXJzZWFjY2VzcyI7YTozOntpOjI7czoxMDoiMTMxNzg0ODQyOSI7aTozO3M6MTA6IjEzMTczOTc2NDAiO2k6NDtzOjEwOiIxMzE3OTMzMDQ2Ijt9czoxOToiY3VycmVudGNvdXJzZWFjY2VzcyI7YToxOntpOjQ7aToxMzE3OTM2NzA3O31zOjExOiJncm91cG1lbWJlciI7YTowOnt9czo3OiJwcm9maWxlIjthOjM6e3M6MzoiZG5pIjtzOjA6IiI7czo2OiJwYWRyb24iO3M6MDoiIjtzOjEzOiJyb2xzb2xpY2l0YWRvIjtzOjc6Ik1pZW1icm8iO31zOjc6InNlc3NrZXkiO3M6MTA6IjZ3TFJvbUd1c0UiO3M6MTA6InByZWZlcmVuY2UiO2E6OTp7czoyMzoiZGVmaW5lcm9sZV9zaG93YWR2YW5jZWQiO3M6MDoiIjtzOjI0OiJkb2NrZWRfYmxvY2tfaW5zdGFuY2VfMTAiO3M6MToiMCI7czoyMzoiZG9ja2VkX2Jsb2NrX2luc3RhbmNlXzUiO3M6MToiMCI7czoxODoiZW1haWxfYm91bmNlX2NvdW50IjtzOjE6IjEiO3M6MTY6ImVtYWlsX3NlbmRfY291bnQiO3M6MToiMSI7czoyOToidXNlcnNlbGVjdG9yX2F1dG9zZWxlY3R1bmlxdWUiO3M6MToiMCI7czoyOToidXNlcnNlbGVjdG9yX3ByZXNlcnZlc2VsZWN0ZWQiO3M6MToiMCI7czoyNzoidXNlcnNlbGVjdG9yX3NlYXJjaGFueXdoZXJlIjtzOjE6IjAiO3M6MTE6Il9sYXN0bG9hZGVkIjtpOjEzMTc5Mzc4ODQ7fXM6MTc6Im1lc3NhZ2VfbGFzdHBvcHVwIjtpOjA7czo3OiJkaXNwbGF5IjthOjE6e2k6MTtpOjA7fXM6MjU6ImFqYXhfdXBkYXRhYmxlX3VzZXJfcHJlZnMiO2E6MTM6e3M6MjM6ImRvY2tlZF9ibG9ja19pbnN0YW5jZV80IjtzOjM6ImludCI7czoyMzoiZG9ja2VkX2Jsb2NrX2luc3RhbmNlXzUiO3M6MzoiaW50IjtzOjEzOiJibG9jazEwaGlkZGVuIjtzOjQ6ImJvb2wiO3M6MTM6ImJsb2NrMTdoaWRkZW4iO3M6NDoiYm9vbCI7czoxMzoiYmxvY2sxOGhpZGRlbiI7czo0OiJib29sIjtzOjEzOiJibG9jazE2aGlkZGVuIjtzOjQ6ImJvb2wiO3M6MTM6ImJsb2NrMTloaWRkZW4iO3M6NDoiYm9vbCI7czoxMjoiYmxvY2sxaGlkZGVuIjtzOjQ6ImJvb2wiO3M6MTI6ImJsb2NrNGhpZGRlbiI7czo0OiJib29sIjtzOjEzOiJibG9jazE1aGlkZGVuIjtzOjQ6ImJvb2wiO3M6MTI6ImJsb2NrNWhpZGRlbiI7czo0OiJib29sIjtzOjEzOiJibG9jazI1aGlkZGVuIjtzOjQ6ImJvb2wiO3M6MTI6ImJsb2NrNmhpZGRlbiI7czo0OiJib29sIjt9czo3OiJlZGl0aW5nIjtpOjE7czo2OiJhY2Nlc3MiO2E6NTp7czoyOiJyYSI7YToxOntzOjI6Ii8xIjthOjE6e2k6NztzOjE6IjciO319czo0OiJyZGVmIjthOjE6e3M6NDoiLzE6NyI7YTo1MTp7czoyMzoicmVwb3NpdG9yeS9kcm9wYm94OnZpZXciO3M6MToiMSI7czoxOToibW9vZGxlL2NvbW1lbnQ6cG9zdCI7czoxOiIxIjtzOjI2OiJyZXBvc2l0b3J5L2ZpbGVzeXN0ZW06dmlldyI7czoxOiIxIjtzOjE5OiJtb29kbGUvY29tbWVudDp2aWV3IjtzOjE6IjEiO3M6Mjk6InJlcG9zaXRvcnkvZmxpY2tyX3B1YmxpYzp2aWV3IjtzOjE6IjEiO3M6MjE6Im1vb2RsZS9jb3Vyc2U6cmVxdWVzdCI7czoxOiIxIjtzOjIyOiJyZXBvc2l0b3J5L2ZsaWNrcjp2aWV3IjtzOjE6IjEiO3M6MjI6Im1vb2RsZS9teTptYW5hZ2VibG9ja3MiO3M6MToiMSI7czoyNjoicmVwb3NpdG9yeS9nb29nbGVkb2NzOnZpZXciO3M6MToiMSI7czoyMzoibW9vZGxlL3BvcnRmb2xpbzpleHBvcnQiO3M6MToiMSI7czoyMToicmVwb3NpdG9yeS9sb2NhbDp2aWV3IjtzOjE6IjEiO3M6MTg6Im1vb2RsZS9yYXRpbmc6cmF0ZSI7czoxOiIxIjtzOjIyOiJyZXBvc2l0b3J5L21lcmxvdDp2aWV3IjtzOjE6IjEiO3M6MTg6Im1vb2RsZS9yYXRpbmc6dmlldyI7czoxOiIxIjtzOjIyOiJyZXBvc2l0b3J5L3BpY2FzYTp2aWV3IjtzOjE6IjEiO3M6MjE6Im1vb2RsZS9yYXRpbmc6dmlld2FsbCI7czoxOiIxIjtzOjI3OiJibG9jay9vbmxpbmVfdXNlcnM6dmlld2xpc3QiO3M6MToiMSI7czoyMjoicmVwb3NpdG9yeS9yZWNlbnQ6dmlldyI7czoxOiIxIjtzOjIxOiJtb29kbGUvcmF0aW5nOnZpZXdhbnkiO3M6MToiMSI7czoxNToibW9kL2ZvbGRlcjp2aWV3IjtzOjE6IjEiO3M6MTg6InJlcG9zaXRvcnkvczM6dmlldyI7czoxOiIxIjtzOjIzOiJtb29kbGUvc2l0ZTpzZW5kbWVzc2FnZSI7czoxOiIxIjtzOjE0OiJtb2QvaW1zY3A6dmlldyI7czoxOiIxIjtzOjIyOiJyZXBvc2l0b3J5L3VwbG9hZDp2aWV3IjtzOjE6IjEiO3M6MTc6Im1vb2RsZS90YWc6Y3JlYXRlIjtzOjE6IjEiO3M6MTM6Im1vZC9wYWdlOnZpZXciO3M6MToiMSI7czoxOToicmVwb3NpdG9yeS91cmw6dmlldyI7czoxOiIxIjtzOjE1OiJtb29kbGUvdGFnOmVkaXQiO3M6MToiMSI7czoxNzoibW9kL3Jlc291cmNlOnZpZXciO3M6MToiMSI7czoyMDoicmVwb3NpdG9yeS91c2VyOnZpZXciO3M6MToiMSI7czoyOToibW9vZGxlL3VzZXI6Y2hhbmdlb3ducGFzc3dvcmQiO3M6MToiMSI7czoxMjoibW9kL3VybDp2aWV3IjtzOjE6IjEiO3M6MjI6InJlcG9zaXRvcnkvd2ViZGF2OnZpZXciO3M6MToiMSI7czozMzoibW9vZGxlL3VzZXI6ZWRpdG93bm1lc3NhZ2Vwcm9maWxlIjtzOjE6IjEiO3M6MTc6Im1vb2RsZS9ibG9jazp2aWV3IjtzOjE6IjEiO3M6MjU6InJlcG9zaXRvcnkvd2lraW1lZGlhOnZpZXciO3M6MToiMSI7czoyNjoibW9vZGxlL3VzZXI6ZWRpdG93bnByb2ZpbGUiO3M6MToiMSI7czoyNzoibW9vZGxlL2Jsb2c6YXNzb2NpYXRlY291cnNlIjtzOjE6IjEiO3M6MjM6InJlcG9zaXRvcnkveW91dHViZTp2aWV3IjtzOjE6IjEiO3M6Mjc6Im1vb2RsZS91c2VyOm1hbmFnZW93bmJsb2NrcyI7czoxOiIxIjtzOjI3OiJtb29kbGUvYmxvZzphc3NvY2lhdGVtb2R1bGUiO3M6MToiMSI7czoyNjoibW9vZGxlL3VzZXI6bWFuYWdlb3duZmlsZXMiO3M6MToiMSI7czoxODoibW9vZGxlL2Jsb2c6Y3JlYXRlIjtzOjE6IjEiO3M6MzU6Im1vb2RsZS93ZWJzZXJ2aWNlOmNyZWF0ZW1vYmlsZXRva2VuIjtzOjE6IjEiO3M6MjY6Im1vb2RsZS9ibG9nOm1hbmFnZWV4dGVybmFsIjtzOjE6IjEiO3M6MjQ6InJlcG9zaXRvcnkvYWxmcmVzY286dmlldyI7czoxOiIxIjtzOjE4OiJtb29kbGUvYmxvZzpzZWFyY2giO3M6MToiMSI7czoyMjoicmVwb3NpdG9yeS9ib3huZXQ6dmlldyI7czoxOiIxIjtzOjE2OiJtb29kbGUvYmxvZzp2aWV3IjtzOjE6IjEiO3M6Mjc6InJlcG9zaXRvcnkvY291cnNlZmlsZXM6dmlldyI7czoxOiIxIjtzOjMyOiJtb29kbGUvY2FsZW5kYXI6bWFuYWdlb3duZW50cmllcyI7czoxOiIxIjt9fXM6NjoibG9hZGVkIjthOjA6e31zOjI6ImRyIjtzOjE6IjciO3M6NDoidGltZSI7aToxMzE3OTM2NzM0O319', 1317936685, 1317937885, '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1'),
(229, 0, 'j32k39mu1aqvstr90s3n5er3h6', 13, 'U0VTU0lPTnxPOjg6InN0ZENsYXNzIjo0OntzOjEwOiJsb2dpbmNvdW50IjtpOjA7czo4OiJuYXZjYWNoZSI7Tzo4OiJzdGRDbGFzcyI6MTp7czoxMDoibmF2aWdhdGlvbiI7YToxOntzOjE3OiJjb250ZXh0aGFzcmVwb3MzOSI7YTozOntpOjA7aToxMzE3OTM3MTQwO2k6MTtzOjI6IjEzIjtpOjI7czo0OiJiOjA7Ijt9fX1zOjIxOiJsb2FkX25hdmlnYXRpb25fYWRtaW4iO2I6MDtzOjEyOiJmbGFzaHZlcnNpb24iO3M6NzoiMTAuMS41MyI7fVVTRVJ8Tzo4OiJzdGRDbGFzcyI6NTk6e3M6MjoiaWQiO3M6MjoiMTMiO3M6NDoiYXV0aCI7czo1OiJlbWFpbCI7czo5OiJjb25maXJtZWQiO3M6MToiMSI7czoxMjoicG9saWN5YWdyZWVkIjtzOjE6IjAiO3M6NzoiZGVsZXRlZCI7czoxOiIwIjtzOjk6InN1c3BlbmRlZCI7czoxOiIwIjtzOjEwOiJtbmV0aG9zdGlkIjtzOjE6IjEiO3M6ODoidXNlcm5hbWUiO3M6MTU6ImFwcmVuZGl6cG9wcGVyMSI7czo4OiJwYXNzd29yZCI7czozMjoiZTZkMGEyOThlMGUwNDU0NWM5MGY0ZmUyODcyMDViZDEiO3M6ODoiaWRudW1iZXIiO3M6MDoiIjtzOjk6ImZpcnN0bmFtZSI7czo5OiJBcHJlbmRpejEiO3M6ODoibGFzdG5hbWUiO3M6NjoiUG9wcGVyIjtzOjU6ImVtYWlsIjtzOjI1OiJhcHJlbmRpenBvcHBlcjFAZ21haWwuY29tIjtzOjk6ImVtYWlsc3RvcCI7czoxOiIwIjtzOjM6ImljcSI7czowOiIiO3M6NToic2t5cGUiO3M6MDoiIjtzOjU6InlhaG9vIjtzOjA6IiI7czozOiJhaW0iO3M6MDoiIjtzOjM6Im1zbiI7czowOiIiO3M6NjoicGhvbmUxIjtzOjA6IiI7czo2OiJwaG9uZTIiO3M6MDoiIjtzOjExOiJpbnN0aXR1dGlvbiI7czowOiIiO3M6MTA6ImRlcGFydG1lbnQiO3M6MDoiIjtzOjc6ImFkZHJlc3MiO3M6MDoiIjtzOjQ6ImNpdHkiO3M6MTI6IkJ1ZW5vcyBBaXJlcyI7czo3OiJjb3VudHJ5IjtzOjI6IkFSIjtzOjQ6ImxhbmciO3M6NToiZXNfYXIiO3M6NToidGhlbWUiO3M6MDoiIjtzOjg6InRpbWV6b25lIjtzOjI6Ijk5IjtzOjExOiJmaXJzdGFjY2VzcyI7czoxMDoiMTMxNzMyNjE4NiI7czoxMDoibGFzdGFjY2VzcyI7czoxMDoiMTMxNzM5MTM0NSI7czo5OiJsYXN0bG9naW4iO3M6MTA6IjEzMTczOTEzNDUiO3M6MTI6ImN1cnJlbnRsb2dpbiI7aToxMzE3OTM3MTM5O3M6NjoibGFzdGlwIjtzOjk6IjEyNy4wLjAuMSI7czo2OiJzZWNyZXQiO3M6MTU6IllIQ2VXUDhzY2VkWDlkSiI7czo3OiJwaWN0dXJlIjtzOjE6IjAiO3M6MzoidXJsIjtzOjA6IiI7czoxNzoiZGVzY3JpcHRpb25mb3JtYXQiO3M6MToiMCI7czoxMDoibWFpbGZvcm1hdCI7czoxOiIxIjtzOjEwOiJtYWlsZGlnZXN0IjtzOjE6IjAiO3M6MTE6Im1haWxkaXNwbGF5IjtzOjE6IjIiO3M6MTA6Imh0bWxlZGl0b3IiO3M6MToiMSI7czo0OiJhamF4IjtzOjE6IjEiO3M6MTM6ImF1dG9zdWJzY3JpYmUiO3M6MToiMSI7czoxMToidHJhY2tmb3J1bXMiO3M6MToiMCI7czoxMToidGltZWNyZWF0ZWQiO3M6MTA6IjEzMTczMjYwNjciO3M6MTI6InRpbWVtb2RpZmllZCI7czoxOiIwIjtzOjEyOiJ0cnVzdGJpdG1hc2siO3M6MToiMCI7czo4OiJpbWFnZWFsdCI7TjtzOjEyOiJzY3JlZW5yZWFkZXIiO3M6MToiMCI7czoxNjoibGFzdGNvdXJzZWFjY2VzcyI7YToxOntpOjM7czoxMDoiMTMxNzM5MTM0OSI7fXM6MTk6ImN1cnJlbnRjb3Vyc2VhY2Nlc3MiO2E6MDp7fXM6MTE6Imdyb3VwbWVtYmVyIjthOjA6e31zOjc6InByb2ZpbGUiO2E6Mzp7czozOiJkbmkiO3M6ODoiMTIzNDU2NzgiO3M6NjoicGFkcm9uIjtzOjg6IjEyMzQ1Njc4IjtzOjEzOiJyb2xzb2xpY2l0YWRvIjtzOjg6IkFwcmVuZGl6Ijt9czo2OiJhY2Nlc3MiO2E6NTp7czoyOiJyYSI7YToyOntzOjI6Ii8xIjthOjI6e2k6NTtzOjE6IjUiO2k6NztzOjE6IjciO31zOjg6Ii8xLzIyLzQwIjthOjE6e2k6NTtzOjE6IjUiO319czo0OiJyZGVmIjthOjE4OntzOjQ6Ii8xOjUiO2E6NjY6e3M6Mjc6ImJsb2NrL29ubGluZV91c2Vyczp2aWV3bGlzdCI7czoxOiIxIjtzOjIyOiJlbnJvbC9zZWxmOnVuZW5yb2xzZWxmIjtzOjE6IjEiO3M6MjU6ImdyYWRlcmVwb3J0L292ZXJ2aWV3OnZpZXciO3M6MToiMSI7czoyMToiZ3JhZGVyZXBvcnQvdXNlcjp2aWV3IjtzOjE6IjEiO3M6MzQ6Im1vZC9hc3NpZ25tZW50OmV4cG9ydG93bnN1Ym1pc3Npb24iO3M6MToiMSI7czoyMToibW9kL2Fzc2lnbm1lbnQ6c3VibWl0IjtzOjE6IjEiO3M6MTk6Im1vZC9hc3NpZ25tZW50OnZpZXciO3M6MToiMSI7czoxMzoibW9kL2NoYXQ6Y2hhdCI7czoxOiIxIjtzOjE2OiJtb2QvY2hhdDpyZWFkbG9nIjtzOjE6IjEiO3M6MTc6Im1vZC9jaG9pY2U6Y2hvb3NlIjtzOjE6IjEiO3M6MTY6Im1vZC9kYXRhOmNvbW1lbnQiO3M6MToiMSI7czoyMzoibW9kL2RhdGE6ZXhwb3J0b3duZW50cnkiO3M6MToiMSI7czoxODoibW9kL2RhdGE6dmlld2VudHJ5IjtzOjE6IjEiO3M6MTk6Im1vZC9kYXRhOndyaXRlZW50cnkiO3M6MToiMSI7czoyMToibW9kL2ZlZWRiYWNrOmNvbXBsZXRlIjtzOjE6IjEiO3M6MTc6Im1vZC9mZWVkYmFjazp2aWV3IjtzOjE6IjEiO3M6Mjg6Im1vZC9mZWVkYmFjazp2aWV3YW5hbHlzZXBhZ2UiO3M6MToiMSI7czoyNjoibW9kL2ZvcnVtOmNyZWF0ZWF0dGFjaG1lbnQiO3M6MToiMSI7czoyMzoibW9kL2ZvcnVtOmRlbGV0ZW93bnBvc3QiO3M6MToiMSI7czoyMzoibW9kL2ZvcnVtOmV4cG9ydG93bnBvc3QiO3M6MToiMSI7czozMDoibW9kL2ZvcnVtOmluaXRpYWxzdWJzY3JpcHRpb25zIjtzOjE6IjEiO3M6MTk6Im1vZC9mb3J1bTpyZXBseXBvc3QiO3M6MToiMSI7czoyNToibW9kL2ZvcnVtOnN0YXJ0ZGlzY3Vzc2lvbiI7czoxOiIxIjtzOjI0OiJtb2QvZm9ydW06dmlld2Rpc2N1c3Npb24iO3M6MToiMSI7czoyMDoibW9kL2ZvcnVtOnZpZXdyYXRpbmciO3M6MToiMSI7czoyMDoibW9kL2dsb3NzYXJ5OmNvbW1lbnQiO3M6MToiMSI7czoyNzoibW9kL2dsb3NzYXJ5OmV4cG9ydG93bmVudHJ5IjtzOjE6IjEiO3M6MTg6Im1vZC9nbG9zc2FyeTp3cml0ZSI7czoxOiIxIjtzOjE2OiJtb2QvcXVpejphdHRlbXB0IjtzOjE6IjEiO3M6MjU6Im1vZC9xdWl6OnJldmlld215YXR0ZW1wdHMiO3M6MToiMSI7czoxMzoibW9kL3F1aXo6dmlldyI7czoxOiIxIjtzOjE5OiJtb2Qvc2Nvcm06c2F2ZXRyYWNrIjtzOjE6IjEiO3M6MTg6Im1vZC9zY29ybTpza2lwdmlldyI7czoxOiIxIjtzOjIwOiJtb2Qvc2Nvcm06dmlld3Njb3JlcyI7czoxOiIxIjtzOjIyOiJtb2Qvc3VydmV5OnBhcnRpY2lwYXRlIjtzOjE6IjEiO3M6MTk6Im1vZC93aWtpOmNyZWF0ZXBhZ2UiO3M6MToiMSI7czoyMDoibW9kL3dpa2k6ZWRpdGNvbW1lbnQiO3M6MToiMSI7czoxNzoibW9kL3dpa2k6ZWRpdHBhZ2UiO3M6MToiMSI7czoyMDoibW9kL3dpa2k6dmlld2NvbW1lbnQiO3M6MToiMSI7czoxNzoibW9kL3dpa2k6dmlld3BhZ2UiO3M6MToiMSI7czoyMzoibW9kL3dvcmtzaG9wOnBlZXJhc3Nlc3MiO3M6MToiMSI7czoxOToibW9kL3dvcmtzaG9wOnN1Ym1pdCI7czoxOiIxIjtzOjE3OiJtb2Qvd29ya3Nob3A6dmlldyI7czoxOiIxIjtzOjI4OiJtb2Qvd29ya3Nob3A6dmlld2F1dGhvcm5hbWVzIjtzOjE6IjEiO3M6MzI6Im1vZC93b3Jrc2hvcDp2aWV3YXV0aG9ycHVibGlzaGVkIjtzOjE6IjEiO3M6Mzc6Im1vZC93b3Jrc2hvcDp2aWV3cHVibGlzaGVkc3VibWlzc2lvbnMiO3M6MToiMSI7czoxNzoibW9vZGxlL2Jsb2NrOnZpZXciO3M6MToiMSI7czoyNzoibW9vZGxlL2Jsb2c6YXNzb2NpYXRlY291cnNlIjtzOjE6IjEiO3M6Mjc6Im1vb2RsZS9ibG9nOmFzc29jaWF0ZW1vZHVsZSI7czoxOiIxIjtzOjI2OiJtb29kbGUvYmxvZzptYW5hZ2VleHRlcm5hbCI7czoxOiIxIjtzOjE4OiJtb29kbGUvYmxvZzpzZWFyY2giO3M6MToiMSI7czoxNjoibW9vZGxlL2Jsb2c6dmlldyI7czoxOiIxIjtzOjE5OiJtb29kbGUvY29tbWVudDpwb3N0IjtzOjE6IjEiO3M6MTk6Im1vb2RsZS9jb21tZW50OnZpZXciO3M6MToiMSI7czozMDoibW9vZGxlL2NvdXJzZTp2aWV3cGFydGljaXBhbnRzIjtzOjE6IjEiO3M6MjQ6Im1vb2RsZS9jb3Vyc2U6dmlld3NjYWxlcyI7czoxOiIxIjtzOjE3OiJtb29kbGUvZ3JhZGU6dmlldyI7czoxOiIxIjtzOjIzOiJtb29kbGUvcG9ydGZvbGlvOmV4cG9ydCI7czoxOiIxIjtzOjIwOiJtb29kbGUvcXVlc3Rpb246ZmxhZyI7czoxOiIxIjtzOjE4OiJtb29kbGUvcmF0aW5nOnJhdGUiO3M6MToiMSI7czoxODoibW9vZGxlL3JhdGluZzp2aWV3IjtzOjE6IjEiO3M6MjE6Im1vb2RsZS9yYXRpbmc6dmlld2FsbCI7czoxOiIxIjtzOjIxOiJtb29kbGUvcmF0aW5nOnZpZXdhbnkiO3M6MToiMSI7czoyNToibW9vZGxlL3VzZXI6cmVhZHVzZXJibG9ncyI7czoxOiIxIjtzOjI1OiJtb29kbGUvdXNlcjpyZWFkdXNlcnBvc3RzIjtzOjE6IjEiO3M6MjM6Im1vb2RsZS91c2VyOnZpZXdkZXRhaWxzIjtzOjE6IjEiO31zOjQ6Ii8xOjciO2E6NTE6e3M6MjM6InJlcG9zaXRvcnkvZHJvcGJveDp2aWV3IjtzOjE6IjEiO3M6MTk6Im1vb2RsZS9jb21tZW50OnBvc3QiO3M6MToiMSI7czoyNjoicmVwb3NpdG9yeS9maWxlc3lzdGVtOnZpZXciO3M6MToiMSI7czoxOToibW9vZGxlL2NvbW1lbnQ6dmlldyI7czoxOiIxIjtzOjI5OiJyZXBvc2l0b3J5L2ZsaWNrcl9wdWJsaWM6dmlldyI7czoxOiIxIjtzOjIxOiJtb29kbGUvY291cnNlOnJlcXVlc3QiO3M6MToiMSI7czoyMjoicmVwb3NpdG9yeS9mbGlja3I6dmlldyI7czoxOiIxIjtzOjIyOiJtb29kbGUvbXk6bWFuYWdlYmxvY2tzIjtzOjE6IjEiO3M6MjY6InJlcG9zaXRvcnkvZ29vZ2xlZG9jczp2aWV3IjtzOjE6IjEiO3M6MjM6Im1vb2RsZS9wb3J0Zm9saW86ZXhwb3J0IjtzOjE6IjEiO3M6MjE6InJlcG9zaXRvcnkvbG9jYWw6dmlldyI7czoxOiIxIjtzOjE4OiJtb29kbGUvcmF0aW5nOnJhdGUiO3M6MToiMSI7czoyMjoicmVwb3NpdG9yeS9tZXJsb3Q6dmlldyI7czoxOiIxIjtzOjE4OiJtb29kbGUvcmF0aW5nOnZpZXciO3M6MToiMSI7czoyMjoicmVwb3NpdG9yeS9waWNhc2E6dmlldyI7czoxOiIxIjtzOjIxOiJtb29kbGUvcmF0aW5nOnZpZXdhbGwiO3M6MToiMSI7czoyNzoiYmxvY2svb25saW5lX3VzZXJzOnZpZXdsaXN0IjtzOjE6IjEiO3M6MjI6InJlcG9zaXRvcnkvcmVjZW50OnZpZXciO3M6MToiMSI7czoyMToibW9vZGxlL3JhdGluZzp2aWV3YW55IjtzOjE6IjEiO3M6MTU6Im1vZC9mb2xkZXI6dmlldyI7czoxOiIxIjtzOjE4OiJyZXBvc2l0b3J5L3MzOnZpZXciO3M6MToiMSI7czoyMzoibW9vZGxlL3NpdGU6c2VuZG1lc3NhZ2UiO3M6MToiMSI7czoxNDoibW9kL2ltc2NwOnZpZXciO3M6MToiMSI7czoyMjoicmVwb3NpdG9yeS91cGxvYWQ6dmlldyI7czoxOiIxIjtzOjE3OiJtb29kbGUvdGFnOmNyZWF0ZSI7czoxOiIxIjtzOjEzOiJtb2QvcGFnZTp2aWV3IjtzOjE6IjEiO3M6MTk6InJlcG9zaXRvcnkvdXJsOnZpZXciO3M6MToiMSI7czoxNToibW9vZGxlL3RhZzplZGl0IjtzOjE6IjEiO3M6MTc6Im1vZC9yZXNvdXJjZTp2aWV3IjtzOjE6IjEiO3M6MjA6InJlcG9zaXRvcnkvdXNlcjp2aWV3IjtzOjE6IjEiO3M6Mjk6Im1vb2RsZS91c2VyOmNoYW5nZW93bnBhc3N3b3JkIjtzOjE6IjEiO3M6MTI6Im1vZC91cmw6dmlldyI7czoxOiIxIjtzOjIyOiJyZXBvc2l0b3J5L3dlYmRhdjp2aWV3IjtzOjE6IjEiO3M6MzM6Im1vb2RsZS91c2VyOmVkaXRvd25tZXNzYWdlcHJvZmlsZSI7czoxOiIxIjtzOjE3OiJtb29kbGUvYmxvY2s6dmlldyI7czoxOiIxIjtzOjI1OiJyZXBvc2l0b3J5L3dpa2ltZWRpYTp2aWV3IjtzOjE6IjEiO3M6MjY6Im1vb2RsZS91c2VyOmVkaXRvd25wcm9maWxlIjtzOjE6IjEiO3M6Mjc6Im1vb2RsZS9ibG9nOmFzc29jaWF0ZWNvdXJzZSI7czoxOiIxIjtzOjIzOiJyZXBvc2l0b3J5L3lvdXR1YmU6dmlldyI7czoxOiIxIjtzOjI3OiJtb29kbGUvdXNlcjptYW5hZ2Vvd25ibG9ja3MiO3M6MToiMSI7czoyNzoibW9vZGxlL2Jsb2c6YXNzb2NpYXRlbW9kdWxlIjtzOjE6IjEiO3M6MjY6Im1vb2RsZS91c2VyOm1hbmFnZW93bmZpbGVzIjtzOjE6IjEiO3M6MTg6Im1vb2RsZS9ibG9nOmNyZWF0ZSI7czoxOiIxIjtzOjM1OiJtb29kbGUvd2Vic2VydmljZTpjcmVhdGVtb2JpbGV0b2tlbiI7czoxOiIxIjtzOjI2OiJtb29kbGUvYmxvZzptYW5hZ2VleHRlcm5hbCI7czoxOiIxIjtzOjI0OiJyZXBvc2l0b3J5L2FsZnJlc2NvOnZpZXciO3M6MToiMSI7czoxODoibW9vZGxlL2Jsb2c6c2VhcmNoIjtzOjE6IjEiO3M6MjI6InJlcG9zaXRvcnkvYm94bmV0OnZpZXciO3M6MToiMSI7czoxNjoibW9vZGxlL2Jsb2c6dmlldyI7czoxOiIxIjtzOjI3OiJyZXBvc2l0b3J5L2NvdXJzZWZpbGVzOnZpZXciO3M6MToiMSI7czozMjoibW9vZGxlL2NhbGVuZGFyOm1hbmFnZW93bmVudHJpZXMiO3M6MToiMSI7fXM6NjoiLzEvNzo1IjthOjE6e3M6MTc6Im1vb2RsZS9ibG9jazp2aWV3IjtzOjI6Ii0xIjt9czo2OiIvMS83OjciO2E6MTp7czoxNzoibW9vZGxlL2Jsb2NrOnZpZXciO3M6MjoiLTEiO31zOjg6Ii8xLzIvNDo1IjthOjE6e3M6MTc6Im1vb2RsZS9ibG9jazp2aWV3IjtzOjI6Ii0xIjt9czo4OiIvMS8yLzQ6NyI7YToxOntzOjE3OiJtb29kbGUvYmxvY2s6dmlldyI7czoyOiItMSI7fXM6OToiLzEvMi8zNzo1IjthOjE6e3M6MTc6Im1vb2RsZS9ibG9jazp2aWV3IjtzOjI6Ii0xIjt9czo5OiIvMS8yLzM3OjciO2E6MTp7czoxNzoibW9vZGxlL2Jsb2NrOnZpZXciO3M6MjoiLTEiO31zOjk6Ii8xLzIvMzY6NyI7YToxOntzOjE3OiJtb29kbGUvYmxvY2s6dmlldyI7czoyOiItMSI7fXM6OToiLzEvMi8zNTo1IjthOjE6e3M6MTc6Im1vb2RsZS9ibG9jazp2aWV3IjtzOjU6Ii0xMDAwIjt9czo5OiIvMS8yLzM0OjUiO2E6MTp7czoxNzoibW9vZGxlL2Jsb2NrOnZpZXciO3M6MjoiLTEiO31zOjk6Ii8xLzIvMzQ6NyI7YToxOntzOjE3OiJtb29kbGUvYmxvY2s6dmlldyI7czoyOiItMSI7fXM6OToiLzEvMi8xNzo1IjthOjk6e3M6MTg6Im1vb2RsZS9yYXRpbmc6dmlldyI7czoyOiItMSI7czoyNjoibW9kL2ZvcnVtOmNyZWF0ZWF0dGFjaG1lbnQiO3M6MjoiLTEiO3M6MjM6Im1vZC9mb3J1bTpkZWxldGVvd25wb3N0IjtzOjI6Ii0xIjtzOjIzOiJtb2QvZm9ydW06ZXhwb3J0b3ducG9zdCI7czoyOiItMSI7czozMDoibW9kL2ZvcnVtOmluaXRpYWxzdWJzY3JpcHRpb25zIjtzOjI6Ii0xIjtzOjE5OiJtb2QvZm9ydW06cmVwbHlwb3N0IjtzOjI6Ii0xIjtzOjI1OiJtb2QvZm9ydW06c3RhcnRkaXNjdXNzaW9uIjtzOjI6Ii0xIjtzOjIwOiJtb2QvZm9ydW06dmlld3JhdGluZyI7czoyOiItMSI7czoxODoibW9vZGxlL3JhdGluZzpyYXRlIjtzOjI6Ii0xIjt9czo5OiIvMS8yLzE3OjciO2E6Mzp7czoyNDoibW9kL2ZvcnVtOnZpZXdkaXNjdXNzaW9uIjtzOjE6IjEiO3M6MTg6Im1vb2RsZS9yYXRpbmc6cmF0ZSI7czoyOiItMSI7czoxODoibW9vZGxlL3JhdGluZzp2aWV3IjtzOjI6Ii0xIjt9czo5OiIvMS8yLzE1OjUiO2E6MTp7czoxNzoibW9vZGxlL2Jsb2NrOnZpZXciO3M6MjoiLTEiO31zOjk6Ii8xLzIvMTU6NyI7YToxOntzOjE3OiJtb29kbGUvYmxvY2s6dmlldyI7czoyOiItMSI7fXM6NjoiLzEvODo1IjthOjE6e3M6MTc6Im1vb2RsZS9ibG9jazp2aWV3IjtzOjI6Ii0xIjt9czo2OiIvMS84OjciO2E6MTp7czoxNzoibW9vZGxlL2Jsb2NrOnZpZXciO3M6MjoiLTEiO319czo2OiJsb2FkZWQiO2E6Mzp7aTowO3M6NDoiLzEvNyI7aToxO3M6NDoiLzEvMiI7aToyO3M6NDoiLzEvOCI7fXM6MjoiZHIiO3M6MToiNyI7czo0OiJ0aW1lIjtpOjEzMTc5MzcxMzk7fXM6Nzoic2Vzc2tleSI7czoxMDoiVjNSd3VqQ3V3SyI7czoxMDoicHJlZmVyZW5jZSI7YToxOntzOjExOiJfbGFzdGxvYWRlZCI7aToxMzE3OTM3OTM5O31zOjE3OiJtZXNzYWdlX2xhc3Rwb3B1cCI7aTowO3M6MjU6ImFqYXhfdXBkYXRhYmxlX3VzZXJfcHJlZnMiO2E6NDp7czoyMzoiZG9ja2VkX2Jsb2NrX2luc3RhbmNlXzQiO3M6MzoiaW50IjtzOjIzOiJkb2NrZWRfYmxvY2tfaW5zdGFuY2VfNSI7czozOiJpbnQiO3M6MTM6ImJsb2NrMTVoaWRkZW4iO3M6NDoiYm9vbCI7czoxMzoiYmxvY2sxOGhpZGRlbiI7czo0OiJib29sIjt9fQ==', 1317937139, 1317937939, '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1'),
(231, 0, 'ufm8b3a3cbq8h4u0k4djm8h0d0', 2, 'U0VTU0lPTnxPOjg6InN0ZENsYXNzIjo1OntzOjEwOiJsb2dpbmNvdW50IjtpOjA7czo4OiJuYXZjYWNoZSI7Tzo4OiJzdGRDbGFzcyI6MTp7czoxMDoibmF2aWdhdGlvbiI7YToxOntzOjE3OiJjb250ZXh0aGFzcmVwb3MxMyI7YTozOntpOjA7aToxMzE3OTQ1NTU4O2k6MTtzOjE6IjIiO2k6MjtzOjQ6ImI6MDsiO319fXM6MjI6ImFkbWluX2NyaXRpY2FsX3dhcm5pbmciO2k6MDtzOjIxOiJsb2FkX25hdmlnYXRpb25fYWRtaW4iO2I6MTtzOjEyOiJmbGFzaHZlcnNpb24iO3M6NjoiMTEuMC4xIjt9VVNFUnxPOjg6InN0ZENsYXNzIjo1OTp7czoyOiJpZCI7czoxOiIyIjtzOjQ6ImF1dGgiO3M6NjoibWFudWFsIjtzOjk6ImNvbmZpcm1lZCI7czoxOiIxIjtzOjEyOiJwb2xpY3lhZ3JlZWQiO3M6MToiMCI7czo3OiJkZWxldGVkIjtzOjE6IjAiO3M6OToic3VzcGVuZGVkIjtzOjE6IjAiO3M6MTA6Im1uZXRob3N0aWQiO3M6MToiMSI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo4OiJwYXNzd29yZCI7czozMjoiZTZkMGEyOThlMGUwNDU0NWM5MGY0ZmUyODcyMDViZDEiO3M6ODoiaWRudW1iZXIiO3M6MDoiIjtzOjk6ImZpcnN0bmFtZSI7czo1OiJhZG1pbiI7czo4OiJsYXN0bmFtZSI7czo3OiJVc3VhcmlvIjtzOjU6ImVtYWlsIjtzOjQ4OiJ0YWxsZXJkZXByb2dyYW1hY2lvbmlpZml1YmEyMDExQGdvb2dsZWdyb3Vwcy5jb20iO3M6OToiZW1haWxzdG9wIjtzOjE6IjAiO3M6MzoiaWNxIjtzOjA6IiI7czo1OiJza3lwZSI7czowOiIiO3M6NToieWFob28iO3M6MDoiIjtzOjM6ImFpbSI7czowOiIiO3M6MzoibXNuIjtzOjA6IiI7czo2OiJwaG9uZTEiO3M6MDoiIjtzOjY6InBob25lMiI7czowOiIiO3M6MTE6Imluc3RpdHV0aW9uIjtzOjA6IiI7czoxMDoiZGVwYXJ0bWVudCI7czowOiIiO3M6NzoiYWRkcmVzcyI7czowOiIiO3M6NDoiY2l0eSI7czoxMjoiQnVlbm9zIEFpcmVzIjtzOjc6ImNvdW50cnkiO3M6MjoiQVIiO3M6NDoibGFuZyI7czo1OiJlc19hciI7czo1OiJ0aGVtZSI7czowOiIiO3M6ODoidGltZXpvbmUiO3M6MjoiOTkiO3M6MTE6ImZpcnN0YWNjZXNzIjtzOjEwOiIxMzE2NTY3NTAzIjtzOjEwOiJsYXN0YWNjZXNzIjtpOjEzMTc5NDU2NDE7czo5OiJsYXN0bG9naW4iO3M6MTA6IjEzMTc5MzY2ODQiO3M6MTI6ImN1cnJlbnRsb2dpbiI7aToxMzE3OTQ1NTU2O3M6NjoibGFzdGlwIjtzOjE1OiIwOjA6MDowOjA6MDowOjEiO3M6Njoic2VjcmV0IjtzOjA6IiI7czo3OiJwaWN0dXJlIjtzOjE6IjAiO3M6MzoidXJsIjtzOjA6IiI7czoxNzoiZGVzY3JpcHRpb25mb3JtYXQiO3M6MToiMCI7czoxMDoibWFpbGZvcm1hdCI7czoxOiIxIjtzOjEwOiJtYWlsZGlnZXN0IjtzOjE6IjAiO3M6MTE6Im1haWxkaXNwbGF5IjtzOjE6IjEiO3M6MTA6Imh0bWxlZGl0b3IiO3M6MToiMSI7czo0OiJhamF4IjtzOjE6IjEiO3M6MTM6ImF1dG9zdWJzY3JpYmUiO3M6MToiMSI7czoxMToidHJhY2tmb3J1bXMiO3M6MToiMCI7czoxMToidGltZWNyZWF0ZWQiO3M6MToiMCI7czoxMjoidGltZW1vZGlmaWVkIjtzOjEwOiIxMzE2NTY3NTAzIjtzOjEyOiJ0cnVzdGJpdG1hc2siO3M6MToiMCI7czo4OiJpbWFnZWFsdCI7TjtzOjEyOiJzY3JlZW5yZWFkZXIiO3M6MToiMSI7czoxNjoibGFzdGNvdXJzZWFjY2VzcyI7YToyOntpOjI7czoxMDoiMTMxNzg0ODQyOSI7aTozO3M6MTA6IjEzMTczOTc2NDAiO31zOjE5OiJjdXJyZW50Y291cnNlYWNjZXNzIjthOjA6e31zOjExOiJncm91cG1lbWJlciI7YTowOnt9czo3OiJwcm9maWxlIjthOjM6e3M6MzoiZG5pIjtzOjA6IiI7czo2OiJwYWRyb24iO3M6MDoiIjtzOjEzOiJyb2xzb2xpY2l0YWRvIjtzOjc6Ik1pZW1icm8iO31zOjY6ImFjY2VzcyI7YTo1OntzOjI6InJhIjthOjE6e3M6MjoiLzEiO2E6MTp7aTo3O3M6MToiNyI7fX1zOjQ6InJkZWYiO2E6MTp7czo0OiIvMTo3IjthOjUxOntzOjI3OiJyZXBvc2l0b3J5L2NvdXJzZWZpbGVzOnZpZXciO3M6MToiMSI7czozMjoibW9vZGxlL2NhbGVuZGFyOm1hbmFnZW93bmVudHJpZXMiO3M6MToiMSI7czoyMzoicmVwb3NpdG9yeS9kcm9wYm94OnZpZXciO3M6MToiMSI7czoxOToibW9vZGxlL2NvbW1lbnQ6cG9zdCI7czoxOiIxIjtzOjI2OiJyZXBvc2l0b3J5L2ZpbGVzeXN0ZW06dmlldyI7czoxOiIxIjtzOjE5OiJtb29kbGUvY29tbWVudDp2aWV3IjtzOjE6IjEiO3M6Mjk6InJlcG9zaXRvcnkvZmxpY2tyX3B1YmxpYzp2aWV3IjtzOjE6IjEiO3M6MjE6Im1vb2RsZS9jb3Vyc2U6cmVxdWVzdCI7czoxOiIxIjtzOjIyOiJyZXBvc2l0b3J5L2ZsaWNrcjp2aWV3IjtzOjE6IjEiO3M6MjI6Im1vb2RsZS9teTptYW5hZ2VibG9ja3MiO3M6MToiMSI7czoyNjoicmVwb3NpdG9yeS9nb29nbGVkb2NzOnZpZXciO3M6MToiMSI7czoyMzoibW9vZGxlL3BvcnRmb2xpbzpleHBvcnQiO3M6MToiMSI7czoyMToicmVwb3NpdG9yeS9sb2NhbDp2aWV3IjtzOjE6IjEiO3M6MTg6Im1vb2RsZS9yYXRpbmc6cmF0ZSI7czoxOiIxIjtzOjIyOiJyZXBvc2l0b3J5L21lcmxvdDp2aWV3IjtzOjE6IjEiO3M6MTg6Im1vb2RsZS9yYXRpbmc6dmlldyI7czoxOiIxIjtzOjIyOiJyZXBvc2l0b3J5L3BpY2FzYTp2aWV3IjtzOjE6IjEiO3M6MjE6Im1vb2RsZS9yYXRpbmc6dmlld2FsbCI7czoxOiIxIjtzOjI3OiJibG9jay9vbmxpbmVfdXNlcnM6dmlld2xpc3QiO3M6MToiMSI7czoyMjoicmVwb3NpdG9yeS9yZWNlbnQ6dmlldyI7czoxOiIxIjtzOjIxOiJtb29kbGUvcmF0aW5nOnZpZXdhbnkiO3M6MToiMSI7czoxNToibW9kL2ZvbGRlcjp2aWV3IjtzOjE6IjEiO3M6MTg6InJlcG9zaXRvcnkvczM6dmlldyI7czoxOiIxIjtzOjIzOiJtb29kbGUvc2l0ZTpzZW5kbWVzc2FnZSI7czoxOiIxIjtzOjE0OiJtb2QvaW1zY3A6dmlldyI7czoxOiIxIjtzOjIyOiJyZXBvc2l0b3J5L3VwbG9hZDp2aWV3IjtzOjE6IjEiO3M6MTc6Im1vb2RsZS90YWc6Y3JlYXRlIjtzOjE6IjEiO3M6MTM6Im1vZC9wYWdlOnZpZXciO3M6MToiMSI7czoxOToicmVwb3NpdG9yeS91cmw6dmlldyI7czoxOiIxIjtzOjE1OiJtb29kbGUvdGFnOmVkaXQiO3M6MToiMSI7czoxNzoibW9kL3Jlc291cmNlOnZpZXciO3M6MToiMSI7czoyMDoicmVwb3NpdG9yeS91c2VyOnZpZXciO3M6MToiMSI7czoyOToibW9vZGxlL3VzZXI6Y2hhbmdlb3ducGFzc3dvcmQiO3M6MToiMSI7czoxMjoibW9kL3VybDp2aWV3IjtzOjE6IjEiO3M6MjI6InJlcG9zaXRvcnkvd2ViZGF2OnZpZXciO3M6MToiMSI7czozMzoibW9vZGxlL3VzZXI6ZWRpdG93bm1lc3NhZ2Vwcm9maWxlIjtzOjE6IjEiO3M6MTc6Im1vb2RsZS9ibG9jazp2aWV3IjtzOjE6IjEiO3M6MjU6InJlcG9zaXRvcnkvd2lraW1lZGlhOnZpZXciO3M6MToiMSI7czoyNjoibW9vZGxlL3VzZXI6ZWRpdG93bnByb2ZpbGUiO3M6MToiMSI7czoyNzoibW9vZGxlL2Jsb2c6YXNzb2NpYXRlY291cnNlIjtzOjE6IjEiO3M6MjM6InJlcG9zaXRvcnkveW91dHViZTp2aWV3IjtzOjE6IjEiO3M6Mjc6Im1vb2RsZS91c2VyOm1hbmFnZW93bmJsb2NrcyI7czoxOiIxIjtzOjI3OiJtb29kbGUvYmxvZzphc3NvY2lhdGVtb2R1bGUiO3M6MToiMSI7czoyNjoibW9vZGxlL3VzZXI6bWFuYWdlb3duZmlsZXMiO3M6MToiMSI7czoxODoibW9vZGxlL2Jsb2c6Y3JlYXRlIjtzOjE6IjEiO3M6MzU6Im1vb2RsZS93ZWJzZXJ2aWNlOmNyZWF0ZW1vYmlsZXRva2VuIjtzOjE6IjEiO3M6MjY6Im1vb2RsZS9ibG9nOm1hbmFnZWV4dGVybmFsIjtzOjE6IjEiO3M6MjQ6InJlcG9zaXRvcnkvYWxmcmVzY286dmlldyI7czoxOiIxIjtzOjE4OiJtb29kbGUvYmxvZzpzZWFyY2giO3M6MToiMSI7czoyMjoicmVwb3NpdG9yeS9ib3huZXQ6dmlldyI7czoxOiIxIjtzOjE2OiJtb29kbGUvYmxvZzp2aWV3IjtzOjE6IjEiO319czo2OiJsb2FkZWQiO2E6MDp7fXM6MjoiZHIiO3M6MToiNyI7czo0OiJ0aW1lIjtpOjEzMTc5NDU1NTY7fXM6Nzoic2Vzc2tleSI7czoxMDoiWHdFY2pUbk5lVSI7czoxMDoicHJlZmVyZW5jZSI7YTo5OntzOjIzOiJkZWZpbmVyb2xlX3Nob3dhZHZhbmNlZCI7czowOiIiO3M6MjQ6ImRvY2tlZF9ibG9ja19pbnN0YW5jZV8xMCI7czoxOiIwIjtzOjIzOiJkb2NrZWRfYmxvY2tfaW5zdGFuY2VfNSI7czoxOiIwIjtzOjE4OiJlbWFpbF9ib3VuY2VfY291bnQiO3M6MToiMSI7czoxNjoiZW1haWxfc2VuZF9jb3VudCI7czoxOiIxIjtzOjI5OiJ1c2Vyc2VsZWN0b3JfYXV0b3NlbGVjdHVuaXF1ZSI7czoxOiIwIjtzOjI5OiJ1c2Vyc2VsZWN0b3JfcHJlc2VydmVzZWxlY3RlZCI7czoxOiIwIjtzOjI3OiJ1c2Vyc2VsZWN0b3Jfc2VhcmNoYW55d2hlcmUiO3M6MToiMCI7czoxMToiX2xhc3Rsb2FkZWQiO2k6MTMxNzk0NTY4MTt9czoxNzoibWVzc2FnZV9sYXN0cG9wdXAiO2k6MDtzOjI1OiJhamF4X3VwZGF0YWJsZV91c2VyX3ByZWZzIjthOjEwOntzOjIzOiJkb2NrZWRfYmxvY2tfaW5zdGFuY2VfNCI7czozOiJpbnQiO3M6MjM6ImRvY2tlZF9ibG9ja19pbnN0YW5jZV81IjtzOjM6ImludCI7czoxMjoiYmxvY2s0aGlkZGVuIjtzOjQ6ImJvb2wiO3M6MTM6ImJsb2NrMTBoaWRkZW4iO3M6NDoiYm9vbCI7czoxMzoiYmxvY2sxNmhpZGRlbiI7czo0OiJib29sIjtzOjEyOiJibG9jazVoaWRkZW4iO3M6NDoiYm9vbCI7czoxMzoiYmxvY2sxNWhpZGRlbiI7czo0OiJib29sIjtzOjEzOiJibG9jazE3aGlkZGVuIjtzOjQ6ImJvb2wiO3M6MTM6ImJsb2NrMThoaWRkZW4iO3M6NDoiYm9vbCI7czoxMzoiYmxvY2sxOWhpZGRlbiI7czo0OiJib29sIjt9fQ==', 1317945556, 1317945682, '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1'),
(233, 0, '2gn2vdblctol44f7nsb8fi69n6', 2, 'U0VTU0lPTnxPOjg6InN0ZENsYXNzIjo2OntzOjEwOiJsb2dpbmNvdW50IjtpOjA7czoxMjoiZmxhc2h2ZXJzaW9uIjtzOjY6IjExLjAuMSI7czo4OiJuYXZjYWNoZSI7Tzo4OiJzdGRDbGFzcyI6MTp7czoxMDoibmF2aWdhdGlvbiI7YToxMjp7czoxNzoiY291cnNlX3NlY3Rpb25zXzEiO2E6Mzp7aTowO2k6MTMxNzk1NTYxMDtpOjE7czoxOiIyIjtpOjI7czoyMjM6ImE6MTp7aTowO086ODoic3RkQ2xhc3MiOjk6e3M6Nzoic2VjdGlvbiI7czoxOiIwIjtzOjI6ImlkIjtzOjE6IjEiO3M6NjoiY291cnNlIjtzOjE6IjEiO3M6NDoibmFtZSI7TjtzOjc6InN1bW1hcnkiO3M6MDoiIjtzOjEzOiJzdW1tYXJ5Zm9ybWF0IjtzOjE6IjEiO3M6ODoic2VxdWVuY2UiO3M6MzoiMSw1IjtzOjc6InZpc2libGUiO3M6MToiMSI7czoxMjoiaGFzYWN0aXZpdGVzIjtiOjE7fX0iO31zOjE4OiJjb3Vyc2VfYWN0aXZpdGVzXzEiO2E6Mzp7aTowO2k6MTMxNzk1NTYxMDtpOjE7czoxOiIyIjtpOjI7czo1Njg6ImE6Mjp7aToxO086ODoic3RkQ2xhc3MiOjEwOntzOjc6InNlY3Rpb24iO3M6MToiMCI7czo0OiJuYW1lIjtzOjk6IkNhcnRlbGVyYSI7czo0OiJpY29uIjtzOjA6IiI7czoxMzoiaWNvbmNvbXBvbmVudCI7czowOiIiO3M6MjoiaWQiO3M6MToiMSI7czo2OiJoaWRkZW4iO2I6MDtzOjc6Im1vZG5hbWUiO3M6NToiZm9ydW0iO3M6ODoibm9kZXR5cGUiO2k6MDtzOjM6InVybCI7czo0MDoiaHR0cDovL2xvY2FsaG9zdC9tb2QvZm9ydW0vdmlldy5waHA/aWQ9MSI7czo3OiJkaXNwbGF5IjtiOjE7fWk6NTtPOjg6InN0ZENsYXNzIjoxMDp7czo3OiJzZWN0aW9uIjtzOjE6IjAiO3M6NDoibmFtZSI7czoyMjoiRm9ybyBHZW5lcmFsIGRlIGxhIFJlZCI7czo0OiJpY29uIjtzOjA6IiI7czoxMzoiaWNvbmNvbXBvbmVudCI7czowOiIiO3M6MjoiaWQiO3M6MToiNSI7czo2OiJoaWRkZW4iO2I6MDtzOjc6Im1vZG5hbWUiO3M6NToiZm9ydW0iO3M6ODoibm9kZXR5cGUiO2k6MDtzOjM6InVybCI7czo0MDoiaHR0cDovL2xvY2FsaG9zdC9tb2QvZm9ydW0vdmlldy5waHA/aWQ9NSI7czo3OiJkaXNwbGF5IjtiOjE7fX0iO31zOjE3OiJjb250ZXh0aGFzcmVwb3MxMyI7YTozOntpOjA7aToxMzE3OTU1NjEwO2k6MTtzOjE6IjIiO2k6MjtzOjQ6ImI6MDsiO31zOjE3OiJjb3Vyc2Vfc2VjdGlvbnNfNCI7YTozOntpOjA7aToxMzE3OTU1NjQzO2k6MTtzOjE6IjIiO2k6MjtzOjM1OTI6ImE6MTc6e2k6MDtPOjg6InN0ZENsYXNzIjo5OntzOjc6InNlY3Rpb24iO3M6MToiMCI7czoyOiJpZCI7czoyOiIyNCI7czo2OiJjb3Vyc2UiO3M6MToiNCI7czo0OiJuYW1lIjtOO3M6Nzoic3VtbWFyeSI7TjtzOjEzOiJzdW1tYXJ5Zm9ybWF0IjtzOjE6IjEiO3M6ODoic2VxdWVuY2UiO3M6MToiNCI7czo3OiJ2aXNpYmxlIjtzOjE6IjEiO3M6MTI6Imhhc2FjdGl2aXRlcyI7YjoxO31pOjE7Tzo4OiJzdGRDbGFzcyI6OTp7czo3OiJzZWN0aW9uIjtzOjE6IjEiO3M6MjoiaWQiO3M6MjoiMjUiO3M6NjoiY291cnNlIjtzOjE6IjQiO3M6NDoibmFtZSI7TjtzOjc6InN1bW1hcnkiO3M6MDoiIjtzOjEzOiJzdW1tYXJ5Zm9ybWF0IjtzOjE6IjEiO3M6ODoic2VxdWVuY2UiO047czo3OiJ2aXNpYmxlIjtzOjE6IjEiO3M6MTI6Imhhc2FjdGl2aXRlcyI7YjowO31pOjI7Tzo4OiJzdGRDbGFzcyI6OTp7czo3OiJzZWN0aW9uIjtzOjE6IjIiO3M6MjoiaWQiO3M6MjoiMjYiO3M6NjoiY291cnNlIjtzOjE6IjQiO3M6NDoibmFtZSI7TjtzOjc6InN1bW1hcnkiO3M6MDoiIjtzOjEzOiJzdW1tYXJ5Zm9ybWF0IjtzOjE6IjEiO3M6ODoic2VxdWVuY2UiO047czo3OiJ2aXNpYmxlIjtzOjE6IjEiO3M6MTI6Imhhc2FjdGl2aXRlcyI7YjowO31pOjM7Tzo4OiJzdGRDbGFzcyI6OTp7czo3OiJzZWN0aW9uIjtzOjE6IjMiO3M6MjoiaWQiO3M6MjoiMjciO3M6NjoiY291cnNlIjtzOjE6IjQiO3M6NDoibmFtZSI7TjtzOjc6InN1bW1hcnkiO3M6MDoiIjtzOjEzOiJzdW1tYXJ5Zm9ybWF0IjtzOjE6IjEiO3M6ODoic2VxdWVuY2UiO047czo3OiJ2aXNpYmxlIjtzOjE6IjEiO3M6MTI6Imhhc2FjdGl2aXRlcyI7YjowO31pOjQ7Tzo4OiJzdGRDbGFzcyI6OTp7czo3OiJzZWN0aW9uIjtzOjE6IjQiO3M6MjoiaWQiO3M6MjoiMjgiO3M6NjoiY291cnNlIjtzOjE6IjQiO3M6NDoibmFtZSI7TjtzOjc6InN1bW1hcnkiO3M6MDoiIjtzOjEzOiJzdW1tYXJ5Zm9ybWF0IjtzOjE6IjEiO3M6ODoic2VxdWVuY2UiO047czo3OiJ2aXNpYmxlIjtzOjE6IjEiO3M6MTI6Imhhc2FjdGl2aXRlcyI7YjowO31pOjU7Tzo4OiJzdGRDbGFzcyI6OTp7czo3OiJzZWN0aW9uIjtzOjE6IjUiO3M6MjoiaWQiO3M6MjoiMjkiO3M6NjoiY291cnNlIjtzOjE6IjQiO3M6NDoibmFtZSI7TjtzOjc6InN1bW1hcnkiO3M6MDoiIjtzOjEzOiJzdW1tYXJ5Zm9ybWF0IjtzOjE6IjEiO3M6ODoic2VxdWVuY2UiO047czo3OiJ2aXNpYmxlIjtzOjE6IjEiO3M6MTI6Imhhc2FjdGl2aXRlcyI7YjowO31pOjY7Tzo4OiJzdGRDbGFzcyI6OTp7czo3OiJzZWN0aW9uIjtzOjE6IjYiO3M6MjoiaWQiO3M6MjoiMzAiO3M6NjoiY291cnNlIjtzOjE6IjQiO3M6NDoibmFtZSI7TjtzOjc6InN1bW1hcnkiO3M6MDoiIjtzOjEzOiJzdW1tYXJ5Zm9ybWF0IjtzOjE6IjEiO3M6ODoic2VxdWVuY2UiO047czo3OiJ2aXNpYmxlIjtzOjE6IjEiO3M6MTI6Imhhc2FjdGl2aXRlcyI7YjowO31pOjc7Tzo4OiJzdGRDbGFzcyI6OTp7czo3OiJzZWN0aW9uIjtzOjE6IjciO3M6MjoiaWQiO3M6MjoiMzEiO3M6NjoiY291cnNlIjtzOjE6IjQiO3M6NDoibmFtZSI7TjtzOjc6InN1bW1hcnkiO3M6MDoiIjtzOjEzOiJzdW1tYXJ5Zm9ybWF0IjtzOjE6IjEiO3M6ODoic2VxdWVuY2UiO047czo3OiJ2aXNpYmxlIjtzOjE6IjEiO3M6MTI6Imhhc2FjdGl2aXRlcyI7YjowO31pOjg7Tzo4OiJzdGRDbGFzcyI6OTp7czo3OiJzZWN0aW9uIjtzOjE6IjgiO3M6MjoiaWQiO3M6MjoiMzIiO3M6NjoiY291cnNlIjtzOjE6IjQiO3M6NDoibmFtZSI7TjtzOjc6InN1bW1hcnkiO3M6MDoiIjtzOjEzOiJzdW1tYXJ5Zm9ybWF0IjtzOjE6IjEiO3M6ODoic2VxdWVuY2UiO047czo3OiJ2aXNpYmxlIjtzOjE6IjEiO3M6MTI6Imhhc2FjdGl2aXRlcyI7YjowO31pOjk7Tzo4OiJzdGRDbGFzcyI6OTp7czo3OiJzZWN0aW9uIjtzOjE6IjkiO3M6MjoiaWQiO3M6MjoiMzMiO3M6NjoiY291cnNlIjtzOjE6IjQiO3M6NDoibmFtZSI7TjtzOjc6InN1bW1hcnkiO3M6MDoiIjtzOjEzOiJzdW1tYXJ5Zm9ybWF0IjtzOjE6IjEiO3M6ODoic2VxdWVuY2UiO047czo3OiJ2aXNpYmxlIjtzOjE6IjEiO3M6MTI6Imhhc2FjdGl2aXRlcyI7YjowO31pOjEwO086ODoic3RkQ2xhc3MiOjk6e3M6Nzoic2VjdGlvbiI7czoyOiIxMCI7czoyOiJpZCI7czoyOiIzNCI7czo2OiJjb3Vyc2UiO3M6MToiNCI7czo0OiJuYW1lIjtOO3M6Nzoic3VtbWFyeSI7czowOiIiO3M6MTM6InN1bW1hcnlmb3JtYXQiO3M6MToiMSI7czo4OiJzZXF1ZW5jZSI7TjtzOjc6InZpc2libGUiO3M6MToiMSI7czoxMjoiaGFzYWN0aXZpdGVzIjtiOjA7fWk6MTE7Tzo4OiJzdGRDbGFzcyI6OTp7czo3OiJzZWN0aW9uIjtzOjI6IjExIjtzOjI6ImlkIjtzOjI6IjM1IjtzOjY6ImNvdXJzZSI7czoxOiI0IjtzOjQ6Im5hbWUiO047czo3OiJzdW1tYXJ5IjtzOjA6IiI7czoxMzoic3VtbWFyeWZvcm1hdCI7czoxOiIxIjtzOjg6InNlcXVlbmNlIjtOO3M6NzoidmlzaWJsZSI7czoxOiIxIjtzOjEyOiJoYXNhY3Rpdml0ZXMiO2I6MDt9aToxMjtPOjg6InN0ZENsYXNzIjo5OntzOjc6InNlY3Rpb24iO3M6MjoiMTIiO3M6MjoiaWQiO3M6MjoiMzYiO3M6NjoiY291cnNlIjtzOjE6IjQiO3M6NDoibmFtZSI7TjtzOjc6InN1bW1hcnkiO3M6MDoiIjtzOjEzOiJzdW1tYXJ5Zm9ybWF0IjtzOjE6IjEiO3M6ODoic2VxdWVuY2UiO047czo3OiJ2aXNpYmxlIjtzOjE6IjEiO3M6MTI6Imhhc2FjdGl2aXRlcyI7YjowO31pOjEzO086ODoic3RkQ2xhc3MiOjk6e3M6Nzoic2VjdGlvbiI7czoyOiIxMyI7czoyOiJpZCI7czoyOiIzNyI7czo2OiJjb3Vyc2UiO3M6MToiNCI7czo0OiJuYW1lIjtOO3M6Nzoic3VtbWFyeSI7czowOiIiO3M6MTM6InN1bW1hcnlmb3JtYXQiO3M6MToiMSI7czo4OiJzZXF1ZW5jZSI7TjtzOjc6InZpc2libGUiO3M6MToiMSI7czoxMjoiaGFzYWN0aXZpdGVzIjtiOjA7fWk6MTQ7Tzo4OiJzdGRDbGFzcyI6OTp7czo3OiJzZWN0aW9uIjtzOjI6IjE0IjtzOjI6ImlkIjtzOjI6IjM4IjtzOjY6ImNvdXJzZSI7czoxOiI0IjtzOjQ6Im5hbWUiO047czo3OiJzdW1tYXJ5IjtzOjA6IiI7czoxMzoic3VtbWFyeWZvcm1hdCI7czoxOiIxIjtzOjg6InNlcXVlbmNlIjtOO3M6NzoidmlzaWJsZSI7czoxOiIxIjtzOjEyOiJoYXNhY3Rpdml0ZXMiO2I6MDt9aToxNTtPOjg6InN0ZENsYXNzIjo5OntzOjc6InNlY3Rpb24iO3M6MjoiMTUiO3M6MjoiaWQiO3M6MjoiMzkiO3M6NjoiY291cnNlIjtzOjE6IjQiO3M6NDoibmFtZSI7TjtzOjc6InN1bW1hcnkiO3M6MDoiIjtzOjEzOiJzdW1tYXJ5Zm9ybWF0IjtzOjE6IjEiO3M6ODoic2VxdWVuY2UiO047czo3OiJ2aXNpYmxlIjtzOjE6IjEiO3M6MTI6Imhhc2FjdGl2aXRlcyI7YjowO31pOjE2O086ODoic3RkQ2xhc3MiOjk6e3M6Nzoic2VjdGlvbiI7czoyOiIxNiI7czoyOiJpZCI7czoyOiI0MCI7czo2OiJjb3Vyc2UiO3M6MToiNCI7czo0OiJuYW1lIjtOO3M6Nzoic3VtbWFyeSI7czowOiIiO3M6MTM6InN1bW1hcnlmb3JtYXQiO3M6MToiMSI7czo4OiJzZXF1ZW5jZSI7TjtzOjc6InZpc2libGUiO3M6MToiMSI7czoxMjoiaGFzYWN0aXZpdGVzIjtiOjA7fX0iO31zOjE4OiJjb3Vyc2VfYWN0aXZpdGVzXzQiO2E6Mzp7aTowO2k6MTMxNzk1NTY0MztpOjE7czoxOiIyIjtpOjI7czoyODA6ImE6MTp7aTo0O086ODoic3RkQ2xhc3MiOjEwOntzOjc6InNlY3Rpb24iO3M6MToiMCI7czo0OiJuYW1lIjtzOjk6Ik5vdmVkYWRlcyI7czo0OiJpY29uIjtzOjA6IiI7czoxMzoiaWNvbmNvbXBvbmVudCI7czowOiIiO3M6MjoiaWQiO3M6MToiNCI7czo2OiJoaWRkZW4iO2I6MDtzOjc6Im1vZG5hbWUiO3M6NToiZm9ydW0iO3M6ODoibm9kZXR5cGUiO2k6MDtzOjM6InVybCI7czo0MDoiaHR0cDovL2xvY2FsaG9zdC9tb2QvZm9ydW0vdmlldy5waHA/aWQ9NCI7czo3OiJkaXNwbGF5IjtiOjE7fX0iO31zOjE3OiJjb250ZXh0aGFzcmVwb3M0NiI7YTozOntpOjA7aToxMzE3OTU1NjQzO2k6MTtzOjE6IjIiO2k6MjtzOjQ6ImI6MDsiO31zOjE3OiJjb3Vyc2Vfc2VjdGlvbnNfMyI7YTozOntpOjA7aToxMzE3OTU2MzQ4O2k6MTtzOjE6IjIiO2k6MjtzOjIzMjA6ImE6MTE6e2k6MDtPOjg6InN0ZENsYXNzIjo5OntzOjc6InNlY3Rpb24iO3M6MToiMCI7czoyOiJpZCI7czoyOiIxMyI7czo2OiJjb3Vyc2UiO3M6MToiMyI7czo0OiJuYW1lIjtOO3M6Nzoic3VtbWFyeSI7TjtzOjEzOiJzdW1tYXJ5Zm9ybWF0IjtzOjE6IjEiO3M6ODoic2VxdWVuY2UiO3M6MToiMyI7czo3OiJ2aXNpYmxlIjtzOjE6IjEiO3M6MTI6Imhhc2FjdGl2aXRlcyI7YjoxO31pOjE7Tzo4OiJzdGRDbGFzcyI6OTp7czo3OiJzZWN0aW9uIjtzOjE6IjEiO3M6MjoiaWQiO3M6MjoiMTQiO3M6NjoiY291cnNlIjtzOjE6IjMiO3M6NDoibmFtZSI7TjtzOjc6InN1bW1hcnkiO3M6MDoiIjtzOjEzOiJzdW1tYXJ5Zm9ybWF0IjtzOjE6IjEiO3M6ODoic2VxdWVuY2UiO047czo3OiJ2aXNpYmxlIjtzOjE6IjEiO3M6MTI6Imhhc2FjdGl2aXRlcyI7YjowO31pOjI7Tzo4OiJzdGRDbGFzcyI6OTp7czo3OiJzZWN0aW9uIjtzOjE6IjIiO3M6MjoiaWQiO3M6MjoiMTUiO3M6NjoiY291cnNlIjtzOjE6IjMiO3M6NDoibmFtZSI7TjtzOjc6InN1bW1hcnkiO3M6MDoiIjtzOjEzOiJzdW1tYXJ5Zm9ybWF0IjtzOjE6IjEiO3M6ODoic2VxdWVuY2UiO047czo3OiJ2aXNpYmxlIjtzOjE6IjEiO3M6MTI6Imhhc2FjdGl2aXRlcyI7YjowO31pOjM7Tzo4OiJzdGRDbGFzcyI6OTp7czo3OiJzZWN0aW9uIjtzOjE6IjMiO3M6MjoiaWQiO3M6MjoiMTYiO3M6NjoiY291cnNlIjtzOjE6IjMiO3M6NDoibmFtZSI7TjtzOjc6InN1bW1hcnkiO3M6MDoiIjtzOjEzOiJzdW1tYXJ5Zm9ybWF0IjtzOjE6IjEiO3M6ODoic2VxdWVuY2UiO047czo3OiJ2aXNpYmxlIjtzOjE6IjEiO3M6MTI6Imhhc2FjdGl2aXRlcyI7YjowO31pOjQ7Tzo4OiJzdGRDbGFzcyI6OTp7czo3OiJzZWN0aW9uIjtzOjE6IjQiO3M6MjoiaWQiO3M6MjoiMTciO3M6NjoiY291cnNlIjtzOjE6IjMiO3M6NDoibmFtZSI7TjtzOjc6InN1bW1hcnkiO3M6MDoiIjtzOjEzOiJzdW1tYXJ5Zm9ybWF0IjtzOjE6IjEiO3M6ODoic2VxdWVuY2UiO047czo3OiJ2aXNpYmxlIjtzOjE6IjEiO3M6MTI6Imhhc2FjdGl2aXRlcyI7YjowO31pOjU7Tzo4OiJzdGRDbGFzcyI6OTp7czo3OiJzZWN0aW9uIjtzOjE6IjUiO3M6MjoiaWQiO3M6MjoiMTgiO3M6NjoiY291cnNlIjtzOjE6IjMiO3M6NDoibmFtZSI7TjtzOjc6InN1bW1hcnkiO3M6MDoiIjtzOjEzOiJzdW1tYXJ5Zm9ybWF0IjtzOjE6IjEiO3M6ODoic2VxdWVuY2UiO047czo3OiJ2aXNpYmxlIjtzOjE6IjEiO3M6MTI6Imhhc2FjdGl2aXRlcyI7YjowO31pOjY7Tzo4OiJzdGRDbGFzcyI6OTp7czo3OiJzZWN0aW9uIjtzOjE6IjYiO3M6MjoiaWQiO3M6MjoiMTkiO3M6NjoiY291cnNlIjtzOjE6IjMiO3M6NDoibmFtZSI7TjtzOjc6InN1bW1hcnkiO3M6MDoiIjtzOjEzOiJzdW1tYXJ5Zm9ybWF0IjtzOjE6IjEiO3M6ODoic2VxdWVuY2UiO047czo3OiJ2aXNpYmxlIjtzOjE6IjEiO3M6MTI6Imhhc2FjdGl2aXRlcyI7YjowO31pOjc7Tzo4OiJzdGRDbGFzcyI6OTp7czo3OiJzZWN0aW9uIjtzOjE6IjciO3M6MjoiaWQiO3M6MjoiMjAiO3M6NjoiY291cnNlIjtzOjE6IjMiO3M6NDoibmFtZSI7TjtzOjc6InN1bW1hcnkiO3M6MDoiIjtzOjEzOiJzdW1tYXJ5Zm9ybWF0IjtzOjE6IjEiO3M6ODoic2VxdWVuY2UiO047czo3OiJ2aXNpYmxlIjtzOjE6IjEiO3M6MTI6Imhhc2FjdGl2aXRlcyI7YjowO31pOjg7Tzo4OiJzdGRDbGFzcyI6OTp7czo3OiJzZWN0aW9uIjtzOjE6IjgiO3M6MjoiaWQiO3M6MjoiMjEiO3M6NjoiY291cnNlIjtzOjE6IjMiO3M6NDoibmFtZSI7TjtzOjc6InN1bW1hcnkiO3M6MDoiIjtzOjEzOiJzdW1tYXJ5Zm9ybWF0IjtzOjE6IjEiO3M6ODoic2VxdWVuY2UiO047czo3OiJ2aXNpYmxlIjtzOjE6IjEiO3M6MTI6Imhhc2FjdGl2aXRlcyI7YjowO31pOjk7Tzo4OiJzdGRDbGFzcyI6OTp7czo3OiJzZWN0aW9uIjtzOjE6IjkiO3M6MjoiaWQiO3M6MjoiMjIiO3M6NjoiY291cnNlIjtzOjE6IjMiO3M6NDoibmFtZSI7TjtzOjc6InN1bW1hcnkiO3M6MDoiIjtzOjEzOiJzdW1tYXJ5Zm9ybWF0IjtzOjE6IjEiO3M6ODoic2VxdWVuY2UiO047czo3OiJ2aXNpYmxlIjtzOjE6IjEiO3M6MTI6Imhhc2FjdGl2aXRlcyI7YjowO31pOjEwO086ODoic3RkQ2xhc3MiOjk6e3M6Nzoic2VjdGlvbiI7czoyOiIxMCI7czoyOiJpZCI7czoyOiIyMyI7czo2OiJjb3Vyc2UiO3M6MToiMyI7czo0OiJuYW1lIjtOO3M6Nzoic3VtbWFyeSI7czowOiIiO3M6MTM6InN1bW1hcnlmb3JtYXQiO3M6MToiMSI7czo4OiJzZXF1ZW5jZSI7TjtzOjc6InZpc2libGUiO3M6MToiMSI7czoxMjoiaGFzYWN0aXZpdGVzIjtiOjA7fX0iO31zOjE4OiJjb3Vyc2VfYWN0aXZpdGVzXzMiO2E6Mzp7aTowO2k6MTMxNzk1NjM0ODtpOjE7czoxOiIyIjtpOjI7czoyODA6ImE6MTp7aTozO086ODoic3RkQ2xhc3MiOjEwOntzOjc6InNlY3Rpb24iO3M6MToiMCI7czo0OiJuYW1lIjtzOjk6Ik5vdmVkYWRlcyI7czo0OiJpY29uIjtzOjA6IiI7czoxMzoiaWNvbmNvbXBvbmVudCI7czowOiIiO3M6MjoiaWQiO3M6MToiMyI7czo2OiJoaWRkZW4iO2I6MDtzOjc6Im1vZG5hbWUiO3M6NToiZm9ydW0iO3M6ODoibm9kZXR5cGUiO2k6MDtzOjM6InVybCI7czo0MDoiaHR0cDovL2xvY2FsaG9zdC9tb2QvZm9ydW0vdmlldy5waHA/aWQ9MyI7czo3OiJkaXNwbGF5IjtiOjE7fX0iO31zOjE3OiJjb250ZXh0aGFzcmVwb3M0MCI7YTozOntpOjA7aToxMzE3OTU2MzQ5O2k6MTtzOjE6IjIiO2k6MjtzOjQ6ImI6MDsiO31zOjE3OiJjb3Vyc2Vfc2VjdGlvbnNfMiI7YTozOntpOjA7aToxMzE3OTU2OTQ2O2k6MTtzOjE6IjIiO2k6MjtzOjIzMTI6ImE6MTE6e2k6MDtPOjg6InN0ZENsYXNzIjo5OntzOjc6InNlY3Rpb24iO3M6MToiMCI7czoyOiJpZCI7czoxOiIyIjtzOjY6ImNvdXJzZSI7czoxOiIyIjtzOjQ6Im5hbWUiO047czo3OiJzdW1tYXJ5IjtOO3M6MTM6InN1bW1hcnlmb3JtYXQiO3M6MToiMSI7czo4OiJzZXF1ZW5jZSI7czoxOiIyIjtzOjc6InZpc2libGUiO3M6MToiMSI7czoxMjoiaGFzYWN0aXZpdGVzIjtiOjE7fWk6MTtPOjg6InN0ZENsYXNzIjo5OntzOjc6InNlY3Rpb24iO3M6MToiMSI7czoyOiJpZCI7czoxOiIzIjtzOjY6ImNvdXJzZSI7czoxOiIyIjtzOjQ6Im5hbWUiO047czo3OiJzdW1tYXJ5IjtzOjA6IiI7czoxMzoic3VtbWFyeWZvcm1hdCI7czoxOiIxIjtzOjg6InNlcXVlbmNlIjtOO3M6NzoidmlzaWJsZSI7czoxOiIxIjtzOjEyOiJoYXNhY3Rpdml0ZXMiO2I6MDt9aToyO086ODoic3RkQ2xhc3MiOjk6e3M6Nzoic2VjdGlvbiI7czoxOiIyIjtzOjI6ImlkIjtzOjE6IjQiO3M6NjoiY291cnNlIjtzOjE6IjIiO3M6NDoibmFtZSI7TjtzOjc6InN1bW1hcnkiO3M6MDoiIjtzOjEzOiJzdW1tYXJ5Zm9ybWF0IjtzOjE6IjEiO3M6ODoic2VxdWVuY2UiO047czo3OiJ2aXNpYmxlIjtzOjE6IjEiO3M6MTI6Imhhc2FjdGl2aXRlcyI7YjowO31pOjM7Tzo4OiJzdGRDbGFzcyI6OTp7czo3OiJzZWN0aW9uIjtzOjE6IjMiO3M6MjoiaWQiO3M6MToiNSI7czo2OiJjb3Vyc2UiO3M6MToiMiI7czo0OiJuYW1lIjtOO3M6Nzoic3VtbWFyeSI7czowOiIiO3M6MTM6InN1bW1hcnlmb3JtYXQiO3M6MToiMSI7czo4OiJzZXF1ZW5jZSI7TjtzOjc6InZpc2libGUiO3M6MToiMSI7czoxMjoiaGFzYWN0aXZpdGVzIjtiOjA7fWk6NDtPOjg6InN0ZENsYXNzIjo5OntzOjc6InNlY3Rpb24iO3M6MToiNCI7czoyOiJpZCI7czoxOiI2IjtzOjY6ImNvdXJzZSI7czoxOiIyIjtzOjQ6Im5hbWUiO047czo3OiJzdW1tYXJ5IjtzOjA6IiI7czoxMzoic3VtbWFyeWZvcm1hdCI7czoxOiIxIjtzOjg6InNlcXVlbmNlIjtOO3M6NzoidmlzaWJsZSI7czoxOiIxIjtzOjEyOiJoYXNhY3Rpdml0ZXMiO2I6MDt9aTo1O086ODoic3RkQ2xhc3MiOjk6e3M6Nzoic2VjdGlvbiI7czoxOiI1IjtzOjI6ImlkIjtzOjE6IjciO3M6NjoiY291cnNlIjtzOjE6IjIiO3M6NDoibmFtZSI7TjtzOjc6InN1bW1hcnkiO3M6MDoiIjtzOjEzOiJzdW1tYXJ5Zm9ybWF0IjtzOjE6IjEiO3M6ODoic2VxdWVuY2UiO047czo3OiJ2aXNpYmxlIjtzOjE6IjEiO3M6MTI6Imhhc2FjdGl2aXRlcyI7YjowO31pOjY7Tzo4OiJzdGRDbGFzcyI6OTp7czo3OiJzZWN0aW9uIjtzOjE6IjYiO3M6MjoiaWQiO3M6MToiOCI7czo2OiJjb3Vyc2UiO3M6MToiMiI7czo0OiJuYW1lIjtOO3M6Nzoic3VtbWFyeSI7czowOiIiO3M6MTM6InN1bW1hcnlmb3JtYXQiO3M6MToiMSI7czo4OiJzZXF1ZW5jZSI7TjtzOjc6InZpc2libGUiO3M6MToiMSI7czoxMjoiaGFzYWN0aXZpdGVzIjtiOjA7fWk6NztPOjg6InN0ZENsYXNzIjo5OntzOjc6InNlY3Rpb24iO3M6MToiNyI7czoyOiJpZCI7czoxOiI5IjtzOjY6ImNvdXJzZSI7czoxOiIyIjtzOjQ6Im5hbWUiO047czo3OiJzdW1tYXJ5IjtzOjA6IiI7czoxMzoic3VtbWFyeWZvcm1hdCI7czoxOiIxIjtzOjg6InNlcXVlbmNlIjtOO3M6NzoidmlzaWJsZSI7czoxOiIxIjtzOjEyOiJoYXNhY3Rpdml0ZXMiO2I6MDt9aTo4O086ODoic3RkQ2xhc3MiOjk6e3M6Nzoic2VjdGlvbiI7czoxOiI4IjtzOjI6ImlkIjtzOjI6IjEwIjtzOjY6ImNvdXJzZSI7czoxOiIyIjtzOjQ6Im5hbWUiO047czo3OiJzdW1tYXJ5IjtzOjA6IiI7czoxMzoic3VtbWFyeWZvcm1hdCI7czoxOiIxIjtzOjg6InNlcXVlbmNlIjtOO3M6NzoidmlzaWJsZSI7czoxOiIxIjtzOjEyOiJoYXNhY3Rpdml0ZXMiO2I6MDt9aTo5O086ODoic3RkQ2xhc3MiOjk6e3M6Nzoic2VjdGlvbiI7czoxOiI5IjtzOjI6ImlkIjtzOjI6IjExIjtzOjY6ImNvdXJzZSI7czoxOiIyIjtzOjQ6Im5hbWUiO047czo3OiJzdW1tYXJ5IjtzOjA6IiI7czoxMzoic3VtbWFyeWZvcm1hdCI7czoxOiIxIjtzOjg6InNlcXVlbmNlIjtOO3M6NzoidmlzaWJsZSI7czoxOiIxIjtzOjEyOiJoYXNhY3Rpdml0ZXMiO2I6MDt9aToxMDtPOjg6InN0ZENsYXNzIjo5OntzOjc6InNlY3Rpb24iO3M6MjoiMTAiO3M6MjoiaWQiO3M6MjoiMTIiO3M6NjoiY291cnNlIjtzOjE6IjIiO3M6NDoibmFtZSI7TjtzOjc6InN1bW1hcnkiO3M6MDoiIjtzOjEzOiJzdW1tYXJ5Zm9ybWF0IjtzOjE6IjEiO3M6ODoic2VxdWVuY2UiO047czo3OiJ2aXNpYmxlIjtzOjE6IjEiO3M6MTI6Imhhc2FjdGl2aXRlcyI7YjowO319Ijt9czoxODoiY291cnNlX2FjdGl2aXRlc18yIjthOjM6e2k6MDtpOjEzMTc5NTY5NDY7aToxO3M6MToiMiI7aToyO3M6MjgwOiJhOjE6e2k6MjtPOjg6InN0ZENsYXNzIjoxMDp7czo3OiJzZWN0aW9uIjtzOjE6IjAiO3M6NDoibmFtZSI7czo5OiJOb3ZlZGFkZXMiO3M6NDoiaWNvbiI7czowOiIiO3M6MTM6Imljb25jb21wb25lbnQiO3M6MDoiIjtzOjI6ImlkIjtzOjE6IjIiO3M6NjoiaGlkZGVuIjtiOjA7czo3OiJtb2RuYW1lIjtzOjU6ImZvcnVtIjtzOjg6Im5vZGV0eXBlIjtpOjA7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly9sb2NhbGhvc3QvbW9kL2ZvcnVtL3ZpZXcucGhwP2lkPTIiO3M6NzoiZGlzcGxheSI7YjoxO319Ijt9czoxNzoiY29udGV4dGhhc3JlcG9zMjQiO2E6Mzp7aTowO2k6MTMxNzk1Njk0NjtpOjE7czoxOiIyIjtpOjI7czo0OiJiOjA7Ijt9fX1zOjIyOiJhZG1pbl9jcml0aWNhbF93YXJuaW5nIjtpOjA7czoyMToibG9hZF9uYXZpZ2F0aW9uX2FkbWluIjtiOjE7czoxNDoiZnJvbWRpc2N1c3Npb24iO3M6Mzc6Imh0dHA6Ly9sb2NhbGhvc3QvY291cnNlL3ZpZXcucGhwP2lkPTQiO31VU0VSfE86ODoic3RkQ2xhc3MiOjYyOntzOjI6ImlkIjtzOjE6IjIiO3M6NDoiYXV0aCI7czo2OiJtYW51YWwiO3M6OToiY29uZmlybWVkIjtzOjE6IjEiO3M6MTI6InBvbGljeWFncmVlZCI7czoxOiIwIjtzOjc6ImRlbGV0ZWQiO3M6MToiMCI7czo5OiJzdXNwZW5kZWQiO3M6MToiMCI7czoxMDoibW5ldGhvc3RpZCI7czoxOiIxIjtzOjg6InVzZXJuYW1lIjtzOjU6ImFkbWluIjtzOjg6InBhc3N3b3JkIjtzOjMyOiJlNmQwYTI5OGUwZTA0NTQ1YzkwZjRmZTI4NzIwNWJkMSI7czo4OiJpZG51bWJlciI7czowOiIiO3M6OToiZmlyc3RuYW1lIjtzOjU6ImFkbWluIjtzOjg6Imxhc3RuYW1lIjtzOjc6IlVzdWFyaW8iO3M6NToiZW1haWwiO3M6NDg6InRhbGxlcmRlcHJvZ3JhbWFjaW9uaWlmaXViYTIwMTFAZ29vZ2xlZ3JvdXBzLmNvbSI7czo5OiJlbWFpbHN0b3AiO3M6MToiMCI7czozOiJpY3EiO3M6MDoiIjtzOjU6InNreXBlIjtzOjA6IiI7czo1OiJ5YWhvbyI7czowOiIiO3M6MzoiYWltIjtzOjA6IiI7czozOiJtc24iO3M6MDoiIjtzOjY6InBob25lMSI7czowOiIiO3M6NjoicGhvbmUyIjtzOjA6IiI7czoxMToiaW5zdGl0dXRpb24iO3M6MDoiIjtzOjEwOiJkZXBhcnRtZW50IjtzOjA6IiI7czo3OiJhZGRyZXNzIjtzOjA6IiI7czo0OiJjaXR5IjtzOjEyOiJCdWVub3MgQWlyZXMiO3M6NzoiY291bnRyeSI7czoyOiJBUiI7czo0OiJsYW5nIjtzOjU6ImVzX2FyIjtzOjU6InRoZW1lIjtzOjA6IiI7czo4OiJ0aW1lem9uZSI7czoyOiI5OSI7czoxMToiZmlyc3RhY2Nlc3MiO3M6MTA6IjEzMTY1Njc1MDMiO3M6MTA6Imxhc3RhY2Nlc3MiO2k6MTMxNzk1NzI3NztzOjk6Imxhc3Rsb2dpbiI7czoxMDoiMTMxNzk0NTU1NiI7czoxMjoiY3VycmVudGxvZ2luIjtpOjEzMTc5NTU1NzM7czo2OiJsYXN0aXAiO3M6MTU6IjA6MDowOjA6MDowOjA6MSI7czo2OiJzZWNyZXQiO3M6MDoiIjtzOjc6InBpY3R1cmUiO3M6MToiMCI7czozOiJ1cmwiO3M6MDoiIjtzOjE3OiJkZXNjcmlwdGlvbmZvcm1hdCI7czoxOiIwIjtzOjEwOiJtYWlsZm9ybWF0IjtzOjE6IjEiO3M6MTA6Im1haWxkaWdlc3QiO3M6MToiMCI7czoxMToibWFpbGRpc3BsYXkiO3M6MToiMSI7czoxMDoiaHRtbGVkaXRvciI7czoxOiIxIjtzOjQ6ImFqYXgiO3M6MToiMSI7czoxMzoiYXV0b3N1YnNjcmliZSI7czoxOiIxIjtzOjExOiJ0cmFja2ZvcnVtcyI7czoxOiIwIjtzOjExOiJ0aW1lY3JlYXRlZCI7czoxOiIwIjtzOjEyOiJ0aW1lbW9kaWZpZWQiO3M6MTA6IjEzMTY1Njc1MDMiO3M6MTI6InRydXN0Yml0bWFzayI7czoxOiIwIjtzOjg6ImltYWdlYWx0IjtOO3M6MTI6InNjcmVlbnJlYWRlciI7czoxOiIxIjtzOjE2OiJsYXN0Y291cnNlYWNjZXNzIjthOjI6e2k6MjtzOjEwOiIxMzE3ODQ4NDI5IjtpOjM7czoxMDoiMTMxNzM5NzY0MCI7fXM6MTk6ImN1cnJlbnRjb3Vyc2VhY2Nlc3MiO2E6Mzp7aTo0O2k6MTMxNzk1NzE0OTtpOjM7aToxMzE3OTU3Mjc3O2k6MjtpOjEzMTc5NTY5NDU7fXM6MTE6Imdyb3VwbWVtYmVyIjthOjA6e31zOjc6InByb2ZpbGUiO2E6Mzp7czozOiJkbmkiO3M6MDoiIjtzOjY6InBhZHJvbiI7czowOiIiO3M6MTM6InJvbHNvbGljaXRhZG8iO3M6NzoiTWllbWJybyI7fXM6Nzoic2Vzc2tleSI7czoxMDoibHZCd1k1VkdQdyI7czoxMDoicHJlZmVyZW5jZSI7YTo5OntzOjIzOiJkZWZpbmVyb2xlX3Nob3dhZHZhbmNlZCI7czowOiIiO3M6MjQ6ImRvY2tlZF9ibG9ja19pbnN0YW5jZV8xMCI7czoxOiIwIjtzOjIzOiJkb2NrZWRfYmxvY2tfaW5zdGFuY2VfNSI7czoxOiIwIjtzOjE4OiJlbWFpbF9ib3VuY2VfY291bnQiO3M6MToiMSI7czoxNjoiZW1haWxfc2VuZF9jb3VudCI7czoxOiIxIjtzOjI5OiJ1c2Vyc2VsZWN0b3JfYXV0b3NlbGVjdHVuaXF1ZSI7czoxOiIwIjtzOjI5OiJ1c2Vyc2VsZWN0b3JfcHJlc2VydmVzZWxlY3RlZCI7czoxOiIwIjtzOjI3OiJ1c2Vyc2VsZWN0b3Jfc2VhcmNoYW55d2hlcmUiO3M6MToiMCI7czoxMToiX2xhc3Rsb2FkZWQiO2k6MTMxNzk1NzI5NTt9czoxNzoibWVzc2FnZV9sYXN0cG9wdXAiO2k6MDtzOjc6ImRpc3BsYXkiO2E6MTp7aTozO2k6MDt9czoyNToiYWpheF91cGRhdGFibGVfdXNlcl9wcmVmcyI7YToxNjp7czoyMzoiZG9ja2VkX2Jsb2NrX2luc3RhbmNlXzQiO3M6MzoiaW50IjtzOjIzOiJkb2NrZWRfYmxvY2tfaW5zdGFuY2VfNSI7czozOiJpbnQiO3M6MTM6ImJsb2NrMTBoaWRkZW4iO3M6NDoiYm9vbCI7czoxMzoiYmxvY2sxN2hpZGRlbiI7czo0OiJib29sIjtzOjEzOiJibG9jazE4aGlkZGVuIjtzOjQ6ImJvb2wiO3M6MTM6ImJsb2NrMTZoaWRkZW4iO3M6NDoiYm9vbCI7czoxMzoiYmxvY2sxOWhpZGRlbiI7czo0OiJib29sIjtzOjEyOiJibG9jazFoaWRkZW4iO3M6NDoiYm9vbCI7czoxMjoiYmxvY2s0aGlkZGVuIjtzOjQ6ImJvb2wiO3M6MTM6ImJsb2NrMTVoaWRkZW4iO3M6NDoiYm9vbCI7czoxMjoiYmxvY2s1aGlkZGVuIjtzOjQ6ImJvb2wiO3M6MTM6ImJsb2NrMjVoaWRkZW4iO3M6NDoiYm9vbCI7czoyOToidXNlcnNlbGVjdG9yX29wdGlvbnNjb2xsYXBzZWQiO3M6NDoiYm9vbCI7czoyOToidXNlcnNlbGVjdG9yX3ByZXNlcnZlc2VsZWN0ZWQiO3M6NDoiYm9vbCI7czoyOToidXNlcnNlbGVjdG9yX2F1dG9zZWxlY3R1bmlxdWUiO3M6NDoiYm9vbCI7czoyNzoidXNlcnNlbGVjdG9yX3NlYXJjaGFueXdoZXJlIjtzOjQ6ImJvb2wiO31zOjc6ImVkaXRpbmciO2k6MDtzOjEzOiJ1c2Vyc2VsZWN0b3JzIjthOjg6e3M6MzI6IjlhNTY1MDM3ZjA3YWUzZTNkZGUwYzY0ZTY3NjhiNDQwIjthOjc6e3M6NToiY2xhc3MiO3M6MzI6ImVucm9sX21hbnVhbF9jdXJyZW50X3BhcnRpY2lwYW50IjtzOjQ6Im5hbWUiO3M6MTI6InJlbW92ZXNlbGVjdCI7czo3OiJleGNsdWRlIjthOjA6e31zOjExOiJleHRyYWZpZWxkcyI7YToxOntpOjA7czo1OiJlbWFpbCI7fXM6MTE6Im11bHRpc2VsZWN0IjtiOjE7czo3OiJlbnJvbGlkIjtpOjc7czo0OiJmaWxlIjtzOjI1OiJlbnJvbC9tYW51YWwvbG9jYWxsaWIucGhwIjt9czozMjoiMjQ3Y2RkMmNkOWM3YTgxYzU0ZGU0ZTFmZDk5NjE1MDMiO2E6Nzp7czo1OiJjbGFzcyI7czozNDoiZW5yb2xfbWFudWFsX3BvdGVudGlhbF9wYXJ0aWNpcGFudCI7czo0OiJuYW1lIjtzOjk6ImFkZHNlbGVjdCI7czo3OiJleGNsdWRlIjthOjA6e31zOjExOiJleHRyYWZpZWxkcyI7YToxOntpOjA7czo1OiJlbWFpbCI7fXM6MTE6Im11bHRpc2VsZWN0IjtiOjE7czo3OiJlbnJvbGlkIjtpOjc7czo0OiJmaWxlIjtzOjI1OiJlbnJvbC9tYW51YWwvbG9jYWxsaWIucGhwIjt9czozMjoiYzlkZjc5MzRiOGZiNjgxNmNiOTU0NzFhZmYwYWJlYmMiO2E6Nzp7czo1OiJjbGFzcyI7czozMjoiZW5yb2xfbWFudWFsX2N1cnJlbnRfcGFydGljaXBhbnQiO3M6NDoibmFtZSI7czoxMjoicmVtb3Zlc2VsZWN0IjtzOjc6ImV4Y2x1ZGUiO2E6MDp7fXM6MTE6ImV4dHJhZmllbGRzIjthOjE6e2k6MDtzOjU6ImVtYWlsIjt9czoxMToibXVsdGlzZWxlY3QiO2I6MTtzOjc6ImVucm9saWQiO2k6NDtzOjQ6ImZpbGUiO3M6MjU6ImVucm9sL21hbnVhbC9sb2NhbGxpYi5waHAiO31zOjMyOiIwYWI2NzVkOWRkNTJjMjBhYTE5MmVkNTg5ODQzYTI1NCI7YTo3OntzOjU6ImNsYXNzIjtzOjM0OiJlbnJvbF9tYW51YWxfcG90ZW50aWFsX3BhcnRpY2lwYW50IjtzOjQ6Im5hbWUiO3M6OToiYWRkc2VsZWN0IjtzOjc6ImV4Y2x1ZGUiO2E6MDp7fXM6MTE6ImV4dHJhZmllbGRzIjthOjE6e2k6MDtzOjU6ImVtYWlsIjt9czoxMToibXVsdGlzZWxlY3QiO2I6MTtzOjc6ImVucm9saWQiO2k6NDtzOjQ6ImZpbGUiO3M6MjU6ImVucm9sL21hbnVhbC9sb2NhbGxpYi5waHAiO31zOjMyOiJlYmM5ZTE3MDk3NTUwN2QzMGY3ZWRlZDgwOTE0YzRmNiI7YTo3OntzOjU6ImNsYXNzIjtzOjQzOiJlbnJvbF9tYW51YWxfcG90ZW50aWFsX3BhcnRpY2lwYW50X21lZGlhZG9yIjtzOjQ6Im5hbWUiO3M6OToiYWRkc2VsZWN0IjtzOjc6ImV4Y2x1ZGUiO2E6MDp7fXM6MTE6ImV4dHJhZmllbGRzIjthOjE6e2k6MDtzOjU6ImVtYWlsIjt9czoxMToibXVsdGlzZWxlY3QiO2I6MTtzOjc6ImVucm9saWQiO2k6NztzOjQ6ImZpbGUiO3M6MjU6ImVucm9sL21hbnVhbC9sb2NhbGxpYi5waHAiO31zOjMyOiJkNDk5MTAzNDVkN2RjMDdhZjI3NDkzZGVmNzAyN2Y2NCI7YTo3OntzOjU6ImNsYXNzIjtzOjMyOiJlbnJvbF9tYW51YWxfY3VycmVudF9wYXJ0aWNpcGFudCI7czo0OiJuYW1lIjtzOjEyOiJyZW1vdmVzZWxlY3QiO3M6NzoiZXhjbHVkZSI7YTowOnt9czoxMToiZXh0cmFmaWVsZHMiO2E6MTp7aTowO3M6NToiZW1haWwiO31zOjExOiJtdWx0aXNlbGVjdCI7YjoxO3M6NzoiZW5yb2xpZCI7aToxO3M6NDoiZmlsZSI7czoyNToiZW5yb2wvbWFudWFsL2xvY2FsbGliLnBocCI7fXM6MzI6IjA3NTdmMzUxZDU5YTU5ZGVjNThmYTljMjZjZTE0ZWJlIjthOjc6e3M6NToiY2xhc3MiO3M6NDM6ImVucm9sX21hbnVhbF9wb3RlbnRpYWxfcGFydGljaXBhbnRfbWVkaWFkb3IiO3M6NDoibmFtZSI7czo5OiJhZGRzZWxlY3QiO3M6NzoiZXhjbHVkZSI7YTowOnt9czoxMToiZXh0cmFmaWVsZHMiO2E6MTp7aTowO3M6NToiZW1haWwiO31zOjExOiJtdWx0aXNlbGVjdCI7YjoxO3M6NzoiZW5yb2xpZCI7aToxO3M6NDoiZmlsZSI7czoyNToiZW5yb2wvbWFudWFsL2xvY2FsbGliLnBocCI7fXM6MzI6IjE4Mzg0ODFiN2E2YWFhMTA5OTEzNmQ5OGIwYjljNmM0IjthOjc6e3M6NToiY2xhc3MiO3M6NDM6ImVucm9sX21hbnVhbF9wb3RlbnRpYWxfcGFydGljaXBhbnRfbWVkaWFkb3IiO3M6NDoibmFtZSI7czo5OiJhZGRzZWxlY3QiO3M6NzoiZXhjbHVkZSI7YTowOnt9czoxMToiZXh0cmFmaWVsZHMiO2E6MTp7aTowO3M6NToiZW1haWwiO31zOjExOiJtdWx0aXNlbGVjdCI7YjoxO3M6NzoiZW5yb2xpZCI7aTo0O3M6NDoiZmlsZSI7czoyNToiZW5yb2wvbWFudWFsL2xvY2FsbGliLnBocCI7fX1zOjY6ImFjY2VzcyI7YTo1OntzOjI6InJhIjthOjE6e3M6MjoiLzEiO2E6MTp7aTo3O3M6MToiNyI7fX1zOjQ6InJkZWYiO2E6MTp7czo0OiIvMTo3IjthOjUxOntzOjM1OiJtb29kbGUvd2Vic2VydmljZTpjcmVhdGVtb2JpbGV0b2tlbiI7czoxOiIxIjtzOjI2OiJtb29kbGUvYmxvZzptYW5hZ2VleHRlcm5hbCI7czoxOiIxIjtzOjI0OiJyZXBvc2l0b3J5L2FsZnJlc2NvOnZpZXciO3M6MToiMSI7czoxODoibW9vZGxlL2Jsb2c6c2VhcmNoIjtzOjE6IjEiO3M6MjI6InJlcG9zaXRvcnkvYm94bmV0OnZpZXciO3M6MToiMSI7czoxNjoibW9vZGxlL2Jsb2c6dmlldyI7czoxOiIxIjtzOjI3OiJyZXBvc2l0b3J5L2NvdXJzZWZpbGVzOnZpZXciO3M6MToiMSI7czozMjoibW9vZGxlL2NhbGVuZGFyOm1hbmFnZW93bmVudHJpZXMiO3M6MToiMSI7czoyMzoicmVwb3NpdG9yeS9kcm9wYm94OnZpZXciO3M6MToiMSI7czoxOToibW9vZGxlL2NvbW1lbnQ6cG9zdCI7czoxOiIxIjtzOjI2OiJyZXBvc2l0b3J5L2ZpbGVzeXN0ZW06dmlldyI7czoxOiIxIjtzOjE5OiJtb29kbGUvY29tbWVudDp2aWV3IjtzOjE6IjEiO3M6Mjk6InJlcG9zaXRvcnkvZmxpY2tyX3B1YmxpYzp2aWV3IjtzOjE6IjEiO3M6MjE6Im1vb2RsZS9jb3Vyc2U6cmVxdWVzdCI7czoxOiIxIjtzOjIyOiJyZXBvc2l0b3J5L2ZsaWNrcjp2aWV3IjtzOjE6IjEiO3M6MjI6Im1vb2RsZS9teTptYW5hZ2VibG9ja3MiO3M6MToiMSI7czoyNjoicmVwb3NpdG9yeS9nb29nbGVkb2NzOnZpZXciO3M6MToiMSI7czoyMzoibW9vZGxlL3BvcnRmb2xpbzpleHBvcnQiO3M6MToiMSI7czoyMToicmVwb3NpdG9yeS9sb2NhbDp2aWV3IjtzOjE6IjEiO3M6MTg6Im1vb2RsZS9yYXRpbmc6cmF0ZSI7czoxOiIxIjtzOjIyOiJyZXBvc2l0b3J5L21lcmxvdDp2aWV3IjtzOjE6IjEiO3M6MTg6Im1vb2RsZS9yYXRpbmc6dmlldyI7czoxOiIxIjtzOjIyOiJyZXBvc2l0b3J5L3BpY2FzYTp2aWV3IjtzOjE6IjEiO3M6MjE6Im1vb2RsZS9yYXRpbmc6dmlld2FsbCI7czoxOiIxIjtzOjI3OiJibG9jay9vbmxpbmVfdXNlcnM6dmlld2xpc3QiO3M6MToiMSI7czoyMjoicmVwb3NpdG9yeS9yZWNlbnQ6dmlldyI7czoxOiIxIjtzOjIxOiJtb29kbGUvcmF0aW5nOnZpZXdhbnkiO3M6MToiMSI7czoxNToibW9kL2ZvbGRlcjp2aWV3IjtzOjE6IjEiO3M6MTg6InJlcG9zaXRvcnkvczM6dmlldyI7czoxOiIxIjtzOjIzOiJtb29kbGUvc2l0ZTpzZW5kbWVzc2FnZSI7czoxOiIxIjtzOjE0OiJtb2QvaW1zY3A6dmlldyI7czoxOiIxIjtzOjIyOiJyZXBvc2l0b3J5L3VwbG9hZDp2aWV3IjtzOjE6IjEiO3M6MTc6Im1vb2RsZS90YWc6Y3JlYXRlIjtzOjE6IjEiO3M6MTM6Im1vZC9wYWdlOnZpZXciO3M6MToiMSI7czoxOToicmVwb3NpdG9yeS91cmw6dmlldyI7czoxOiIxIjtzOjE1OiJtb29kbGUvdGFnOmVkaXQiO3M6MToiMSI7czoxNzoibW9kL3Jlc291cmNlOnZpZXciO3M6MToiMSI7czoyMDoicmVwb3NpdG9yeS91c2VyOnZpZXciO3M6MToiMSI7czoyOToibW9vZGxlL3VzZXI6Y2hhbmdlb3ducGFzc3dvcmQiO3M6MToiMSI7czoxMjoibW9kL3VybDp2aWV3IjtzOjE6IjEiO3M6MjI6InJlcG9zaXRvcnkvd2ViZGF2OnZpZXciO3M6MToiMSI7czozMzoibW9vZGxlL3VzZXI6ZWRpdG93bm1lc3NhZ2Vwcm9maWxlIjtzOjE6IjEiO3M6MTc6Im1vb2RsZS9ibG9jazp2aWV3IjtzOjE6IjEiO3M6MjU6InJlcG9zaXRvcnkvd2lraW1lZGlhOnZpZXciO3M6MToiMSI7czoyNjoibW9vZGxlL3VzZXI6ZWRpdG93bnByb2ZpbGUiO3M6MToiMSI7czoyNzoibW9vZGxlL2Jsb2c6YXNzb2NpYXRlY291cnNlIjtzOjE6IjEiO3M6MjM6InJlcG9zaXRvcnkveW91dHViZTp2aWV3IjtzOjE6IjEiO3M6Mjc6Im1vb2RsZS91c2VyOm1hbmFnZW93bmJsb2NrcyI7czoxOiIxIjtzOjI3OiJtb29kbGUvYmxvZzphc3NvY2lhdGVtb2R1bGUiO3M6MToiMSI7czoyNjoibW9vZGxlL3VzZXI6bWFuYWdlb3duZmlsZXMiO3M6MToiMSI7czoxODoibW9vZGxlL2Jsb2c6Y3JlYXRlIjtzOjE6IjEiO319czo2OiJsb2FkZWQiO2E6MDp7fXM6MjoiZHIiO3M6MToiNyI7czo0OiJ0aW1lIjtpOjEzMTc5NTcyOTY7fX0=', 1317955574, 1317957297, '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `mdl_sessions` (`id`, `state`, `sid`, `userid`, `sessdata`, `timecreated`, `timemodified`, `firstip`, `lastip`) VALUES
(311, 0, 'pug8ab4o8nfgla870pkc99pl25', 13, 'U0VTU0lPTnxPOjg6InN0ZENsYXNzIjo2OntzOjEwOiJsb2dpbmNvdW50IjtpOjA7czo4OiJuYXZjYWNoZSI7Tzo4OiJzdGRDbGFzcyI6MTp7czoxMDoibmF2aWdhdGlvbiI7YTozOntzOjE3OiJjb3Vyc2Vfc2VjdGlvbnNfMSI7YTozOntpOjA7aToxMzE4MDExNjgwO2k6MTtzOjI6IjEzIjtpOjI7czoyMjM6ImE6MTp7aTowO086ODoic3RkQ2xhc3MiOjk6e3M6Nzoic2VjdGlvbiI7czoxOiIwIjtzOjI6ImlkIjtzOjE6IjEiO3M6NjoiY291cnNlIjtzOjE6IjEiO3M6NDoibmFtZSI7TjtzOjc6InN1bW1hcnkiO3M6MDoiIjtzOjEzOiJzdW1tYXJ5Zm9ybWF0IjtzOjE6IjEiO3M6ODoic2VxdWVuY2UiO3M6MzoiMSw1IjtzOjc6InZpc2libGUiO3M6MToiMSI7czoxMjoiaGFzYWN0aXZpdGVzIjtiOjE7fX0iO31zOjE4OiJjb3Vyc2VfYWN0aXZpdGVzXzEiO2E6Mzp7aTowO2k6MTMxODAxMTY4MDtpOjE7czoyOiIxMyI7aToyO3M6NTY4OiJhOjI6e2k6MTtPOjg6InN0ZENsYXNzIjoxMDp7czo3OiJzZWN0aW9uIjtzOjE6IjAiO3M6NDoibmFtZSI7czo5OiJDYXJ0ZWxlcmEiO3M6NDoiaWNvbiI7czowOiIiO3M6MTM6Imljb25jb21wb25lbnQiO3M6MDoiIjtzOjI6ImlkIjtzOjE6IjEiO3M6NjoiaGlkZGVuIjtiOjA7czo3OiJtb2RuYW1lIjtzOjU6ImZvcnVtIjtzOjg6Im5vZGV0eXBlIjtpOjA7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly9sb2NhbGhvc3QvbW9kL2ZvcnVtL3ZpZXcucGhwP2lkPTEiO3M6NzoiZGlzcGxheSI7YjoxO31pOjU7Tzo4OiJzdGRDbGFzcyI6MTA6e3M6Nzoic2VjdGlvbiI7czoxOiIwIjtzOjQ6Im5hbWUiO3M6MjI6IkZvcm8gR2VuZXJhbCBkZSBsYSBSZWQiO3M6NDoiaWNvbiI7czowOiIiO3M6MTM6Imljb25jb21wb25lbnQiO3M6MDoiIjtzOjI6ImlkIjtzOjE6IjUiO3M6NjoiaGlkZGVuIjtiOjA7czo3OiJtb2RuYW1lIjtzOjU6ImZvcnVtIjtzOjg6Im5vZGV0eXBlIjtpOjA7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly9sb2NhbGhvc3QvbW9kL2ZvcnVtL3ZpZXcucGhwP2lkPTUiO3M6NzoiZGlzcGxheSI7YjoxO319Ijt9czoxNzoiY29udGV4dGhhc3JlcG9zMzkiO2E6Mzp7aTowO2k6MTMxODAxMTY4MDtpOjE7czoyOiIxMyI7aToyO3M6NDoiYjowOyI7fX19czoyMToibG9hZF9uYXZpZ2F0aW9uX2FkbWluIjtiOjA7czoxNDoiZnJvbWRpc2N1c3Npb24iO3M6MTY6Imh0dHA6Ly9sb2NhbGhvc3QiO3M6MTI6ImZsYXNodmVyc2lvbiI7czo4OiIxMC4zLjE4MyI7czo4OiJ3YW50c3VybCI7czozNzoiaHR0cDovL2xvY2FsaG9zdC9jb3Vyc2Uvdmlldy5waHA/aWQ9MiI7fVVTRVJ8Tzo4OiJzdGRDbGFzcyI6NjE6e3M6MjoiaWQiO3M6MjoiMTMiO3M6NDoiYXV0aCI7czo1OiJlbWFpbCI7czo5OiJjb25maXJtZWQiO3M6MToiMSI7czoxMjoicG9saWN5YWdyZWVkIjtzOjE6IjAiO3M6NzoiZGVsZXRlZCI7czoxOiIwIjtzOjk6InN1c3BlbmRlZCI7czoxOiIwIjtzOjEwOiJtbmV0aG9zdGlkIjtzOjE6IjEiO3M6ODoidXNlcm5hbWUiO3M6MTU6ImFwcmVuZGl6cG9wcGVyMSI7czo4OiJwYXNzd29yZCI7czozMjoiZTZkMGEyOThlMGUwNDU0NWM5MGY0ZmUyODcyMDViZDEiO3M6ODoiaWRudW1iZXIiO3M6MDoiIjtzOjk6ImZpcnN0bmFtZSI7czo5OiJBcHJlbmRpejEiO3M6ODoibGFzdG5hbWUiO3M6NjoiUG9wcGVyIjtzOjU6ImVtYWlsIjtzOjI1OiJhcHJlbmRpenBvcHBlcjFAZ21haWwuY29tIjtzOjk6ImVtYWlsc3RvcCI7czoxOiIwIjtzOjM6ImljcSI7czowOiIiO3M6NToic2t5cGUiO3M6MDoiIjtzOjU6InlhaG9vIjtzOjA6IiI7czozOiJhaW0iO3M6MDoiIjtzOjM6Im1zbiI7czowOiIiO3M6NjoicGhvbmUxIjtzOjA6IiI7czo2OiJwaG9uZTIiO3M6MDoiIjtzOjExOiJpbnN0aXR1dGlvbiI7czowOiIiO3M6MTA6ImRlcGFydG1lbnQiO3M6MDoiIjtzOjc6ImFkZHJlc3MiO3M6MDoiIjtzOjQ6ImNpdHkiO3M6MTI6IkJ1ZW5vcyBBaXJlcyI7czo3OiJjb3VudHJ5IjtzOjI6IkFSIjtzOjQ6ImxhbmciO3M6NToiZXNfYXIiO3M6NToidGhlbWUiO3M6MDoiIjtzOjg6InRpbWV6b25lIjtzOjI6Ijk5IjtzOjExOiJmaXJzdGFjY2VzcyI7czoxMDoiMTMxNzMyNjE4NiI7czoxMDoibGFzdGFjY2VzcyI7czoxMDoiMTMxODAxMTYyOSI7czo5OiJsYXN0bG9naW4iO3M6MTA6IjEzMTgwMTE2MjkiO3M6MTI6ImN1cnJlbnRsb2dpbiI7aToxMzE4MDExNjgwO3M6NjoibGFzdGlwIjtzOjk6IjEyNy4wLjAuMSI7czo2OiJzZWNyZXQiO3M6MTU6IllIQ2VXUDhzY2VkWDlkSiI7czo3OiJwaWN0dXJlIjtzOjE6IjAiO3M6MzoidXJsIjtzOjA6IiI7czoxNzoiZGVzY3JpcHRpb25mb3JtYXQiO3M6MToiMCI7czoxMDoibWFpbGZvcm1hdCI7czoxOiIxIjtzOjEwOiJtYWlsZGlnZXN0IjtzOjE6IjAiO3M6MTE6Im1haWxkaXNwbGF5IjtzOjE6IjIiO3M6MTA6Imh0bWxlZGl0b3IiO3M6MToiMSI7czo0OiJhamF4IjtzOjE6IjEiO3M6MTM6ImF1dG9zdWJzY3JpYmUiO3M6MToiMSI7czoxMToidHJhY2tmb3J1bXMiO3M6MToiMCI7czoxMToidGltZWNyZWF0ZWQiO3M6MTA6IjEzMTczMjYwNjciO3M6MTI6InRpbWVtb2RpZmllZCI7czoxOiIwIjtzOjEyOiJ0cnVzdGJpdG1hc2siO3M6MToiMCI7czo4OiJpbWFnZWFsdCI7TjtzOjEyOiJzY3JlZW5yZWFkZXIiO3M6MToiMCI7czoxNjoibGFzdGNvdXJzZWFjY2VzcyI7YToxOntpOjM7czoxMDoiMTMxODAxMTYzNCI7fXM6MTk6ImN1cnJlbnRjb3Vyc2VhY2Nlc3MiO2E6MDp7fXM6MTE6Imdyb3VwbWVtYmVyIjthOjA6e31zOjc6InByb2ZpbGUiO2E6Mzp7czozOiJkbmkiO3M6ODoiMTIzNDU2NzgiO3M6NjoicGFkcm9uIjtzOjg6IjEyMzQ1Njc4IjtzOjEzOiJyb2xzb2xpY2l0YWRvIjtzOjg6IkFwcmVuZGl6Ijt9czo2OiJhY2Nlc3MiO2E6NTp7czoyOiJyYSI7YToyOntzOjI6Ii8xIjthOjI6e2k6NTtzOjE6IjUiO2k6NztzOjE6IjciO31zOjg6Ii8xLzIyLzQwIjthOjE6e2k6NTtzOjE6IjUiO319czo0OiJyZGVmIjthOjE4OntzOjQ6Ii8xOjUiO2E6NjY6e3M6Mjc6ImJsb2NrL29ubGluZV91c2Vyczp2aWV3bGlzdCI7czoxOiIxIjtzOjIyOiJlbnJvbC9zZWxmOnVuZW5yb2xzZWxmIjtzOjE6IjEiO3M6MjU6ImdyYWRlcmVwb3J0L292ZXJ2aWV3OnZpZXciO3M6MToiMSI7czoyMToiZ3JhZGVyZXBvcnQvdXNlcjp2aWV3IjtzOjE6IjEiO3M6MzQ6Im1vZC9hc3NpZ25tZW50OmV4cG9ydG93bnN1Ym1pc3Npb24iO3M6MToiMSI7czoyMToibW9kL2Fzc2lnbm1lbnQ6c3VibWl0IjtzOjE6IjEiO3M6MTk6Im1vZC9hc3NpZ25tZW50OnZpZXciO3M6MToiMSI7czoxMzoibW9kL2NoYXQ6Y2hhdCI7czoxOiIxIjtzOjE2OiJtb2QvY2hhdDpyZWFkbG9nIjtzOjE6IjEiO3M6MTc6Im1vZC9jaG9pY2U6Y2hvb3NlIjtzOjE6IjEiO3M6MTY6Im1vZC9kYXRhOmNvbW1lbnQiO3M6MToiMSI7czoyMzoibW9kL2RhdGE6ZXhwb3J0b3duZW50cnkiO3M6MToiMSI7czoxODoibW9kL2RhdGE6dmlld2VudHJ5IjtzOjE6IjEiO3M6MTk6Im1vZC9kYXRhOndyaXRlZW50cnkiO3M6MToiMSI7czoyMToibW9kL2ZlZWRiYWNrOmNvbXBsZXRlIjtzOjE6IjEiO3M6MTc6Im1vZC9mZWVkYmFjazp2aWV3IjtzOjE6IjEiO3M6Mjg6Im1vZC9mZWVkYmFjazp2aWV3YW5hbHlzZXBhZ2UiO3M6MToiMSI7czoyNjoibW9kL2ZvcnVtOmNyZWF0ZWF0dGFjaG1lbnQiO3M6MToiMSI7czoyMzoibW9kL2ZvcnVtOmRlbGV0ZW93bnBvc3QiO3M6MToiMSI7czoyMzoibW9kL2ZvcnVtOmV4cG9ydG93bnBvc3QiO3M6MToiMSI7czozMDoibW9kL2ZvcnVtOmluaXRpYWxzdWJzY3JpcHRpb25zIjtzOjE6IjEiO3M6MTk6Im1vZC9mb3J1bTpyZXBseXBvc3QiO3M6MToiMSI7czoyNToibW9kL2ZvcnVtOnN0YXJ0ZGlzY3Vzc2lvbiI7czoxOiIxIjtzOjI0OiJtb2QvZm9ydW06dmlld2Rpc2N1c3Npb24iO3M6MToiMSI7czoyMDoibW9kL2ZvcnVtOnZpZXdyYXRpbmciO3M6MToiMSI7czoyMDoibW9kL2dsb3NzYXJ5OmNvbW1lbnQiO3M6MToiMSI7czoyNzoibW9kL2dsb3NzYXJ5OmV4cG9ydG93bmVudHJ5IjtzOjE6IjEiO3M6MTg6Im1vZC9nbG9zc2FyeTp3cml0ZSI7czoxOiIxIjtzOjE2OiJtb2QvcXVpejphdHRlbXB0IjtzOjE6IjEiO3M6MjU6Im1vZC9xdWl6OnJldmlld215YXR0ZW1wdHMiO3M6MToiMSI7czoxMzoibW9kL3F1aXo6dmlldyI7czoxOiIxIjtzOjE5OiJtb2Qvc2Nvcm06c2F2ZXRyYWNrIjtzOjE6IjEiO3M6MTg6Im1vZC9zY29ybTpza2lwdmlldyI7czoxOiIxIjtzOjIwOiJtb2Qvc2Nvcm06dmlld3Njb3JlcyI7czoxOiIxIjtzOjIyOiJtb2Qvc3VydmV5OnBhcnRpY2lwYXRlIjtzOjE6IjEiO3M6MTk6Im1vZC93aWtpOmNyZWF0ZXBhZ2UiO3M6MToiMSI7czoyMDoibW9kL3dpa2k6ZWRpdGNvbW1lbnQiO3M6MToiMSI7czoxNzoibW9kL3dpa2k6ZWRpdHBhZ2UiO3M6MToiMSI7czoyMDoibW9kL3dpa2k6dmlld2NvbW1lbnQiO3M6MToiMSI7czoxNzoibW9kL3dpa2k6dmlld3BhZ2UiO3M6MToiMSI7czoyMzoibW9kL3dvcmtzaG9wOnBlZXJhc3Nlc3MiO3M6MToiMSI7czoxOToibW9kL3dvcmtzaG9wOnN1Ym1pdCI7czoxOiIxIjtzOjE3OiJtb2Qvd29ya3Nob3A6dmlldyI7czoxOiIxIjtzOjI4OiJtb2Qvd29ya3Nob3A6dmlld2F1dGhvcm5hbWVzIjtzOjE6IjEiO3M6MzI6Im1vZC93b3Jrc2hvcDp2aWV3YXV0aG9ycHVibGlzaGVkIjtzOjE6IjEiO3M6Mzc6Im1vZC93b3Jrc2hvcDp2aWV3cHVibGlzaGVkc3VibWlzc2lvbnMiO3M6MToiMSI7czoxNzoibW9vZGxlL2Jsb2NrOnZpZXciO3M6MToiMSI7czoyNzoibW9vZGxlL2Jsb2c6YXNzb2NpYXRlY291cnNlIjtzOjE6IjEiO3M6Mjc6Im1vb2RsZS9ibG9nOmFzc29jaWF0ZW1vZHVsZSI7czoxOiIxIjtzOjI2OiJtb29kbGUvYmxvZzptYW5hZ2VleHRlcm5hbCI7czoxOiIxIjtzOjE4OiJtb29kbGUvYmxvZzpzZWFyY2giO3M6MToiMSI7czoxNjoibW9vZGxlL2Jsb2c6dmlldyI7czoxOiIxIjtzOjE5OiJtb29kbGUvY29tbWVudDpwb3N0IjtzOjE6IjEiO3M6MTk6Im1vb2RsZS9jb21tZW50OnZpZXciO3M6MToiMSI7czozMDoibW9vZGxlL2NvdXJzZTp2aWV3cGFydGljaXBhbnRzIjtzOjE6IjEiO3M6MjQ6Im1vb2RsZS9jb3Vyc2U6dmlld3NjYWxlcyI7czoxOiIxIjtzOjE3OiJtb29kbGUvZ3JhZGU6dmlldyI7czoxOiIxIjtzOjIzOiJtb29kbGUvcG9ydGZvbGlvOmV4cG9ydCI7czoxOiIxIjtzOjIwOiJtb29kbGUvcXVlc3Rpb246ZmxhZyI7czoxOiIxIjtzOjE4OiJtb29kbGUvcmF0aW5nOnJhdGUiO3M6MToiMSI7czoxODoibW9vZGxlL3JhdGluZzp2aWV3IjtzOjE6IjEiO3M6MjE6Im1vb2RsZS9yYXRpbmc6dmlld2FsbCI7czoxOiIxIjtzOjIxOiJtb29kbGUvcmF0aW5nOnZpZXdhbnkiO3M6MToiMSI7czoyNToibW9vZGxlL3VzZXI6cmVhZHVzZXJibG9ncyI7czoxOiIxIjtzOjI1OiJtb29kbGUvdXNlcjpyZWFkdXNlcnBvc3RzIjtzOjE6IjEiO3M6MjM6Im1vb2RsZS91c2VyOnZpZXdkZXRhaWxzIjtzOjE6IjEiO31zOjQ6Ii8xOjciO2E6NTE6e3M6MjY6InJlcG9zaXRvcnkvZ29vZ2xlZG9jczp2aWV3IjtzOjE6IjEiO3M6MjM6Im1vb2RsZS9wb3J0Zm9saW86ZXhwb3J0IjtzOjE6IjEiO3M6MjE6InJlcG9zaXRvcnkvbG9jYWw6dmlldyI7czoxOiIxIjtzOjE4OiJtb29kbGUvcmF0aW5nOnJhdGUiO3M6MToiMSI7czoyMjoicmVwb3NpdG9yeS9tZXJsb3Q6dmlldyI7czoxOiIxIjtzOjE4OiJtb29kbGUvcmF0aW5nOnZpZXciO3M6MToiMSI7czoyMjoicmVwb3NpdG9yeS9waWNhc2E6dmlldyI7czoxOiIxIjtzOjIxOiJtb29kbGUvcmF0aW5nOnZpZXdhbGwiO3M6MToiMSI7czoyNzoiYmxvY2svb25saW5lX3VzZXJzOnZpZXdsaXN0IjtzOjE6IjEiO3M6MjI6InJlcG9zaXRvcnkvcmVjZW50OnZpZXciO3M6MToiMSI7czoyMToibW9vZGxlL3JhdGluZzp2aWV3YW55IjtzOjE6IjEiO3M6MTU6Im1vZC9mb2xkZXI6dmlldyI7czoxOiIxIjtzOjE4OiJyZXBvc2l0b3J5L3MzOnZpZXciO3M6MToiMSI7czoyMzoibW9vZGxlL3NpdGU6c2VuZG1lc3NhZ2UiO3M6MToiMSI7czoxNDoibW9kL2ltc2NwOnZpZXciO3M6MToiMSI7czoyMjoicmVwb3NpdG9yeS91cGxvYWQ6dmlldyI7czoxOiIxIjtzOjE3OiJtb29kbGUvdGFnOmNyZWF0ZSI7czoxOiIxIjtzOjEzOiJtb2QvcGFnZTp2aWV3IjtzOjE6IjEiO3M6MTk6InJlcG9zaXRvcnkvdXJsOnZpZXciO3M6MToiMSI7czoxNToibW9vZGxlL3RhZzplZGl0IjtzOjE6IjEiO3M6MTc6Im1vZC9yZXNvdXJjZTp2aWV3IjtzOjE6IjEiO3M6MjA6InJlcG9zaXRvcnkvdXNlcjp2aWV3IjtzOjE6IjEiO3M6Mjk6Im1vb2RsZS91c2VyOmNoYW5nZW93bnBhc3N3b3JkIjtzOjE6IjEiO3M6MTI6Im1vZC91cmw6dmlldyI7czoxOiIxIjtzOjIyOiJyZXBvc2l0b3J5L3dlYmRhdjp2aWV3IjtzOjE6IjEiO3M6MzM6Im1vb2RsZS91c2VyOmVkaXRvd25tZXNzYWdlcHJvZmlsZSI7czoxOiIxIjtzOjE3OiJtb29kbGUvYmxvY2s6dmlldyI7czoxOiIxIjtzOjI1OiJyZXBvc2l0b3J5L3dpa2ltZWRpYTp2aWV3IjtzOjE6IjEiO3M6MjY6Im1vb2RsZS91c2VyOmVkaXRvd25wcm9maWxlIjtzOjE6IjEiO3M6Mjc6Im1vb2RsZS9ibG9nOmFzc29jaWF0ZWNvdXJzZSI7czoxOiIxIjtzOjIzOiJyZXBvc2l0b3J5L3lvdXR1YmU6dmlldyI7czoxOiIxIjtzOjI3OiJtb29kbGUvdXNlcjptYW5hZ2Vvd25ibG9ja3MiO3M6MToiMSI7czoyNzoibW9vZGxlL2Jsb2c6YXNzb2NpYXRlbW9kdWxlIjtzOjE6IjEiO3M6MjY6Im1vb2RsZS91c2VyOm1hbmFnZW93bmZpbGVzIjtzOjE6IjEiO3M6MTg6Im1vb2RsZS9ibG9nOmNyZWF0ZSI7czoxOiIxIjtzOjM1OiJtb29kbGUvd2Vic2VydmljZTpjcmVhdGVtb2JpbGV0b2tlbiI7czoxOiIxIjtzOjI2OiJtb29kbGUvYmxvZzptYW5hZ2VleHRlcm5hbCI7czoxOiIxIjtzOjI0OiJyZXBvc2l0b3J5L2FsZnJlc2NvOnZpZXciO3M6MToiMSI7czoxODoibW9vZGxlL2Jsb2c6c2VhcmNoIjtzOjE6IjEiO3M6MjI6InJlcG9zaXRvcnkvYm94bmV0OnZpZXciO3M6MToiMSI7czoxNjoibW9vZGxlL2Jsb2c6dmlldyI7czoxOiIxIjtzOjI3OiJyZXBvc2l0b3J5L2NvdXJzZWZpbGVzOnZpZXciO3M6MToiMSI7czozMjoibW9vZGxlL2NhbGVuZGFyOm1hbmFnZW93bmVudHJpZXMiO3M6MToiMSI7czoyMzoicmVwb3NpdG9yeS9kcm9wYm94OnZpZXciO3M6MToiMSI7czoxOToibW9vZGxlL2NvbW1lbnQ6cG9zdCI7czoxOiIxIjtzOjI2OiJyZXBvc2l0b3J5L2ZpbGVzeXN0ZW06dmlldyI7czoxOiIxIjtzOjE5OiJtb29kbGUvY29tbWVudDp2aWV3IjtzOjE6IjEiO3M6Mjk6InJlcG9zaXRvcnkvZmxpY2tyX3B1YmxpYzp2aWV3IjtzOjE6IjEiO3M6MjE6Im1vb2RsZS9jb3Vyc2U6cmVxdWVzdCI7czoxOiIxIjtzOjIyOiJyZXBvc2l0b3J5L2ZsaWNrcjp2aWV3IjtzOjE6IjEiO3M6MjI6Im1vb2RsZS9teTptYW5hZ2VibG9ja3MiO3M6MToiMSI7fXM6ODoiLzEvMi80OjUiO2E6MTp7czoxNzoibW9vZGxlL2Jsb2NrOnZpZXciO3M6MjoiLTEiO31zOjg6Ii8xLzIvNDo3IjthOjE6e3M6MTc6Im1vb2RsZS9ibG9jazp2aWV3IjtzOjI6Ii0xIjt9czo5OiIvMS8yLzM3OjUiO2E6MTp7czoxNzoibW9vZGxlL2Jsb2NrOnZpZXciO3M6MjoiLTEiO31zOjk6Ii8xLzIvMzc6NyI7YToxOntzOjE3OiJtb29kbGUvYmxvY2s6dmlldyI7czoyOiItMSI7fXM6OToiLzEvMi8zNjo3IjthOjE6e3M6MTc6Im1vb2RsZS9ibG9jazp2aWV3IjtzOjI6Ii0xIjt9czo5OiIvMS8yLzM1OjUiO2E6MTp7czoxNzoibW9vZGxlL2Jsb2NrOnZpZXciO3M6NToiLTEwMDAiO31zOjk6Ii8xLzIvMzQ6NSI7YToxOntzOjE3OiJtb29kbGUvYmxvY2s6dmlldyI7czoyOiItMSI7fXM6OToiLzEvMi8zNDo3IjthOjE6e3M6MTc6Im1vb2RsZS9ibG9jazp2aWV3IjtzOjI6Ii0xIjt9czo5OiIvMS8yLzE3OjUiO2E6OTp7czoyNjoibW9kL2ZvcnVtOmNyZWF0ZWF0dGFjaG1lbnQiO3M6MjoiLTEiO3M6MjM6Im1vZC9mb3J1bTpkZWxldGVvd25wb3N0IjtzOjI6Ii0xIjtzOjIzOiJtb2QvZm9ydW06ZXhwb3J0b3ducG9zdCI7czoyOiItMSI7czozMDoibW9kL2ZvcnVtOmluaXRpYWxzdWJzY3JpcHRpb25zIjtzOjI6Ii0xIjtzOjE5OiJtb2QvZm9ydW06cmVwbHlwb3N0IjtzOjI6Ii0xIjtzOjI1OiJtb2QvZm9ydW06c3RhcnRkaXNjdXNzaW9uIjtzOjI6Ii0xIjtzOjIwOiJtb2QvZm9ydW06dmlld3JhdGluZyI7czoyOiItMSI7czoxODoibW9vZGxlL3JhdGluZzpyYXRlIjtzOjI6Ii0xIjtzOjE4OiJtb29kbGUvcmF0aW5nOnZpZXciO3M6MjoiLTEiO31zOjk6Ii8xLzIvMTc6NyI7YTozOntzOjI0OiJtb2QvZm9ydW06dmlld2Rpc2N1c3Npb24iO3M6MToiMSI7czoxODoibW9vZGxlL3JhdGluZzpyYXRlIjtzOjI6Ii0xIjtzOjE4OiJtb29kbGUvcmF0aW5nOnZpZXciO3M6MjoiLTEiO31zOjk6Ii8xLzIvMTU6NSI7YToxOntzOjE3OiJtb29kbGUvYmxvY2s6dmlldyI7czoyOiItMSI7fXM6OToiLzEvMi8xNTo3IjthOjE6e3M6MTc6Im1vb2RsZS9ibG9jazp2aWV3IjtzOjI6Ii0xIjt9czo2OiIvMS83OjUiO2E6MTp7czoxNzoibW9vZGxlL2Jsb2NrOnZpZXciO3M6MjoiLTEiO31zOjY6Ii8xLzc6NyI7YToxOntzOjE3OiJtb29kbGUvYmxvY2s6dmlldyI7czoyOiItMSI7fXM6NjoiLzEvODo1IjthOjE6e3M6MTc6Im1vb2RsZS9ibG9jazp2aWV3IjtzOjI6Ii0xIjt9czo2OiIvMS84OjciO2E6MTp7czoxNzoibW9vZGxlL2Jsb2NrOnZpZXciO3M6MjoiLTEiO319czo2OiJsb2FkZWQiO2E6Mzp7aTowO3M6NDoiLzEvMiI7aToxO3M6NDoiLzEvNyI7aToyO3M6NDoiLzEvOCI7fXM6MjoiZHIiO3M6MToiNyI7czo0OiJ0aW1lIjtpOjEzMTgwMTE2ODA7fXM6Nzoic2Vzc2tleSI7czoxMDoibnNRZGFETFdYWCI7czoxMDoicHJlZmVyZW5jZSI7YToxOntzOjExOiJfbGFzdGxvYWRlZCI7aToxMzE4MDExNjg4O31zOjE3OiJtZXNzYWdlX2xhc3Rwb3B1cCI7aTowO3M6NzoiZGlzcGxheSI7YToxOntpOjE7aTowO31zOjI1OiJhamF4X3VwZGF0YWJsZV91c2VyX3ByZWZzIjthOjQ6e3M6MjM6ImRvY2tlZF9ibG9ja19pbnN0YW5jZV80IjtzOjM6ImludCI7czoyMzoiZG9ja2VkX2Jsb2NrX2luc3RhbmNlXzUiO3M6MzoiaW50IjtzOjEzOiJibG9jazE4aGlkZGVuIjtzOjQ6ImJvb2wiO3M6MTM6ImJsb2NrMTVoaWRkZW4iO3M6NDoiYm9vbCI7fXM6NToiZW5yb2wiO2E6Mjp7czo4OiJlbnJvbGxlZCI7YTowOnt9czo5OiJ0ZW1wZ3Vlc3QiO2E6MDp7fX19', 1318011680, 1318011688, '127.0.0.1', '127.0.0.1'),
(315, 0, 'lv627ke4phvg3ks14fhsfnbss4', 14, 'U0VTU0lPTnxPOjg6InN0ZENsYXNzIjo1OntzOjEwOiJsb2dpbmNvdW50IjtpOjA7czo4OiJuYXZjYWNoZSI7Tzo4OiJzdGRDbGFzcyI6MTp7czoxMDoibmF2aWdhdGlvbiI7YTo2OntzOjE3OiJjb3Vyc2Vfc2VjdGlvbnNfMSI7YTozOntpOjA7aToxMzE4MDEyMzUyO2k6MTtzOjI6IjE0IjtpOjI7czoyMjM6ImE6MTp7aTowO086ODoic3RkQ2xhc3MiOjk6e3M6Nzoic2VjdGlvbiI7czoxOiIwIjtzOjI6ImlkIjtzOjE6IjEiO3M6NjoiY291cnNlIjtzOjE6IjEiO3M6NDoibmFtZSI7TjtzOjc6InN1bW1hcnkiO3M6MDoiIjtzOjEzOiJzdW1tYXJ5Zm9ybWF0IjtzOjE6IjEiO3M6ODoic2VxdWVuY2UiO3M6MzoiMSw1IjtzOjc6InZpc2libGUiO3M6MToiMSI7czoxMjoiaGFzYWN0aXZpdGVzIjtiOjE7fX0iO31zOjE4OiJjb3Vyc2VfYWN0aXZpdGVzXzEiO2E6Mzp7aTowO2k6MTMxODAxMjM1MjtpOjE7czoyOiIxNCI7aToyO3M6NTY4OiJhOjI6e2k6MTtPOjg6InN0ZENsYXNzIjoxMDp7czo3OiJzZWN0aW9uIjtzOjE6IjAiO3M6NDoibmFtZSI7czo5OiJDYXJ0ZWxlcmEiO3M6NDoiaWNvbiI7czowOiIiO3M6MTM6Imljb25jb21wb25lbnQiO3M6MDoiIjtzOjI6ImlkIjtzOjE6IjEiO3M6NjoiaGlkZGVuIjtiOjA7czo3OiJtb2RuYW1lIjtzOjU6ImZvcnVtIjtzOjg6Im5vZGV0eXBlIjtpOjA7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly9sb2NhbGhvc3QvbW9kL2ZvcnVtL3ZpZXcucGhwP2lkPTEiO3M6NzoiZGlzcGxheSI7YjoxO31pOjU7Tzo4OiJzdGRDbGFzcyI6MTA6e3M6Nzoic2VjdGlvbiI7czoxOiIwIjtzOjQ6Im5hbWUiO3M6MjI6IkZvcm8gR2VuZXJhbCBkZSBsYSBSZWQiO3M6NDoiaWNvbiI7czowOiIiO3M6MTM6Imljb25jb21wb25lbnQiO3M6MDoiIjtzOjI6ImlkIjtzOjE6IjUiO3M6NjoiaGlkZGVuIjtiOjA7czo3OiJtb2RuYW1lIjtzOjU6ImZvcnVtIjtzOjg6Im5vZGV0eXBlIjtpOjA7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly9sb2NhbGhvc3QvbW9kL2ZvcnVtL3ZpZXcucGhwP2lkPTUiO3M6NzoiZGlzcGxheSI7YjoxO319Ijt9czoxNzoiY29udGV4dGhhc3JlcG9zMzgiO2E6Mzp7aTowO2k6MTMxODAxMjM1MjtpOjE7czoyOiIxNCI7aToyO3M6NDoiYjowOyI7fXM6MTc6ImNvdXJzZV9zZWN0aW9uc18yIjthOjM6e2k6MDtpOjEzMTgwMTIzNTY7aToxO3M6MjoiMTQiO2k6MjtzOjIzMTI6ImE6MTE6e2k6MDtPOjg6InN0ZENsYXNzIjo5OntzOjc6InNlY3Rpb24iO3M6MToiMCI7czoyOiJpZCI7czoxOiIyIjtzOjY6ImNvdXJzZSI7czoxOiIyIjtzOjQ6Im5hbWUiO047czo3OiJzdW1tYXJ5IjtOO3M6MTM6InN1bW1hcnlmb3JtYXQiO3M6MToiMSI7czo4OiJzZXF1ZW5jZSI7czoxOiIyIjtzOjc6InZpc2libGUiO3M6MToiMSI7czoxMjoiaGFzYWN0aXZpdGVzIjtiOjE7fWk6MTtPOjg6InN0ZENsYXNzIjo5OntzOjc6InNlY3Rpb24iO3M6MToiMSI7czoyOiJpZCI7czoxOiIzIjtzOjY6ImNvdXJzZSI7czoxOiIyIjtzOjQ6Im5hbWUiO047czo3OiJzdW1tYXJ5IjtzOjA6IiI7czoxMzoic3VtbWFyeWZvcm1hdCI7czoxOiIxIjtzOjg6InNlcXVlbmNlIjtOO3M6NzoidmlzaWJsZSI7czoxOiIxIjtzOjEyOiJoYXNhY3Rpdml0ZXMiO2I6MDt9aToyO086ODoic3RkQ2xhc3MiOjk6e3M6Nzoic2VjdGlvbiI7czoxOiIyIjtzOjI6ImlkIjtzOjE6IjQiO3M6NjoiY291cnNlIjtzOjE6IjIiO3M6NDoibmFtZSI7TjtzOjc6InN1bW1hcnkiO3M6MDoiIjtzOjEzOiJzdW1tYXJ5Zm9ybWF0IjtzOjE6IjEiO3M6ODoic2VxdWVuY2UiO047czo3OiJ2aXNpYmxlIjtzOjE6IjEiO3M6MTI6Imhhc2FjdGl2aXRlcyI7YjowO31pOjM7Tzo4OiJzdGRDbGFzcyI6OTp7czo3OiJzZWN0aW9uIjtzOjE6IjMiO3M6MjoiaWQiO3M6MToiNSI7czo2OiJjb3Vyc2UiO3M6MToiMiI7czo0OiJuYW1lIjtOO3M6Nzoic3VtbWFyeSI7czowOiIiO3M6MTM6InN1bW1hcnlmb3JtYXQiO3M6MToiMSI7czo4OiJzZXF1ZW5jZSI7TjtzOjc6InZpc2libGUiO3M6MToiMSI7czoxMjoiaGFzYWN0aXZpdGVzIjtiOjA7fWk6NDtPOjg6InN0ZENsYXNzIjo5OntzOjc6InNlY3Rpb24iO3M6MToiNCI7czoyOiJpZCI7czoxOiI2IjtzOjY6ImNvdXJzZSI7czoxOiIyIjtzOjQ6Im5hbWUiO047czo3OiJzdW1tYXJ5IjtzOjA6IiI7czoxMzoic3VtbWFyeWZvcm1hdCI7czoxOiIxIjtzOjg6InNlcXVlbmNlIjtOO3M6NzoidmlzaWJsZSI7czoxOiIxIjtzOjEyOiJoYXNhY3Rpdml0ZXMiO2I6MDt9aTo1O086ODoic3RkQ2xhc3MiOjk6e3M6Nzoic2VjdGlvbiI7czoxOiI1IjtzOjI6ImlkIjtzOjE6IjciO3M6NjoiY291cnNlIjtzOjE6IjIiO3M6NDoibmFtZSI7TjtzOjc6InN1bW1hcnkiO3M6MDoiIjtzOjEzOiJzdW1tYXJ5Zm9ybWF0IjtzOjE6IjEiO3M6ODoic2VxdWVuY2UiO047czo3OiJ2aXNpYmxlIjtzOjE6IjEiO3M6MTI6Imhhc2FjdGl2aXRlcyI7YjowO31pOjY7Tzo4OiJzdGRDbGFzcyI6OTp7czo3OiJzZWN0aW9uIjtzOjE6IjYiO3M6MjoiaWQiO3M6MToiOCI7czo2OiJjb3Vyc2UiO3M6MToiMiI7czo0OiJuYW1lIjtOO3M6Nzoic3VtbWFyeSI7czowOiIiO3M6MTM6InN1bW1hcnlmb3JtYXQiO3M6MToiMSI7czo4OiJzZXF1ZW5jZSI7TjtzOjc6InZpc2libGUiO3M6MToiMSI7czoxMjoiaGFzYWN0aXZpdGVzIjtiOjA7fWk6NztPOjg6InN0ZENsYXNzIjo5OntzOjc6InNlY3Rpb24iO3M6MToiNyI7czoyOiJpZCI7czoxOiI5IjtzOjY6ImNvdXJzZSI7czoxOiIyIjtzOjQ6Im5hbWUiO047czo3OiJzdW1tYXJ5IjtzOjA6IiI7czoxMzoic3VtbWFyeWZvcm1hdCI7czoxOiIxIjtzOjg6InNlcXVlbmNlIjtOO3M6NzoidmlzaWJsZSI7czoxOiIxIjtzOjEyOiJoYXNhY3Rpdml0ZXMiO2I6MDt9aTo4O086ODoic3RkQ2xhc3MiOjk6e3M6Nzoic2VjdGlvbiI7czoxOiI4IjtzOjI6ImlkIjtzOjI6IjEwIjtzOjY6ImNvdXJzZSI7czoxOiIyIjtzOjQ6Im5hbWUiO047czo3OiJzdW1tYXJ5IjtzOjA6IiI7czoxMzoic3VtbWFyeWZvcm1hdCI7czoxOiIxIjtzOjg6InNlcXVlbmNlIjtOO3M6NzoidmlzaWJsZSI7czoxOiIxIjtzOjEyOiJoYXNhY3Rpdml0ZXMiO2I6MDt9aTo5O086ODoic3RkQ2xhc3MiOjk6e3M6Nzoic2VjdGlvbiI7czoxOiI5IjtzOjI6ImlkIjtzOjI6IjExIjtzOjY6ImNvdXJzZSI7czoxOiIyIjtzOjQ6Im5hbWUiO047czo3OiJzdW1tYXJ5IjtzOjA6IiI7czoxMzoic3VtbWFyeWZvcm1hdCI7czoxOiIxIjtzOjg6InNlcXVlbmNlIjtOO3M6NzoidmlzaWJsZSI7czoxOiIxIjtzOjEyOiJoYXNhY3Rpdml0ZXMiO2I6MDt9aToxMDtPOjg6InN0ZENsYXNzIjo5OntzOjc6InNlY3Rpb24iO3M6MjoiMTAiO3M6MjoiaWQiO3M6MjoiMTIiO3M6NjoiY291cnNlIjtzOjE6IjIiO3M6NDoibmFtZSI7TjtzOjc6InN1bW1hcnkiO3M6MDoiIjtzOjEzOiJzdW1tYXJ5Zm9ybWF0IjtzOjE6IjEiO3M6ODoic2VxdWVuY2UiO047czo3OiJ2aXNpYmxlIjtzOjE6IjEiO3M6MTI6Imhhc2FjdGl2aXRlcyI7YjowO319Ijt9czoxODoiY291cnNlX2FjdGl2aXRlc18yIjthOjM6e2k6MDtpOjEzMTgwMTIzNTY7aToxO3M6MjoiMTQiO2k6MjtzOjI4MDoiYToxOntpOjI7Tzo4OiJzdGRDbGFzcyI6MTA6e3M6Nzoic2VjdGlvbiI7czoxOiIwIjtzOjQ6Im5hbWUiO3M6OToiTm92ZWRhZGVzIjtzOjQ6Imljb24iO3M6MDoiIjtzOjEzOiJpY29uY29tcG9uZW50IjtzOjA6IiI7czoyOiJpZCI7czoxOiIyIjtzOjY6ImhpZGRlbiI7YjowO3M6NzoibW9kbmFtZSI7czo1OiJmb3J1bSI7czo4OiJub2RldHlwZSI7aTowO3M6MzoidXJsIjtzOjQwOiJodHRwOi8vbG9jYWxob3N0L21vZC9mb3J1bS92aWV3LnBocD9pZD0yIjtzOjc6ImRpc3BsYXkiO2I6MTt9fSI7fXM6MTc6ImNvbnRleHRoYXNyZXBvczI0IjthOjM6e2k6MDtpOjEzMTgwMTIzNTc7aToxO3M6MjoiMTQiO2k6MjtzOjQ6ImI6MDsiO319fXM6MjE6ImxvYWRfbmF2aWdhdGlvbl9hZG1pbiI7YjoxO3M6MTQ6ImZyb21kaXNjdXNzaW9uIjtzOjE2OiJodHRwOi8vbG9jYWxob3N0IjtzOjEyOiJmbGFzaHZlcnNpb24iO3M6ODoiMTAuMy4xODMiO31VU0VSfE86ODoic3RkQ2xhc3MiOjYyOntzOjI6ImlkIjtzOjI6IjE0IjtzOjQ6ImF1dGgiO3M6NToiZW1haWwiO3M6OToiY29uZmlybWVkIjtzOjE6IjEiO3M6MTI6InBvbGljeWFncmVlZCI7czoxOiIwIjtzOjc6ImRlbGV0ZWQiO3M6MToiMCI7czo5OiJzdXNwZW5kZWQiO3M6MToiMCI7czoxMDoibW5ldGhvc3RpZCI7czoxOiIxIjtzOjg6InVzZXJuYW1lIjtzOjE1OiJtZWRpYWRvcnBvcHBlcjEiO3M6ODoicGFzc3dvcmQiO3M6MzI6ImU2ZDBhMjk4ZTBlMDQ1NDVjOTBmNGZlMjg3MjA1YmQxIjtzOjg6ImlkbnVtYmVyIjtzOjA6IiI7czo5OiJmaXJzdG5hbWUiO3M6OToibWVkaWFkb3IxIjtzOjg6Imxhc3RuYW1lIjtzOjY6InBvcHBlciI7czo1OiJlbWFpbCI7czoyNToibWVkaWFkb3Jwb3BwZXIxQGdtYWlsLmNvbSI7czo5OiJlbWFpbHN0b3AiO3M6MToiMCI7czozOiJpY3EiO3M6MDoiIjtzOjU6InNreXBlIjtzOjA6IiI7czo1OiJ5YWhvbyI7czowOiIiO3M6MzoiYWltIjtzOjA6IiI7czozOiJtc24iO3M6MDoiIjtzOjY6InBob25lMSI7czowOiIiO3M6NjoicGhvbmUyIjtzOjA6IiI7czoxMToiaW5zdGl0dXRpb24iO3M6MDoiIjtzOjEwOiJkZXBhcnRtZW50IjtzOjA6IiI7czo3OiJhZGRyZXNzIjtzOjA6IiI7czo0OiJjaXR5IjtzOjEyOiJCdWVub3MgQWlyZXMiO3M6NzoiY291bnRyeSI7czoyOiJBUiI7czo0OiJsYW5nIjtzOjU6ImVzX2FyIjtzOjU6InRoZW1lIjtzOjA6IiI7czo4OiJ0aW1lem9uZSI7czoyOiI5OSI7czoxMToiZmlyc3RhY2Nlc3MiO3M6MTA6IjEzMTczMjYxODkiO3M6MTA6Imxhc3RhY2Nlc3MiO2k6MTMxODAxMjM1MjtzOjk6Imxhc3Rsb2dpbiI7czoxMDoiMTMxODAxMTY2MCI7czoxMjoiY3VycmVudGxvZ2luIjtpOjEzMTgwMTIzNTI7czo2OiJsYXN0aXAiO3M6OToiMTI3LjAuMC4xIjtzOjY6InNlY3JldCI7czoxNToiTG5oNkw2ZWVNQzAyTTh1IjtzOjc6InBpY3R1cmUiO3M6MToiMCI7czozOiJ1cmwiO3M6MDoiIjtzOjE3OiJkZXNjcmlwdGlvbmZvcm1hdCI7czoxOiIwIjtzOjEwOiJtYWlsZm9ybWF0IjtzOjE6IjEiO3M6MTA6Im1haWxkaWdlc3QiO3M6MToiMCI7czoxMToibWFpbGRpc3BsYXkiO3M6MToiMiI7czoxMDoiaHRtbGVkaXRvciI7czoxOiIxIjtzOjQ6ImFqYXgiO3M6MToiMSI7czoxMzoiYXV0b3N1YnNjcmliZSI7czoxOiIxIjtzOjExOiJ0cmFja2ZvcnVtcyI7czoxOiIwIjtzOjExOiJ0aW1lY3JlYXRlZCI7czoxMDoiMTMxNzMyNjE0NyI7czoxMjoidGltZW1vZGlmaWVkIjtzOjEwOiIxMzE3MzI5NTAyIjtzOjEyOiJ0cnVzdGJpdG1hc2siO3M6MToiMCI7czo4OiJpbWFnZWFsdCI7czowOiIiO3M6MTI6InNjcmVlbnJlYWRlciI7czoxOiIwIjtzOjE2OiJsYXN0Y291cnNlYWNjZXNzIjthOjI6e2k6MjtzOjEwOiIxMzE4MDExNjY0IjtpOjQ7czoxMDoiMTMxODAxMDU5OSI7fXM6MTk6ImN1cnJlbnRjb3Vyc2VhY2Nlc3MiO2E6MTp7aToyO2k6MTMxODAxMjM1Njt9czoxMToiZ3JvdXBtZW1iZXIiO2E6MDp7fXM6NzoicHJvZmlsZSI7YTozOntzOjM6ImRuaSI7czo4OiIxMjM0NTY3OCI7czo2OiJwYWRyb24iO3M6ODoiMTIzNDU2NzgiO3M6MTM6InJvbHNvbGljaXRhZG8iO3M6ODoiTWVkaWFkb3IiO31zOjc6InNlc3NrZXkiO3M6MTA6IkEyanp1UDI2MFIiO3M6MTA6InByZWZlcmVuY2UiO2E6NTp7czoyNDoiYXV0aF9mb3JjZXBhc3N3b3JkY2hhbmdlIjtzOjE6IjAiO3M6Mjk6InVzZXJzZWxlY3Rvcl9hdXRvc2VsZWN0dW5pcXVlIjtzOjE6IjAiO3M6Mjk6InVzZXJzZWxlY3Rvcl9wcmVzZXJ2ZXNlbGVjdGVkIjtzOjE6IjAiO3M6Mjc6InVzZXJzZWxlY3Rvcl9zZWFyY2hhbnl3aGVyZSI7czoxOiIwIjtzOjExOiJfbGFzdGxvYWRlZCI7aToxMzE4MDEyNDAwO31zOjE3OiJtZXNzYWdlX2xhc3Rwb3B1cCI7aTowO3M6NzoiZGlzcGxheSI7YToxOntpOjE7aTowO31zOjI1OiJhamF4X3VwZGF0YWJsZV91c2VyX3ByZWZzIjthOjg6e3M6MjM6ImRvY2tlZF9ibG9ja19pbnN0YW5jZV80IjtzOjM6ImludCI7czoyMzoiZG9ja2VkX2Jsb2NrX2luc3RhbmNlXzUiO3M6MzoiaW50IjtzOjEzOiJibG9jazE5aGlkZGVuIjtzOjQ6ImJvb2wiO3M6MTM6ImJsb2NrMTVoaWRkZW4iO3M6NDoiYm9vbCI7czoyOToidXNlcnNlbGVjdG9yX29wdGlvbnNjb2xsYXBzZWQiO3M6NDoiYm9vbCI7czoyOToidXNlcnNlbGVjdG9yX3ByZXNlcnZlc2VsZWN0ZWQiO3M6NDoiYm9vbCI7czoyOToidXNlcnNlbGVjdG9yX2F1dG9zZWxlY3R1bmlxdWUiO3M6NDoiYm9vbCI7czoyNzoidXNlcnNlbGVjdG9yX3NlYXJjaGFueXdoZXJlIjtzOjQ6ImJvb2wiO31zOjU6ImVucm9sIjthOjI6e3M6ODoiZW5yb2xsZWQiO2E6MTp7aToyO2k6MTMxODAxNDE1Njt9czo5OiJ0ZW1wZ3Vlc3QiO2E6MDp7fX1zOjEzOiJ1c2Vyc2VsZWN0b3JzIjthOjM6e3M6MzI6ImQ0OTkxMDM0NWQ3ZGMwN2FmMjc0OTNkZWY3MDI3ZjY0IjthOjc6e3M6NToiY2xhc3MiO3M6MzI6ImVucm9sX21hbnVhbF9jdXJyZW50X3BhcnRpY2lwYW50IjtzOjQ6Im5hbWUiO3M6MTI6InJlbW92ZXNlbGVjdCI7czo3OiJleGNsdWRlIjthOjA6e31zOjExOiJleHRyYWZpZWxkcyI7YToxOntpOjA7czo1OiJlbWFpbCI7fXM6MTE6Im11bHRpc2VsZWN0IjtiOjE7czo3OiJlbnJvbGlkIjtpOjE7czo0OiJmaWxlIjtzOjI1OiJlbnJvbC9tYW51YWwvbG9jYWxsaWIucGhwIjt9czozMjoiYmI4ZmVlMGNkZjdlNjYyNzE2ZDIxMjliMzhhNmVhMDgiO2E6Nzp7czo1OiJjbGFzcyI7czo0MzoiZW5yb2xfbWFudWFsX3BvdGVudGlhbF9wYXJ0aWNpcGFudF9hcHJlbmRpeiI7czo0OiJuYW1lIjtzOjk6ImFkZHNlbGVjdCI7czo3OiJleGNsdWRlIjthOjA6e31zOjExOiJleHRyYWZpZWxkcyI7YToxOntpOjA7czo1OiJlbWFpbCI7fXM6MTE6Im11bHRpc2VsZWN0IjtiOjE7czo3OiJlbnJvbGlkIjtpOjE7czo0OiJmaWxlIjtzOjI1OiJlbnJvbC9tYW51YWwvbG9jYWxsaWIucGhwIjt9czozMjoiODdmNjM1YzI0OTBkYjk2NjJhODU4YTRjYjU2NDcyMjIiO2E6Nzp7czo1OiJjbGFzcyI7czozNDoiZW5yb2xfbWFudWFsX3BvdGVudGlhbF9wYXJ0aWNpcGFudCI7czo0OiJuYW1lIjtzOjk6ImFkZHNlbGVjdCI7czo3OiJleGNsdWRlIjthOjA6e31zOjExOiJleHRyYWZpZWxkcyI7YToxOntpOjA7czo1OiJlbWFpbCI7fXM6MTE6Im11bHRpc2VsZWN0IjtiOjE7czo3OiJlbnJvbGlkIjtpOjE7czo0OiJmaWxlIjtzOjI1OiJlbnJvbC9tYW51YWwvbG9jYWxsaWIucGhwIjt9fXM6NjoiYWNjZXNzIjthOjU6e3M6MjoicmEiO2E6Mzp7czoyOiIvMSI7YToyOntpOjM7czoxOiIzIjtpOjc7czoxOiI3Ijt9czo4OiIvMS8yMy80NiI7YToxOntpOjM7czoxOiIzIjt9czo4OiIvMS8yMy8yNCI7YToxOntpOjM7czoxOiIzIjt9fXM6NDoicmRlZiI7YToxOTp7czo0OiIvMTozIjthOjI1Mjp7czoyNzoiYmxvY2svb25saW5lX3VzZXJzOnZpZXdsaXN0IjtzOjE6IjEiO3M6MzE6ImJsb2NrL3Jzc19jbGllbnQ6bWFuYWdlb3duZmVlZHMiO3M6MToiMSI7czoyODoiY291cnNlcmVwb3J0L2NvbXBsZXRpb246dmlldyI7czoxOiIxIjtzOjIxOiJjb3Vyc2VyZXBvcnQvbG9nOnZpZXciO3M6MToiMSI7czoyNToiY291cnNlcmVwb3J0L2xvZzp2aWV3bGl2ZSI7czoxOiIxIjtzOjI2OiJjb3Vyc2VyZXBvcnQvbG9nOnZpZXd0b2RheSI7czoxOiIxIjtzOjI1OiJjb3Vyc2VyZXBvcnQvb3V0bGluZTp2aWV3IjtzOjE6IjEiO3M6MzE6ImNvdXJzZXJlcG9ydC9wYXJ0aWNpcGF0aW9uOnZpZXciO3M6MToiMSI7czoyNjoiY291cnNlcmVwb3J0L3Byb2dyZXNzOnZpZXciO3M6MToiMSI7czoyMzoiY291cnNlcmVwb3J0L3N0YXRzOnZpZXciO3M6MToiMSI7czoyMjoiZW5yb2wvYXV0aG9yaXplOm1hbmFnZSI7czoxOiIxIjtzOjE5OiJlbnJvbC9jb2hvcnQ6Y29uZmlnIjtzOjE6IjEiO3M6MTg6ImVucm9sL2d1ZXN0OmNvbmZpZyI7czoxOiIxIjtzOjE4OiJlbnJvbC9tYW51YWw6ZW5yb2wiO3M6MToiMSI7czoxOToiZW5yb2wvbWFudWFsOm1hbmFnZSI7czoxOiIxIjtzOjIwOiJlbnJvbC9tYW51YWw6dW5lbnJvbCI7czoxOiIxIjtzOjE3OiJlbnJvbC9tZXRhOmNvbmZpZyI7czoxOiIxIjtzOjE5OiJlbnJvbC9wYXlwYWw6bWFuYWdlIjtzOjE6IjEiO3M6MTc6ImVucm9sL3NlbGY6Y29uZmlnIjtzOjE6IjEiO3M6MTc6ImVucm9sL3NlbGY6bWFuYWdlIjtzOjE6IjEiO3M6MTg6ImVucm9sL3NlbGY6dW5lbnJvbCI7czoxOiIxIjtzOjIwOiJncmFkZWV4cG9ydC9vZHM6dmlldyI7czoxOiIxIjtzOjIwOiJncmFkZWV4cG9ydC90eHQ6dmlldyI7czoxOiIxIjtzOjIwOiJncmFkZWV4cG9ydC94bHM6dmlldyI7czoxOiIxIjtzOjIwOiJncmFkZWV4cG9ydC94bWw6dmlldyI7czoxOiIxIjtzOjIwOiJncmFkZWltcG9ydC9jc3Y6dmlldyI7czoxOiIxIjtzOjIwOiJncmFkZWltcG9ydC94bWw6dmlldyI7czoxOiIxIjtzOjIzOiJncmFkZXJlcG9ydC9ncmFkZXI6dmlldyI7czoxOiIxIjtzOjI1OiJncmFkZXJlcG9ydC9vdXRjb21lczp2aWV3IjtzOjE6IjEiO3M6MjE6ImdyYWRlcmVwb3J0L3VzZXI6dmlldyI7czoxOiIxIjtzOjM0OiJtb2QvYXNzaWdubWVudDpleHBvcnRvd25zdWJtaXNzaW9uIjtzOjE6IjEiO3M6MjA6Im1vZC9hc3NpZ25tZW50OmdyYWRlIjtzOjE6IjEiO3M6MTk6Im1vZC9hc3NpZ25tZW50OnZpZXciO3M6MToiMSI7czoxMzoibW9kL2NoYXQ6Y2hhdCI7czoxOiIxIjtzOjE4OiJtb2QvY2hhdDpkZWxldGVsb2ciO3M6MToiMSI7czozNDoibW9kL2NoYXQ6ZXhwb3J0cGFydGljaXBhdGVkc2Vzc2lvbiI7czoxOiIxIjtzOjIyOiJtb2QvY2hhdDpleHBvcnRzZXNzaW9uIjtzOjE6IjEiO3M6MTY6Im1vZC9jaGF0OnJlYWRsb2ciO3M6MToiMSI7czoxNzoibW9kL2Nob2ljZTpjaG9vc2UiO3M6MToiMSI7czoyNjoibW9kL2Nob2ljZTpkZWxldGVyZXNwb25zZXMiO3M6MToiMSI7czoyODoibW9kL2Nob2ljZTpkb3dubG9hZHJlc3BvbnNlcyI7czoxOiIxIjtzOjI0OiJtb2QvY2hvaWNlOnJlYWRyZXNwb25zZXMiO3M6MToiMSI7czoxNjoibW9kL2RhdGE6YXBwcm92ZSI7czoxOiIxIjtzOjE2OiJtb2QvZGF0YTpjb21tZW50IjtzOjE6IjEiO3M6MjU6Im1vZC9kYXRhOmV4cG9ydGFsbGVudHJpZXMiO3M6MToiMSI7czoyMDoibW9kL2RhdGE6ZXhwb3J0ZW50cnkiO3M6MToiMSI7czoyMzoibW9kL2RhdGE6ZXhwb3J0b3duZW50cnkiO3M6MToiMSI7czoyMzoibW9kL2RhdGE6bWFuYWdlY29tbWVudHMiO3M6MToiMSI7czoyMjoibW9kL2RhdGE6bWFuYWdlZW50cmllcyI7czoxOiIxIjtzOjI0OiJtb2QvZGF0YTptYW5hZ2V0ZW1wbGF0ZXMiO3M6MToiMSI7czoxMzoibW9kL2RhdGE6cmF0ZSI7czoxOiIxIjtzOjIzOiJtb2QvZGF0YTp2aWV3YWxscmF0aW5ncyI7czoxOiIxIjtzOjI3OiJtb2QvZGF0YTp2aWV3YWxsdXNlcnByZXNldHMiO3M6MToiMSI7czoyMjoibW9kL2RhdGE6dmlld2FueXJhdGluZyI7czoxOiIxIjtzOjE4OiJtb2QvZGF0YTp2aWV3ZW50cnkiO3M6MToiMSI7czoxOToibW9kL2RhdGE6dmlld3JhdGluZyI7czoxOiIxIjtzOjE5OiJtb2QvZGF0YTp3cml0ZWVudHJ5IjtzOjE6IjEiO3M6MzQ6Im1vZC9mZWVkYmFjazpjcmVhdGVwcml2YXRldGVtcGxhdGUiO3M6MToiMSI7czozMzoibW9kL2ZlZWRiYWNrOmNyZWF0ZXB1YmxpY3RlbXBsYXRlIjtzOjE6IjEiO3M6MzA6Im1vZC9mZWVkYmFjazpkZWxldGVzdWJtaXNzaW9ucyI7czoxOiIxIjtzOjI3OiJtb2QvZmVlZGJhY2s6ZGVsZXRldGVtcGxhdGUiO3M6MToiMSI7czoyMjoibW9kL2ZlZWRiYWNrOmVkaXRpdGVtcyI7czoxOiIxIjtzOjI0OiJtb2QvZmVlZGJhY2s6cmVjZWl2ZW1haWwiO3M6MToiMSI7czoxNzoibW9kL2ZlZWRiYWNrOnZpZXciO3M6MToiMSI7czoyODoibW9kL2ZlZWRiYWNrOnZpZXdhbmFseXNlcGFnZSI7czoxOiIxIjtzOjI0OiJtb2QvZmVlZGJhY2s6dmlld3JlcG9ydHMiO3M6MToiMSI7czoyMjoibW9kL2ZvbGRlcjptYW5hZ2VmaWxlcyI7czoxOiIxIjtzOjE3OiJtb2QvZm9ydW06YWRkbmV3cyI7czoxOiIxIjtzOjI2OiJtb2QvZm9ydW06Y3JlYXRlYXR0YWNobWVudCI7czoxOiIxIjtzOjIzOiJtb2QvZm9ydW06ZGVsZXRlYW55cG9zdCI7czoxOiIxIjtzOjIzOiJtb2QvZm9ydW06ZGVsZXRlb3ducG9zdCI7czoxOiIxIjtzOjIxOiJtb2QvZm9ydW06ZWRpdGFueXBvc3QiO3M6MToiMSI7czoyNjoibW9kL2ZvcnVtOmV4cG9ydGRpc2N1c3Npb24iO3M6MToiMSI7czoyMzoibW9kL2ZvcnVtOmV4cG9ydG93bnBvc3QiO3M6MToiMSI7czoyMDoibW9kL2ZvcnVtOmV4cG9ydHBvc3QiO3M6MToiMSI7czozMDoibW9kL2ZvcnVtOmluaXRpYWxzdWJzY3JpcHRpb25zIjtzOjE6IjEiO3M6Mjk6Im1vZC9mb3J1bTptYW5hZ2VzdWJzY3JpcHRpb25zIjtzOjE6IjEiO3M6MjU6Im1vZC9mb3J1bTptb3ZlZGlzY3Vzc2lvbnMiO3M6MToiMSI7czozMToibW9kL2ZvcnVtOnBvc3R3aXRob3V0dGhyb3R0bGluZyI7czoxOiIxIjtzOjE0OiJtb2QvZm9ydW06cmF0ZSI7czoxOiIxIjtzOjE5OiJtb2QvZm9ydW06cmVwbHluZXdzIjtzOjE6IjEiO3M6MTk6Im1vZC9mb3J1bTpyZXBseXBvc3QiO3M6MToiMSI7czoyNjoibW9kL2ZvcnVtOnNwbGl0ZGlzY3Vzc2lvbnMiO3M6MToiMSI7czoyNToibW9kL2ZvcnVtOnN0YXJ0ZGlzY3Vzc2lvbiI7czoxOiIxIjtzOjI0OiJtb2QvZm9ydW06dmlld2FsbHJhdGluZ3MiO3M6MToiMSI7czoyMzoibW9kL2ZvcnVtOnZpZXdhbnlyYXRpbmciO3M6MToiMSI7czoyNDoibW9kL2ZvcnVtOnZpZXdkaXNjdXNzaW9uIjtzOjE6IjEiO3M6MzA6Im1vZC9mb3J1bTp2aWV3aGlkZGVudGltZWRwb3N0cyI7czoxOiIxIjtzOjMzOiJtb2QvZm9ydW06dmlld3FhbmRhd2l0aG91dHBvc3RpbmciO3M6MToiMSI7czoyMDoibW9kL2ZvcnVtOnZpZXdyYXRpbmciO3M6MToiMSI7czoyNToibW9kL2ZvcnVtOnZpZXdzdWJzY3JpYmVycyI7czoxOiIxIjtzOjIwOiJtb2QvZ2xvc3Nhcnk6YXBwcm92ZSI7czoxOiIxIjtzOjIwOiJtb2QvZ2xvc3Nhcnk6Y29tbWVudCI7czoxOiIxIjtzOjE5OiJtb2QvZ2xvc3Nhcnk6ZXhwb3J0IjtzOjE6IjEiO3M6MjQ6Im1vZC9nbG9zc2FyeTpleHBvcnRlbnRyeSI7czoxOiIxIjtzOjI3OiJtb2QvZ2xvc3Nhcnk6ZXhwb3J0b3duZW50cnkiO3M6MToiMSI7czoxOToibW9kL2dsb3NzYXJ5OmltcG9ydCI7czoxOiIxIjtzOjI5OiJtb2QvZ2xvc3Nhcnk6bWFuYWdlY2F0ZWdvcmllcyI7czoxOiIxIjtzOjI3OiJtb2QvZ2xvc3Nhcnk6bWFuYWdlY29tbWVudHMiO3M6MToiMSI7czoyNjoibW9kL2dsb3NzYXJ5Om1hbmFnZWVudHJpZXMiO3M6MToiMSI7czoxNzoibW9kL2dsb3NzYXJ5OnJhdGUiO3M6MToiMSI7czoyNzoibW9kL2dsb3NzYXJ5OnZpZXdhbGxyYXRpbmdzIjtzOjE6IjEiO3M6MjY6Im1vZC9nbG9zc2FyeTp2aWV3YW55cmF0aW5nIjtzOjE6IjEiO3M6MjM6Im1vZC9nbG9zc2FyeTp2aWV3cmF0aW5nIjtzOjE6IjEiO3M6MTg6Im1vZC9nbG9zc2FyeTp3cml0ZSI7czoxOiIxIjtzOjE1OiJtb2QvbGVzc29uOmVkaXQiO3M6MToiMSI7czoxNzoibW9kL2xlc3NvbjptYW5hZ2UiO3M6MToiMSI7czoyMzoibW9kL3F1aXo6ZGVsZXRlYXR0ZW1wdHMiO3M6MToiMSI7czoxNDoibW9kL3F1aXo6Z3JhZGUiO3M6MToiMSI7czoxNToibW9kL3F1aXo6bWFuYWdlIjtzOjE6IjEiO3M6MjQ6Im1vZC9xdWl6Om1hbmFnZW92ZXJyaWRlcyI7czoxOiIxIjtzOjE2OiJtb2QvcXVpejpwcmV2aWV3IjtzOjE6IjEiO3M6MTY6Im1vZC9xdWl6OnJlZ3JhZGUiO3M6MToiMSI7czoxMzoibW9kL3F1aXo6dmlldyI7czoxOiIxIjtzOjIwOiJtb2QvcXVpejp2aWV3cmVwb3J0cyI7czoxOiIxIjtzOjI1OiJtb2Qvc2Nvcm06ZGVsZXRlcmVzcG9uc2VzIjtzOjE6IjEiO3M6MTk6Im1vZC9zY29ybTpzYXZldHJhY2siO3M6MToiMSI7czoyMDoibW9kL3Njb3JtOnZpZXdyZXBvcnQiO3M6MToiMSI7czoyMDoibW9kL3Njb3JtOnZpZXdzY29yZXMiO3M6MToiMSI7czoxOToibW9kL3N1cnZleTpkb3dubG9hZCI7czoxOiIxIjtzOjIyOiJtb2Qvc3VydmV5OnBhcnRpY2lwYXRlIjtzOjE6IjEiO3M6MjQ6Im1vZC9zdXJ2ZXk6cmVhZHJlc3BvbnNlcyI7czoxOiIxIjtzOjE5OiJtb2Qvd2lraTpjcmVhdGVwYWdlIjtzOjE6IjEiO3M6MjA6Im1vZC93aWtpOmVkaXRjb21tZW50IjtzOjE6IjEiO3M6MTc6Im1vZC93aWtpOmVkaXRwYWdlIjtzOjE6IjEiO3M6MjI6Im1vZC93aWtpOm1hbmFnZWNvbW1lbnQiO3M6MToiMSI7czoyMDoibW9kL3dpa2k6bWFuYWdlZmlsZXMiO3M6MToiMSI7czoxOToibW9kL3dpa2k6bWFuYWdld2lraSI7czoxOiIxIjtzOjIxOiJtb2Qvd2lraTpvdmVycmlkZWxvY2siO3M6MToiMSI7czoyMDoibW9kL3dpa2k6dmlld2NvbW1lbnQiO3M6MToiMSI7czoxNzoibW9kL3dpa2k6dmlld3BhZ2UiO3M6MToiMSI7czoyMToibW9kL3dvcmtzaG9wOmFsbG9jYXRlIjtzOjE6IjEiO3M6Mjc6Im1vZC93b3Jrc2hvcDplZGl0ZGltZW5zaW9ucyI7czoxOiIxIjtzOjI4OiJtb2Qvd29ya3Nob3A6aWdub3JlZGVhZGxpbmVzIjtzOjE6IjEiO3M6Mjc6Im1vZC93b3Jrc2hvcDptYW5hZ2VleGFtcGxlcyI7czoxOiIxIjtzOjI3OiJtb2Qvd29ya3Nob3A6b3ZlcnJpZGVncmFkZXMiO3M6MToiMSI7czozMToibW9kL3dvcmtzaG9wOnB1Ymxpc2hzdWJtaXNzaW9ucyI7czoxOiIxIjtzOjI0OiJtb2Qvd29ya3Nob3A6c3dpdGNocGhhc2UiO3M6MToiMSI7czoxNzoibW9kL3dvcmtzaG9wOnZpZXciO3M6MToiMSI7czozMToibW9kL3dvcmtzaG9wOnZpZXdhbGxhc3Nlc3NtZW50cyI7czoxOiIxIjtzOjMxOiJtb2Qvd29ya3Nob3A6dmlld2FsbHN1Ym1pc3Npb25zIjtzOjE6IjEiO3M6Mjg6Im1vZC93b3Jrc2hvcDp2aWV3YXV0aG9ybmFtZXMiO3M6MToiMSI7czozMjoibW9kL3dvcmtzaG9wOnZpZXdhdXRob3JwdWJsaXNoZWQiO3M6MToiMSI7czozNzoibW9kL3dvcmtzaG9wOnZpZXdwdWJsaXNoZWRzdWJtaXNzaW9ucyI7czoxOiIxIjtzOjMwOiJtb2Qvd29ya3Nob3A6dmlld3Jldmlld2VybmFtZXMiO3M6MToiMSI7czoyODoibW9vZGxlL2JhY2t1cDpiYWNrdXBhY3Rpdml0eSI7czoxOiIxIjtzOjI2OiJtb29kbGUvYmFja3VwOmJhY2t1cGNvdXJzZSI7czoxOiIxIjtzOjI3OiJtb29kbGUvYmFja3VwOmJhY2t1cHNlY3Rpb24iO3M6MToiMSI7czoyOToibW9vZGxlL2JhY2t1cDpiYWNrdXB0YXJnZXRodWIiO3M6MToiMSI7czozMjoibW9vZGxlL2JhY2t1cDpiYWNrdXB0YXJnZXRpbXBvcnQiO3M6MToiMSI7czoyMzoibW9vZGxlL2JhY2t1cDpjb25maWd1cmUiO3M6MToiMSI7czoyNjoibW9vZGxlL2JhY2t1cDpkb3dubG9hZGZpbGUiO3M6MToiMSI7czoxNzoibW9vZGxlL2Jsb2NrOmVkaXQiO3M6MToiMSI7czoxNzoibW9vZGxlL2Jsb2NrOnZpZXciO3M6MToiMSI7czoyNzoibW9vZGxlL2Jsb2c6YXNzb2NpYXRlY291cnNlIjtzOjE6IjEiO3M6Mjc6Im1vb2RsZS9ibG9nOmFzc29jaWF0ZW1vZHVsZSI7czoxOiIxIjtzOjI1OiJtb29kbGUvYmxvZzptYW5hZ2VlbnRyaWVzIjtzOjE6IjEiO3M6MjY6Im1vb2RsZS9ibG9nOm1hbmFnZWV4dGVybmFsIjtzOjE6IjEiO3M6MTg6Im1vb2RsZS9ibG9nOnNlYXJjaCI7czoxOiIxIjtzOjE2OiJtb29kbGUvYmxvZzp2aWV3IjtzOjE6IjEiO3M6Mjk6Im1vb2RsZS9jYWxlbmRhcjptYW5hZ2VlbnRyaWVzIjtzOjE6IjEiO3M6MzQ6Im1vb2RsZS9jYWxlbmRhcjptYW5hZ2Vncm91cGVudHJpZXMiO3M6MToiMSI7czoxODoibW9vZGxlL2NvaG9ydDp2aWV3IjtzOjE6IjEiO3M6MjE6Im1vb2RsZS9jb21tZW50OmRlbGV0ZSI7czoxOiIxIjtzOjE5OiJtb29kbGUvY29tbWVudDpwb3N0IjtzOjE6IjEiO3M6MTk6Im1vb2RsZS9jb21tZW50OnZpZXciO3M6MToiMSI7czoyMDoibW9vZGxlL2NvbW11bml0eTphZGQiO3M6MToiMSI7czoyNToibW9vZGxlL2NvbW11bml0eTpkb3dubG9hZCI7czoxOiIxIjtzOjMyOiJtb29kbGUvY291cnNlOmFjdGl2aXR5dmlzaWJpbGl0eSI7czoxOiIxIjtzOjI3OiJtb29kbGUvY291cnNlOmJ1bGttZXNzYWdpbmciO3M6MToiMSI7czoyODoibW9vZGxlL2NvdXJzZTpjaGFuZ2VjYXRlZ29yeSI7czoxOiIxIjtzOjI4OiJtb29kbGUvY291cnNlOmNoYW5nZWZ1bGxuYW1lIjtzOjE6IjEiO3M6Mjg6Im1vb2RsZS9jb3Vyc2U6Y2hhbmdlaWRudW1iZXIiO3M6MToiMSI7czoyOToibW9vZGxlL2NvdXJzZTpjaGFuZ2VzaG9ydG5hbWUiO3M6MToiMSI7czoyNzoibW9vZGxlL2NvdXJzZTpjaGFuZ2VzdW1tYXJ5IjtzOjE6IjEiO3M6MjU6Im1vb2RsZS9jb3Vyc2U6ZW5yb2xjb25maWciO3M6MToiMSI7czoyNToibW9vZGxlL2NvdXJzZTplbnJvbHJldmlldyI7czoxOiIxIjtzOjMwOiJtb29kbGUvY291cnNlOm1hbmFnZWFjdGl2aXRpZXMiO3M6MToiMSI7czoyNToibW9vZGxlL2NvdXJzZTptYW5hZ2VmaWxlcyI7czoxOiIxIjtzOjI2OiJtb29kbGUvY291cnNlOm1hbmFnZWdyb3VwcyI7czoxOiIxIjtzOjI2OiJtb29kbGUvY291cnNlOm1hbmFnZXNjYWxlcyI7czoxOiIxIjtzOjI2OiJtb29kbGUvY291cnNlOm1hcmtjb21wbGV0ZSI7czoxOiIxIjtzOjE5OiJtb29kbGUvY291cnNlOnJlc2V0IjtzOjE6IjEiO3M6MzE6Im1vb2RsZS9jb3Vyc2U6c2VjdGlvbnZpc2liaWxpdHkiO3M6MToiMSI7czozMToibW9vZGxlL2NvdXJzZTpzZXRjdXJyZW50c2VjdGlvbiI7czoxOiIxIjtzOjIwOiJtb29kbGUvY291cnNlOnVwZGF0ZSI7czoxOiIxIjtzOjIzOiJtb29kbGUvY291cnNlOnVzZXJlbWFpbCI7czoxOiIxIjtzOjM0OiJtb29kbGUvY291cnNlOnZpZXdoaWRkZW5hY3Rpdml0aWVzIjtzOjE6IjEiO3M6MzE6Im1vb2RsZS9jb3Vyc2U6dmlld2hpZGRlbmNvdXJzZXMiO3M6MToiMSI7czozMjoibW9vZGxlL2NvdXJzZTp2aWV3aGlkZGVuc2VjdGlvbnMiO3M6MToiMSI7czozNDoibW9vZGxlL2NvdXJzZTp2aWV3aGlkZGVudXNlcmZpZWxkcyI7czoxOiIxIjtzOjMwOiJtb29kbGUvY291cnNlOnZpZXdwYXJ0aWNpcGFudHMiO3M6MToiMSI7czoyNDoibW9vZGxlL2NvdXJzZTp2aWV3c2NhbGVzIjtzOjE6IjEiO3M6MjQ6Im1vb2RsZS9jb3Vyc2U6dmlzaWJpbGl0eSI7czoxOiIxIjtzOjIwOiJtb29kbGUvZmlsdGVyOm1hbmFnZSI7czoxOiIxIjtzOjE3OiJtb29kbGUvZ3JhZGU6ZWRpdCI7czoxOiIxIjtzOjE5OiJtb29kbGUvZ3JhZGU6ZXhwb3J0IjtzOjE6IjEiO3M6MTc6Im1vb2RsZS9ncmFkZTpoaWRlIjtzOjE6IjEiO3M6MTk6Im1vb2RsZS9ncmFkZTppbXBvcnQiO3M6MToiMSI7czoxNzoibW9vZGxlL2dyYWRlOmxvY2siO3M6MToiMSI7czoxOToibW9vZGxlL2dyYWRlOm1hbmFnZSI7czoxOiIxIjtzOjI2OiJtb29kbGUvZ3JhZGU6bWFuYWdlbGV0dGVycyI7czoxOiIxIjtzOjI3OiJtb29kbGUvZ3JhZGU6bWFuYWdlb3V0Y29tZXMiO3M6MToiMSI7czoxOToibW9vZGxlL2dyYWRlOnVubG9jayI7czoxOiIxIjtzOjIwOiJtb29kbGUvZ3JhZGU6dmlld2FsbCI7czoxOiIxIjtzOjIzOiJtb29kbGUvZ3JhZGU6dmlld2hpZGRlbiI7czoxOiIxIjtzOjE5OiJtb29kbGUvbm90ZXM6bWFuYWdlIjtzOjE6IjEiO3M6MTc6Im1vb2RsZS9ub3Rlczp2aWV3IjtzOjE6IjEiO3M6MjM6Im1vb2RsZS9wb3J0Zm9saW86ZXhwb3J0IjtzOjE6IjEiO3M6MTk6Im1vb2RsZS9xdWVzdGlvbjphZGQiO3M6MToiMSI7czoyMzoibW9vZGxlL3F1ZXN0aW9uOmVkaXRhbGwiO3M6MToiMSI7czoyNDoibW9vZGxlL3F1ZXN0aW9uOmVkaXRtaW5lIjtzOjE6IjEiO3M6MjA6Im1vb2RsZS9xdWVzdGlvbjpmbGFnIjtzOjE6IjEiO3M6MzA6Im1vb2RsZS9xdWVzdGlvbjptYW5hZ2VjYXRlZ29yeSI7czoxOiIxIjtzOjIzOiJtb29kbGUvcXVlc3Rpb246bW92ZWFsbCI7czoxOiIxIjtzOjI0OiJtb29kbGUvcXVlc3Rpb246bW92ZW1pbmUiO3M6MToiMSI7czoyMjoibW9vZGxlL3F1ZXN0aW9uOnVzZWFsbCI7czoxOiIxIjtzOjIzOiJtb29kbGUvcXVlc3Rpb246dXNlbWluZSI7czoxOiIxIjtzOjIzOiJtb29kbGUvcXVlc3Rpb246dmlld2FsbCI7czoxOiIxIjtzOjI0OiJtb29kbGUvcXVlc3Rpb246dmlld21pbmUiO3M6MToiMSI7czoxODoibW9vZGxlL3JhdGluZzpyYXRlIjtzOjE6IjEiO3M6MTg6Im1vb2RsZS9yYXRpbmc6dmlldyI7czoxOiIxIjtzOjIxOiJtb29kbGUvcmF0aW5nOnZpZXdhbGwiO3M6MToiMSI7czoyMToibW9vZGxlL3JhdGluZzp2aWV3YW55IjtzOjE6IjEiO3M6MjQ6Im1vb2RsZS9yZXN0b3JlOmNvbmZpZ3VyZSI7czoxOiIxIjtzOjMwOiJtb29kbGUvcmVzdG9yZTpyZXN0b3JlYWN0aXZpdHkiO3M6MToiMSI7czoyODoibW9vZGxlL3Jlc3RvcmU6cmVzdG9yZWNvdXJzZSI7czoxOiIxIjtzOjI5OiJtb29kbGUvcmVzdG9yZTpyZXN0b3Jlc2VjdGlvbiI7czoxOiIxIjtzOjMxOiJtb29kbGUvcmVzdG9yZTpyZXN0b3JldGFyZ2V0aHViIjtzOjE6IjEiO3M6MzQ6Im1vb2RsZS9yZXN0b3JlOnJlc3RvcmV0YXJnZXRpbXBvcnQiO3M6MToiMSI7czoyNToibW9vZGxlL3Jlc3RvcmU6dXBsb2FkZmlsZSI7czoxOiIxIjtzOjE4OiJtb29kbGUvcm9sZTphc3NpZ24iO3M6MToiMSI7czoxODoibW9vZGxlL3JvbGU6cmV2aWV3IjtzOjE6IjEiO3M6MjQ6Im1vb2RsZS9yb2xlOnNhZmVvdmVycmlkZSI7czoxOiIxIjtzOjIzOiJtb29kbGUvcm9sZTpzd2l0Y2hyb2xlcyI7czoxOiIxIjtzOjI3OiJtb29kbGUvc2l0ZTphY2Nlc3NhbGxncm91cHMiO3M6MToiMSI7czoyMDoibW9vZGxlL3NpdGU6ZG9jbGlua3MiO3M6MToiMSI7czoyNDoibW9vZGxlL3NpdGU6bWFuYWdlYmxvY2tzIjtzOjE6IjEiO3M6Mjc6Im1vb2RsZS9zaXRlOnJlYWRhbGxtZXNzYWdlcyI7czoxOiIxIjtzOjI0OiJtb29kbGUvc2l0ZTp0cnVzdGNvbnRlbnQiO3M6MToiMSI7czoyNToibW9vZGxlL3NpdGU6dmlld2Z1bGxuYW1lcyI7czoxOiIxIjtzOjIzOiJtb29kbGUvc2l0ZTp2aWV3cmVwb3J0cyI7czoxOiIxIjtzOjIxOiJtb29kbGUvdGFnOmVkaXRibG9ja3MiO3M6MToiMSI7czoxNzoibW9vZGxlL3RhZzptYW5hZ2UiO3M6MToiMSI7czoyNToibW9vZGxlL3VzZXI6cmVhZHVzZXJibG9ncyI7czoxOiIxIjtzOjI1OiJtb29kbGUvdXNlcjpyZWFkdXNlcnBvc3RzIjtzOjE6IjEiO3M6MjM6Im1vb2RsZS91c2VyOnZpZXdkZXRhaWxzIjtzOjE6IjEiO3M6Mjk6Im1vb2RsZS91c2VyOnZpZXdoaWRkZW5kZXRhaWxzIjtzOjE6IjEiO3M6MjU6InF1aXovZ3JhZGluZzp2aWV3aWRudW1iZXIiO3M6MToiMSI7czoyOToicXVpei9ncmFkaW5nOnZpZXdzdHVkZW50bmFtZXMiO3M6MToiMSI7czoyMDoicXVpei9zdGF0aXN0aWNzOnZpZXciO3M6MToiMSI7czoyNjoicmVwb3J0L2NvdXJzZW92ZXJ2aWV3OnZpZXciO3M6MToiMSI7fXM6NDoiLzE6NyI7YTo1MTp7czoxNzoibW9vZGxlL2Jsb2NrOnZpZXciO3M6MToiMSI7czoyNToicmVwb3NpdG9yeS93aWtpbWVkaWE6dmlldyI7czoxOiIxIjtzOjI2OiJtb29kbGUvdXNlcjplZGl0b3ducHJvZmlsZSI7czoxOiIxIjtzOjI3OiJtb29kbGUvYmxvZzphc3NvY2lhdGVjb3Vyc2UiO3M6MToiMSI7czoyMzoicmVwb3NpdG9yeS95b3V0dWJlOnZpZXciO3M6MToiMSI7czoyNzoibW9vZGxlL3VzZXI6bWFuYWdlb3duYmxvY2tzIjtzOjE6IjEiO3M6Mjc6Im1vb2RsZS9ibG9nOmFzc29jaWF0ZW1vZHVsZSI7czoxOiIxIjtzOjI2OiJtb29kbGUvdXNlcjptYW5hZ2Vvd25maWxlcyI7czoxOiIxIjtzOjE4OiJtb29kbGUvYmxvZzpjcmVhdGUiO3M6MToiMSI7czozNToibW9vZGxlL3dlYnNlcnZpY2U6Y3JlYXRlbW9iaWxldG9rZW4iO3M6MToiMSI7czoyNjoibW9vZGxlL2Jsb2c6bWFuYWdlZXh0ZXJuYWwiO3M6MToiMSI7czoyNDoicmVwb3NpdG9yeS9hbGZyZXNjbzp2aWV3IjtzOjE6IjEiO3M6MTg6Im1vb2RsZS9ibG9nOnNlYXJjaCI7czoxOiIxIjtzOjIyOiJyZXBvc2l0b3J5L2JveG5ldDp2aWV3IjtzOjE6IjEiO3M6MTY6Im1vb2RsZS9ibG9nOnZpZXciO3M6MToiMSI7czoyNzoicmVwb3NpdG9yeS9jb3Vyc2VmaWxlczp2aWV3IjtzOjE6IjEiO3M6MzI6Im1vb2RsZS9jYWxlbmRhcjptYW5hZ2Vvd25lbnRyaWVzIjtzOjE6IjEiO3M6MjM6InJlcG9zaXRvcnkvZHJvcGJveDp2aWV3IjtzOjE6IjEiO3M6MTk6Im1vb2RsZS9jb21tZW50OnBvc3QiO3M6MToiMSI7czoyNjoicmVwb3NpdG9yeS9maWxlc3lzdGVtOnZpZXciO3M6MToiMSI7czoxOToibW9vZGxlL2NvbW1lbnQ6dmlldyI7czoxOiIxIjtzOjI5OiJyZXBvc2l0b3J5L2ZsaWNrcl9wdWJsaWM6dmlldyI7czoxOiIxIjtzOjIxOiJtb29kbGUvY291cnNlOnJlcXVlc3QiO3M6MToiMSI7czoyMjoicmVwb3NpdG9yeS9mbGlja3I6dmlldyI7czoxOiIxIjtzOjIyOiJtb29kbGUvbXk6bWFuYWdlYmxvY2tzIjtzOjE6IjEiO3M6MjY6InJlcG9zaXRvcnkvZ29vZ2xlZG9jczp2aWV3IjtzOjE6IjEiO3M6MjM6Im1vb2RsZS9wb3J0Zm9saW86ZXhwb3J0IjtzOjE6IjEiO3M6MjE6InJlcG9zaXRvcnkvbG9jYWw6dmlldyI7czoxOiIxIjtzOjE4OiJtb29kbGUvcmF0aW5nOnJhdGUiO3M6MToiMSI7czoyMjoicmVwb3NpdG9yeS9tZXJsb3Q6dmlldyI7czoxOiIxIjtzOjE4OiJtb29kbGUvcmF0aW5nOnZpZXciO3M6MToiMSI7czoyMjoicmVwb3NpdG9yeS9waWNhc2E6dmlldyI7czoxOiIxIjtzOjIxOiJtb29kbGUvcmF0aW5nOnZpZXdhbGwiO3M6MToiMSI7czoyNzoiYmxvY2svb25saW5lX3VzZXJzOnZpZXdsaXN0IjtzOjE6IjEiO3M6MjI6InJlcG9zaXRvcnkvcmVjZW50OnZpZXciO3M6MToiMSI7czoyMToibW9vZGxlL3JhdGluZzp2aWV3YW55IjtzOjE6IjEiO3M6MTU6Im1vZC9mb2xkZXI6dmlldyI7czoxOiIxIjtzOjE4OiJyZXBvc2l0b3J5L3MzOnZpZXciO3M6MToiMSI7czoyMzoibW9vZGxlL3NpdGU6c2VuZG1lc3NhZ2UiO3M6MToiMSI7czoxNDoibW9kL2ltc2NwOnZpZXciO3M6MToiMSI7czoyMjoicmVwb3NpdG9yeS91cGxvYWQ6dmlldyI7czoxOiIxIjtzOjE3OiJtb29kbGUvdGFnOmNyZWF0ZSI7czoxOiIxIjtzOjEzOiJtb2QvcGFnZTp2aWV3IjtzOjE6IjEiO3M6MTk6InJlcG9zaXRvcnkvdXJsOnZpZXciO3M6MToiMSI7czoxNToibW9vZGxlL3RhZzplZGl0IjtzOjE6IjEiO3M6MTc6Im1vZC9yZXNvdXJjZTp2aWV3IjtzOjE6IjEiO3M6MjA6InJlcG9zaXRvcnkvdXNlcjp2aWV3IjtzOjE6IjEiO3M6Mjk6Im1vb2RsZS91c2VyOmNoYW5nZW93bnBhc3N3b3JkIjtzOjE6IjEiO3M6MTI6Im1vZC91cmw6dmlldyI7czoxOiIxIjtzOjIyOiJyZXBvc2l0b3J5L3dlYmRhdjp2aWV3IjtzOjE6IjEiO3M6MzM6Im1vb2RsZS91c2VyOmVkaXRvd25tZXNzYWdlcHJvZmlsZSI7czoxOiIxIjt9czo2OiIvMS83OjMiO2E6Mjp7czoxNzoibW9vZGxlL2Jsb2NrOmVkaXQiO3M6MjoiLTEiO3M6MTc6Im1vb2RsZS9ibG9jazp2aWV3IjtzOjI6Ii0xIjt9czo2OiIvMS83OjciO2E6MTp7czoxNzoibW9vZGxlL2Jsb2NrOnZpZXciO3M6MjoiLTEiO31zOjg6Ii8xLzIvNDozIjthOjI6e3M6MTc6Im1vb2RsZS9ibG9jazplZGl0IjtzOjI6Ii0xIjtzOjE3OiJtb29kbGUvYmxvY2s6dmlldyI7czoyOiItMSI7fXM6ODoiLzEvMi80OjciO2E6MTp7czoxNzoibW9vZGxlL2Jsb2NrOnZpZXciO3M6MjoiLTEiO31zOjk6Ii8xLzIvMzc6MyI7YToxOntzOjE3OiJtb29kbGUvYmxvY2s6ZWRpdCI7czoyOiItMSI7fXM6OToiLzEvMi8zNzo3IjthOjE6e3M6MTc6Im1vb2RsZS9ibG9jazp2aWV3IjtzOjI6Ii0xIjt9czo5OiIvMS8yLzM2OjMiO2E6Mjp7czoxNzoibW9vZGxlL2Jsb2NrOnZpZXciO3M6MjoiLTEiO3M6MTc6Im1vb2RsZS9ibG9jazplZGl0IjtzOjI6Ii0xIjt9czo5OiIvMS8yLzM2OjciO2E6MTp7czoxNzoibW9vZGxlL2Jsb2NrOnZpZXciO3M6MjoiLTEiO31zOjk6Ii8xLzIvMzU6MyI7YToyOntzOjE3OiJtb29kbGUvYmxvY2s6ZWRpdCI7czoyOiItMSI7czoxNzoibW9vZGxlL2Jsb2NrOnZpZXciO3M6NToiLTEwMDAiO31zOjk6Ii8xLzIvMzQ6MyI7YToyOntzOjE3OiJtb29kbGUvYmxvY2s6ZWRpdCI7czoyOiItMSI7czoxNzoibW9vZGxlL2Jsb2NrOnZpZXciO3M6MjoiLTEiO31zOjk6Ii8xLzIvMzQ6NyI7YToxOntzOjE3OiJtb29kbGUvYmxvY2s6dmlldyI7czoyOiItMSI7fXM6OToiLzEvMi8xNzozIjthOjI2OntzOjIzOiJtb2QvZm9ydW06ZGVsZXRlYW55cG9zdCI7czoyOiItMSI7czoxOToibW9kL2ZvcnVtOnJlcGx5cG9zdCI7czoyOiItMSI7czoxODoibW9vZGxlL3JhdGluZzp2aWV3IjtzOjI6Ii0xIjtzOjIzOiJtb2QvZm9ydW06ZGVsZXRlb3ducG9zdCI7czoyOiItMSI7czoyNToibW9kL2ZvcnVtOnN0YXJ0ZGlzY3Vzc2lvbiI7czoyOiItMSI7czoyMToibW9kL2ZvcnVtOmVkaXRhbnlwb3N0IjtzOjI6Ii0xIjtzOjI0OiJtb2QvZm9ydW06dmlld2FsbHJhdGluZ3MiO3M6MjoiLTEiO3M6MjY6Im1vZC9mb3J1bTpleHBvcnRkaXNjdXNzaW9uIjtzOjI6Ii0xIjtzOjIzOiJtb2QvZm9ydW06dmlld2FueXJhdGluZyI7czoyOiItMSI7czoyMzoibW9kL2ZvcnVtOmV4cG9ydG93bnBvc3QiO3M6MjoiLTEiO3M6MjA6Im1vZC9mb3J1bTpleHBvcnRwb3N0IjtzOjI6Ii0xIjtzOjI1OiJtb2QvZm9ydW06dmlld3N1YnNjcmliZXJzIjtzOjI6Ii0xIjtzOjMwOiJtb2QvZm9ydW06aW5pdGlhbHN1YnNjcmlwdGlvbnMiO3M6MjoiLTEiO3M6MjA6Im1vZC9mb3J1bTp2aWV3cmF0aW5nIjtzOjI6Ii0xIjtzOjI5OiJtb2QvZm9ydW06bWFuYWdlc3Vic2NyaXB0aW9ucyI7czoyOiItMSI7czozMDoibW9kL2ZvcnVtOnZpZXdoaWRkZW50aW1lZHBvc3RzIjtzOjI6Ii0xIjtzOjI1OiJtb2QvZm9ydW06bW92ZWRpc2N1c3Npb25zIjtzOjI6Ii0xIjtzOjMzOiJtb2QvZm9ydW06dmlld3FhbmRhd2l0aG91dHBvc3RpbmciO3M6MjoiLTEiO3M6MjY6Im1vZC9mb3J1bTpzcGxpdGRpc2N1c3Npb25zIjtzOjI6Ii0xIjtzOjM0OiJtb29kbGUvY291cnNlOnZpZXdoaWRkZW5hY3Rpdml0aWVzIjtzOjI6Ii0xIjtzOjMxOiJtb2QvZm9ydW06cG9zdHdpdGhvdXR0aHJvdHRsaW5nIjtzOjI6Ii0xIjtzOjE3OiJtb2QvZm9ydW06YWRkbmV3cyI7czoyOiItMSI7czoxNDoibW9kL2ZvcnVtOnJhdGUiO3M6MjoiLTEiO3M6MTg6Im1vb2RsZS9yYXRpbmc6cmF0ZSI7czoyOiItMSI7czoyNjoibW9kL2ZvcnVtOmNyZWF0ZWF0dGFjaG1lbnQiO3M6MjoiLTEiO3M6MTk6Im1vZC9mb3J1bTpyZXBseW5ld3MiO3M6MjoiLTEiO31zOjk6Ii8xLzIvMTc6NyI7YTozOntzOjI0OiJtb2QvZm9ydW06dmlld2Rpc2N1c3Npb24iO3M6MToiMSI7czoxODoibW9vZGxlL3JhdGluZzpyYXRlIjtzOjI6Ii0xIjtzOjE4OiJtb29kbGUvcmF0aW5nOnZpZXciO3M6MjoiLTEiO31zOjk6Ii8xLzIvMTU6MyI7YToyOntzOjE3OiJtb29kbGUvYmxvY2s6ZWRpdCI7czoyOiItMSI7czoxNzoibW9vZGxlL2Jsb2NrOnZpZXciO3M6MjoiLTEiO31zOjk6Ii8xLzIvMTU6NyI7YToxOntzOjE3OiJtb29kbGUvYmxvY2s6dmlldyI7czoyOiItMSI7fXM6NjoiLzEvODozIjthOjI6e3M6MTc6Im1vb2RsZS9ibG9jazplZGl0IjtzOjI6Ii0xIjtzOjE3OiJtb29kbGUvYmxvY2s6dmlldyI7czoyOiItMSI7fXM6NjoiLzEvODo3IjthOjE6e3M6MTc6Im1vb2RsZS9ibG9jazp2aWV3IjtzOjI6Ii0xIjt9fXM6NjoibG9hZGVkIjthOjM6e2k6MDtzOjQ6Ii8xLzciO2k6MTtzOjQ6Ii8xLzIiO2k6MjtzOjQ6Ii8xLzgiO31zOjI6ImRyIjtzOjE6IjciO3M6NDoidGltZSI7aToxMzE4MDEyMzk0O319', 1318012352, 1318012400, '127.0.0.1', '127.0.0.1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_solicitud`
--

CREATE TABLE IF NOT EXISTS `mdl_solicitud` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `courseid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_stats_daily`
--

CREATE TABLE IF NOT EXISTS `mdl_stats_daily` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeend` bigint(10) unsigned NOT NULL DEFAULT '0',
  `roleid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `stattype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'activity',
  `stat1` bigint(10) unsigned NOT NULL DEFAULT '0',
  `stat2` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_statdail_cou_ix` (`courseid`),
  KEY `mdl_statdail_tim_ix` (`timeend`),
  KEY `mdl_statdail_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='to accumulate daily stats' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_stats_monthly`
--

CREATE TABLE IF NOT EXISTS `mdl_stats_monthly` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeend` bigint(10) unsigned NOT NULL DEFAULT '0',
  `roleid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `stattype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'activity',
  `stat1` bigint(10) unsigned NOT NULL DEFAULT '0',
  `stat2` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_statmont_cou_ix` (`courseid`),
  KEY `mdl_statmont_tim_ix` (`timeend`),
  KEY `mdl_statmont_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To accumulate monthly stats' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_stats_user_daily`
--

CREATE TABLE IF NOT EXISTS `mdl_stats_user_daily` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `roleid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeend` bigint(10) unsigned NOT NULL DEFAULT '0',
  `statsreads` bigint(10) unsigned NOT NULL DEFAULT '0',
  `statswrites` bigint(10) unsigned NOT NULL DEFAULT '0',
  `stattype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_statuserdail_cou_ix` (`courseid`),
  KEY `mdl_statuserdail_use_ix` (`userid`),
  KEY `mdl_statuserdail_rol_ix` (`roleid`),
  KEY `mdl_statuserdail_tim_ix` (`timeend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To accumulate daily stats per course/user' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_stats_user_monthly`
--

CREATE TABLE IF NOT EXISTS `mdl_stats_user_monthly` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `roleid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeend` bigint(10) unsigned NOT NULL DEFAULT '0',
  `statsreads` bigint(10) unsigned NOT NULL DEFAULT '0',
  `statswrites` bigint(10) unsigned NOT NULL DEFAULT '0',
  `stattype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_statusermont_cou_ix` (`courseid`),
  KEY `mdl_statusermont_use_ix` (`userid`),
  KEY `mdl_statusermont_rol_ix` (`roleid`),
  KEY `mdl_statusermont_tim_ix` (`timeend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To accumulate monthly stats per course/user' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_stats_user_weekly`
--

CREATE TABLE IF NOT EXISTS `mdl_stats_user_weekly` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `roleid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeend` bigint(10) unsigned NOT NULL DEFAULT '0',
  `statsreads` bigint(10) unsigned NOT NULL DEFAULT '0',
  `statswrites` bigint(10) unsigned NOT NULL DEFAULT '0',
  `stattype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_statuserweek_cou_ix` (`courseid`),
  KEY `mdl_statuserweek_use_ix` (`userid`),
  KEY `mdl_statuserweek_rol_ix` (`roleid`),
  KEY `mdl_statuserweek_tim_ix` (`timeend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To accumulate weekly stats per course/user' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_stats_weekly`
--

CREATE TABLE IF NOT EXISTS `mdl_stats_weekly` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeend` bigint(10) unsigned NOT NULL DEFAULT '0',
  `roleid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `stattype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'activity',
  `stat1` bigint(10) unsigned NOT NULL DEFAULT '0',
  `stat2` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_statweek_cou_ix` (`courseid`),
  KEY `mdl_statweek_tim_ix` (`timeend`),
  KEY `mdl_statweek_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To accumulate weekly stats' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_survey`
--

CREATE TABLE IF NOT EXISTS `mdl_survey` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `template` bigint(10) unsigned NOT NULL DEFAULT '0',
  `days` mediumint(6) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` text COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  `questions` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_surv_cou_ix` (`course`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each record is one SURVEY module with its configuration' AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `mdl_survey`
--

INSERT INTO `mdl_survey` (`id`, `course`, `template`, `days`, `timecreated`, `timemodified`, `name`, `intro`, `introformat`, `questions`) VALUES
(1, 0, 0, 0, 985017600, 985017600, 'collesaname', 'collesaintro', 0, '25,26,27,28,29,30,43,44'),
(2, 0, 0, 0, 985017600, 985017600, 'collespname', 'collespintro', 0, '31,32,33,34,35,36,43,44'),
(3, 0, 0, 0, 985017600, 985017600, 'collesapname', 'collesapintro', 0, '37,38,39,40,41,42,43,44'),
(4, 0, 0, 0, 985017600, 985017600, 'attlsname', 'attlsintro', 0, '65,67,68'),
(5, 0, 0, 0, 985017600, 985017600, 'ciqname', 'ciqintro', 0, '69,70,71,72,73');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_survey_analysis`
--

CREATE TABLE IF NOT EXISTS `mdl_survey_analysis` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `survey` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `notes` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_survanal_use_ix` (`userid`),
  KEY `mdl_survanal_sur_ix` (`survey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='text about each survey submission' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_survey_answers`
--

CREATE TABLE IF NOT EXISTS `mdl_survey_answers` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `survey` bigint(10) unsigned NOT NULL DEFAULT '0',
  `question` bigint(10) unsigned NOT NULL DEFAULT '0',
  `time` bigint(10) unsigned NOT NULL DEFAULT '0',
  `answer1` text COLLATE utf8_unicode_ci NOT NULL,
  `answer2` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_survansw_use_ix` (`userid`),
  KEY `mdl_survansw_sur_ix` (`survey`),
  KEY `mdl_survansw_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='the answers to each questions filled by the users' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_survey_questions`
--

CREATE TABLE IF NOT EXISTS `mdl_survey_questions` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `text` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shorttext` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `multi` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` smallint(3) NOT NULL DEFAULT '0',
  `options` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='the questions conforming one survey' AUTO_INCREMENT=74 ;

--
-- Volcado de datos para la tabla `mdl_survey_questions`
--

INSERT INTO `mdl_survey_questions` (`id`, `text`, `shorttext`, `multi`, `intro`, `type`, `options`) VALUES
(1, 'colles1', 'colles1short', '', '', 1, 'scaletimes5'),
(2, 'colles2', 'colles2short', '', '', 1, 'scaletimes5'),
(3, 'colles3', 'colles3short', '', '', 1, 'scaletimes5'),
(4, 'colles4', 'colles4short', '', '', 1, 'scaletimes5'),
(5, 'colles5', 'colles5short', '', '', 1, 'scaletimes5'),
(6, 'colles6', 'colles6short', '', '', 1, 'scaletimes5'),
(7, 'colles7', 'colles7short', '', '', 1, 'scaletimes5'),
(8, 'colles8', 'colles8short', '', '', 1, 'scaletimes5'),
(9, 'colles9', 'colles9short', '', '', 1, 'scaletimes5'),
(10, 'colles10', 'colles10short', '', '', 1, 'scaletimes5'),
(11, 'colles11', 'colles11short', '', '', 1, 'scaletimes5'),
(12, 'colles12', 'colles12short', '', '', 1, 'scaletimes5'),
(13, 'colles13', 'colles13short', '', '', 1, 'scaletimes5'),
(14, 'colles14', 'colles14short', '', '', 1, 'scaletimes5'),
(15, 'colles15', 'colles15short', '', '', 1, 'scaletimes5'),
(16, 'colles16', 'colles16short', '', '', 1, 'scaletimes5'),
(17, 'colles17', 'colles17short', '', '', 1, 'scaletimes5'),
(18, 'colles18', 'colles18short', '', '', 1, 'scaletimes5'),
(19, 'colles19', 'colles19short', '', '', 1, 'scaletimes5'),
(20, 'colles20', 'colles20short', '', '', 1, 'scaletimes5'),
(21, 'colles21', 'colles21short', '', '', 1, 'scaletimes5'),
(22, 'colles22', 'colles22short', '', '', 1, 'scaletimes5'),
(23, 'colles23', 'colles23short', '', '', 1, 'scaletimes5'),
(24, 'colles24', 'colles24short', '', '', 1, 'scaletimes5'),
(25, 'collesm1', 'collesm1short', '1,2,3,4', 'collesmintro', 1, 'scaletimes5'),
(26, 'collesm2', 'collesm2short', '5,6,7,8', 'collesmintro', 1, 'scaletimes5'),
(27, 'collesm3', 'collesm3short', '9,10,11,12', 'collesmintro', 1, 'scaletimes5'),
(28, 'collesm4', 'collesm4short', '13,14,15,16', 'collesmintro', 1, 'scaletimes5'),
(29, 'collesm5', 'collesm5short', '17,18,19,20', 'collesmintro', 1, 'scaletimes5'),
(30, 'collesm6', 'collesm6short', '21,22,23,24', 'collesmintro', 1, 'scaletimes5'),
(31, 'collesm1', 'collesm1short', '1,2,3,4', 'collesmintro', 2, 'scaletimes5'),
(32, 'collesm2', 'collesm2short', '5,6,7,8', 'collesmintro', 2, 'scaletimes5'),
(33, 'collesm3', 'collesm3short', '9,10,11,12', 'collesmintro', 2, 'scaletimes5'),
(34, 'collesm4', 'collesm4short', '13,14,15,16', 'collesmintro', 2, 'scaletimes5'),
(35, 'collesm5', 'collesm5short', '17,18,19,20', 'collesmintro', 2, 'scaletimes5'),
(36, 'collesm6', 'collesm6short', '21,22,23,24', 'collesmintro', 2, 'scaletimes5'),
(37, 'collesm1', 'collesm1short', '1,2,3,4', 'collesmintro', 3, 'scaletimes5'),
(38, 'collesm2', 'collesm2short', '5,6,7,8', 'collesmintro', 3, 'scaletimes5'),
(39, 'collesm3', 'collesm3short', '9,10,11,12', 'collesmintro', 3, 'scaletimes5'),
(40, 'collesm4', 'collesm4short', '13,14,15,16', 'collesmintro', 3, 'scaletimes5'),
(41, 'collesm5', 'collesm5short', '17,18,19,20', 'collesmintro', 3, 'scaletimes5'),
(42, 'collesm6', 'collesm6short', '21,22,23,24', 'collesmintro', 3, 'scaletimes5'),
(43, 'howlong', '', '', '', 1, 'howlongoptions'),
(44, 'othercomments', '', '', '', 0, NULL),
(45, 'attls1', 'attls1short', '', '', 1, 'scaleagree5'),
(46, 'attls2', 'attls2short', '', '', 1, 'scaleagree5'),
(47, 'attls3', 'attls3short', '', '', 1, 'scaleagree5'),
(48, 'attls4', 'attls4short', '', '', 1, 'scaleagree5'),
(49, 'attls5', 'attls5short', '', '', 1, 'scaleagree5'),
(50, 'attls6', 'attls6short', '', '', 1, 'scaleagree5'),
(51, 'attls7', 'attls7short', '', '', 1, 'scaleagree5'),
(52, 'attls8', 'attls8short', '', '', 1, 'scaleagree5'),
(53, 'attls9', 'attls9short', '', '', 1, 'scaleagree5'),
(54, 'attls10', 'attls10short', '', '', 1, 'scaleagree5'),
(55, 'attls11', 'attls11short', '', '', 1, 'scaleagree5'),
(56, 'attls12', 'attls12short', '', '', 1, 'scaleagree5'),
(57, 'attls13', 'attls13short', '', '', 1, 'scaleagree5'),
(58, 'attls14', 'attls14short', '', '', 1, 'scaleagree5'),
(59, 'attls15', 'attls15short', '', '', 1, 'scaleagree5'),
(60, 'attls16', 'attls16short', '', '', 1, 'scaleagree5'),
(61, 'attls17', 'attls17short', '', '', 1, 'scaleagree5'),
(62, 'attls18', 'attls18short', '', '', 1, 'scaleagree5'),
(63, 'attls19', 'attls19short', '', '', 1, 'scaleagree5'),
(64, 'attls20', 'attls20short', '', '', 1, 'scaleagree5'),
(65, 'attlsm1', 'attlsm1', '45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64', 'attlsmintro', 1, 'scaleagree5'),
(66, '-', '-', '-', '-', 0, '-'),
(67, 'attlsm2', 'attlsm2', '63,62,59,57,55,49,52,50,48,47', 'attlsmintro', -1, 'scaleagree5'),
(68, 'attlsm3', 'attlsm3', '46,54,45,51,60,53,56,58,61,64', 'attlsmintro', -1, 'scaleagree5'),
(69, 'ciq1', 'ciq1short', '', '', 0, NULL),
(70, 'ciq2', 'ciq2short', '', '', 0, NULL),
(71, 'ciq3', 'ciq3short', '', '', 0, NULL),
(72, 'ciq4', 'ciq4short', '', '', 0, NULL),
(73, 'ciq5', 'ciq5short', '', '', 0, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_tag`
--

CREATE TABLE IF NOT EXISTS `mdl_tag` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rawname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tagtype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `flag` smallint(4) unsigned DEFAULT '0',
  `timemodified` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_tag_nam_uix` (`name`),
  KEY `mdl_tag_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tag table - this generic table will replace the old "tags" t' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_tag_correlation`
--

CREATE TABLE IF NOT EXISTS `mdl_tag_correlation` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `tagid` bigint(10) unsigned NOT NULL,
  `correlatedtags` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_tagcorr_tag_ix` (`tagid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The rationale for the ''tag_correlation'' table is performance' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_tag_instance`
--

CREATE TABLE IF NOT EXISTS `mdl_tag_instance` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `tagid` bigint(10) unsigned NOT NULL,
  `itemtype` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) unsigned NOT NULL,
  `tiuserid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `ordering` bigint(10) unsigned DEFAULT NULL,
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_taginst_iteitetagtiu_uix` (`itemtype`,`itemid`,`tagid`,`tiuserid`),
  KEY `mdl_taginst_tag_ix` (`tagid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='tag_instance table holds the information of associations bet' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_timezone`
--

CREATE TABLE IF NOT EXISTS `mdl_timezone` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `year` bigint(11) NOT NULL DEFAULT '0',
  `tzrule` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `gmtoff` bigint(11) NOT NULL DEFAULT '0',
  `dstoff` bigint(11) NOT NULL DEFAULT '0',
  `dst_month` tinyint(2) NOT NULL DEFAULT '0',
  `dst_startday` smallint(3) NOT NULL DEFAULT '0',
  `dst_weekday` smallint(3) NOT NULL DEFAULT '0',
  `dst_skipweeks` smallint(3) NOT NULL DEFAULT '0',
  `dst_time` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT '00:00',
  `std_month` tinyint(2) NOT NULL DEFAULT '0',
  `std_startday` smallint(3) NOT NULL DEFAULT '0',
  `std_weekday` smallint(3) NOT NULL DEFAULT '0',
  `std_skipweeks` smallint(3) NOT NULL DEFAULT '0',
  `std_time` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT '00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Rules for calculating local wall clock time for users' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_upgrade_log`
--

CREATE TABLE IF NOT EXISTS `mdl_upgrade_log` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` bigint(10) NOT NULL,
  `plugin` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `version` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `targetversion` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `info` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `details` text COLLATE utf8_unicode_ci,
  `backtrace` text COLLATE utf8_unicode_ci,
  `userid` bigint(10) unsigned NOT NULL,
  `timemodified` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_upgrlog_tim_ix` (`timemodified`),
  KEY `mdl_upgrlog_typtim_ix` (`type`,`timemodified`),
  KEY `mdl_upgrlog_use_ix` (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Upgrade logging' AUTO_INCREMENT=461 ;

--
-- Volcado de datos para la tabla `mdl_upgrade_log`
--

INSERT INTO `mdl_upgrade_log` (`id`, `type`, `plugin`, `version`, `targetversion`, `info`, `details`, `backtrace`, `userid`, `timemodified`) VALUES
(1, 0, 'core', '2011070101', '2011070101', 'Upgrade savepoint reached', NULL, '', 0, 1316566450),
(2, 0, 'core', '2011070101', '2011070101', 'Core installed', NULL, '', 0, 1316566527),
(3, 0, 'qtype_calculated', NULL, '2011051900', 'Starting plugin installation', NULL, '', 0, 1316566527),
(4, 0, 'qtype_calculated', '2011051900', '2011051900', 'Upgrade savepoint reached', NULL, '', 0, 1316566531),
(5, 0, 'qtype_calculated', '2011051900', '2011051900', 'Plugin installed', NULL, '', 0, 1316566532),
(6, 0, 'qtype_calculatedmulti', NULL, '2011051900', 'Starting plugin installation', NULL, '', 0, 1316566532),
(7, 0, 'qtype_calculatedmulti', '2011051900', '2011051900', 'Upgrade savepoint reached', NULL, '', 0, 1316566532),
(8, 0, 'qtype_calculatedmulti', '2011051900', '2011051900', 'Plugin installed', NULL, '', 0, 1316566532),
(9, 0, 'qtype_calculatedsimple', NULL, '2011051900', 'Starting plugin installation', NULL, '', 0, 1316566533),
(10, 0, 'qtype_calculatedsimple', '2011051900', '2011051900', 'Upgrade savepoint reached', NULL, '', 0, 1316566533),
(11, 0, 'qtype_calculatedsimple', '2011051900', '2011051900', 'Plugin installed', NULL, '', 0, 1316566533),
(12, 0, 'qtype_description', NULL, '2011051200', 'Starting plugin installation', NULL, '', 0, 1316566533),
(13, 0, 'qtype_description', '2011051200', '2011051200', 'Upgrade savepoint reached', NULL, '', 0, 1316566533),
(14, 0, 'qtype_description', '2011051200', '2011051200', 'Plugin installed', NULL, '', 0, 1316566534),
(15, 0, 'qtype_essay', NULL, '2011060300', 'Starting plugin installation', NULL, '', 0, 1316566534),
(16, 0, 'qtype_essay', '2011060300', '2011060300', 'Upgrade savepoint reached', NULL, '', 0, 1316566535),
(17, 0, 'qtype_essay', '2011060300', '2011060300', 'Plugin installed', NULL, '', 0, 1316566535),
(18, 0, 'qtype_match', NULL, '2011051200', 'Starting plugin installation', NULL, '', 0, 1316566535),
(19, 0, 'qtype_match', '2011051200', '2011051200', 'Upgrade savepoint reached', NULL, '', 0, 1316566536),
(20, 0, 'qtype_match', '2011051200', '2011051200', 'Plugin installed', NULL, '', 0, 1316566536),
(21, 0, 'qtype_missingtype', NULL, '2011051200', 'Starting plugin installation', NULL, '', 0, 1316566536),
(22, 0, 'qtype_missingtype', '2011051200', '2011051200', 'Upgrade savepoint reached', NULL, '', 0, 1316566537),
(23, 0, 'qtype_missingtype', '2011051200', '2011051200', 'Plugin installed', NULL, '', 0, 1316566538),
(24, 0, 'qtype_multianswer', NULL, '2011051200', 'Starting plugin installation', NULL, '', 0, 1316566538),
(25, 0, 'qtype_multianswer', '2011051200', '2011051200', 'Upgrade savepoint reached', NULL, '', 0, 1316566539),
(26, 0, 'qtype_multianswer', '2011051200', '2011051200', 'Plugin installed', NULL, '', 0, 1316566539),
(27, 0, 'qtype_multichoice', NULL, '2011051200', 'Starting plugin installation', NULL, '', 0, 1316566539),
(28, 0, 'qtype_multichoice', '2011051200', '2011051200', 'Upgrade savepoint reached', NULL, '', 0, 1316566540),
(29, 0, 'qtype_multichoice', '2011051200', '2011051200', 'Plugin installed', NULL, '', 0, 1316566540),
(30, 0, 'qtype_numerical', NULL, '2011051200', 'Starting plugin installation', NULL, '', 0, 1316566540),
(31, 0, 'qtype_numerical', '2011051200', '2011051200', 'Upgrade savepoint reached', NULL, '', 0, 1316566542),
(32, 0, 'qtype_numerical', '2011051200', '2011051200', 'Plugin installed', NULL, '', 0, 1316566543),
(33, 0, 'qtype_random', NULL, '2011051200', 'Starting plugin installation', NULL, '', 0, 1316566543),
(34, 0, 'qtype_random', '2011051200', '2011051200', 'Upgrade savepoint reached', NULL, '', 0, 1316566543),
(35, 0, 'qtype_random', '2011051200', '2011051200', 'Plugin installed', NULL, '', 0, 1316566543),
(36, 0, 'qtype_randomsamatch', NULL, '2010090501', 'Starting plugin installation', NULL, '', 0, 1316566543),
(37, 0, 'qtype_randomsamatch', '2010090501', '2010090501', 'Upgrade savepoint reached', NULL, '', 0, 1316566544),
(38, 0, 'qtype_randomsamatch', '2010090501', '2010090501', 'Plugin installed', NULL, '', 0, 1316566545),
(39, 0, 'qtype_shortanswer', NULL, '2011051200', 'Starting plugin installation', NULL, '', 0, 1316566545),
(40, 0, 'qtype_shortanswer', '2011051200', '2011051200', 'Upgrade savepoint reached', NULL, '', 0, 1316566545),
(41, 0, 'qtype_shortanswer', '2011051200', '2011051200', 'Plugin installed', NULL, '', 0, 1316566546),
(42, 0, 'qtype_truefalse', NULL, '2011051200', 'Starting plugin installation', NULL, '', 0, 1316566546),
(43, 0, 'qtype_truefalse', '2011051200', '2011051200', 'Upgrade savepoint reached', NULL, '', 0, 1316566547),
(44, 0, 'qtype_truefalse', '2011051200', '2011051200', 'Plugin installed', NULL, '', 0, 1316566547),
(45, 0, 'mod_assignment', NULL, '2010102600', 'Starting plugin installation', NULL, '', 0, 1316566547),
(46, 0, 'mod_assignment', '2010102600', '2010102600', 'Plugin installed', NULL, '', 0, 1316566554),
(47, 0, 'mod_chat', NULL, '2010080302', 'Starting plugin installation', NULL, '', 0, 1316566554),
(48, 0, 'mod_chat', '2010080302', '2010080302', 'Plugin installed', NULL, '', 0, 1316566565),
(49, 0, 'mod_choice', NULL, '2010101300', 'Starting plugin installation', NULL, '', 0, 1316566566),
(50, 0, 'mod_choice', '2010101300', '2010101300', 'Plugin installed', NULL, '', 0, 1316566574),
(51, 0, 'mod_data', NULL, '2011052300', 'Starting plugin installation', NULL, '', 0, 1316566574),
(52, 0, 'mod_data', '2011052300', '2011052300', 'Plugin installed', NULL, '', 0, 1316566596),
(53, 0, 'mod_feedback', NULL, '2011051600', 'Starting plugin installation', NULL, '', 0, 1316566596),
(54, 0, 'mod_feedback', '2011051600', '2011051600', 'Plugin installed', NULL, '', 0, 1316566618),
(55, 0, 'mod_folder', NULL, '2010101400', 'Starting plugin installation', NULL, '', 0, 1316566618),
(56, 0, 'mod_folder', '2010101400', '2010101400', 'Plugin installed', NULL, '', 0, 1316566622),
(57, 0, 'mod_forum', NULL, '2011052300', 'Starting plugin installation', NULL, '', 0, 1316566623),
(58, 0, 'mod_forum', '2011052300', '2011052300', 'Plugin installed', NULL, '', 0, 1316566644),
(59, 0, 'mod_glossary', NULL, '2011052300', 'Starting plugin installation', NULL, '', 0, 1316566644),
(60, 0, 'mod_glossary', '2011052300', '2011052300', 'Plugin installed', NULL, '', 0, 1316566664),
(61, 0, 'mod_imscp', NULL, '2010101400', 'Starting plugin installation', NULL, '', 0, 1316566664),
(62, 0, 'mod_imscp', '2010101400', '2010101400', 'Plugin installed', NULL, '', 0, 1316566666),
(63, 0, 'mod_label', NULL, '2010080300', 'Starting plugin installation', NULL, '', 0, 1316566666),
(64, 0, 'mod_label', '2010080300', '2010080300', 'Plugin installed', NULL, '', 0, 1316566668),
(65, 0, 'mod_lesson', NULL, '2010122200', 'Starting plugin installation', NULL, '', 0, 1316566668),
(66, 0, 'mod_lesson', '2010122200', '2010122200', 'Plugin installed', NULL, '', 0, 1316566677),
(67, 0, 'mod_page', NULL, '2010101400', 'Starting plugin installation', NULL, '', 0, 1316566678),
(68, 0, 'mod_page', '2010101400', '2010101400', 'Plugin installed', NULL, '', 0, 1316566680),
(69, 0, 'mod_quiz', NULL, '2011070100', 'Starting plugin installation', NULL, '', 0, 1316566680),
(70, 0, 'mod_quiz', '2011070100', '2011070100', 'Plugin installed', NULL, '', 0, 1316566699),
(71, 0, 'mod_resource', NULL, '2011022700', 'Starting plugin installation', NULL, '', 0, 1316566699),
(72, 0, 'mod_resource', '2011022700', '2011022700', 'Plugin installed', NULL, '', 0, 1316566704),
(73, 0, 'mod_scorm', NULL, '2011021402', 'Starting plugin installation', NULL, '', 0, 1316566704),
(74, 0, 'mod_scorm', '2011021402', '2011021402', 'Plugin installed', NULL, '', 0, 1316566731),
(75, 0, 'mod_survey', NULL, '2010080300', 'Starting plugin installation', NULL, '', 0, 1316566731),
(76, 0, 'mod_survey', '2010080300', '2010080300', 'Plugin installed', NULL, '', 0, 1316566751),
(77, 0, 'mod_url', NULL, '2010101400', 'Starting plugin installation', NULL, '', 0, 1316566751),
(78, 0, 'mod_url', '2010101400', '2010101400', 'Plugin installed', NULL, '', 0, 1316566754),
(79, 0, 'mod_wiki', NULL, '2011011001', 'Starting plugin installation', NULL, '', 0, 1316566754),
(80, 0, 'mod_wiki', '2011011001', '2011011001', 'Plugin installed', NULL, '', 0, 1316566768),
(81, 0, 'mod_workshop', NULL, '2011061000', 'Starting plugin installation', NULL, '', 0, 1316566769),
(82, 0, 'mod_workshop', '2011061000', '2011061000', 'Plugin installed', NULL, '', 0, 1316566797),
(83, 0, 'auth_cas', NULL, '2010072600', 'Starting plugin installation', NULL, '', 0, 1316566798),
(84, 0, 'auth_cas', '2010072600', '2010072600', 'Upgrade savepoint reached', NULL, '', 0, 1316566798),
(85, 0, 'auth_cas', '2010072600', '2010072600', 'Plugin installed', NULL, '', 0, 1316566799),
(86, 0, 'auth_db', NULL, '2009112400', 'Starting plugin installation', NULL, '', 0, 1316566799),
(87, 0, 'auth_db', '2009112400', '2009112400', 'Upgrade savepoint reached', NULL, '', 0, 1316566799),
(88, 0, 'auth_db', '2009112400', '2009112400', 'Plugin installed', NULL, '', 0, 1316566800),
(89, 0, 'auth_fc', NULL, '2009112400', 'Starting plugin installation', NULL, '', 0, 1316566800),
(90, 0, 'auth_fc', '2009112400', '2009112400', 'Upgrade savepoint reached', NULL, '', 0, 1316566801),
(91, 0, 'auth_fc', '2009112400', '2009112400', 'Plugin installed', NULL, '', 0, 1316566801),
(92, 0, 'auth_imap', NULL, '2009112400', 'Starting plugin installation', NULL, '', 0, 1316566801),
(93, 0, 'auth_imap', '2009112400', '2009112400', 'Upgrade savepoint reached', NULL, '', 0, 1316566801),
(94, 0, 'auth_imap', '2009112400', '2009112400', 'Plugin installed', NULL, '', 0, 1316566802),
(95, 0, 'auth_ldap', NULL, '2010072600', 'Starting plugin installation', NULL, '', 0, 1316566802),
(96, 0, 'auth_ldap', '2010072600', '2010072600', 'Upgrade savepoint reached', NULL, '', 0, 1316566802),
(97, 0, 'auth_ldap', '2010072600', '2010072600', 'Plugin installed', NULL, '', 0, 1316566803),
(98, 0, 'auth_manual', NULL, '2011022700', 'Starting plugin installation', NULL, '', 0, 1316566803),
(99, 0, 'auth_manual', '2011022700', '2011022700', 'Upgrade savepoint reached', NULL, '', 0, 1316566803),
(100, 0, 'auth_manual', '2011022700', '2011022700', 'Plugin installed', NULL, '', 0, 1316566805),
(101, 0, 'auth_mnet', NULL, '2010071300', 'Starting plugin installation', NULL, '', 0, 1316566806),
(102, 0, 'auth_mnet', '2010071300', '2010071300', 'Upgrade savepoint reached', NULL, '', 0, 1316566806),
(103, 0, 'auth_mnet', '2010071300', '2010071300', 'Plugin installed', NULL, '', 0, 1316566810),
(104, 0, 'auth_nntp', NULL, '2009112400', 'Starting plugin installation', NULL, '', 0, 1316566810),
(105, 0, 'auth_nntp', '2009112400', '2009112400', 'Upgrade savepoint reached', NULL, '', 0, 1316566810),
(106, 0, 'auth_nntp', '2009112400', '2009112400', 'Plugin installed', NULL, '', 0, 1316566811),
(107, 0, 'auth_pam', NULL, '2009112400', 'Starting plugin installation', NULL, '', 0, 1316566811),
(108, 0, 'auth_pam', '2009112400', '2009112400', 'Upgrade savepoint reached', NULL, '', 0, 1316566811),
(109, 0, 'auth_pam', '2009112400', '2009112400', 'Plugin installed', NULL, '', 0, 1316566812),
(110, 0, 'auth_pop3', NULL, '2009112400', 'Starting plugin installation', NULL, '', 0, 1316566812),
(111, 0, 'auth_pop3', '2009112400', '2009112400', 'Upgrade savepoint reached', NULL, '', 0, 1316566812),
(112, 0, 'auth_pop3', '2009112400', '2009112400', 'Plugin installed', NULL, '', 0, 1316566813),
(113, 0, 'auth_radius', NULL, '2009112400', 'Starting plugin installation', NULL, '', 0, 1316566813),
(114, 0, 'auth_radius', '2009112400', '2009112400', 'Upgrade savepoint reached', NULL, '', 0, 1316566813),
(115, 0, 'auth_radius', '2009112400', '2009112400', 'Plugin installed', NULL, '', 0, 1316566813),
(116, 0, 'auth_shibboleth', NULL, '2009112400', 'Starting plugin installation', NULL, '', 0, 1316566813),
(117, 0, 'auth_shibboleth', '2009112400', '2009112400', 'Upgrade savepoint reached', NULL, '', 0, 1316566814),
(118, 0, 'auth_shibboleth', '2009112400', '2009112400', 'Plugin installed', NULL, '', 0, 1316566814),
(119, 0, 'enrol_authorize', NULL, '2010081203', 'Starting plugin installation', NULL, '', 0, 1316566814),
(120, 0, 'enrol_authorize', '2010081203', '2010081203', 'Upgrade savepoint reached', NULL, '', 0, 1316566817),
(121, 0, 'enrol_authorize', '2010081203', '2010081203', 'Plugin installed', NULL, '', 0, 1316566819),
(122, 0, 'enrol_category', NULL, '2010061500', 'Starting plugin installation', NULL, '', 0, 1316566819),
(123, 0, 'enrol_category', '2010061500', '2010061500', 'Upgrade savepoint reached', NULL, '', 0, 1316566819),
(124, 0, 'enrol_category', '2010061500', '2010061500', 'Plugin installed', NULL, '', 0, 1316566820),
(125, 0, 'enrol_cohort', NULL, '2010073100', 'Starting plugin installation', NULL, '', 0, 1316566820),
(126, 0, 'enrol_cohort', '2010073100', '2010073100', 'Upgrade savepoint reached', NULL, '', 0, 1316566820),
(127, 0, 'enrol_cohort', '2010073100', '2010073100', 'Plugin installed', NULL, '', 0, 1316566821),
(128, 0, 'enrol_database', NULL, '2010073101', 'Starting plugin installation', NULL, '', 0, 1316566821),
(129, 0, 'enrol_database', '2010073101', '2010073101', 'Upgrade savepoint reached', NULL, '', 0, 1316566821),
(130, 0, 'enrol_database', '2010073101', '2010073101', 'Plugin installed', NULL, '', 0, 1316566822),
(131, 0, 'enrol_flatfile', NULL, '2010091400', 'Starting plugin installation', NULL, '', 0, 1316566822),
(132, 0, 'enrol_flatfile', '2010091400', '2010091400', 'Upgrade savepoint reached', NULL, '', 0, 1316566823),
(133, 0, 'enrol_flatfile', '2010091400', '2010091400', 'Plugin installed', NULL, '', 0, 1316566824),
(134, 0, 'enrol_guest', NULL, '2010081800', 'Starting plugin installation', NULL, '', 0, 1316566824),
(135, 0, 'enrol_guest', '2010081800', '2010081800', 'Upgrade savepoint reached', NULL, '', 0, 1316566824),
(136, 0, 'enrol_guest', '2010081800', '2010081800', 'Plugin installed', NULL, '', 0, 1316566825),
(137, 0, 'enrol_imsenterprise', NULL, '2011013000', 'Starting plugin installation', NULL, '', 0, 1316566825),
(138, 0, 'enrol_imsenterprise', '2011013000', '2011013000', 'Upgrade savepoint reached', NULL, '', 0, 1316566825),
(139, 0, 'enrol_imsenterprise', '2011013000', '2011013000', 'Plugin installed', NULL, '', 0, 1316566825),
(140, 0, 'enrol_ldap', NULL, '2010071100', 'Starting plugin installation', NULL, '', 0, 1316566825),
(141, 0, 'enrol_ldap', '2010071100', '2010071100', 'Upgrade savepoint reached', NULL, '', 0, 1316566825),
(142, 0, 'enrol_ldap', '2010071100', '2010071100', 'Plugin installed', NULL, '', 0, 1316566826),
(143, 0, 'enrol_manual', NULL, '2010071201', 'Starting plugin installation', NULL, '', 0, 1316566826),
(144, 0, 'enrol_manual', '2010071201', '2010071201', 'Upgrade savepoint reached', NULL, '', 0, 1316566826),
(145, 0, 'enrol_manual', '2010071201', '2010071201', 'Plugin installed', NULL, '', 0, 1316566827),
(146, 0, 'enrol_meta', NULL, '2010073100', 'Starting plugin installation', NULL, '', 0, 1316566827),
(147, 0, 'enrol_meta', '2010073100', '2010073100', 'Upgrade savepoint reached', NULL, '', 0, 1316566828),
(148, 0, 'enrol_meta', '2010073100', '2010073100', 'Plugin installed', NULL, '', 0, 1316566829),
(149, 0, 'enrol_mnet', NULL, '2010071701', 'Starting plugin installation', NULL, '', 0, 1316566829),
(150, 0, 'enrol_mnet', '2010071701', '2010071701', 'Upgrade savepoint reached', NULL, '', 0, 1316566829),
(151, 0, 'enrol_mnet', '2010071701', '2010071701', 'Plugin installed', NULL, '', 0, 1316566832),
(152, 0, 'enrol_paypal', NULL, '2010073100', 'Starting plugin installation', NULL, '', 0, 1316566832),
(153, 0, 'enrol_paypal', '2010073100', '2010073100', 'Upgrade savepoint reached', NULL, '', 0, 1316566832),
(154, 0, 'enrol_paypal', '2010073100', '2010073100', 'Plugin installed', NULL, '', 0, 1316566833),
(155, 0, 'enrol_self', NULL, '2010090501', 'Starting plugin installation', NULL, '', 0, 1316566833),
(156, 0, 'enrol_self', '2010090501', '2010090501', 'Upgrade savepoint reached', NULL, '', 0, 1316566833),
(157, 0, 'enrol_self', '2010090501', '2010090501', 'Plugin installed', NULL, '', 0, 1316566835),
(158, 0, 'message_email', NULL, '2010090501', 'Starting plugin installation', NULL, '', 0, 1316566835),
(159, 0, 'message_email', '2010090501', '2010090501', 'Upgrade savepoint reached', NULL, '', 0, 1316566836),
(160, 0, 'message_email', '2010090501', '2010090501', 'Plugin installed', NULL, '', 0, 1316566836),
(161, 0, 'message_jabber', NULL, '2010090501', 'Starting plugin installation', NULL, '', 0, 1316566836),
(162, 0, 'message_jabber', '2010090501', '2010090501', 'Upgrade savepoint reached', NULL, '', 0, 1316566836),
(163, 0, 'message_jabber', '2010090501', '2010090501', 'Plugin installed', NULL, '', 0, 1316566837),
(164, 0, 'message_popup', NULL, '2010090501', 'Starting plugin installation', NULL, '', 0, 1316566837),
(165, 0, 'message_popup', '2010090501', '2010090501', 'Upgrade savepoint reached', NULL, '', 0, 1316566838),
(166, 0, 'message_popup', '2010090501', '2010090501', 'Plugin installed', NULL, '', 0, 1316566838),
(167, 0, 'block_activity_modules', NULL, '2007101509', 'Starting plugin installation', NULL, '', 0, 1316566839),
(168, 0, 'block_activity_modules', '2007101509', '2007101509', 'Plugin installed', NULL, '', 0, 1316566839),
(169, 0, 'block_admin_bookmarks', NULL, '2007101509', 'Starting plugin installation', NULL, '', 0, 1316566839),
(170, 0, 'block_admin_bookmarks', '2007101509', '2007101509', 'Plugin installed', NULL, '', 0, 1316566839),
(171, 0, 'block_blog_menu', NULL, '2009071700', 'Starting plugin installation', NULL, '', 0, 1316566840),
(172, 0, 'block_blog_menu', '2009071700', '2009071700', 'Plugin installed', NULL, '', 0, 1316566840),
(173, 0, 'block_blog_recent', NULL, '2009070900', 'Starting plugin installation', NULL, '', 0, 1316566840),
(174, 0, 'block_blog_recent', '2009070900', '2009070900', 'Plugin installed', NULL, '', 0, 1316566840),
(175, 0, 'block_blog_tags', NULL, '2007101509', 'Starting plugin installation', NULL, '', 0, 1316566841),
(176, 0, 'block_blog_tags', '2007101509', '2007101509', 'Plugin installed', NULL, '', 0, 1316566842),
(177, 0, 'block_calendar_month', NULL, '2007101509', 'Starting plugin installation', NULL, '', 0, 1316566842),
(178, 0, 'block_calendar_month', '2007101509', '2007101509', 'Plugin installed', NULL, '', 0, 1316566843),
(179, 0, 'block_calendar_upcoming', NULL, '2007101509', 'Starting plugin installation', NULL, '', 0, 1316566843),
(180, 0, 'block_calendar_upcoming', '2007101509', '2007101509', 'Plugin installed', NULL, '', 0, 1316566843),
(181, 0, 'block_comments', NULL, '2009072000', 'Starting plugin installation', NULL, '', 0, 1316566843),
(182, 0, 'block_comments', '2009072000', '2009072000', 'Plugin installed', NULL, '', 0, 1316566844),
(183, 0, 'block_community', NULL, '2010042701', 'Starting plugin installation', NULL, '', 0, 1316566844),
(184, 0, 'block_community', '2010042701', '2010042701', 'Plugin installed', NULL, '', 0, 1316566844),
(185, 0, 'block_completionstatus', NULL, '2009072800', 'Starting plugin installation', NULL, '', 0, 1316566845),
(186, 0, 'block_completionstatus', '2009072800', '2009072800', 'Plugin installed', NULL, '', 0, 1316566845),
(187, 0, 'block_course_list', NULL, '2007101509', 'Starting plugin installation', NULL, '', 0, 1316566845),
(188, 0, 'block_course_list', '2007101509', '2007101509', 'Plugin installed', NULL, '', 0, 1316566846),
(189, 0, 'block_course_overview', NULL, '2010021100', 'Starting plugin installation', NULL, '', 0, 1316566846),
(190, 0, 'block_course_overview', '2010021100', '2010021100', 'Plugin installed', NULL, '', 0, 1316566846),
(191, 0, 'block_course_summary', NULL, '2007101509', 'Starting plugin installation', NULL, '', 0, 1316566846),
(192, 0, 'block_course_summary', '2007101509', '2007101509', 'Plugin installed', NULL, '', 0, 1316566847),
(193, 0, 'block_feedback', NULL, '2010050200', 'Starting plugin installation', NULL, '', 0, 1316566847),
(194, 0, 'block_feedback', '2010050200', '2010050200', 'Plugin installed', NULL, '', 0, 1316566848),
(195, 0, 'block_glossary_random', NULL, '2007101509', 'Starting plugin installation', NULL, '', 0, 1316566848),
(196, 0, 'block_glossary_random', '2007101509', '2007101509', 'Plugin installed', NULL, '', 0, 1316566849),
(197, 0, 'block_html', NULL, '2010071900', 'Starting plugin installation', NULL, '', 0, 1316566849),
(198, 0, 'block_html', '2010071900', '2010071900', 'Plugin installed', NULL, '', 0, 1316566849),
(199, 0, 'block_login', NULL, '2007101509', 'Starting plugin installation', NULL, '', 0, 1316566849),
(200, 0, 'block_login', '2007101509', '2007101509', 'Plugin installed', NULL, '', 0, 1316566849),
(201, 0, 'block_mentees', NULL, '2007101509', 'Starting plugin installation', NULL, '', 0, 1316566849),
(202, 0, 'block_mentees', '2007101509', '2007101509', 'Plugin installed', NULL, '', 0, 1316566850),
(203, 0, 'block_messages', NULL, '2007101509', 'Starting plugin installation', NULL, '', 0, 1316566850),
(204, 0, 'block_messages', '2007101509', '2007101509', 'Plugin installed', NULL, '', 0, 1316566851),
(205, 0, 'block_mnet_hosts', NULL, '2010112900', 'Starting plugin installation', NULL, '', 0, 1316566851),
(206, 0, 'block_mnet_hosts', '2010112900', '2010112900', 'Plugin installed', NULL, '', 0, 1316566851),
(207, 0, 'block_myprofile', NULL, '2009123100', 'Starting plugin installation', NULL, '', 0, 1316566851),
(208, 0, 'block_myprofile', '2009123100', '2009123100', 'Plugin installed', NULL, '', 0, 1316566852),
(209, 0, 'block_navigation', NULL, '2010091400', 'Starting plugin installation', NULL, '', 0, 1316566852),
(210, 0, 'block_navigation', '2010091400', '2010091400', 'Plugin installed', NULL, '', 0, 1316566852),
(211, 0, 'block_news_items', NULL, '2007101509', 'Starting plugin installation', NULL, '', 0, 1316566853),
(212, 0, 'block_news_items', '2007101509', '2007101509', 'Plugin installed', NULL, '', 0, 1316566854),
(213, 0, 'block_online_users', NULL, '2007101510', 'Starting plugin installation', NULL, '', 0, 1316566854),
(214, 0, 'block_online_users', '2007101510', '2007101510', 'Plugin installed', NULL, '', 0, 1316566856),
(215, 0, 'block_participants', NULL, '2007101509', 'Starting plugin installation', NULL, '', 0, 1316566856),
(216, 0, 'block_participants', '2007101509', '2007101509', 'Plugin installed', NULL, '', 0, 1316566856),
(217, 0, 'block_private_files', NULL, '2010030100', 'Starting plugin installation', NULL, '', 0, 1316566856),
(218, 0, 'block_private_files', '2010030100', '2010030100', 'Plugin installed', NULL, '', 0, 1316566857),
(219, 0, 'block_quiz_results', NULL, '2007101509', 'Starting plugin installation', NULL, '', 0, 1316566857),
(220, 0, 'block_quiz_results', '2007101509', '2007101509', 'Plugin installed', NULL, '', 0, 1316566858),
(221, 0, 'block_recent_activity', NULL, '2007101509', 'Starting plugin installation', NULL, '', 0, 1316566858),
(222, 0, 'block_recent_activity', '2007101509', '2007101509', 'Plugin installed', NULL, '', 0, 1316566858),
(223, 0, 'block_rss_client', NULL, '2009072901', 'Starting plugin installation', NULL, '', 0, 1316566858),
(224, 0, 'block_rss_client', '2009072901', '2009072901', 'Plugin installed', NULL, '', 0, 1316566859),
(225, 0, 'block_search', NULL, '2010111100', 'Starting plugin installation', NULL, '', 0, 1316566859),
(226, 0, 'block_search', '2010111100', '2010111100', 'Plugin installed', NULL, '', 0, 1316566861),
(227, 0, 'block_search_forums', NULL, '2007101509', 'Starting plugin installation', NULL, '', 0, 1316566861),
(228, 0, 'block_search_forums', '2007101509', '2007101509', 'Plugin installed', NULL, '', 0, 1316566862),
(229, 0, 'block_section_links', NULL, '2007101511', 'Starting plugin installation', NULL, '', 0, 1316566862),
(230, 0, 'block_section_links', '2007101511', '2007101511', 'Plugin installed', NULL, '', 0, 1316566862),
(231, 0, 'block_selfcompletion', NULL, '2009072800', 'Starting plugin installation', NULL, '', 0, 1316566862),
(232, 0, 'block_selfcompletion', '2009072800', '2009072800', 'Plugin installed', NULL, '', 0, 1316566863),
(233, 0, 'block_settings', NULL, '2010091400', 'Starting plugin installation', NULL, '', 0, 1316566863),
(234, 0, 'block_settings', '2010091400', '2010091400', 'Plugin installed', NULL, '', 0, 1316566863),
(235, 0, 'block_site_main_menu', NULL, '2007101509', 'Starting plugin installation', NULL, '', 0, 1316566864),
(236, 0, 'block_site_main_menu', '2007101509', '2007101509', 'Plugin installed', NULL, '', 0, 1316566864),
(237, 0, 'block_social_activities', NULL, '2007101509', 'Starting plugin installation', NULL, '', 0, 1316566864),
(238, 0, 'block_social_activities', '2007101509', '2007101509', 'Plugin installed', NULL, '', 0, 1316566865),
(239, 0, 'block_tag_flickr', NULL, '2007101509', 'Starting plugin installation', NULL, '', 0, 1316566865),
(240, 0, 'block_tag_flickr', '2007101509', '2007101509', 'Plugin installed', NULL, '', 0, 1316566866),
(241, 0, 'block_tag_youtube', NULL, '2007101509', 'Starting plugin installation', NULL, '', 0, 1316566866),
(242, 0, 'block_tag_youtube', '2007101509', '2007101509', 'Plugin installed', NULL, '', 0, 1316566867),
(243, 0, 'block_tags', NULL, '2010090502', 'Starting plugin installation', NULL, '', 0, 1316566867),
(244, 0, 'block_tags', '2010090502', '2010090502', 'Plugin installed', NULL, '', 0, 1316566867),
(245, 0, 'filter_emoticon', NULL, '2010102300', 'Starting plugin installation', NULL, '', 0, 1316566869),
(246, 0, 'filter_emoticon', '2010102300', '2010102300', 'Upgrade savepoint reached', NULL, '', 0, 1316566869),
(247, 0, 'filter_emoticon', '2010102300', '2010102300', 'Plugin installed', NULL, '', 0, 1316566870),
(248, 0, 'filter_mediaplugin', NULL, '2011030900', 'Starting plugin installation', NULL, '', 0, 1316566870),
(249, 0, 'filter_mediaplugin', '2011030900', '2011030900', 'Upgrade savepoint reached', NULL, '', 0, 1316566870),
(250, 0, 'filter_mediaplugin', '2011030900', '2011030900', 'Plugin installed', NULL, '', 0, 1316566871),
(251, 0, 'filter_tex', NULL, '2011031301', 'Starting plugin installation', NULL, '', 0, 1316566871),
(252, 0, 'filter_tex', '2011031301', '2011031301', 'Upgrade savepoint reached', NULL, '', 0, 1316566871),
(253, 0, 'filter_tex', '2011031301', '2011031301', 'Plugin installed', NULL, '', 0, 1316566872),
(254, 0, 'filter_urltolink', NULL, '2010100500', 'Starting plugin installation', NULL, '', 0, 1316566873),
(255, 0, 'filter_urltolink', '2010100500', '2010100500', 'Upgrade savepoint reached', NULL, '', 0, 1316566873),
(256, 0, 'filter_urltolink', '2010100500', '2010100500', 'Plugin installed', NULL, '', 0, 1316566873),
(257, 0, 'editor_textarea', NULL, '2010090501', 'Starting plugin installation', NULL, '', 0, 1316566874),
(258, 0, 'editor_textarea', '2010090501', '2010090501', 'Upgrade savepoint reached', NULL, '', 0, 1316566874),
(259, 0, 'editor_textarea', '2010090501', '2010090501', 'Plugin installed', NULL, '', 0, 1316566875),
(260, 0, 'editor_tinymce', NULL, '2010093000', 'Starting plugin installation', NULL, '', 0, 1316566875),
(261, 0, 'editor_tinymce', '2010093000', '2010093000', 'Upgrade savepoint reached', NULL, '', 0, 1316566875),
(262, 0, 'editor_tinymce', '2010093000', '2010093000', 'Plugin installed', NULL, '', 0, 1316566876),
(263, 0, 'report_courseoverview', NULL, '2010090501', 'Starting plugin installation', NULL, '', 0, 1316566876),
(264, 0, 'report_courseoverview', '2010090501', '2010090501', 'Upgrade savepoint reached', NULL, '', 0, 1316566876),
(265, 0, 'report_courseoverview', '2010090501', '2010090501', 'Plugin installed', NULL, '', 0, 1316566877),
(266, 0, 'report_customlang', NULL, '2011041900', 'Starting plugin installation', NULL, '', 0, 1316566878),
(267, 0, 'report_customlang', '2011041900', '2011041900', 'Upgrade savepoint reached', NULL, '', 0, 1316566880),
(268, 0, 'report_customlang', '2011041900', '2011041900', 'Plugin installed', NULL, '', 0, 1316566880),
(269, 0, 'report_questioninstances', NULL, '2010090501', 'Starting plugin installation', NULL, '', 0, 1316566881),
(270, 0, 'report_questioninstances', '2010090501', '2010090501', 'Upgrade savepoint reached', NULL, '', 0, 1316566881),
(271, 0, 'report_questioninstances', '2010090501', '2010090501', 'Plugin installed', NULL, '', 0, 1316566881),
(272, 0, 'report_security', NULL, '2010090501', 'Starting plugin installation', NULL, '', 0, 1316566881),
(273, 0, 'report_security', '2010090501', '2010090501', 'Upgrade savepoint reached', NULL, '', 0, 1316566882),
(274, 0, 'report_security', '2010090501', '2010090501', 'Plugin installed', NULL, '', 0, 1316566882),
(275, 0, 'report_unittest', NULL, '2010090501', 'Starting plugin installation', NULL, '', 0, 1316566882),
(276, 0, 'report_unittest', '2010090501', '2010090501', 'Upgrade savepoint reached', NULL, '', 0, 1316566882),
(277, 0, 'report_unittest', '2010090501', '2010090501', 'Plugin installed', NULL, '', 0, 1316566883),
(278, 0, 'report_unsuproles', NULL, '2010071800', 'Starting plugin installation', NULL, '', 0, 1316566883),
(279, 0, 'report_unsuproles', '2010071800', '2010071800', 'Upgrade savepoint reached', NULL, '', 0, 1316566883),
(280, 0, 'report_unsuproles', '2010071800', '2010071800', 'Plugin installed', NULL, '', 0, 1316566884),
(281, 0, 'coursereport_completion', NULL, '2010090501', 'Starting plugin installation', NULL, '', 0, 1316566884),
(282, 0, 'coursereport_completion', '2010090501', '2010090501', 'Upgrade savepoint reached', NULL, '', 0, 1316566884),
(283, 0, 'coursereport_completion', '2010090501', '2010090501', 'Plugin installed', NULL, '', 0, 1316566885),
(284, 0, 'coursereport_log', NULL, '2010090501', 'Starting plugin installation', NULL, '', 0, 1316566885),
(285, 0, 'coursereport_log', '2010090501', '2010090501', 'Upgrade savepoint reached', NULL, '', 0, 1316566885),
(286, 0, 'coursereport_log', '2010090501', '2010090501', 'Plugin installed', NULL, '', 0, 1316566886),
(287, 0, 'coursereport_outline', NULL, '2010090501', 'Starting plugin installation', NULL, '', 0, 1316566886),
(288, 0, 'coursereport_outline', '2010090501', '2010090501', 'Upgrade savepoint reached', NULL, '', 0, 1316566886),
(289, 0, 'coursereport_outline', '2010090501', '2010090501', 'Plugin installed', NULL, '', 0, 1316566887),
(290, 0, 'coursereport_participation', NULL, '2010090501', 'Starting plugin installation', NULL, '', 0, 1316566888),
(291, 0, 'coursereport_participation', '2010090501', '2010090501', 'Upgrade savepoint reached', NULL, '', 0, 1316566888),
(292, 0, 'coursereport_participation', '2010090501', '2010090501', 'Plugin installed', NULL, '', 0, 1316566890),
(293, 0, 'coursereport_progress', NULL, '2010090501', 'Starting plugin installation', NULL, '', 0, 1316566890),
(294, 0, 'coursereport_progress', '2010090501', '2010090501', 'Upgrade savepoint reached', NULL, '', 0, 1316566891),
(295, 0, 'coursereport_progress', '2010090501', '2010090501', 'Plugin installed', NULL, '', 0, 1316566892),
(296, 0, 'coursereport_stats', NULL, '2010090501', 'Starting plugin installation', NULL, '', 0, 1316566892),
(297, 0, 'coursereport_stats', '2010090501', '2010090501', 'Upgrade savepoint reached', NULL, '', 0, 1316566892),
(298, 0, 'coursereport_stats', '2010090501', '2010090501', 'Plugin installed', NULL, '', 0, 1316566893),
(299, 0, 'gradeexport_ods', NULL, '2010090501', 'Starting plugin installation', NULL, '', 0, 1316566893),
(300, 0, 'gradeexport_ods', '2010090501', '2010090501', 'Upgrade savepoint reached', NULL, '', 0, 1316566893),
(301, 0, 'gradeexport_ods', '2010090501', '2010090501', 'Plugin installed', NULL, '', 0, 1316566894),
(302, 0, 'gradeexport_txt', NULL, '2010090501', 'Starting plugin installation', NULL, '', 0, 1316566894),
(303, 0, 'gradeexport_txt', '2010090501', '2010090501', 'Upgrade savepoint reached', NULL, '', 0, 1316566894),
(304, 0, 'gradeexport_txt', '2010090501', '2010090501', 'Plugin installed', NULL, '', 0, 1316566895),
(305, 0, 'gradeexport_xls', NULL, '2010090501', 'Starting plugin installation', NULL, '', 0, 1316566895),
(306, 0, 'gradeexport_xls', '2010090501', '2010090501', 'Upgrade savepoint reached', NULL, '', 0, 1316566895),
(307, 0, 'gradeexport_xls', '2010090501', '2010090501', 'Plugin installed', NULL, '', 0, 1316566896),
(308, 0, 'gradeexport_xml', NULL, '2010090501', 'Starting plugin installation', NULL, '', 0, 1316566896),
(309, 0, 'gradeexport_xml', '2010090501', '2010090501', 'Upgrade savepoint reached', NULL, '', 0, 1316566896),
(310, 0, 'gradeexport_xml', '2010090501', '2010090501', 'Plugin installed', NULL, '', 0, 1316566897),
(311, 0, 'gradeimport_csv', NULL, '2010090501', 'Starting plugin installation', NULL, '', 0, 1316566897),
(312, 0, 'gradeimport_csv', '2010090501', '2010090501', 'Upgrade savepoint reached', NULL, '', 0, 1316566897),
(313, 0, 'gradeimport_csv', '2010090501', '2010090501', 'Plugin installed', NULL, '', 0, 1316566898),
(314, 0, 'gradeimport_xml', NULL, '2010090501', 'Starting plugin installation', NULL, '', 0, 1316566898),
(315, 0, 'gradeimport_xml', '2010090501', '2010090501', 'Upgrade savepoint reached', NULL, '', 0, 1316566898),
(316, 0, 'gradeimport_xml', '2010090501', '2010090501', 'Plugin installed', NULL, '', 0, 1316566899),
(317, 0, 'gradereport_grader', NULL, '2010090501', 'Starting plugin installation', NULL, '', 0, 1316566899),
(318, 0, 'gradereport_grader', '2010090501', '2010090501', 'Upgrade savepoint reached', NULL, '', 0, 1316566899),
(319, 0, 'gradereport_grader', '2010090501', '2010090501', 'Plugin installed', NULL, '', 0, 1316566900),
(320, 0, 'gradereport_outcomes', NULL, '2010090501', 'Starting plugin installation', NULL, '', 0, 1316566900),
(321, 0, 'gradereport_outcomes', '2010090501', '2010090501', 'Upgrade savepoint reached', NULL, '', 0, 1316566900),
(322, 0, 'gradereport_outcomes', '2010090501', '2010090501', 'Plugin installed', NULL, '', 0, 1316566900),
(323, 0, 'gradereport_overview', NULL, '2010090501', 'Starting plugin installation', NULL, '', 0, 1316566901),
(324, 0, 'gradereport_overview', '2010090501', '2010090501', 'Upgrade savepoint reached', NULL, '', 0, 1316566901),
(325, 0, 'gradereport_overview', '2010090501', '2010090501', 'Plugin installed', NULL, '', 0, 1316566901),
(326, 0, 'gradereport_user', NULL, '2010090501', 'Starting plugin installation', NULL, '', 0, 1316566901),
(327, 0, 'gradereport_user', '2010090501', '2010090501', 'Upgrade savepoint reached', NULL, '', 0, 1316566901),
(328, 0, 'gradereport_user', '2010090501', '2010090501', 'Plugin installed', NULL, '', 0, 1316566903),
(329, 0, 'mnetservice_enrol', NULL, '2010071700', 'Starting plugin installation', NULL, '', 0, 1316566903),
(330, 0, 'mnetservice_enrol', '2010071700', '2010071700', 'Upgrade savepoint reached', NULL, '', 0, 1316566905),
(331, 0, 'mnetservice_enrol', '2010071700', '2010071700', 'Plugin installed', NULL, '', 0, 1316566905),
(332, 0, 'webservice_amf', NULL, '2009101900', 'Starting plugin installation', NULL, '', 0, 1316566906),
(333, 0, 'webservice_amf', '2009101900', '2009101900', 'Upgrade savepoint reached', NULL, '', 0, 1316566906),
(334, 0, 'webservice_amf', '2009101900', '2009101900', 'Plugin installed', NULL, '', 0, 1316566906),
(335, 0, 'webservice_rest', NULL, '2009100800', 'Starting plugin installation', NULL, '', 0, 1316566906),
(336, 0, 'webservice_rest', '2009100800', '2009100800', 'Upgrade savepoint reached', NULL, '', 0, 1316566906),
(337, 0, 'webservice_rest', '2009100800', '2009100800', 'Plugin installed', NULL, '', 0, 1316566907),
(338, 0, 'webservice_soap', NULL, '2009101900', 'Starting plugin installation', NULL, '', 0, 1316566907),
(339, 0, 'webservice_soap', '2009101900', '2009101900', 'Upgrade savepoint reached', NULL, '', 0, 1316566907),
(340, 0, 'webservice_soap', '2009101900', '2009101900', 'Plugin installed', NULL, '', 0, 1316566907),
(341, 0, 'webservice_xmlrpc', NULL, '2009101900', 'Starting plugin installation', NULL, '', 0, 1316566907),
(342, 0, 'webservice_xmlrpc', '2009101900', '2009101900', 'Upgrade savepoint reached', NULL, '', 0, 1316566908),
(343, 0, 'webservice_xmlrpc', '2009101900', '2009101900', 'Plugin installed', NULL, '', 0, 1316566908),
(344, 0, 'repository_alfresco', NULL, '2010050700', 'Starting plugin installation', NULL, '', 0, 1316566908),
(345, 0, 'repository_alfresco', '2010050700', '2010050700', 'Upgrade savepoint reached', NULL, '', 0, 1316566908),
(346, 0, 'repository_alfresco', '2010050700', '2010050700', 'Plugin installed', NULL, '', 0, 1316566909),
(347, 0, 'repository_boxnet', NULL, '2009080105', 'Starting plugin installation', NULL, '', 0, 1316566909),
(348, 0, 'repository_boxnet', '2009080105', '2009080105', 'Upgrade savepoint reached', NULL, '', 0, 1316566909),
(349, 0, 'repository_boxnet', '2009080105', '2009080105', 'Plugin installed', NULL, '', 0, 1316566910),
(350, 0, 'repository_coursefiles', NULL, '2010083100', 'Starting plugin installation', NULL, '', 0, 1316566910),
(351, 0, 'repository_coursefiles', '2010083100', '2010083100', 'Upgrade savepoint reached', NULL, '', 0, 1316566910),
(352, 0, 'repository_coursefiles', '2010083100', '2010083100', 'Plugin installed', NULL, '', 0, 1316566911),
(353, 0, 'repository_dropbox', NULL, '2010051400', 'Starting plugin installation', NULL, '', 0, 1316566911),
(354, 0, 'repository_dropbox', '2010051400', '2010051400', 'Upgrade savepoint reached', NULL, '', 0, 1316566911),
(355, 0, 'repository_dropbox', '2010051400', '2010051400', 'Plugin installed', NULL, '', 0, 1316566911),
(356, 0, 'repository_filesystem', NULL, '2009080102', 'Starting plugin installation', NULL, '', 0, 1316566912),
(357, 0, 'repository_filesystem', '2009080102', '2009080102', 'Upgrade savepoint reached', NULL, '', 0, 1316566912),
(358, 0, 'repository_filesystem', '2009080102', '2009080102', 'Plugin installed', NULL, '', 0, 1316566913),
(359, 0, 'repository_flickr', NULL, '2009080102', 'Starting plugin installation', NULL, '', 0, 1316566913),
(360, 0, 'repository_flickr', '2009080102', '2009080102', 'Upgrade savepoint reached', NULL, '', 0, 1316566913),
(361, 0, 'repository_flickr', '2009080102', '2009080102', 'Plugin installed', NULL, '', 0, 1316566915),
(362, 0, 'repository_flickr_public', NULL, '2009080102', 'Starting plugin installation', NULL, '', 0, 1316566915),
(363, 0, 'repository_flickr_public', '2009080102', '2009080102', 'Upgrade savepoint reached', NULL, '', 0, 1316566915),
(364, 0, 'repository_flickr_public', '2009080102', '2009080102', 'Plugin installed', NULL, '', 0, 1316566916),
(365, 0, 'repository_googledocs', NULL, '2009080102', 'Starting plugin installation', NULL, '', 0, 1316566916),
(366, 0, 'repository_googledocs', '2009080102', '2009080102', 'Upgrade savepoint reached', NULL, '', 0, 1316566916),
(367, 0, 'repository_googledocs', '2009080102', '2009080102', 'Plugin installed', NULL, '', 0, 1316566916),
(368, 0, 'repository_local', NULL, '2009080102', 'Starting plugin installation', NULL, '', 0, 1316566916),
(369, 0, 'repository_local', '2009080102', '2009080102', 'Upgrade savepoint reached', NULL, '', 0, 1316566917),
(370, 0, 'repository_local', '2009080102', '2009080102', 'Plugin installed', NULL, '', 0, 1316566918),
(371, 0, 'repository_merlot', NULL, '2009111301', 'Starting plugin installation', NULL, '', 0, 1316566918),
(372, 0, 'repository_merlot', '2009111301', '2009111301', 'Upgrade savepoint reached', NULL, '', 0, 1316566919),
(373, 0, 'repository_merlot', '2009111301', '2009111301', 'Plugin installed', NULL, '', 0, 1316566919),
(374, 0, 'repository_picasa', NULL, '2009080102', 'Starting plugin installation', NULL, '', 0, 1316566919),
(375, 0, 'repository_picasa', '2009080102', '2009080102', 'Upgrade savepoint reached', NULL, '', 0, 1316566920),
(376, 0, 'repository_picasa', '2009080102', '2009080102', 'Plugin installed', NULL, '', 0, 1316566920),
(377, 0, 'repository_recent', NULL, '2010042202', 'Starting plugin installation', NULL, '', 0, 1316566921),
(378, 0, 'repository_recent', '2010042202', '2010042202', 'Upgrade savepoint reached', NULL, '', 0, 1316566921),
(379, 0, 'repository_recent', '2010042202', '2010042202', 'Plugin installed', NULL, '', 0, 1316566922),
(380, 0, 'repository_s3', NULL, '2009080102', 'Starting plugin installation', NULL, '', 0, 1316566922),
(381, 0, 'repository_s3', '2009080102', '2009080102', 'Upgrade savepoint reached', NULL, '', 0, 1316566922),
(382, 0, 'repository_s3', '2009080102', '2009080102', 'Plugin installed', NULL, '', 0, 1316566922),
(383, 0, 'repository_upload', NULL, '2009080102', 'Starting plugin installation', NULL, '', 0, 1316566923),
(384, 0, 'repository_upload', '2009080102', '2009080102', 'Upgrade savepoint reached', NULL, '', 0, 1316566923),
(385, 0, 'repository_upload', '2009080102', '2009080102', 'Plugin installed', NULL, '', 0, 1316566925),
(386, 0, 'repository_url', NULL, '2009080102', 'Starting plugin installation', NULL, '', 0, 1316566925),
(387, 0, 'repository_url', '2009080102', '2009080102', 'Upgrade savepoint reached', NULL, '', 0, 1316566925),
(388, 0, 'repository_url', '2009080102', '2009080102', 'Plugin installed', NULL, '', 0, 1316566926),
(389, 0, 'repository_user', NULL, '2010052700', 'Starting plugin installation', NULL, '', 0, 1316566926),
(390, 0, 'repository_user', '2010052700', '2010052700', 'Upgrade savepoint reached', NULL, '', 0, 1316566927),
(391, 0, 'repository_user', '2010052700', '2010052700', 'Plugin installed', NULL, '', 0, 1316566928),
(392, 0, 'repository_webdav', NULL, '2009080102', 'Starting plugin installation', NULL, '', 0, 1316566928),
(393, 0, 'repository_webdav', '2009080102', '2009080102', 'Upgrade savepoint reached', NULL, '', 0, 1316566928),
(394, 0, 'repository_webdav', '2009080102', '2009080102', 'Plugin installed', NULL, '', 0, 1316566928),
(395, 0, 'repository_wikimedia', NULL, '2009080102', 'Starting plugin installation', NULL, '', 0, 1316566928),
(396, 0, 'repository_wikimedia', '2009080102', '2009080102', 'Upgrade savepoint reached', NULL, '', 0, 1316566929),
(397, 0, 'repository_wikimedia', '2009080102', '2009080102', 'Plugin installed', NULL, '', 0, 1316566929),
(398, 0, 'repository_youtube', NULL, '2009080102', 'Starting plugin installation', NULL, '', 0, 1316566929),
(399, 0, 'repository_youtube', '2009080102', '2009080102', 'Upgrade savepoint reached', NULL, '', 0, 1316566929),
(400, 0, 'repository_youtube', '2009080102', '2009080102', 'Plugin installed', NULL, '', 0, 1316566930),
(401, 0, 'portfolio_boxnet', NULL, '2010090501', 'Starting plugin installation', NULL, '', 0, 1316566930),
(402, 0, 'portfolio_boxnet', '2010090501', '2010090501', 'Upgrade savepoint reached', NULL, '', 0, 1316566931),
(403, 0, 'portfolio_boxnet', '2010090501', '2010090501', 'Plugin installed', NULL, '', 0, 1316566931),
(404, 0, 'portfolio_download', NULL, '2010090501', 'Starting plugin installation', NULL, '', 0, 1316566931),
(405, 0, 'portfolio_download', '2010090501', '2010090501', 'Upgrade savepoint reached', NULL, '', 0, 1316566931),
(406, 0, 'portfolio_download', '2010090501', '2010090501', 'Plugin installed', NULL, '', 0, 1316566932),
(407, 0, 'portfolio_flickr', NULL, '2010090501', 'Starting plugin installation', NULL, '', 0, 1316566932),
(408, 0, 'portfolio_flickr', '2010090501', '2010090501', 'Upgrade savepoint reached', NULL, '', 0, 1316566932),
(409, 0, 'portfolio_flickr', '2010090501', '2010090501', 'Plugin installed', NULL, '', 0, 1316566933),
(410, 0, 'portfolio_googledocs', NULL, '2010090501', 'Starting plugin installation', NULL, '', 0, 1316566933),
(411, 0, 'portfolio_googledocs', '2010090501', '2010090501', 'Upgrade savepoint reached', NULL, '', 0, 1316566933),
(412, 0, 'portfolio_googledocs', '2010090501', '2010090501', 'Plugin installed', NULL, '', 0, 1316566934),
(413, 0, 'portfolio_mahara', NULL, '2010090501', 'Starting plugin installation', NULL, '', 0, 1316566934),
(414, 0, 'portfolio_mahara', '2010090501', '2010090501', 'Upgrade savepoint reached', NULL, '', 0, 1316566935),
(415, 0, 'portfolio_mahara', '2010090501', '2010090501', 'Plugin installed', NULL, '', 0, 1316566936),
(416, 0, 'portfolio_picasa', NULL, '2010090501', 'Starting plugin installation', NULL, '', 0, 1316566936),
(417, 0, 'portfolio_picasa', '2010090501', '2010090501', 'Upgrade savepoint reached', NULL, '', 0, 1316566936),
(418, 0, 'portfolio_picasa', '2010090501', '2010090501', 'Plugin installed', NULL, '', 0, 1316566937),
(419, 0, 'theme_formal_white', NULL, '2011061301', 'Starting plugin installation', NULL, '', 0, 1316566937),
(420, 0, 'theme_formal_white', '2011061301', '2011061301', 'Upgrade savepoint reached', NULL, '', 0, 1316566937),
(421, 0, 'theme_formal_white', '2011061301', '2011061301', 'Plugin installed', NULL, '', 0, 1316566939),
(422, 0, 'assignment_online', NULL, '2010090501', 'Starting plugin installation', NULL, '', 0, 1316566939),
(423, 0, 'assignment_online', '2010090501', '2010090501', 'Upgrade savepoint reached', NULL, '', 0, 1316566939),
(424, 0, 'assignment_online', '2010090501', '2010090501', 'Plugin installed', NULL, '', 0, 1316566939),
(425, 0, 'quiz_grading', NULL, '2011051200', 'Starting plugin installation', NULL, '', 0, 1316566939),
(426, 0, 'quiz_grading', '2011051200', '2011051200', 'Upgrade savepoint reached', NULL, '', 0, 1316566939),
(427, 0, 'quiz_grading', '2011051200', '2011051200', 'Plugin installed', NULL, '', 0, 1316566940),
(428, 0, 'quiz_overview', NULL, '2011051200', 'Starting plugin installation', NULL, '', 0, 1316566940),
(429, 0, 'quiz_overview', '2011051200', '2011051200', 'Upgrade savepoint reached', NULL, '', 0, 1316566941),
(430, 0, 'quiz_overview', '2011051200', '2011051200', 'Plugin installed', NULL, '', 0, 1316566941),
(431, 0, 'quiz_responses', NULL, '2011051200', 'Starting plugin installation', NULL, '', 0, 1316566941),
(432, 0, 'quiz_responses', '2011051200', '2011051200', 'Upgrade savepoint reached', NULL, '', 0, 1316566941),
(433, 0, 'quiz_responses', '2011051200', '2011051200', 'Plugin installed', NULL, '', 0, 1316566942),
(434, 0, 'quiz_statistics', NULL, '2011062600', 'Starting plugin installation', NULL, '', 0, 1316566942),
(435, 0, 'quiz_statistics', '2011062600', '2011062600', 'Upgrade savepoint reached', NULL, '', 0, 1316566943),
(436, 0, 'quiz_statistics', '2011062600', '2011062600', 'Plugin installed', NULL, '', 0, 1316566944),
(437, 0, 'workshopform_accumulative', NULL, '2010091700', 'Starting plugin installation', NULL, '', 0, 1316566944),
(438, 0, 'workshopform_accumulative', '2010091700', '2010091700', 'Upgrade savepoint reached', NULL, '', 0, 1316566945),
(439, 0, 'workshopform_accumulative', '2010091700', '2010091700', 'Plugin installed', NULL, '', 0, 1316566945),
(440, 0, 'workshopform_comments', NULL, '2010091700', 'Starting plugin installation', NULL, '', 0, 1316566945),
(441, 0, 'workshopform_comments', '2010091700', '2010091700', 'Upgrade savepoint reached', NULL, '', 0, 1316566946),
(442, 0, 'workshopform_comments', '2010091700', '2010091700', 'Plugin installed', NULL, '', 0, 1316566947),
(443, 0, 'workshopform_numerrors', NULL, '2010091700', 'Starting plugin installation', NULL, '', 0, 1316566947),
(444, 0, 'workshopform_numerrors', '2010091700', '2010091700', 'Upgrade savepoint reached', NULL, '', 0, 1316566950),
(445, 0, 'workshopform_numerrors', '2010091700', '2010091700', 'Plugin installed', NULL, '', 0, 1316566951),
(446, 0, 'workshopform_rubric', NULL, '2010091700', 'Starting plugin installation', NULL, '', 0, 1316566951),
(447, 0, 'workshopform_rubric', '2010091700', '2010091700', 'Upgrade savepoint reached', NULL, '', 0, 1316566953),
(448, 0, 'workshopform_rubric', '2010091700', '2010091700', 'Plugin installed', NULL, '', 0, 1316566954),
(449, 0, 'workshopeval_best', NULL, '2010090501', 'Starting plugin installation', NULL, '', 0, 1316566954),
(450, 0, 'workshopeval_best', '2010090501', '2010090501', 'Upgrade savepoint reached', NULL, '', 0, 1316566955),
(451, 0, 'workshopeval_best', '2010090501', '2010090501', 'Plugin installed', NULL, '', 0, 1316566955),
(452, 0, 'local_qeupgradehelper', NULL, '2011040400', 'Starting plugin installation', NULL, '', 0, 1316566955),
(453, 0, 'local_qeupgradehelper', '2011040400', '2011040400', 'Upgrade savepoint reached', NULL, '', 0, 1316566955),
(454, 0, 'local_qeupgradehelper', '2011040400', '2011040400', 'Plugin installed', NULL, '', 0, 1316566956),
(455, 2, 'core', '2011070101', '2011070101', 'Exception: plugin_defective_exception', 'Lo sentimos, el plugin "block_moderated" es defectuoso o no actualizado: no se puede continuar.', '* line 624 of \\lib\\upgradelib.php: plugin_defective_exception thrown\n* line 267 of \\lib\\upgradelib.php: call to upgrade_plugins_blocks()\n* line 1460 of \\lib\\upgradelib.php: call to upgrade_plugins()\n* line 317 of \\admin\\index.php: call to upgrade_noncore()\n', 2, 1317945664),
(456, 2, 'core', '2011070101', '2011070101', 'Exception: plugin_defective_exception', 'Lo sentimos, el plugin "block_moderated" es defectuoso o no actualizado: no se puede continuar.', '* line 624 of \\lib\\upgradelib.php: plugin_defective_exception thrown\n* line 267 of \\lib\\upgradelib.php: call to upgrade_plugins_blocks()\n* line 1460 of \\lib\\upgradelib.php: call to upgrade_plugins()\n* line 317 of \\admin\\index.php: call to upgrade_noncore()\n', 2, 1317945681),
(457, 2, 'core', '2011070101', '2011070101', 'Exception: plugin_defective_exception', 'Lo sentimos, el plugin "mod_moderated" es defectuoso o no actualizado: no se puede continuar.', '* line 458 of /lib/upgradelib.php: plugin_defective_exception thrown\n* line 265 of /lib/upgradelib.php: call to upgrade_plugins_modules()\n* line 1460 of /lib/upgradelib.php: call to upgrade_plugins()\n* line 317 of /admin/index.php: call to upgrade_noncore()\n', 2, 1318000699),
(458, 2, 'core', '2011070101', '2011070101', 'Exception: plugin_defective_exception', 'Lo sentimos, el plugin "mod_moderated" es defectuoso o no actualizado: no se puede continuar.', '* line 458 of /lib/upgradelib.php: plugin_defective_exception thrown\n* line 265 of /lib/upgradelib.php: call to upgrade_plugins_modules()\n* line 1460 of /lib/upgradelib.php: call to upgrade_plugins()\n* line 317 of /admin/index.php: call to upgrade_noncore()\n', 2, 1318000725),
(459, 2, 'core', '2011070101', '2011070101', 'Exception: plugin_defective_exception', 'Lo sentimos, el plugin "mod_moderated" es defectuoso o no actualizado: no se puede continuar.', '* line 458 of /lib/upgradelib.php: plugin_defective_exception thrown\n* line 265 of /lib/upgradelib.php: call to upgrade_plugins_modules()\n* line 1460 of /lib/upgradelib.php: call to upgrade_plugins()\n* line 317 of /admin/index.php: call to upgrade_noncore()\n', 2, 1318000741);
INSERT INTO `mdl_upgrade_log` (`id`, `type`, `plugin`, `version`, `targetversion`, `info`, `details`, `backtrace`, `userid`, `timemodified`) VALUES
(460, 2, 'core', '2011070101', '2011070101', 'Exception: plugin_defective_exception', 'Lo sentimos, el plugin "mod_moderated" es defectuoso o no actualizado: no se puede continuar.', '* line 458 of /lib/upgradelib.php: plugin_defective_exception thrown\n* line 265 of /lib/upgradelib.php: call to upgrade_plugins_modules()\n* line 1460 of /lib/upgradelib.php: call to upgrade_plugins()\n* line 317 of /admin/index.php: call to upgrade_noncore()\n', 2, 1318000899);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_url`
--

CREATE TABLE IF NOT EXISTS `mdl_url` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` text COLLATE utf8_unicode_ci,
  `introformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  `externalurl` text COLLATE utf8_unicode_ci,
  `display` smallint(4) unsigned NOT NULL DEFAULT '0',
  `displayoptions` text COLLATE utf8_unicode_ci,
  `parameters` text COLLATE utf8_unicode_ci,
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_url_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='each record is one url resource' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_user`
--

CREATE TABLE IF NOT EXISTS `mdl_user` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `auth` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'manual',
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `policyagreed` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `mnethostid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `idnumber` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `firstname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `lastname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `emailstop` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `icq` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `skype` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `yahoo` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `aim` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `msn` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `phone1` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `phone2` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `institution` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `department` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `address` varchar(70) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `city` varchar(120) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `country` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `lang` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'en',
  `theme` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timezone` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '99',
  `firstaccess` bigint(10) unsigned NOT NULL DEFAULT '0',
  `lastaccess` bigint(10) unsigned NOT NULL DEFAULT '0',
  `lastlogin` bigint(10) unsigned NOT NULL DEFAULT '0',
  `currentlogin` bigint(10) unsigned NOT NULL DEFAULT '0',
  `lastip` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `secret` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `picture` tinyint(1) NOT NULL DEFAULT '0',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `mailformat` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `maildigest` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `maildisplay` tinyint(2) unsigned NOT NULL DEFAULT '2',
  `htmleditor` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ajax` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `autosubscribe` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `trackforums` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `trustbitmask` bigint(10) unsigned NOT NULL DEFAULT '0',
  `imagealt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `screenreader` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_user_mneuse_uix` (`mnethostid`,`username`),
  KEY `mdl_user_del_ix` (`deleted`),
  KEY `mdl_user_con_ix` (`confirmed`),
  KEY `mdl_user_fir_ix` (`firstname`),
  KEY `mdl_user_las_ix` (`lastname`),
  KEY `mdl_user_cit_ix` (`city`),
  KEY `mdl_user_cou_ix` (`country`),
  KEY `mdl_user_las2_ix` (`lastaccess`),
  KEY `mdl_user_ema_ix` (`email`),
  KEY `mdl_user_aut_ix` (`auth`),
  KEY `mdl_user_idn_ix` (`idnumber`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='One record for each person' AUTO_INCREMENT=15 ;

--
-- Volcado de datos para la tabla `mdl_user`
--

INSERT INTO `mdl_user` (`id`, `auth`, `confirmed`, `policyagreed`, `deleted`, `suspended`, `mnethostid`, `username`, `password`, `idnumber`, `firstname`, `lastname`, `email`, `emailstop`, `icq`, `skype`, `yahoo`, `aim`, `msn`, `phone1`, `phone2`, `institution`, `department`, `address`, `city`, `country`, `lang`, `theme`, `timezone`, `firstaccess`, `lastaccess`, `lastlogin`, `currentlogin`, `lastip`, `secret`, `picture`, `url`, `description`, `descriptionformat`, `mailformat`, `maildigest`, `maildisplay`, `htmleditor`, `ajax`, `autosubscribe`, `trackforums`, `timecreated`, `timemodified`, `trustbitmask`, `imagealt`, `screenreader`) VALUES
(1, 'manual', 1, 0, 0, 0, 1, 'guest', '78b15a258e709d0ac9d6bd1e024fcdc3', '', 'Invitado', ' ', 'root@localhost', 0, '', '', '', '', '', '', '', '', '', '', '', '', 'es_ar', '', '99', 1316566413, 1317390363, 1317389450, 1317390362, '127.0.0.1', '', 0, '', 'Este usuario sólo tiene acceso de lectura en ciertos cursos.', 0, 1, 0, 2, 1, 1, 1, 0, 0, 1316566413, 0, NULL, 0),
(2, 'manual', 1, 0, 0, 0, 1, 'admin', 'e6d0a298e0e04545c90f4fe287205bd1', '', 'admin', 'Usuario', 'tallerdeprogramacioniifiuba2011@googlegroups.com', 0, '', '', '', '', '', '', '', '', '', '', 'Buenos Aires', 'AR', 'es_ar', '', '99', 1316567503, 1318008844, 1318006074, 1318008769, '127.0.0.1', '', 0, '', '', 0, 1, 0, 1, 1, 1, 1, 0, 0, 1316567503, 0, NULL, 1),
(3, 'email', 1, 0, 1, 0, 1, 'damiancalabresi@gmail.com.1316715379', '4534e390f895b4fa9c7f99b2b6ef44b5', '', 'Damian', 'Calabresi', '8dc07c4331811471f76c7afd1ef2d9a8', 0, '', '', '', '', '', '', '', '', '', '', 'Buenos Aires', 'AR', 'es', '', '99', 1316650555, 0, 0, 0, '', 'kyQ4Tj9nnkgXyOO', 0, '', NULL, 0, 1, 0, 2, 1, 1, 1, 0, 1316644852, 1316715379, 0, NULL, 0),
(4, 'email', 0, 0, 1, 0, 1, 'damiancalabresi2@gmail.com.1316715386', '4534e390f895b4fa9c7f99b2b6ef44b5', '', 'Damian', 'Calabresi', '1eb69a1a1b94c672d7514a810b76823a', 0, '', '', '', '', '', '', '', '', '', '', 'Buenos Aires', 'AR', 'es_ar', '', '99', 1316713930, 0, 0, 0, '', 'rQM8FnJPP6TbON5', 0, '', NULL, 0, 1, 0, 2, 1, 1, 1, 0, 1316713930, 1316715386, 0, NULL, 0),
(5, 'email', 0, 0, 1, 0, 1, 'damiancalabresi3@gmail.com.1316715393', '4534e390f895b4fa9c7f99b2b6ef44b5', '', 'Damian', 'Calabresi', '4e4561b6b5529ff7b8a1ee20aaf91609', 0, '', '', '', '', '', '', '', '', '', '', 'Buenos Aires', 'AR', 'es_ar', '', '99', 1316714434, 0, 0, 0, '', '06qcs0poh4XB5rk', 0, '', NULL, 0, 1, 0, 2, 1, 1, 1, 0, 1316714434, 1316715393, 0, NULL, 0),
(6, 'email', 0, 0, 1, 0, 1, 'damiancalabresi4@gmail.com.1316715400', '4534e390f895b4fa9c7f99b2b6ef44b5', '', 'Damian', 'Calabresi', '063fdc3a99263df10f43cc156664699b', 0, '', '', '', '', '', '', '', '', '', '', 'Buenos Aires', 'AR', 'es_ar', '', '99', 1316714534, 0, 0, 0, '', 'QgOopNbJHuiBGb6', 0, '', NULL, 0, 1, 0, 2, 1, 1, 1, 0, 1316714534, 1316715400, 0, NULL, 0),
(7, 'email', 0, 0, 1, 0, 1, 'damiancalabresi6@gmail.com.1316715408', '4534e390f895b4fa9c7f99b2b6ef44b5', '', 'Damian', 'Calabresi', 'e18b1aac6719285d7f1f46c825947d3a', 0, '', '', '', '', '', '', '', '', '', '', 'Buenos Aires', 'AR', 'es_ar', '', '99', 1316714844, 0, 0, 0, '', 'PlkyoZcAoJjsGSM', 0, '', NULL, 0, 1, 0, 2, 1, 1, 1, 0, 1316714844, 1316715408, 0, NULL, 0),
(8, 'email', 0, 0, 1, 0, 1, 'damiancalabresi7@gmail.com.1316715373', '4534e390f895b4fa9c7f99b2b6ef44b5', '', 'Damian', 'Calabresi', '3a28fae53c9aeff9fcb8fc1da5556a05', 0, '', '', '', '', '', '', '', '', '', '', 'Bue', 'AR', 'es_ar', '', '99', 1316714949, 0, 0, 0, '', 'gPHS3wQ3rJSQfRg', 0, '', NULL, 0, 1, 0, 2, 1, 1, 1, 0, 1316714949, 1316715373, 0, NULL, 0),
(9, 'email', 1, 0, 1, 0, 1, 'damiancalabresi8@gmail.com.1317244268', '4534e390f895b4fa9c7f99b2b6ef44b5', '', 'Damian', 'Calabresi', 'a9ab9eeefb9bca93de9ca1a00e5ee190', 0, '', '', '', '', '', '', '', '', '', '', 'Buenos Aires', 'AR', 'es_ar', '', '99', 1316715595, 1316715616, 0, 1316715616, '127.0.0.1', 'wqsh6JdivNkvD7A', 0, '', NULL, 0, 1, 0, 2, 1, 1, 1, 0, 1316715339, 1317244268, 0, NULL, 0),
(10, 'email', 1, 0, 1, 0, 1, 'damiancalabresi10@gmail.com.1317244276', 'e6d0a298e0e04545c90f4fe287205bd1', '', 'Damian', 'Aprendiz', 'fcf26a5b2d50663445ff481a1c2ae0fa', 0, '', '', '', '', '', '', '', '', '', '', 'Buenos Aires', 'AR', 'es_ar', '', '99', 1316813116, 0, 0, 0, '', '5LFPbQXnijqNGzZ', 0, '', NULL, 0, 1, 0, 2, 1, 1, 1, 0, 1316813040, 1317244276, 0, NULL, 0),
(11, 'email', 1, 0, 0, 0, 1, 'miembropopper1', 'e6d0a298e0e04545c90f4fe287205bd1', '', 'miembro1', 'popper', 'miembropopper1@gmail.com', 0, '', '', '', '', '', '', '', '', '', '', 'Buenos Aires', 'AR', 'es_ar', '', '99', 1317245578, 1317845988, 1317845844, 1317845984, '0:0:0:0:0:0:0:1', 'mSyBn4xM9cT3SkB', 0, '', NULL, 0, 1, 0, 2, 1, 1, 1, 0, 1317245146, 0, 0, NULL, 0),
(12, 'email', 1, 0, 0, 0, 1, 'adminpopper1', 'e6d0a298e0e04545c90f4fe287205bd1', '', 'admin1', 'popper', 'adminpopper1@gmail.com', 0, '', '', '', '', '', '', '', '', '', '', 'Buenos Aires', 'AR', 'es_ar', '', '99', 1317245575, 1318010575, 1318009397, 1318009810, '127.0.0.1', 'hOoqFpyh0Ht12LS', 0, '', NULL, 0, 1, 0, 2, 1, 1, 1, 0, 1317245545, 0, 0, NULL, 0),
(13, 'email', 1, 0, 0, 0, 1, 'aprendizpopper1', 'e6d0a298e0e04545c90f4fe287205bd1', '', 'Aprendiz1', 'Popper', 'aprendizpopper1@gmail.com', 0, '', '', '', '', '', '', '', '', '', '', 'Buenos Aires', 'AR', 'es_ar', '', '99', 1317326186, 1318012330, 1318011680, 1318012330, '127.0.0.1', 'YHCeWP8scedX9dJ', 0, '', NULL, 0, 1, 0, 2, 1, 1, 1, 0, 1317326067, 0, 0, NULL, 0),
(14, 'email', 1, 0, 0, 0, 1, 'mediadorpopper1', 'e6d0a298e0e04545c90f4fe287205bd1', '', 'mediador1', 'popper', 'mediadorpopper1@gmail.com', 0, '', '', '', '', '', '', '', '', '', '', 'Buenos Aires', 'AR', 'es_ar', '', '99', 1317326189, 1318012352, 1318011660, 1318012352, '127.0.0.1', 'Lnh6L6eeMC02M8u', 0, '', '', 0, 1, 0, 2, 1, 1, 1, 0, 1317326147, 1317329502, 0, '', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_user_enrolments`
--

CREATE TABLE IF NOT EXISTS `mdl_user_enrolments` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` bigint(10) unsigned NOT NULL DEFAULT '0',
  `enrolid` bigint(10) unsigned NOT NULL,
  `userid` bigint(10) unsigned NOT NULL,
  `timestart` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeend` bigint(10) unsigned NOT NULL DEFAULT '2147483647',
  `modifierid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_userenro_enruse_uix` (`enrolid`,`userid`),
  KEY `mdl_userenro_enr_ix` (`enrolid`),
  KEY `mdl_userenro_use_ix` (`userid`),
  KEY `mdl_userenro_mod_ix` (`modifierid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Users participating in courses (aka enrolled users) - everyb' AUTO_INCREMENT=14 ;

--
-- Volcado de datos para la tabla `mdl_user_enrolments`
--

INSERT INTO `mdl_user_enrolments` (`id`, `status`, `enrolid`, `userid`, `timestart`, `timeend`, `modifierid`, `timecreated`, `timemodified`) VALUES
(2, 0, 4, 13, 1317333600, 0, 12, 1317391056, 1317391056),
(10, 0, 7, 14, 1317938400, 0, 12, 1318009918, 1318009918),
(11, 0, 1, 14, 1317938400, 0, 12, 1318009984, 1318009984),
(13, 0, 1, 13, 1317938400, 0, 14, 1318012391, 1318012391);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_user_info_category`
--

CREATE TABLE IF NOT EXISTS `mdl_user_info_category` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sortorder` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Customisable fields categories' AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `mdl_user_info_category`
--

INSERT INTO `mdl_user_info_category` (`id`, `name`, `sortorder`) VALUES
(1, 'Otros campos', 1),
(2, 'Datos Alumno-Profesor', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_user_info_data`
--

CREATE TABLE IF NOT EXISTS `mdl_user_info_data` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `fieldid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `dataformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_userinfodata_usefie_ix` (`userid`,`fieldid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Data for the customisable user fields' AUTO_INCREMENT=37 ;

--
-- Volcado de datos para la tabla `mdl_user_info_data`
--

INSERT INTO `mdl_user_info_data` (`id`, `userid`, `fieldid`, `data`, `dataformat`) VALUES
(25, 11, 3, '12345678', 0),
(26, 11, 4, '12345678', 0),
(27, 11, 5, 'Miembro', 0),
(28, 12, 3, '12345678', 0),
(29, 12, 4, '12345678', 0),
(30, 12, 5, 'Administrador', 0),
(31, 13, 3, '12345678', 0),
(32, 13, 4, '12345678', 0),
(33, 13, 5, 'Aprendiz', 0),
(34, 14, 3, '12345678', 0),
(35, 14, 4, '12345678', 0),
(36, 14, 5, 'Mediador', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_user_info_field`
--

CREATE TABLE IF NOT EXISTS `mdl_user_info_field` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `shortname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'shortname',
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `datatype` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `categoryid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `sortorder` bigint(10) unsigned NOT NULL DEFAULT '0',
  `required` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `locked` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `visible` smallint(4) unsigned NOT NULL DEFAULT '0',
  `forceunique` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `signup` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `defaultdata` longtext COLLATE utf8_unicode_ci,
  `defaultdataformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `param1` longtext COLLATE utf8_unicode_ci,
  `param2` longtext COLLATE utf8_unicode_ci,
  `param3` longtext COLLATE utf8_unicode_ci,
  `param4` longtext COLLATE utf8_unicode_ci,
  `param5` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Customisable user profile fields' AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `mdl_user_info_field`
--

INSERT INTO `mdl_user_info_field` (`id`, `shortname`, `name`, `datatype`, `description`, `descriptionformat`, `categoryid`, `sortorder`, `required`, `locked`, `visible`, `forceunique`, `signup`, `defaultdata`, `defaultdataformat`, `param1`, `param2`, `param3`, `param4`, `param5`) VALUES
(3, 'dni', 'DNI', 'text', '', 1, 2, 1, 1, 0, 1, 0, 1, '', 0, '30', '8', '0', '', ''),
(4, 'padron', 'Padron-Legajo', 'text', '', 1, 2, 2, 1, 0, 1, 0, 1, '', 0, '30', '10', '0', '', ''),
(5, 'rolsolicitado', 'Rol solicitado', 'menu', '<p>Este campo lo utilizará el administrador del sitio para asignar los roles al aceptar un usuario</p>', 1, 2, 3, 1, 0, 2, 0, 1, 'Miembro', 0, 'Miembro\nAprendiz\nMediador\nAdministrador\nAprendiz y Mediador\nAdministrador y Mediador', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_user_lastaccess`
--

CREATE TABLE IF NOT EXISTS `mdl_user_lastaccess` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `courseid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeaccess` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_userlast_usecou_uix` (`userid`,`courseid`),
  KEY `mdl_userlast_use_ix` (`userid`),
  KEY `mdl_userlast_cou_ix` (`courseid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To keep track of course page access times, used in online pa' AUTO_INCREMENT=17 ;

--
-- Volcado de datos para la tabla `mdl_user_lastaccess`
--

INSERT INTO `mdl_user_lastaccess` (`id`, `userid`, `courseid`, `timeaccess`) VALUES
(1, 2, 2, 1318008849),
(2, 12, 2, 1318009974),
(4, 12, 3, 1318007547),
(5, 2, 3, 1317957277),
(6, 13, 3, 1318011634),
(7, 12, 4, 1318009910),
(9, 11, 2, 1317845926),
(12, 2, 4, 1317957149),
(15, 14, 4, 1318010599),
(16, 14, 2, 1318012356);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_user_preferences`
--

CREATE TABLE IF NOT EXISTS `mdl_user_preferences` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_userpref_usenam_uix` (`userid`,`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Allows modules to store arbitrary user preferences' AUTO_INCREMENT=18 ;

--
-- Volcado de datos para la tabla `mdl_user_preferences`
--

INSERT INTO `mdl_user_preferences` (`id`, `userid`, `name`, `value`) VALUES
(2, 2, 'email_bounce_count', '1'),
(3, 2, 'email_send_count', '1'),
(4, 2, 'definerole_showadvanced', ''),
(5, 2, 'userselector_preserveselected', '0'),
(6, 2, 'userselector_autoselectunique', '0'),
(7, 2, 'userselector_searchanywhere', '0'),
(8, 12, 'userselector_preserveselected', '0'),
(9, 12, 'userselector_autoselectunique', '0'),
(10, 12, 'userselector_searchanywhere', '0'),
(11, 2, 'docked_block_instance_10', '0'),
(12, 2, 'docked_block_instance_5', '0'),
(13, 14, 'auth_forcepasswordchange', '0'),
(14, 14, 'userselector_preserveselected', '0'),
(15, 14, 'userselector_autoselectunique', '0'),
(16, 14, 'userselector_searchanywhere', '0'),
(17, 12, 'block6hidden', '0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_user_private_key`
--

CREATE TABLE IF NOT EXISTS `mdl_user_private_key` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `script` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `userid` bigint(10) unsigned NOT NULL,
  `instance` bigint(10) unsigned DEFAULT NULL,
  `iprestriction` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `validuntil` bigint(10) unsigned DEFAULT NULL,
  `timecreated` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_userprivkey_scrval_ix` (`script`,`value`),
  KEY `mdl_userprivkey_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='access keys used in cookieless scripts - rss, etc.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_webdav_locks`
--

CREATE TABLE IF NOT EXISTS `mdl_webdav_locks` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expiry` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `recursive` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `exclusivelock` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `created` bigint(10) unsigned NOT NULL DEFAULT '0',
  `modified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `owner` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_webdlock_tok_uix` (`token`),
  KEY `mdl_webdlock_pat_ix` (`path`),
  KEY `mdl_webdlock_exp_ix` (`expiry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Resource locks for WebDAV users' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_wiki`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Wiki',
  `intro` mediumtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `firstpagetitle` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'First Page',
  `wikimode` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'collaborative',
  `defaultformat` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'creole',
  `forceformat` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `editbegin` bigint(10) unsigned NOT NULL DEFAULT '0',
  `editend` bigint(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_wiki_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores Wiki activity configuration' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_wiki_links`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki_links` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `subwikiid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `frompageid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `topageid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `tomissingpage` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_wikilink_fro_ix` (`frompageid`),
  KEY `mdl_wikilink_sub_ix` (`subwikiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Page wiki links' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_wiki_locks`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki_locks` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `pageid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `sectionname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `lockedat` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Manages page locks' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_wiki_pages`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki_pages` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `subwikiid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'title',
  `cachedcontent` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timerendered` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `pageviews` bigint(10) unsigned NOT NULL DEFAULT '0',
  `readonly` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_wikipage_subtituse_uix` (`subwikiid`,`title`,`userid`),
  KEY `mdl_wikipage_sub_ix` (`subwikiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores wiki pages' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_wiki_subwikis`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki_subwikis` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `wikiid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `groupid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_wikisubw_wikgrouse_uix` (`wikiid`,`groupid`,`userid`),
  KEY `mdl_wikisubw_wik_ix` (`wikiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores subwiki instances' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_wiki_synonyms`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki_synonyms` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `subwikiid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `pageid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `pagesynonym` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Pagesynonym',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_wikisyno_pagpag_uix` (`pageid`,`pagesynonym`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores wiki pages synonyms' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_wiki_versions`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki_versions` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `pageid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `content` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `contentformat` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'creole',
  `version` mediumint(5) unsigned NOT NULL DEFAULT '0',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_wikivers_pag_ix` (`pageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores wiki page history' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_workshop`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(3) unsigned NOT NULL DEFAULT '0',
  `instructauthors` longtext COLLATE utf8_unicode_ci,
  `instructauthorsformat` smallint(3) unsigned NOT NULL DEFAULT '0',
  `instructreviewers` longtext COLLATE utf8_unicode_ci,
  `instructreviewersformat` smallint(3) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL,
  `phase` smallint(3) unsigned DEFAULT '0',
  `useexamples` tinyint(2) unsigned DEFAULT '0',
  `usepeerassessment` tinyint(2) unsigned DEFAULT '0',
  `useselfassessment` tinyint(2) unsigned DEFAULT '0',
  `grade` decimal(10,5) unsigned DEFAULT '80.00000',
  `gradinggrade` decimal(10,5) unsigned DEFAULT '20.00000',
  `strategy` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `evaluation` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `gradedecimals` smallint(3) unsigned DEFAULT '0',
  `nattachments` smallint(3) unsigned DEFAULT '0',
  `latesubmissions` tinyint(2) unsigned DEFAULT '0',
  `maxbytes` bigint(10) unsigned DEFAULT '100000',
  `examplesmode` smallint(3) unsigned DEFAULT '0',
  `submissionstart` bigint(10) unsigned DEFAULT '0',
  `submissionend` bigint(10) unsigned DEFAULT '0',
  `assessmentstart` bigint(10) unsigned DEFAULT '0',
  `assessmentend` bigint(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_work_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table keeps information about the module instances and ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_workshopeval_best_settings`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopeval_best_settings` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) unsigned NOT NULL,
  `comparison` smallint(3) unsigned DEFAULT '5',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_workbestsett_wor_uix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Settings for the grading evaluation subplugin Comparison wit' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_workshopform_accumulative`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_accumulative` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) unsigned NOT NULL,
  `sort` bigint(10) unsigned DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` smallint(3) unsigned DEFAULT '0',
  `grade` bigint(10) NOT NULL,
  `weight` mediumint(5) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_workaccu_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The assessment dimensions definitions of Accumulative gradin' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_workshopform_comments`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_comments` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) unsigned NOT NULL,
  `sort` bigint(10) unsigned DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` smallint(3) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_workcomm_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The assessment dimensions definitions of Comments strategy f' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_workshopform_numerrors`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_numerrors` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) unsigned NOT NULL,
  `sort` bigint(10) unsigned DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` smallint(3) unsigned DEFAULT '0',
  `descriptiontrust` bigint(10) unsigned DEFAULT NULL,
  `grade0` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `grade1` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `weight` mediumint(5) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_worknume_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The assessment dimensions definitions of Number of errors gr' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_workshopform_numerrors_map`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_numerrors_map` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) unsigned NOT NULL,
  `nonegative` bigint(10) unsigned NOT NULL,
  `grade` decimal(10,5) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_worknumemap_wornon_uix` (`workshopid`,`nonegative`),
  KEY `mdl_worknumemap_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This maps the number of errors to a percentual grade for sub' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_workshopform_rubric`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_rubric` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) unsigned NOT NULL,
  `sort` bigint(10) unsigned DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` smallint(3) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_workrubr_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The assessment dimensions definitions of Rubric grading stra' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_workshopform_rubric_config`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_rubric_config` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) unsigned NOT NULL,
  `layout` varchar(30) COLLATE utf8_unicode_ci DEFAULT 'list',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_workrubrconf_wor_uix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Configuration table for the Rubric grading strategy' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_workshopform_rubric_levels`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_rubric_levels` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `dimensionid` bigint(10) unsigned NOT NULL,
  `grade` decimal(10,5) unsigned NOT NULL,
  `definition` longtext COLLATE utf8_unicode_ci,
  `definitionformat` smallint(3) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_workrubrleve_dim_ix` (`dimensionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The definition of rubric rating scales' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_workshop_aggregations`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_aggregations` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) unsigned NOT NULL,
  `userid` bigint(10) unsigned NOT NULL,
  `gradinggrade` decimal(10,5) unsigned DEFAULT NULL,
  `timegraded` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_workaggr_woruse_uix` (`workshopid`,`userid`),
  KEY `mdl_workaggr_wor_ix` (`workshopid`),
  KEY `mdl_workaggr_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Aggregated grades for assessment are stored here. The aggreg' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_workshop_assessments`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_assessments` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `submissionid` bigint(10) unsigned NOT NULL,
  `reviewerid` bigint(10) unsigned NOT NULL,
  `weight` bigint(10) unsigned NOT NULL DEFAULT '1',
  `timecreated` bigint(10) unsigned DEFAULT '0',
  `timemodified` bigint(10) unsigned DEFAULT '0',
  `grade` decimal(10,5) unsigned DEFAULT NULL,
  `gradinggrade` decimal(10,5) unsigned DEFAULT NULL,
  `gradinggradeover` decimal(10,5) unsigned DEFAULT NULL,
  `gradinggradeoverby` bigint(10) unsigned DEFAULT NULL,
  `feedbackauthor` longtext COLLATE utf8_unicode_ci,
  `feedbackauthorformat` smallint(3) unsigned DEFAULT '0',
  `feedbackreviewer` longtext COLLATE utf8_unicode_ci,
  `feedbackreviewerformat` smallint(3) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_workasse_sub_ix` (`submissionid`),
  KEY `mdl_workasse_gra_ix` (`gradinggradeoverby`),
  KEY `mdl_workasse_rev_ix` (`reviewerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Info about the made assessment and automatically calculated ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_workshop_assessments_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_assessments_old` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `submissionid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timegraded` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeagreed` bigint(10) unsigned NOT NULL DEFAULT '0',
  `grade` double NOT NULL DEFAULT '0',
  `gradinggrade` smallint(3) NOT NULL DEFAULT '0',
  `teachergraded` smallint(3) unsigned NOT NULL DEFAULT '0',
  `mailed` smallint(3) unsigned NOT NULL DEFAULT '0',
  `resubmission` smallint(3) unsigned NOT NULL DEFAULT '0',
  `donotuse` smallint(3) unsigned NOT NULL DEFAULT '0',
  `generalcomment` text COLLATE utf8_unicode_ci,
  `teachercomment` text COLLATE utf8_unicode_ci,
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workasseold_use_ix` (`userid`),
  KEY `mdl_workasseold_mai_ix` (`mailed`),
  KEY `mdl_workasseold_wor_ix` (`workshopid`),
  KEY `mdl_workasseold_sub_ix` (`submissionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_assessments table to be dropped later in Moo' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_workshop_comments_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_comments_old` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `assessmentid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `mailed` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `comments` text COLLATE utf8_unicode_ci NOT NULL,
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workcommold_use_ix` (`userid`),
  KEY `mdl_workcommold_mai_ix` (`mailed`),
  KEY `mdl_workcommold_wor_ix` (`workshopid`),
  KEY `mdl_workcommold_ass_ix` (`assessmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_comments table to be dropped later in Moodle' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_workshop_elements_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_elements_old` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `elementno` smallint(3) unsigned NOT NULL DEFAULT '0',
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `scale` smallint(3) unsigned NOT NULL DEFAULT '0',
  `maxscore` smallint(3) unsigned NOT NULL DEFAULT '1',
  `weight` smallint(3) unsigned NOT NULL DEFAULT '11',
  `stddev` double NOT NULL DEFAULT '0',
  `totalassessments` bigint(10) NOT NULL DEFAULT '0',
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workelemold_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_elements table to be dropped later in Moodle' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_workshop_grades`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_grades` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `assessmentid` bigint(10) unsigned NOT NULL,
  `strategy` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dimensionid` bigint(10) unsigned NOT NULL,
  `grade` decimal(10,5) unsigned NOT NULL,
  `peercomment` longtext COLLATE utf8_unicode_ci,
  `peercommentformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_workgrad_assstrdim_uix` (`assessmentid`,`strategy`,`dimensionid`),
  KEY `mdl_workgrad_ass_ix` (`assessmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='How the reviewers filled-up the grading forms, given grades ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_workshop_grades_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_grades_old` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `assessmentid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `elementno` bigint(10) unsigned NOT NULL DEFAULT '0',
  `feedback` text COLLATE utf8_unicode_ci NOT NULL,
  `grade` smallint(3) NOT NULL DEFAULT '0',
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workgradold_wor_ix` (`workshopid`),
  KEY `mdl_workgradold_ass_ix` (`assessmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_grades table to be dropped later in Moodle 2' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_workshop_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_old` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `wtype` smallint(3) unsigned NOT NULL DEFAULT '0',
  `nelements` smallint(3) unsigned NOT NULL DEFAULT '1',
  `nattachments` smallint(3) unsigned NOT NULL DEFAULT '0',
  `phase` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `format` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `gradingstrategy` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `resubmit` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `agreeassessments` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `hidegrades` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `anonymous` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `includeself` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `maxbytes` bigint(10) unsigned NOT NULL DEFAULT '100000',
  `submissionstart` bigint(10) unsigned NOT NULL DEFAULT '0',
  `assessmentstart` bigint(10) unsigned NOT NULL DEFAULT '0',
  `submissionend` bigint(10) unsigned NOT NULL DEFAULT '0',
  `assessmentend` bigint(10) unsigned NOT NULL DEFAULT '0',
  `releasegrades` bigint(10) unsigned NOT NULL DEFAULT '0',
  `grade` smallint(3) NOT NULL DEFAULT '0',
  `gradinggrade` smallint(3) NOT NULL DEFAULT '0',
  `ntassessments` smallint(3) unsigned NOT NULL DEFAULT '0',
  `assessmentcomps` smallint(3) unsigned NOT NULL DEFAULT '2',
  `nsassessments` smallint(3) unsigned NOT NULL DEFAULT '0',
  `overallocation` smallint(3) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `teacherweight` smallint(3) unsigned NOT NULL DEFAULT '1',
  `showleaguetable` smallint(3) unsigned NOT NULL DEFAULT '0',
  `usepassword` smallint(3) unsigned NOT NULL DEFAULT '0',
  `password` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workold_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop table to be dropped later in Moodle 2.x' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_workshop_rubrics_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_rubrics_old` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `elementno` bigint(10) unsigned NOT NULL DEFAULT '0',
  `rubricno` smallint(3) unsigned NOT NULL DEFAULT '0',
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workrubrold_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_rubrics table to be dropped later in Moodle ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_workshop_stockcomments_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_stockcomments_old` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `elementno` bigint(10) unsigned NOT NULL DEFAULT '0',
  `comments` text COLLATE utf8_unicode_ci NOT NULL,
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workstocold_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_stockcomments table to be dropped later in M' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_workshop_submissions`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_submissions` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) unsigned NOT NULL,
  `example` tinyint(2) unsigned DEFAULT '0',
  `authorid` bigint(10) unsigned NOT NULL,
  `timecreated` bigint(10) unsigned NOT NULL,
  `timemodified` bigint(10) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `content` longtext COLLATE utf8_unicode_ci,
  `contentformat` smallint(3) unsigned NOT NULL DEFAULT '0',
  `contenttrust` smallint(3) unsigned NOT NULL DEFAULT '0',
  `attachment` tinyint(2) unsigned DEFAULT '0',
  `grade` decimal(10,5) unsigned DEFAULT NULL,
  `gradeover` decimal(10,5) unsigned DEFAULT NULL,
  `gradeoverby` bigint(10) unsigned DEFAULT NULL,
  `feedbackauthor` longtext COLLATE utf8_unicode_ci,
  `feedbackauthorformat` smallint(3) unsigned DEFAULT '0',
  `timegraded` bigint(10) unsigned DEFAULT NULL,
  `published` tinyint(2) unsigned DEFAULT '0',
  `late` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_worksubm_wor_ix` (`workshopid`),
  KEY `mdl_worksubm_gra_ix` (`gradeoverby`),
  KEY `mdl_worksubm_aut_ix` (`authorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Info about the submission and the aggregation of the grade f' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_workshop_submissions_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_submissions_old` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `mailed` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `gradinggrade` smallint(3) unsigned NOT NULL DEFAULT '0',
  `finalgrade` smallint(3) unsigned NOT NULL DEFAULT '0',
  `late` smallint(3) unsigned NOT NULL DEFAULT '0',
  `nassessments` bigint(10) unsigned NOT NULL DEFAULT '0',
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_worksubmold_use_ix` (`userid`),
  KEY `mdl_worksubmold_mai_ix` (`mailed`),
  KEY `mdl_worksubmold_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_submissions table to be dropped later in Moo' AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
