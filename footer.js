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
				  "		<a href='javascript:void(0)' ng-click='showAdvice()'>Advice</a>" +
				  "		<a href='' ng-click='showInterview = false; showAdvice = true;'>About</a>" +
				  "		<a href=''>Contact</a>" +
				  " </div>" +
				  "<div style='text-align: center; color: gray'><br/>Copyright(c) 2016-17, Andrew Ferlitsch, Co-Organizer, Portland Data Science Group</div>"
	}
});