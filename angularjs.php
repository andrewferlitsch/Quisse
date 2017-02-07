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
});