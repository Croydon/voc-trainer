<?php
    if (! isset($f3))
    {
        http_response_code(404);
        exit();
    }
    
    $f3->db->exec("SELECT id FROM " . $f3->get("prefix") . "user WHERE id = '1'");
    
    if ($f3->get("loggedIn") == true)
    {
        $f3->set("title", "Welcome");
        $f3->set("page", "home.htm");
        $f3->set("headline", "Welcome To Your Personal Voc Trainer");
    }
    else
    {
        if ($f3->db->count() == 0)
        {
            $f3->set("title", "Welcome · Register an admin");
            $f3->set("page", "register_admin.htm");
            $f3->set("headline", "Register an admin");
        }
        else
        {
            $f3->set("title", "Welcome · Login");
            $f3->set("page", "login.htm");
            $f3->set("headline", "User area");
        }
    }
    echo View::instance()->render("layout.htm");
?>
