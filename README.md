# 🔐 PareFeuManager

**PareFeuManager** est un outil PowerShell/BAT léger et interactif pour la gestion du pare-feu Windows et des règles ICMP (ping). Il offre à la fois une interface textuelle en ligne de commande et une modularité pour l’administration réseau.

---

## 📦 Contenu du projet

- `PareFeuMenu.ps1` : Script PowerShell pour activer ou désactiver le pare-feu Windows.
- `IcmpAllow.ps1` : Script PowerShell pour ajouter ou supprimer des règles ICMP (ping IPv4/IPv6).
- `LancerPareFeuMenu.bat` : Lanceur en batch permettant de choisir et exécuter l’un des deux scripts avec élévation des droits (admin).
- `ping_log.txt` : Fichier journal contenant les actions ICMP avec horodatage.
- `PareFeu.log` : Fichier journal contenant les actions du pare-feu avec horodatage.

---

## 🛠️ Fonctions principales

### 🔄 PareFeuMenu.ps1
- Active ou désactive le pare-feu Windows.
- Prise en charge des privilèges administrateur.
- Journalisation dans `PareFeu.log`.
- Interface simple et directe.

### 📡 IcmpAllow.ps1
- Supprime les règles ICMP existantes. 'Uniquement celles crées par l'application.'
- Ajoute des règles ICMP (autoriser/bloquer) pour IPv4 et/ou IPv6, selon le choix.
- Journalisation dans `ping_log.txt`.
- Affichage de l’état actuel des règles via `netsh`.

### 🚀 LancerPareFeuMenu.bat
- Menu de sélection : `IcmpAllow.ps1` ou `PareFeuMenu.ps1`.
- Lancement automatique des scripts en mode administrateur.
- Permet d’éviter les manipulations manuelles et garantit les autorisations requises.

---

## 💻 Prérequis

- Microsoft Windows.
- Droits administrateur pour exécuter les scripts.
- ExecutionPolicy : Le script utilise `Bypass` pour contourner les restrictions (sans modification permanente).

---

## 📋 Instructions

1. Clone ce dépôt ou télécharge les fichiers dans un dossier local.
2. Exécute `LancerPareFeuMenu.bat` **en tant qu’administrateur**.
3. Choisis l’option souhaitée pour gérer ton pare-feu ou les règles ICMP.
4. Consulte `ping_log.txt` ou `PareFeu.log` pour suivre les actions effectuées.

---

## 🔒 Sécurité

- Aucune donnée personnelle n’est collectée.
- Les scripts modifient uniquement les paramètres locaux du pare-feu via `netsh`.

---

## 📁 Exemple d’utilisation

```shell
.\Launcher.bat
# Sélectionne 1 : IcmpAllow.ps1
# Autorise le ping IPv4 uniquement
