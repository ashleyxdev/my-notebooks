@echo off
echo ===============================
echo  Python Script Downloader
echo ===============================
echo.
echo 1. Download script1.py
echo 2. Download script2.py
echo 3. Download script3.py
echo.

set /p choice=Enter your choice (1-3): 

if "%choice%"=="1" set file=script1.py
if "%choice%"=="2" set file=script2.py
if "%choice%"=="3" set file=script3.py

if not defined file (
    echo Invalid choice!
    pause
    exit /b
)

set url=https://raw.githubusercontent.com/ashleyxdev/my-scripts/master/%file%

echo Downloading %file% ...
curl.exe -L -o %file% %url%

echo Done!
pause
