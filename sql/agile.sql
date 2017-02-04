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

DELETE FROM questions WHERE category = 'Agile';

#----------------------------------------------------------------------
# Agile
#----------------------------------------------------------------------

INSERT INTO questions (category, question, answer, rank) 
  VALUES (
    'Agile',
    'What is Agile Product Management?',
    'An iterative, incremental method of managing the design and build activities of engineering, information technology and other business areas that aim to provide new product or service development in a highly flexible and interactive manner',
    1
  );


INSERT INTO questions (category, question, answer, rank) 
  VALUES (
    'Agile',
    'What is the product owner''s role?',
    'This person is the product stakeholder. Responsibilities typically include decides which stories from the product backlog go into a sprint.',
    1
  );


INSERT INTO questions (category, question, answer, rank) 
  VALUES (
    'Agile',
    'What are story points?',
    'For each task in a sprint, it is the estimate of the amount of time to complete the task. Typically 1 story point is 1/2 day, 2 story points is 1 day, 3 story points is 2 days, 5 story points is a 5 days.',
    1
  );

INSERT INTO questions (category, question, answer, rank) 
  VALUES (
    'Agile',
    'What does a scrum master do?',
    'This person manages the sprint process, which includes sprint planning, scrums, and sprint reviews.',
    1
  );
  
INSERT INTO questions (category, question, answer, rank) 
  VALUES (
    'Agile',
    'What is a Product Backlog?',
    'A prioritized features list, containing short descriptions of all functionality desired in the product.',
    1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Agile',
    'What is Scrum?',
    'A lightweight version of the Agile methodology using Sprints.',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Agile',
    'What is a User Story?',
    'A short, simple descriptions of a feature told from the perspective of the person who desires the new capability, usually a user or customer of the system.',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Agile',
    'What is re-factoring?',
    'Rewriting code without changing its functionality to improve a performance metric, such as memory size, speed, responsiveness, code size, maintainability, etc.',
    2,
	1
  );
  
INSERT INTO questions (category, question, answer, rank) 
  VALUES (
    'Agile',
    'What is an Epic?',
    'A large user story that can be broken into smaller stories and typically spans several sprints.',
    2
  );
  
INSERT INTO questions (category, question, answer, rank) 
  VALUES (
    'Agile',
    'What is the technical debt?',
    'Any task, or portion of it, not completed in a sprint, or code that will need to be refactored or redesigned, or not fully tested.',
    2
  );


INSERT INTO questions (category, question, answer, rank) 
  VALUES (
    'Agile',
    'What does a sprint consist of?',
    'A repeating process consisting of a sprint planning session, execution of tasks, followed by a sprint review and sometimes a sprint retrospective.',
    2
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Agile',
    'What is a standup scrum meeting?',
    'To give a quick round of status and expected tasks for the day by each member. It is called a standup to emphasize keeping the sprint as short as possible.',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Agile',
    'What is a burn-up chart?',
    'A time-based graph that shows over successive periods of time (e.g., sprints) that amount of work completed, such as in story points.',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Agile',
    'What is a burn-down chart?',
    'A time-based graph that shows over successive periods of time (e.g., sprints) the amount of remaining work to complete, such as in story points, ir time estimates.',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Agile',
    'What is a zero sprint?',
    'A preparatory sprint that proceeds sprints for the development of the product.',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Agile',
    'Describe Kanban board?',
    'A Kanban board is a workflow process where tasks are reviewed and moved from various progressive states of completion. These typically include: unassigned, assigned, in progress, in test, in review, accepted (or completed).',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Agile',
    'What is Extreme Programming?',
    'A development process consisting of frequent releases in short development cycles. Other elements include: programming in pairs or doing extensive code review, unit testing of all code, avoiding programming of features until they are actually needed.',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Agile',
    'What is Test Driven Development?',
    'A software development process that relies on the repetition of a very short development cycle: requirements are turned into very specific test cases, then the software is improved to pass the new tests, only',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Agile',
    'What is velocity?',
    'A predictive measurement of the rate that the remaining work will be completed, based on the rate of completion of work (e.g., user stories) in the last sprint. It is used for scheduling purposes.',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Agile',
    'What is Pair Programming?',
    'A two person development team. One person has the role of coder, and the other as reviewer, unit testing and acceptance for checkin. The users typically alternate roles on a periodic schedule.',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Agile',
    'What is Iterative Development?',
    'Software is developed in cycles, where new or modified requirements can be injected between cycles.',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Agile',
    'What is Incremental Development?',
    'Software is developed in cycles, where new or modified requirements cannot be injected between cycles.',
    3,
	1
  );
