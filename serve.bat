@Echo off
cls
powershell write-host -fore Green Serving the project...
timeout /t 2 /nobreak

powershell write-host -fore Green CTRL+C to stop everything
powershell write-host -fore Red /!\ A terminal window will open, DONT CLOSE IT /!\

start cmd /k call commands/sass.bat
php -S 127.0.0.1:8000