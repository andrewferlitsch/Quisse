technical.controller( 'mlCtrl', function( $scope, $http, $location, $anchorScroll ) {
	$scope.subject 	= "Machine Learning";
	$scope.name   	= "ml";
	
	<?php include "qactrl.js"; ?>
})
.directive( "questionsMl", function() {
	return {
		restrict: 'A',
		templateUrl: 'flip.html'
	}
})
.directive( "multiMl", function() {
	return {
		restrict: 'A',
		templateUrl: 'multi.html'
	}
});