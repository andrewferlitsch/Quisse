<?php
include "../db.php";
if ( isset( $_POST[ 'category' ] ) ) {
	$category = $_POST[ 'category' ];
	$action   = $_POST[ 'action' ];
	$id       = $_POST[ 'id' ];
	$question = addslashes( $_POST[ 'question' ] );
	$answer   = addslashes( $_POST[ 'answer' ] );
	$level    = $_POST[ 'level' ];
	
	if ( $action == "add" ) {
		$result = $db->Add( $category, $question, $answer, $level );
	}
	else if ( $action == "update" ) {
		$result = $db->Update( $id, $question, $answer, $level );
	}
	
	echo $result;
}
?>