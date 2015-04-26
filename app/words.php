<?php
	if(!isset($f3)) { http_response_code(404); exit; }
	
	$f3->set("title", "Words");
	$f3->set("page", "words.htm");
	$f3->set("headline", "Words");
	
	$categories = array();
	foreach($f3->db->exec("SELECT * FROM ".$f3->get("prefix")."chapter") AS $chapter)
	{
		$f3->db->exec("SELECT id FROM ".$f3->get("prefix")."word_unit WHERE chapter = '". $chapter['id'] ."'");	
		$categories[]["title"] = $chapter["title"];
		$categories[]["amount"] = $chapter["amount"];
	}
	
	print_r($categories);
	$f3->set("categories", $categories);
	
	
	echo View::instance()->render("layout.htm");
?>
