ECHO OFF
@TITLE WoW Backup Helper

:: variables
for /f "delims=" %%a in ('wmic OS Get localdatetime ^| find "."') do set dt=%%a
SET year=%date:~-4,4%
SET month=%dt:~4,2%
SET day=%date:~-7,2%
SET hourMilitary=%time:~-11,2%
SET hourCivilian=%time:~7,2%
SET minutes=%time:~3,2%

if %month%==01 set monthname=Jan
if %month%==02 set monthname=Feb
if %month%==03 set monthname=Mar
if %month%==04 set monthname=Apr
if %month%==05 set monthname=May
if %month%==06 set monthname=Jun
if %month%==07 set monthname=Jul
if %month%==08 set monthname=Aug
if %month%==09 set monthname=Sep
if %month%==10 set monthname=Oct
if %month%==11 set monthname=Nov
if %month%==12 set monthname=Dec

SET timestamp=%year%%month%%day%%hourMilitary%%minutes%
SET installDirectory=%~dp0

:: -------------------------------------------------------------------|
:: Set to the location of your WoW directory,
SET gameDirectory=D:\Games\World of Warcraft\_retail_

:: (Optional) Set to the location of your target backup directory.
:: Default: <wow-backup-helper-directory>/backups
SET targetDirectory=%installDirectory%..\backups
mkdir %targetDirectory%

:: -------------------------------------------------------------------|

:: TIP: Comment out the lines below if you don't want to backup those directories.
:: Backs up the WTF directory.
"%installDirectory%..\lib\7za" a -tzip "%targetDirectory%\%timestamp%\WTF.zip" "%gameDirectory%\WTF" -mx5

:: Backs up the Interface directory.
"%installDirectory%..\lib\7za" a -tzip "%targetDirectory%\%timestamp%\Interface.zip" "%gameDirectory%\interface"

:: Backs up the Screenshots directory.
"%installDirectory%..\lib\7za" a -tzip "%targetDirectory%\%timestamp%\Screenshots.zip" "%gameDirectory%\screenshots"

:: Backs up the Cache directory.
"%installDirectory%..\lib\7za" a -tzip "%targetDirectory%\%timestamp%\Cache.zip" "%gameDirectory%\cache"