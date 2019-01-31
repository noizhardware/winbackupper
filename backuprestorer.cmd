::backuppatore di cosini
::USAGE:
::copy this .cmd in your BACKUPPI folder and run as administrator
::if launched with the -s option, computer will shutdown after completion

@echo off

::get start time
for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"
set "datetime=%YYYY%-%MM%-%DD%_%HH%-%Min%-%Sec%"

::sets current location of this batch file itself
SET currentdir=%~dp0
SET logfile=%currentdir%Restore.log
SET errorlog=%currentdir%RestoreError.log



echo Starting now...
echo .....................................

::start copying files, logging a line of  ------------ between each folder
echo starting Desktop...
echo Desktop>>%errorlog%
xcopy "%currentdir%\Desktop" "C:\Users\%USERNAME%\Desktop" /s /y /f /r 1>>%logfile% 2>>%errorlog%
echo ------------------------------->>%errorlog%
echo Desktop done!
echo ------------------------------->>%logfile%

echo starting Downloads...
echo Downloads>>%errorlog%
xcopy "%currentdir%\Downloads" "C:\Users\%USERNAME%\Downloads" /s /y /f /r 1>>%logfile% 2>>%errorlog%
echo ------------------------------->>%errorlog%
echo Downloads done!
echo ------------------------------->>%logfile%

echo starting Adobe Media Encoder Presets...
echo Adobe Media Encoder Presets>>%errorlog%
xcopy "%currentdir%\PresetsEncoder" "C:\Users\%USERNAME%\Documents\Adobe\Adobe Media Encoder\9.0\Presets" /s /y /f /r 1>>%logfile% 2>>%errorlog%
echo ------------------------------->>%errorlog%
echo Adobe Media Encoder Presets done!
echo ------------------------------->>%logfile%

echo starting Looks Presets...
echo Looks Presets>>%errorlog%
xcopy "%currentdir%\PresetsLooks" "C:\Users\%USERNAME%\AppData\Local\LooksBuilder\Looks\Custom" /s /y /f /r 1>>%logfile% 2>>%errorlog%
echo ------------------------------->>%errorlog%
echo Looks Presets done!
echo ------------------------------->>%logfile%

echo starting Premiere Keyboard...
echo Premiere Keyboard>>%errorlog%
xcopy "%currentdir%\PremiereKeyboard" "C:\Users\%USERNAME%\Documents\Adobe\Premiere Pro\9.0\Profile-ninja\Win" /s /y /f /r 1>>%logfile% 2>>%errorlog%
echo ------------------------------->>%errorlog%
echo Premiere Keyboard done!
echo ------------------------------->>%logfile%

:: qui me backuppo tutta la cartella premiere, poi vediamo cosa mi servirà....
::echo starting Premiere Pro 9.0 generic...
::echo Premiere Pro 9.0 generic>>%errorlog%
::xcopy "C:\Users\%USERNAME%\Documents\Adobe\Premiere Pro" %currentdir%\PremierePro90generic\ /s /y /f /r 1>>%logfile% 2>>%errorlog%
::echo ------------------------------->>%errorlog%
::echo Premiere Pro 9.0 generic done!
::echo ------------------------------->>%logfile%

echo starting Filezilla Sitemanager...
echo Filezilla Sitemanager>>%errorlog%
xcopy "%currentdir%\FilezillaSitemanager" "C:\Users\%USERNAME%\AppData\Roaming\FileZilla\" /s /y /f /r 1>>%logfile% 2>>%errorlog%
echo ------------------------------->>%errorlog%
echo Filezilla Sitemanager done!
echo ------------------------------->>%logfile%

echo starting Atom Config file...
echo Atom Config file>>%errorlog%
xcopy "%currentdir%\atomConfig" "C:\Users\%USERNAME%\.atom\config.cson" /s /y /f /r 1>>%logfile% 2>>%errorlog%
echo ------------------------------->>%errorlog%
echo Atom Config file done!
echo ------------------------------->>%logfile%

echo starting Atom Packages...
echo Atom Packages>>%errorlog%
xcopy "%currentdir%\atomPackages" "C:\Users\%USERNAME%\.atom\packages" /s /y /f /r 1>>%logfile% 2>>%errorlog%
echo ------------------------------->>%errorlog%
echo Atom Packages done!
echo ------------------------------->>%logfile%

echo starting Brain Workshop...
echo Brain Workshop>>%errorlog%
xcopy "%currentdir%\brainWorkshop" "C:\Users\%USERNAME%\AppData\Roaming\Brain Workshop\data\" /s /y /f /r 1>>%logfile% 2>>%errorlog%
echo ------------------------------->>%errorlog%
echo Brain Workshop done!
echo ------------------------------->>%logfile%

echo starting VLC custom Keybindings...
echo VLC custom Keybindings>>%errorlog%
xcopy "%currentdir%\VLCkeys" "C:\Users\%USERNAME%\AppData\Roaming\vlc\" /s /y /f /r 1>>%logfile% 2>>%errorlog%
echo ------------------------------->>%errorlog%
echo VLC custom Keybindings done!
echo ------------------------------->>%logfile%

echo starting Pure Data registers...
echo Pure Data registers>>%errorlog%
SET pdregister=%currentdir%puredataRegistry\Pure-Data.reg
regedit /s %pdregister%2>>%errorlog%
echo ------------------------------->>%errorlog%
echo Pure Data registers done!
echo ------------------------------->>%logfile%










:: TODO:
::eagle.scr
:: quick access pinned? forse non è possibile...o cmq turbosbatta







::-----------------------------------------------------------------------------
::get finish time
for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"
set "datetimefinish=%YYYY%-%MM%-%DD%_%HH%-%Min%-%Sec%"

::write end statement in logfile
echo ******************************************************>>%logfile%
echo Backed up on: %datetime% .. finished on %datetimefinish%>>%logfile%

IF /I "%1%"=="-s" (
    shutdown.exe /s /t 00
)


echo [7mBacked up on: %datetime% .. finished on %datetimefinish%[0m
pause
exit
