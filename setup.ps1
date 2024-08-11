Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

# Install Winget
winget upgrade --all
@('Microsoft.Git', 'Microsoft.VisualStudioCode', 'Microsoft.Powershell', 'JanDeDobbeleer.OhMyPosh', 'Microsoft.VisualStudio.2022.Enterprise', 'Docker.DockerDesktop', 'Microsoft.OpenJDK.21', 'SublimeHQ.SublimeText.4', 'Neovide.Neovide', 'Discord.Discord', 'Brave.Brave', 'Mozilla.Firefox', 'Google.Chrome', 'eloston.ungoogled-chromium', 'VivaldiTechnologies.Vivaldi', 'Notepad++.Notepad++', 'VideoLAN.VLC', 'SMPlayer.SMPlayer', 'Avidemux.Avidemux', 'GIMP.GIMP', 'KDE.Krita', 'BlenderFoundation.Blender', 'Inkscape.Inkscape', 'Audacity.Audacity', 'OBSProject.OBSStudio', 'KDE.Kdenlive') | ForEach-Object { winget install $_ }

# Install scoop
Invoke-WebRequest get.scoop.sh -UseBasicParsing | Invoke-Expression
@('extras', 'games', 'java', 'nerd-fonts', 'versions') | ForEach-Object { scoop bucket add $_ }
scoop bucket add sarvex https://github.com/sarvex/scoop
scoop install 7zip actionlint aria2 aspell azure-cli azure-functions-core-tools azure-kubelogin azure-ps bat bazel bazel-buildtools biber bottom bun ccache clj-deps clojure-lsp cmake composer curl dart defold deno deno deno-lint doxygen dust elixir elm emacs emscripten erlang fd ffmpeg flutter fzf git github gitlab-release-cli gitlab-runner glab glslang go godot golangci-lint graalvm graalvm-oracle-jdk gradle gradle-bin grep gzip hadolint haskell haskell-cabal helix jdtls jq julia kafka kafka-exporter kotlin kotlin-language-server kotlin-native ktlint kube-linter lazygit less libxml2 llvm love lua lua-language-server luacheck luajit luarocks make mambaforge mariadb maven meson miktex mingw mprocs msys2 neovim nim ninja nodejs nodejs nu nu openjdk php poetry postgresql postgrest premake protolint psgithub python quick-lint-js racket redis redis-tui revive ripgrep ripgrep ruby rustup sbt scala scala-cli sccache search-multisource sed solidity spark starship sudo swift teal terminal-icons temurin-jdk terraform tflint tidy touch tree-sitter tree-sitter-langs unzip vale vcpkg wget xmake xmllint yt-dlp zookeeper
scoop install 0xProto-nerd-font Agave-nerd-font AnonymousPro-nerd-font AurulentSansMono-nerd-font BitstreamVeraSansMono-nerd-font CascadiaCode-nerd-font CascadiaMono-nerd-font CodeNewRoman-nerd-font ComicShannsMono-nerd-font CommitMono-nerd-font Cousine-nerd-font D2Coding-nerd-font DejaVuSansMono-nerd-font DroidSansMono-nerd-font EnvyCodeR-nerd-font FantasqueSansMono-nerd-font FiraCode-nerd-font GeistMono-nerd-font Go-Mono-nerd-font Gohu-nerd-font Hack-nerd-font Hasklig-nerd-font iA-Writer-nerd-font IBMPlexMono-nerd-font Inconsolata-nerd-font InconsolataGo-nerd-font IntelOneMono-nerd-font Iosevka-nerd-font IosevkaTerm-nerd-font IosevkaTermSlab-nerd-font JetBrainsMono-nerd-font LiberationMono-nerd-font Lilex-nerd-font MartianMono-nerd-font Meslo-nerd-font Monofur-nerd-font Monoid-nerd-font Mononoki-nerd-font Monaspace-nerd-font Noto-nerd-font Overpass-nerd-font ProFont-nerd-font ProggyClean-nerd-font Recursive-nerd-font RobotoMono-nerd-font ShareTechMono-nerd-font SourceCodePro-nerd-font SpaceMono-nerd-font Terminus-nerd-font Tinos-nerd-font Ubuntu-nerd-font UbuntuMono-nerd-font UbuntuSans-nerd-font VictorMono-nerd-font ZedMono-nerd-font
scoop install
sudo Add-MpPreference -ExclusionPath "${env:ProgramData}\Scoop\", "${env:USERPROFILE}\Scoop\" -Force

# Add global NPM packages
corepack enable
pnpm install -g @fsouza/prettierd alex bibtex dotenv-linter eslint_d haml jshint lint-staged neovim node-actionlint protoc semistandard shellcheck solhint spectre standard stylelint swiftlint textlint typescript write-good

python -m pip install --upgrade pip poetry jupyterlab notebook voila pandas pyspark

