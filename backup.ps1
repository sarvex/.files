# Backup Applications from Winget and Scoop
$dotfiles = "$HOME\.files"

winget export --output "$dotfiles\winget.apps.json" --source winget --disable-interactivity
scoop export --config > "$dotfiles\scoop.apps.json"
