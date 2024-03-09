<?php

$res1 = mysql_query("SELECT profile.name, survivor.* FROM `profile`, `survivor` AS `survivor` WHERE profile.unique_id = survivor.unique_id") or die(mysql_error());
$res2 = mysql_query("SELECT world_vehicle.vehicle_id, vehicle.class_name, instance_vehicle.* FROM `world_vehicle`, `vehicle`, `instance_vehicle` AS `instance_vehicle` WHERE vehicle.id = world_vehicle.vehicle_id AND instance_vehicle.world_vehicle_id = world_vehicle.id AND instance_vehicle.instance_id = '".$serverinstance."' AND `damage` < '0.95'") or die(mysql_error());
$res3 = mysql_query("SELECT deployable.class_name, instance_deployable.* FROM `deployable`, `instance_deployable` AS `instance_deployable` WHERE deployable.id = instance_deployable.deployable_id AND instance_deployable.instance_id = '".$serverinstance."'") or die(mysql_error());

$markers = array();
$markers = array_merge($markers, markers_player($res1, $serverworld));
$markers = array_merge($markers, markers_vehicle($res2, $serverworld));
$markers = array_merge($markers, markers_deployable($res3, $serverworld));

?>