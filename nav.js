/* Copyright(c) 2016-2017, Andrew Ferlitsch, All Rights Reserved */

	
technical.controller( 'navCtrl', function( $scope, $rootScope ) {
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
		
		FB.getLoginStatus(function(response) {
			$scope.statusChangeCallback(response);
		});
	}
	
	// This is called with the results from from FB.getLoginStatus().
	$scope.statusChangeCallback = function(response) {
		console.log('statusChangeCallback');
		console.log(response);
		// The response object is returned with a status field that lets the
		// app know the current login status of the person.
		// Full docs on the response object can be found in the documentation
		// for FB.getLoginStatus().
		if (response.status === 'connected') {
			 // Logged into your app and Facebook.
			 FB.api('/me', function(response) {
				console.log('Successful login for: ' + response.name);
				//document.getElementById('status').innerHTML = 'Thanks for logging in, ' + response.name + '!';
				$scope.$apply(function () { $scope.showLogout = true; $scope.showLogin = false;} );
			});
		} else {
			// The person is not logged into your app or we are unable to tell.
			//document.getElementById('status').innerHTML = 'Please log ' + 'into this app.';
		}
	}
  
	$scope.checkLoginState = function() {
		FB.getLoginStatus(function(response) {
			$scope.statusChangeCallback(response);
		});
	}
	
	$scope.Logout = function() {
		$scope.showLogout = false;
		$scope.showLogin  = true;
		console.log( "logout");
		FB.logout(function(response) {
			// Person is now logged out
		});
	}	
	
	$scope.showLogout = false;
	$scope.showLogin  = true;
})
.directive( "nav", function() {
	return {
		restrict: 'A',
		template: "<div style='text-align: center; margin-top: -25px; margin-bottom: -10px'>" +
				  "<img src='/quisse.png'/>" + 
				  "<fb:login-button class='w3-right' style='margin-top: 10px' scope='public_profile,email' ng-click='checkLoginState();' ng-show='showLogin'></fb:login-button>" +
				  "<button ng-show='showLogout' ng-click='Logout();' class='w3-right w3-btn w3-blue w3-tiny' style='margin-top: 10px'>Logout</button>" +
				  "</div>" +
				  "<ul class='w3-navbar w3-green'>" +
				  "	<li><a href='/' ng-click='showPage( \"Interview\" );'>Flashcard</a></li>" +
				  "	<li><a href='coding-examples.html'>Coding</a></li>" +
				  "	<li><a href='/kids'>Kids</a></li>" +
				  "</ul>" +
				  "<br/>"
	}
});