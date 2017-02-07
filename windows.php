technical.controller( 'windowsCtrl', function( $scope, $http, $location, $anchorScroll ) {
	$scope.subject 	= "Windows OS";
	$scope.name   	= "windows";
	
	<?php include "qactrl.js"; ?>
})
.directive( "questionsWindows", function() {
	return {
		restrict: 'A',
		templateUrl: 'flip.html'
	}
});