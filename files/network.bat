@echo off
title Network Connection Info
chcp 65001 > nul
call :banner
echo Loading Current Network Information... 
cd ..

if errorlevel 1 (
    echo Error occurred. Closing CMD.
    exit /b
)
set defgateway_ipv4=
set defgateway_ipv6=


:loop
for /f "tokens=2 delims=:" %%a in ('netsh wlan show interface ^| find "SSID" ^| findstr /v "BSSID"') do set ssid=%%a 
for /f "tokens=2 delims=:" %%a in ('netsh wlan show interface ^| find "Description" ^| findstr /v "BSSID"') do set nic=%%a
for /f "tokens=2 delims=:" %%a in ('ipconfig ^| find "IPv4"') do set ipv4=%%a 
for /f "tokens=2,* delims=:" %%a in ('ipconfig ^| find "IPv6 Address" ^| findstr /v "Temporary" ^| findstr /v "Link"') do (
    if not defined ipv6 (
        set ipv6=%%a:%%b
    )
)
for /f "tokens=2 delims=:" %%a in ('ipconfig ^| find "Subnet Mask"') do set subnet=%%a 
for /f "tokens=2 delims={,}" %%a in ('"WMIC NICConfig where IPEnabled="True" get DefaultIPGateway /value | find "I" "') do set defgateway_ipv4=%%~a
for /f "tokens=3 delims={,}" %%a in ('"WMIC NICConfig where IPEnabled="True" get DefaultIPGateway /value | find "I" "') do set defgateway_ipv6=%%~a
for /f "tokens=2 delims=:" %%a in ('netsh wlan show interface ^| find "Radio type" ^| findstr /v "BSSID"') do set radiotype=%%a 
for /f "tokens=2 delims=:" %%a in ('netsh wlan show interface ^| find "Description" ^| findstr /v "State"') do set state=%%a
for /f "tokens=2 delims=:" %%a in ('netsh wlan show interface ^| find "Signal" ^| findstr /v "BSSID"') do set signal=%%a 
ping -n 3 8.8.8.9>%temp%\ping.txt

cls

call :banner
echo [4;34mSSID:[0m [38;5;39m %ssid%[0m
echo [4;34mNIC:[0m [38;5;39m %nic%[0m
echo [4;34mIPv4:[0m [38;5;39m %ipv4%[0m
echo [4;34mIPv6:[0m [38;5;39m %ipv6%[0m
echo [4;34mSubnet Mask:[0m [38;5;39m %subnet%[0m
echo [4;34mDefault Gateway IPv6:[0m [38;5;39m %defgateway_ipv6%[0m
echo [4;34mDefault Gateway IPv4:[0m [38;5;39m %defgateway_ipv4%[0m
echo [4;34mRadio Type:[0m [38;5;39m %radiotype%[0m
echo [4;34mState:[0m [38;5;39m %state%[0m
echo [4;34mSignal:[0m [38;5;39m %signal%[0m
echo.

set /p input=[38;5;39mType "end" to close the command prompt:[0m %BS%
if /i %input% == end start networktool
if /i %input% == end exit 

goto loop

:banner
echo.
echo.
echo           [38;5;17m███╗   ██╗███████╗████████╗██╗    ██╗ ██████╗ ██████╗ ██╗  ██╗    ██╗███╗   ██╗███████╗ ██████╗ 
echo           [38;5;18m████╗  ██║██╔════╝╚══██╔══╝██║    ██║██╔═══██╗██╔══██╗██║ ██╔╝    ██║████╗  ██║██╔════╝██╔═══██╗
echo           [38;5;21m██╔██╗ ██║█████╗     ██║   ██║ █╗ ██║██║   ██║██████╔╝█████╔╝     ██║██╔██╗ ██║█████╗  ██║   ██║
echo           [38;5;27m██║╚██╗██║██╔══╝     ██║   ██║███╗██║██║   ██║██╔══██╗██╔═██╗     ██║██║╚██╗██║██╔══╝  ██║   ██║
echo           [38;5;33m██║ ╚████║███████╗   ██║   ╚███╔███╔╝╚██████╔╝██║  ██║██║  ██╗    ██║██║ ╚████║██║     ╚██████╔╝
echo           [38;5;39m╚═╝  ╚═══╝╚══════╝   ╚═╝    ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝    ╚═╝╚═╝  ╚═══╝╚═╝      ╚═════╝ 
echo.
echo.