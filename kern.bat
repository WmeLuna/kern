@echo off
Setlocal EnableDelayedExpansion
set appdir=
for /f usebackq %%F in (`dir /b C:\Users\administrator\AppData\Local\DiscordDevelopment\app-1*`) do set appdir=!appdir! C:\Users\administrator\AppData\Local\DiscordDevelopment\%%F
echo %appdir%

cd C:\Users\administrator\Documents
mkdir kern
powershell Invoke-WebRequest https://github.com/kernel-mod/installer-cli/releases/latest/download/kernel-installer-i386-windows.exe -O kernel.exe
kernel.exe -i %appdir% -k C:\Users\administrator\Documents\kern
cd kern
powershell Invoke-WebRequest https://github.com/kernel-mod/electron/releases/latest/download/kernel.asar -O kernel.asar
mkdir packages
cd packages
git clone https://github.com/slow/discord-utilities
git clone https://github.com/strencher-kernel/webpack
git clone https://github.com/strencher-kernel/settings
git clone https://github.com/strencher-kernel/no-sentry
git clone https://github.com/strencher-kernel/bd-compat
git clone https://github.com/strencher-kernel/pc-compat
cd pc-compat
pnpm initialize
cd ..
