technical.controller( 'kidsCtrl', function( $scope ) {
	$scope.categories = [ "Addition", "Subtraction", "Multiply", "Divide" ];
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
		setTimeout(function () { el.click(); }, 250);
	}
})
.directive( "kids", function() {
	return {
		restrict: 'A',
		template: "<h4 style='margin-top: -20px; text-align: center; color: steelblue'>Quisse for Kids</h4>" +
				  "<p>Use our question/answer dataset to practice learning math.</p>" +
				  "<label for='category' class='w3-label'>Select Learning Category:</label>" +
				  "<select name='category' id='category' class='w3-input' ng-model='category' ng-change='showCategory( category)'>" +
				  "	<option ng-repeat='category in categories' value={{category}}>{{category}}</option>" +
				  "</select>"
	}
});