technical.controller( 'dataScienceCtrl', function( $scope, $http, $location, $anchorScroll ) {
	$scope.subject 	= "Data Science";
	$scope.name  	= "datascience";
	
	<?php include "qactrl.js"; ?>
})
.directive( "questionsDataScience", function() {
	return {
		restrict: 'A',
		templateUrl: 'flip.html'
	}
})
.directive( "multiDataScience", function() {
	return {
		restrict: 'A',
		templateUrl: 'multi.html'
	}
});