<?php

// Tiny file configuration script by Crosire

$rpath = substr(realpath(__FILE__), 0, strrpos(dirname(realpath(__FILE__)), '\\'));
$cpath = preg_split("/:/", $rpath)[1];

$bslashpath = str_replace("&", "\\\\&", preg_replace("/\\\\/i", "\\\\", $cpath));
$dslashpath = str_replace("&", "\\\\\\\\&", preg_replace("/\\\\/i", "\\\\\\\\", $cpath));
$fslashpath = str_replace("&", "\\\\&", preg_replace("/\\\\/i", "/", $cpath));

$files[] = "$rpath\php\\php.ini";
$files[] = "$rpath\mysql\bin\\my.ini";
$files[] = "$rpath\apache\conf\\httpd.conf";
$files[] = "$rpath\apache\conf\\php.conf";

foreach ($files as $file) {
	if (file_exists($file)) {
		$content = file_get_contents($file);
		$content = str_replace("/dayzcc", $fslashpath, $content);
		$content = str_replace("\\\\dayzcc", $dslashpath, $content);
		$content = str_replace("\\dayzcc", $bslashpath, $content);
		file_put_contents($file, $content);
	}
}

exit;

?>