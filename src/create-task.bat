ECHO OFF
@TITLE WoW Backup Helper Task Scheduler

set installDirectory=%~dp0

schtasks /create /tn "WoW Backup Helper" /tr %installDirectory%create-backup.bat /sc daily /mo 3 /st 00:00:00