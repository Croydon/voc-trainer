<?php
	if(!isset($f3)) { http_response_code(404); exit; }
	
	if($f3->get("loggedIn") == true)
	{
		$f3->set("title", "Welcome");
		$f3->set("page", "home.htm");
		$f3->set("headline", "Welcome to your personal Voc Trainer");
		$f3->set("users", $f3->db->exec("SELECT username FROM ". $f3->get("prefix") ."user"));
	}
	{
		$f3->set("title", "Welcome · Login");
		$f3->set("page", "login.htm");
		$f3->set("headline", "User area");
	}
	
	echo View::instance()->render("layout.htm");
?>
