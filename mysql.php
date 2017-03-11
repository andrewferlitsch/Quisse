technical.controller( 'mysqlCtrl', function( $scope, $http, $location, $anchorScroll ) {
	$scope.subject 	= "MySQL";
	$scope.name   	= "mysql";
	
	<?php include "qactrl.js"; ?>
})
.directive( "questionsMysql", function() {
	return {
		restrict: 'A',
		templateUrl: 'flip.html'
	}
})
.directive( "multiMysql", function() {
	return {
		restrict: 'A',
		templateUrl: 'multi.html'
	}
});