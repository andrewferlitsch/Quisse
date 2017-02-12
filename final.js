technical.controller( 'finalCtrl', function( $scope, $location, $anchorScroll ) {
	$scope.title 	= "Final Score";
	$scope.show 	= true;
	$scope.totalQuestions = 0;
	$scope.totalCorrect   = 0;
	$scope.percentCorrect = "";
})
.directive( "final", function() {
	return {
		restrict: 'A',
		template: "<hr/>" +
				  "<a id='final'/>" +
				  "<br/>" +
				  "<div class='w3-container w3-green'><p>Final Score</p></div>" +
				  "<div ng-show='show'>" +
				  "	<p><span class='final'>Number of Questions</span>: <span id='totalQuestions' class='w3-badge'>{{totalQuestions}}</span></p>" +
				  "	<p><span class='final'>Total Correct</span>: <span id='totalCorrect' class='w3-badge w3-green'>{{totalCorrect}}</span></p>" +
				  " <p><span class='final'>Percent Correct</span>: <span id='percentCorrect' class='w3-badge w3-green'>{{percentCorrect}}</span></p>" +
				  "</div>" +
				  "<div class='w3-container'>" +
				  "	<h3>Preparing for a Technical Phone Screen</h3>" +
				  "	<p>Use our 700 question/answer section below to practice a phone screen. " +
				  "	Each category will display three randomly selected questions in increasing difficulty.</p>" +
				  "	<p style='color: orange; cursor: pointer' ng-click='showleft=!showleft'>&#9205; Instructions</p>" +
				  "	<div ng-show='showleft'>" + 
				  "		<ol>" +
				  "			<li>Pick categories to be tested on.</li>" +
				  "			<li>Click on the category to expand it, which will display three random questions as flash cards, each ranked consecutively harder (easy, moderate, hard).</li>" +
				  "			<li>Click on the flash card to display the answer.</li>" +
				  "			<li>You can self-score by checking the Correct box.</li>" +
				  "			<li>You can accumulate your score by clicking the Score button at the bottom of each category.</li>" +
				  " 		<li>When completed, select the Final Score button at the bottom of the page.</li>" +
				  "		</ol>" +
				  "	</div>" +
				  "</div>"
	}
});