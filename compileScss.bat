@echo off
cls
powershell write-host -fore Green Start Compiling...
powershell write-host -fore Cyan Just save your file to compile scss
powershell write-host -fore Cyan Press  CTRL+C to stop

powershell write-host -fore Red /!\ In your HTML add the css source not the scss source /!\



npm run sass