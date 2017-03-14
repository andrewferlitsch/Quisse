// Copyright(c), 2016-2017, Andrew Ferlitsch, All Rights Reserved
technical.controller( 'contributorCtrl', function( $scope ) {
	$scope.version = "1.1";
})
.directive( "contributor", function() {
	return {
		restrict: 'A',
		templateUrl: 'contributor.html'
	}
});