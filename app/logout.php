<?php
	if(!isset($f3)) { http_response_code(404); exit; }
	

	setcookie("userid", "", time()-60*60*90, "/");
	setcookie("password", "", time()-60*60*90, "/");
	
	$f3->reroute("/home");
?>