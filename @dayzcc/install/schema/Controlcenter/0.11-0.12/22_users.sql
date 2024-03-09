alter table users
  modify permissions varchar(255) not null default 'whitelist, table, map, control, manage, log, tools, feed';
  
update users set permissions = 'map, table, user, control, manage, log, whitelist, tools, feed' where permissions = 'map, table, user, control, manage, whitelist, tools, feed';