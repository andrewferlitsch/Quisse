technical.controller( 'aboutCtrl', function( $scope ) {
	$scope.version = "1.1";
})
.directive( "about", function() {
	return {
		restrict: 'A',
		templateUrl: 'about.html'
	}
});