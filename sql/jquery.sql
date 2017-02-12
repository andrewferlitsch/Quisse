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
  rank      TINYINT		 NOT NULL DEFAULT 1,
  toggle 	TINYINT		 NOT NULL DEFAULT 1,

  INDEX(category),
  INDEX(rank)
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE utf8_bin;

DELETE FROM questions WHERE category = 'JQuery';

#----------------------------------------------------------------------
# JQuery
#----------------------------------------------------------------------

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'JQuery',
    'What is the shortcut for loading jQuery code after the document ready event?',
    '$(function() { }',
    1,
	1
  );


INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'JQuery',
    'What does jQuery use for selectors?',
    'CSS selectors and some custom selectors',
    1,
	1
  );


INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'JQuery',
    'What does this select: $(''div.cat'')?',
    'All div elements with class = cat',
    1,
	1
  );


INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'JQuery',
    'What symbol is used for a JQuery shortcut?',
    '$',
    1,
	0
  );


INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'JQuery',
    'How do you get the inner HTML code for an element?',
    '$(''div'').html()',
    1,
	1
  );


INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'JQuery',
    'What method is used to hide an element?',
    'hide()',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'JQuery',
    'How do you get the version of JQuery that is being used?',
    '$.ui.version',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'JQuery',
    'What syntax is used to change the style of div element?',
    '$(''div'').css(property,value)',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'JQuery',
    'How do you get and set an attribute for an element?',
    'selector.attr(name) and selector.attr(name,value)',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'JQuery',
    'What are some of the effects methods in JQuery?',
    'hide(), show(), toggle(), fadeIn(), fadeOut()',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'JQuery',
    'What method is used to make an AJAX call?',
    '$.ajax({ ... })',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'JQuery',
    'What does $(''div p'') select?',
    'It selects all p elements (paragraph) inside all div elements.',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'JQuery',
    'What does the .each() method do?',
    'This method iterates through all the elements of an array or properties in an object.',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'JQuery',
    'Which jQuery method is used to switch between adding/removing one or more classes (for CSS) from selected elements?',
    'toggleClass()',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'JQuery',
    'What methods are used to remove selected items?',
    'remove() and detach()',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'JQuery',
    'What is the difference between size() and length?',
    'Both return the same, but size() is a method and length is a property, so length is faster.',
    3,
	0
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'JQuery',
    'How to you indicate to not treat the dollar sign as a JQuery alias in subsequent javascript code?',
    '$.noConflict();',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'JQuery',
    'What are the parameters for a AJAX call?',
    'The parameters are url (for url), type (for http method) and data (for data to send)',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'JQuery',
    'How do you assign a key/value pair to an element?',
    'selector:data(''name'',value) e.g., div:data(''color'', ''green'')',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'JQuery',
    'What is the difference between onload() and document.ready() events?',
    'document.ready() is tiggered when the DOM is loaded, while onload is trigger when the DOM and web resources are loaded.',
    3,
	0
  );

 SELECT COUNT(*) FROM questions WHERE category = 'JQuery'
