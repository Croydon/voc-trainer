<?php
	if(!isset($f3)) { http_response_code(404); exit; }	

	function check_password($userID, $password)
	{
		if(ctype_digit($userID))
		{
			global $f3;
			
			// Fetch information about the specific user
			$user = $f3->db->exec("SELECT pw FROM ". $f3->get("prefix") ."user WHERE id = '". $userID ."' LIMIT 1");
				
			// Is the given password correct?
			if($user[0]["pw"] == $password)
			{
				return true;
			}
		}
		
		return false;
	}

?>
