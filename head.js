
function w3_open() {
  document.getElementById("sidebar").style.display = "block";
}
function w3_close() {
  document.getElementById("sidebar").style.display = "none";
}

// Copyright(c), 2016-2017, Andrew Ferlitsch, All Rights Reserved
technical.controller( 'interviewCtrl', function( $scope, $rootScope ) {
	// page view
	$scope.page = [];
	$scope.page[ "Interview" ] = true;
	$scope.lastpage = "Interview";
	$scope.showPage = function( page ) {
		if ( $scope.lastpage != "" )
			$scope.page[ $scope.lastpage ] = false;
		$scope.page[ page ] = true;
		$scope.lastpage = page;
	}
	
	// technical view
	$scope.categories = [ "Agile", "AI", "Algorithms", "AngularJS", "C", "C++", "C#", "CSS", "Data Science", "DOS", 
						  "HTML", "HTML5", "Java", "Javascript", "JQuery", "MySQL", "MySQL DBA", "Machine Learning",
						  "Network", "OOP Design", "OS", "Python", "QA", "R", "Security", "Web" ];
	$scope.view = [];
	for ( var cat in $scope.categories ) {
		$scope.view[ cat ] = false;
	}
	
	$scope.showCategory = function( cat) {
		if ( $scope.lastcat != "" )
			$scope.view[ $scope.lastcat ] = false;
		$scope.view[ cat ] = true;
		$scope.lastcat = cat;
		
		// reset scoring
		totalQuestions = 0;	
		totalCorrect   = 0;
		timeSpent      = "";
		
		var el = document.getElementById( cat );
		setTimeout(function () { el.click(); }, 300);
		
		// Pass the category onto the final score controller
		$rootScope.$broadcast('category', cat );
		
		// close the sidebar
		w3_close();
	}
	
	$scope.$on('reset', function(event, args) {
		$scope.showCategory( args );
	})
})
.directive( "interview", function() {
	return {
		restrict: 'A',
		template: //"<h4 style='margin-top: -20px; text-align: center; color: steelblue'>The Technical Interview</h4>" +
				  //"<p>Use our 1300 question/answer dataset to practice a technical phone screen.</p>" +
				  //"<label for='category' class='w3-label'>Select Skill Category:</label>" +
				  //"<select name='category' id='category' class='w3-input' ng-model='category' ng-change='showCategory( category)' required>" +
				  //"	<option value='' disabled selected>Select a category...</option>" +
				  //"	<option ng-repeat='category in categories' value={{category}}>{{category}}</option>" +
				  //"</select>" 
				  "<div class='w3-sidebar w3-bar-block w3-collapse w3-card-2' style='width:200px; margin-top: -15px; height: 70%' id='sidebar'>" +
				  "	<button class='w3-bar-item w3-button w3-hide-large' onclick'w3_close()'>Close &times;</button>" +
				  "	<a href='#' class='w3-bar-item w3-button' ng-repeat='category in categories' ng-click='showCategory( category)'>{{category}}</a>" +
				  "</div>"
	}
});