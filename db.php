<?php
$DBNAME      = "interview";
$DBUSER      = "root";
$DBPASS      = "XXX";
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
		$q = "SELECT id,rank,question,answer,toggle,level,similar FROM " . TBL_QUESTIONS . " WHERE category = '$category'";
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
		
		return mysqli_insert_id( $this->connection );
	}
	
	/* 
	 * Update a question
	 */
	function Update( $id, $question, $answer, $rank )
	{
		$q = "UPDATE " . TBL_QUESTIONS . " SET " . 
				"id='$id',
				question='$question',
				answer='$answer',
				rank='$rank'" .
			"WHERE id = $id";
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
	 * Get Questions for a Category
	 */
	function GetQuestions( $category ) {
		$q = "SELECT * FROM " . TBL_QUESTIONS . " WHERE category='$category'";
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
	 * Update the word vector for a question entry in the database
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
	 * Update the word vector for an answer entry in the database
	 */
	function UpdateWordsAn( $id, $words ) {
		$q = "UPDATE " . TBL_QUESTIONS . " SET wordsan = \"";
		
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
	function WordsMatch( $id, $category, $word_vector, $wordan_vector ) {
		$wordan = "";
		for ( $i = 0; $i < count( $wordan_vector ); $i++ ) {
			if ( $i > 0 )
				$wordan .= ",";
			$wordan .= $wordan_vector[ $i ];
		}
		
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
				while ( ( $data = mysqli_fetch_array( $result ) ) != null ) {
					// check for duplicates
					$count = count( $ids );
					for ( $j = 0; $j < $count; $j++ ) {
						$pair = explode( ":", $ids[ $j ] ); 
						if ( $pair[ 1 ] == $data[ 'id' ] ) {
							$pair[ 0 ]++;
							$ids[ $j ] = $pair[ 0 ] . ":" . $pair[ 1 ];
							break;
						}
					} 

					// first occurrence
					if ( $j == $count )
						$ids[] = "1:" . $data[ 'id' ];
				}
			}
			
		}
		
		for ( $i = 0; $i < count( $wordan_vector ); $i++ ) {		
			// from answer section
			$q = "SELECT id,wordsan FROM " . TBL_QUESTIONS . " WHERE id != $id AND category = '$category'" .
			     " AND wordsan LIKE '%" . $wordan_vector[ $i ] . "%'";
				 $result = mysqli_query( $this->connection, $q );

			if ( $this->debug == true ) {
				echo "Q $q". PHP_EOL;
				echo mysqli_error( $this->connection ) . PHP_EOL;
			}
			
			// get the IDs of the similar matching questions
			if ( mysqli_num_rows($result) > 0 ) {
				while ( ( $data = mysqli_fetch_array( $result ) ) != null ) {
					// check for duplicates
					$count = count( $ids );
					for ( $j = 0; $j < $count; $j++ ) {
						$pair = explode( ":", $ids[ $j ] ); 
						if ( $pair[ 1 ] == $data[ 'id' ] ) {
							$pair[ 0 ]++;
							$ids[ $j ] = $pair[ 0 ] . ":" . $pair[ 1 ];
							break;
						}
					} 

					// first occurrence
					if ( $j == $count )
						$ids[] = "1:" . $data[ 'id' ];
				}
			}
		}
		return $this->SortSimilar( $ids );
	}
	
	function SortSimilar( $ids ) {
		$changed = false;
		$count = count( $ids );
		for ( $i = 1; $i < $count; $i++ ) {
			$pair1 = explode( ":", $ids[ $i - 1 ] );
			$pair2 = explode( ":", $ids[ $i ] );
			if ( $pair1[ 0 ] < $pair2[ 0 ] ) {
				$temp = $ids[ $i - 1 ];
				$ids[ $i - 1 ] = $ids[ $i ];
				$ids[ $i ] = $temp;
				$changed = true;
			}
		}
		
		if ( $changed == true )
			return $this->SortSimilar( $ids );
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
	
	/*
	 * Get the Average and Maximum Time for the Category
	 */
	function AvgMaxTiming( $category ) {
		// Calculate Ave, Max (and Min)
		$q = "SELECT AVG(timing/tcount),MAX(timing/tcount) FROM " . TBL_QUESTIONS . " WHERE category='$category' AND tcount>1";
		$result = mysqli_query( $this->connection, $q );
		if ( $this->debug == true ) {
				echo "Q $q". PHP_EOL;
				echo mysqli_error( $this->connection ) . PHP_EOL;
		}
		
		$res = mysqli_fetch_array( $result );
		$ave = $res[ 0 ];
		$max = $res[ 1 ];
		
		// set a low pivot point
		$low = $res[ 1 ] - $res[ 0 ];
		array_push( $res, $low );
		
		// Calculate Learned Difficulty
		$questions = $this->GetQuestions( $category );
		$count = count( $questions );
		for ( $i = 0; $i < $count; $i++ ) {
			$question = $questions[ $i ];
			$timing   = $question[ 'timing' ];
			$tcount   = $question[ 'tcount' ];
			if ( $tcount > 1 ) {
				$q = "UPDATE " . TBL_QUESTIONS . " SET level = ";
				$mean     = $timing / $tcount;
				if ( $mean <= $low )
					$q .= "1";
				else if ( $mean <= $ave )
					$q .= "2";
				else
					$q .= "3";
				$q .= " WHERE id=" . $question[ 'id' ];
				mysqli_query( $this->connection, $q );
				if ( $this->debug == true ) {
					echo "Q $q". PHP_EOL;
					echo mysqli_error( $this->connection ) . PHP_EOL;
				}
			}
		}
		return $res;
	}
	
	/*
	 *Adaptive Setting of Levels from Timing Data
	 */
	function AdaptiveTiming( $category ) {
		$q = "SELECT id,timing/tcount FROM " . TBL_QUESTIONS . " WHERE category='$category' AND tcount>1 ORDER BY timing/tcount";
		$result = mysqli_query( $this->connection, $q );
		if ( $this->debug == true ) {
				echo "Q $q". PHP_EOL;
				echo mysqli_error( $this->connection ) . PHP_EOL;
		}
		
		$count = mysqli_num_rows( $result );
		$low   = round( $count / 3 );
		$mid   = $low * 2;
		
		$res = array();
		for ( $i = 0; $i < $count; $i++ ) {
			$question = mysqli_fetch_array( $result );
			$id   = $question[ 'id' ];
			$q = "UPDATE " . TBL_QUESTIONS . " SET level = ";
			if ( $i <= $low )
				$q .= "1";
			else if ( $i <= $mid )
				$q .= "2";
			else
				$q .= "3";
			$q .= " WHERE id=" . $question[ 'id' ];
			mysqli_query( $this->connection, $q );
			if ( $this->debug == true ) {
				echo "Q $q". PHP_EOL;
				echo mysqli_error( $this->connection ) . PHP_EOL;
			}
			
			array_push( $res, $id );
		}
		
		return $res;
	}
}

$db = new DB;
?>