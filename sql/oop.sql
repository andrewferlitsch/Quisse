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

DELETE FROM questions WHERE category = 'OOP Design';

#----------------------------------------------------------------------
# OOP Design
#----------------------------------------------------------------------

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'OOP Design',
    'What is data encapsulation?',
    'This is where the data in a class is hidden from external objects. The data is only accessible by the class methods.',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'OOP Design',
    'Describe how public, protected and private scope work.',
    'public - data or method is accessible to all external objects. protected - data or method is accessible only by the class and objects that inherit the class. private - data or method is accessible only by the class.',
    1,
	0
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'OOP Design',
    'What is a base (super) class?.',
    'A class that does not inherit other classes.',
    1,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'OOP Design',
    'What is a derived (sub) class?.',
    'A class that inherits another class. It may add additional methods, implement non-implemented methods or override methods in the other class.',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'OOP Design',
    'What is an abstract class?',
    'A class where one or more declared methods require an implementation. A derived (subclass, extended) that inherits the abstract class must implement all the methods that do not have an implementation. An abstract class cannot be instantiated.',
    2,
	1
  );


INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'OOP Design',
    'What is polymorphism? Give an example.',
    'Multiple inheritance of classes. For example, an OOP design for a vehicle might have a base class for wheels, and a base class for engine. The wheels base class may have derived classes for truck-wheels and passenger-wheels, and the engine base class may have derived classes for gas and diesel engine. A truck object might inherit the diesel engine and truck wheels derived classes, while a passenger vehicle might inherit the gas engine and passenger wheel derived classes.',
    2,
	1
  );


INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'OOP Design',
    'What is a Singleton design pattern?',
    'A design pattern where only one instance of an object (class) can be instantiated.',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'OOP Design',
    'What does a static field (variable) in a class do?',
    'There is only one instance of the field (variable) across all instances of the class.',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'OOP Design',
    'What is the difference between an array and collection?',
    'An array is fixed size. A collection can dynamically change its size.',
    2,
	0
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'OOP Design',
    'What is a Singleton design pattern?',
    'This design pattern handles the creation of a single only instance of a class. It prevents a program from directly instantiating instances of the class.',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'OOP Design',
    'What are the three types of design patterns defined by the Gang of Four (GOF)?',
    'Creational, Structural and Behavioral.',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'OOP Design',
    'What is a Factory design pattern?',
    'This design pattern defines an interface for creating objects, but lets subclasses decide which classes to instantiate.',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'OOP Design',
    'What is an Iterator design pattern?',
    'Provide a way to access the elements of an aggregate object sequentially without exposing its underlying representation.',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'OOP Design',
    'What is a prototype design pattern?',
    'This performance minded pattern creates duplicates (clone) of an object, instead of instantiating an object from scratch.',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'OOP Design',
    'What is a decorator design pattern?',
    'This design pattern adds functionality to a class without altering its structure.',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'OOP Design',
    'What is a null object design pattern?',
    'This design pattern returns a null object instance in place of a null value.',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'OOP Design',
    'What is a model view controller design pattern?',
    'This design pattern separates the data, user interface and program logic.',
    3,
	1
  );

 SELECT COUNT(*) FROM questions WHERE category = 'OOP'