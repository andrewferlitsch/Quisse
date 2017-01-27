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
  toggle	TINYINT		 NOT NULL DEFAULT 1,

  INDEX(category),
  INDEX(rank)
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE utf8_bin;

DELETE FROM questions WHERE category = 'C#';

#----------------------------------------------------------------------
# C#
#----------------------------------------------------------------------

INSERT INTO questions (category, question, answer, rank, toggle) 
  VALUES (
    'C#',
    'Name two ways the using statement is used.',
    'As a directive, it is used to create an alias for a namespace or to import types defined in other namespaces. As a statement, it defines a scope at the end of which an object will be disposed.',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle) 
  VALUES (
    'C#',
    'What is the scope of the variable ''i'': for (int i = 0; i<10;i++) {} ?',
    'The scope is within the for loop. It has no scope outside of the for loop.',
    1,
	0
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'C#',
    'What is the program entry point of a C# application?',
    'The class that contains a static Main() definition.',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'C#',
    'What is a namespace?',
    'This defines a set of classes whose class names are unique to the namespace and do not conflict with the same names in another namespace.',
    1,
	0
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'C#',
    'What is the scope of a public member?',
    'This member can be accessed by instances of the class, derived instances of the class, and by objects that reference the class.',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'C#',
    'What is the scope of a protected member?',
    'This member can be accessed by instances of the class, and derived instances of the class only.',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'C#',
    'What is the scope of a private member?',
    'This member can be accessed by instances of the class only.',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'C#',
    'What is an enum type?',
    'This type is an enumeration of named integer values.',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'C#',
    'What is the scope of an internal member?',
    'These members can be accessed by any function/method in the same assembly, but not by other assemblies or modules.',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'C#',
    'What does the keyword params do?',
    'This keyword allows a function/method to take a variable number of arguments.',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'C#',
    'Describe how try, catch and finally work.',
    'These constructs are used for exception handling. If an exception occurs in a try block, then the the code in the corresponding catch block is executed; otherwise it is not. Regardless of whether an exception occurs in a try/catch block, the code in the finally block is always executed. If a return occurs, the code in the finally is executed before the return.',
    2,
	0
  );

INSERT INTO questions (category, question, answer, rank, toggle) 
  VALUES (
    'C#',
    'What is managed code?',
    'The distinction between managed and unmanaged code is only relevant when developing applications that interact with the .NET Framework or other Common Language Runtime (CLR) implementations. Managed code prevents typical mistakes that lead to security holes, handles memory management, type checking and releasing unneeded objects.',
    2,
	0
  );

INSERT INTO questions (category, question, answer, rank, toggle) 
  VALUES (
    'C#',
    'How are objects deleted?',
    'There is no explicit delete call in C#. A reference count is instead maintained. Periodically, a garbage collection task happens in the background which releases all memory with zero reference counts (unused).',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle) 
  VALUES (
    'C#',
    'What are the different ways of passing a parameter to a function or method?',
    'pass by value, pass by reference, and pass by output',
    2,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle) 
  VALUES (
    'C#',
    'What happens when a parameter is passed by reference (i.e., ref int param)?',
    'Any changes made to the paramter in a function/method are also made to the parameter from the calling scope.',
    2,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle) 
  VALUES (
    'C#',
    'What happens when a parameter is passed by output (i.e., out int param)?',
    'When a parameter is passed by this way, its value is not copied into the function/method but any changes made to it in the function/method are made to the parameter from the calling scope.',
    2,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle) 
  VALUES (
    'C#',
    'What is a nullable type?',
    'A scalar data type (e.g. int) that can also be assigned NULL (e.g., int& param).',
    2,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle) 
  VALUES (
    'C#',
    'What are value types?',
    'These are scalar data types (e.g., int, char, short, byte) that contain data.',
    2,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle) 
  VALUES (
    'C#',
    'What are reference types?',
    'These are data types that point to memory locations that contain data (e.g. string, dynamic, object).',
    2,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle) 
  VALUES (
    'C#',
    'What are pointer types?',
    'These are data types hold the address of a memory location (e.g., char * ptr).',
    2,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle) 
  VALUES (
    'C#',
    'What is the base class for all data types?',
    'System.Object',
    2,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle) 
  VALUES (
    'C#',
    'What is boxing and unboxing?',
    'When an object type is converted to a value type and vice-versa.',
    2,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle) 
  VALUES (
    'C#',
    'How do you sort an array of derived from the type Array?',
    'Array.sort( array ).',
    2,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle) 
  VALUES (
    'C#',
    'How do you sort an array of derived from the type Array in descending order?',
    'Array.reverse( array ).',
    2,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle) 
  VALUES (
    'C#',
    'What is the default access for a class?',
    'internal',
    2,
	0
  );
  
INSERT INTO questions (category, question, answer, rank, toggle) 
  VALUES (
    'C#',
    'What is the default access for a class member?',
    'private',
    2,
	0
  );
  
INSERT INTO questions (category, question, answer, rank, toggle) 
  VALUES (
    'C#',
    'What is the difference between a struct and class?',
    'Struct does not support inheritance and does not have a default constructor.',
    2,
	0
  );
  
INSERT INTO questions (category, question, answer, rank, toggle) 
  VALUES (
    'C#',
    'What form of static polymorphism is supported?',
    'function (method) and operator overloading.',
    2,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle) 
  VALUES (
    'C#',
    'What is the syntax of a preprocessor directive?',
    'These directives start with a # sign.',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'C#',
    'What is the method to automatically enforce garbage collection?',
    'System.GC.Collect()',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'C#',
    'What is a dynamic type?',
    'Any value can be assigned to this type, where type checking occurs at run-time instead of compile time.',
    3,
	1
  );
  
 INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'C#',
    'How do you check if an object is of a specific type?',
    'if ( var is classname )',
    3,
	1
  );
  
 INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'C#',
    'What does the is keyword do?',
    'It is used to compare an object of being the same type as a specified type.',
    3,
	1
  );
  
 INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'C#',
    'What does the as keyword do?',
    'This keyword will cast a fail but will not throw an exception at run-time if the cast is invalid.',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'C#',
    'What does a LINQ statement do?',
    'This statement provides a consistent query model across different data stores and formats. All query operations consist of three distinct actions: 1. Obtain the data store, 2. Create the query, 3. Execute the query.',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle) 
  VALUES (
    'C#',
    'What is Reflection?',
    'The ability to read an object''s metadata information (type, parameters, etc). This allows creating and invoking methods on objects not known at compile time.',
    3,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle) 
  VALUES (
    'C#',
    'What form of dynamic polymorphism is supported?',
    'virtual function (method) and abstract classes.',
    3,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle) 
  VALUES (
    'C#',
    'What is a sealed class?',
    'A class that cannot be inherited.',
    3,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle) 
  VALUES (
    'C#',
    'What is a virtual function?',
    'These methods may be overwritten by a derived (inherited) class.',
    3,
	1
  );

