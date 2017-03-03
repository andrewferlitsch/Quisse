<?php
$DBNAME      = "interview";
$DBUSER      = "root";
$DBPASS      = "Mary1962";
define("DB_SERVER",    	"localhost");
define("DB_USER",      	"$DBUSER");
define("DB_PASS",      	"$DBPASS");
define("DB_NAME",      	"$DBNAME");
define("TBL_QUESTIONS", "questions" );

class DB
{
	var $connection;         // The MySQL database connection
	var $error;				 // error message
	
	/* Database object constructor */
	function DB()
	{
		/* Make connection to database */
		$this->connection = mysqli_connect( DB_SERVER, DB_USER, DB_PASS, DB_NAME );
		if (!$this->connection) {
			echo mysqli_connect_errno() . PHP_EOL;
			echo mysqli_connect_error() . PHP_EOL;
		}
	}
	
	/*
	 * Load questions from the database for a category
	 */
	function Load( $category )
	{
		$q = "SELECT id,rank,question,answer,toggle FROM " . TBL_QUESTIONS . " WHERE category = '$category'";
		$result = mysqli_query( $this->connection, $q );
		//echo "Q $q<br/>";
        //echo mysql_error( $this->connection ) . "<br/>";

		$questions = array();
        while ( $data = mysqli_fetch_array( $result ) )
        {
			$questions[] = $data;
        }

        return $questions;
	}
	
	/* 
	 * Add a new question to a category
	 */
	function Add( $category, $question, $answer, $rank )
	{
		$q = "INSERT INTO " . TBL_QUESTIONS . "( category, question, answer, rank ) VALUES ( 
				'$category',
				'$question',
				'$answer',
				'$rank' )";
		$result = mysqli_query( $this->connection, $q );
		//echo "Q $q<br/>";
        //echo mysql_error( $this->connection ) . "<br/>";
		
		return $result;
	}
	
	/*
	 * Add a timing entry to the database
	 */
	function UpdateTiming( $id, $timing ) {
		$q = "UPDATE " . TBL_QUESTIONS . " SET tcount=tcount+1, timing=timing+$timing WHERE id=$id";
		$result = mysqli_query( $this->connection, $q );
		//echo "Q $q<br/>";
        //echo mysql_error( $this->connection ) . "<br/>";
		
		return $result;
	}
	
	/*
	 * Get a count of the total number of questions in the database, or in a category
	 */
	function Count( $category ) {
		$q = "SELECT count(*) FROM " . TBL_QUESTIONS;
		if ( $category != "" )
			$q .= " WHERE category='$category'";
		$result = mysqli_query( $this->connection, $q );
		//echo "Q $q<br/>";
		//echo mysql_error( $this->connection ) . "<br/>";
		
		$data = mysqli_fetch_array( $result );
		return $data[ 0 ];
	}
	
	/*
	 * Get a question from the database
	 */
	function GetQuestion( $id ) {
		$q = "SELECT * FROM " . TBL_QUESTIONS . " WHERE id = '$id'";
		$result = mysqli_query( $this->connection, $q );
		//echo "Q $q<br/>";
		//echo mysql_error( $this->connection ) . "<br/>";
		
		$data = mysqli_fetch_array( $result );
		return $data;
	}
}

$db = new DB;
?>