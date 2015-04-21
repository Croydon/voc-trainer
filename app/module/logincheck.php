<?php
	if(!isset($f3)) { http_response_code(404); exit; }
	
	// Check if there are browser cookies
	if(isset($_COOKIE["userid"]) AND ctype_digit($_COOKIE["userid"]) AND isset($_COOKIE["password"]))
	{
		// Fetch information about the specific user
		$user = $f3->db->exec("SELECT * FROM ". $f3->get("prefix") ."user WHERE id = '". $_COOKIE["userid"] ."' LIMIT 1");
		
		// Is the given password correct?
		if($user["password"] == $_COOKIE["password"])
		{
			// Password corret, succesfully logged in
			$f3->set("loggedIn", true);
			$f3->set("userid", $user["id"]);
			$f3->set("username", $user["username"]);
		}
		{
			// Wrong password, login failed
			$f3->set("loggedIn", false);
		}
	}
	{
		// No browser cookies set, not logged in
		$f3->set("loggedIn", false);
	}
?>