technical.controller( 'javaCtrl', function( $scope, $http, $location, $anchorScroll ) {
	$scope.subject 	= "Java";
	$scope.name     = "java";
	
	<?php include "qactrl.js"; ?>
})
.directive( "questionsJava", function() {
	return {
		restrict: 'A',
		templateUrl: 'flip.html'
	}
})
.directive( "multiJava", function() {
	return {
		restrict: 'A',
		templateUrl: 'multi.html'
	}
});