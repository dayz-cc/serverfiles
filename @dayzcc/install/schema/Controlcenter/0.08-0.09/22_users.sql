alter table users
  modify permissions varchar(255) not null default 'whitelist, table, map, control, manage, tools, feed';
  
update users set permissions = 'map, table, user, control, manage, whitelist, tools, feed';