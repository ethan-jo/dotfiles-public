# set PowerShell to UTF-8
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

Import-Module posh-git
$omp_config = Join-Path $env:USERPROFILE ".\haffxu.omp.json"
oh-my-posh --init --shell pwsh --config $omp_config | Invoke-Expression

Import-Module -Name Terminal-Icons

# PSReadLine
Import-Module PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineKeyHandler -Chord UpArrow -Function HistorySearchBackward
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -Colors @{
  InlinePrediction   = '#247C73'
}

# Fzf
#Import-Module PSFzf
#Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# Env
$env:GIT_SSH = "C:\Windows\system32\OpenSSH\ssh.exe"

# Alias
Set-Alias -Name vim -Value nvim
Set-Alias vi nvim
Set-Alias ll ls
Set-Alias g git
Set-Alias grep findstr
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'

# Utilities
function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}
function ssh-copy-id($remote){
  type $env:USERPROFILE\.ssh\id_rsa.pub | ssh $remote "cat >> .ssh/authorized_keys"
}

function showproxy{netsh winhttp show proxy}
function resetproxy{netsh winhttp reset proxy}
function setproxy{netsh winhttp set proxy 127.0.0.1:7890}

#Alias for server
function s123 {ssh root@10.10.10.123}
function s127 {ssh root@10.10.10.127}
function s48 {ssh root@172.16.20.48}
function s5 {ssh root@172.16.20.5}
function s200 {ssh bridge@172.16.20.200}
function s222 {ssh bridge@172.16.20.222}
function s211 {ssh bridge@172.16.20.211}
function s88 {ssh bridge@10.20.167.88}