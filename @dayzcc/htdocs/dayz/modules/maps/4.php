<?php

$res = mysql_query("SELECT world_vehicle.vehicle_id, vehicle.class_name, instance_vehicle.*, instance.world_id FROM `world_vehicle`, `vehicle`, `instance_vehicle`, `instance` WHERE vehicle.id = world_vehicle.vehicle_id AND instance_vehicle.world_vehicle_id = world_vehicle.id AND instance_vehicle.instance_id = '".$serverinstance."' AND world_vehicle.world_id = instance.world_id AND `damage` < '0.95'") or die(mysql_error());
$markers = markers_vehicle($res, $serverworld);

?>