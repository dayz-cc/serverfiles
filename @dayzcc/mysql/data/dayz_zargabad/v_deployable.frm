TYPE=VIEW
query=select `id`.`id` AS `instance_deployable_id`,`d`.`id` AS `vehicle_id`,`d`.`class_name` AS `class_name`,`s`.`id` AS `owner_id`,`p`.`name` AS `owner_name`,`p`.`unique_id` AS `owner_unique_id`,`s`.`is_dead` AS `is_owner_dead`,`id`.`worldspace` AS `worldspace`,`id`.`inventory` AS `inventory` from (((`dayz_zargabad`.`instance_deployable` `id` join `dayz_zargabad`.`deployable` `d` on((`id`.`deployable_id` = `d`.`id`))) join `dayz_zargabad`.`survivor` `s` on((`id`.`owner_id` = `s`.`id`))) join `dayz_zargabad`.`profile` `p` on((`s`.`unique_id` = `p`.`unique_id`)))
md5=02380aa24b65b4590a45c625cd61df92
updatable=1
algorithm=0
definer_user=root
definer_host=localhost
suid=2
with_check_option=0
timestamp=2013-04-13 20:03:42
create-version=1
source=select\n    id.id instance_deployable_id,\n    d.id  vehicle_id,\n    d.class_name,\n    s.id owner_id,\n    p.name owner_name,\n    p.unique_id owner_unique_id,\n    s.is_dead is_owner_dead,\n    id.worldspace,\n    id.inventory\n  from\n    instance_deployable id\n    join deployable d on id.deployable_id = d.id\n    join survivor s on id.owner_id = s.id\n    join profile p on s.unique_id = p.unique_id
client_cs_name=latin1
connection_cl_name=latin1_swedish_ci
view_body_utf8=select `id`.`id` AS `instance_deployable_id`,`d`.`id` AS `vehicle_id`,`d`.`class_name` AS `class_name`,`s`.`id` AS `owner_id`,`p`.`name` AS `owner_name`,`p`.`unique_id` AS `owner_unique_id`,`s`.`is_dead` AS `is_owner_dead`,`id`.`worldspace` AS `worldspace`,`id`.`inventory` AS `inventory` from (((`dayz_zargabad`.`instance_deployable` `id` join `dayz_zargabad`.`deployable` `d` on((`id`.`deployable_id` = `d`.`id`))) join `dayz_zargabad`.`survivor` `s` on((`id`.`owner_id` = `s`.`id`))) join `dayz_zargabad`.`profile` `p` on((`s`.`unique_id` = `p`.`unique_id`)))
