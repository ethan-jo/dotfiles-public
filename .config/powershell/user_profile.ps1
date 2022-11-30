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
