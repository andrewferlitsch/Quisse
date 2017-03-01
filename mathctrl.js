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
		num2 = Math.floor( num2 * coff2 );
		var result = num1 + num2;
		
		return [ { question: num1 + ' + ' + num2 + ' = ', answer: result, rank: level, id: -1 } ];
	}
	
	// Scroll to Content
	$scope.scrollTo = function() {
      $location.hash( $scope.name );
      $anchorScroll();
	  
	  // Load the Q&A from Database when visible
	  if ( $scope.show ) {
		$scope.random 	 = $scope.Add( 1 );

		onnext = Timestamp( $scope.name, 0, "init" );
	  
		Tally( $scope.name, 1, 0 );
	  }
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
	
	// Select a harder question
	$scope.Harder = function( id ) {
		if ( $scope.rank != 3 )
			$scope.rank++;
		$scope.random = $scope.Add( $scope.rank );
		$scope.nquestions++;
		Tally( $scope.name, 1, 0 );
		
		// Analytics
		onnext    = Timestamp( $scope.name, id, "harder" );
		onanswer  = oncorrect = ncorrect = 0;
		counter   = 0;
	}
	
	// Select an easier question
	$scope.Easier = function ( id ) {
		if ( $scope.rank != 1 )
			$scope.rank--;
		$scope.random = $scope.Add( $scope.rank );
		$scope.nquestions++;
		Tally( $scope.name, 1, 0 );
		
		// Analytics
		onnext    = Timestamp( $scope.name, id, "easier" );
		onanswer  = oncorrect = ncorrect = 0;
		counter   = 0;
	}
	
	$scope.Same = function ( id ) {
		counter++;
		if ( counter >= THRESHOLD ) {
			if ( oncorrect == 0 && onanswer != 0 ) {
				
			}

			if ( ncorrect == THRESHOLD )
				$scope.Harder( id );
			else if ( ncorrect == 1 )
				$scope.Easier( id );
		}
		
		$scope.random = $scope.Add( $scope.rank );
		$scope.nquestions++;
		Tally( $scope.name, 1, 0 );
		
		// Analytics
		onnext = Timestamp( $scope.name, id, "next" );
		onanswer = oncorrect = 0;
	}
	
	$scope.Correct = function( checked, id ) {
		if ( checked ) {
			$scope.correct++;
			Tally( $scope.name, 0, 1 );
			oncorrect = Timestamp( $scope.name, id, "correct" );
			ncorrect++;
		}
		else {
			$scope.correct--;
			Tally( $scope.name, 0, -1 );
			ncorrect--;
		}
	}
	
	$scope.Reset = function( id ) {
		UnTally( $scope.name, $scope.nquestions, $scope.correct );
		$scope.nquestions = 0;
		$scope.correct    = 0;
		$scope.Same( id );
	}
})
.directive( "questionsAdd", function() {
	return {
		restrict: 'A',
		templateUrl: 'flip.html'
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
		num2 = Math.floor( num2 * coff2 );
		var result = num1 - num2;
		
		return [ { question: num1 + ' - ' + num2 + ' = ', answer: result, rank: level, id: -1 } ];
	}
	
	// Scroll to Content
	$scope.scrollTo = function() {
      $location.hash( $scope.name );
      $anchorScroll();
	  
	  // Load the Q&A from Database when visible
	  if ( $scope.show ) {
		$scope.random 	 = $scope.Sub( 1 );

		onnext = Timestamp( $scope.name, 0, "init" );
	  
		Tally( $scope.name, 1, 0 );
	  }
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
	
	// Select a harder question
	$scope.Harder = function( id ) {
		if ( $scope.rank != 3 )
			$scope.rank++;
		$scope.random = $scope.Sub( $scope.rank );
		$scope.nquestions++;
		Tally( $scope.name, 1, 0 );
		
		// Analytics
		onnext    = Timestamp( $scope.name, id, "harder" );
		onanswer  = oncorrect = ncorrect = 0;
		counter   = 0;
	}
	
	// Select an easier question
	$scope.Easier = function ( id ) {
		if ( $scope.rank != 1 )
			$scope.rank--;
		$scope.random = $scope.Sub( $scope.rank );
		$scope.nquestions++;
		Tally( $scope.name, 1, 0 );
		
		// Analytics
		onnext    = Timestamp( $scope.name, id, "easier" );
		onanswer  = oncorrect = ncorrect = 0;
		counter   = 0;
	}
	
	$scope.Same = function ( id ) {
		counter++;
		if ( counter >= THRESHOLD ) {
			if ( oncorrect == 0 && onanswer != 0 ) {
				
			}

			if ( ncorrect == THRESHOLD )
				$scope.Harder( id );
			else if ( ncorrect == 1 )
				$scope.Easier( id );
		}
		
		$scope.random = $scope.Sub( $scope.rank );
		$scope.nquestions++;
		Tally( $scope.name, 1, 0 );
		
		// Analytics
		onnext = Timestamp( $scope.name, id, "next" );
		onanswer = oncorrect = 0;
	}
	
	$scope.Correct = function( checked, id ) {
		if ( checked ) {
			$scope.correct++;
			Tally( $scope.name, 0, 1 );
			oncorrect = Timestamp( $scope.name, id, "correct" );
			ncorrect++;
		}
		else {
			$scope.correct--;
			Tally( $scope.name, 0, -1 );
			ncorrect--;
		}
	}
	
	$scope.Reset = function( id ) {
		UnTally( $scope.name, $scope.nquestions, $scope.correct );
		$scope.nquestions = 0;
		$scope.correct    = 0;
		$scope.Same( id );
	}
})
.directive( "questionsSub", function() {
	return {
		restrict: 'A',
		templateUrl: 'flip.html'
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
		num2 = Math.floor( num2 * coff2 );
		var result = num1 * num2;
		
		return [ { question: num1 + ' x ' + num2 + ' = ', answer: result, rank: level, id: -1 } ];
	}
	
	// Scroll to Content
	$scope.scrollTo = function() {
      $location.hash( $scope.name );
      $anchorScroll();
	  
	  // Load the Q&A from Database when visible
	  if ( $scope.show ) {
		$scope.random 	 = $scope.Mul( 1 );

		onnext = Timestamp( $scope.name, 0, "init" );
	  
		Tally( $scope.name, 1, 0 );
	  }
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
	
	// Select a harder question
	$scope.Harder = function( id ) {
		if ( $scope.rank != 3 )
			$scope.rank++;
		$scope.random = $scope.Mul( $scope.rank );
		$scope.nquestions++;
		Tally( $scope.name, 1, 0 );
		
		// Analytics
		onnext    = Timestamp( $scope.name, id, "harder" );
		onanswer  = oncorrect = ncorrect = 0;
		counter   = 0;
	}
	
	// Select an easier question
	$scope.Easier = function ( id ) {
		if ( $scope.rank != 1 )
			$scope.rank--;
		$scope.random = $scope.Mul( $scope.rank );
		$scope.nquestions++;
		Tally( $scope.name, 1, 0 );
		
		// Analytics
		onnext    = Timestamp( $scope.name, id, "easier" );
		onanswer  = oncorrect = ncorrect = 0;
		counter   = 0;
	}
	
	$scope.Same = function ( id ) {
		counter++;
		if ( counter >= THRESHOLD ) {
			if ( oncorrect == 0 && onanswer != 0 ) {
				
			}

			if ( ncorrect == THRESHOLD )
				$scope.Harder( id );
			else if ( ncorrect == 1 )
				$scope.Easier( id );
		}
		
		$scope.random = $scope.Mul( $scope.rank );
		$scope.nquestions++;
		Tally( $scope.name, 1, 0 );
		
		// Analytics
		onnext = Timestamp( $scope.name, id, "next" );
		onanswer = oncorrect = 0;
	}
	
	$scope.Correct = function( checked, id ) {
		if ( checked ) {
			$scope.correct++;
			Tally( $scope.name, 0, 1 );
			oncorrect = Timestamp( $scope.name, id, "correct" );
			ncorrect++;
		}
		else {
			$scope.correct--;
			Tally( $scope.name, 0, -1 );
			ncorrect--;
		}
	}
	
	$scope.Reset = function( id ) {
		UnTally( $scope.name, $scope.nquestions, $scope.correct );
		$scope.nquestions = 0;
		$scope.correct    = 0;
		$scope.Same( id );
	}
})
.directive( "questionsMul", function() {
	return {
		restrict: 'A',
		templateUrl: 'flip.html'
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
	
	// Scroll to Content
	$scope.scrollTo = function() {
      $location.hash( $scope.name );
      $anchorScroll();
	  
	  // Load the Q&A from Database when visible
	  if ( $scope.show ) {
		$scope.random 	 = $scope.Div( 1 );

		onnext = Timestamp( $scope.name, 0, "init" );
	  
		Tally( $scope.name, 1, 0 );
	  }
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
	
	// Select a harder question
	$scope.Harder = function( id ) {
		if ( $scope.rank != 3 )
			$scope.rank++;
		$scope.random = $scope.Div( $scope.rank );
		$scope.nquestions++;
		Tally( $scope.name, 1, 0 );
		
		// Analytics
		onnext    = Timestamp( $scope.name, id, "harder" );
		onanswer  = oncorrect = ncorrect = 0;
		counter   = 0;
	}
	
	// Select an easier question
	$scope.Easier = function ( id ) {
		if ( $scope.rank != 1 )
			$scope.rank--;
		$scope.random = $scope.Div( $scope.rank );
		$scope.nquestions++;
		Tally( $scope.name, 1, 0 );
		
		// Analytics
		onnext    = Timestamp( $scope.name, id, "easier" );
		onanswer  = oncorrect = ncorrect = 0;
		counter   = 0;
	}
	
	$scope.Same = function ( id ) {
		counter++;
		if ( counter >= THRESHOLD ) {
			if ( oncorrect == 0 && onanswer != 0 ) {
				
			}

			if ( ncorrect == THRESHOLD )
				$scope.Harder( id );
			else if ( ncorrect == 1 )
				$scope.Easier( id );
		}
		
		$scope.random = $scope.Div( $scope.rank );
		$scope.nquestions++;
		Tally( $scope.name, 1, 0 );
		
		// Analytics
		onnext = Timestamp( $scope.name, id, "next" );
		onanswer = oncorrect = 0;
	}
	
	$scope.Correct = function( checked, id ) {
		if ( checked ) {
			$scope.correct++;
			Tally( $scope.name, 0, 1 );
			oncorrect = Timestamp( $scope.name, id, "correct" );
			ncorrect++;
		}
		else {
			$scope.correct--;
			Tally( $scope.name, 0, -1 );
			ncorrect--;
		}
	}
	
	$scope.Reset = function( id ) {
		UnTally( $scope.name, $scope.nquestions, $scope.correct );
		$scope.nquestions = 0;
		$scope.correct    = 0;
		$scope.Same( id );
	}
})
.directive( "questionsDiv", function() {
	return {
		restrict: 'A',
		templateUrl: 'flip.html'
	}
});
