@echo off
taskkill /f /im mysqld.exe>nul
start /min mysqld.exe --defaults-file="my.ini"
exit