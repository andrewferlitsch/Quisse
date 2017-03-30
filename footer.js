technical.controller( 'footerCtrl', function( $scope ) {
})
.directive( "footer", function() {
	return {
		restrict: 'A',
		template: "<div class='w3-container' style='color: orange; text-align: center;'>" +
				  "		<a href='javascript:void(0)' ng-click='showPage( \"Advice\" )'>Advice</a>" +
				  "		<a href='javascript:void(0)' ng-click='showPage( \"About\" );'>About</a>" +
				  "		<a href='javascript:void(0)' ng-click='showPage( \"Contact\" );'>Contact</a>" +
				  "		<a href='javascript:void(0)' ng-click='showPage( \"Contributor\" );'>Contributors</a>" +
				  " </div>" +
				  "<div style='text-align: center; color: gray'><br/>Copyright(c) 2016-17, Andrew Ferlitsch, Co-Organizer, Portland Data Science Group</div>"
	}
});