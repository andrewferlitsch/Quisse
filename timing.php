<?php
$timing = $_POST[ 'timing' ];
for ( $i = 0; $i < count( $timing ); $i++ ) {
		$row = $timing[ $i ];
		$session  = $row['session'];
		$category = $row['category'];
		$id       = $row['id'];
		$type     = $row['type'];
		$time     = $row['time'];
		
		$txt = $session . "," . $category . "," . $id . "," . $type . "," . $time;
		$file = file_put_contents( "timing.csv", $txt.PHP_EOL , FILE_APPEND | LOCK_EX);
		fclose( $file );
}
?>
