# Reviewed

#----------------------------------------------------------------------
# Initialization
#----------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS questions
(
  id        INT          NOT NULL PRIMARY KEY auto_increment,
  category  VARCHAR(16)  NOT NULL,
  question  VARCHAR(256) NOT NULL,
  answer    VARCHAR(512) NOT NULL,
  rank      TINYINT		 NOT NULL DEFAULT 1,
  toggle	TINYINT		 NOT NULL DEFAULT 1,

  INDEX(category),
  INDEX(rank)
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE utf8_bin;

DELETE FROM questions WHERE category = 'AngularJS';

#----------------------------------------------------------------------
# AngularJS
#----------------------------------------------------------------------

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'AngularJS',
    'What is a Controller?',
    'The program logic which controls a view.',
    1,
	1
  );


INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'AngularJS',
    'What is a Module?',
    'A container for the different parts of an app including controllers, services, filters, and directives.',
    1,
	1
  );


INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'AngularJS',
    'What is a Filter?',
    'It formats the value of an expression for display to the user.',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'AngularJS',
    'What is a Model?',
    'It is the data shown to the user in the view and with which the user interacts.',
    1,
	1
  ); 
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'AngularJS',
    'What is ng-repeat?',
    'A directive that will repeat an HTML element for each value in an array expression, where the value is bound to a variable which can be used within the element.',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'AngularJS',
    'What does a ng-if directive do?',
    'This conditional conditional includes an HTML element depending of the evaluation of the conditional angular expression being true.',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'AngularJS',
    'Can you use AngualrJS and JQuery together?',
    'It is considered bad practice, can cause problems, and a sign of a novice.',
    1,
	0
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'AngularJS',
    'What is a Service?',
    'A reusable business (program) logic independent of views.',
    2,
	1
  );


INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'AngularJS',
    'What is ngRoute?',
    'A standard (predefined) module used to enable URL routing to your application.',
    2,
	1
  );


INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'AngularJS',
    'What is ngAnimate?',
    'A standard (predefined) module used to enable animation features within your application.',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'AngularJS',
    'What is ngCookies?',
    'A standard (predefined) module used to handle cookie management within your application.',
    2,
	1
  );


INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'AngularJS',
    'What is ngSanitize?',
    'A standard module used to securely parse and manipulate HTML data in your application.',
    2,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'AngularJS',
    'What is ng-repeat-start and ng-repeat-end?',
    'A directive that allows a repeated sequence across more than one HTML element.',
    2,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'AngularJS',
    'How do you access the HTTP service?',
    'The $http service is injected into the controller.',
    2,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'AngularJS',
    'What does ng-if do?',
    'This directive conditionally includes code into the DOM.',
    2,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'AngularJS',
    'What services are used to scroll to an anchor (tag with specific ID)?',
    'The $location and $anchorScroll services.',
    2,
	1
  );  

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'AngularJS',
    'How do you limited what HTML entities a directive can be applied to.',
    'The restrict option can be set to ''A'' (Attribute only), ''E'' (Element only) and ''C'' (Class only).',
    2,
	1
  );  

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'AngularJS',
    'What is the property to include a HTML template into a directive',
    'The property templateUrl.',
    2,
	1
  );  

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'AngularJS',
    'How do you disable a checkbox after it has been checked?',
    'ng-disabled=''checked''',
    2,
	1
  ); 

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'AngularJS',
    'What is two-way data binding?',
    'When you change a value in the view, it is automatically updated in the model. Likewise, if the value in the model is changed, it is automatically updated in the view.',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'AngularJS',
    'How do you share data across controllers?',
    'Data can be shared across controllers via $rootScope or a service that holds the data and is injected into each controllers.',
    3,
	0
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'AngularJS',
    'What is the digest cycle?',
    'A repeated cycle where AngularJS looks for changes in data and updates the corresponding bindings. It can be explicitly invoked using $apply().',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'AngularJS',
    'What does $apply.copy() do?',
    'It makes a deep copy of a variable. The copy doesn''t point to the same memory reference as that variable.',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'AngularJS',
    'How do you update data in a controller outside of an Angular context?',
    'You need to issue an $apply() to manually fire the watchers to update the data in the model',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'AngularJS',
    'What are some examples of directives that explicitly trigger a digest cycle?',
    'ng-click, ng-change, ng-model, timeout.',
    3,
	0
  );

SELECT COUNT(*) FROM questions WHERE category = 'AngularJS';