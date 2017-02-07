technical.controller( 'algorithmsCtrl', function( $scope, $http, $location, $anchorScroll ) {
	$scope.subject 	= "Algorithms";
	$scope.name     = "algorithms";
	
	<?php include "qactrl.js"; ?>
})
.directive( "questionsAlgoritms", function() {
	return {
		restrict: 'A',
		templateUrl: 'flip.html'
	}
});