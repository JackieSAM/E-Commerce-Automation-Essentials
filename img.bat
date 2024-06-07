@echo off
setlocal enabledelayedexpansion

rem Check if the CSV file exists
if not exist images.csv (
    echo CSV file not found!
    exit /b
)

rem Read the CSV file line by line
for /f "tokens=1,2 delims=," %%a in (images.csv) do (
    rem Skip the header line
    if "%%a"=="name" (
        echo Skipping header line
    ) else (
        set "name=%%a"
        set "url=%%b"
        
        rem Extract the file extension from the URL
        for %%i in ("!url!") do (
            set "ext=%%~xi"
        )

        rem Remove any quotes and trailing spaces
        set "name=!name:"=!"
        set "url=!url:"=!"
        set "ext=!ext:~1!"

        echo Downloading !url! as !name!.!ext!
        curl -s -o "!name!.!ext!" "!url!"
    )
)

echo All images have been downloaded.
pause
