<?php
    if (! isset($f3))
    {
        http_response_code(404);
        exit();
    }
    
    $f3->set("status", "normal");
    $f3->set("usernameValue", "");
    
    if (isset($_POST["username"]) and isset($_POST["password"]) and
             $_POST["password"] == $_POST["repeat_password"])
    {
        $generateUserPasswort = generate_password($_POST["password"], "1");
        $f3->db->exec(
                "INSERT INTO " . $f3->get("prefix") .
                         "user (id, username, pw) VALUE ('1', '" .
                         $f3->clean($_POST["username"]) . "', '" .
                         $generateUserPasswort . "')");
        $f3->reroute("/login");
    }
    else
    {
        $f3->set("status", "failed");
        $f3->set("page", "register_admin.htm");
        if (isset($_POST["username"]))
        {
            $f3->set("usernameValue", $_POST["username"]);
        }
    }
    
    echo View::instance()->render("layout.htm");

?>