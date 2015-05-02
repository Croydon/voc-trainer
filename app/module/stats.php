<?php
if(!isset($f3)) { http_response_code(404); exit; }	

function stats_get_level($wordUnitID)
{
	global $f3;
	
	$currentStats = $f3->db->exec("SELECT *  FROM ".$f3->get("prefix")."stats WHERE word_unit = '". $wordUnitID ."' AND user = '". $f3->get("userid") ."' LIMIT 1");
	
	if(!isset($currentStats[0]["id"]))
	{
		return 0; // The user never trained this word
	}
	else
	{
		return $currentStats[0]["section"];
	}
}

function stats_save($wordUnitID, $up = true)
{
	global $f3;
	
	$currentStats = $f3->db->exec("SELECT *  FROM ".$f3->get("prefix")."stats WHERE word_unit = '". $wordUnitID ."' AND user = '". $f3->get("userid") ."' LIMIT 1");
	
	if(!isset($currentStats[0]["id"]))
	{
		if($up == true)
		{
			$newLevel = 2;
		}
		else
		{
			$newLevel = 1;
		}
		
		$f3->db->exec("INSER INTO ".$f3->get("prefix")."stats (word_unit, user, section) VALUES ('". $wordUnitID ."', '". $f3->get("userid") .", '". $newLevel ."')");
	}
	else
	{
		if($up == true)
		{
			$newLevel = $currentStats[0]["section"]+1;
		}
		else
		{
			$newLevel =  $currentStats[0]["section"]-1;
		}
		
		if($newLevel < 1)
		{
			$newLevel = 1;
		}
		
		if($newLevel > 5)
		{
			$newLevel = 5;
		}
		
		$f3->db->exec("UPDATER ".$f3->get("prefix")."stats SET section = '". $newLevel ."' WHERE word_unit = '". $wordUnitID ."' AND user = '". $f3->get("userid") ."' LIMIT 1");
	}
}
?>
