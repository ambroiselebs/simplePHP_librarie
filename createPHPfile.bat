@echo off
if ["%1"] == [""] (
    echo You must run : .\createPHPfile.bat "NameOfYourFile (without ".php")".
    goto end
) else (
    (
    echo(^<?php
    echo(   ^require^("components/requires.php"^);
    echo(   session_start^(^);
    echo(^?^>
    echo(
    echo(^<html lang="en"^>
    echo(^<head^>
    echo(   ^<meta charset="UTF-8"^>
    echo(   ^<meta name="viewport" content="width=device-width, initial-scale=1.0"^>
    echo(   ^<title^>^<?php echo $websiteName; ?^></title^>
    echo(^</head^>
    echo(^<body^>
    echo(
    echo(^</body^>
    echo(^</html^>
    )>src/%1.php

    echo The file named %1.php has been created
)