<?php
if(!isset($f3)) { http_response_code(404); exit; }	

function is_word_existing($word)
{
	global $f3;
	
	$vocWord = $f3->db->exec("SELECT * FROM ".$f3->get("prefix")."word WHERE word = '". $f3->clean($word) ."' LIMIT 1");
	
	if(!isset($vocWord[0]["id"]))
	{
		return false;
	}
	else
	{
		return $vocWord[0]["id"];
	}
}

function save_word($word)
{
	global $f3;
	
	$f3->db->exec("INSERT INTO ".$f3->get("prefix")."word (word) VALUE ('". trim($f3->clean($word)) ."')");

	return $f3->db->pdo()->lastInsertID();
}

function save_translation($wordID1, $wordID2)
{
	global $f3;
	
	$translation = $f3->db->exec("SELECT * FROM ".$f3->get("prefix")."translation WHERE wordID1 = '". $f3->clean($wordID1) ."' AND wordID2 = '". $f3->clean($wordID2) ."' LIMIT 1");
	
	if(!isset($translation[0]["id"]))
	{
		$f3->db->exec("INSERT INTO ".$f3->get("prefix")."translation (wordID1, wordID2) VALUE ('". $f3->clean($wordID1) ."', '". $f3->clean($wordID2) ."')");

		return $f3->db->pdo()->lastInsertID();	
	}
	else
	{
		return $translation[0]["id"];
	}
}

function save_word_unit($translationID, $chapterID)
{
	global $f3;
	
	$wordUnit = $f3->db->exec("SELECT * FROM ".$f3->get("prefix")."word_unit WHERE wordTranslation = '". $translationID ."' AND chapter = '". $chapterID ."' LIMIT 1");
	
	if(!isset($wordUnit[0]["id"]))
	{
		$f3->db->exec("INSERT INTO ".$f3->get("prefix")."word_unit (wordTranslation, chapter) VALUES ('". $translationID ."', '". $chapterID ."')");

		return $f3->db->pdo()->lastInsertID();		
	}
	else
	{
		return false;
	}
}

?>
