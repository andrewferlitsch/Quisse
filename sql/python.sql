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
  toggle    TINYINT		 NOT NULL DEFAULT 1,
  timing	INT			 NOT NULL DEFAULT 0,

  INDEX(category),
  INDEX(rank)
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE utf8_bin;

DELETE FROM questions WHERE category = 'Python';

#----------------------------------------------------------------------
# Python
#----------------------------------------------------------------------

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Python',
    'How are blocks of code delineated (e.g, statements for an if block)?',
    'Blocks of code are denoted by line indentation.',
    1,
	1
  );


INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Python',
    'What is the syntax of a comment?',
    '#',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Python',
    'What are the six standard data types?',
    'Numbers, String, List, Tuple, Dictionary, Set',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Python',
    'In a class method, how do you assign a member field that has the same name as a parameter?',
    'self.field = field',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Python',
    'How do you print a line?',
    'print(arg)',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Python',
    'How do you declare a named function?',
    'def name(args):',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Python',
    'What keyword is used in an assignment to indicate a variable has no value (not pointing to any object)?',
    'None',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Python',
    'What is the syntax of an IF statement?',
    'if conditional:',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Python',
    'What is the syntax of an ELSE statement?',
    'else:',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Python',
    'What is the syntax of an ELSE IF statement?',
    'elif conditional:',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Python',
    'How do define a class constructor?',
    'def __init__(self,args)',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Python',
    'What does the keyword yield do?',
    'It returns a generator as the result of a function.',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Python',
    'What is a tuple?',
    'A pair of items.',
    2,
	1
  );


INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Python',
    'What is a dictionary?',
    'A dictionary is an associative array (or hash). The key can be any data type. Dictionaries are enclosed in {} braces and values are accessed thru square [] brackets.',
    2,
	0
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Python',
    'How do you create an object instance of a class?',
    'obj = ClassName(args)',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Python',
    'How do you increment and decrement a varible?',
    'x += 1 , x -= 1',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Python',
    'How do you return an array of values?',
    'You return the values as an ordered set with each value separated by a comma.',
    2,
	0
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Python',
    'How do convert a string to an integer?',
    'int( value )',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Python',
    'How do convert a string to a hex integer?',
    'hex( value )',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Python',
    'How do convert a string to an octal integer?',
    'oct( value )',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Python',
    'How do convert an integer into a string?',
    'str( value )',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Python',
    'How do specify a for loop?',
    'for i in range(start,end):',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Python',
    'What are some tools for checking for syntax and semantic errors?',
    'PyChecker and PyLint',
    2,
	0
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Python',
    'How is memory freed?',
    'Periodically a garbage collector process is automatically run that frees all memory that is no longer being used.',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Python',
    'How do you make a shallow and a deep copy of an object?',
    'copy.copy() and copy.deepcopy().',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Python',
    'How do you remove a file?',
    'os.remove() or os.unlink().',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Python',
    'What is slicing?',
    'Select a range (subset) of items from a list, tuple, string, etc.',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Python',
    'What is a docstring?',
    'A string literal that occurs as the first line in a function, method or class that documents that acts as documentation.',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Python',
    'How do you generate a random number?',
    'random.random() returns a floating point number between 0 and 1.',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Python',
    'What does the function split() do?',
    'This function splits a string into an array of strings, where the parameter is the separator sequence for splitting the string.',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Python',
    'What does the keyword lambda do?',
    'It is used to create anonymous functions, such as used in functional programming.',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Python',
    'What is pickling?',
    'The Pickle module converts a python object into a string representation and writes it to a file.',
    3,
	0
  );

 SELECT COUNT(*) FROM questions WHERE category = 'Python'
