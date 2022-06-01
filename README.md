
# __Simple PHP__

A PHP library to simplify everything you can do in PHP


# __Documentation__

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

## __Login__ :

The function is call `simplePHP_Login()`
you must give it as a variable :
```
- $email : Email get from the input
- $password : Password get from the input
- $userBdd : The name of your users table
- $emailtable : The name of the email row
- $passwordTable : The name of the password row
- $userIdTable : The name of the ID row
- $usernameTable : The name of the username row
- $data = $conn
```

#### Example:

Database (called users):
```
| id : (int(11)) | username (varchar(258)) | email (varchar(258)) | password (varchar(258)) |
|                |                         |                      |                         |
```

Code :
```
if (isset($_POST['login])) {
    simplePHP_Login(htmlspecialchars($_POST['email']), htmlspecialchars($_POST['password']), 'users', 'id', 'username', 'email', 'password', $conn);
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
