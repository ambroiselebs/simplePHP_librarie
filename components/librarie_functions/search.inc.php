<?php

function simplePHP_search($toSearch, $searchDatabase, $searchName, $data) {

    //Search in the searchDatabase
    $sql = "SELECT * FROM $searchDatabase WHERE $searchName LIKE '$toSearch'";
    $res = mysqli_query($data, $sql);

    if (mysqli_num_rows($res) > 0) {
        //If there is/there a/are result(s)
        
        while ($row = mysqli_fetch_assoc($res)) {

                //Success
                //########################################################################################
                //##                                                                                    ##
                //##               Modify this to create a custom element on search                     ##
                //##                                                                                    ##
                
                $name = $row[$searchName];
                
                ?>

                <div class="simplePhp_rslt">

                    <p><?php echo $name; ?></p>

                </div>

                <?php
                //########################################################################################

        }

    } else {
        echo
        "
        <div class='search_norslt search-err'>
            <p>No any results :(</p>
        </div>
        ";
    }

}