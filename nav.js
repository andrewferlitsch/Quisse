technical.controller( 'navCtrl', function( $scope, $rootScope ) {
	$rootScope.advice = false;
})
.directive( "nav", function() {
	return {
		restrict: 'A',
		template: "<div style='text-align: center'>" +
				  "<h1>The Technical Interview</h1>" +
				  "</div>" +
				  "<ul class='w3-navbar w3-green'>" +
				  "	<li><a href='/'>Flashcard</a></li>" +
				  "	<li><a href='coding-examples.html'>Coding</a></li>" +
				  "	<li><a href='preparing-for-technical-interview.html' ng-click=''>Advice</a></li>" +
				  "<span style='font-size: 9pt' class='w3-right'>Questions: <span class='w3-badge w3-tiny w3-teal'>814</span></span>" +
				  "</ul>" +
				  "<br/>"
	}
});