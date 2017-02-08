<?php
if( isset( $_POST['category'] ) ) {
	$session  = $_POST['session'];
	$category = $_POST['category'];
	$id       = $_POST['id'];
	$type     = $_POST['type'];
	$time     = $_POST['time'];
	
	$txt = $session . "," . $category . "," . $id . "," . $type . "," . $time;
	$file = file_put_contents( "timing.csv", $txt.PHP_EOL , FILE_APPEND | LOCK_EX);
	fclose( $file );
}
?>