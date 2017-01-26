# Reviewed
#----------------------------------------------------------------------
# Initialization
#----------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS questions
(
  id        INT          NOT NULL PRIMARY KEY auto_increment,
  category  VARCHAR(16)  NOT NULL,
  question  VARCHAR(256) NOT NULL,
  answer    VARCHAR(256) NOT NULL,
  rank      TINYINT 	 NOT NULL DEFAULT 1,
  toggle	TINYINT		 NOT NULL DEFAULT 0,

  INDEX(category),
  INDEX(rank)
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE utf8_bin;

DELETE FROM questions WHERE category = 'Web';

#----------------------------------------------------------------------
# Web
#----------------------------------------------------------------------

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Web',
    'What is a content delivery network (CDN)?',
    'Is a system of distributed servers (network) that deliver webpages and other Web content to a user based on the geographic locations of the user.',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Web',
    'What are the most common HTTP request methods?',
    'GET, POST, PUT, DELETE',
    1,
	1
  );


INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Web',
    'How are parameters passed in a GET method?',
    'They''re are passed as URL parameters.',
    1,
	1
  );


INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Web',
    'What is a Single Page Application (SPA)?',
    'This web application type loads a single HTML page. As the user interacts with the page, the page is updated by modifying the DOM and new content is obtained by AJAX calls.',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Web',
    'What is AJAX?',
    'It is an asynchronous method in Javascript to make calls to server side scripts. It uses the XMLHttpRequest object. Responses to the call typically are in JSON or XML format. The method is used to send or receive data to/from a server without refreshing the whole page.',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Web',
    'What is a stateless protocol?',
    'A communications protocol where each request is an independent transaction. The server does not retain any session, identity, or status information spanning multiple requests.',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Web',
    'What is a stateful protocol?',
    'A communications protocol where the server maintains state information (session data, identity, status, etc.) across multiple requests.',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Web',
    'What is a Multi-purpose Internet Mail Extensions (MIME) type?',
    'A standard for classifying file types over the Internet. It consists of a type and subtype separated by a slash, e.g., application/msword.',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Web',
    'What is Model View Controller (MVC)?',
    'Is a software design pattern for implementing user interfaces on computers. It divides the application into three interconnected components: 1) Model - represents the data, 2) View - how the data is visualized, and 3) Controller - how the data is manipulated and bound to the UI.',
    3,
	1
  );


INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Web',
    'What is the CRUD mapping to HTTP methods?',
    'POST = Create, GET = Read, PUT = Update, DELETE = Delete',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Web',
    'Describe what a REST API does. What is meant by stateless?',
    'A REST API call is made between a web application and a server via a HTTP request. The endpoint identifies the call or service being requested and the arguments are passed as query string (?parameters) appended to the URL. A REST API is considered stateless in that no state change persist across calls.',
    3,
	0
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Web',
    'What is a micro-service?',
    'A suite of independently deployable, small, modular services in which each service runs a unique process and communicates through a well-defined, lightweight mechanism.',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Web',
    'What is Cross Origin Resource Sharing (CORS)?',
    'A mechanism that allows many resources on a web page to be requested from another domain outside the domain from which the resource originated.',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Web',
    'What is Long Polling?',
    'A method for the client to emulate the server pushing data to the client. The client opens a connection. When the server sends data and the connection is closed, the client reopens the connection.',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Web',
    'What is the maximum number (limit) of concurrent asynchronous requests?',
    'The MDN for Firefox, specifies the maximum number as 6.',
    3,
	0
  );

