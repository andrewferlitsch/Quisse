technical.controller( 'navCtrl', function( $scope, $rootScope ) {
})
.directive( "nav", function() {
	return {
		restrict: 'A',
		template: "<div style='text-align: center; margin-top: -25px; margin-bottom: -10px'>" +
				  "<img src='/quisse.png'/>" +
				  "</div>" +
				  "<ul class='w3-navbar w3-green'>" +
				  "	<li><a href='javascript:void(0)' ng-click='showInterview();'>Flashcard</a></li>" +
				  "	<li><a href='coding-examples.html'>Coding</a></li>" +
				  "	<li><a href='/kids'>Kids</a></li>" +
				  "</ul>" +
				  "<br/>"
	}
});