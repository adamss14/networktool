@echo off
title Network SpeedTest
chcp 65001 > nul
call :banner
echo Testing your Network Speed...
cd ..

if errorlevel 1 (
    echo Error occurred. Closing CMD.
    exit /b
)

:loop
ping -n 3 8.8.8.9>%temp%\ping.txt
for /f "tokens=4 delims==" %%a in ('type %temp%\ping.txt ^| find "Average"') do set ping=%%a 
for /f "tokens=10 delims= " %%a in ('type %temp%\ping.txt ^| find "Lost"') do set lostpack=%%a 
for /f "tokens=2 delims= " %%a in ('netstat -e ^| find "Bytes"') do set rebytes=%%a 
for /f "tokens=3 delims= " %%a in ('netstat -e ^| find "Bytes"') do set sebytes=%%a 

cls
call :banner
echo [4;34mAverage:[0m [38;5;39m%ping%[0m
echo [4;34mPacket Loss:[0m [38;5;39m%lostpack%[0m
echo [4;34mRecieved:[0m [38;5;39m%rebytes% Bytes [0m
echo [4;34mSent:[0m [38;5;39m%sebytes% Bytes [0m 
echo.
set /p input=[38;5;39mType "end" to close the command prompt: [0m 
if /i %input% == end start networktool
if /i %input% == end exit 

goto loop


:banner
echo.
echo.
echo                       [38;5;17m███████╗██████╗ ███████╗███████╗██████╗     ████████╗███████╗███████╗████████╗
echo                       [38;5;18m██╔════╝██╔══██╗██╔════╝██╔════╝██╔══██╗    ╚══██╔══╝██╔════╝██╔════╝╚══██╔══╝
echo                       [38;5;21m███████╗██████╔╝█████╗  █████╗  ██║  ██║       ██║   █████╗  ███████╗   ██║   
echo                       [38;5;27m╚════██║██╔═══╝ ██╔══╝  ██╔══╝  ██║  ██║       ██║   ██╔══╝  ╚════██║   ██║   
echo                       [38;5;33m███████║██║     ███████╗███████╗██████╔╝       ██║   ███████╗███████║   ██║   
echo                       [38;5;39m╚══════╝╚═╝     ╚══════╝╚══════╝╚═════╝        ╚═╝   ╚══════╝╚══════╝   ╚═╝  
echo.
echo.