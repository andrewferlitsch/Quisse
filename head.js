technical.controller( 'interviewCtrl', function( $scope ) {
	$scope.categories = [ "Agile", "Algorithms", "AngularJS", "C", "C++", "C#", "CSS", "Data Science", "DOS", 
						  "HTML", "HTML5", "Java", "Javascript", "JQuery", "MySQL", "MySQL DBA", "Network", "OOP Design", 
						   "OS", "QA", "R", "Python", "Security", "Web" ];
	$scope.view = [];
	for ( var cat in $scope.categories ) {
		$scope.view[ cat ] = false;
	}
	$scope.showCategory = function( cat) {
		if ( $scope.last != "" )
			$scope.view[ $scope.last ] = false;
		$scope.view[ cat ] = true;
		$scope.last = cat;
		
		var el = document.getElementById( cat );
		setTimeout(function () { el.click(); }, 300);
	}
})
.directive( "interview", function() {
	return {
		restrict: 'A',
		template: "<h4 style='margin-top: -20px; text-align: center; color: steelblue'>The Technical Interview</h4>" +
				  "<p>Use our 800 question/answer dataset to practice a technical phone screen.</p>" +
				  "<label for='category' class='w3-label'>Select Skill Category:</label>" +
				  "<select name='category' id='category' class='w3-input' ng-model='category' ng-change='showCategory( category)'>" +
				  "	<option ng-repeat='category in categories' value={{category}}>{{category}}</option>" +
				  "</select>"
	}
});