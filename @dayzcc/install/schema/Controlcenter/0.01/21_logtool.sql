drop table if exists log_tool;
create table if not exists log_tool (
  id int(11) unsigned not null auto_increment,
  action varchar(255) not null,
  user varchar(50) not null default '',
  timestamp	timestamp not null on update current_timestamp,

  primary key (id)
) character set utf8 engine=MyISAM;