# Backup Applications from Winget and Scoop
$dotfiles = "$HOME\.files"

winget export --export-file "$dotfiles\winget.apps.json"
scoop export "$dotfiles\scoop.apps.json"
