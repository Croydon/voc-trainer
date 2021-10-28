<?php
	if(!isset($f3)) { http_response_code(404); exit; }
	
	$f3->set("title", "Imprint");
	$f3->set("page", "imprint.htm");
	$f3->set("headline", "Imprint");
	
	echo View::instance()->render("layout.htm");
?>
