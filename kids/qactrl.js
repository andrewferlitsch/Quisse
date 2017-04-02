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
		$scope.random 	 = pickNext( $scope.name, 1 );

		onnext = Timestamp( $scope.name, 0, "init" );
	  
		Tally( $scope.name, 0, 0 );

		counter = 0;
		$scope.nquestions = 0;
		$scope.correct    = 0;
		$scope.rank = 1;
		$scope.quiz  = false;
		$scope.qa    = true;
		$scope.multi = false;
		
		var d        = new Date();
		$scope.startTime = d.getTime();
		ShowTime("");
	  }
    }

	var onnext    = 0;										// timestamp of next question
	var onanswer  = 0;										// timestamp when answer flipped
	var oncorrect = 0;										// timestamp when Got it checked
	var ncorrect  = 0;										// number of correct answers at this level
	var counter   = 0;										// counter for number of questions at this level
	var THRESHOLD = 4;										// threshold for adaptive test level selection
	var time      = 0;
	
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
			$scope.random = pickNext( $scope.name, $scope.rank );
			$scope.nquestions++;
			Tally( $scope.name, 1, 0 );
		}
			
		// display the time spent on the flipcard to complete (pass)
		d = new Date();
		time = ( d.getTime() - $scope.startTime ) / 1000;
		ShowTime( time );
		if ( $scope.quiz == true ) {
			$scope.correct--;
			$scope.RecordResult( 'flip');
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
		Tally( $scope.name, 0, 0 );
		var d = new Date();
		$scope.startTime = d.getTime();
		ShowTime("");
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
					document.getElementById("beep").play();
					$scope.passed = true;
					$scope.iscorrect = "";
					// display the time spent on the multiple choice to complete (pass)
					d = new Date();
					ShowTime( ( d.getTime() - $scope.startTime ) / 1000 );
					return;
				}
				else	
					$scope.rank++;
			}
			else if ( ncorrect < 3 && $scope.rank > 1 )
				$scope.rank--;
			counter = ncorrect = 0;
		}

		$scope.question = pickNext( $scope.name, $scope.rank )[ 0 ];
		
		if ( $scope.question.question == "You Passed" ) {
			document.getElementById("beep").play();
			$scope.passed = true;
			$scope.iscorrect = "";
			// display the time spent on the multiple choice to complete (pass)
			d = new Date();
			ShowTime( ( d.getTime() - $scope.startTime ) / 1000 );
			return;
		}
		else 
		
		Timestamp( $scope.name, $scope.question.id, "multi" );
		
		// place the correct answer in a random location
		answer = Math.floor( Math.random() * 4 );
		$scope.m = [];
		$scope.m[ answer ] = $scope.question.answer;
		
		// set the choices for the wrong answers
		for ( var i = 0; i < 4; i++ ) {
			// skip the slot where the answer is
			if ( i == answer ) continue;
			
			while ( true ) {
				var wrong = pickNext( $scope.name, $scope.rank )[ 0 ].answer;
				// remove duplicates
				var dup = false;
				for ( var j = 0; j < 4; j++ ) {
					if ( wrong == $scope.m[ j ] ) {
						dup = true;
						break;
					}
				}
				if ( dup == false ) {
					$scope.m[ i ] = wrong;
					break;
				}
			}
		}

		$scope.iscorrect = "";
		$scope.disable = false;
		$scope.checked = false;
		$scope.nquestions++;
		
		// display the time spent on the multiple choice to complete (pass)
		d = new Date();
		ShowTime( ( d.getTime() - $scope.startTime ) / 1000 );
	}

	// Select a multiple choice answer
	$scope.Choice = function( n, id ) {
		Tally( $scope.name, 1, 0 );
		if ( n == answer ) {
			$scope.iscorrect = true;
			$scope.correct++;
			Tally( $scope.name, 0, 1 );
			oncorrect = Timestamp( $scope.name, id, "correct" );
			ncorrect++;
			
			// mark the question as answered correctly
			var len = $scope.questions.length;
			for ( var i = 0; i < len; i++ ) {
				if ( $scope.questions[ i ].id == id ) {
					$scope.questions[ i ].answered = true;
					break;
				}
			}
		}
		else {
			$scope.iscorrect = false
			Timestamp( $scope.name, id, "incorrect" );
		}
		$scope.disable = true;
	}	
	
	$scope.RecordResult = function( type ) {
		var percent = (  $scope.correct / $scope.nquestions ) * 100;
		$http({
			method: 'POST',
			url   : '/admin/skills.php',
			data  : { 'id': 1, 'action': 'update', 'skill': $scope.name, 'type': type, 'percent': percent, 'time': time },
			headers: {'Content-Type': 'application/x-www-form-urlencoded'}
		}).then(function (response) {
		}, function (response) {
		});
	}