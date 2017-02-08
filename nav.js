technical.controller( 'navCtrl', function( $scope ) {
})
.directive( "nav", function() {
	return {
		restrict: 'A',
		template: "<div style='text-align: center'>" +
				  "<h1>The Technical Interview</h1>" +
				  "</div>" +
				  "<ul class='w3-navbar w3-green'>" +
				  "	<li><a href='/'>Flashcards</a></li>" +
				  "	<li><a href='preparing-for-technical-interview.html'>Interview Guide</a></li>" +
				  "	<li><a href='coding-examples.html'>Coding Examples</a></li>" +
				  "<span style='font-size: 9pt' class='w3-right'>Questions: <span class='w3-badge w3-tiny w3-teal'>604</span></span>" +
				  "</ul>" +
				  "<br/>"
	}
});