technical.controller( 'aiCtrl', function( $scope, $http, $location, $anchorScroll ) {
	$scope.subject 	= "AI";
	$scope.name   	= "ai";
	
	<?php include "qactrl.js"; ?>
})
.directive( "questionsAi", function() {
	return {
		restrict: 'A',
		templateUrl: 'flip.html'
	}
})
.directive( "multiAi", function() {
	return {
		restrict: 'A',
		templateUrl: 'multi.html'
	}
});