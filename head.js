technical.controller( 'interviewCtrl', function( $scope ) {
	$scope.categories = [ "Web", "HTML", "HTML5", "CSS", "Javascript", "JQuery", "AngularJS", "Java", "C#", "C++", "C", "R", "Python",
						  "Data Science", "Algorithms", "OS", "OOP", "DOS", "MySQL", "MySQL DBA", "QA", "Agile", "Network", "Security" ];
	$scope.view = [];
	for ( var cat in $scope.categories ) {
		$scope.view[ cat ] = false;
	}
	$scope.showCategory = function( cat) {
		if ( $scope.last != "" )
			$scope.view[ $scope.last ] = false;
		$scope.view[ cat ] = true;
		$scope.last = cat;
	}
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
				  "<div style='class='w3-left'>" +
				  "<h3>Preparing for a Technical Phone Screen</h3>" +
				  "<p>Use our 500 question/answer section below to practice a phone screen. " +
				  "Each category will display three randomly selected questions in increasing difficulty.</p>" +
				  "<p style='color: orange; cursor: pointer' ng-click='showleft=!showleft'>&#9205; Instructions</p>" +
				  "<div ng-show='showleft'>" + 
				  "	<ol>" +
				  "		<li>Pick categories to be tested on.</li>" +
				  "		<li>Click on the category to expand it, which will display three random questions as flash cards, each ranked consecutively harder (easy, moderate, hard).</li>" +
				  "		<li>Click on the flash card to display the answer.</li>" +
				  "		<li>You can self-score by checking the Correct box.</li>" +
				  "		<li>You can accumulate your score by clicking the Score button at the bottom of each category.</li>" +
				  " 	<li>When completed, select the Final Score button at the bottom of the page.</li>" +
				  "	</ol>" +
				  "</div>" +
				  "</div>" +
				  "<div style='clear:both;'/>" +	  
				  "<label for='category' class='w3-label'>Select Category:</label>" +
				  "<select name='category' id='category' class='w3-input' ng-model='category' ng-change='showCategory( category)'>" +
				  "	<option ng-repeat='category in categories' value={{category}}>{{category}}</option>" +
				  "</select>"
	}
});