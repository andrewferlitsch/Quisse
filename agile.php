technical.controller( 'agileCtrl', function( $scope, $http, $location, $anchorScroll ) {
	$scope.subject 	= "Agile";
	$scope.name     = "agile";
	
	<?php include "qactrl.js"; ?>
})
.directive( "questionsAgile", function() {
	return {
		restrict: 'A',
		templateUrl: 'flip.html'
	}
})
.directive( "multiAgile", function() {
	return {
		restrict: 'A',
		templateUrl: 'multi.html'
	}
});