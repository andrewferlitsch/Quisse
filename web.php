technical.controller( 'webCtrl', function( $scope, $http, $location, $anchorScroll ) {
	$scope.subject 	= "Web";
	$scope.name   	= "web";
	
	<?php include "qactrl.js"; ?>
})
.directive( "questionsWeb", function() {
	return {
		restrict: 'A',
		templateUrl: 'flip.html'
	}
});