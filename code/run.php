<?php
// Get the program
$program = $_POST[ 'program' ];
$program = "Prime";

$rc = exec( "java >stdout" + $program, &$output, &$ret );

// get stdout
$file = fopen("stdout","r");
$out = fgets($file);
fclose($file);

echo "{ \"status\": $ret, \"output\": \"$out\" }";
?>