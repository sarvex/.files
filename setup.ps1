Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

#Install Winget 
winget upgrade --all
@('Microsoft.VisualStudioCode', 'Git.Git', 'Microsoft.Powershell', 'Microsoft.Git', 'Microsoft.DotNet.SDK.7', 'Microsoft.VisualStudio.2022.Enterprise', 'Microsoft.WingetCreate', 'Microsoft.WindowsWDK', 'Microsoft.VFSforGit', 'Microsoft.Sysinternals.ProcessMonitor', 'Microsoft.Sysinternals.ProcessExplorer', 'Microsoft.Sysinternals.Autoruns', 'Microsoft.Sysinternals.Desktops', 'Microsoft.Sysinternals.BGInfo', 'Microsoft.Sysinternals.RDCMan', 'Microsoft.Sysinternals.TCPView', 'GitHub.cli', 'GLab.GLab', 'GitHub.GitHubDesktop', 'GitHub.GitLFS', 'SublimeHQ.SublimeText.4', 'Wez.Wezterm', 'Eugeny.Tabby', 'Lapce.Lapce', 'Vim.Vim', 'Neovide.Neovide', 'Neovim.Neovim', 'yt-dlp.yt-dlp') | ForEach-Object{ winget install $_ }

#Install scoop 
Invoke-WebRequest get.scoop.sh -UseBasicParsing | Invoke-Expression
Add-MpPreference -ExclusionPath "${env:ProgramData}\scoop\buckets", "${env:USERPROFILE}\scoop\buckets" -Force
scoop bucket known | ForEach-Object{ scoop bucket add $_ }
scoop bucket add sarvex https://github.com/sarvex/scoop
scoop install sudo aria2 curl grep sed less touch search-multisource terminal-icons oh-my-posh ripgrep fd llvm emacs python ruby perl php julia go make cmake premake bazel clangd 
scoop install aurulent-sans-mono-nerd-font agave-nerd-font anonymous-pro-nerd-font bitstream-vera-sans-mono-nerd-font CascadiaCode cascadia-code-nerd-font code-new-roman-nerd-font comic-shanns-mono-nerd-font cousine-nerd-font dejavu-sans-mono-nerd-font droid-sans-mono-nerd-font fantasque-sans-mono-nerd-font fira-code-nerd-font go-mono-nerd-font gohu-nerd-font hack-nerd-font hasklig-nerd-font ia-writer-nerd-font ibm-plex-mono-nerd-font inconsolata-nerd-font inconsolata-go-nerd-font iosevka-nerd-font iosevka-term-nerd-font jetbrains-mono-nerd-font liberation-mono-nerd-font lilex-nerd-font meslo-nerd-font overpass-nerd-font monofur-nerd-font mononoki-nerd-font noto-nerd-font pro-font-nerd-font proggy-clean-nerd-font roboto-mono-nerd-font source-code-pro-nerd-font space-mono-nerd-font share-tech-mono-nerd-font tinos-nerd-font ubuntu-mono-nerd-font

#Fetch DotFiles 
$dotfiles = "$HOME\.files"
git clone https://github.com/sarvex/dotfiles $dotfiles

