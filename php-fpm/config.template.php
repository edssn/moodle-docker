<?php  // Moodle configuration file
require_once("envs.php");

unset($CFG);
global $CFG;
$CFG = new stdClass();

$CFG->dbtype    = 'mariadb';
$CFG->dblibrary = 'native';
$CFG->dbhost    = DBHOST;
$CFG->dbname    = DBNAME;
$CFG->dbuser    = DBUSER;
$CFG->dbpass    = DBPASS;
$CFG->prefix    = 'mdl_';
$CFG->dboptions = array (
  'dbpersist' => 0,
  'dbport' => DBPORT,
  'dbsocket' => '',
  'dbcollation' => 'utf8mb4_general_ci',
);

$CFG->wwwroot   = 'http://localhost';
$CFG->dataroot  = '/var/www/moodledata';
$CFG->admin     = 'admin';
$CFG->tool_generator_users_password = 'moodle';
$CFG->passwordpolicy = 0;

$CFG->directorypermissions = 0777;

require_once(__DIR__ . '/lib/setup.php');

// There is no php closing tag in this file,
// it is intentional because it prevents trailing whitespace problems!