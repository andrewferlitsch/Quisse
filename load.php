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
		$level    = $row[ 'level' ];
		$rank     = $row[ 'rank' ];
		$toggle	  = $row[ 'toggle' ];

		if ( $level != NULL ) {
			// limit changing preset level (rank) from learned level by 1
			if ( $level > $rank )
				$rank++;
			else if ( $level < $rank )
				$rank--;
		}
		
		$data .= "{ \"id\": $id, \"rank\": $rank, \"question\": \"$question\", \"answer\": \"$answer\", \"toggle\": $toggle, \"level\": \"$level\" },";
	}
	
	$data .= "{}]";
	echo $data;
}

$server_ip = $_SERVER['REMOTE_ADDR'];
if( isset( $_GET['category'] ) ) {
	Load( $_GET['category'] );
}
?>
