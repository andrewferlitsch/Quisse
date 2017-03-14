<?php
include "../db.php";
	
function Timing( $id, $timing ) {
	global $db;
	$db->UpdateTiming( $id, $timing );
	echo "ID $id, TIMING $timing<br/>";
}
	
function Scan() {
	$session   = "";
	$category  = "";
	$nsessions = 0;
	$last_time = 0;
	
	$handle = fopen( "../timing.csv", "r" );
	if ( $handle ) {
		while ( ( $line = fgets( $handle ) ) ) {
			$columns = split( ",", $line );
			if ( $columns[ 0 ] != $session ) {
				$session = $columns[ 0 ];
				$nsessions++;
				$category = "";
			}
			
			if ( $columns[ 1 ] != $category ) {
				$last_time = 0;
			}
			
			$category = $columns[ 1 ];
			$id       = $columns[ 2 ];
			$type     = $columns[ 3 ];
			$timing   = $columns[ 4 ];
			
			// not a question in the database
			if ( $id == -1 )
				continue;
			
			switch ( $category ) {
			case "coding": break;
			default      : if ( $type == "init" ) {
								$last_time = $timing;
								continue;
						   }
						   else if ( $type == "next" ) {
							   $diff = ( $timing - $last_time );
							   if ( $diff > 1 && $diff < 20 ) {
								   Timing( $id, $diff );
							   }
							   $last_time = $timing;
						   }
						   break;
			}
		}
		fclose( $handle );
		echo "SESSIONS: $nsessions<br/>";
	}
}

function Level( $category ) {
	global $db;
	
	return $db->AdaptiveTiming( $category );
}

if ( isset( $_POST[ 'action' ] ) ) {
	$action = $_POST[ 'action' ];
	if ( $action == "scan" )
		Scan();
	else if ( $action == "level" ) {
		$category = $_POST[ 'category' ];
		$res = Level( $category );
		echo $res;
	}
}
?>