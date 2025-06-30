@echo off
setlocal enableextensions
title MADE BY Sviat#2430 SPECIALLY FOR FoxOS
cd /d "%~dp0"

echo.
echo                        NOT FOR SELL OR COPYRIGHT
echo.
echo.
echo        This script improves ur network latency, hitreg and speed
echo.
pause

sc config Winmgmt start= demand >nul 2>&1
sc start Winmgmt >nul 2>&1
for /f %%i in ('wmic path win32_networkadapter get GUID ^| findstr "{"') do reg add "HKLM\System\CurrentControlSet\services\Tcpip\Parameters\Interfaces\%%i" /v "TcpAckFrequency" /t REG_DWORD /d "1" /f >nul 2>&1
for /f %%i in ('wmic path win32_networkadapter get GUID ^| findstr "{"') do reg add "HKLM\System\CurrentControlSet\services\Tcpip\Parameters\Interfaces\%%i" /v "TcpDelAckTicks" /t REG_DWORD /d "0" /f >nul 2>&1
for /f %%i in ('wmic path win32_networkadapter get GUID ^| findstr "{"') do reg add "HKLM\System\CurrentControlSet\services\Tcpip\Parameters\Interfaces\%%i" /v "TCPNoDelay" /t REG_DWORD /d "1" /f >nul 2>&1
sc stop Winmgmt >nul 2>&1

netsh winsock set autotuning on >nul 2>&1

netsh int ip set global neighborcachelimit=4096 >nul 2>&1
netsh int ip set global routecachelimit=4096
netsh int ip set global sourceroutingbehavior=drop >nul 2>&1
netsh int tcp set global autotuninglevel=normal chimney=disabled congestionprovider=ctcp netdma=disabled >nul 2>&1

netsh interface teredo set state disabled >nul 2>&1
netsh int isatap set state disable >nul 2>&1

for /f "tokens=1" %%i in ('netsh int ip show interfaces ^| findstr [0-9]') do set INTERFACE=%%i >nul 2>&1
netsh int ip set interface %INTERFACE% basereachable=3600000 dadtransmits=0 otherstateful=disabled routerdiscovery=disabled store=persistent >nul 2>&1

netsh int tcp set heuristics disabled >nul 2>&1
netsh int tcp set heuristics wsh=disabled >nul 2>&1

netsh int tcp set security mpp=disabled >nul 2>&1
netsh int tcp set security profiles=disabled >nul 2>&1

netsh int ipv4 set dynamicport tcp start=1025 num=64511 >nul 2>&1
netsh int ipv4 set dynamicport udp start=1025 num=64511 >nul 2>&1