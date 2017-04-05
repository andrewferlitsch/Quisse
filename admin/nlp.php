<?php
include "../db.php";

// Natural Language Processing for Questions
class NLP {
	/*
	 * Get a question from the database
	*/
	function Question( $id ) {
		global $db;
		
		return $db->GetQuestion( $id );
	}
	
	/*
	 * Get Count of questions in database
	*/
	function Count( $category ) {
		global $db;
		
		return $db->Count( $category );
	}
	
	/*
	 * Get all questions from a category
	*/
	function Category( $category ) {
		global $db;
		
		return $db->GetQuestions( $category );
	}
	
	/*
	 * Reduce Text to a Common Reduced Form
	*/
	function Reduce( $question ) {
		// replace punctuation with blank space
		$question = preg_replace( '/\?|\(|\)|\$|\.|\/|:|<|>|=|;|\+|\-|\,|\'/', " ", $question );
		
		// split on blank space
		$words = explode( ' ', $question );
		
		// eliminate 1, 2 and 3 char words
		$toks = array();
		$count = count( $words );
		for ( $i = 0; $i < $count; $i++ ) {
			$len = strlen( $words[ $i ] );
			if ( $len > 3 ) {
				$toks[] = $words[ $i ];
			}
			else if ( $len == 3 ) {
				switch ( $words[ $i ] ) {
				case "int": $toks[] = "integer"; break;
				case "tag": $toks[] = "tag"; break;
				case "add": $toks[] = "add"; break;
				case "row": $toks[] = "row"; break;
				case "box": $toks[] = "box"; break;
				case "Web": 
				case "web": $toks[] = "web"; break;
				case "net": $toks[] = "net"; break;
				case "max": $toks[] = "maximum"; break;
				case "min": $toks[] = "minimum"; break;
				default: // All Caps abbreviation
						 if ( strtoupper( $words[ $i ] ) == $words[ $i ] )
							$toks[] = $words[ $i ];
						 break;
				}	
			}
		}
		
		// lowercase
		$count = count( $toks );
		for ( $i = 0; $i < $count; $i++ ) {
			$toks[ $i ] = strtolower( $toks[ $i ] );
			// remove hyphenated (obsolete)
			$toks[ $i ] = str_replace( "-", "", $toks[ $i ] );
		}
		
		// filter 
		$tokens = array();
		for ( $i = 0; $i < $count; $i++ ) {
			switch ( $toks[ $i ] ) {
			// stop words
			case "about": case "across": case "after":
			case "before": case "been": case "being": case "between":
			case "consist":
			case "describe": case "does" : case "during":
			case "each": case "eight": case "example": case "explain":
			case "first": case "five": case "four": case "from":
			case "give":
			case "happen": case "have": case "having":
			case "into": case "include": case "includes":
			case "just":
			case "keep":
			case "later":
			case "make": case "meant": case "most":
			case "nine":
			case "occur": case "once": case "only": case "other": case "over":
			case "part": case "prior":
			case "running":
			case "same": case "seven": case "should": case "some":
			case "taking": case "tell": case "than": case "that": case "then": case "their": case "there": case "this": case "three":
			case "typical": case "typically":
			case "used": case "using":
			case "ways": case "what": case "when": case "where": case "which": case "will": case "with": 
			case "your": break;
			
			// replace
			case "angularjs": $tokens[] = "angular"; break;
			
			default: /* remove duplicates */
				for ( $j = 0; $j < $i; $j++ )
					if ( $toks[ $i ] == $toks[ $j ] )
						break;
				if ( $i == $j )
					$tokens[] = $toks[ $i ]; 
				 break;
			}
		}
		
		// stemming
		$count = count( $tokens );
		for ( $i = 0; $i < $count; $i++ ) { 
			$end = substr( $tokens[ $i ], -3 );
			// end in ies replaced with y
			if ( $end == "ies" ) {
				switch ( $tokens[ $i ] ) {
				case "series": break;
				default:
					$tokens[ $i ] = substr( $tokens[ $i ], 0, strlen( $tokens[ $i ] ) - 3 ) . "y";
				}
				continue;
			}
			// end in ied replaced with y
			else if ( $end == "ied" ) {
				$tokens[ $i ] = substr( $tokens[ $i ], 0, strlen( $tokens[ $i ] ) - 3 ) . "y";
			}
			// drop ing ending
			else if ( $end == "ing" ) {
				switch ( $tokens[ $i ] ) {
				case "string": case "substring": case "docstring": case "pickling": break;
				case "writing": $tokens[ $i ] = "write"; break;
				case "sampling": $tokens[ $i ] = "sample"; break;
				case "indicating": $tokens[ $i ] = "indicate"; break;
				case "creating": $tokens[ $i ] = "create"; break;
				case "hiding": $tokens[ $i ] = "hide"; break;
				case "adding": $tokens[ $i ] = "add"; break;
				case "removing": $tokens[ $i ] = "remove"; break;
				case "sharing": $tokens[ $i ] = "share"; break;
				case "encoding": $tokens[ $i ] = "encode"; break;
				case "paging": $tokens[ $i ] = "page"; break;
				case "scheduling": $tokens[ $i ] = "schedule"; break;
				case "slicing": $tokens[ $i ] = "slice"; break;
				case "recycling": $tokens[ $i ] = "recycle"; break;
				case "calculating": $tokens[ $i ] = "calculate"; break;
				case "managing": $tokens[ $i ] = "manage"; break;
				case "deciding": $tokens[ $i ] = "decide"; break;
				default:
					// drop duplicate n, m, t or d when adding ing
					if ( ( $tokens[ $i ][ strlen( $tokens[ $i ] ) - 4 ] == 'n' && $tokens[ $i ][ strlen( $tokens[ $i ] ) - 5 ] == 'n' ) ||
						 ( $tokens[ $i ][ strlen( $tokens[ $i ] ) - 4 ] == 'm' && $tokens[ $i ][ strlen( $tokens[ $i ] ) - 5 ] == 'm' ) ||
						 ( $tokens[ $i ][ strlen( $tokens[ $i ] ) - 4 ] == 'd' && $tokens[ $i ][ strlen( $tokens[ $i ] ) - 5 ] == 'd' ) ||
						 ( $tokens[ $i ][ strlen( $tokens[ $i ] ) - 4 ] == 't' && $tokens[ $i ][ strlen( $tokens[ $i ] ) - 5 ] == 't' ) )
						$tokens[ $i ] = substr( $tokens[ $i ], 0, strlen( $tokens[ $i ] ) - 4 );
					else
						$tokens[ $i ] = substr( $tokens[ $i ], 0, strlen( $tokens[ $i ] ) - 3 );
				}
				continue;
			}
			
			$end = substr( $tokens[ $i ], -2 );
			// plural ending in es
			if ( $end == "es" ) {
				// s, x, z, ch, or sh
				$ch = $tokens[ $i ][ strlen( $tokens[ $i ] ) - 3 ];
				switch ( $ch ) {
				// es plural
				case 's': case 'x': case 'z':
					switch ( $tokens[ $i ] ) {
					case "cases": $tokens[ $i ] = "case"; break;
					case "prioritizes": $tokens[ $i ] = "prioritize"; break;
					default:
						$tokens[ $i ] = substr( $tokens[ $i ], 0, strlen( $tokens[ $i ] ) - 2 );
						break;
					}
					break;
				case 'h':
					$ch = $tokens[ $i ][ strlen( $tokens[ $i ] ) - 4 ];
					// es plural
					if ( $ch == 's' || $ch == 'c' ) {
						$tokens[ $i ] = substr( $tokens[ $i ], 0, strlen( $tokens[ $i ] ) - 2 );
					}
					// single s plural
					else 
						$tokens[ $i ] = substr( $tokens[ $i ], 0, strlen( $tokens[ $i ] ) - 1 );
					break;
				// single s plural
				default:
					$tokens[ $i ] = substr( $tokens[ $i ], 0, strlen( $tokens[ $i ] ) - 1 );
					break;
				}
				continue;
			}
			// possessive (obsolete)
			else if ( $end == "'s" ) {
				$tokens[ $i ] = substr( $tokens[ $i ], 0, strlen( $tokens[ $i ] ) - 2 );
				continue;
			}
			
			// past tense ending in ed
			if ( $end == "ed" ) {
				// ed after r, keep the e
				if ( $tokens[ $i ][ strlen( $tokens[ $i ] ) - 3 ] == 'r' ) {
					switch ( $tokens[ $i ] ) {
					case "triggered": $tokens[ $i ] = "trigger"; break;
					default:
						$tokens[ $i ] = substr( $tokens[ $i ], 0, strlen( $tokens[ $i ] ) - 1 );
					}
				}
				// ed after double p, drop the ped
				else if ( $tokens[ $i ][ strlen( $tokens[ $i ] ) - 3 ] == 'p' && 
						  $tokens[ $i ][ strlen( $tokens[ $i ] ) - 4 ] == 'p') {
					$tokens[ $i ] = substr( $tokens[ $i ], 0, strlen( $tokens[ $i ] ) - 3 );
				}
			}
		
			$end = substr( $tokens[ $i ], -1 );
			// single s plural
			if ( $end == "s" ) {
				// do not remove if double s
				if ( $tokens[ $i ][ strlen( $tokens[ $i ] ) - 2 ] == 's' )
					continue;
				switch ( $tokens[ $i ] ) {
				case "analysis": case "bias": case "status": break;
				default: $tokens[ $i ] = substr( $tokens[ $i ], 0, strlen( $tokens[ $i ] ) - 1 );
						break;
				}
				continue;
			}
		}

		return $tokens;
	}
	
