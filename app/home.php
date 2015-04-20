<?php
	if(!isset($f3)) { http_response_code(404); exit; }
	
	$f3->set("page", "home.htm");
	$f3->set("title", "Welcome");
	$f3->set("headline", "Welcome to your personal Voc Trainer");
	echo View::instance()->render("layout.htm");
?>
