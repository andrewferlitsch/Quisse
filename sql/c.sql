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
  toggle	TINYINT		 NOT NULL DEFAULT 1,

  INDEX(category),
  INDEX(rank)
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE utf8_bin;

DELETE FROM questions WHERE category = 'C';

#----------------------------------------------------------------------
# C
#----------------------------------------------------------------------

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'C',
    'What is a #include?',
    'Includes a header file definitions into the C source file.',
    1,
	1
  );


INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'C',
    'How do you allocate 10 bytes of memory and then free it?',
    'char *p = malloc(10) and free(p)',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'C',
    'What is an unsigned int?',
    'An integer data type of only positive numbers starting at zero.',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'C',
    'What is a signed int?',
    'An integer data type of both positive and negative numbers in a range where half in the positive range and half in the negative range.',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'C',
    'What is the program entry point into a C application?',
    'The function main()',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'C',
    'Where can the keyword break be used?',
    'This keyword can only be used in case/default statement within a switch statement or in a looping statement',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'C',
    'Where can the keyword continue be used?',
    'This keyword can only be used in a looping statement',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'C',
    'What is a null pointer?',
    'A pointer pointing to nothing, e.g., char *p = NULL;',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'C',
    'How do you conditionally compile code?',
    '#ifdef .. #endif',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'C',
    'How do you include a header file?',
    '#include <name> or #include "name"',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'C',
    'What is the null character?',
    'backslash 0',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'C',
    'How do you get the length of a string?',
    'strlen()',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'C',
    'How do you indicate the end of a string?',
    'The null character backslash 0 indicates the end of a string.',
    1,
	0
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'C',
    'What are the libraries to uppercase and lowercase a string?',
    'toupper() and tolower()',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'C',
    'What is the syntax for a comment?',
    '/* .. */',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'C',
    'Explain an example of reading/writing a file.',
    'A file can be opened with a file descriptor (open) or file pointer (fopen), with the latter doing buffered I/O. A file is then read/written using read()/write() for a file descriptor, and fread()/fwrite() for a file pointer.',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'C',
    'What is the heap storage?',
    'A section of memory where dynamic memory is allocated.',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'C',
    'How do you indicate that a function does not return a value?',
    'void func() { ... }',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'C',
    'What library call is used to generate a random number?',
    'rand()',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'C',
    'What is a logical block of code?',
    'A block of code enclosed within an opening { and closing }.',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'C',
    'What is a long long integer?',
    'It typically is 128 bit integer, but must be at least 64 bits.',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank) 
  VALUES (
    'C',
    'What is a typedef?',
    'A name that is used as an alias for a type definition. Ex. typedef int Length;',
    2
  );

INSERT INTO questions (category, question, answer, rank) 
  VALUES (
    'C',
    'What is calloc()?',
    'A memory allocation routine that allocates a specified number of fixed size memory blocks, which need not be continous, and initializes them to zero.',
    2
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'C',
    'What does the file open mode w+ do?',
    'Opens a file both for reading and writing. If a file is not existing it creates one, else if the file is existing it will be over written.',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'C',
    'How do you convert a string representation of a number to a number?',
    'atof() for float, and atoi() and atol() for integer and long integers, respectively.',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'C',
    'What does the keyword volatile mean?',
    'Tells the compiler to disable optimizations for the variable. This is typically used when that the variable could be modified asynchronously, such as by a hardware interface.',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'C',
    'What does a setjmp/longjmp do?',
    'A setjmp() call saves the location of the current stack frame. When a longjmp() is issued, a jump is made to the saved stack frame location and continues processing without unwinding the stack.',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'C',
    'What is the bit operator XOR (^) do?',
    'If both the corresponding bits are same it gives 0 else 1.',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'C',
    'What is call by value and call by reference?',
    'In call by reference, the value of the variable is passed as a parameter to a function. In call by reference, the address of the variable is passed as a parameter to a function.',
    3,
	0
  );

