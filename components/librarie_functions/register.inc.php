<?php

function simplePHP_register($username, $email, $password, $userBdd, $usernameTable, $emailTable, $passwordTable, $idTable, $data) {

    //Check if the field aren't empty
    if ($username != null || $email != null || $password != null) {
        //Not empty

        //Check if a user already exist with this username/email
        $sql = "SELECT * FROM $userBdd WHERE $usernameTable LIKE '$username' OR $emailTable LIKE '$email'";
        $res = mysqli_query($data, $sql);

        if (!mysqli_num_rows($res) > 0) {
            //No result -> create an account

            try {
                
                //Create an hash password
                $hashPassword = password_hash($password, PASSWORD_DEFAULT);

                $data->query("INSERT INTO $userBdd ($idTable, $usernameTable, $emailTable, $passwordTable) VALUES (null, '$username', '$email', '$hashPassword')");

                //Success
                //########################################################################################
                //##                                                                                    ##
                //##          Modify this to create a custom event when the account is created :        ##
                //##                                                                                    ##
                echo 
                "
                <div class='created_reg success_reg'>                                            
                    <p>Account created!</p>
                </div>
                ";
                //########################################################################################

            } catch (mysqli_sql_exception $e) { echo "<div class='unerror_reg reg_error'><p>Error!</p></div>"; }

        } else {
            //A user already exist
            echo
            "
            <div class='user_already_reg reg_error'>
                <p>A user already exist!</p>
            </div>
            ";
        }

    } else {
        //Empty
        echo 
        "
        <div class='empty_fields_reg reg_error'>
            <p>Fill the fields!</p>
        </div>
        ";
    }

}