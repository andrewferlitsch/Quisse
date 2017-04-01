// Copyright(c), 2016-2017, Andrew Ferlitsch, All Rights Reserved
technical.controller( 'finalCtrl', function( $scope, $rootScope, $location, $anchorScroll ) {
	$scope.title 	= "Final Score";
	$scope.show 	= true;
	$scope.totalQuestions = 0;
	$scope.totalCorrect   = 0;
	$scope.percentCorrect = "";
	$scope.timeSpent      = "";
	
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
				  " <p><span class='final'>Time Spent (secs) </span>: <span id='timeSpent'>{{timeSpent}}</span></p>" +
				  "	<button class='w3-btn w3-red w3-small' ng-click='Reset()'>Reset</button>" +
				  "</div>"
	}
})
.directive( "bottomInterview", function() {
	return {
		restrict: 'A',
		template: "<div class='w3-container'>" +
				  "	<h3>Preparing for a Technical Interview</h3>" +
				  "	<p style='color: orange; cursor: pointer' ng-click='showPage( \"About\" );'>&#9205; Instructions - See About</p>" +
				  "</div>"
	}
});