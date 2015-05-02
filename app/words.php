<?php
	if(!isset($f3)) { http_response_code(404); exit; }
	
	if($f3->get("loggedIn") == false)
	{
		$f3->reroute("login/words");
		exit;
	}
	
	$f3->set("title", "Words");
	$f3->set("page", "words.htm");
	$f3->set("headline", "Words");
	$f3->set("addcategorystatus", "");
	
	if($f3->get("action") == "addcategory" AND isset($_POST["categoryname"]))
	{
		if($_POST["categoryname"] == "")
		{
			$f3->set("addcategorystatus", "empty");
		}
		else
		{
			$cleanCategoryname = $f3->clean($_POST["categoryname"]);
			$f3->db->exec("SELECT id FROM ".$f3->get("prefix")."chapter WHERE title = '". $cleanCategoryname ."' AND lang = '". $f3->get("langID")."' LIMIT 1");
			if($f3->db->count() == 0)
			{
				$f3->db->exec("INSERT INTO ".$f3->get("prefix")."chapter (title, lang) VALUES ('". $cleanCategoryname ."', '". $f3->get("langID")."')");
				$f3->set("addcategorystatus", "created");
			}
			else
			{
				$f3->set("addcategorystatus", "alreadyExisting");
			}
		}
	}
	
	$categories = array(); $i = 0;
	foreach($f3->db->exec("SELECT * FROM ".$f3->get("prefix")."chapter WHERE lang = '". $f3->get("langID") ."'") AS $chapter)
	{
		$f3->db->exec("SELECT id FROM ".$f3->get("prefix")."word_unit WHERE chapter = '". $chapter['id'] ."'");	
		$categories[$i]["id"] = $chapter["id"];
		$categories[$i]["title"] = $chapter["title"];
		$categories[$i]["amount"] = $f3->db->count();
		$i++;
	}
	
	$f3->set("categories", $categories);
	$f3->set("levels", stats_get_levels_with_word_amount());
	
	echo View::instance()->render("layout.htm");
?>
