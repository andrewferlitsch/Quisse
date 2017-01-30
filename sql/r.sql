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
  toggle    TINYINT 	 NOT NULL DEFAULT 1,

  INDEX(category),
  INDEX(rank)
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE utf8_bin;

DELETE FROM questions WHERE category = 'R';

#----------------------------------------------------------------------
# R
#----------------------------------------------------------------------

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'R',
    'What is R?',
    'A statistical programming language.',
    1,
	1
  );


INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'R',
    'What are the three assignment operators in R?',
    'equal, leftward (<-), and rightward (->)',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'R',
    'What is a data frame?',
    'These are tabular data objects. Unlike a matrix, each column can contain different modes of data. The first column can be numeric while the second column can be character and third column can be logical. It is a list of vectors of equal length.',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'R',
    'How do you install a package?',
    'install.packages( "package-name" )',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'R',
    'What function is used to create a time series?',
    'The function ts().',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'R',
    'How do you convert a list to a vector?',
    'The function unlist().',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'R',
    'How do you delete an element in a list?',
    'You can only delete the element at the end of a list.',
    2,
	0
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'R',
    'What are the common builtin types of R-objects?',
    'vectors, arrays, matrices, lists, factors, data frames',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'R',
    'What is a matrix?',
    'A two-dimensional array consisting of rows and columns.',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'R',
    'What are the six data types of a vector?',
    'logical, numeric, integer, complex, character, raw',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'R',
    'How do you create a data frame?',
    'These are created using the data.frame() function.',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'R',
    'How do you input a CSV file?',
    'The read.csv function.',
    2,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'R',
    'How do you get the current working directory?',
    'The function getwd().',
    2,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'R',
    'How do you set the current working directory?',
    'The function setwd().',
    2,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'R',
    'How do access an element in a matrix?',
    'To access an elemen, you specify the row and column (e.g, Matrix[row,colum] ).',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'R',
    'How do I find all variables starting with the pattern "ab"?',
    'ls(pattern = "ab")',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'R',
    'How do you check if a value is in a vector?',
    'value %in% vector',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'R',
    'How do you skip the remainder of a loop iteration?',
    'The command next.',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'R',
    'What object is used to store and process categorical data?',
    'Factor object',
    3,
	0
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'R',
    'What function is used to build a logistic regression?',
    'The function glm()',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'R',
    'What function is used to build a histogram?',
    'The function hist()',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'R',
    'How do you remove a vector from the workspace?',
    'You can remove a vector with rm(v), where v is the vector.',
    3,
	0
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'R',
    'What is lazy function evaluation?',
    'If an argument to a function is not used in the body of a function, it is not evaluated (ignored).',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'R',
    'What does the sample function do?',
    'It chooses a random sample of specified size from a dataset.',
    3,
	1
  );


