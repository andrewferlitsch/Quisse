<?php
session_start();
include "../db.php";
if ( isset( $_POST[ 'category' ] ) ) {
	$category = $_POST[ 'category' ];
	$action   = $_POST[ 'action' ];
	$id       = $_POST[ 'id' ];
	$question = addslashes( $_POST[ 'question' ] );
	$answer   = addslashes( $_POST[ 'answer' ] );
	$rank     = $_POST[ 'rank' ];
	
	// requires being admin
	if ( $_SESSION["userid"] == 1 ) {
		if ( $action == "add" ) {
			$result = $db->Add( $category, $question, $answer, $rank );
		}
		else if ( $action == "update" ) {
			$result = $db->Update( $id, $question, $answer, $rank );
		}
	}
	
	echo $result;
}
?>