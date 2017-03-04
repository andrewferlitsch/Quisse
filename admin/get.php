<?php
include "../db.php";
if ( isset( $_GET[ 'category' ] ) ) {
	$questions = $db->GetQuestions( $_GET[ 'category' ] );
	
	$out = "[";
	$count = count( $questions );
	for ( $i = 0; $i < $count; $i++ ) {
		$entry    = $questions[ $i ];
		$id       = $entry[ 'id' ];
		$question = str_replace( '"', '\\"', $entry[ 'question' ] );
		$answer   = str_replace( '"', '\\"', $entry[ 'answer' ] );
		$level    = $entry[ 'rank' ];
		$out .= "{ \"id\": $id, \"question\": \"$question\", \"answer\": \"$answer\", \"level\": $level }";
		
		// not the last entry
		if ( $i < $count - 1 )
			$out .= ",";
	}
	$out .= "]";
	echo $out;
}
?>