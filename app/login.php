<?php
	if(!isset($f3)) { http_response_code(404); exit; }
	
	$f3->set("status", "normal");
	$f3->set("usernameValue", "");
	
	if(isset($_POST["username"]) AND isset($_POST["password"]))
	{
		$cleanUsername = $f3->clean($_POST["username"]);
		$user = $f3->db->exec("SELECT id, pw FROM ". $f3->get("prefix") ."user WHERE username = '". $cleanUsername ."' LIMIT 1");

		if(isset($user[0]["id"]) AND check_password($user[0]["id"], generate_password($_POST["password"], $user[0]["id"])) == true)
		{
			$f3->set("loggedIn", "true");
			setcookie("userid", $user[0]["id"], time()+60*60*90, "/");
			setcookie("password", $user[0]["pw"], time()+60*60*90, "/");
		}
		else
		{
			$f3->set("status", "failed");
			$f3->set("usernameValue", $_POST["username"]);
		}
	}	
		
	if($f3->get("loggedIn") == true)
	{
		$f3->reroute("/". $f3->get("action"));
	}
	else
	{
		$f3->set("title", "Welcome · Login");
		$f3->set("page", "login.htm");
		$f3->set("headline", "User area");
	}
	
	echo View::instance()->render("layout.htm");

?>