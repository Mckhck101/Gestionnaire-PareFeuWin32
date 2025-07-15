
# PareFeuMenu.ps1
# Script interactif pour gérer le pare-feu Windows avec journalisation complète

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
    Write-Host "1. Désactiver le pare-feu"
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
            Write-Host "`nDésactivation du pare-feu..." -ForegroundColor Yellow
            Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False
            Write-Host "Pare-feu désactivé !" -ForegroundColor Green
            Log-Action "Pare-feu désactivé pour tous les profils"
            Pause
        }
        '2' {
            Write-Host "`nActivation du pare-feu..." -ForegroundColor Yellow
            Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True
            Write-Host "Pare-feu activé !" -ForegroundColor Green
            Log-Action "Pare-feu activé pour tous les profils"
            Pause
        }
        '3' {
            Write-Host "`nAu revoir !" -ForegroundColor Cyan
            Log-Action "Script terminé par l'utilisateur"
        }
        '4' {
            Write-Host "`nContenu du journal :" -ForegroundColor Cyan
            if (Test-Path $logPath) {
                Get-Content $logPath | ForEach-Object { Write-Host $_ }
                Log-Action "Consultation du journal"
            } else {
                Write-Host "Aucun journal trouvé." -ForegroundColor Red
                Log-Action "Tentative de consultation du journal : fichier introuvable"
            }
            Pause
        }
        '5' {
            if (Test-Path $logPath) {
                Remove-Item $logPath -Force
                Write-Host "Journal effacé avec succès." -ForegroundColor Green
                Log-Action "Journal effacé"
            } else {
                Write-Host "Aucun journal à effacer." -ForegroundColor Red
            }
            Pause
        }
        Default {
            Write-Host "`nChoix invalide. Réessaie." -ForegroundColor Red
            Log-Action "Choix invalide entré : $choix"
            Pause
        }
    }
} while ($choix -ne '3')
