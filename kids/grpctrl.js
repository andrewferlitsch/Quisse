
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
	$scope.groups = [ { category: "Animal", major: "Mammal", minor: "Pet", desc: "Household Pets", list: [ "cat", "dog", "bird" ], answered: false, id: -1
					  },
					  { category: "Animal", major: "Mammal", minor: "Pet", desc: "Rodent Pets", list: [ "gerbil", "hamster", "guinea pig" ], answered: false, id: -1
					  },
					  { category: "Animal", major: "Mammal", minor: "Farm", desc: "Farm Animals", list: [ "pig", "cow", "chicken" ], answered: false, id: -1
					  },
					  { category: "Animal", major: "Mammal", minor: "Farm", desc: "Packing Animals", list: [ "horse", "mule", "donkey" ], answered: false, id: -1
					  },
					  { category: "Animal", major: "Mammal", minor: "Farm", desc: "Herd Animals", list: [ "cattle", "sheep", "llamas" ], answered: false, id: -1
					  },
					  { category: "Animal", major: "Mammal", minor: "Wild", desc: "Predator Animals in Africa", list: [ "lion", "tiger", "leopard" ], answered: false, id: -1
					  },
					  { category: "Animal", major: "Mammal", minor: "Wild", desc: "Large Animals in Africa", list: [ "elephant", "giraffe", "rhinoceros" ], answered: false, id: -1
					  },
					  { category: "Animal", major: "Mammal", minor: "Wild", desc: "Predator Animals in North America", list: [ "bear", "wolf", "coyote" ], answered: false, id: -1
					  },
					  { category: "Animal", major: "Mammal", minor: "Wild", desc: "Grazing Animals in North America", list: [ "moose", "deer", "antelope" ], answered: false, id: -1
					  },
					  { category: "Animal", major: "Fish", minor: "River", desc: "Common River Fish", list: [ "pike", "trout", "catfish"], answered: false, id: -1
					  },
					  { category: "Animal", major: "Fish", minor: "River", desc: "Common River/Ocean Fish", list: [ "salmon", "bass", "sturgeon"], answered: false, id: -1
					  },
					  { category: "Animal", major: "Fish", minor: "Ocean", desc: "Common Ocean Fish", list: [ "tuna", "bluefish", "cod"], answered: false, id: -1
					  },
					  { category: "Animal", major: "Fish", minor: "Ocean", desc: "Sea Mammals", list: [ "dolphin", "whale", "sea lion"], answered: false, id: -1
					  },
					  { category: "Animal", major: "Fish", minor: "Ocean", desc: "Crustaceans", list: [ "crab", "shrimp", "krill"], answered: false, id: -1
					  },
					  { category: "Animal", major: "Fish", minor: "Ocean", desc: "Ocean Predators", list: [ "shark", "orca", "sea snake"], answered: false, id: -1
					  },
					  { category: "Animal", major: "Fish", minor: "Pets", desc: "Aquarium Fish", list: [ "angelfish", "goldfish", "guppy"], answered: false, id: -1
					  },
					  { category: "Animal", major: "Bird", minor: "Wild", desc: "Common Birds", list: [ "pigeon", "woodpecker", "owl" ], answered: false, id: -1
					  },
					  { category: "Animal", major: "Bird", minor: "Wild", desc: "Flightless Birds", list: [ "ostrich", "emu", "penguin", "dodo" ], answered: false, id: -1
					  },
					  { category: "Animal", major: "Bird", minor: "Wild", desc: "Birds of Prey", list: [ "hawk", "eagle", "falcon", "buzzard", "vulture", "condor" ], answered: false, id: -1
					  },
					  { category: "Animal", major: "Bird", minor: "Wild", desc: "Migrating Birds", list: [ "geese", "harrier", "duck", "swan" ], answered: false, id: -1
					  },
					  { category: "Animal", major: "Bird", minor: "Pet", desc: "Pet Birds", list: [ "canary", "parakeet", "parrot", "cockatiel", "cockatoo", "macaw" ], answered: false, id: -1
					  },
					  { category: "Animal", major: "Reptile", minor: "Pet", desc: "Reptile Pets", list: [ "snake", "turtle", "lizard", "iguana" ], answered: false, id: -1
					  },
					  { category: "Animal", major: "Reptile", minor: "Wild", desc: "Wild Reptiles", list: [ "crocodile", "alligator", "komodo dragon", "sea turtle", "tortoise" ], answered: false, id: -1
					  },
					  { category: "Animal", major: "Reptile", minor: "Wild", desc: "Venomous Snakes", list: [ "cobra", "viper", "rattlesnake", "copperhead", "mamba" ], answered: false, id: -1
					  },
					  { category: "Transportation", major: "Land", minor: "Public", desc: "Public Transport", list: [ "bus", "train", "street car", "taxi" ], answered: false, id: -1
					  },
					  { category: "Transportation", major: "Land", minor: "Public", desc: "Emergency Vehicles", list: [ "police car", "fire truck", "ambulance" ], answered: false, id: -1
					  },
					  { category: "Transportation", major: "Land", minor: "Personal", desc: "Personal Transportation", list: [ "car", "motorcycle", "minivan", "scooter" ], answered: false, id: -1
					  },
					  { category: "Transportation", major: "Land", minor: "Work", desc: "Construction Vehicles", list: [ "dump truck", "bulldozer", "cement truck", "loader", "excavator", "backhoe", "crane" ], answered: false, id: -1
					  },
					  { category: "Transportation", major: "Water", minor: "Public", desc: "Public Ocean Transport", list: [ "ferry", "ocean liner", "cruise ship" ], answered: false, id: -1
					  },
					  { category: "Transportation", major: "Water", minor: "Personal", desc: "Sailing Ships", list: [ "sail boat", "yacht", "cutter" ], answered: false, id: -1
					  },
					  { category: "Transportation", major: "Water", minor: "Military", desc: "War Ships", list: [ "battleship", "destroyer", "minesweeper", "frigate", "cruiser", "patrol boat" ], answered: false, id: -1
					  },
					  { category: "Transportation", major: "Air", minor: "Commercial", desc: "Commercial Aircraft", list: [ "airplane", "helicopter", "jet" ], answered: false, id: -1
					  },
					  { category: "Transportation", major: "Air", minor: "Military", desc: "Military Aircraft", list: [ "fighter plane", "bomber", "attack helicopter" ], answered: false, id: -1
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
	  
		Tally( $scope.name, 0, 0 );
		
		counter = 0;
		$scope.nquestions = 0;
		$scope.correct    = 0;
		$scope.rank  = 1;
		$scope.quiz  = false;
		$scope.qa    = true;
		$scope.multi = false;
	  }
    }
	
	//
	$scope.Group = function( level ) {
		// Are there any groups still not answered
		var i = 0;
		for ( /**/; i < $scope.Size; i++ ) {
			if ( $scope.groups[ i ].answered == false ) break;
		}
		
		// no group left unanswered
		if ( i == $scope.Size ) {
			return [ { id: 0, question: "You Passed", answer: "No Questions Remain", rank: "", id: -1 } ];
		}
		
		// randomly select an unanswered group
		var select;
		while ( true ) {
			select = Math.floor( Math.random() * $scope.Size );
			if ( $scope.groups[ select ].answered == false )
				break;
		}
		
		var answer = $scope.groups[ select ].desc + ":";
		var wrong = "";

		while ( true ) {
			var n = Math.floor( Math.random() * $scope.Size );
			// do not pick the same selection
			if ( n == select ) continue;

			// look for a group that is not the same category
			if ( level == 1 ) {
				if ( $scope.groups[ n ].category == $scope.groups[ select ].category )
					continue;
			}
			// look for a group that is the same category, but not same major subcategory
			else if ( level == 2 ){
				if ( $scope.groups[ n ].category != $scope.groups[ select ].category ||
				     $scope.groups[ n ].major    == $scope.groups[ select ].major )
					continue;
			}
			// look for a group that is the same category and major subcategory, but not the
			// same minor subcategory
			else if ( level == 3 ){
				if ( $scope.groups[ n ].category != $scope.groups[ select ].category ||
				     $scope.groups[ n ].major    != $scope.groups[ select ].major ||
				     $scope.groups[ n ].minor    == $scope.groups[ select ].minor )
					continue;
			}
				
			// randomly pick one item from this group's list as the item that does not belong
			wrong = $scope.groups[ n ].list[ Math.floor( Math.random() * 3 ) ];
			break;
		}
		
		var list = "";
			
		// pick random position to insert wrong item
		var insert = Math.floor( Math.random() * 4 );
		
		var j = i = 0;
		for ( /**/; i < 4; i++ ) {
			if ( i > 0 ) list += ", ";
			if ( i == insert )
				list += wrong;
			else 
				list += $scope.groups[ select ].list[ j++ ];
		}
		
		// set the ID for the qroup question
		$scope.groups[ select ].id = select;
		
		var A;
		if ( wrong.charAt( 0 ) == 'a' )
			A = "An ";
		else
			A = "A ";
		
		return [ { question: "Which item does not belong: " + list, 
				   answer: A + wrong + " does not belong in " + $scope.groups[ select ].desc + ".",
				   rank: level, id: select }
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
			
			// mark qroup question as answered correctly
			if ( id != -1 )
				$scope.groups[ id ].answered = true;
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
	
	// User selected starting Multiple Choice Quiz
	$scope.Quiz = function( id ) {
		// change to multi-choice view
		$scope.qa = false;
		$scope.multi = true;
		
		// reset scoring
		totalQuestions = 0;	
		totalCorrect   = 0;

		// load the first question
		$scope.rank = 1;
		counter = ncorrect = 0;
		$scope.Multi( id );
	}
	
	var THRESHOLD_QUIZ = 6;
	$scope.passed = false;
	
	// Select the Next Multiple Choice question
	$scope.Multi = function( id ) {
		counter++;
		if ( counter >= THRESHOLD_QUIZ ) {
			if ( ncorrect == THRESHOLD_QUIZ ) {
				if ( $scope.rank == 3 ) {
					$scope.question = { id: 0, question: "You Passed", answer: "No Questions Remain" };
				}
				else	
					$scope.rank++;
			}
			else if ( ncorrect < 2 && $scope.rank > 1 )
				$scope.rank--;
			counter = ncorrect = 0;
		}
		
		$scope.question = $scope.Group( $scope.rank )[ 0 ];
		
		if ( $scope.question.question == "You Passed" ) {
			document.getElementById("beep").play();
			$scope.passed = true;
			$scope.iscorrect = "";
			return;
		}
		
		Timestamp( $scope.name, $scope.question.id, "multi" );

		var correct = "";
		if ( $scope.question.answer.charAt( 1 ) == 'n' ) 
			correct = $scope.question.answer.substring( 2 );
		else 
			correct = $scope.question.answer.substring( 1 );
		var n = correct.indexOf(" does");
		correct = correct.substring( 0, n );
		
		// place the correct answer in a random location
		answer = Math.floor( Math.random() * 4 );
		$scope.m = [];
		$scope.m[ answer ] = correct;

		// set the choices for the wrong answers
		var tmp = $scope.question.question.split(": ");
		var choices = tmp[ 1 ].split(",");
		
		for ( var i = 0, j = 0; i < 4; i++ ) {
			// skip the slot where the answer is
			if ( i == answer ) { continue };
			
			if ( choices[ j ] == correct ) j++;
			$scope.m[ i ] = choices[ j++ ];
		}

		$scope.iscorrect = "";
		$scope.disable = false;
		$scope.checked = false;
		$scope.nquestions++;
		Tally( $scope.name, 1, 0 );
	}
})
.directive( "questionsGrp", function() {
	return {
		restrict: 'A',
		templateUrl: '/flip.html'
	}
})
.directive( "multiGrp", function() {
	return {
		restrict: 'A',
		templateUrl: '/multi.html'
	}
});