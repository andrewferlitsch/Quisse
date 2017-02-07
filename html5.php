technical.controller( 'html5Ctrl', function( $scope, $http, $location, $anchorScroll ) {
	$scope.subject 	= "HTML5";
	$scope.name     = "html5";
	
	<?php include "qactrl.js"; ?>
})
.directive( "questionsHtml5", function() {
	return {
		restrict: 'A',
		templateUrl: 'flip.html'
	}
});