	/*
	 * Do a Reduce on a question/answer in the database
	 */
	function ReduceQuestion( $id ) {
		global $db;

		// get the question data
		$entry = $this->Question( $id );
		
		// reduce the question to a bag of words
		$tokens = $this->Reduce( $entry[ 'question' ] );
		
		// store back into the database
		$db->UpdateWords( $id, $tokens );
		
		// reduce the answer to a bag of words
		$tokensa = $this->Reduce( $entry[ 'answer' ] );
		
		// store back into the database
		$db->UpdateWordsAn( $id, $tokensa );
		$res = array(); array_push( $res, $tokens ); array_push( $res, $tokensa );
		return $res;

	}
	
	/*
	 * Do a Reduce on all questions in the database
	 */
	function ReduceAll() {
		global $db;
		
		// get total count of questions in db
		$count = $this->Count( "" );
		
		// Process one question/answer at a time
		echo "[";
		for ( $i = 1; $i <= $count; $i++ ) {
			$entry = $this->Question( $i );
			
			$tokens = $this->Reduce( $entry[ 'question' ] );
			if ( $i > 1 ) echo ",";
			echo "$i";
			$db->UpdateWords( $i, $tokens );
			
			$tokens = $this->Reduce( $entry[ 'answer' ] );
			if ( $i > 1 ) echo ",";
			echo "$i";
			$db->UpdateWordsAn( $i, $tokens );
		}
		echo "]";
	}
	
