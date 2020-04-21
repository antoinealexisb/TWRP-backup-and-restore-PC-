REM ###########################################
REM #
REM # adb TWRP
REM #
REM # Author : Antoine-Alexis Bourdon
REM # Link : https://github.com/antoinealexisb/TWRP-backup-and-restore-PC-
REM # Version : 0.1.1
REM # Year : 2020-04
REM # documentation command TWRP : https://twrp.me/faq/openrecoveryscript.html
REM #
REM ###########################################
mode con:cols=100 lines=35
@echo off
title TWRP backup ^& restore
REM color is black in back and blue light in font
color 0B
echo.
echo            # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
echo            #                                                                       #
echo            #                   _     _      _     _                                #
echo            #                  (c).-.(c)    (c).-.(c)    (c).-.(c)                  #
echo            #                   / ._. \      / ._. \      / ._. \                   #
echo            #                 __\( Y )/__  __\( Y )/__  __\( Y )/__                 #
echo            #                (_.-/'-'\-._)(_.-/'-'\-._)(_.-/'-'\-._)                #
echo            #                   ^|^| H ^|^|      ^|^| I ^|^|      ^|^| ! ^|^|                   #
echo            #                 _.' `-' '._  _.' `-' '._  _.' `-' '._                 #
echo            #                (.-./`-'\.-.)(.-./`-'\.-.)(.-./`-'\.-.)                #
echo            #                 `-'     `-'  `-'     `-'  `-'     `-'                 #
echo            #                                                                       #
echo            #                                                                       #
echo            #                          Backup and Resore  v0.1.1                    #
echo            #                                                                       #
echo            #                           by antoinealexisb                           #
echo            #                                                                       #
echo            #                  https://github.com/antoinealexisb/                   #
echo            #                                                                       #
echo            # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
echo.
echo.
pause

goto menu

:menu
cls
echo            # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
echo            #                                                                       #
echo            #                   _     _      _     _                                #
echo            #                  (c).-.(c)    (c).-.(c)    (c).-.(c)                  #
echo            #                   / ._. \      / ._. \      / ._. \                   #
echo            #                 __\( Y )/__  __\( Y )/__  __\( Y )/__                 #
echo            #                (_.-/'-'\-._)(_.-/'-'\-._)(_.-/'-'\-._)                #
echo            #                   ^|^| H ^|^|      ^|^| I ^|^|      ^|^| ! ^|^|                   #
echo            #                 _.' `-' '._  _.' `-' '._  _.' `-' '._                 #
echo            #                (.-./`-'\.-.)(.-./`-'\.-.)(.-./`-'\.-.)                #
echo            #                 `-'     `-'  `-'     `-'  `-'     `-'                 #
echo            #                                                                       #
echo            #                                                                       #
echo            #                          Backup and Resore  v0.0.1                    #
echo            #                                                                       #
echo            #                           by antoinealexisb                           #
echo            #                                                                       #
echo            #                  https://github.com/antoinealexisb/                   #
echo            #                                                                       #
echo            # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
echo.
echo.                          ================ MENU =================
echo.
echo                                1. Backup (all)
echo                                2. Backup (System Only)
echo                                3. Backup (Data Only)
echo                                4. Backup (Boot Only)
echo                                5. Restore
echo                                6. Boot Into Recovery
echo                                7. Reboot System
echo                                8. Shutdown
echo                                9. exit
echo.
set /p choice=  Choose your option:

if '%choice%'=='1' goto all
if '%choice%'=='2' goto system
if '%choice%'=='3' goto data
if '%choice%'=='4' goto boot
if '%choice%'=='5' goto rest
if '%choice%'=='6' goto recovery
if '%choice%'=='7' goto reboot
if '%choice%'=='8' goto poweroff
if '%choice%'=='9' exit

goto menu

_________________________________________________________________________________

:all
cls
echo Backup (all) :

bin\adb.exe shell twrp backup SDCBO

echo done
echo.
pause
goto menu

_________________________________________________________________________________

:system
cls
echo Backup (System Only) :

bin\adb.exe shell twrp backup SO

echo done
echo.
pause
goto menu

_________________________________________________________________________________

:data
cls
echo Backup (Data Only) :

bin\adb.exe shell twrp backup DO

echo done
echo.
pause
goto menu

_________________________________________________________________________________

:boot
cls
echo Backup (Boot Only) :

bin\adb.exe shell twrp backup BO

echo done
echo.
pause
goto menu

_________________________________________________________________________________

:rest
cls
echo.
echo Make sure that the backup file is in the same location as this tool.
echo.
set /p filename= directory of the backup files (example : /sdcard/TWRP/RAINBOW4G/20042020/):

IF /i "%filename%"=="" goto menu

bin\adb.exe shell twrp restore %filename%

echo.
pause
goto menu
_________________________________________________________________________________

:recovery
cls
echo.
echo Booting into recovery...
echo.

adb.exe reboot recovery

echo.
pause
goto menu

_________________________________________________________________________________

:reboot
cls
echo.
echo Rebooting your device...
echo.

adb.exe reboot

echo.
pause
goto menu

_________________________________________________________________________________

:poweroff
cls
echo.
echo Shutdown your device...
echo.

adb.exe reboot -p

echo.
pause
goto menu
