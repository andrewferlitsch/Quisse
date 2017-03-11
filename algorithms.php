technical.controller( 'algorithmsCtrl', function( $scope, $http, $location, $anchorScroll ) {
	$scope.subject 	= "Algorithms";
	$scope.name     = "algorithms";
	
	<?php include "qactrl.js"; ?>
})
.directive( "questionsAlgorithms", function() {
	return {
		restrict: 'A',
		templateUrl: 'flip.html'
	}
})
.directive( "multiAlgorithms", function() {
	return {
		restrict: 'A',
		templateUrl: 'multi.html'
	}
});