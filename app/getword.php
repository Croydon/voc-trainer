<?php
	if(!isset($f3)) { http_response_code(404); exit; }
	
	if(!isset($_GET["wordUnitID"])) 
	{
		echo json_encode(array("status" => "0"));
		exit;
	}
	
	if(get_word_by_unit($_GET["wordUnitID"], true) == false)
	{
		echo json_encode(array("status" => "0"));
		exit;
	}

	
	$actualWord = get_word_by_unit($_GET["wordUnitID"], true);
	
	echo json_encode(array("status" => "1", "word" => $actualWord)); 
?>
