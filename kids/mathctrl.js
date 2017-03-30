
technical.controller( 'addCtrl', function( $scope, $http, $location, $anchorScroll ) {
	$scope.subject 	= "Addition";
	$scope.name     = "add";
	
	$scope.questions = [{ question: "placeholder 1",
						  answer: "",
						  rank: 1,
						  id: 1
						}
					  ];
	$scope.random 	  = $scope.questions;
	$scope.show 	  = false;
	$scope.rank       = 1;
	$scope.nquestions = 1;
	$scope.correct    = 0;
	
	// Scroll to Content
	$scope.scrollTo = function() {
      $location.hash( $scope.name );
      $anchorScroll();
	  
	  // Load the Q&A from Database when visible
	  if ( $scope.show ) {
		$scope.random 	 = $scope.Add( 1 );

		onnext = Timestamp( $scope.name, 0, "init" );
	  
		Tally( $scope.name, 0, 0 );

		counter = 0;
		$scope.nquestions = 0;
		$scope.correct    = 0;
		$scope.rank = 1;
		$scope.quiz  = false;
		$scope.qa    = true;
		$scope.multi = false;
	  }
    }
	
	$scope.Add = function( level ) {
		var num1 = Math.random();
		var num2 = Math.random();
		
		var coff1, coff2;
		switch ( level ) {
		case 1: coff1 = coff2 = 10; break;
		case 2: coff1 = 100, coff2 = 10; break;
		case 3: coff1 = coff2 = 100; break;
		}
		
		num1 = Math.floor( num1 * coff1 );
		if ( num1 < 10 && coff1 == 100 )
			num1 += 10;
		num2 = Math.floor( num2 * coff2 );
		if ( num2 == 0 && coff2 > 10 )
			num2 = num1;
		var result = num1 + num2;
		
		return [ { question: num1 + ' + ' + num2 + ' = ', answer: result, rank: level, id: -1 } ];
	}
	
	var onnext    = 0;										// timestamp of next question
	var onanswer  = 0;										// timestamp when answer flipped
	var oncorrect = 0;										// timestamp when Got it checked
	var ncorrect  = 0;										// number of correct answers at this level
	var counter   = 0;										// counter for number of questions at this level
	var THRESHOLD = 4;										// threshold for adaptive test level selection
	
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
			$scope.random = $scope.Add( $scope.rank );
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
		//$scope.Multi( id );
	}
})
.directive( "questionsAdd", function() {
	return {
		restrict: 'A',
		templateUrl: '/flip.html'
	}
})
.directive( "multiAdd", function() {
	return {
		restrict: 'A',
		templateUrl: '/multi.html'
	}
});

