@echo off
cls
setlocal enableextensions disabledelayedexpansion

powershell write-host -fore Green Start Compiling
timeout /t 1 /nobreak

mkdir Build\
xcopy /s /i "src" "Build\"

powershell write-host -fore Green Compiling the components
timeout /t 1 /nobreak
xcopy /s /i "components" "Build\components"

cd "Build\"
echo %cd%

timeout /t 1 /nobreak

powershell write-host -fore Green Building the files
timeout /t 3 /nobreak

set "search=../components/"
set "replace=components/"
for %%f in (*.*) do (
    echo %%f
    for /f "delims=" %%i in ('type "%%f" ^& break ^> "%%f" ') do (
        set "line=%%i"
        setlocal enabledelayedexpansion
        >>"%%f" echo(!line:%search%=%replace%!
        endlocal
    )
)

cd "components\"
echo %cd%

timeout /t 1 /nobreak

powershell write-host -fore Green Building the components
timeout /t 3 /nobreak

set "search=../components/"
set "replace=components/"
for %%f in (requires.php) do (
    echo %%f
    for /f "delims=" %%i in ('type "%%f" ^& break ^> "%%f" ') do (
        set "line=%%i"
        setlocal enabledelayedexpansion
        >>"%%f" echo(!line:%search%=%replace%!
        endlocal
    )
)


powershell write-host -fore Green Success, Final project is in %cd%\Build\
