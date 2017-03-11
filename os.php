technical.controller( 'osCtrl', function( $scope, $http, $location, $anchorScroll ) {
	$scope.subject 	= "OS";
	$scope.name   	= "os";
	
	<?php include "qactrl.js"; ?>
})
.directive( "questionsOs", function() {
	return {
		restrict: 'A',
		templateUrl: 'flip.html'
	}
})
.directive( "multiOs", function() {
	return {
		restrict: 'A',
		templateUrl: 'multi.html'
	}
});