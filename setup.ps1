Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

# Install Winget
winget upgrade --all
@('Microsoft.VisualStudioCode', 'Microsoft.Powershell', 'Microsoft.Git', 'Microsoft.VFSforGit', 'Microsoft.DotNet.SDK.7', 'Microsoft.VisualStudio.2022.Enterprise', 'Microsoft.WingetCreate', 'Microsoft.WindowsWDK', 'Nushell.Nushell', 'GitHub.cli', 'GLab.GLab', 'SublimeHQ.SublimeText.4', 'Vim.Vim', 'Neovide.Neovide', 'Discord.Discord', 'Brave.Brave', 'Mozilla.Firefox', 'Google.Chrome', 'eloston.ungoogled-chromium', 'TorProject.TorBrowser', 'VivaldiTechnologies.Vivaldi', 'Notepad++.Notepad++', 'VideoLAN.VLC', 'SMPlayer.SMPlayer', 'Avidemux.Avidemux', 'GIMP.GIMP', 'KDE.Krita', 'BlenderFoundation.Blender', 'Inkscape.Inkscape', 'Audacity.Audacity') | ForEach-Object { winget install $_ }

# Install scoop
Invoke-WebRequest get.scoop.sh -UseBasicParsing | Invoke-Expression
@('extras', 'games', 'nerd-fonts', 'versions') | ForEach-Object { scoop bucket add $_ }
scoop bucket add sarvex https://github.com/sarvex/scoop
scoop install sudo aria2 curl grep sed less touch wget pnpm yarn gzip search-multisource terminal-icons starship ripgrep deno lazygit bottom bat dust mprocs fd fzf ripgrep helix llvm emacs nodejs ruby perl php julia go mambaforge make cmake premake xmake godot defold ccache sccache bazel bazel-buildtools clangd rustup scala kotlin kotlin-native gradle-bin kotlin-language-server erlang haskell luarocks luacheck luajit lua love elixir elm nim racket lua-language-server ffmpeg yt-dlp godot godot-mono clj-deps clojure-lsp openjdk tree-sitter tree-sitter-langs AurulentSansMono-nerd-font Agave-nerd-font AnonymousPro-nerd-font BitstreamVeraSansMono-nerd-font CascadiaCode CascadiaCode-nerd-font CodeNewRoman-nerd-font ComicShannsMono-nerd-font Cousine-nerd-font DejaVuSansMono-nerd-font DroidSansMono-nerd-font FantasqueSansMono-nerd-font FiraCode-nerd-font Go-Mono-nerd-font Gohu-nerd-font Hack-nerd-font Hasklig-nerd-font iA-Writer-nerd-font IBMPlexMono-nerd-font Inconsolata-nerd-font InconsolataGo-nerd-font Iosevka-nerd-font IosevkaTerm-nerd-font JetBrainsMono-nerd-font LiberationMono-nerd-font Lilex-nerd-font Meslo-nerd-font Overpass-nerd-font Monofur-nerd-font Monoid-nerd-font Mononoki-nerd-font Noto-nerd-font ProFont-nerd-font ProggyClean-nerd-font RobotoMono-nerd-font SourceCodePro-nerd-font SpaceMono-nerd-font ShareTechMono-nerd-font Tinos-nerd-font Terminus-nerd-font UbuntuMono-nerd-font
sudo Add-MpPreference -ExclusionPath "${env:ProgramData}\Scoop\", "${env:USERPROFILE}\Scoop\" -Force

# Add PyEnv
Invoke-WebRequest -UseBasicParsing -Uri "https://raw.githubusercontent.com/pyenv-win/pyenv-win/master/pyenv-win/install-pyenv-win.ps1" -OutFile "./install-pyenv-win.ps1"; &"./install-pyenv-win.ps1"

# Fetch DotFiles
$dotfiles = "$HOME\.files"
git clone https://github.com/sarvex/dotfiles $dotfiles

