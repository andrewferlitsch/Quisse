technical.controller( 'jsCtrl', function( $scope, $http, $location, $anchorScroll ) {
	$scope.subject 	= "Javascript";
	$scope.name   	= "js";
	
	<?php include "qactrl.js"; ?>
})
.directive( "questionsJs", function() {
	return {
		restrict: 'A',
		templateUrl: 'flip.html'
	}
})
.directive( "multiJs", function() {
	return {
		restrict: 'A',
		templateUrl: 'multi.html'
	}
});