technical.controller( 'subCtrl', function( $scope, $http, $location, $anchorScroll ) {
	$scope.subject 	= "Subtraction";
	$scope.name     = "sub";
	
	$scope.questions = [{ question: "placeholder 1",
						  answer: "",
						  rank: 1,
						  id: 1
						}
					  ];
	$scope.random 	  = $scope.questions;
	$scope.show 	  = false;
	$scope.rank       = 1;
	$scope.nquestions = 1;
	$scope.correct    = 0;
	
	// Scroll to Content
	$scope.scrollTo = function() {
      $location.hash( $scope.name );
      $anchorScroll();
	  
	  // Load the Q&A from Database when visible
	  if ( $scope.show ) {
		$scope.random 	 = $scope.Sub( 1 );

		onnext = Timestamp( $scope.name, 0, "init" );
	  
		Tally( $scope.name, 0, 0 );

		counter = 0;
		$scope.nquestions = 0;
		$scope.correct    = 0;
		$scope.rank = 1;
		$scope.quiz  = false;
		$scope.qa    = true;
		$scope.multi = false;
	  }
    }
	
	$scope.Sub = function( level ) {
		var num1 = Math.random();
		var num2 = Math.random();
		
		var coff1, coff2;
		switch ( level ) {
		case 1: coff1 = coff2 = 10;
				// if negative result, swap numbers
				if ( num2 > num1 ) {
					var tmp = num2;
					num2 = num1;
					num1 = tmp;
				}
				break;
		case 2: coff1 = 100, coff2 = 10; 
				break;
		case 3: coff1 = coff2 = 100; 
				break;
		}
		
		num1 = Math.floor( num1 * coff1 );
		if ( num1 < 10 && coff1 == 100 )
			num1 += 10;
		num2 = Math.floor( num2 * coff2 );
		if ( num2 == 0 && coff2 > 10 )
			num2 = Math.floor( num1 / 2 );
		var result = num1 - num2;
		
		return [ { question: num1 + ' - ' + num2 + ' = ', answer: result, rank: level, id: -1 } ];
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
		
		$scope.m = [];
		if ( $scope.random[0].question == "You Passed" ) {
			document.getElementById("beep").play();
			$scope.quiz = true;
		}
		else {
			$scope.random = $scope.Sub( $scope.rank );
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
		//$scope.Multi( id );
	}
})

.directive( "questionsSub", function() {
	return {
		restrict: 'A',
		templateUrl: '/flip.html'
	}
})
.directive( "multiSub", function() {
	return {
		restrict: 'A',
		templateUrl: '/multi.html'
	}
});

technical.controller( 'mulCtrl', function( $scope, $http, $location, $anchorScroll ) {
	$scope.subject 	= "Multiply";
	$scope.name     = "mul";
	
	$scope.questions = [{ question: "placeholder 1",
						  answer: "",
						  rank: 1,
						  id: 1
						}
					  ];
	$scope.random 	  = $scope.questions;
	$scope.show 	  = false;
	$scope.rank       = 1;
	$scope.nquestions = 1;
	$scope.correct    = 0;
	
	// Scroll to Content
	$scope.scrollTo = function() {
      $location.hash( $scope.name );
      $anchorScroll();
	  
	  // Load the Q&A from Database when visible
	  if ( $scope.show ) {
		$scope.random 	 = $scope.Mul( 1 );

		onnext = Timestamp( $scope.name, 0, "init" );
	  
		Tally( $scope.name, 0, 0 );

		counter = 0;
		$scope.nquestions = 0;
		$scope.correct    = 0;
		$scope.rank = 1;
		$scope.quiz  = false;
		$scope.qa    = true;
		$scope.multi = false;
	  }
    }
	
	$scope.Mul = function( level ) {
		var num1 = Math.random();
		var num2 = Math.random();
		
		var coff1, coff2;
		switch ( level ) {
		case 1: coff1 = coff2 = 6;
				break;
		case 2: coff1 = coff2 = 12; 
				break;
		case 3: coff1 = coff2 = 25; 
				break;
		}
		
		num1 = Math.floor( num1 * coff1 );
		if ( num1 < 6 && coff1 > 6 )
			num1 += 2;
		num2 = Math.floor( num2 * coff2 );
		if ( num2 < 6 && coff2 > 6 )
			num2 += 2;
		var result = num1 * num2;
		
		return [ { question: num1 + ' x ' + num2 + ' = ', answer: result, rank: level, id: -1 } ];
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
			$scope.random = $scope.Mul( $scope.rank );
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
		//$scope.Multi( id );
	}
})
.directive( "questionsMul", function() {
	return {
		restrict: 'A',
		templateUrl: '/flip.html'
	}
})
.directive( "multiMul", function() {
	return {
		restrict: 'A',
		templateUrl: '/multi.html'
	}
});

technical.controller( 'divCtrl', function( $scope, $http, $location, $anchorScroll ) {
	$scope.subject 	= "Divide";
	$scope.name     = "div";
	
	$scope.questions = [{ question: "placeholder 1",
						  answer: "",
						  rank: 1,
						  id: 1
						}
					  ];
	$scope.random 	  = $scope.questions;
	$scope.show 	  = false;
	$scope.rank       = 1;
	$scope.nquestions = 1;
	$scope.correct    = 0;
	
	// Scroll to Content
	$scope.scrollTo = function() {
      $location.hash( $scope.name );
      $anchorScroll();
	  
	  // Load the Q&A from Database when visible
	  if ( $scope.show ) {
		$scope.random 	 = $scope.Div( 1 );

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
	
	$scope.Div = function( level ) {
		var num1 = Math.random();
		var num2 = Math.random();
		
		var coff1, coff2;
		switch ( level ) {
		case 1: coff1 = 10; coff2 = 10; break;
				break;
		case 2: coff1 = 12; coff2 = 15; break; 
				break;
		case 3: coff1 = 15; coff2 = 15; break;
				break;
		}
		
		num2 = Math.floor( num2 * coff2 );
		if ( num2 == 0 ) num2 = 1;
		num1 = Math.floor( num1 * coff1 );
		num1 = num1 * num2;
		
		var result = num1 / num2;
		
		return [ { question: num1 + ' / ' + num2 + ' = ', answer: result, rank: level, id: -1 } ];
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
			$scope.random = $scope.Div( $scope.rank );
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
		//$scope.Multi( id );
	}
})
.directive( "questionsDiv", function() {
	return {
		restrict: 'A',
		templateUrl: '/flip.html'
	}
})
.directive( "multiDiv", function() {
	return {
		restrict: 'A',
		templateUrl: '/multi.html'
	}
});
