@echo off
title Lanceur de Scripts PowerShell - Admin
color 1F

echo ===============================
echo        MENU DE LANCEMENT
echo ===============================
echo 1 : Lancer Gestion de Ping
echo 2 : Lancer Gestion de PareFeu
echo.

set /p choix="Entrez votre choix (1 ou 2) : "

:: Définir le chemin des scripts
set "script1=IcmpAllow.ps1"
set "script2=PareFeuMenu.ps1"

:: Vérifier le choix et lancer avec élévation
if "%choix%"=="1" (
    powershell -Command "Start-Process PowerShell -ArgumentList '-ExecutionPolicy Bypass -File \"%CD%\%script1%\"' -Verb RunAs"
    echo IcmpAllow.ps1 lancé avec privilèges administrateur.
)
if "%choix%"=="2" (
    powershell -Command "Start-Process PowerShell -ArgumentList '-ExecutionPolicy Bypass -File \"%CD%\%script2%\"' -Verb RunAs"
    echo PareFeuMenu.ps1 lancé avec privilèges administrateur.
)
if not "%choix%"=="1" if not "%choix%"=="2" (
    echo Choix invalide. Veuillez entrer 1 ou 2.
)

echo.
pause