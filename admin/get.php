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
		$rank     = $entry[ 'rank' ];
		$level    = $entry[ 'level' ];
		$tcount   = $entry[ 'tcount' ];
		$timing   = $entry[ 'timing' ];
		$words    = $entry[ 'words' ];
		$wordsan  = $entry[ 'wordsan' ];
		$similar  = $entry[ 'similar' ];
		$out .= "{ \"id\": $id, \"question\": \"$question\", \"answer\": \"$answer\", \"rank\": $rank,  \"level\": \"$level\", \"tcount\": $tcount, \"timing\": $timing, \"words\": \"$words\", \"similar\": \"$similar\", \"wordsan\": \"$wordsan\" }";
		
		// not the last entry
		if ( $i < $count - 1 )
			$out .= ",";
	}
	$out .= "]";
	echo $out;
}
else if ( isset( $_GET[ 'id' ] ) ) {
	$entry = $db->GetQuestion( $_GET[ 'id' ] );

	$id       = $entry[ 'id' ];
	$question = str_replace( '"', '\\"', $entry[ 'question' ] );
	$answer   = str_replace( '"', '\\"', $entry[ 'answer' ] );
	$level    = $entry[ 'rank' ];
	$tcount   = $entry[ 'tcount' ];
	$timing   = $entry[ 'timing' ];
	$words    = $entry[ 'words' ];
	$wordsan  = $entry[ 'wordsan' ];
	$similar  = $entry[ 'similar' ];
	$out .= "{ \"id\": $id, \"question\": \"$question\", \"answer\": \"$answer\", \"level\": $level, \"tcount\": $tcount, \"timing\": $timing, \"words\": \"$words\", \"similar\": \"$similar\", \"wordsan\": \"$wordsan\" }";

	echo $out;
}
?>