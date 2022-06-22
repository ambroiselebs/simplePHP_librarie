@echo off
if ["%1"] == [""] (
    echo You must run : .\createPHPfile.bat "NameOfYourFile (without ".php")".
    goto end
) else (
    (
    echo(^<!-- Component --^>
    echo(^<!-- Put your code here --^>
    echo(^<!-- Call the component by adding : ^<?php require^("../components/projects_components/%1.php"^); ?^> --^>
    )>components/projects_components/%1.php
    echo -
    echo A file has been created in : components/projects_components/%1.php 
    echo -
)
