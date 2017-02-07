technical.controller( 'networkCtrl', function( $scope, $http, $location, $anchorScroll ) {
	$scope.subject 	= "Network";
	$scope.name   	= "network";
	
	<?php include "qactrl.js"; ?>
})
.directive( "questionsNetwork", function() {
	return {
		restrict: 'A',
		templateUrl: 'flip.html'
	} 
});