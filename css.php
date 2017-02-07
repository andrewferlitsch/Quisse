technical.controller( 'cssCtrl', function( $scope, $http, $location, $anchorScroll ) {
	$scope.subject 	= "CSS";
	$scope.name     = "css";
	
	<?php include "qactrl.js"; ?>
})
.directive( "questionsCss", function() {
	return {
		restrict: 'A',
		templateUrl: 'flip.html'
	}
});