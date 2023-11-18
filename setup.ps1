Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

# Install Winget
winget upgrade --all
@('Microsoft.VisualStudioCode', 'Microsoft.Powershell', 'Microsoft.Git', 'Microsoft.VFSforGit', 'Microsoft.VisualStudio.2022.Enterprise', 'Docker.DockerDesktop', 'Microsoft.OpenJDK.21', 'OpenJS.NodeJS', 'Nushell.Nushell', 'GitHub.cli', 'GLab.GLab', 'SublimeHQ.SublimeText.4', 'NeovideNeovide', 'Discord.Discord', 'Brave.Brave', 'Mozilla.Firefox', 'Google.Chrome', 'eloston.ungoogled-chromium', 'VivaldiTechnologies.Vivaldi', 'Notepad++.Notepad++', 'VideoLAN.VLC', 'SMPlayer.SMPlayer', 'Avidemux.Avidemux', 'GIMP.GIMP', 'KDE.Krita', 'BlenderFoundation.Blender', 'Inkscape.Inkscape', 'Audacity.Audacity', 'OBSProject.OBSStudio', 'KDE.Kdenlive') | ForEach-Object { winget install $_ }

# Install scoop
Invoke-WebRequest get.scoop.sh -UseBasicParsing | Invoke-Expression
@('extras', 'games', 'java', 'nerd-fonts', 'versions') | ForEach-Object { scoop bucket add $_ }
scoop bucket add sarvex https://github.com/sarvex/scoop
scoop install Agave-nerd-font AnonymousPro-nerd-font aria2 aspell AurulentSansMono-nerd-font bat bazel bazel-buildtools BitstreamVeraSansMono-nerd-font bottom CascadiaCode CascadiaCode-nerd-font ccache clangd clj-deps clojure-lsp cmake CodeNewRoman-nerd-font ComicShannsMono-nerd-font composer Cousine-nerd-font crystal curl defold DejaVuSansMono-nerd-font deno DroidSansMono-nerd-font dust elixir elm emacs erlang FantasqueSansMono-nerd-font fd ffmpeg FiraCode-nerd-font fzf go Go-Mono-nerd-font godot Gohu-nerd-font gradle-bin grep gzip Hack-nerd-font haskell Hasklig-nerd-font helix iA-Writer-nerd-font IBMPlexMono-nerd-font Inconsolata-nerd-font InconsolataGo-nerd-font Iosevka-nerd-font IosevkaTerm-nerd-font JetBrainsMono-nerd-font julia kotlin kotlin-language-server kotlin-native lazygit less LiberationMono-nerd-font Lilex-nerd-font llvm love lua lua-language-server luacheck luajit luarocks make mambaforge Meslo-nerd-font miktex mingw Monofur-nerd-font Monoid-nerd-font Mononoki-nerd-font mprocs msys2 neovim-nightly nim nodejs Noto-nerd-font openjdk Overpass-nerd-font php premake ProFont-nerd-font ProggyClean-nerd-font racket ripgrep ripgrep RobotoMono-nerd-font ruby rustup scala sccache search-multisource sed ShareTechMono-nerd-font SourceCodePro-nerd-font SpaceMono-nerd-font starship sudo terminal-icons Terminus-nerd-font terraform tidy Tinos-nerd-font touch tree-sitter tree-sitter-langs UbuntuMono-nerd-font unzip vale wget xmake yt-dlp
sudo Add-MpPreference -ExclusionPath "${env:ProgramData}\Scoop\", "${env:USERPROFILE}\Scoop\" -Force

# Add global NPM packages
pnpm install -g '@fsouza/prettierd alex ansible bibtex cfn-lint clj-kondo curlylint djlint dotenv-linter erb-linter eslint_d gdlint golangci-lint haml jshint jsonlint lint-staged markuplint misspell neovim node-actionlint proselint protoc pug-lint remark remark-mdx semgrep semistandard shellcheck solhint spectre standard stylelint swiftlint textlint typescript typos vacuum verilator vint write-good yaml'

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

# Add Links
New-Item -Path "$env:APPDATA\alacritty\alacritty.yml" -ItemType SymbolicLink -Value "$dotfiles\alacritty.windows.yml" -Force
New-Item -Path "$env:APPDATA\tabby\config.yaml" -ItemType SymbolicLink -Value "$dotfiles\tabby.yaml" -Force
New-Item -Path "$env:APPDATA\nushell" -ItemType SymbolicLink -Value "$dotfiles\nushell" -Force
New-Item -Path "$env:APPDATA\elvish\rc.elv" -ItemType SymbolicLink -Value "$dotfiles\rc.elv" -Force
New-Item -Path "$env:APPDATA\lapce\Lapce-Stable\config" -ItemType SymbolicLink -Value "$dotfiles\lapce" -Force
New-Item -Path "$env:APPDATA\Code\User\settings.json" -ItemType SymbolicLink -Value "$dotfiles\config\vscode\settings.json" -Force
New-Item -Path "$env:APPDATA\Code\User\keybindings.json" -ItemType SymbolicLink -Value "$dotfiles\config\vscode\keybindings.json" -Force
New-Item -Path "$env:APPDATA\Code - Insiders\User\settings.json" -ItemType SymbolicLink -Value "$dotfiles\config\vscode-insiders\settings.json" -Force
New-Item -Path "$env:APPDATA\Code - Insiders\User\keybindings.json" -ItemType SymbolicLink -Value "$dotfiles\config\vscode-insiders\keybindings.json" -Force
New-Item -Path "$env:APPDATA\helix" -ItemType SymbolicLink -Value "$dotfiles\helix" -Force
New-Item -Path "$env:APPDATA\VSCodium\User\settings.json" -ItemType SymbolicLink -Value "$dotfiles\config\vscodium\settings.json" -Force
New-Item -Path "$env:APPDATA\VSCodium\User\keybindings.json" -ItemType SymbolicLink -Value "$dotfiles\config\vscodium\keybindings.json" -Force
New-Item -Path "$env:APPDATA\Sublime Text\Packages\User" -ItemType SymbolicLink -Value "$dotfiles\config\sublime" -Force
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
$doom = "$env:APPDATA\.emacs.d"
git clone --depth 1 https://github.com/doomemacs/doomemacs.git $doom
New-Item -Path $HOME\.emacs.d -ItemType SymbolicLink -Value $doom -Force
New-Item -Path "$HOME\.doom.d" -ItemType SymbolicLink -Value "$dotfiles\doom" -Force
New-Item -Path "$env:APPDATA\.doom.d" -ItemType SymbolicLink -Value "$dotfiles\doom" -Force
$HOME\.emacs.d\doom sync

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
New-Item -Path "$HOME\Sources" -ItemType SymbolicLink -Value "D:\Sources" -Force
New-Item -Path "$HOME\Videos" -ItemType SymbolicLink -Value "D:\Videos" -Force
New-Item -Path "$HOME\Youtube" -ItemType SymbolicLink -Value "D:\Youtube" -Force
