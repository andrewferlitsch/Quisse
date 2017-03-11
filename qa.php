technical.controller( 'qaCtrl', function( $scope, $http, $location, $anchorScroll ) {
	$scope.subject 	= "QA";
	$scope.name   	= "qa";
	
	<?php include "qactrl.js"; ?>
})
.directive( "questionsQa", function() {
	return {
		restrict: 'A',
		templateUrl: 'flip.html'
	}
})
.directive( "multiQa", function() {
	return {
		restrict: 'A',
		templateUrl: 'multi.html'
	}
});