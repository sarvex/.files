Import-Module Terminal-Icons
Import-Module gsudoModule
Invoke-Expression (&scoop-search-multisource.exe --hook)
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/capr4n.omp.json" | Invoke-Expression
