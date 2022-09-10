@echo off
set MODNAME=lostS_pm
set MAPNAME=mp_killhouse
set COMPILEDIR=%CD%
color 11
title Lost Sky - Promod SnD Compiler
:MAKEOPTIONS
cls
:MAKEOPTIONS
echo -----------------------------------------------------------------
echo ----------------- Lost Sky Mod Builder -----------------------
echo ----------------- Developed by : MrBoom -------------------------
echo -----------------------------------------------------------------
echo  Please select an option:
echo    1. Build Fast File (mod.ff)
echo    2. Build IWD File (*.iwd)
echo    3. Run Local Server (mods/lostS_pm)
echo    4. Run Mod
echo.
echo    0. Exit
echo -----------------------------------------------------------------
echo.
set /p make_option=:
set make_option=%make_option:~0,1%
if "%make_option%"=="1" goto build_ff
if "%make_option%"=="2" goto build_iwd
if "%make_option%"=="3" goto run_server
if "%make_option%"=="4" goto run_mod
if "%make_option%"=="0" goto FINAL
goto :MAKEOPTIONS
:build_iwd
cls
cd
echo -----------------------------------------------------------------
echo.
echo  Building Iwd:
del ls_images.iwd
del ls_sounds.iwd
del ls_pml220.iwd
7za a -r -tzip ls_images.iwd images
7za a -r -tzip ls_sounds.iwd sound
7za a -r -tzip ls_pml220.iwd weapons
echo Completed: %time%
echo -----------------------------------------------------------------
pause
goto :MAKEOPTIONS
:build_ff
cls
cd
echo -----------------------------------------------------------------
echo  Building mod.ff:
echo    Deleting old mod.ff file...
del mod.ff
echo    Copying rawfiles...
xcopy localizedstrings ..\..\raw\localizedstrings /SY
xcopy promod ..\..\raw\promod /SY
xcopy shock ..\..\raw\shock /SY
xcopy rumble ..\..\raw\rumble /SY
xcopy images ..\..\raw\images /SY
xcopy materials ..\..\raw\materials /SY
xcopy material_properties ..\..\raw\material_properties /SY
xcopy sound ..\..\raw\sound /SY
xcopy soundaliases ..\..\raw\soundaliases /SY
xcopy fx ..\..\raw\fx /SY
xcopy mp ..\..\raw\mp /SY
xcopy weapons\mp ..\..\raw\weapons\mp /SY
xcopy xmodel ..\..\raw\xmodel /SY
xcopy xanim ..\..\raw\xanim /SY
xcopy ui ..\..\raw\ui /SY
xcopy ui_mp ..\..\raw\ui_mp /SY
xcopy english ..\..\raw\english /SY
xcopy animtrees ..\..\raw\animtrees /SYI > NUL
echo    Copying source code...
xcopy maps ..\..\raw\maps /SY
xcopy promod ..\..\raw\promod /SY
xcopy promod_ruleset ..\..\raw\promod_ruleset /SY
echo    Copying MOD.CSV...
xcopy mod.csv ..\..\zone_source /SY
echo    Compiling mod...
cd ..\..\bin
linker_pc.exe -language english -compress -cleanup mod
cd %COMPILEDIR%
copy ..\..\zone\english\mod.ff
echo  New mod.ff file successfully built!
echo Completed: %time%
echo -----------------------------------------------------------------
pause
goto :MAKEOPTIONS
:run_server
echo  Starting Server:
cd ..\..\
cod4x18_dedrun.exe +set sv_punkbuster 0 +set pb_sv_enable 0 +map_rotate +sv_authorizemode 0 +set fs_game Mods/%MODNAME% +map %MODNAME% +set r_xassetnum "material=2560 xmodel=1200 xanim=3200 image=3000" +set promod_mode custom_public + exec server.cfg +set g_gametype sd
echo ------------------------------
goto :MAKEOPTIONS
:run_mod
echo  Starting Mod:
cd ..\..\
iw3mp.exe +set fs_game Mods/%MODNAME% +set developer 2 +set developer_script 1
echo ------------------------------
goto :MAKEOPTIONS

:FINAL