@echo off
:inicio
echo.
echo What kind of disk do you have?
echo.
echo 1: SSD
echo 2: HDD
echo.
echo.

set /p menu=: 

if "%menu%"=="1" goto SSD
if "%menu%"=="2" goto HDD

:SSD
fsutil behavior set disableLastAccess 0
fsutil behavior set disable8dot3 1 
start https://twitter.com/Matishzz
exit

:HDD
fsutil behavior set disableLastAccess 2
fsutil behavior set disable8dot3 0
start https://twitter.com/Matishzz
exit
