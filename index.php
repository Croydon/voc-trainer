<?php

require("initialize.php");

// Set homepage
$f3->route("GET /",
	function($f3) {
		require("app/home.php");
	}
);

// Routing any other page
$f3->route("GET /@page",
	function($f3, $params) {
		$cleanPage = $f3->clean($params["page"]);
		if(ctype_alnum( $cleanPage ) AND file_exists("app/".$cleanPage.".php"))
		{
			require("app/".$cleanPage.".php");
		}
		{
			$f3->reroute("/"); // Could be used for a 404 page
		}
	}
);

$f3->run();

?>
