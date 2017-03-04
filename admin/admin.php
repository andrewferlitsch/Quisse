<?php
include "../db.php";
?>
<html lang="en-US">
<head>
	<title>Quisse Admin</title>
	<meta charset="utf-8">
	<meta name='keywords' content=''>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<style>
	body { padding: 10px; }
	h2 { color: black; }
	.error { weight: bold; color: red; }
	</style>
<script>
$(function() {
	var questions;	// list of questions
	var index;		// index into list of questions
	
	// Select a category
	$("#category").change( function() {
		var category = this.value;
		$.get("/admin/get.php?category=" + category, function( data, status ) {
			questions = JSON.parse( data );
			
			// populate the first question
			question  = questions[ 0 ];
			$("#id").html( question.id );
			index = 0;
		})
		.fail (function( response ) {
			$("#err-cat").html( "Get Categories Failed: errCode = " + response.status );
		});	 
	})
	
	$("#prev").click( function() {
		
	})
	
	$("#next").click( function() {
		
	})
	
	$("#new").click( function() {
		
	})
})
</script>
</head>
<body>
	<header style='text-align: center'>
		<h2>Quisse Admin</h2>
	</header>
	
	<section class='w3-container'>
		<!-- category -->
		<label for='category' class='w3-label'>Category</label>
		<select id='category' name='category' class='w3-input'>
			<option></option>
			<?php $categories = $db->GetCategories();
			$ncat = count( $categories );
			for ( $i = 0; $i < $ncat; $i++ ) {
				$category = $categories[ $i ];
				echo "<option id='$category'>$category</option>";
			}
			?>
		</select>
		<span id='err-cat' class='error'></span>
		
		<!-- ID -->
		<label for='id' class='w3-label'>ID:</label>
		<span id='id' name='id'></span><br/><br/>

		<!-- Next, Prev, New -->
		<button id='prev' class='w3-btn w3-blue'>Prev</button>
		<button id='next' class='w3-btn w3-blue'>Next</button>
		<button id='new'  class='w3-btn w3-blue'>New</button>
		<br/><br/>

		<!-- Question -->
		<label for='question' class='w3-label'>Question:</label>
		<input type='text' id='question' name='question' required=true class='w3-input'/>
		
		<!-- Answer -->
		<label for='answer' class='w3-label'>Answer:</label>
		<textarea id='answer' name='answer' cols=40 rows=4 required=true class='w3-input'>
		</textarea>
		
		<!-- Rank -->
		<label for='level' class='w3-label'>Level</label>
		<select id='level' name='level' class='w3-input'>
			<option value='1'>1</option>
			<option value='2'>2</option>
			<option value='3'>3</option>
		</select>
		<br/>
		
		<!-- Submit -->
		<input type='submit' value='Submit'/>
	</section>
	
	<footer>
	</footer>
</body>
</html>