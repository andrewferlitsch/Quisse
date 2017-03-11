technical.controller( 'csharpCtrl', function( $scope, $http, $location, $anchorScroll ) {
	$scope.subject 	= "C#";
	$scope.name     = "csharp";
	
	<?php include "qactrl.js"; ?>
})
.directive( "questionsCsharp", function() {
	return {
		restrict: 'A',
		templateUrl: 'flip.html'
	}
})
.directive( "multiCsharp", function() {
	return {
		restrict: 'A',
		templateUrl: 'multi.html'
	}
});