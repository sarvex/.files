# Install all apps
winget import --import-file "$dotfiles\winget.apps.json" --disable-interactivity
scoop import "$dotfiles\scoop.apps.json"
