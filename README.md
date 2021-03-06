# __🛡️ Simple PHP__
A PHP library to simplify everything you can do in PHP
# __📥 Installation__
Simply execute : `git clone https://github.com/ambroiselebs/simplePHP_librarie.git` and there you go!

# __🖨️ Compile the project__

Execute the command : `./build.bat` it will create a build/ folder in which your project will be compiled, just upload it to your FTP !

# __📝 Documentation__

## __Compile SCSS :__

Execute the command : `./compileScss.bat` and there you go !
Just save your scss file and It will compile

⚠️ Put the css source in your HTML not the SCSS ⚠️

## __Create a PHP file :__
Execute the command : `./createPHPfile.bat [name of your file without ".php"]`
#### Example :
`./createPHPfile.bat home`, It's gonna create in the src folder a file named : home.php With pre-generated lines.
## __Create a PHP components :__
Execute the command : `./createPHPcomponent.bat [name of your file without ".php"]`
Then, add this code : `<?php require('components/projects_components/[file].php')>`
#### Example :
`./createPHPcomponent.bat home`, It's gonna create in the components/projects_components folder a file named : home.php With pre-generated lines.

## __Conenction to the Database :__
Go on : `components/dbh.inc.php`
The file look like this :
```
<?php
$serverName = "host";
$dBUsername = "user";
$dBPassword = "password";
$dBName = "Database Name";
$conn = mysqli_connect($serverName, $dBUsername, $dBPassword, $dBName);
if (!$conn) {
    die("Connection Failed: " . mysqli_connect_error());
}
```
And the change line with the good infos.
#### Example:
```
<?php
$serverName = "localhost";
$dBUsername = "ambroiselebs";
$dBPassword = "12345";
$dBName = "simplephp";
$conn = mysqli_connect($serverName, $dBUsername, $dBPassword, $dBName);
if (!$conn) {
    die("Connection Failed: " . mysqli_connect_error());
}
```
## __Global Variable__ :
You can change the title / Icon... in the file : `components/global_var.php`
## __Login__ :
The function is call `simplePHP_Login()`
you must give it as a variable :
```
- $username : Username get from the input
- $password : Password get from the input
- $userBdd : The name of your users table
- $emailtable : The name of the email row
- $passwordTable : The name of the password row
- $userIdTable : The name of the ID row
- $usernameTable : The name of the username row
- $data = $conn
```
/!\ Everything can be changed in `components/librarie_functions/search.inc.php` /!\
#### Example:
Database (called users):
```
| id : (int(11)) | username (varchar(258)) | email (varchar(258)) | password (varchar(258)) |
|                |                         |                      |                         |
```
Code :
```
if (isset($_POST['login])) {
    simplePHP_Login(htmlspecialchars($_POST['username']), htmlspecialchars($_POST['password']), 'users', 'id', 'username', 'email', 'password', $conn);
}
```
## __Register__ :
The function is call `simplePHP_register`
you must give it as a variable :
```
- $email : Email get from the input
- $password : Password get from the input
- $username : Username get from the input
- $userBdd : The name of your users table
- $emailtable : The name of the email row
- $passwordTable : The name of the password row
- $userIdTable : The name of the ID row
- $usernameTable : The name of the username row
- $data = $conn
```
/!\ Everything can be changed in `components/librarie_functions/search.inc.php` /!\
#### Example :
Database (called users):
```
| id : (int(11)) | username (varchar(258)) | email (varchar(258)) | password (varchar(258)) |
|                |                         |                      |                         |
```
Code :
```
if (isset($_POST['login])) {
    simplePHP_register(htmlspecialchars($_POST['username']), htmlspecialchars($_POST['email']), htmlspecialchars($_POST['password']), 'users', 'id', 'username', 'email', 'password', $conn);
}
```
## __Search :__
The function is call `simplePHP_search`
you must give it as a variable :
```
$toSearch = Word in the input
$searchDatabase = The database where everything is
$searchName = The name of the row of where you want to search
$data = $conn
```
/!\ Everything can be changed in `components/librarie_functions/search.inc.php` /!\
#### Example :
Database (called : catalog) :
```
| id (int(11)) | name (varchar(258)) |
|              |                     |
```
Code :
```
if (isset($_POST['search'])) {
    simplePHP_search(htmlspecialchars($_POST['search_input']), 'catalog', 'name', $conn);
}
```
