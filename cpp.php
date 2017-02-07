technical.controller( 'cppCtrl', function( $scope, $http, $location, $anchorScroll ) {
	$scope.subject 	= "C++";
	$scope.name     = "cpp";
	
	<?php include "qactrl.js"; ?>
})
.directive( "questionsCpp", function() {
	return {
		restrict: 'A',
		templateUrl: 'flip.html'
	}
});