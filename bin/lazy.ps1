#Requires -Version 7.1
$ErrorActionPreference = "Stop" # exit when command fails

# $env:XDG_DATA_HOME = $env:XDG_DATA_HOME ?? $env:APPDATA
# $env:XDG_CONFIG_HOME = $env:XDG_CONFIG_HOME ?? $env:LOCALAPPDATA
# $env:XDG_CACHE_HOME = $env:XDG_CACHE_HOME ?? $env:TEMP

# $env:CHADVIM_RUNTIME_DIR = $env:CHADVIM_RUNTIME_DIR ?? "$env:XDG_DATA_HOME\nvchad"
# $env:CHADVIM_CONFIG_DIR = $env:CHADVIM_CONFIG_DIR ?? "$env:XDG_CONFIG_HOME\cvim"
# $env:CHADVIM_CACHE_DIR = $env:CHADVIM_CACHE_DIR ?? "$env:XDG_CACHE_HOME\cvim"
# $env:CHADVIM_BASE_DIR = $env:CHADVIM_BASE_DIR ?? "$env:CHADVIM_RUNTIME_DIR\cvim"

$env:NVIM_APPNAME = "lazy"

# nvim -u "$env:CHADVIM_BASE_DIR\init.lua" @args
nvim @args
