<?php
	if(!isset($f3)) { http_response_code(404); exit; }
	
	if(!is_numeric($_POST["langID1"]) OR !is_numeric($_POST["langID2"]) OR !is_numeric($_POST["categoryID"])) 
	{
		echo json_encode(array("status" => "0"));
		exit;
	}
	
	if(is_word_existing($_POST["word1"]) == false)
	{
		$wordID1 = save_word($_POST["word1"]);
	}
	else
	{
		$wordID1 = is_word_existing($_POST["word1"]);
	}
	
	if(is_word_existing($_POST["word2"]) == false)
	{
		$wordID2 = save_word($_POST["word2"]);
	}
	else
	{
		$wordID2 = is_word_existing($_POST["word2"]);
	}
	
	$translationID = save_translation($wordID1, $wordID2);
	
	if(save_word_unit($translationID, $_POST["categoryID"]) != false)
	{
		echo json_encode(array("status" => "1")); 
	}
	else
	{
		echo json_encode(array("status" => "0")); 
	}
?>
