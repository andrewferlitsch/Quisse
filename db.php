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
	var $debug = false;		 // debugging
	
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
		if ( $this->debug == true ) {
			echo "Q $q". PHP_EOL;
			echo mysqli_error( $this->connection ) . PHP_EOL;
		}

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
		if ( $this->debug == true ) {
			echo "Q $q". PHP_EOL;
			echo mysqli_error( $this->connection ) . PHP_EOL;
		}
		
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
		if ( $this->debug == true ) {
			echo "Q $q". PHP_EOL;
			echo mysqli_error( $this->connection ) . PHP_EOL;
		}
		
		$data = mysqli_fetch_array( $result );
		return $data[ 0 ];
	}
	
	/*
	 * Update the timing data for an entry in the database
	 */
	function UpdateTiming( $id, $timing ) {
		$q = "UPDATE " . TBL_QUESTIONS . " SET tcount=tcount+1, timing=timing+$timing WHERE id=$id";
		$result = mysqli_query( $this->connection, $q );
		if ( $this->debug == true ) {
			echo "Q $q". PHP_EOL;
			echo mysqli_error( $this->connection ) . PHP_EOL;
		}
		
		return $result;
	}
	
	/*
	 * Get List of all Categories
	 */
	function GetCategories() {
		$q = "SELECT DISTINCT category FROM " . TBL_QUESTIONS;
		$result = mysqli_query( $this->connection, $q );
		if ( $this->debug == true ) {
			echo "Q $q". PHP_EOL;
			echo mysqli_error( $this->connection ) . PHP_EOL;
		}
		
		$categories = array();
        while ( $data = mysqli_fetch_array( $result ) )
        {
			$categories[] = $data[ 'category' ];
        }
		
		return $categories;
	}
	
	/*
	 * Get a question from the database
	 */
	function GetQuestion( $id ) {
		$q = "SELECT * FROM " . TBL_QUESTIONS . " WHERE id = '$id'";
		$result = mysqli_query( $this->connection, $q );
		if ( $this->debug == true ) {
			echo "Q $q". PHP_EOL;
			echo mysqli_error( $this->connection ) . PHP_EOL;
		}
		
		$data = mysqli_fetch_array( $result );
		return $data;
	}
	
	/*
	 * Update the word vector for an entry in the database
	 */
	function UpdateWords( $id, $words ) {
		$q = "UPDATE " . TBL_QUESTIONS . " SET words = \"";
		
		$count = count( $words );
		for ( $i = 0; $i < $count; $i++ ) {
			if ( $i > 0 )
				$q .= ",";
			$q .= $words[ $i ];
		}
		
		$q .= "\" WHERE id=$id";
		
		$result = mysqli_query( $this->connection, $q );
		if ( $this->debug == true ) {
			echo "Q $q". PHP_EOL;
			echo mysqli_error( $this->connection ) . PHP_EOL;
		}
		
		return $result;
	}
	
	/*
	 * Find word vector similar matches for question
	 */
	function WordsMatch( $id, $category, $word_vector ) {
		$ids = array();
		for ( $i = 0; $i < count( $word_vector ); $i++ ) {
			$q = "SELECT id,words FROM " . TBL_QUESTIONS . " WHERE id != $id AND category = '$category'" .
			     " AND words LIKE '%" . $word_vector[ $i ] . "%'";
				 $result = mysqli_query( $this->connection, $q );

			if ( $this->debug == true ) {
				echo "Q $q". PHP_EOL;
				echo mysqli_error( $this->connection ) . PHP_EOL;
			}
			
			// get the IDs of the similar matching questions
			if ( mysqli_num_rows($result) > 0 ) {
				while ( ( $data = mysqli_fetch_array( $result ) ) != null )
					$ids[] = $data[ 'id' ];
			}
		}
		return $ids;
	}
	
	/*
	 * Update the similar matches for an entry in the database
	 */
	function UpdateSimilar( $id, $ids ) {
		$q = "UPDATE " . TBL_QUESTIONS . " SET similar = \"";
		
		$count = count( $ids );
		for ( $i = 0; $i < $count; $i++ ) {
			if ( $i > 0 )
				$q .= ",";
			$q .= $ids[ $i ];
		}
		
		$q .= "\" WHERE id=$id";
		
		$result = mysqli_query( $this->connection, $q );
		if ( $this->debug == true ) {
			echo "Q $q". PHP_EOL;
			echo mysqli_error( $this->connection ) . PHP_EOL;
		}
		
		return $result;	
	}
}

$db = new DB;
?>