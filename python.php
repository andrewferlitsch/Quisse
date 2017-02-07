technical.controller( 'pythonCtrl', function( $scope, $http, $location, $anchorScroll ) {
	$scope.subject 	= "Python";
	$scope.name   	= "python";
	
	<?php include "qactrl.js"; ?>
})
.directive( "questionsPython", function() {
	return {
		restrict: 'A',
		templateUrl: 'flip.html'
	}
});