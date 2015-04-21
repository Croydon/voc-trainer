<?php
// Kickstart the framework
$f3 = require("f3/base.php");

$f3->set("DEBUG", 1);
if ((float)PCRE_VERSION<7.9)
	trigger_error("PCRE version is out of date");

// Load configuration
$f3->config("config.ini");

// Connect to the database
if($f3->get("ENABLEDB") == "1") 
{
	require($f3->get("CONFIGDIR")."/db.php");

	$f3->set("db", new \DB\SQL($config["db"]["driver"].":host=".$config["db"]["host"].";port=".$config["db"]["port"].";dbname=".$config["db"]["dbname"]."", $config["db"]["user"], $config["db"]["password"]));
	
	$f3->set("prefix", $config["db"]["prefix"]);
}

// Load all modules as set in the config
foreach($f3->get("MODULE") AS $modul)
{
	require($f3->get("MODULEDIR")."/".$modul.".php");
}

?>
