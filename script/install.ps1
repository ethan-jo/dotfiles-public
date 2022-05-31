cd ~/
git clone https://github.com/ethan-xu1986/dotfiles-public.git

# neovim
winget install Neovim.Neovim

# git
winget install  -e --id Git.Git
Install-Module -Name posh-git -Scope CurrentUser

# oh-my-posh
winget install oh-my-posh

# Terminal Icons
Install-Module -Name Terminal-Icons -Repository PSGallery

# PSFzf
Install-Module -Name PSFzf  -Scope CurrentUser

# z
Install-Module -Name z -Scope CurrentUser

mkdir .config/powershell  -Force
cp dotfiles-public/.config/powershell/user_profile.ps1 .config/powershell/
cp dotfiles-public/.config/powershell/haffxu.omp.json .
cp dotfiles-public/script/fzf.exe  ./AppData/Local/Programs/oh-my-posh/bin

# options Scoop
# iwr -useb get.scoop.sh | iex

