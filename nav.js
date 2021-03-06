/* Copyright(c) 2016-2017, Andrew Ferlitsch, All Rights Reserved */

var userid = "";	// ID of logged in user

// Load the Facebook SDK asynchronously
(function(d, s, id) {
	var js, fjs = d.getElementsByTagName(s)[0];
	if (d.getElementById(id)) return;
	js = d.createElement(s); js.id = id;
	js.src = "//connect.facebook.net/en_US/sdk.js";
	fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));
	
window.fbAsyncInit = function() {
	FB.init({
	appId      : '1876694972578357',
	cookie     : true,  // enable cookies to allow the server to access 
							// the session
	xfbml      : true,  // parse social plugins on this page
	version    : 'v2.8' // use graph api version 2.8
	});
		
	//FB.getLoginStatus(function(response) {
		//statusChangeCallback(response);
	//});
}	
	
// This is called with the results from from FB.getLoginStatus().
function statusChangeCallback(response) {
	// The response object is returned with a status field that lets the
	// app know the current login status of the person.
	// Full docs on the response object can be found in the documentation
	// for FB.getLoginStatus().
	if (response.status === 'connected') {
			// Logged into your app and Facebook.
		FB.api('/me',  { locale: 'en_US', fields: 'name, email' }, function(response) {
			$.post( "/admin/user.php",
				{ fblogin: 1,
				  name	: response.name,
				  email	: response.email
				},
				function ( data, status ) {
					data = data.split(",");
					userid = data[ 1 ];
					LoggedIn( response.name );
				}
			)
			.fail (function( response ) {
				// error occurred
			});	 
		});
	} else {
		// The person is not logged into your app or we are unable to tell.
		//document.getElementById('status').innerHTML = 'Please log ' + 'into this app.';
	}
}  

function checkLoginState() {
	FB.getLoginStatus(function(response) {
		statusChangeCallback(response);
	});
}
	
function LoggedIn( username ) {
	var scope = angular.element($("#nav")).scope();
	scope.$apply(function(){
		scope.showLogout = true; scope.showLogin = false;
	});
	scope = angular.element($("#final")).scope();
	scope.$apply(function(){
		scope.showBadges = true;
	});
	$("#user").html( username + "&nbsp;" );
}

function LoggedOut() {
	$.post( "/admin/user.php",
		{ logout: 1
		},
		function ( data, status ) {
			userid = "";
			scope = angular.element($("#final")).scope();
			scope.$apply(function(){
				scope.showBadges = false;
			});
		}
	);	 
}
	
technical.controller( 'navCtrl', function( $scope, $rootScope ) {

	$scope.Logout = function() {
		$scope.showLogout = false;
		$scope.showLogin  = true;
		LoggedOut();
		$("#user").html( "" );
	}	
	
	$scope.showLogout = false;
	$scope.showLogin  = true;
})
.directive( "nav", function() {
	return {
		restrict: 'A',
		template: "<div style='text-align: center; margin-top: -25px; margin-bottom: -10px'>" +
				  "	<img src='/quisse.png'/>" + 
				  "	<fb:login-button class='w3-right' style='top: 10px; right: 10px; position: absolute' scope='public_profile,email' ng-show='showLogin' onlogin='checkLoginState();'></fb:login-button>" +
				  //"	<span class='w3-right' style='top: 10px; right: 80px; position: absolute' ng-show='showLogin' ><script type='in/Login'></script></span>" +
				  "	<span class='w3-right' style='top: 10px; right: 10px; position:absolute'>" +
				  "		<span ng-show='showLogout' id='user' style='font-size: 8pt; color: green'></span>" +
				  "		<button ng-show='showLogout' ng-click='Logout();' class='w3-btn w3-blue w3-tiny'>Logout</button>" +
				  "	</span>" +
				  "</div>" +
				  "<ul class='w3-navbar w3-green'>" +
				  "	<li><a href='/' ng-click='showPage( \"Interview\" );'>Flashcard</a></li>" +
				  "	<li><a href='coding-examples.html'>Coding</a></li>" +
				  "	<li><a href='/kids/'>Kids</a></li>" +
				  "</ul>" +
				  "<br/>"
	}
});