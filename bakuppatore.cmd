::backuppatore di cosini
::USAGE:
::copy this .cmd in your DESTINATION folder and run as administrator (or use the provided link)
::if launched with the -s option, computer will shutdown after completion

@echo off

::get start time
for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"
set "datetime=%YYYY%-%MM%-%DD%_%HH%-%Min%-%Sec%"

::sets current location of this batch file itself
SET currentdir=%~dp0
SET logfile=%currentdir%backup.log
SET errorlog=%currentdir%error.log





echo Starting now...
echo .....................................

::start copying files, logging a line of  ------------ between each folder
echo starting Desktop...
echo Desktop>>%errorlog%
xcopy "C:\Users\%USERNAME%\Desktop" %currentdir%\Desktop\ /s /y /f /r 1>>%logfile% 2>>%errorlog%
echo ------------------------------->>%errorlog%
echo Desktop done!
echo ------------------------------->>%logfile%

echo starting Downloads...
echo Downloads>>%errorlog%
xcopy "C:\Users\%USERNAME%\Downloads" %currentdir%\Downloads\ /s /y /f /r 1>>%logfile% 2>>%errorlog%
echo ------------------------------->>%errorlog%
echo Downloads done!
echo ------------------------------->>%logfile%

echo starting Adobe Media Encoder Presets...
echo Adobe Media Encoder Presets>>%errorlog%
xcopy "C:\Users\%USERNAME%\Documents\Adobe\Adobe Media Encoder\9.0\Presets" %currentdir%\PresetsEncoder\ /s /y /f /r 1>>%logfile% 2>>%errorlog%
echo ------------------------------->>%errorlog%
echo Adobe Media Encoder Presets done!
echo ------------------------------->>%logfile%

echo starting Looks Presets...
echo Looks Presets>>%errorlog%
xcopy "C:\Users\%USERNAME%\AppData\Local\LooksBuilder\Looks\Custom" %currentdir%\PresetsLooks\ /s /y /f /r 1>>%logfile% 2>>%errorlog%
echo ------------------------------->>%errorlog%
echo Looks Presets done!
echo ------------------------------->>%logfile%

echo starting Premiere Keyboard...
echo Premiere Keyboard>>%errorlog%
xcopy "C:\Users\%USERNAME%\Documents\Adobe\Premiere Pro\9.0\Profile-ninja\Win" %currentdir%\PremiereKeyboard\ /s /y /f /r 1>>%logfile% 2>>%errorlog%
echo ------------------------------->>%errorlog%
echo Premiere Keyboard done!
echo ------------------------------->>%logfile%

:: qui me backuppo tutta la cartella premiere, poi vediamo cosa mi servirà....
echo starting Premiere Pro 9.0 generic...
echo Premiere Pro 9.0 generic>>%errorlog%
xcopy "C:\Users\%USERNAME%\Documents\Adobe\Premiere Pro" %currentdir%\PremierePro90generic\ /s /y /f /r 1>>%logfile% 2>>%errorlog%
echo ------------------------------->>%errorlog%
echo Premiere Pro 9.0 generic done!
echo ------------------------------->>%logfile%

echo starting Filezilla Sitemanager...
echo Filezilla Sitemanager>>%errorlog%
xcopy "C:\Users\%USERNAME%\AppData\Roaming\FileZilla\sitemanager.xml" %currentdir%\FilezillaSitemanager\ /s /y /f /r 1>>%logfile% 2>>%errorlog%
echo ------------------------------->>%errorlog%
echo Filezilla Sitemanager done!
echo ------------------------------->>%logfile%

echo starting Atom Config file...
echo Atom Config file>>%errorlog%
xcopy "C:\Users\%USERNAME%\.atom\config.cson" %currentdir%\atomConfig\ /s /y /f /r 1>>%logfile% 2>>%errorlog%
echo ------------------------------->>%errorlog%
echo Atom Config file done!
echo ------------------------------->>%logfile%

echo starting Atom Packages...
echo Atom Packages>>%errorlog%
xcopy "C:\Users\%USERNAME%\.atom\packages" %currentdir%\atomPackages\ /s /y /f /r 1>>%logfile% 2>>%errorlog%
echo ------------------------------->>%errorlog%
echo Atom Packages done!
echo ------------------------------->>%logfile%

echo starting Brain Workshop...
echo Brain Workshop>>%errorlog%
xcopy "C:\Users\%USERNAME%\AppData\Roaming\Brain Workshop\data" %currentdir%\brainWorkshop\ /s /y /f /r 1>>%logfile% 2>>%errorlog%
echo ------------------------------->>%errorlog%
echo Brain Workshop done!
echo ------------------------------->>%logfile%

echo starting VLC custom Keybindings...
echo VLC custom Keybindings>>%errorlog%
xcopy "C:\Users\%USERNAME%\AppData\Roaming\vlc\vlcrc" %currentdir%\VLCkeys\ /s /y /f /r 1>>%logfile% 2>>%errorlog%
echo ------------------------------->>%errorlog%
echo VLC custom Keybindings done!
echo ------------------------------->>%logfile%

echo starting Pure Data registers...
echo Pure Data registers>>%errorlog%
mkdir %currentdir%puredataRegistry\
SET pdregister=%currentdir%puredataRegistry\Pure-Data.reg
regedt32.exe /e "%pdregister%" "HKEY_CURRENT_USER\Software\Pure-Data"2>>%errorlog%
echo ------------------------------->>%errorlog%
echo Pure Data registers done!
echo ------------------------------->>%logfile%










:: TODO: eagle.scr







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
