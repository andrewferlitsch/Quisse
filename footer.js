technical.controller( 'footerCtrl', function( $scope ) {
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
				  "		<a href='/' ng-click='showPage( \"Advice\" )'>Advice</a>" +
				  "		<a href='/' ng-click='showPage( \"About\" );'>About</a>" +
				  "		<a href='/' ng-click='showPage( \"Contact\" );'>Contact</a>" +
				  " </div>" +
				  "<div style='text-align: center; color: gray'><br/>Copyright(c) 2016-17, Andrew Ferlitsch, Co-Organizer, Portland Data Science Group</div>"
	}
});