# Add Links
New-Item -Path "$HOME\.gitconfig" -ItemType SymbolicLink -Value "$dotfiles\git.config" -Force
New-Item -Path "$HOME\.wezterm.lua" -ItemType SymbolicLink -Value "$dotfiles\wezterm.lua" -Force
New-Item -Path "$HOME\.xonshrc" -ItemType SymbolicLink -Value "$dotfiles\xonsh.rc" -Force
New-Item -Path "$HOME\.bashrc" -ItemType SymbolicLink -Value "$dotfiles\msys\.bashrc" -Force
New-Item -Path "$HOME\.bash_profile" -ItemType SymbolicLink -Value "$dotfiles\msys\.bash_profile" -Force
New-Item -Path "$HOME\.profile" -ItemType SymbolicLink -Value "$dotfiles\msys\profile" -Force
New-Item -Path "$HOME\.zshrc" -ItemType SymbolicLink -Value "$dotfiles\msys\.zshrc" -Force
New-Item -Path "$HOME\.zshenv" -ItemType SymbolicLink -Value "$dotfiles\msys\zshenv" -Force
New-Item -Path "$HOME\.oh-my-zsh" -ItemType SymbolicLink -Value "$dotfiles\msys\oh-myzsh" -Force
New-Item -Path "$env:APPDATA\nushell" -ItemType SymbolicLink -Value "$dotfiles\nushell" -Force
New-Item -Path "$env:APPDATA\elvish\rc.elv" -ItemType SymbolicLink -Value "$dotfiles\rc.elv" -Force
New-Item -Path "$env:APPDATA\lapce\Lapce-Stable\config" -ItemType SymbolicLink -Value "$dotfiles\lapce" -Force
New-Item -Path "$env:APPDATA\alacritty\alacritty.yml" -ItemType SymbolicLink -Value "$dotfiles\alacritty.windows.yml" -Force
New-Item -Path "$env:APPDATA\Code\User\settings.json" -ItemType SymbolicLink -Value "$dotfiles\code.settings.json" -Force
New-Item -Path "$env:APPDATA\yt-dlp\config" -ItemType SymbolicLink -Value "$dotfiles\yt-dlp.config" -Force
New-Item -Path "$env:APPDATA\Sublime Text\Packages\User" -ItemType SymbolicLink -Value "$dotfiles\sublime" -Force
New-Item -Path "$env:APPDATA\tabby\config.yaml" -ItemType SymbolicLink -Value "$dotfiles\tabby.yaml" -Force
New-Item -Path "$env:APPDATA\Notepad++" -ItemType SymbolicLink -Value "$dotfiles\notepad" -Force

$profile_path = $PROFILE.CurrentUserAllHosts
. $profile_path

# Install Doom 
$doom_emacs = "$env:APPDATA\.emacs.d"
git clone --depth 1 https://github.com/doomemacs/doomemacs.git $doom_emacs
New-Item -Path $HOME\.emacs.d -ItemType SymbolicLink -Value $doom_emacs -Force
New-Item -Path "$HOME\.doom.d" -ItemType SymbolicLink -Value "$dotfiles\doom" -Force
New-Item -Path "$env:APPDATA\.doom.d" -ItemType SymbolicLink -Value "$dotfiles\doom" -Force

# Install SpaceVim
$space_vim = "$env:LOCALAPPDATA\SpaceVim"
git clone https://github.com/SpaceVim/SpaceVim.git $space_vim
New-Item -Path $HOME\vimfiles -ItemType SymbolicLink -Value $space_vim -Force
New-Item -Path "$HOME\.SpaceVim.d" -ItemType SymbolicLink -Value "$dotfiles\space" -Force

# Install AstroNvim
$astro_nvim = "$env:LOCALAPPDATA\nvim"
git clone --depth 1 https://github.com/AstroNvim/AstroNvim $astro_nvim
New-Item -Path "$astro_nvim\lua\user" -ItemType SymbolicLink -Value "$dotfiles\astro"  -Force

## Additional Steps move Home to D:\
# New-Item -Path "$HOME\Desktop" -ItemType SymbolicLink -Value "D:\Desktop" -Force
# New-Item -Path "$HOME\Documents" -ItemType SymbolicLink -Value "D:\Documents" -Force
# New-Item -Path "$HOME\Downloads" -ItemType SymbolicLink -Value "D:\Downloads" -Force
# New-Item -Path "$HOME\Music" -ItemType SymbolicLink -Value "D:\Music" -Force
# New-Item -Path "$HOME\Pictures" -ItemType SymbolicLink -Value "D:\Pictures" -Force
# New-Item -Path "$HOME\Source" -ItemType SymbolicLink -Value "D:\Source" -Force
# New-Item -Path "$HOME\Videos" -ItemType SymbolicLink -Value "D:\Videos" -Force
