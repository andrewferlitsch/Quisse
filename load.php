<?php
include "db.php";

function Load( $category ) {
	global $db;
	
	$data = "[";
	
	$rows = $db->Load( $category );
	foreach ( $rows as $row ) {
		$id       = $row[ 'id' ];
		$question = trim( str_replace( '"', '\\"', $row[ 'question' ] ) );
		$answer   = trim( str_replace( '"', '\\"', $row[ 'answer' ] ) );
		$rank     = $row[ 'rank' ];
		$toggle	  = $row[ 'toggle' ];
		$words	  = $row[ 'words' ];
		
		$data .= "{ \"id\": $id, \"rank\": $rank, \"question\": \"$question\", \"answer\": \"$answer\", \"toggle\": $toggle, \"words\": \"$words\", \"similar\": \"$similar\" },";
	}
	
	$data .= "{}]";
	echo $data;
}

$server_ip = $_SERVER['REMOTE_ADDR'];
if( isset( $_GET['category'] ) ) {
	Load( $_GET['category'] );
}
?>
