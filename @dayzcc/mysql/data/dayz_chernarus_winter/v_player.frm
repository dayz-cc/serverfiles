TYPE=VIEW
query=select `p`.`name` AS `player_name`,`p`.`humanity` AS `humanity`,`s`.`id` AS `alive_survivor_id`,`s`.`world_id` AS `alive_survivor_world_id` from (`dayz_chernarus_winter`.`profile` `p` left join `dayz_chernarus_winter`.`survivor` `s` on(((`p`.`unique_id` = `s`.`unique_id`) and (`s`.`is_dead` = 0))))
md5=30ad327d1c0f2f2b9b7d6a862f66af42
updatable=0
algorithm=0
definer_user=root
definer_host=localhost
suid=1
with_check_option=0
timestamp=2016-02-12 16:14:09
create-version=1
source=select `p`.`name` AS `player_name`,`p`.`humanity` AS `humanity`,`s`.`id` AS `alive_survivor_id`,`s`.`world_id` AS `alive_survivor_world_id` from (`profile` `p` left join `survivor` `s` on(((`p`.`unique_id` = `s`.`unique_id`) and (`s`.`is_dead` = 0))))
client_cs_name=latin1
connection_cl_name=latin1_swedish_ci
view_body_utf8=select `p`.`name` AS `player_name`,`p`.`humanity` AS `humanity`,`s`.`id` AS `alive_survivor_id`,`s`.`world_id` AS `alive_survivor_world_id` from (`dayz_chernarus_winter`.`profile` `p` left join `dayz_chernarus_winter`.`survivor` `s` on(((`p`.`unique_id` = `s`.`unique_id`) and (`s`.`is_dead` = 0))))
