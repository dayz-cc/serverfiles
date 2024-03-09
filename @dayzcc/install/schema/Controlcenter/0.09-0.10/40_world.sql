alter table world add folder varchar(64) after name;

update world set folder = '@dayz' where name = 'chernarus';
update world set folder = '@dayzlingor' where name = 'lingor';
update world set folder = '@dayz' where name = 'utes';
update world set folder = '@dayztakistan' where name = 'takistan';
update world set folder = '@dayzpanthera' where name = 'panthera2';
update world set folder = '@dayzfallujah' where name = 'fallujah';
update world set folder = '@dayzzargabad' where name = 'zargabad';
update world set folder = '@dayz;@dayz_namalsk' where name = 'namalsk';
update world set folder = '@mbg_celle;@dayz_celle' where name = 'mbg_celle2';
update world set folder = '@taviana' where name = 'tavi';