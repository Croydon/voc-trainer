<?php
if(!isset($f3)) { http_response_code(404); exit; }	

function generate_password($password, $id)
{
	return hash("sha256", $password.$id);
}
?>
