<?php
include "../db.php";
?>
<html lang="en-US">
<head>
	<title>Quisse Admin - NLP Dashboard</title>
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
	h2 { color: black; }
	.error { weight: bold; color: red; }
	.ok { weight: bold; color: green; }
	</style>
<script>
$(function() {
	var category;	// selected category
	var questions;	// list of questions
	var index;		// index into list of questions
	var size;		// size of question index
	
	// Select a category
	$("#category").change( function() {
		ClearStatus();
		category = this.value;
		$.get("/admin/get.php?category=" + category.replace( /\+/g, "%2B").replace( /#/g, "%23"), function( data, status ) {
			data = data.replace(/(\r\n|\n)/g, '\\n');
			questions = JSON.parse( data );
			index = 0;
			size  = questions.length;
			$("#size").html( size );
			
			// populate the first question
			Populate();
		})
		.fail (function( response ) {
			$("#err-cat").html( "Get Categories Failed: errCode = " + response.status );
		});	 
	})
	
	// Goto previous question in category
	$("#prev").click( function() {
		ClearStatus();
		if ( index == 0 )
			index = size - 1;
		else
			index--;
		Populate();
	})
	
	// Goto next question in category
	$("#next").click( function() {
		ClearStatus();
		if ( index == size - 1 )
			index = 0;
		else
			index++;
		Populate();
	})
	
	// Populate input form
	function Populate() {
		var question  = questions[ index ];
		$("#id").html( question.id );
		$("#question").val( question.question );
		$("#answer").val( question.answer );
		$("#level").val( question.level );
		$("#tcount").html( question.tcount );
		var timing = 0;
		if ( question.tcount > 0 )
			timing = question.timing / question.tcount;
		
		$("#timing").html( timing .toFixed(2));
		$("#words").html( question.words );
		$("#submit").val( "Update" );
				
		$("#err-sim").html( "" );
		$("#similar").html( "" );
		var similar = question.similar.split( "," );
		if ( similar.length > 0 ) {
			for ( var i = 0; i < similar.length; i++ ) {
				$.get("/admin/get.php?id=" + similar[ i ], function( data, status ) {
					data = data.replace(/(\r\n|\n)/g, '\\n');
					var question = JSON.parse( data );
					var answer   = question.answer;
					var id       = question.id;
					$("#similar").html( $("#similar").html() + id + ":" + answer + "<br/>" );
				})
				.fail (function( response ) {
					$("#err-sim").html( "Get Question Failed: errCode = " + response.status );
				});	 
			}
		}
	}
	
	// Clear input form to enter new question
	$("#new").click( function() {
		ClearStatus();
		$("#id").html( "" );
		$("#question").val( "" );
		$("#answer").val( "" );
		$("#level").val( 1 );
		$("#words").html( "" );
		$("#similar").html( "" );
		$("#tcount").html( "" );
		$("#timing").html( "" );
		$("#submit").val( "Add" );
		$("#size").html( ++size );
	})
	
	// Submit new or updated question
	$("#submit").click( function() {
		var action;
		
		// Add a question
		if ( $(this).val() == "Add" ) {
			action = "add";
			$("#submit").val( "Update" );
			
			// increment the list of questions by one
			index = size;
			size++;
			questions.push( { question: "", answer: "", level: "" } );
		}
		// Update a question
		else {
			action = "update";
		}
	
		$("#ok-sub").html( "" );
		$("#err-sub").html( "" );
		$.post( "/admin/post.php",
			{ action  : action,
			  category: category,
			  id      : $("#id").html(),
			  question: $("#question").val(),
			  answer  : $("#answer").val(),
			  level   : $("#level").val()
			},
			function ( data, status ) {
				questions[ index ].question = $("#question").val();
				questions[ index ].answer   = $("#answer").val();
				questions[ index ].level    = $("#level").val();
				if ( action == "add" ) {
					$("#id").html( data );
					questions[ index ].id = data;
				}
				$("#ok-sub").html( "Done" );
			}
		)
		.fail (function( response ) {
			$("#err-sub").html( "Unable to Add/Update: errCode = " + response.status );
		});	 
	})
	
	// Refresh the bag of words
	$("#refresh-words").click( function() {
		$("#ok-red").html( "" );
		$("#err-red").html( "" );
		$.post( "/admin/nlp.php",
			{ action  : "reduce",
			  id      : $("#id").html()
			},
			function ( data, status ) {
				console.log( data );
				$("#words").html( data );
				questions[ index ].words = data;
				$("#ok-red").html( "Done" );
			}
		)
		.fail (function( response ) {
			$("#err-red").html( "Unable to Reduce: errCode = " + response.status );
		});	 
	})
	
	// Refresh the list of similar questions
	$("#refresh-similar").click( function() {
		$("#ok-sim").html( "" );
		$("#err-sim").html( "" );
		$.post( "/admin/nlp.php",
			{ action  : "similar",
			  id      : $("#id").html()
			},
			function ( data, status ) {
				console.log( data );
				$("#similar").val( data );
				questions[ index ].similar = data;
				$("#ok-sim").html( "Done" );
			}
		)
		.fail (function( response ) {
			$("#err-sim").html( "Unable to Similar: errCode = " + response.status );
		});	 
	})
	
	function ClearStatus() {
		$("#ok-sub").html( "" );
		$("#err-sub").html( "" );
		$("#ok-red").html( "" );
		$("#err-red").html( "" );
		$("#ok-sim").html( "" );
		$("#err-sim").html( "" );
	}
})
</script>
</head>
<body>
	<header style='text-align: center'>
		<h2>Quisse Admin Dashboard</h2>
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
		<span id='id' name='id'></span>&nbsp;
		<!-- No of Questions -->
		<label for='size' class='w3-label'>No. of Questions:</label>
		<span id='size' name='size'></span>&nbsp;
		<!-- total responses -->
		<label for='tcount' class='w3-label'>Response Count:</label>
		<span id='tcount' name='tcount'></span>&nbsp;
		<!-- Ave Timing -->
		<label for='timing' class='w3-label'>Ave Timing:</label>
		<span id='timing' name='timing'></span><br/><br/>

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
		<textarea id='answer' name='answer' cols=40 rows=3 required=true class='w3-input'>
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
		<input type='submit' id='submit' value='Update'/>
		<span id='ok-sub' class='ok'></span><br/>
		<span id='err-sub' class='error'></span><br/>
		
		<!-- Bag of Words -->
		<label for='words' class='w3-label'>Bag of Words</label>
		<button id='refresh-words' class='w3-btn w3-blue w3-small'>Refresh</button>
		<span id='ok-red' class='ok'></span>
		<span id='err-red' class='error'></span>
		<pre name='words' id='words'></pre>
		
		<!-- Similar Matching Questions -->
		<label for='similar' class='w3-label'>Similar Questions</label>
		<button id='refresh-similar' class='w3-btn w3-blue w3-small'>Refresh</button>
		<span id='ok-sim' class='ok'></span>
		<span id='err-sim' class='error'></span>
		<pre name='similar' id='similar'></pre>
	</section>

	<footer>
	</footer>
</body>
</html>