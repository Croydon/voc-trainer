<?php
	if(!isset($f3)) { http_response_code(404); exit; }
	
	if(!isset($_GET["wordUnitID"]) OR !isset($_GET["userAnswer"]))
	{
		echo json_encode(array("status" => "0"));
		exit;
	}
	
	$userAnswer = $f3->clean($_GET["userAnswer"]);
	
	if(get_word_by_unit($_GET["wordUnitID"], false) == false)
	{
		echo json_encode(array("status" => "0"));
		exit;
	}

	
	$actualWord = get_word_by_unit($_GET["wordUnitID"], false);
	$actualWordCleaned = $actualWord;
	
	if($f3->get("langID") == "2")
	{
		// English specific checks
		// It's not required to write at the beginning "to "
		
		$prefix = "to ";
	} 
	
	if(isset($prefix))
	{
		if (substr($actualWord, 0, strlen($prefix)) == $prefix) 
		{
			$actualWordCleaned = substr($actualWord, strlen($prefix));
		}
	}

	// Remove start and end spaces, if existing
	$userAnswer = trim($userAnswer);
	
	if($userAnswer == $actualWord OR $userAnswer == $actualWordCleaned)
	{
		echo json_encode(array("status" => "1", "correct" => "1", "correctWord" => $actualWord)); 
	}
	else
	{
		echo json_encode(array("status" => "1", "correct" => "0", "correctWord" => $actualWord)); 
	}
?>