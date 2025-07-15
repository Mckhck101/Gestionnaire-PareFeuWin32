
# PareFeuMenu.ps1
# Script interactif pour gerer le pare-feu Windows avec journalisation complete

$logPath = Join-Path -Path $PSScriptRoot -ChildPath "PareFeu.log"

function Log-Action {
    param ([string]$message)
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    "$timestamp - $message" | Out-File -FilePath $logPath -Append
}

function Afficher-Menu {
    Clear-Host
    Write-Host "==============================" -ForegroundColor DarkCyan
    Write-Host "   GESTION DU PARE-FEU WINDOWS" -ForegroundColor Cyan
    Write-Host "==============================" -ForegroundColor DarkCyan
    Write-Host "1. Desactiver le pare-feu"
    Write-Host "2. Activer le pare-feu"
    Write-Host "3. Quitter"
    Write-Host "4. Consulter le journal"
    Write-Host "5. Effacer le journal"
    Write-Host ""
}

do {
    Afficher-Menu
    $choix = Read-Host "Fais ton choix (1-5)"

    switch ($choix) {
        '1' {
            Write-Host "`nDesactivation du pare-feu..." -ForegroundColor Yellow
            Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False
            Write-Host "Pare-feu desactive !" -ForegroundColor Green
            Log-Action "Pare-feu desactive pour tous les profils"
            Pause
        }
        '2' {
            Write-Host "`nActivation du pare-feu..." -ForegroundColor Yellow
            Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True
            Write-Host "Pare-feu active !" -ForegroundColor Green
            Log-Action "Pare-feu active pour tous les profils"
            Pause
        }
        '3' {
            Write-Host "`nAu revoir !" -ForegroundColor Cyan
            Log-Action "Script termine par l'utilisateur"
        }
        '4' {
            Write-Host "`nContenu du journal :" -ForegroundColor Cyan
            if (Test-Path $logPath) {
                Get-Content $logPath | ForEach-Object { Write-Host $_ }
                Log-Action "Consultation du journal"
            } else {
                Write-Host "Aucun journal trouve." -ForegroundColor Red
                Log-Action "Tentative de consultation du journal : fichier introuvable"
            }
            Pause
        }
        '5' {
            if (Test-Path $logPath) {
                Remove-Item $logPath -Force
                Write-Host "Journal efface avec succes." -ForegroundColor Green
                Log-Action "Journal efface"
            } else {
                Write-Host "Aucun journal a effacer." -ForegroundColor Red
            }
            Pause
        }
        Default {
            Write-Host "`nChoix invalide. Reessaie." -ForegroundColor Red
            Log-Action "Choix invalide entre : $choix"
            Pause
        }
    }
} while ($choix -ne '3')
