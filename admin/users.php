<?php
/* Copyright(c), 2016-2017, Andrew Ferlitsch, All Rights Reserved
 */
session_start();
include "../db.php";
?>
<html lang="en-US">
<head>
	<title>Quisse - Admin Dashboard</title>
	<meta NAME="robots" CONTENT="noindex, nofollow">
	<meta charset="utf-8">
	<meta name='keywords' content=''>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<style>
	body { padding: 10px; }
	h2 { color: steelblue; }
	.error { weight: bold; color: red; }
	.ok { weight: bold; color: green; }
	</style>
<script>
$(function() {
	var id = 1;
	var nusers = 0;
	var user = null;
	
	// get initial entry
	$.get("/admin/user.php?get&userid=" + id, function( data, status ) {
		user = JSON.parse( data );
		Populate();
	});
	
	// get count of users
	$.get("/admin/user.php?count", function( data, status ) {
		nusers = JSON.parse( data );
	});
	
	// Get previous user
	$("#prev").click( function() {
		if ( id != 1 )
			id--;
		else
			id = nusers;
		
		$.get("/admin/user.php?get&userid=" + id, function( data, status ) {
			user = JSON.parse( data );
			Populate();
		});
			
	})
	
	// Get next user
	$("#next").click( function() {
		if ( id != nusers )
			id++;
		else
			id = 1;
		
		$.get("/admin/user.php?get&userid=" + id, function( data, status ) {
			user = JSON.parse( data );
			$("#id").html( data.id );
			Populate();
		});
	})
	
	// Populate the user information form
	function  Populate() {
		$("#add").hide();
		$("#lpassword").hide();
		$("#lconfirm").hide();
		$("#lcreated").show();
		$("#llastlogin").show();
		
		$("#id").html( user.id );
		$("#username").val( user.username );
		$("#email").val( user.email );
		$("#created").val( user.created );
		$("#lastlogin").val( user.lastlogin );
		
		$("#error").html("");
		$("#ok").html("");
	}
	
	// Create a new user
	$("#new").click( function() {
		$("#add").show();
		$("#lpassword").show();
		$("#lconfirm").show();
		$("#lcreated").hide();
		$("#llastlogin").hide();
		
		$("#id").html( "" );
		$("#username").val( "" );
		$("#email").val( "" );
		$("#created").val( "" );
		$("#lastlogin").val( "" );
		
		$("#error").html("");
		$("#ok").html("");
	})
	
	// Add the user
	$("#add").click( function() {
		$("error").html("");
		$("#ok").html("");
		$.post("/admin/user.php",
			{ new       : 1,
			  username  : $("#username").val(),
			  email     : $("#email").val(),
			  password  : $("#password").val(),
			  confirm   : $("#confirm").val()
			},
			function ( data, status ) { $("#ok").html( "Added" ); }
		)
		.fail (function( response ) {
			$("#error").html( response.statusText );
		});	
	})
})

</script>
</head>
<body ng-app="technical">
	<header ng-controller="navCtrl" style='text-align:center'>
		<div nav></div>
		<h2>Quisse Admin User Dashboard</h2>
	</header>
	
	<section class='w3-container'>
		<!-- Next, Prev, New -->
		<button id='prev' class='w3-btn w3-blue'>Prev</button>
		<button id='next' class='w3-btn w3-blue'>Next</button>
		<button id='new'  class='w3-btn w3-blue'>New</button>
		<br/><br/>
		
		<form>
			<span>ID:</span><span id='id'></span><br/>
			
			<label for='username' class='w3-label'>UserName:</label>
			<input type='text' name='username' id='username' class='w3-input'/>
			<label for='email' class='w3-label'>Email:</label>
			<input type='email' name='email' id='email' class='w3-input' required/>
			<label for='password' class='w3-label' style='display:none' id='lpassword'>Password:
				<input type='password' name='password' id='password' class='w3-input' required/>
			</label>
			<label for='confirm' class='w3-label' style='display:none' id='lconfirm'>Confirm:
				<input type='password' name='confirm' id='confirm' class='w3-input' required/>
			</label>
			
			<label for='created' class='w3-label' id='lcreated'>Created:
				<input type='date' name='created'  class='w3-input'/>
			</label>
			
			<label for='lastlogin' class='w3-label' id='llastlogin'>LastLogin:
				<input type='date' name='lastlogin'  class='w3-input'/>
			</label>
			
			<label for='active' class='w3-label'>Active:</label>
			<select name='active' id='active'>
				<option value='1'>1</option>
				<option value='2'>2</option>
			</select>
			<br/>
			
			<input type='hidden' name='new'/>
			<input type='submit' id='add' value='Add' style='display:none' class='w3-btn w3-blue'/>
			<span id='error' class='error'></span>
			<span id='ok'    class='ok'></span>
			
		</form>
	</section>

	<footer ng-controller="footerCtrl" id='footer'>
			<div footer></div>
	</footer>

<script>
var technical = angular.module( 'technical', []);
</script>
<script src="../nav.js"></script>
<script src="../footer.js"></script>
</body>
</html>