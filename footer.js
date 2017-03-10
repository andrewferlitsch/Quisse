technical.controller( 'footerCtrl', function( $scope, $location, $anchorScroll ) {
	$scope.title 	= "Final Score";
	$scope.show 	= true;
	$scope.showlef  = true;
	$scope.totalQuestions = 0;
	$scope.totalCorrect   = 0;
	$scope.percentCorrect = "";
})
.directive( "footer", function() {
	return {
		restrict: 'A',
		template: "<div class='w3-container' style='color: orange; text-align: center;'>" +
				  "		<a href='preparing-for-technical-interview.html'>Advice</a>" +
				  "		<a href='about.html'>About</a>" +
				  "		<a href=''>Contact</a>" +
				  " </div>" 
	}
});