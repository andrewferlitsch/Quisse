/* Copyright(c) 2016-17, Andrew Ferlitsch, All Rights Reserved */

/* Capture timestamps when user proceeds to next question or marks correct
 */
var timing = [];
var send = false;
var session;
function Timestamp( category, id, type ) {
	// on first call, setup timer and variables for sending timing metrics to server
	if ( send == false ) {
		send = true;
		session = Math.round( Math.random() * 10000 );
		setTimeout( function() { SendServer(); }, 10000 );
	}
	
	// store timing metrics until periodic upload to server
	var time = Math.floor( Date.now() / 1000 );
	timing.push( { session: session, category: category, id: id, type: type, time: time } );
	
	return time;
}

/*
 * Send Timing Metrics to the Server
 */
function SendServer() {
	if ( timing.length > 0 ) {	
		$.ajax({
			url: "/timing.php",
			type: 'post',
			data: { timing },
			success: function( data, status ) { },
			error: function(xhr) { console.log( xhr.status + " " + xhr.statusText ); }
		});
		timing = [];
	}
	setTimeout( function() { SendServer(); }, 10000 );
}