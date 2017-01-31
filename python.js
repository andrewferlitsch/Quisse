technical.controller( 'pythonCtrl', function( $scope, $http, $location, $anchorScroll ) {
	$scope.subject 	= "Python";
	$scope.name   	= "python";
	
	$scope.questions = [{ question: "placeholder 1",
						  answer: "",
						  rank: 1,
						  id: 1
						}
					  ];
	$scope.random 	= $scope.questions;
	$scope.show 	= false;
	$scope.rank     = 1;

	$scope.scrollTo = function() {
      $location.hash( $scope.name );
      $anchorScroll();
	  
	  if ( $scope.show ) {
		$http({
			method : "GET",
			url : "load.php",
			params: { category: $scope.subject }
		}).then(function mySucces(response) {
			$scope.questions = response.data;
			$scope.random 	 = pickNext( $scope.questions, 1, -1 );
			}, function myError(response) {
		});
	  }
    }
	
	$scope.Harder = function( id ) {
		if ( $scope.rank != 3 )
			$scope.rank++;
		$scope.random = pickNext( $scope.questions, $scope.rank, id );
		$scope.nquestions++;
	}
	
	$scope.Easier = function ( id ) {
		if ( $scope.rank != 1 )
			$scope.rank--;
		$scope.random = pickNext( $scope.questions, $scope.rank, id );
		$scope.nquestions++;
	}

	$scope.scored = false;
	$scope.nquestions = 1;
	$scope.correct   = 0;
	$scope.score_css = "w3-green";
	$scope.score_txt = "Score";
	$scope.score = function() {
		if ( ( $scope.scored = !$scope.scored ) ) {
			Tally( $scope.name );
			$scope.score_css = "w3-red";
			$scope.score_txt = "Scored";
		}
		else {
			UnTally( $scope.name );
			$scope.score_css = "w3-green";
			$scope.score_txt = "Score";
		}
	}
	
	$scope.Rank = function( id, rank ) {
		SaveRank( $scope.subject, id, rank );
	}
})
.directive( "questionsPython", function() {
	return {
		restrict: 'A',
		templateUrl: 'flip.html'
	}
});