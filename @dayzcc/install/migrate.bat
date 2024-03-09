@echo off

if "%1" == "" goto manual
if "%2" == "" goto manual
if "%3" == "" goto manual
if "%4" == "" goto manual
goto auto

:auto
set type=1
set dbhost=%2
set dbport=%3
set dbuser=%4
set dbpass=%5
set dbname=%1
goto main

:manual
echo Please enter the following information to allow database migration.
echo ^> MySQL Hostname  - Example: "127.0.0.1"
echo ^> MySQL Port      - Example: "3306"
echo ^> MySQL Username  - Example: "dayz"
echo ^> MySQL Password  - Example: "dayz"
echo ^> Database Name   - Example: "dayz_chernarus"
echo.
set type=2
set /p dbhost=MySQL Hostname: 
set /p dbport=MySQL Port: 
set /p dbuser=MySQL Username: 
set /p dbpass=MySQL Password: 
set /p dbname=Database Name: 
echo.
echo.
goto main

:main
..\php\php.exe migrate.php --host=%dbhost% --port=%dbport% --username=%dbuser% --password=%dbpass% --database=%dbname% --schema=Bliss
if %ERRORLEVEL% GEQ 1 goto error
echo.
..\php\php.exe migrate.php --host=%dbhost% --port=%dbport% --username=%dbuser% --password=%dbpass% --database=%dbname% --schema=BlissBuildings
IF %ERRORLEVEL% GEQ 1 goto error
echo.
..\php\php.exe migrate.php --host=%dbhost% --port=%dbport% --username=%dbuser% --password=%dbpass% --database=%dbname% --schema=BlissInvCust
echo.
..\php\php.exe migrate.php --host=%dbhost% --port=%dbport% --username=%dbuser% --password=%dbpass% --database=%dbname% --schema=BlissCustom
echo.
..\php\php.exe migrate.php --host=%dbhost% --port=%dbport% --username=%dbuser% --password=%dbpass% --database=%dbname% --schema=Controlcenter
goto end

:error
echo ^> Error: Exitcode %ERRORLEVEL%
if "%type%" == "2" goto end
exit /B %ERRORLEVEL%

:end
echo.
echo.
if "%type%" == "2" ( pause )
exit