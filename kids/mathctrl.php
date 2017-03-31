
technical.controller( 'addCtrl', function( $scope, $http, $location, $anchorScroll ) {
	$scope.subject 	= "Addition";
	$scope.name     = "add";
	
	<?php include "qactrl.js"; ?>
})
.directive( "questionsAdd", function() {
	return {
		restrict: 'A',
		templateUrl: '/flip.html'
	}
})
.directive( "multiAdd", function() {
	return {
		restrict: 'A',
		templateUrl: '/multi.html'
	}
});

technical.controller( 'subCtrl', function( $scope, $http, $location, $anchorScroll ) {
	$scope.subject 	= "Subtraction";
	$scope.name     = "sub";
	
	<?php include "qactrl.js"; ?>
})
.directive( "questionsSub", function() {
	return {
		restrict: 'A',
		templateUrl: '/flip.html'
	}
})
.directive( "multiSub", function() {
	return {
		restrict: 'A',
		templateUrl: '/multi.html'
	}
});

technical.controller( 'mulCtrl', function( $scope, $http, $location, $anchorScroll ) {
	$scope.subject 	= "Multiply";
	$scope.name     = "mul";
	
	<?php include "qactrl.js"; ?>
})
.directive( "questionsMul", function() {
	return {
		restrict: 'A',
		templateUrl: '/flip.html'
	}
})
.directive( "multiMul", function() {
	return {
		restrict: 'A',
		templateUrl: '/multi.html'
	}
});

technical.controller( 'divCtrl', function( $scope, $http, $location, $anchorScroll ) {
	$scope.subject 	= "Divide";
	$scope.name     = "div";
	
	<?php include "qactrl.js"; ?>
})
.directive( "questionsDiv", function() {
	return {
		restrict: 'A',
		templateUrl: '/flip.html'
	}
})
.directive( "multiDiv", function() {
	return {
		restrict: 'A',
		templateUrl: '/multi.html'
	}
});
