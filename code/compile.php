<?php
// Get the program
$program = $_POST[ 'program' ];
$handle = fopen( "temp.java", "w");
$rc = fwrite( $handle, $program . PHP_EOL );
fclose( $handle );

// compile the program
$rc = exec( "javac temp.java 2>stderr", &$output, &$ret );

// get stderr
$file = fopen("stderr","r");
$err = fgets($file);
fclose($file);

$err = str_replace( "\n", '<br />', $err ); 
echo "{ \"status\": $ret, \"error\": \"$err\" }";
?>