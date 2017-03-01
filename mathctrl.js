
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
		var num1 = random();
		var num2 = random();
		
		var coff;
		switch ( level ) {
		case 1: coff = 10; break;
		case 2: coff = 100; break;
		case 3: coff = 500; break;
		}
		
		num1 = Math.floor( num1 * coff );
		num2 = Math.floor( num1 * coff );
		var result = num1 + num2;
		
		return { question: num1 + ' + ' + num2 + ' = ', answer: result, rank: level };
	}
	
	// Scroll to Content
	$scope.scrollTo = function() {
      $location.hash( $scope.name );
      $anchorScroll();
	  
	  // Load the Q&A from Database when visible
	  if ( $scope.show ) {
		$scope.random 	 = Add( 1 );

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
		$scope.random = Add( $scope.rank );
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
		$scope.random = Add( $scope.rank );
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
		
		$scope.random = Add( $scope.rank );
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