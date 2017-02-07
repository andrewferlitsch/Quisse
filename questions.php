technical.controller( 'nameCtrl', function( $scope, $http, $location, $anchorScroll ) {
	$scope.subject 	= "name";
	$scope.name   	= "name";
	
	<?php include "qactrl.js"; ?>
})
.directive( "questionsName", function() {
	return {
		restrict: 'A',
		templateUrl: 'flip.html'
	}
});