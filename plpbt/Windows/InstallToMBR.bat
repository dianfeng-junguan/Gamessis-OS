@echo off

rem Written by Elmar Hanlhofer  http://www.plop.at   20110731

echo.
echo Add/install the Plop Boot Manager Installer to the Windows boot menu
echo Plop Boot Manager - Written by Elmar Hanlhofer   www.plop.at
echo.
echo Read and accept the licence agreement!
echo.

set SRC=%~dp0
set DRIVE=%SystemDrive%
set PLOPDIR=%DRIVE%\plop
set BIN=plpinstc.bin
set BIN1=%BIN%
set LDR=%PLOPDIR%\plpbt4winmbr.ldr
set PGM=plpbt4win.exe
set ENTRYNAME=Install/Remove the Plop Boot Manager [MBR]

echo Add the Plop Boot Manager Install program to the Windows boot menu?
set /p Choice={y,n}
if not '%Choice%'=='y' goto abort

echo.

rem ========================================================

cd /D %SRC%

if exist "%BIN%" goto binfound

set BIN=..\%BIN%
if exist "%BIN%" goto binfound

echo Error: %BIN1% not found!
goto exit1

:binfound

rem ========================================================

if exist "%PGM%" goto pgmfound

echo Error: %PGM% not found!
goto exit1

:pgmfound

rem ========================================================

if not exist "%PLOPDIR%" goto createplopdir

echo %PLOPDIR% already exist, update the files?
set /p Choice={y,n}
if '%Choice%'=='y' goto createcheckdir

goto abort

:createplopdir
mkdir "%PLOPDIR%" 2>nul
if not "%errorlevel%" == "0" goto noadmin

:createcheckdir
mkdir "%PLOPDIR%\test556832w1" 2>nul
if not "%errorlevel%" == "0" goto noadmin

rmdir "%PLOPDIR%\test556832w1"


rem ========================================================
echo Copy %BIN% to %PLOPDIR%
copy %BIN% %PLOPDIR%\%BIN%

echo Copy %PGM% to %PLOPDIR%
copy %PGM% %PLOPDIR%\%PGM%

echo.
echo Creating boot menu entry

cd /D %PLOPDIR%
%PGM% /B /C "%LDR%" /A "%ENTRYNAME%" /BIN "%PLOPDIR%\%BIN%"

if "%errorlevel%" == "0" goto noerror
echo.
echo There was an error
goto exit1

:noerror
echo.
echo Install completed
goto exit1

rem ========================================================

:abort
echo Abort
echo.
goto exit1

:exit
:noadmin

echo.
echo Error: you have no admin rights! Use right mouse click on the program and
echo        start it with admin privileges.
echo.

:exit1
echo.	
pause
