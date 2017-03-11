technical.controller( 'cCtrl', function( $scope, $http, $location, $anchorScroll ) {
	$scope.subject 	= "C";
	$scope.name   	= "c";
	
	<?php include "qactrl.js"; ?>
})
.directive( "questionsC", function() {
	return {
		restrict: 'A',
		templateUrl: 'flip.html'
	}
})
.directive( "multiC", function() {
	return {
		restrict: 'A',
		templateUrl: 'multi.html'
	}
});