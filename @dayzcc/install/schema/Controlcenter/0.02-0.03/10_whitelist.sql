create table if not exists whitelist (
  id int(11) unsigned not null auto_increment,
  name varchar(64) not null default '',
  guid varchar(32) not null default '' comment 'BattlEye GUID or IP',
  is_whitelisted tinyint(1) unsigned not null default 0,

  primary key (id)
) character set utf8 engine=InnoDB;