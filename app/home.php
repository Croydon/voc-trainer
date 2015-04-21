<?php
	if(!isset($f3)) { http_response_code(404); exit; }
	
	$f3->set("page", "home.htm");
	$f3->set("title", "Welcome");
	$f3->set("headline", "Welcome to your personal Voc Trainer");

	//$f3->set("users", $f3->db->exec("SELECT username FROM ". $f3->get("prefix") ."user"));

	echo View::instance()->render("layout.htm");
?>
