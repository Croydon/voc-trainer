<?php
	if(!isset($f3)) { http_response_code(404); exit; }
	
	if($f3->get("loggedIn") == false OR $f3->get("userid") != 1)
	{
		$f3->reroute("/login");
		exit;
	}
	
	if($f3->get("action") == "user")
	{
		$f3->set("title", "Administration · User");
		$f3->set("headline", "Administration · User");
		$f3->set("page", "admin_user.htm");
		$f3->set("users", $f3->db->exec("SELECT id,username FROM ". $f3->get("prefix") ."user"));
		
		if(isset($_GET["resetpw"]) AND ctype_digit($_GET["resetpw"]))
		{
			$newPassword = generate_password("test", $_GET["resetpw"]);
			$f3->db->exec("UPDATE ".$f3->get("prefix")."user SET pw = '".$newPassword."' WHERE id = '". $_GET["resetpw"]."' LIMIT 1");
		}
		elseif(isset($_GET["new"]) AND isset($_POST["username"]))
		{
			$f3->db->exec("INSERT INTO ".$f3->get("prefix")."user (username) VALUE ('".$f3->clean($_POST["username"])."')");
		
			$newPassword = generate_password("test", $f3->db->pdo()->lastInsertID());
			$f3->db->exec("UPDATE ".$f3->get("prefix")."user SET pw = '".$newPassword."' WHERE id = '". $f3->db->pdo()->lastInsertID()."' LIMIT 1");
			
			$f3->reroute("/admin/user");
			exit;
		}
	}
	else
	{
		$f3->reroute("/");
		exit;
	}
	
	echo View::instance()->render("layout.htm");
?>