# Add Custom Directories
New-Item -Path "$HOME\.config" -ItemType SymbolicLink -Value "$dotfiles\config" -Force
New-Item -Path "$HOME\.cache\starship" -ItemType SymbolicLink -Value "$dotfiles\starship" -Force
New-Item -Path "$HOME\.aliases" -ItemType SymbolicLink -Value "$dotfiles\aliases" -Force
New-Item -Path "$HOME\.gitconfig" -ItemType SymbolicLink -Value "$dotfiles\git.config" -Force
New-Item -Path "$HOME\.wezterm.lua" -ItemType SymbolicLink -Value "$dotfiles\wezterm.lua" -Force
New-Item -Path "$HOME\.xonshrc" -ItemType SymbolicLink -Value "$dotfiles\xonsh.rc" -Force
New-Item -Path "$HOME\.bashrc" -ItemType SymbolicLink -Value "$dotfiles\msys\.bashrc" -Force
New-Item -Path "$HOME\.bash_profile" -ItemType SymbolicLink -Value "$dotfiles\msys\.bash_profile" -Force
New-Item -Path "$HOME\.profile" -ItemType SymbolicLink -Value "$dotfiles\msys\profile" -Force
New-Item -Path "$HOME\.zshrc" -ItemType SymbolicLink -Value "$dotfiles\msys\.zshrc" -Force
New-Item -Path "$HOME\.zshenv" -ItemType SymbolicLink -Value "$dotfiles\msys\zshenv" -Force
New-Item -Path "$HOME\.oh-my-zsh" -ItemType SymbolicLink -Value "$dotfiles\msys\oh-myzsh" -Force

# Add Links
New-Item -Path "$env:APPDATA\alacritty\alacritty.yml" -ItemType SymbolicLink -Value "$dotfiles\alacritty.windows.yml" -Force
New-Item -Path "$env:APPDATA\tabby\config.yaml" -ItemType SymbolicLink -Value "$dotfiles\tabby.yaml" -Force
New-Item -Path "$env:APPDATA\nushell" -ItemType SymbolicLink -Value "$dotfiles\nushell" -Force
New-Item -Path "$env:APPDATA\elvish\rc.elv" -ItemType SymbolicLink -Value "$dotfiles\rc.elv" -Force
New-Item -Path "$env:APPDATA\lapce\Lapce-Stable\config" -ItemType SymbolicLink -Value "$dotfiles\lapce" -Force
New-Item -Path "$env:APPDATA\Code\User\settings.json" -ItemType SymbolicLink -Value "$dotfiles\config\vscode\settings.json" -Force
New-Item -Path "$env:APPDATA\Code\User\keybindings.json" -ItemType SymbolicLink -Value "$dotfiles\config\vscode\settings.json" -Force
New-Item -Path "$env:APPDATA\helix" -ItemType SymbolicLink -Value "$dotfiles\helix" -Force
New-Item -Path "$env:APPDATA\VSCodium\User\settings.json" -ItemType SymbolicLink -Value "$dotfiles\config\vscodium\settings.json" -Force
New-Item -Path "$env:APPDATA\VSCodium\User\keybindings.json" -ItemType SymbolicLink -Value "$dotfiles\config\vscodium\keybindings.json" -Force
New-Item -Path "$env:APPDATA\Sublime Text\Packages\User" -ItemType SymbolicLink -Value "$dotfiles\sublime" -Force
New-Item -Path "$env:APPDATA\neovide" -ItemType SymbolicLink -Value "$dotfiles\neovide" -Force
New-Item -Path "$env:APPDATA\Notepad++" -ItemType SymbolicLink -Value "$dotfiles\notepad" -Force
New-Item -Path "$env:APPDATA\yt-dlp\config" -ItemType SymbolicLink -Value "$dotfiles\yt-dlp.config" -Force

New-Item -Path "$env:LOCALAPPDATA\nvim" -ItemType SymbolicLink -Value "$dotfiles\nvim" -Force

# Install LazyVim
$lazy = "$env:LOCALAPPDATA\nvim"
# $lazy = "$env:LOCALAPPDATA\lazy"
New-Item -Path "$lazy" -ItemType SymbolicLink -Value "$dotfiles\lazy" -Force

$profile_path = $PROFILE.CurrentUserAllHosts
New-Item -Path "$profile_path" -ItemType SymbolicLink -Value "$dotfiles\Profile.ps1" -Force
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

