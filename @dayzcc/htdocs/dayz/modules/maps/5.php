<?php

$res = mysql_query("SELECT deployable.class_name, instance_deployable.* FROM `deployable`, `instance_deployable` WHERE deployable.id = instance_deployable.deployable_id AND instance_deployable.instance_id = '".$serverinstance."'") or die(mysql_error());
$markers = markers_deployable($res, $serverworld);

?>