@echo off
echo Batch File By TechieSavi
net stop wuauserv
net stop UsoSvc
rd /s /q C:\Windows\SoftwareDistribution
md C:\Windows\SoftwareDistribution
pause