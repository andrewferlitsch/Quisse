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
	var id = 0;
	
	$("#prev").click( function() {
		if ( id != 0 )
			id--;
		$("#add").hide();
		
		$.get("/admin/users.php?get&userid=" + id, function( data, status ) {
			data = JSON.parse( data );
			$("#id").html( data.id );
		});
			
	})
	
	$("#next").click( function() {
		id++;
		$("#add").hide();
		
		$.get("/admin/users.php?get&userid=" + id, function( data, status ) {
			data = JSON.parse( data );
		});
	})
	
	$("#new").click( function() {
		$("#add").show();
	})
})
</script>
</head>
<body ng-app="technical">
	<header style='text-align: center' ng-controller="interviewCtrl">
		<div nav></div>
		<h2>Quisse Admin User Dashboard</h2>
	</header>
	
	<section class='w3-container'>
		<!-- Next, Prev, New -->
		<button id='prev' class='w3-btn w3-blue'>Prev</button>
		<button id='next' class='w3-btn w3-blue'>Next</button>
		<button id='new'  class='w3-btn w3-blue'>New</button>
		<br/><br/>
		
		<form action="admin.php" method='POST'>
			<span>ID:</span><span id='id'></span><br/>
			
			<label for='username' class='w3-label'>UserName:</label>
			<input type='text' name='username' id='username' class='w3-input'/>
			<label for='email' class='w3-label'>Email:</label>
			<input type='text' name='email' class='w3-input' required/>
			<label for='password' class='w3-label'>Password:</label>
			<input type='text' name='password' class='w3-input' required/>
			<label for='confirm' class='w3-label'>Confirm:</label>
			<input type='text' name='confirm' class='w3-input' required/>
			<input type='hidden' name='new'/>
			<input type='submit' id='add' value='Add' style='display:none' class='w3-input'/>
		</form>
	</section>

	<footer ng-controller="footerCtrl" id='footer'>
			<div footer></div>
	</footer>

<script>
var technical = angular.module( 'technical', []);
</script>
<script src="../nav.js"></script
<script src="../footer.js"></script>
</body>
</html>