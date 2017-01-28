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

DELETE FROM questions WHERE category = 'C++';

#----------------------------------------------------------------------
# C++
#----------------------------------------------------------------------

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'C++',
    'What is method overloading?',
	'Two methods can have the same method name if they differ either by number or data types of arguments.',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'C++',
    'What is the difference between a struct and class?',
    'The fields and methods in this type default to public, while in a class they default to private.',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle) 
  VALUES (
    'C++',
    'Where in a function can a variable be declared?',
    'A variable can be declared anywhere a statement would be valid, and can be declared in the initializer part of a for loop.',
    1,
	0
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'C++#',
    'What is the scope of a public member?',
    'This member can be accessed by instances of the class, derived instances of the class, and by objects that reference the class.',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'C++',
    'What is the scope of a protected member?',
    'This member can be accessed by instances of the class, and derived instances of the class only.',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'C++',
    'What is the scope of a private member?',
    'This member can be accessed by instances of the class only.',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'C++',
    'What are the storage types?',
    'auto, register, static, extern',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'C++',
    'How is an object created?',
    'C obj = new obj();',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'C++',
    'How is an object deleted?',
    'delete obj;',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'C++',
    'How do you output to standard out and standard error?',
    'cout << string and cerr << string',
    1,
	1
  );


INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'C++',
    'What are the two ways to initialize a scalar data type (e.g., integer)?',
    'int var = 1  or int var(1)',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'C++',
    'What are the four OOP constructs that C++ introduced?',
    'abstraction, data encapsulation, inheritance, polymorphism.',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'C++',
    'What does the storate type volatile do?',
    'This storage type indicates that the variable maybe accessed by multiple threads, and tells the compiler to disable any optimizations involving the variable.',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'C++',
    'What is a virtual method?',
    'A method in a base class that may be overridden in a derived class.',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'C++',
    'What is operator overloading?',
    'Operators like +, = or == are treated as polymorphic functions and as such have different behaviors depending on the types of its arguments. ex. Box operator+(const Box& b)',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'C++',
    'What is STL?',
    'The Standard Template Library, one of the major improvements over C.',
    2,
	0
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'C++',
    'What is a copy constructor?',
    'A constructor that makes a copy of an instance of the class ( e.g, class C { void C(C &obj){...} } )',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'C++',
    'What is a shallow copy?',
    'In this type of copy, a copy is made of all fields, including pointers.',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'C++',
    'What is a deep copy?',
    'In this type of copy, the contents pointed to by pointers are copied instead of the pointer value.',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'C++',
    'What is a static member?',
    'This type of member can be accessed by the class name (e.g. ClassName.member).',
    2,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'C++',
    'What is an inline function?',
    'A function with the keyword inline prepended to it. This tells the compiler to inline the code instead of creating a function.',
    2,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'C++',
    'What is a wchar_t type?',
    'while char holds a single byte character, this type is multi-byte for large character sets (e.g., UNICODE).',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'C++',
    'What are all the storage class types?',
    'auto, extern, register, static, mutable',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'C++',
    'What is Perfect Forwarding?',
    'First available in C++11, this is an optimization in which the compiler can detect that a copy from object A to B will be followed by a deletion or disuse of A, and so the compiler can simply do a ''value move'' from A to B, rather than a [more expensive] ''copy + delete''.',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'C++',
    'What is a pure virtual method?',
    'A method in a base class that has no implementation and must be implemented in a derived class.',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'C++',
    'What is a virtual destructor?',
    'When the keyword virtual is used on a destructor, both the base and derived class destructors are called.',
    3,
	0
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'C++',
    'What is a reference variable?',
    'This type of variable is an alias for another variable. If you modify it, the original variable is modified as well (e.g., int& a = b;)',
    3,
	1
  );