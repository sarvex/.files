Import-Module Terminal-Icons
Invoke-Expression (&scoop-search-multisource.exe --hook)
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/capr4n.omp.json" | Invoke-Expression

Set-Alias lvim 'C:\Users\Yoga\.local\bin\lvim.ps1'
