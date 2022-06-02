<?php

function simplePHP_Login($username, $password, $userBdd, $userIdTable, $usernameTable, $emailTable, $passwordTable, $data) {

    //Check if the field aren't empty
    if ($username != null || $password != null) {
        //Not empty
        
        //Check if the user exist
        $sql = "SELECT * FROM $userBdd WHERE $usernameTable LIKE '$username'";
        $res = mysqli_query($data, $sql);

        if (mysqli_num_rows($res) > 0) {
            //If there is a result it means there is a user
            while ($row = mysqli_fetch_assoc($res)) {

                //Check if password is like hashed password
                $hashPassword = $row[$passwordTable];

                if (password_verify($password, $hashPassword)) {
                    //Good password -> connect the user

                    //[--------< Sessions >--------]\\

                    $_SESSION['user_id'] = $row[$userIdTable];
                    $_SESSION['username'] = $username;
                    $_SESSION['email'] = $row[$emailTable];
                    $_SESSION['password'] = $password;


                    //[--------< Cookie >--------]\\

                    setcookie("username", $username);
                    setcookie("password", $password);

                    //Success
                    //########################################################################################
                    //##                                                                                    ##
                    //##            Modify this to create a custom event when the user is log  :            ##
                    //##                                                                                    ##
                    echo 
                    "
                    <div class='log_log success_log'>                                            
                        <p>You are connected!</p>
                    </div>
                    ";
                    //########################################################################################
                } else {
                    //Wrong password
                    echo 
                    "
                    <div class='wrong_password log_error'>
                        <p>Wrong password!</p>
                    </div>
                    ";
                }

            }
        } else {
            //Unknow user
            echo
            "
            <div class='unknow_user log_error'>
                <p>Unknow user!</p>
            </div>
            ";
        }

    } else {
        //Empty
        echo
        "
        <div class='empty_fields_log log_error'>
            <p>Fill the fields!</p>
        </div>
        ";
    }

}