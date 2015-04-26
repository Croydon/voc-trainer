<?php
	if(!isset($f3)) { http_response_code(404); exit; }
	
	if(!is_numeric($f3->get("action"))) 
	{
		$f3>reroute("/words"); 
		exit;
	}
	
	$category = $f3->db->exec("SELECT * FROM ".$f3->get("prefix")."chapter WHERE id = '". $f3->get("action") ."' AND lang = '". $f3->get("langID")."' LIMIT 1");
	
	$category = $category[0];
	
	if(!isset($category["id"])) 
	{
		$f3>reroute("/words"); 
		exit;
	}
	
	$f3->set("title", "Category · ". $category["title"]);
	$f3->set("page", "category.htm");
	$f3->set("headline", "Categories");
	
	$f3->set("categoryID", $category["id"]);
	$f3->set("categoryName", $category["title"]);

	$words = array(); $i = 0;
	foreach($f3->db->exec("SELECT * FROM ".$f3->get("prefix")."word_unit WHERE chapter = '". $category["id"] ."'") AS $wordUnit)
	{
		$translation = $f3->db->exec("SELECT * FROM ".$f3->get("prefix")."translation WHERE id = '". $wordUnit["wordTranslation"] ."'");	
		
		// if(isset($translation["id"])) 
		// {
			// $translationUnit = $f3->db->exec("SELECT word_unit1 FROM ".$f3->get("prefix")."word_unit WHERE id = '". $translation["word_unit2"] ."' LIMIT 1");	
		// }
		// else
		// {
			// $translation = $f3->db->exec("SELECT * FROM ".$f3->get("prefix")."translation WHERE word_unit2 = '". $word["id"] ."'");	
			
			// $translationUnit = $f3->db->exec("SELECT word FROM ".$f3->get("prefix")."word_unit WHERE id = '". $translation["word_unit1"] ."' LIMIT 1");	
		// }
		
		// $actualWordUnit = $f3->db->exec("SELECT word FROM ".$f3->get("prefix")."word_unit WHERE id = '". $translation[0]["word_unit1"] ."' LIMIT 1");
		
		$actualWord = $f3->db->exec("SELECT word FROM ".$f3->get("prefix")."word WHERE id = '". $translation[0]["wordID1"] ."' LIMIT 1");
		
		// $translationWordUnit = $f3->db->exec("SELECT word FROM ".$f3->get("prefix")."word_unit WHERE id = '". $translation[0]["word_unit2"] ."' LIMIT 1");	
	
		$translationWord = $f3->db->exec("SELECT word FROM ".$f3->get("prefix")."word WHERE id = '". $translation[0]["wordID2"] ."' LIMIT 1");
	
		$words[$i]["unitID"] = $wordUnit["id"];
		$words[$i]["word"] = $actualWord[0]["word"];
		$words[$i]["translation"] = $translationWord[0]["word"];
	
		$i++;
	}
	
	$f3->set("words", $words);
	
	echo View::instance()->render("layout.htm");
?>
