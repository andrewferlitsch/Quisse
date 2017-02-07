technical.controller( 'htmlCtrl', function( $scope, $http, $location, $anchorScroll ) {
	$scope.subject 	= "HTML";
	$scope.name     = "html";
	
	<?php include "qactrl.js"; ?>
})
.directive( "questionsHtml", function() {
	return {
		restrict: 'A',
		templateUrl: 'flip.html'
	}
});