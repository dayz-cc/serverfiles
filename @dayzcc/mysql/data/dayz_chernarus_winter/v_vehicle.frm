TYPE=VIEW
query=select `iv`.`id` AS `instance_vehicle_id`,`v`.`id` AS `vehicle_id`,`iv`.`instance_id` AS `instance_id`,`i`.`world_id` AS `world_id`,`v`.`class_name` AS `class_name`,`iv`.`worldspace` AS `worldspace`,`iv`.`inventory` AS `inventory`,`iv`.`parts` AS `parts`,`iv`.`damage` AS `damage`,`iv`.`fuel` AS `fuel` from (((`dayz_chernarus_winter`.`instance_vehicle` `iv` join `dayz_chernarus_winter`.`world_vehicle` `wv` on((`iv`.`world_vehicle_id` = `wv`.`id`))) join `dayz_chernarus_winter`.`vehicle` `v` on((`wv`.`vehicle_id` = `v`.`id`))) join `dayz_chernarus_winter`.`instance` `i` on((`iv`.`instance_id` = `i`.`id`)))
md5=1fac526044292622667da49f89a683c9
updatable=1
algorithm=0
definer_user=root
definer_host=localhost
suid=1
with_check_option=0
timestamp=2016-02-12 16:14:09
create-version=1
source=select `iv`.`id` AS `instance_vehicle_id`,`v`.`id` AS `vehicle_id`,`iv`.`instance_id` AS `instance_id`,`i`.`world_id` AS `world_id`,`v`.`class_name` AS `class_name`,`iv`.`worldspace` AS `worldspace`,`iv`.`inventory` AS `inventory`,`iv`.`parts` AS `parts`,`iv`.`damage` AS `damage`,`iv`.`fuel` AS `fuel` from (((`instance_vehicle` `iv` join `world_vehicle` `wv` on((`iv`.`world_vehicle_id` = `wv`.`id`))) join `vehicle` `v` on((`wv`.`vehicle_id` = `v`.`id`))) join `instance` `i` on((`iv`.`instance_id` = `i`.`id`)))
client_cs_name=latin1
connection_cl_name=latin1_swedish_ci
view_body_utf8=select `iv`.`id` AS `instance_vehicle_id`,`v`.`id` AS `vehicle_id`,`iv`.`instance_id` AS `instance_id`,`i`.`world_id` AS `world_id`,`v`.`class_name` AS `class_name`,`iv`.`worldspace` AS `worldspace`,`iv`.`inventory` AS `inventory`,`iv`.`parts` AS `parts`,`iv`.`damage` AS `damage`,`iv`.`fuel` AS `fuel` from (((`dayz_chernarus_winter`.`instance_vehicle` `iv` join `dayz_chernarus_winter`.`world_vehicle` `wv` on((`iv`.`world_vehicle_id` = `wv`.`id`))) join `dayz_chernarus_winter`.`vehicle` `v` on((`wv`.`vehicle_id` = `v`.`id`))) join `dayz_chernarus_winter`.`instance` `i` on((`iv`.`instance_id` = `i`.`id`)))
