<?php
	$session   = "";
	$category  = "";
	$nsessions = 0;
	$last_time = 0;
	
	$handle = fopen( "timing.csv", "r" );
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
			
			switch ( $category ) {
			case "coding": break;
			default      : if ( $type == "init" ) {
								$last_time = $timing;
								continue;
						   }
						   else if ( $type == "next" || $type == "harder" || $type == "easier" ) {
							   $diff = ( $timing - $last_time );
							   if ( $diff < 20 ) {
								   echo "SELECt tcount FROM questions where id=$id<br/>";
								   echo "UPDATE questions set tcount=$tcount where id=$id";
							   }
						   }
						   $last_time = $timing;
						   break;
			}
		}
		fclose( $handle );
		echo "SESSIONS: $nsessions<br/>";
	}
?>