	/*
	 * Do a Reduce on all questions in a category
	 */
	function ReduceCategory( $category ) {
		global $db;
		
		// Get all questions in this category
		$questions = $this->Category( $category );
		
		// get total count of questions in this category
		$count = count( $questions );
		
		// Process one question at a time
		$ids = array();
		for ( $i = 0; $i < $count; $i++ ) {
			$entry = $this->Question( $questions[ $i ][ 'id' ] );
			
			$tokens = $this->Reduce( $entry[ 'question' ] );
			$db->UpdateWords( $questions[ $i ][ 'id' ], $tokens );
			
			$tokens = $this->Reduce( $entry[ 'answer' ] );
			$db->UpdateWordsAn( $questions[ $i ][ 'id' ], $tokens );
			
			array_push( $ids, $questions[ $i ][ 'id' ] );
		}
		return $ids;
	}
	
	/*
	 * Find Similar Matches for questions' Word Vector from other questions
	 */
	function ReduceMatchCategory( $category ) {
		global $db;
		
		// Get all questions in this category
		$questions = $this->Category( $category );
		
		// get total count of questions in this category
		$count = count( $questions );
		$res = array();
		for ( $i = 0; $i < $count; $i++ ) {
			$entry = $questions[ $i ];
			$word_vector   = explode( ",", $entry[ 'words' ] );
			$wordan_vector = explode( ",", $entry[ 'wordsan' ] );
			
			// entry has a non-zero length word vector
			if ( count( $word_vector ) > 0 ) {
				$id = $entry[ 'id' ];
				// get IDs of similar matching questions
				$ids = $db->WordsMatch( $id, $category, $word_vector, $wordan_vector );
			
				// entry has non-zero length similar matches
				if ( count( $ids ) > 0 ) {
					array_push( $res, $ids );
				}
				$db->UpdateSimilar( $id, $ids );
			}
		}
		return $res;
	}
	
