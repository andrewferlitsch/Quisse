technical.controller( 'interviewCtrl', function( $scope ) {
	$scope.categories = [ "Web", "HTML", "HTML5", "CSS", "Javascript", "JQuery", "AngularJS", "Java", "C#", "C++", "C", "R", "Python",
						  "Data Science", "Algorithms", "OS", "OOP Design", "DOS", "MySQL", "MySQL DBA", "QA", "Agile", "Network", "Security" ];
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
		setTimeout(function () { el.click(); }, 200);
	}
})
.directive( "interview", function() {
	return {
		restrict: 'A',
		template: "<div style='text-align: center'>" +
				  "<h1>The Technical Interview</h1>" +
				  
				  "</div>" +
				  "<ul class='w3-navbar w3-green'>" +
				  "	<li><a href='preparing-for-technical-interview.html'>Interview Guide</a></li>" +
				  "	<li><a href='coding-examples.html'>Coding Examples</a></li>" +
				  "<span style='font-size: 9pt' class='w3-right'>Questions: <span class='w3-badge w3-tiny w3-teal'>510</span></span>" +
				  "</ul>" +
				  "<br/>" +
				  "<label for='category' class='w3-label'>Select Category:</label>" +
				  "<select name='category' id='category' class='w3-input' ng-model='category' ng-change='showCategory( category)'>" +
				  "	<option ng-repeat='category in categories' value={{category}}>{{category}}</option>" +
				  "</select>"
	}
});