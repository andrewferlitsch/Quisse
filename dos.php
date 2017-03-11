technical.controller( 'dosCtrl', function( $scope, $http, $location, $anchorScroll ) {
	$scope.subject 	= "DOS";
	$scope.name     = "dos";
	
	<?php include "qactrl.js"; ?>
})
.directive( "questionsDos", function() {
	return {
		restrict: 'A',
		templateUrl: 'flip.html'
	}
})
.directive( "multiDos", function() {
	return {
		restrict: 'A',
		templateUrl: 'multi.html'
	}
});