technical.controller( 'angularCtrl', function( $scope, $http, $location, $anchorScroll ) {
	$scope.subject 	= "AngularJS";
	$scope.name     = "angular";
	
	<?php include "qactrl.js"; ?>
})
.directive( "questionsAngular", function() {
	return {
		restrict: 'A',
		templateUrl: 'flip.html'
	}
})
.directive( "multiAngular", function() {
	return {
		restrict: 'A',
		templateUrl: 'multi.html'
	}
});