technical.controller( 'kidsCtrl', function( $scope, $rootScope ) {
	// page view
	$scope.page = [];
	$scope.page[ "Kids" ] = true;
	$scope.lastpage = "Kids";
	$scope.showPage = function( page ) {
		if ( $scope.lastpage != "" )
			$scope.page[ $scope.lastpage ] = false;
		$scope.page[ page ] = true;
		$scope.lastpage = page;
	}
	
	$scope.categories = [ "Addition", "Subtraction", "Multiply", "Divide", "Group" ];
	$scope.view = [];
	for ( var cat in $scope.categories ) {
		$scope.view[ cat ] = false;
	}
	$scope.showCategory = function( cat) {
		if ( $scope.last != "" )
			$scope.view[ $scope.last ] = false;
		$scope.view[ cat ] = true;
		$scope.last = cat;
		
		// reset scoring
		totalQuestions = 0;	
		totalCorrect   = 0;
		
		var el = document.getElementById( cat );
		setTimeout(function () { el.click(); }, 250);
		
		// Pass the category onto the final score controller
		$rootScope.$broadcast('category', cat );
	}
	
	$scope.$on('reset', function(event, args) {
		$scope.showCategory( args );
	})
})
.directive( "kids", function() {
	return {
		restrict: 'A',
		template: "<h4 style='margin-top: -20px; text-align: center; color: steelblue'>Quisse for Kids</h4>" +
				  "<p>Use our question/answer dataset to practice learning math.</p>" +
				  "<label for='category' class='w3-label'>Select Learning Category:</label>" +
				  "<select name='category' id='category' class='w3-input' ng-model='category' ng-change='showCategory( category)' required>" +
				  "	<option value='' disabled selected>Select a category...</option>" +
				  "	<option ng-repeat='category in categories' value={{category}}>{{category}}</option>" +
				  "</select>"
	}
});