<?php

/**
 * Tiny database migration script by Crosire
 */

chdir(dirname(__FILE__));

$args = getopt("", array("host:", "port:", "username:", "password:", "database:", "schema:"));
$path = "schema";

$dbhost = (isset($args['host']) ? $args['host'] : "127.0.0.1");
$dbport = (isset($args['port']) ? $args['port'] : "3306");
$dbuser = (isset($args['username']) ? $args['username'] : "dayz");
$dbpass = (isset($args['password']) ? $args['password'] : "");
$dbname = (isset($args['database']) ? $args['database'] : "dayz_chernarus");
$schema = (isset($args['schema']) ? $args['schema'] : "Bliss");
$version = "0.00";

// Connect to the MySQL server
echo "Connecting to MySQL server on ".$dbhost.":".$dbport." as ".$dbuser." to database ".$dbname."\n";
$link = mysql_connect($dbhost.':'.$dbport, $dbuser, $dbpass);
if (!$link) {
	echo "> Could not connect: ".(mysql_error())."\n";
	exit(1);
}
mysql_select_db($dbname, $link);
echo "> Sucessfully connected!\n\n";

// Get the last version
$res = mysql_query("SELECT `version` FROM `migration_schema_version` WHERE `name` = '".$schema."'", $link);
if (!$res) {
	echo "No existing ".$schema." schema was found!\n";
} else {
	$v = rtrim(mysql_fetch_assoc($res)['version'], "0");
	if ($v == "") {
		echo "No existing ".$schema." schema was found!\n";
	} else {
		$version = $v;
		echo "Current ".$schema." version is: $version\n";
	}
}

function get_folders() {
	global $path, $schema;
	$folders = array();
	foreach(scandir($path."\\".$schema) as $dir) {
		if (is_dir($path."\\".$schema."\\".$dir)) {
			if (preg_match("/([.0-9]{4})-?([.0-9]{4})?/", $dir, $matches)) {
				if (isset($matches[2])) { $folders[] = array($matches[2], $dir); } else { $folders[] = array($matches[1], $dir); };
			}
		}
	}
	return $folders;
}
function get_files($dir) {
	global $path, $schema;
	$files = array();
	$handle = opendir($path."\\".$schema."\\".$dir);
	while (false !== ($file = readdir($handle))) {
		if (preg_match("/([0-9]+)_([_a-zA-Z0-9]*).sql/", $file)) {
			$files[] = array($file, $path."\\".$schema."\\".$dir."\\".$file);
		}
	}
	closedir($handle);
	return $files;
}
function splitSQL($file, $delimiter = ';') {
	global $link;
	set_time_limit(0);
	if (is_file($file) === true) {
		$file = fopen($file, 'r');
		if (is_resource($file) === true) {
			$query = array();
			while (feof($file) === false) {
				$query[] = fgets($file);
				if (preg_match('~' . preg_quote($delimiter, '~') . '\s*$~iS', end($query)) === 1) {
					$query = trim(implode('', $query));
					if (mysql_query($query, $link) === false) {
						echo "> Error: ".(mysql_error())."\n";
					}
					while (ob_get_level() > 0) {
						ob_end_flush();
					}
					flush();
				}
				if (is_string($query) === true) {
					$query = array();
				}
			}
			return fclose($file);
		}
	}
	return false;
}

// Run migration proces
echo "\nRunning database migration ...\n";
$res = mysql_query("CREATE DATABASE IF NOT EXISTS `".$dbname."`", $link);
if (!$res) {
	echo "> Database Creation failed: ".(mysql_error())."\n";
	exit(2);
}
mysql_select_db($dbname, $link);
mysql_query("GRANT ALL PRIVILEGES ON ".$dbname.".* TO 'dayz'@'localhost' IDENTIFIED BY 'dayz'", $link);
mysql_query("GRANT ALL PRIVILEGES ON mysql.* TO 'dayz'@'localhost'", $link);

// Execute sql files in schema folder
foreach (get_folders() as $folder) {
	if ($folder[0] > $version) {
		foreach (get_files($folder[1]) as $file) {
			echo "> ".$folder[1]."\\".$file[0]."\n";
			splitSQL($file[1]);
		}
		$oldversion = $version;
		$version = $folder[0];
		mysql_query("INSERT INTO `migration_schema_log` (`schema_name`, `event_time`, `old_version`, `new_version`) VALUES ('".$schema."', NOW(), '".$oldversion."', '".$version."')", $link);
	}
}

// Output the new version number and exit
mysql_query("INSERT INTO `migration_schema_version` (`name`, `version`) VALUES ('".$schema."', '".$version."') ON DUPLICATE KEY UPDATE `version` = '".$version."'", $link);
mysql_close($link);

echo "> Completed ".$schema." update to version ".$version."\n";
exit;

?>