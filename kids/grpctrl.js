
technical.controller( 'grpCtrl', function( $scope, $http, $location, $anchorScroll ) {
	$scope.subject 	= "Group";
	$scope.name     = "group";
	$scope.rank     = 1;
	$scope.nquestions = 1;
	$scope.correct    = 0;
	
	$scope.questions = [{ question: "placeholder 1",
						  answer: "",
						  rank: 1,
						  id: 1
						}
					  ];
	$scope.groups = [ { category: "Animal", sub: "Pet", desc: "Household Pets", list: [ "cat", "dog", "bird" ]
					  },
					  { category: "Animal", sub: "Pet", desc: "Rodent Pets", list: [ "gerbil", "hamster", "guinea pig" ]
					  },
					  { category: "Animal", sub: "Pet", desc: "Bird Pets", list: [ "canary", "parakeet", "parrot" ]
					  },
					  { category: "Animal", sub: "Pet", desc: "Reptile Pets", list: [ "snake", "turtle", "lizard" ]
					  },
					  { category: "Animal", sub: "Farm", desc: "Farm Animals", list: [ "pig", "cow", "chicken" ]
					  },
					  { category: "Animal", sub: "Farm", desc: "Packing Animals", list: [ "horse", "mule", "donkey" ]
					  },
					  { category: "Animal", sub: "Farm", desc: "Herd Animals", list: [ "cattle", "sheep", "llamas" ]
					  },
					  { category: "Animal", sub: "Wild", desc: "Africa Predator Animals", list: [ "lion", "tiger", "leopard" ]
					  },
					  { category: "Animal", sub: "Wild", desc: "Africa Large Animals", list: [ "elephant", "giraffe", "rhinoceros" ]
					  },
					  { category: "Animal", sub: "Wild", desc: "America Predator Animals", list: [ "bear", "wolf", "coyote" ]
					  },
					  { category: "Animal", sub: "Wild", desc: "America Grazing Animals", list: [ "moose", "deer", "antelope" ]
					  },
					  { category: "Fish", sub: "River", desc: "Common River Fish", list: [ "pike", "trout", "catfish"]
					  },
					  { category: "Fish", sub: "River", desc: "Common River/Ocean Fish", list: [ "salmon", "bass", "sturgeon"]
					  },
					  { category: "Fish", sub: "Ocean", desc: "Common Ocean Fish", list: [ "tuna", "bluefish", "cod"]
					  },
					  { category: "Fish", sub: "Ocean", desc: "Sea Mammals", list: [ "dolphin", "whale", "sea lion"]
					  },
					  { category: "Fish", sub: "Ocean", desc: "Crustaceans", list: [ "crab", "shrimp", "krill"]
					  },
					  { category: "Fish", sub: "Ocean", desc: "Ocean Predators", list: [ "shark", "orca", "sea snake"]
					  },
					  { category: "Bird", sub: "Wild", desc: "Common Birds", list: [ "pigeon", "woodpecker", "owl" ]
					  },
					  { category: "Bird", sub: "Wild", desc: "Flightless Birds", list: [ "ostrich", "emu", "penguin" ]
					  },
					  { category: "Bird", sub: "Wild", desc: "Birds of Prey", list: [ "hawk", "eagle", "falcon" ]
					  },
					  { category: "Bird", sub: "Wild", desc: "Migrating Birds", list: [ "geese", "harrier", "duck" ]
					  },
					  { category: "Transportation", sub: "Land", desc: "Public Transport", list: [ "bus", "train", "street car" ]
					  },
					  { category: "Transportation", sub: "Land", desc: "Personal Transportation", list: [ "car", "motorcycle", "bike" ]
					  },
					  { category: "Transportation", sub: "Water", desc: "Public Ocean Transport", list: [ "ferry", "ocean liner", "cruise ship" ]
					  },
					  { category: "Transportation", sub: "Water", desc: "Sailing Ships", list: [ "sail boat", "yacht", "cutter" ]
					  }
					];
					
	$scope.Size = $scope.groups.length;
	
	// Scroll to Content
	$scope.scrollTo = function() {
      $location.hash( $scope.name );
      $anchorScroll();
	  
	  // Load the Q&A from Database when visible
	  if ( $scope.show ) {
		$scope.random 	 = $scope.Group( 1 );

		onnext = Timestamp( $scope.name, 0, "init" );
	  
		Tally( $scope.name, 1, 0 );
		
		counter = 0;
		$scope.nquestions = 0;
		$scope.correct    = 0;
		$scope.rank  = 1;
		$scope.quiz  = false;
		$scope.qa    = true;
		$scope.multi = false;
	  }
    }
	
	$scope.Group = function( level ) {
		var select = Math.floor( Math.random() * $scope.Size );
		var answer = $scope.groups[ select ].desc + ":";
		var wrong = "";
console.log( "LEVEL " + level );
		if ( level > 0 ) {
			while ( true ) {
				var n = Math.floor( Math.random() ) * $scope.Size;
				// do not pick the same selection
				if ( n == select ) continue;
				
				// look for a group that is not the same category
				if ( $scope.groups[ n ].category == $scope.groups[ select ].category )
					continue;
				
				// randomly pick one item from this group's list as the item that does not belong
				wrong = $scope.groups[ n ].list[ Math.floor( Math.random() ) * 3 ];
				break;
			}
		}
console.log( "DONE");
		
		var list = "";
			
		// pick random position to insert wrong item
		var insert = Math.floor( Math.random() ) * 4;
		
		var j = i = 0;
		for ( /**/; i < 4; i++ ) {
			if ( i > 0 ) list += ", ";
			if ( i == insert )
				list += wrong;
			else 
				list += $scope.groups[ select ].list[ j++ ];
		}
		
		return [ { question: "Which item does not belong: " + list, 
				   answer: wrong + " does not belong in " + $scope.groups[ select ].desc,
				   rank: level, id: -1 }
				];
	}

	var onnext    = 0;										// timestamp of next question
	var onanswer  = 0;										// timestamp when answer flipped
	var oncorrect = 0;										// timestamp when Got it checked
	var ncorrect  = 0;										// number of correct answers at this level
	var counter   = 0;										// counter for number of questions at this level
	var THRESHOLD = 4;
	
	// Flip the Flashcard
	$scope.Flip = function( id, flipped ) {
		if ( flipped ) {
			onanswer = Timestamp( $scope.name, id, "answer" );
		}
	}
	
	// Select the Next Question
	$scope.Next = function ( id, correct ) {
		// User self-evaluated as correctly answered question
		if ( correct ) {
			$scope.correct++;
			Tally( $scope.name, 0, 1 );
			oncorrect = Timestamp( $scope.name, id, "correct" );
			ncorrect++;
		}

		counter++;
		if ( counter >= THRESHOLD ) {
			if ( ncorrect == THRESHOLD ) {
				if ( $scope.rank == 3 ) {
					$scope.random[0] = { id: 0, question: "You Passed", answer: "No Questions Remain", rank: "" };
					Tally( $scope.name, 0, -1 );	// hack
				}
				else {
					if ( $scope.rank != 3 )
						$scope.rank++;
				}
			}
			else if ( ncorrect < 2 ) {
				if ( $scope.rank != 1 )
					$scope.rank--;
			}
			counter = ncorrect = 0;
		}

		// Analytics
		onnext = Timestamp( $scope.name, id, "next" );
		onanswer = oncorrect = 0;
		
		if ( $scope.random[0].question == "You Passed" ) {
			document.getElementById("beep").play();
			$scope.quiz = true;
		}
		else {
			$scope.random = $scope.Group( $scope.rank );
			$scope.nquestions++;
			Tally( $scope.name, 1, 0 );
		}
	}
})
.directive( "questionsGrp", function() {
	return {
		restrict: 'A',
		templateUrl: '/flip.html'
	}
});