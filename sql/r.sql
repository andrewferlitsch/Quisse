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
  timing	INT			 NULL,

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
    'How do you print to the output console?',
    'print(''hello world'')',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'R',
    'How do you print multiple arguments of different types to the output console?',
    'cat(''hello '', ''world'')',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'R',
    'What terminates a statement?',
    'EOL',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'R',
    'What is the syntax for a line comment?',
    '# comment',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'R',
    'How do you execute an R script from the command line?',
    'Rscript program.r',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'R',
    'What are the valid characters for a variable name?',
    'The characters: letters, digits, underscore and dot.',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'R',
    'What are the valid character for the first character of a variable name?',
    'A letter or a dot that is not followed by a digit.',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'R',
    'How do you get a list of all variables in a workspace?',
    'The function ls().',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'R',
    'What are the arithmetic operators?',
    '+ (add), - (substract), * (multiply), / (division), %% (integer remainder), %/% (integer division), ^ (pow).',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'R',
    'What are the relational operators?',
    '== (eq), != (neq), < (lt), > (gt), <= (le), >= (ge).',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'R',
    'What are the conditional statements?',
    'if, if ... else, switch',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'R',
    'What are the looping statements?',
    'for, while, repeat',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'R',
    'What is the syntax for a for statement?',
    'for (i in 1:n)',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'R',
    'How do you construct a string?',
    'Either with double or single quotes are the beginning and end.',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'R',
    'What is meant by R is a dynamically typed language?',
    'The data type of a variable is not declared. The type is dynamically assigned according to the type of R object assigned to it.',
    2,
	0
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
    'What are the variable scope levels?',
    'global, function and block',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'R',
    'How do you specify a default value for a function argument?',
    'fname <- function( arg = value)',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'R',
    'How do your create a list?',
    'list(item1,item2,item3)',
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
    'How do you create a matrix?',
    'matrix( vector, nrow = val, ncol = val, byrow = TRUE|FALSE)',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'R',
    'How do access an element in a matrix?',
    'matrix[row,col]',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'R',
    'How do access a row in a matrix?',
    'matrix[row,]',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'R',
    'How do access a column in a matrix?',
    'matrix[,col]',
    2,
	1
  );


INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'R',
    'How do you create a multi-dimenstional array?',
    'array( vector1, dim = vector2)',
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
    'The read.csv() function.',
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
    'How do you concatenate strings?',
    'The function paste().',
    2,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'R',
    'How do get the length of a string?',
    'The function nchar().',
    2,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'R',
    'How do get the length of a string?',
    'The function nchar().',
    2,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'R',
    'How do uppercase or lowercase a string?',
    'toupper() and tolower().',
    2,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'R',
    'How do get a substring?',
    'substring( string, firstchar, lastchar)',
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
    'How do combine elements into a vector?',
    'c(element1,element2,element3)',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'R',
    'How do you create a factor?',
    'factor( vector)',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'R',
    'How do you get the number of levels of a factor?',
    'The function nlevels(factor)',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'R',
    'How do you define a function?',
    'fname <- function(args) { ... }',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'R',
    'How do you sort elements in a vector?',
    'The function sort().',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'R',
    'How do you remove an element value from a list?',
    'list[index] <- NULL',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'R',
    'What does the byrow parameter mean when creating a matrix?',
    'When TRUE, it means to arrange the input elements by row; otherwise by column.',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'R',
    'What does the dimname parameter mean when creating a matrix?',
    'It is the names assigned to rows and columns in the matrix.',
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

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'R',
    'What is the operator for multiplying a matrix with its transpose?',
    '%*%.',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'R',
    'What does recycling elements mean in an arithmetic operation?',
    'When an arithmetic operation is performed on vectors of unequal size, the elements in the shorter vector are duplicate (recyled) to make it the same length.',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'R',
    'How do you name elements in a list?',
    'names(list) <- c(''name1'',''name2'',''name3''))',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'R',
    'How do you access an element in a named list using the element name?',
    'list$name',
    3,
	1
  );


 SELECT COUNT(*) FROM questions where category = 'R';

