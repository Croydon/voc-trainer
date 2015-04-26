<?php

require("initialize.php");

// Set homepage
$f3->route("GET|POST /",
	function($f3) {
		require("app/home.php");
	}
);

// Routing any other page
$f3->route("GET|POST /@page",
	function($f3, $params) {
		$f3->set("cleanPage", $f3->clean($params["page"]));
		if(ctype_alnum( $f3->get("cleanPage") ) AND file_exists("app/".$f3->get("cleanPage").".php"))
		{
			require("app/".$f3->get("cleanPage").".php");
		}
		else
		{
			$f3->reroute("/"); // Could be used for a 404 page
		}
	}
);

$f3->route("GET|POST /@page/@action",
	function($f3, $params) {
		$f3->set("cleanPage", $f3->clean($params["page"]));
		$f3->set("action", $f3->clean($params["action"]));
		if(ctype_alnum( $f3->get("cleanPage") ) AND file_exists("app/".$f3->get("cleanPage").".php"))
		{
			require("app/".$f3->get("cleanPage").".php");
		}
		else
		{
			$f3->reroute("/"); // Could be used for a 404 page
		}
	}
);

$f3->run();

?>
