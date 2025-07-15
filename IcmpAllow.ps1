# Gestion des Ping ICMP - PowerShell avec suppression, log et vérification

$logfile = "ping_log.txt"

Write-Host "==============================="
Write-Host "    Choisissez une option"
Write-Host "==============================="
Write-Host "1 : Autoriser les ping (IPv4 & IPv6)"
Write-Host "2 : Bloquer les ping (IPv4 & IPv6)"
Write-Host "3 : Autoriser les ping IPv4"
Write-Host "4 : Autoriser les ping IPv6"
Write-Host "5 : Bloquer les ping IPv4"
Write-Host "6 : Bloquer les ping IPv6"
Write-Host ""

$choix = Read-Host "Entrez votre choix (1-6)"
$timestamp = Get-Date -Format "dd/MM/yyyy HH:mm:ss"
$action = ""

# Suppression des anciennes règles
netsh advfirewall firewall delete rule name="Autoriser ICMP V4" | Out-Null
netsh advfirewall firewall delete rule name="Bloquer ICMP V4" | Out-Null
netsh advfirewall firewall delete rule name="Autoriser ICMP V6" | Out-Null
netsh advfirewall firewall delete rule name="Bloquer ICMP V6" | Out-Null

switch ($choix) {
    "1" {
        netsh advfirewall firewall add rule name="Autoriser ICMP V4" protocol=icmpv4:8,any dir=in action=allow
        netsh advfirewall firewall add rule name="Autoriser ICMP V6" protocol=icmpv6:8,any dir=in action=allow
        $action = "Ping IPv4 et IPv6 autorisés"
    }
    "2" {
        netsh advfirewall firewall add rule name="Bloquer ICMP V4" protocol=icmpv4:8,any dir=in action=block
        netsh advfirewall firewall add rule name="Bloquer ICMP V6" protocol=icmpv6:8,any dir=in action=block
        $action = "Ping IPv4 et IPv6 bloqués"
    }
    "3" {
        netsh advfirewall firewall add rule name="Autoriser ICMP V4" protocol=icmpv4:8,any dir=in action=allow
        $action = "Ping IPv4 autorisé"
    }
    "5" {
        netsh advfirewall firewall add rule name="Bloquer ICMP V4" protocol=icmpv4:8,any dir=in action=block
        $action = "Ping IPv4 bloqué"
    }
    "4" {
        netsh advfirewall firewall add rule name="Autoriser ICMP V6" protocol=icmpv6:8,any dir=in action=allow
        $action = "Ping IPv6 autorisé"
    }
    "6" {
        netsh advfirewall firewall add rule name="Bloquer ICMP V6" protocol=icmpv6:8,any dir=in action=block
        $action
    }
}