// Copyright(c), 2016-2017, Andrew Ferlitsch, All Rights Reserved
technical.controller( 'aboutCtrl', function( $scope ) {
	$scope.version = "1.3";
	$scope.showflipdetails = false;
	$scope.showquizdetails = false;
})
.directive( "about", function() {
	return {
		restrict: 'A',
		templateUrl: '/about.html'
	}
});