#!/bin/sh

cat > /var/www/moodle/envs.php <<EOF
<?php
define("DBNAME","$DATABASE_NAME");
define("DBHOST","$DATABASE_HOST");
define("DBPORT","$DATABASE_PORT");
define("DBUSER","$DATABASE_USERNAME");
define("DBPASS","$DATABASE_PASSWORD");
?>
EOF

CONFIG_FILE=/var/www/moodle/config.php

if [ -s $CONFIG_FILE ];then
    sed -i '/^require_once("envs.php");.*/d' $CONFIG_FILE
    sed -i '0,/^<?php.*/s/^<?php.*/&\nrequire_once("envs.php");/' $CONFIG_FILE

    sed -i '/^$CFG->tool_generator_users_password.*/d' $CONFIG_FILE
    sed -i '0,/^$CFG->admin.*/s/^$CFG->admin.*/&\n$CFG->tool_generator_users_password = "moodle";/' $CONFIG_FILE

    sed -i '/^$CFG->passwordpolicy.*/d' $CONFIG_FILE
    sed -i '0,/^$CFG->admin.*/s/^$CFG->admin.*/&\n$CFG->passwordpolicy = 0;/' $CONFIG_FILE
	
else
	cat > $CONFIG_FILE <<EOF
<?php  // Moodle configuration file
require_once("envs.php");

unset(\$CFG);
global \$CFG;
\$CFG = new stdClass();

\$CFG->dbtype    = 'mariadb';
\$CFG->dblibrary = 'native';
\$CFG->dbhost    = DBHOST;
\$CFG->dbname    = DBNAME;
\$CFG->dbuser    = DBUSER;
\$CFG->dbpass    = DBPASS;
\$CFG->prefix    = 'mdl_';
\$CFG->dboptions = array (
  'dbpersist' => 0,
  'dbport' => DBPORT,
  'dbsocket' => '',
  'dbcollation' => 'utf8mb4_general_ci',
);

\$CFG->wwwroot   = 'http://localhost';
\$CFG->dataroot  = '/var/www/moodledata';
\$CFG->admin     = 'admin';
\$CFG->tool_generator_users_password = 'moodle';
\$CFG->passwordpolicy = 0;

\$CFG->directorypermissions = 0777;

require_once(__DIR__ . '/lib/setup.php');

// There is no php closing tag in this file,
// it is intentional because it prevents trailing whitespace problems!
EOF
fi

exec "$@"