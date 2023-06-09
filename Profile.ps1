Import-Module Terminal-Icons
Invoke-Expression (&scoop-search-multisource.exe --hook)
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/capr4n.omp.json" | Invoke-Expression

Set-Alias lvim 'C:\Users\Yoga\.files\bin\lvim.ps1'
Set-Alias avim 'C:\Users\Yoga\.files\bin\avim.ps1'
Set-Alias cvim 'C:\Users\Yoga\.files\bin\cvim.ps1'
