update users set permissions = 'map, table, user, control, whitelist, tools, feed' where permissions = 'map, table, user, control, whitelist, tools';

alter table users
  modify permissions varchar(255) not null default 'whitelist, table, map, control, tools, feed';