# Add PyEnv
Invoke-WebRequest -UseBasicParsing -Uri "https://raw.githubusercontent.com/pyenv-win/pyenv-win/master/pyenv-win/install-pyenv-win.ps1" -OutFile "./install-pyenv-win.ps1"; &"./install-pyenv-win.ps1"

# Fetch DotFiles
$dotfiles = "$HOME\.files"
git clone https://github.com/sarvex/dotfiles $dotfiles

# Add Custom Directories
New-Item -Path "$HOME\.config" -ItemType SymbolicLink -Value "$HOME\.files\config" -Force
New-Item -Path "$HOME\.cache\starship" -ItemType SymbolicLink -Value "$HOME\.files\starship" -Force
New-Item -Path "$HOME\.aliases" -ItemType SymbolicLink -Value "$HOME\.files\aliases" -Force
New-Item -Path "$HOME\.gitconfig" -ItemType SymbolicLink -Value "$HOME\.files\git.config" -Force
New-Item -Path "$HOME\.wezterm.lua" -ItemType SymbolicLink -Value "$HOME\.files\wezterm.lua" -Force
New-Item -Path "$HOME\.xonshrc" -ItemType SymbolicLink -Value "$HOME\.files\xonsh.rc" -Force

# Add Links
New-Item -Path "$env:APPDATA\alacritty\alacritty.yml" -ItemType SymbolicLink -Value "$HOME\.files\alacritty.windows.yml" -Force
New-Item -Path "$env:APPDATA\tabby\config.yaml" -ItemType SymbolicLink -Value "$HOME\.files\tabby.yaml" -Force
New-Item -Path "$env:APPDATA\elvish\rc.elv" -ItemType SymbolicLink -Value "$HOME\.files\rc.elv" -Force
New-Item -Path "$env:APPDATA\lapce\Lapce-Stable\config" -ItemType SymbolicLink -Value "$HOME\.files\lapce" -Force
New-Item -Path "$env:APPDATA\Code\User\settings.json" -ItemType SymbolicLink -Value "$HOME\.files\vscode\settings.json" -Force
New-Item -Path "$env:APPDATA\Code\User\keybindings.json" -ItemType SymbolicLink -Value "$HOME\.files\vscode\keybindings.json" -Force
New-Item -Path "$env:APPDATA\Code - Insiders\User\settings.json" -ItemType SymbolicLink -Value "$HOME\.files\vscode-insiders\settings.json" -Force
New-Item -Path "$env:APPDATA\Code - Insiders\User\keybindings.json" -ItemType SymbolicLink -Value "$HOME\.files\vscode-insiders\keybindings.json" -Force
New-Item -Path "$env:APPDATA\VSCodium\User\settings.json" -ItemType SymbolicLink -Value "$HOME\.files\vscodium\settings.json" -Force
New-Item -Path "$env:APPDATA\VSCodium\User\keybindings.json" -ItemType SymbolicLink -Value "$HOME\.files\vscodium\keybindings.json" -Force

New-Item -Path "$env:APPDATA\nushell" -ItemType SymbolicLink -Value "$HOME\.files\nushell" -Force
New-Item -Path "$env:APPDATA\helix" -ItemType SymbolicLink -Value "$HOME\.files\helix" -Force
New-Item -Path "$env:APPDATA\Sublime Text\Packages\User" -ItemType SymbolicLink -Value "$HOME\.files\sublime" -Force
New-Item -Path "$env:APPDATA\neovide" -ItemType SymbolicLink -Value "$HOME\.files\neovide" -Force
New-Item -Path "$env:APPDATA\Notepad++" -ItemType SymbolicLink -Value "$HOME\.files\notepad" -Force
New-Item -Path "$env:APPDATA\yt-dlp\config" -ItemType SymbolicLink -Value "$HOME\.files\yt-dlp.config" -Force

$profile_path = $PROFILE.CurrentUserAllHosts
New-Item -Path "$profile_path" -ItemType SymbolicLink -Value "$HOME\.files\Profile.ps1" -Force
. $profile_path

# Install Doom
$doom = "$env:APPDATA\.emacs.d"
git clone --depth 1 https://github.com/doomemacs/doomemacs.git $doom
New-Item -Path $HOME\.emacs.d -ItemType SymbolicLink -Value $doom -Force
New-Item -Path "$HOME\.doom.d" -ItemType SymbolicLink -Value "$HOME\.files\doom" -Force
New-Item -Path "$env:APPDATA\.doom.d" -ItemType SymbolicLink -Value "$HOME\.files\doom" -Force
"$HOME\.emacs.d\doom sync"

