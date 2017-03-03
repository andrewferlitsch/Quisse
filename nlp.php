<?php
include "db.php";

// Natural Language Processing for Questions
class NLP {
	// Get a question from the database
	//
	function Question( $id ) {
		global $db;
		
		return $db->GetQuestion( $id );
	}
	
	// Get Count of questions in database
	//
	function Count( $category ) {
		global $db;
		
		return $db->Count( $category );
	}
	
	// Reduce Text to a Common Reduced Form
	//
	function Reduce( $question ) {
		// replace punctuation with blank space
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
				case "STL": $toks[] = "stl"; break;
				case "CSS": $toks[] = "css"; break;
				}	
			}
		}
		
		// lowercase
		$count = count( $toks );
		for ( $i = 0; $i < $count; $i++ ) {
			$toks[ $i ] = strtolower( $toks[ $i ] );
			// remove hyphenated
			$toks[ $i ] = str_replace( "-", "", $toks[ $i ] );
		}
		
		// filter 
		$tokens = array();
		for ( $i = 0; $i < $count; $i++ ) {
			switch ( $toks[ $i ] ) {
			// remove
			case "across":
			case "after":
			case "been": case "being":
			case "consist":
			case "describe": case "does" : case "during":
			case "each":
			case "from":
			case "into":
			case "keep":
			case "same": case "some":
			case "that": case "then": case "this":
			case "used": case "using":
			case "ways": case "what": case "when": case "where": case "which": case "will": case "with": break;
			
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
		
		// ending 
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
				case "string": break;
				case "writing": $tokens[ $i ] = "write"; break;
				case "sampling": $tokens[ $i ] = "sample"; break;
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
					$tokens[ $i ] = substr( $tokens[ $i ], 0, strlen( $tokens[ $i ] ) - 2 );
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
			// possessive
			else if ( $end == "'s" ) {
				$tokens[ $i ] = substr( $tokens[ $i ], 0, strlen( $tokens[ $i ] ) - 2 );
			}
			
			$end = substr( $tokens[ $i ], -1 );
			// single s plural
			if ( $end == "s" ) {
				// do not remove if double s
				if ( $tokens[ $i ][ strlen( $tokens[ $i ] ) - 2 ] == 's' )
					continue;
				$tokens[ $i ] = substr( $tokens[ $i ], 0, strlen( $tokens[ $i ] ) - 1 );
				continue;
			}
		}

		return $tokens;
	}
	
	//
	function ReduceAll() {
		// get total count of questions in db
		$count = $this->Count();
		
		// Process one question at a time
		for ( $i = 0; $i < $count; $i++ ) {
			$entry = $this->Question( $i );
			
			$tokens = Reduce( $entry[ 'question' ] );
		}
	}
}

// Create an NLP object
$nlp = new NLP();
for ( $i = 260; $i < 330; $i++ ) {
$q = $nlp->Question( $i );
echo $q['question']. "<br/>";
$tokens = $nlp->Reduce( $q['question'] );
print_r( $tokens ); echo "<br/>";
}
?> 