<?php
include "db.php";

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
	 * Reduce Text to a Common Reduced Form
	*/
	function Reduce( $question ) {
		// replace punctuation with blank space
		//	can't get single quote to work
		$question = preg_replace( '/\?|\(|\)|\$|\.|\/|:|<|>|=|;|\+|\-|\,/', " ", $question );
		
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
			case "into":
			case "just":
			case "keep":
			case "later":
			case "make": case "meant": case "most":
			case "nine":
			case "occur": case "once": case "only": case "over":
			case "part": case "prior":
			case "running":
			case "same": case "seven": case "should": case "some":
			case "taking": case "tell": case "than": case "that": case "then": case "their": case "there": case "this": case "three":
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
				default:
					// drop duplicate n, m or d when adding ing
					if ( ( $tokens[ $i ][ strlen( $tokens[ $i ] ) - 4 ] == 'n' && $tokens[ $i ][ strlen( $tokens[ $i ] ) - 5 ] == 'n' ) ||
						 ( $tokens[ $i ][ strlen( $tokens[ $i ] ) - 4 ] == 'm' && $tokens[ $i ][ strlen( $tokens[ $i ] ) - 5 ] == 'm' ) ||
						 ( $tokens[ $i ][ strlen( $tokens[ $i ] ) - 4 ] == 'd' && $tokens[ $i ][ strlen( $tokens[ $i ] ) - 5 ] == 'd' ) )
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
				if ( $tokens[ $i ][ strlen( $tokens[ $i ] ) - 3 ] == 'r' )
					$tokens[ $i ] = substr( $tokens[ $i ], 0, strlen( $tokens[ $i ] ) - 1 );
			}
			
			$end = substr( $tokens[ $i ], -1 );
			// single s plural
			if ( $end == "s" ) {
				// do not remove if double s
				if ( $tokens[ $i ][ strlen( $tokens[ $i ] ) - 2 ] == 's' )
					continue;
				switch ( $tokens[ $i ] ) {
				case "status": break;
				default: $tokens[ $i ] = substr( $tokens[ $i ], 0, strlen( $tokens[ $i ] ) - 1 );
						break;
				}
				continue;
			}
		}

		return $tokens;
	}
	
	/*
	 * Do a Reduce on all questions in the database
	 */
	function ReduceAll() {
		global $db;
		
		// get total count of questions in db
		$count = $this->Count( "" );
		
		// Process one question at a time
		for ( $i = 1; $i <= $count; $i++ ) {
			$entry = $this->Question( $i );
			
			$tokens = $this->Reduce( $entry[ 'question' ] );
			echo "<pre>$i: " . $entry['question']. "</pre>";
			print_r( $tokens ); echo "<br/>";
			$db->UpdateWords( $i, $tokens );
		}
	}
	
	/*
	 * Find Matches for questions's Word Vector from other questions
	 */
	function ReduceMatch( $id ) {
		global $db;
		
		// get the word vector and category for this question
		$entry = $db->GetQuestion( $id );
		$word_vector = explode( ",", $entry[ 'words' ] );
		$category    = $entry[ 'category' ];
		
		// entry has a non-zero length word vector
		if ( count( $word_vector ) > 0 ) {
			// get IDs of similar matching questions
			$ids = $db->WordsMatch( $id, $category, $word_vector );
			
			// entry has non-zero length similar matches
			if ( count( $ids ) > 0 ) {
				echo "<pre>ID $id:" . $entry[ 'question' ]. "<br/>";
				echo "A: " . $entry[ 'answer' ] . "<br/>";
				for ( $i = 0; $i < count( $ids ); $i++ ) {
					$entry = $db->GetQuestion( $ids[ $i ] );
					echo "S: " . $entry[ 'answer' ] . "<br/>";
				}
				echo "</pre><br/>";
				$db->UpdateSimilar( $id, $ids );
			}
		}
	}
}

// Create an NLP object
$nlp = new NLP();

// Create the word vector for each question
error_reporting(E_ALL);
ini_set('display_errors', 1);
$nlp->ReduceAll();

// Find similar matching questions
for ( $id = 1; $id < 820; $id++ ) {
	$nlp->ReduceMatch( $id );
}

?> 