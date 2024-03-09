create table if not exists users (
  id smallint(8) unsigned not null auto_increment,
  login varchar(50) not null default '',
  password varchar(32) not null default '',
  salt char(3) not null default '',
  permissions varchar(50) not null default 'map,list,user,control',
  lastlogin	timestamp not null on update current_timestamp,

  primary key (id),
  unique key login (login)
) character set utf8 engine=InnoDB;

insert ignore into users (login, password, salt, lastlogin) values
  ('admin','4f749f2c908b8ead47c20db6da1b04aa','l=i',null);