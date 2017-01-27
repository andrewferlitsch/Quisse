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
  rank      SMALLINT(30) NOT NULL DEFAULT 1,
  toggle	tinyint		 NOT NULL DEFAULT 1,

  INDEX(category),
  INDEX(rank)
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE utf8_bin;

DELETE FROM questions WHERE category = 'Java';

#----------------------------------------------------------------------
# Java
#----------------------------------------------------------------------

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Java',
    'What are the builtin scalar data types in Java?',
    'int, short, long, float, double, char, string, byte, boolean',
    1,
	1
  );


INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Java',
    'What is the keyword import is used for?',
    'Used to import a library, where each item in the library is uniquely identified by a namespace.',
    1,
	1
  );


INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Java',
    'What is the program entry point into a Java application?',
    'The class with a ''public static void main( String args[] )'' definition.',
    1,
	1
  );


INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Java',
    'How do you exit from a Java application?',
    'System.exit( exit_code )',
    1,
	1
  );


INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Java',
    'How do you output to standard out and standard error?',
    'System.out.println() and System.err.println()',
    1,
	1
  );


INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Java',
    'How do you specify a class path when compiling a java file?',
    'javac -cp path javafile',
    1,
	1
  );


INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Java',
    'In a String, how do you get the 3rd character?',
    'string.charAt(2)',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Java',
    'What can you assign to the data type Object?',
    'Anything can be assigned to this data type.',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Java',
    'In a class method, how do you assign a member field that has the same name as a parameter?',
    'this.field = field',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Java',
    'What is Java Virtual Machine (JVM)?',
    'A virtual machine which is the run-time environment for compiled java code.',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Java',
    'Are pointers supported?',
    'No, pointers are not supported.',
    1,
	0
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Java',
    'What is the base class for all class objects?',
    'java.lang.Object',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Java',
    'Can an object be casted to an integer?',
    'An object type cannot be casted to a primitive type.',
    1,
	0
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Java',
    'How does garbage collection work?',
    'Java uses lazy garbage collection. There is no explicit method to delete an allocated item or to force garbage collection.',
    2,
	0
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Java',
    'How is polymorphism supported in Java?',
	'This OOP construct is supported as method overloading, where multiple methods can have the same name, but differ by the number of arguments or data types',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Java',
    'How is class inheritance supported in Java?',
    'This OOP construct is supported only in interface definition and not in a class definition.',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Java',
    'What is the difference between an abstract class and interface?',
    'Interface supports polymorphism and classes do not. Data declarations in an interface is static.',
    2,
	0
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Java',
    'What is an abstract method?',
    'A method declared in a base (super) class that must be defined in a derived (sub-class) class.',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Java',
    'What is a package? How is a package created?',
    'A package is a library. Each file in the library contains the line ''package somename;'', where somename is the name of the package.',
    2,
	0
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Java',
    'What is an ArrayList and how do you access the elements?',
    'A derived type for dynamic sizing of an array. It can take any type specified by the template argument <type>. An item is added with the add() method and accessed with the get() method.',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Java',
    'Is the keyword abstract required or optional for abstract methods declared in an interface?',
    'The keyword abstract in an interface is optional.',
    2,
	0
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Java',
    'What is a Vector?',
    'A dynamic array where each operation is synchronized to be thread-safe.',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Java',
    'What is an immutable object?',
    'This is an object that once created, cannot be modified, such as a String or a member defined as final. If one attempts to modify the object, a copy of the object is made.',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Java',
    'Can a static method access non-static members?',
    'No, a static method can only access static (non-instance) variables and methods.',
    2,
	0
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Java',
    'Where can the keyword static be used?',
    'This keyword can be used for variables, methods and code blocks.',
    2,
	0
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Java',
    'What is an instance variable?',
    'A variable member in a class that does not need to be initialized, which would then be automatically initialized to a default value.',
    2,
	1
 ); 
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Java',
    'How do you define a constant integer value?',
    'static final int var = ....',
    2,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Java',
    'Can a source file have more than one class definition?',
    'Yes, but only one class can be public.',
    2,
	0
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Java',
    'What is access (get) time for an ArrayList (Dynamic Arrays)?',
    'The time to get an item in this type of list is O(1) and O(n) to add an item.',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Java',
    'What is access (get) time for an LinkedList?',
    'The time to get an item in this type of list is O(n) and O(1) to add an item.',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Java',
    'What does a default method do in an interface definition?',
    'It is a default implementation of a method if not defined in an implementation.',
    3,
	1
  );


INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Java',
    'What is a lambda expression?',
    'A form of functional programming added in Java 8. These expressions are used primarily to define inline implementation of a functional interface, i.e., an interface with a single method only.',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Java',
    'What does it mean when you get a compiler error message about two methods having the same erasure?',
    'It means that both functions have the same name (overloaded), but the types only differ by a type template (between the <> brackets). public void Foo( List<String> ) and public void Foo( List<Integer> )',
    3,
	0
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Java',
    'What does interning a string mean?',
    'A string that has been stored in the string pool, where there is only one copy of the string. If two variables are assigned to this string, they will point to the same address.',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Java',
    'How do you intern a string object so its stored in the string pool?',
    'myString = myString.intern();',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Java',
    'What is the difference between creating a string using new() or assigning it as a literal?',
    'If the string is created with new() it is allocated in the heap, otherwise it is placed in the string pool.',
    3,
	0
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Java',
    'If you place a return in a try/catch block, will the finally block get executed?',
    'Yes, the finally block gets executed before the return statement in a try/catch block.',
    3,
	0
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Java',
    'If you place a System.exit() in a try/catch block, will the finally block get executed?',
    'No, the finally block does not get executed.',
    3,
	0
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Java',
    'What is a static block?',
    'A code block in a class that is executed when an instance of the class is loaded into the JVM (e.g., static { ... }).',
    3,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Java',
    'What happens when a method is declared final.',
    'This keyword causes the method to not be overridden by a sub-class.',
    3,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Java',
    'The method in a class that will be executed just before garbage collection occurs on the object.',
	'finalize()',
    3,
	1
  );

