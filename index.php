<?php

// Kickstart the framework
$f3 = require("f3/base.php");

$f3->set("DEBUG", 1);
if ((float)PCRE_VERSION<7.9)
	trigger_error('PCRE version is out of date');

// Load configuration
$f3->config('config.ini');

// Set homepage
$f3->route("GET /",
	function($f3) {
		require("app/home.php");
	}
);

// Routing any other page
$f3->route("GET /@page",
	function($f3, $params) {
		if(ctype_alnum( $f3->clean($params["page"]) ) AND file_exists("app/".$params["page"]))
		{
			require("app/".$params["page"]);
		}
	}
);

$f3->run();

?>
