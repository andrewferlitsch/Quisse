technical.controller( 'finalCtrl', function( $scope ) {
	$scope.title 	= "Final Score";
	$scope.show 	= false;
})
.directive( "final", function() {
	return {
		restrict: 'A',
		template: "<hr/>" +
				  "<a name='final'/>" +
				  "<br/>" +
				  "<button id='final' class='w3-btn w3-green' ng-click='show=true'>Final Score</button>" +
				  "<div ng-show='show'>" +
				  "	<p><span class='final'>Number of Questions</span>: <span id='totalQuestions' class='w3-badge'></span></p>" +
				  "	<p><span class='final'>Total Correct</span>: <span id='totalCorrect' class='w3-badge'></span></p>" +
				  " <p><span class='final'>Percent Correct</span>: <span id='percentCorrect' class='w3-badge'></span></p>" +
				  "</div>" +
				  "<div class='w3-container'>" +
				  "<h3>Crowdsourcing the Dataset of Questions</h3>" +
				  "<p>Help us crowdsource the datasets of questions and answers.</p>" +
				  "<p style='color: orange; cursor: pointer' ng-click='showright=!showright'>&#9205; Instructions</p>" +
				  "<div ng-show='showright'>" +
				  "	<ul>" +
				  "		<li>Next to each answer, you can suggest a better answer.</li>" +
				  "		<li>At the bottom of the category, you can suggest new questions/answers.</li>" +
				  "		<li>Hover over and click on Rank to suggest a better ranking for a question.</li>" +
				  "	</ul>" +
				  "</div>" +
				  "</div>" +
				  "<div style='clear:both;'/>"
	}
});