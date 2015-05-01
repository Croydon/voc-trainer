<?php
	if(!isset($f3)) { http_response_code(404); exit; }
	
	if($f3->get("loggedIn") == false)
	{
		$f3->reroute("/login/training");
		exit;
	}

	$wordUnits = array();
	
	if($f3->get("action") == "category")
	{
		if(!is_numeric($_GET["id"])) 
		{
			$f3>reroute("/words"); 
			exit;
		}
		
		$category = $f3->db->exec("SELECT * FROM ".$f3->get("prefix")."chapter WHERE id = '". $_GET["id"] ."' AND lang = '". $f3->get("langID")."' LIMIT 1");
		
		$category = $category[0];
		
		$f3->set("headline", "Training · Category: ". $category["title"]);
		
		if(!isset($category["id"])) 
		{
			$f3>reroute("/words"); 
			exit;
		}
		
		foreach($f3->db->exec("SELECT id FROM ".$f3->get("prefix")."word_unit WHERE chapter = '". $category["id"] ."'") AS $wordUnit)
		{
			$wordUnits[] = $wordUnit["id"];
		}
	}
	
	$f3->set("title", "Training");
	$f3->set("page", "training.htm");
	$f3->set("wordUnits", $wordUnits);
	
	echo View::instance()->render("layout.htm");

?>