	/*
	 * Find Similar Matches for questions' Word Vector from other questions
	 */
	function ReduceMatch( $id ) {
		global $db;
		
		// get the word vector and category for this question
		$entry = $db->GetQuestion( $id );
		$word_vector   = explode( ",", $entry[ 'words' ] );
		$wordan_vector = explode( ",", $entry[ 'wordsan' ] );
		$category      = $entry[ 'category' ];
		
		// entry has a non-zero length word vector
		if ( count( $word_vector ) > 0 ) {
			// get IDs of similar matching questions
			$ids = $db->WordsMatch( $id, $category, $word_vector, $wordan_vector );
			
			// entry has non-zero length similar matches
			$res = array();
			if ( count( $ids ) > 0 ) {
				for ( $i = 0; $i < count( $ids ); $i++ ) {
					$pair = explode( ":", $ids[ $i ] );
					$entry = $db->GetQuestion( $pair[ 1 ] );
					array_push( $res, $entry );
				}
			}
			$db->UpdateSimilar( $id, $ids );
			return $res;
		}
	}
}

// Create an NLP object
$nlp = new NLP();

// Create the word vector for each question
error_reporting(E_ALL);
ini_set('display_errors', 1);

if ( isset( $_POST[ 'action' ] ) ) {
	// Reduce a Question
	if ( $_POST[ 'action' ] == "reduce" ) {
		$id = $_POST[ 'id' ];
		$res = $nlp->ReduceQuestion( $id );
		$count = count( $res[ 0 ] );
		for ( $i = 0; $i < $count; $i++ ) {
			if ( $i > 0 ) echo ",";
			echo $res[ 0 ][ $i ];
		}
		echo "|";
		$count = count( $res[ 1 ] );
		for ( $i = 0; $i < $count; $i++ ) {
			if ( $i > 0 ) echo ",";
			echo $res[ 1 ][ $i ];
		}
	}
	// Reduce all questions in category
	else if ( $_POST[ 'action' ] == "reduce-cat" ) {
		$category = $_POST[ 'category' ];
		$ids = $nlp->ReduceCategory( $category );
		$count = count( $ids );
		echo "[";
		for ( $i = 0; $i < $count; $i++ ) {
			echo $ids[ $i ] . ",";
		}
		echo "]";
	}
	// Reduce all questions
	else if ( $_POST[ 'action' ] == "reduce-all" ) {
		$nlp->ReduceAll();
	}
	// Find Similar for a Question
	else if ( $_POST[ 'action' ] == "similar" ) {
		$id = $_POST[ 'id' ];
		$res = $nlp->ReduceMatch( $id );
		$count = count( $res );
		for ( $i = 0; $i < $count; $i++ ) {
			if ( $i > 0 ) echo "\n";
			echo $res[ $i ]['id'] . ":" . $res[ $i ][ 'answer'];
		}
	}
	else if ( $_POST[ 'action' ] == "similar-cat" ) {
		$category = $_POST[ 'category' ];
		$ids = $nlp->ReduceMatchCategory( $category );
		$count = count( $ids );
		echo "[";
		for ( $i = 0; $i < $count; $i++ ) {
			if ( $i > 0 ) echo ",";
			$n = count( $ids[ $i ] );
			echo "{ ids:";
			for ( $j = 0; $j < $n; $j++ ) {
				if ( $j > 0 ) echo ",";
				echo $ids[ $i ][ $j ];
			}
			echo "}";
		}
		echo "]";
	}
	else if ( $_POST[ 'action' ] == "similar-all" ) {
		$count = $nlp->Count( "" );
		echo "[";
		for ( $id = 1; $id < $count; $id++ ) {
			if ( $id > 1 ) echo ",";
			$ids = $nlp->ReduceMatch( $id );
			echo "{id: $id, ids: [";
			for ( $i = 0; $i < count( $ids ); $i++ ) {
				if ( $i > 0 ) echo ",";
				echo $ids[ $i ][ 0 ];
			}
			echo "] }";
		}
		echo "]";
	}
}

?> 