#Requires -Version 7.1
$ErrorActionPreference = "Stop" # exit when command fails

# $env:XDG_DATA_HOME = $env:XDG_DATA_HOME ?? $env:APPDATA
# $env:XDG_CONFIG_HOME = $env:XDG_CONFIG_HOME ?? $env:LOCALAPPDATA
# $env:XDG_CACHE_HOME = $env:XDG_CACHE_HOME ?? $env:TEMP

# $env:ASTRONVIM_RUNTIME_DIR = $env:ASTRONVIM_RUNTIME_DIR ?? "$env:XDG_DATA_HOME\astronvim"
# $env:ASTRONVIM_CONFIG_DIR = $env:ASTRONVIM_CONFIG_DIR ?? "$env:XDG_CONFIG_HOME\avim"
# $env:ASTRONVIM_CACHE_DIR = $env:ASTRONVIM_CACHE_DIR ?? "$env:XDG_CACHE_HOME\avim"
# $env:ASTRONVIM_BASE_DIR = $env:ASTRONVIM_BASE_DIR ?? "$env:ASTRONVIM_RUNTIME_DIR\avim"

$env:NVIM_APPNAME = "cosmic"

# nvim -u "$env:ASTRONVIM_BASE_DIR\init.lua" @args
nvim @args
