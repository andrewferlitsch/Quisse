technical.controller( 'oopCtrl', function( $scope, $http, $location, $anchorScroll ) {
	$scope.subject 	= "OOP Design";
	$scope.name   	= "oop";
	
	<?php include "qactrl.js"; ?>
})
.directive( "questionsOop", function() {
	return {
		restrict: 'A',
		templateUrl: 'flip.html'
	}
});