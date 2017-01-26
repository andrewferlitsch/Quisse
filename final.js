technical.controller( 'finalCtrl', function( $scope ) {
	$scope.title 	= "Final Score";
	$scope.show 	= false;
})
.directive( "final", function() {
	return {
		restrict: 'A',
		template: "<a name='final'/>" +
				  "<br/>" +
				  "<button id='final' class='w3-btn w3-green' ng-click='show=true'>Final Score</button>" +
				  "<div ng-show='show'>" +
				  "	<p><span class='final'>Number of Questions</span>: <span id='totalQuestions' class='w3-badge'></span></p>" +
				  "	<p><span class='final'>Total Correct</span>: <span id='totalCorrect' class='w3-badge'></span></p>" +
				  " <p><span class='final'>Percent Correct</span>: <span id='percentCorrect' class='w3-badge'></span></p>" +
				  "</div>"
	}
});