technical.controller( 'securityCtrl', function( $scope, $http, $location, $anchorScroll ) {
	$scope.subject 	= "Security";
	$scope.name   	= "security";
	
	<?php include "qactrl.js"; ?>
})
.directive( "questionsSecurity", function() {
	return {
		restrict: 'A',
		templateUrl: 'flip.html'
	}
});