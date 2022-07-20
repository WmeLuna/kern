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
cd ../..
mkdir powercord
cd powercord
mkdir plugins
cd plugins
git clone https://github.com/12944qwerty/betterInvites
git clone https://github.com/asportnoy/CanaryLinks
git clone https://github.com/TaiAurori/embed-redirect
git clone https://github.com/asportnoy/mention-cache-fix
git clone https://github.com/CumcordLoaders/Powercord
git clone https://github.com/Bricklou/powercord-pindms
git clone https://github.com/VenPlugs/PowercordTwemojiEverywhere
git clone https://github.com/discord-modifications/spotify-crack
cd ../..
mkdir betterdiscord
cd betterdiscord
mkdir plugins
cd plugins
powershell Invoke-WebRequest https://github.com/WmeLuna/Discord-Kernel-Linux-Guide/raw/master/honkloader.plugin.js -O honkloader.plugin.js
