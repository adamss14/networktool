@echo off
title NetworkTool - by Adamss14
chcp 65001 > nul
call :banner
echo    [38;5;39m       ╔═(1) Network Connection Checker
echo           ╠══(2) Speed test
echo.
echo.
cd files
set /p input=        Select Input: %BS%
if %input% == 1 start network
if %input% == 2 start speedtest
if errorlevel 1 (
    exit /b
)
cls
goto start
pause





:banner
echo.
echo.
echo           [38;5;17m███╗   ██╗███████╗████████╗██╗    ██╗ ██████╗ ██████╗ ██╗  ██╗    ████████╗ ██████╗  ██████╗ ██╗     
echo           [38;5;18m████╗  ██║██╔════╝╚══██╔══╝██║    ██║██╔═══██╗██╔══██╗██║ ██╔╝    ╚══██╔══╝██╔═══██╗██╔═══██╗██║     
echo           [38;5;21m██╔██╗ ██║█████╗     ██║   ██║ █╗ ██║██║   ██║██████╔╝█████╔╝        ██║   ██║   ██║██║   ██║██║     
echo           [38;5;27m██║╚██╗██║██╔══╝     ██║   ██║███╗██║██║   ██║██╔══██╗██╔═██╗        ██║   ██║   ██║██║   ██║██║     
echo           [38;5;33m██║ ╚████║███████╗   ██║   ╚███╔███╔╝╚██████╔╝██║  ██║██║  ██╗       ██║   ╚██████╔╝╚██████╔╝███████╗
echo           [38;5;39m╚═╝  ╚═══╝╚══════╝   ╚═╝    ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝       ╚═╝    ╚═════╝  ╚═════╝ ╚══════╝
echo.            
echo           [4mBy Adamss14[0m                                                
echo.
echo.



