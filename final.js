technical.controller( 'finalCtrl', function( $scope, $rootScope, $location, $anchorScroll ) {
	$scope.title 	= "Final Score";
	$scope.show 	= true;
	$scope.showleft = false;
	$scope.totalQuestions = 0;
	$scope.totalCorrect   = 0;
	$scope.percentCorrect = "";
	
	$scope.cat = "";
	$scope.$on('category', function(event, args) {
		$scope.cat = args;
	})
	
	// Reset the Scoring
	$scope.Reset = function() {
		$rootScope.$broadcast( 'reset', $scope.cat );
	}
})
.directive( "final", function() {
	return {
		restrict: 'A',
		template: "<hr/>" +
				  "<a id='final'/>" +
				  "<br/>" +
				  "<div class='w3-container w3-green'><p>Score</p></div>" +
				  "<div ng-show='show'>" +
				  "	<p><span class='final'>Number of Questions</span>: <span id='totalQuestions' class='w3-badge'>{{totalQuestions}}</span></p>" +
				  "	<p><span class='final'>Total Correct</span>: <span id='totalCorrect' class='w3-badge w3-green'>{{totalCorrect}}</span></p>" +
				  " <p><span class='final'>Percent Correct</span>: <span id='percentCorrect' class='w3-badge w3-green'>{{percentCorrect}}</span></p>" +
				  "	<button class='w3-btn w3-red w3-small' ng-click='Reset()'>Reset</button>" +
				  "</div>"
	}
})
.directive( "bottomInterview", function() {
	return {
		restrict: 'A',
		template: "<div class='w3-container'>" +
				  "	<h3>Preparing for a Technical Phone Screen</h3>" +
				  "	<p>Questions are selected at random and may increase or decrease in difficulty, depending on your answers and time spent.</p>" +
				  "	<p style='color: orange; cursor: pointer' ng-click='showleft=!showleft'>&#9205; Instructions</p>" +
				  "	<div ng-show='showleft'>" + 
				  "		<ol>" +
				  "			<li>Pick categories to be tested on.</li>" +
				  "			<li>Click on the category to expand it, which will display randomly selected questions as flash cards at an initial level of difficulty.</li>" +
				  "			<li>As you answer questions (in)correctly, the level of difficulty will progressively increase or decrease.</li>" +
				  "			<li>Click on the flash card to display the answer.</li>" +
				  "			<li>You can self-score by checking the Correct box.</li>" +
				  "			<li>Your score will automatically accumulate, but you can reset your score in a category by selecting the reset button.</li>" +
				  " 		<li>When completed, your results are displayed at the bottom of the page.</li>" +
				  "		</ol>" +
				  "	</div>" +
				  "</div>"
	}
});