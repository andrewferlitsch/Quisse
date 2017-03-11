technical.controller( 'mysqlDbaCtrl', function( $scope, $http, $location, $anchorScroll ) {
	$scope.subject 	= "MySQL DBA";
	$scope.name   	= "mysqldba";
	
	<?php include "qactrl.js"; ?>
})
.directive( "questionsMysqlDba", function() {
	return {
		restrict: 'A',
		templateUrl: 'flip.html'
	}
})
.directive( "multiMysqlDba", function() {
	return {
		restrict: 'A',
		templateUrl: 'multi.html'
	}
});