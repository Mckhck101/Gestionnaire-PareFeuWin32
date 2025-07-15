
@echo off
setlocal

:: Chemin du script PowerShell
set "scriptPath=%~dp0PareFeuMenu.ps1"

:: Vérifie si le fichier existe
if not exist "%scriptPath%" (
    echo Le fichier PareFeuMenu.ps1 est introuvable dans ce dossier.
    pause
    exit /b
)

:: Exécute PowerShell avec élévation (admin)
powershell -Command "Start-Process PowerShell -ArgumentList '-ExecutionPolicy Bypass -File \"%scriptPath%\"' -Verb RunAs"

endlocal
