Set-ExecutionPolicy -ExecutionPolicy RemoteSigned

#Fetch DotFiles 
$dotfiles = "$HOME\.files"
git clone https://github.com/sarvex/dotfiles $dotfiles
New-Item -Path "$HOME\.gitconfig" -ItemType SymbolicLink -Value "$dotfiles\git.config"
New-Item -Path "$HOME\.wezterm.lua" -ItemType SymbolicLink -Value "$dotfiles\wezterm.lua"

# Add Links
New-Item -Path "$HOME\Documents\Powershell" -ItemType Directory
New-Item -Path "$PROFILE.CurrentUserAllHosts" -ItemType SymbolicLink -Value "$dotfiles\Profile.ps1"
. $PROFILE.CurrentUserAllHosts

New-Item -Path "$env:LOCALAPPDATA\alacritty" -ItemType Directory
New-Item -Path "$env:LOCALAPPDATA\alacritty\alacritty.yml" -ItemType SymbolicLink -Value "$dotfiles\alacritty.windows.yml"

New-Item -Path "$env:APPDATA\Code\User" -ItemType Directory
New-Item -Path "$env:APPDATA\Code\User\settings.json" -ItemType SymbolicLink -Value "$dotfiles\code.settings.json"

New-Item -Path "$env:APPDATA\yt-dlp" -ItemType Directory
New-Item -Path "$env:APPDATA\yt-dlp\config" -ItemType SymbolicLink -Value "$dotfiles\yt-dlp.config"


New-Item -Path "$env:APPDATA\Sublime Text\Packages\User\" -ItemType Directory
New-Item -Path "$env:APPDATA\Sublime Text\Packages\User\Preferences.sublime-settings" -ItemType SymbolicLink -Value "$dotfiles\Preferences.sublime-settings.json"

New-Item -Path "$env:APPDATA\tabby" -ItemType Directory
New-Item -Path "$env:APPDATA\tabby\config.yaml" -ItemType SymbolicLink -Value "$dotfiles\tabby.yaml"

#Install scoop 
Invoke-WebRequest get.scoop.sh -UseBasicParsing | Invoke-Expression
Add-MpPreference -ExclusionPath "$($env:programdata)\scoop", "$($env:scoop)"
scoop bucket known | ForEach-Object{ scoop bucket add $_ }
scoop bucket add sarvex https://github.com/sarvex/scoop
scoop install sudo aria2 curl grep sed less touch search-multisource terminal-icons oh-my-posh ripgrep fd llvm
sccop install CascadiaCode-NF CascadiaCode-NF-Mono Hack-NF Hack-NF-Mono Delugia-Nerd-Font-Complete Delugia-Mono-Nerd-Font-Complete Hasklig-NF Hasklig-NF-Mono SourceCodePro-NF SourceCodePro-NF-Mono LiberationMono-NF LiberationMono-NF-Mono AnonymousPro-NF AnonymousPro-NF-Mono FiraCode-NF-Mono FiraCode-NF Iosevka-NF Iosevka-NF-Mono Meslo-NF-Mono Meslo-NF Noto-NF-Mono Noto-NF RobotoMono-NF-Mono RobotoMono-NF UbuntuMono-NF-Mono UbuntuMono-NF JetBrainsMono-NF-Mono JetBrainsMono-NF


# Install all apps
# winget import --import-file "$HOME\winget.apps"
# scoop import "$Home\scoop.apps"

# Install Doom 
$doom_emacs = "$env:APPDATA\.emacs.d"
git clone --depth 1 https://github.com/doomemacs/doomemacs.git $doom_emacs
New-Item -Path $HOME\.emacs.d -ItemType SymbolicLink -Value $doom_emacs
New-Item -Path "$HOME\.doom.d" -ItemType SymbolicLink -Value "$dotfiles\.doom.d"
$env:Path += "; $HOME\.emacs.d\bin" 

# Install SpaceVim
$space_vim = "$env:LOCALAPPDATA\SpaceVim"
git clone https://github.com/SpaceVim/SpaceVim.git $space_vim
New-Item -Path $HOME\vimfiles -ItemType SymbolicLink -Value $space_vim
New-Item -Path "$HOME\.SpaceVim.d" -ItemType SymbolicLink -Value "$dotfiles\.SpaceVim.d"

# Install AstroNvim
$astro_nvim = "$env:LOCALAPPDATA\nvim"
git clone --depth 1 https://github.com/AstroNvim/AstroNvim $astro_nvim
git clone --depth 1 https://github.com/sarvex/astro-user "$astro_nvim\lua\user"
