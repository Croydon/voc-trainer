<?php
	if(!isset($f3)) { http_response_code(404); exit; }
	
	// Check if there are browser cookies
	if(isset($_COOKIE["userid"]) AND isset($_COOKIE["password"]))
	{
		// Is the given password correct?
		if(check_password($_COOKIE["userid"], $_COOKIE["password"]) == true)
		{
			// Fetch information about the specific user
			$user = $f3->db->exec("SELECT id, username FROM ". $f3->get("prefix") ."user WHERE id = '". $_COOKIE["userid"] ."' LIMIT 1");
		
			// Password corret, succesfully logged in
			$f3->set("loggedIn", true);
			$f3->set("userid", $user[0]["id"]);
			$f3->set("username", $user[0]["username"]);
		}
		else
		{
			// Wrong password, login failed
			$f3->set("loggedIn", false);
		}
	}
	else
	{
		// No browser cookies set, not logged in
		$f3->set("loggedIn", false);
	}
?>