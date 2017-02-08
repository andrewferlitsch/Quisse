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

  INDEX(category),
  INDEX(rank)
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE utf8_bin;

DELETE FROM questions WHERE category = 'Javascript';

#----------------------------------------------------------------------
# Javascript
#----------------------------------------------------------------------

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Javascript',
    'How can you declare an empty array?',
    'var arr = new Array()  or  var arr = [];',
    1,
	1
  );


INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Javascript',
    'How do you add (expand) a new element to an array?',
    'arr.push( newitem );',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Javascript',
    'Which HTML element is used to embed Javascript code?',
    '<script></script>',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Javascript',
    'When will accessing a variable result in a not defined error?',
    'This error occurs when a variable is accessed, but is not declared or defined.',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Javascript',
    'What is the value of a variable when it has been declared, but not defined?',
    'This is the value of the variable will be undefined.',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Javascript',
    'What type of class is supported in Javascript?',
    'Prototyped classes',
    2,
	1
  );


INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Javascript',
    'How do you round the number 7.5 to the nearest integer?',
    'Math.round( 7.5)',
    2,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Javascript',
    'What is a named function?',
    'A function that is of the form: function myfuncI() { ... }.',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Javascript',
    'What is an anonymous function?',
    'An(unnamed)functions used in callbacks and event handlers.',
    2,
	1
  );


INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Javascript',
    'How can you get an HTML element?',
    'getElementById(), getElementByName(), getElementByClassName(), getElementByTagName()',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Javascript',
    'What is the largest supported bit-size of an integer?',
    '32-bits',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Javascript',
    'Name the basic types in Javascript?',
    'undefined, null, boolean, number, string, symbol (new in ECMAScript 2015), function, object',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Javascript',
    'What does typeof do?',
    'This operator returns the type of an operand as a string without evaluating the operand',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Javascript',
    'What is the exponentiation operator?',
    'x ** y',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Javascript',
    'What is the bitwise XOR operator?',
    'x ^ y',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Javascript',
    'What is loose equality comparison?',
    '== comparision operator. Both operands are converted to a common type and then compared for the same value',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Javascript',
    'What is strict equality comparison?',
    '=== comparision operator. The operands must be of the same type and evaluate to the same value.',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Javascript',
    'How do you defined a function at run-time?',
    'var name = function() { ... }.',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Javascript',
    'This operator compares two objects for being the same type of object?',
    'instanceof',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Javascript',
    'What are some builtin methods for arrays?',
    'length(), sort(), push(), slice(), splice()',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Javascript',
    'What are all the ways an object can be initialized?',
    'new Object(), Object.create(), or using the literal notation. It  is a comma-deliminted list of zero or more pairs of property names and associated values of an object, enclosed in curly braces {}.',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Javascript',
    'What is the unsigned right shift operator?',
    'x >>> y',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Javascript',
    'What is a destructing assignment?',
    '[a,b] = [10,20] # where a will be assigned 10 and b will be assigned 20',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Javascript',
    'What is the conditional (ternary) operator?',
    'x ? y : z',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Javascript',
    'Give an example of a regular expression pattern in Javascript.',
    'var pat = /hello/i;  // matches all case-insensitive instances of the string hello. str.replace( /hello/i, "goodbye"); replaces hello with goodbye in string str.',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Javascript',
    'What tool do you use to debug javascript errors in FireFox? How do you write to the console log?',
    'FireFox Options Menu->Developer Tools->Browser Console. You can write to the browser console with console.log().',
    3,
	0
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Javascript',
    'What is closure?',
    'A function inside a parent function that has access to the parent''s scope.',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Javascript',
    'What does delete do?',
    'This builtin method removes a property from an object.',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Javascript',
    'What is hoisting?',
    'The Javascript parser takes all the variablen declarations and moves them to the top of the function.',
    3,
	1
  );


