<?php
    $parts = explode("?", $argv[1], 2);
    if (count($parts) == 2)
        parse_str($parts[1], $_GET); // use $_POST instead if you want to
 
    include($parts[0]);
?>