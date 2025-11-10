@echo off
chcp 65001 >nul
title FREE OPTIMIZACIÓN BY KARMA
color 06
mode con: cols=80 lines=30

:inicio
cls
echo.
echo ============================================================
echo          ██ ▄█▀▄▄▄       ██▀███   ███▄ ▄███▓ ▄▄▄      
echo          ██▄█▒▒████▄    ▓██ ▒ ██▒▓██▒▀█▀ ██▒▒████▄    
echo         ▓███▄░▒██  ▀█▄  ▓██ ░▄█ ▒▓██    ▓██░▒██  ▀█▄  
echo         ▓██ █▄░██▄▄▄▄██ ▒██▀▀█▄  ▒██    ▒██ ░██▄▄▄▄██ 
echo         ▒██▒ █▄▓█   ▓██▒░██▓ ▒██▒▒██▒   ░██▒ ▓█   ▓██▒
echo         ▒ ▒▒ ▓▒▒▒   ▓▒█░░ ▒▓ ░▒▓░░ ▒░   ░  ░ ▒▒   ▓▒█░
echo         ░ ░▒ ▒░ ▒   ▒▒ ░  ░▒ ░ ▒░░  ░      ░  ▒   ▒▒ ░
echo         ░ ░░ ░  ░   ▒     ░░   ░ ░      ░     ░   ▒   
echo         ░  ░        ░  ░   ░            ░         ░  ░
echo ============================================================
echo                  💻 MENÚ OPTIMIZACIÓN FREE BY KARMA 💻
echo                            discord.gg/karma5m
echo ============================================================
echo.
echo    [1] 🔹 Optimización BAJA   - Limpieza básica
echo    [2] 🔸 Optimización MEDIA  - Rendimiento equilibrado
echo    [3] 🔺 Optimización ULTRA  - Máximo rendimiento (sin animaciones)
echo    [4] 🔁 REVERTIR CAMBIOS    - Restaurar efectos y servicios
echo    [5] ❌ SALIR
echo.
set /p opcion=   👉 Elige una opción (1-5): 

if "%opcion%"=="1" goto baja
if "%opcion%"=="2" goto media
if "%opcion%"=="3" goto ultra
if "%opcion%"=="4" goto revertir
if "%opcion%"=="5" exit
goto inicio

::--------------------------------------------------------------
:baja
cls
color 0E
echo 🧹 Iniciando OPTIMIZACIÓN BAJA...
echo.
echo - Eliminando archivos temporales...
del /q /f /s "%TEMP%\*" >nul 2>&1
del /q /f /s "C:\Windows\Temp\*" >nul 2>&1

echo - Vaciando papelera...
PowerShell -Command "Clear-RecycleBin -Force" >nul 2>&1

echo - Liberando memoria de procesos pesados...
PowerShell -Command "Get-Process | Where-Object { $_.PrivateMemorySize -gt 150MB } | Stop-Process -Force" >nul 2>&1

echo.
echo ✅ Optimizacíon BAJA completada.
pause
goto inicio

::--------------------------------------------------------------
:media
cls
color 0B
echo ⚙️  Iniciando OPTIMIZACIÓN MEDIA...
echo.

call :baja

echo - Deshabilitando servicios de telemetría...
sc stop "DiagTrack" >nul 2>&1
sc config "DiagTrack" start= disabled >nul 2>&1

echo - Activando plan de energía de ALTO RENDIMIENTO...
powercfg /setactive SCHEME_MIN >nul

echo - Limpiando caché de DNS...
ipconfig /flushdns >nul

echo.
echo ✅ Optimizacíon MEDIA completada.
pause
goto inicio

::--------------------------------------------------------------
:ultra
cls
color 0C
echo 🚀 Iniciando OPTIMIZACIÓN ULTRA...
echo.

call :media

echo - Desactivando animaciones y efectos visuales...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f >nul
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v MinAnimate /t REG_SZ /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ListviewAlphaSelect /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ListviewShadow /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\DWM" /v EnableAeroPeek /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\DWM" /v AlwaysHibernateThumbnails /t REG_DWORD /d 0 /f >nul

echo - Reiniciando el explorador para aplicar cambios...
taskkill /f /im explorer.exe >nul
start explorer.exe

echo.
echo ✅ Optimizacíon ULTRA completada.
pause
goto inicio

::--------------------------------------------------------------
:revertir
cls
color 0F
echo 🔄 Revirtiendo cambios y restaurando configuraciones...
echo.

echo - Restaurando efectos visuales y animaciones...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 1 /f >nul
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v MinAnimate /t REG_SZ /d 1 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ListviewAlphaSelect /t REG_DWORD /d 1 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ListviewShadow /t REG_DWORD /d 1 /f >nul
reg add "HKCU\Software\Microsoft\Windows\DWM" /v EnableAeroPeek /t REG_DWORD /d 1 /f >nul
reg add "HKCU\Software\Microsoft\Windows\DWM" /v AlwaysHibernateThumbnails /t REG_DWORD /d 1 /f >nul

echo - Restaurando el servicio de telemetría...
sc config "DiagTrack" start= auto >nul
sc start "DiagTrack" >nul

echo - Activando plan de energía equilibrado...
powercfg /setactive SCHEME_BALANCED >nul

echo - Reiniciando el explorador...
taskkill /f /im explorer.exe >nul
start explorer.exe

echo.
echo ✅ Todos los cambios han sido revertidos correctamente.
pause
goto inicio