# Install SpaceVim
$space_vim = "$env:LOCALAPPDATA\SpaceVim"
git clone https://gitlab.com/SpaceVim/SpaceVim.git $space_vim
New-Item -Path $HOME\vimfiles -ItemType SymbolicLink -Value $space_vim -Force
New-Item -Path "$HOME\.SpaceVim.d" -ItemType SymbolicLink -Value "$HOME\.files\space" -Force

New-Item -Path "$env:LOCALAPPDATA\nvim" -ItemType SymbolicLink -Value "$HOME\.files\nvim" -Force

# Install LazyVim
$lazy = "$env:LOCALAPPDATA\nvim"
# $lazy = "$env:LOCALAPPDATA\lazy"
# git clone https://github.com/LazyVim/starter "$env:LOCALAPPDATA\nvim"
New-Item -Path "$lazy" -ItemType SymbolicLink -Value "$HOME\.files\lazy" -Force

# Install LunarVim
$lvim = "$env:LOCALAPPDATA\lvim"
Invoke-WebRequest https://raw.githubusercontent.com/Lunar/LunarVim/main/utils/installer/install.ps1 -UseBasicParsing | Invoke-Expression
New-Item -Path "$lvim" -ItemType SymbolicLink -Value "$HOME\.files\lunar" -Force

# Install Nvoid
$nvoid = "$env:LOCALAPPDATA\nvoid"
Invoke-WebRequest https://raw.githubusercontent.com/nvoid-lua/nvoid/main/utils/installer/install.ps1 -UseBasicParsing | Invoke-Expression
New-Item -Path "$nvoid" -ItemType SymbolicLink -Value "$HOME\.files\lunar" -Force

# Install AstroNvim
$astro = "$env:LOCALAPPDATA\astro"
git clone --depth 1 git@github.com:sarvex/AstroNvim.git $astro
New-Item -Path "$astro\lua\user" -ItemType SymbolicLink -Value "$HOME\.files\astro" -Force

# Install Code Art
$cart = "$env:LOCALAPPDATA\cart"
git clone --depth 1 https://github.com/artart222/CodeArt $cart
New-Item -Path "$cart\lua\user_settings" -ItemType SymbolicLink -Value "$HOME\.files\cart" -Force

# Install Chad
$chad = "$env:LOCALAPPDATA\chad"
git clone --depth 1 git@github.com:sarvex/NvChad.git $chad
New-Item -Path "$chad\lua\custom" -ItemType SymbolicLink -Value "$HOME\.files\chad" -Force

# Install CosmicNvim
$cosmic = "$env:LOCALAPPDATA\cosmic"
git clone --depth 1 git@github.com:sarvex/CosmicNvim.git $cosmic
New-Item -Path "$cosmic\lua\cosmic\config" -ItemType SymbolicLink -Value "$HOME\.files\cosmic" -Force

# Install Kickstarter
$kick = "$env:LOCALAPPDATA\kick"
git clone --depth 1 https://github.com/kickVim/starter $kick
New-Item -Path "$kick" -ItemType SymbolicLink -Value "$HOME\.files\kick" -Force

# Install NV-IDE
$nvide = "$env:LOCALAPPDATA\nvide"
git clone --depth 1 https://github.com/crivotz/nv-ide.git $nvide
New-Item -Path "$nvide\lua\nvide\config" -ItemType SymbolicLink -Value "$HOME\.files\nvide" -Force

# Install Nyoom
$nyoom = "$env:LOCALAPPDATA\nyoom"
git clone --depth 1 https://github.com/nyoom-engineering/nyoom.nvim $nyoom
New-Item -Path "$nyoom\lua\custom" -ItemType SymbolicLink -Value "$HOME\.files\nyoom" -Force

# Install Nabhi
$nabhi = "$env:LOCALAPPDATA\nabhi"
git clone --depth 1 https://github.com/sarvex/nabhi.git $nabhi
New-Item -Path "$nabhi\lua\user" -ItemType SymbolicLink -Value "$HOME\.files\nabhi" -Force

## Additional Steps move Home to D:\
New-Item -Path "$HOME\Desktop" -ItemType SymbolicLink -Value "D:\Desktop" -Force
New-Item -Path "$HOME\Documents" -ItemType SymbolicLink -Value "D:\Documents" -Force
New-Item -Path "$HOME\Downloads" -ItemType SymbolicLink -Value "D:\Downloads" -Force
New-Item -Path "$HOME\Music" -ItemType SymbolicLink -Value "D:\Music" -Force
New-Item -Path "$HOME\Pictures" -ItemType SymbolicLink -Value "D:\Pictures" -Force
New-Item -Path "$HOME\Sources" -ItemType SymbolicLink -Value "D:\Sources" -Force
New-Item -Path "$HOME\Videos" -ItemType SymbolicLink -Value "D:\Videos" -Force
New-Item -Path "$HOME\Youtube" -ItemType SymbolicLink -Value "D:\Youtube" -Force
