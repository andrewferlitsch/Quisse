technical.controller( 'interviewCtrl', function( $scope ) {
	$scope.showleft  = false;
	$scope.showright = false;
})
.directive( "interview", function() {
	return {
		restrict: 'A',
		template: "<div style='text-align: center'>" +
				  "<h1>The Technical Interview</h1>" +
				  "</div>" +
				  "<div style='font-size: 16pt;' class='w3-container'>" +
				  "<p>For those wanting to prepare for an in-person technical interview, see our <button id='guide' class='w3-btn w3-green w3-round w3-small'>Guide</button> " +
				  "and our <button id='coding' class='w3-btn w3-green w3-round w3-small'>Coding Examples</button></p>" +
				  "</div>" +
				  "<div style='width: 45%' class='w3-left'>" +
				  "<h3>Preparing for a Technical Phone Screen</h3>" +
				  "<p>Use our question/answer section below to practice a phone screen with another person, or just yourself. " +
				  "Each category will display three randomly selected questions in increasing difficulty.</p>" +
				  "<p style='color: orange; cursor: pointer' ng-click='showleft=!showleft'>&#9205; Instructions</p>" +
				  "<div ng-show='showleft'>" + 
				  "	<ol>" +
				  "		<li>The interviewee (you) tells the interviewer (other person) categories to be tested on.</li>" +
				  "		<li>For each selected category, the interviewer clicks on the category, which will display three random questions, each ranked consecutively harder (easy, moderate, hard).</li>" +
				  "		<li>The interviewer will select show answers and ask each question.</li>" +
				  "		<li>If the interviewer feels the answer was sufficient, then the interviewer checks the Correct box.</li>" +
				  "		<li>When a category is done, the interviewer selects the Score button in the category.</li>" +
				  " 	<li>When completed, the interviewer selects the Final Score button at the bottom of the page.</li>" +
				  "	</ol>" +
				  "</div>" +
				  "</div>" +
				  "<div style='width: 45%; margin-right: 20px;' class='w3-right'>" +
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