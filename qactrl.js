
	$scope.questions = [{ question: "placeholder 1",
						  answer: "",
						  rank: 1,
						  id: 1,
						  words: "",
						  similar: ""
						}
					  ];
	$scope.random 	  = $scope.questions;
	$scope.show 	  = false;
	$scope.rank       = 1;
	$scope.nquestions = 1;
	$scope.correct    = 0;
	$scope.disable    = false;
	
	// Scroll to Content
	$scope.scrollTo = function() {
      $location.hash( $scope.name );
      $anchorScroll();
	  
	  // Load the Q&A from Database when visible
	  if ( $scope.show ) {
		$http({
			method : "GET",
			url : "load.php",
			params: { category: $scope.subject }
		}).then(function mySucces(response) {
			$scope.questions  = response.data;
			$scope.ncount     = $scope.questions.length;
			$scope.random 	  = pickNext( $scope.questions, 1, -1, false );
			}, function myError(response) { console.log(response);
		});
	  
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
	var answer    = 0;										// index of correct answer in multiple choice
	var iscorrect = "";
	
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
			// display the time spent on the flipcard to complete (pass)
			d = new Date();
			ShowTime( ( d.getTime() - $scope.startTime ) / 1000 );
			// show start quiz button
			$scope.quiz = true;
		}
		else {
			$scope.random = pickNext( $scope.questions, $scope.rank, id, correct );
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
		timeSpent      = "";
		
		// reset that the questions have not been answered
		var len = $scope.questions.length;
		for ( var i = 0; i < len; i++ ) {
			$scope.questions[ i ].answered = false;
		}
		
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
		
		$scope.question = pickMulti( $scope.questions, $scope.rank, id, false );
		
		if ( $scope.question.question == "You Passed" ) {
			document.getElementById("beep").play();
			$scope.passed = true;
			$scope.iscorrect = 
			// display the time spent on the multiple choice to complete (pass)
			d = new Date();
			ShowTime( ( d.getTime() - $scope.startTime ) / 1000 );
			return;
		}
		
		Timestamp( $scope.name, $scope.question.id, "multi" );
		
		// place the correct answer in a random location
		answer = Math.floor( Math.random() * 4 );
		$scope.m[ answer ] = $scope.question.answer;
			
		// set the choices for the wrong answers
		var choices = $scope.question.similar.split( "," );
		for ( var i = 0, j = 0; i < 4; i++ ) {
			// skip the slot where the answer is
			if ( i == answer ) continue;
			
			var pair = choices[ j ].split(":");
			for ( var k = 0; k < $scope.questions.length; k++ ) {
				if ( $scope.questions[ k ].id == pair[ 1 ] ) {
					$scope.m[ i ] = $scope.questions[ k ].answer;
					break;
				}
			}
			j++;
		}

		$scope.iscorrect = "";
		$scope.disable = false;
		$scope.checked = false;
		$scope.nquestions++;
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

	$scope.quiz  = false;
	$scope.qa    = true;
	$scope.multi = false;