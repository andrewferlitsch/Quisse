technical.controller( 'jqueryCtrl', function( $scope, $http, $location, $anchorScroll ) {
	$scope.subject 	= "JQuery";
	$scope.name   	= "jquery";
	
	<?php include "qactrl.js"; ?>
})
.directive( "questionsJquery", function() {
	return {
		restrict: 'A',
		templateUrl: 'flip.html'
	}
})
.directive( "multiJquery", function() {
	return {
		restrict: 'A',
		templateUrl: 'multi.html'
	}
});