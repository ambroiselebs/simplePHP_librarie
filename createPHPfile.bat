
@echo off
if ["%1"] == [""] (
    echo You must run : .\createPHPfile.bat "NameOfYourFile (without ".php")".
    goto end
) else (
    (
    echo(^<?php
    echo(   ^require^("../components/requires.php"^);
    echo(   session_start^(^);
    echo(^?^>
    echo(
    echo(^<html lang="en"^>
    echo(^<head^>
    echo(   ^<meta charset="UTF-8"^>
    echo(   ^<meta name="viewport" content="width=device-width, initial-scale=1.0"^>
    echo(   ^<link rel="stylesheet" href="css/reset.css"^>
    echo(   ^<link rel="stylesheet" href="css/style.css"^>
    echo(   ^<link rel="stylesheet" href="../components/librarie.css"^>
    echo(   ^<title^>^<?php echo $websiteName; ?^>^</title^>
    echo(^</head^>
    echo(^<body^>
    echo(
    echo(   ^<div class="simplephp_center"^>
    echo(       ^<h1 class="simplephp_title"^>Simple PHP^</h1^>
    echo(       ^<p class="simplephp_auth"^>Created by ambroiselebs^</p^>   
    echo(   ^</div^>
    echo(
    echo(   ^<script src="js/script.js"^>^</script^>
    echo(
    echo(^</body^>
    echo(^</html^>
    )>src/%1.php

    echo A file has been created in : src/%1.php
)