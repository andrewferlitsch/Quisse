technical.controller( 'rCtrl', function( $scope, $http, $location, $anchorScroll ) {
	$scope.subject = "R";
	$scope.name    = "r";
	
	<?php include "qactrl.js"; ?>
})
.directive( "questionsR", function() {
	return {
		restrict: 'A',
		templateUrl: 'flip.html'
	}
})
.directive( "multiR", function() {
	return {
		restrict: 'A',
		templateUrl: 'multi.html'
	}
});