# Install LunarVim
$lvim = "$env:LOCALAPPDATA\lvim"
Invoke-WebRequest https://raw.githubusercontent.com/Lunar/LunarVim/main/utils/installer/install.ps1 -UseBasicParsing | Invoke-Expression
New-Item -Path "$lvim" -ItemType SymbolicLink -Value "$dotfiles\lunar" -Force

# Install Nvoid
$nvoid = "$env:LOCALAPPDATA\nvoid"
Invoke-WebRequest https://raw.githubusercontent.com/nvoid-lua/nvoid/main/utils/installer/install.ps1 -UseBasicParsing | Invoke-Expression
New-Item -Path "$nvoid" -ItemType SymbolicLink -Value "$dotfiles\lunar" -Force

# Install AstroNvim
$astro = "$env:LOCALAPPDATA\astro"
git clone --depth 1 git@github.com:sarvex/AstroNvim.git $astro
New-Item -Path "$astro\lua\user" -ItemType SymbolicLink -Value "$dotfiles\astro" -Force

# Install Code Art
$cart = "$env:LOCALAPPDATA\cart"
git clone --depth 1 https://github.com/artart222/CodeArt $cart
New-Item -Path "$cart\lua\user_settings" -ItemType SymbolicLink -Value "$dotfiles\cart" -Force

# Install Chad
$chad = "$env:LOCALAPPDATA\chad"
git clone --depth 1 git@github.com:sarvex/NvChad.git $chad
New-Item -Path "$chad\lua\custom" -ItemType SymbolicLink -Value "$dotfiles\chad" -Force

# Install CosmicNvim
$cosmic = "$env:LOCALAPPDATA\cosmic"
git clone --depth 1 git@github.com:sarvex/CosmicNvim.git $cosmic
New-Item -Path "$cosmic\lua\cosmic\config" -ItemType SymbolicLink -Value "$dotfiles\cosmic" -Force

# Install Kickstarter
$kick = "$env:LOCALAPPDATA\kick"
git clone --depth 1 https://github.com/kickVim/starter $kick
New-Item -Path "$kick" -ItemType SymbolicLink -Value "$dotfiles\kick" -Force

# Install NV-IDE
$nvide = "$env:LOCALAPPDATA\nvide"
git clone --depth 1 https://github.com/crivotz/nv-ide.git $nvide
New-Item -Path "$nvide\lua\nvide\config" -ItemType SymbolicLink -Value "$dotfiles\nvide" -Force

# Install Nyoom
$nyoom = "$env:LOCALAPPDATA\nyoom"
git clone --depth 1 https://github.com/nyoom-engineering/nyoom.nvim $nyoom
New-Item -Path "$nyoom\lua\custom" -ItemType SymbolicLink -Value "$dotfiles\nyoom" -Force

# Install Nabhi
$nabhi = "$env:LOCALAPPDATA\nabhi"
git clone --depth 1 https://github.com/sarvex/nabhi.git $nabhi
New-Item -Path "$nabhi\lua\user" -ItemType SymbolicLink -Value "$dotfiles\nabhi" -Force

## Additional Steps move Home to D:\
New-Item -Path "$HOME\Desktop" -ItemType SymbolicLink -Value "D:\Desktop" -Force
New-Item -Path "$HOME\Documents" -ItemType SymbolicLink -Value "D:\Documents" -Force
New-Item -Path "$HOME\Downloads" -ItemType SymbolicLink -Value "D:\Downloads" -Force
New-Item -Path "$HOME\Music" -ItemType SymbolicLink -Value "D:\Music" -Force
New-Item -Path "$HOME\Pictures" -ItemType SymbolicLink -Value "D:\Pictures" -Force
New-Item -Path "$HOME\Source" -ItemType SymbolicLink -Value "D:\Source" -Force
New-Item -Path "$HOME\Videos" -ItemType SymbolicLink -Value "D:\Videos" -Force
New-Item -Path "$HOME\Youtube" -ItemType SymbolicLink -Value "D:\Youtube" -Force
