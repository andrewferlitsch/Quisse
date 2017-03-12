technical.controller( 'contributorCtrl', function( $scope ) {
	$scope.version = "1.1";
})
.directive( "contributor", function() {
	return {
		restrict: 'A',
		templateUrl: 'contributor.html'
	}
});