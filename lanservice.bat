@echo off
@rem LAN Network Host

:CHOOSE
echo -----------------------------------------
echo Choose the Service : 
echo 1.LAN Network Host Service
echo 2.Start the LAN Network Host Service
echo 3.Exit Application
set /p method= Enter the Number 1-3 : 
if %method% EQU 1 goto SSID
if %method% EQU 2 goto START
if %method% EQU 3 goto EXIT
goto CHOOSE

:SSID
cls
echo LAN Network Host
set /p ss_id= Enter SSID : 
echo Your SSID is %ss_id% 
echo ------------------------------------------
goto PASS

:PASS
set /p key_id= Enter Network Password (8 chars) : 
echo Your Password is %key_id% 
echo ------------------------------------------
goto CONFIRM

:CONFIRM
cls
echo -----------------------------------------
echo Lan Network Host
echo Your SSID is %ss_id%
echo Your Password is %key_id%
echo -----------------------------------------
set /p conf= Continue ? (Y/N) :
if "%conf%"=="Y" goto SETUP
if "%conf%"=="y" goto SETUP
if "%conf%"=="N" goto EXIT
if "%conf%"=="n" goto EXIT
goto CONFIRM

:SETUP
netsh wlan set hostednetwork mode=allow ssid=%ss_id% key=%key_id%
pause
goto START

:START
set /p able= Start the Hotspot Service? (Y/N) :
if "%able%"=="Y" (netsh wlan start hostednetwork & goto EXIT)
if "%able%"=="N" goto EXIT
goto START

:EXIT
echo EXITTING THE BATCH FILE...
pause