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
  toggle	TINYINT		 NOT NULL DEFAULT 0,

  INDEX(category),
  INDEX(rank)
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE utf8_bin;

DELETE FROM questions WHERE category = 'QA';

#----------------------------------------------------------------------
# QA
#----------------------------------------------------------------------

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'QA',
    'What is black-box testing?',
    'A method for testing software without knowledge of the internal workings.',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'QA',
    'What is white-box testing?',
    'A method for testing software based on knowledge of the internal workings.',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'QA',
    'What is requirements based testing?',
    'A method of testing based on breaking down a specification into atomic actions.',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'QA',
    'What is a test case?',
    'A test for a specific outcome. It typically includes a test identifier and/or reference to a requirement/feature, preconditions/setup, step-by-step instructions and expected outcome.',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'QA',
    'What is typically in a defect report?',
    'The type of test perform, a test identifier (if any), version of item under test, step-by-step instructions to reproduce, the expected output and actual output, configuration (such as hardware/softare version) and environment.',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'QA',
    'What is a smoke test?',
    'A fairly short set of tests to verify if a build is sufficiently stable to justify test resources to be accepted into a full test cycle.',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'QA',
    'What is positive testing?',
    'A set of tests that test for non-failing behavior.',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'QA',
    'What is negative testing?',
    'A set of tests that test for failing behavior.',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'QA',
    'What is code coverage?',
    'A metric where how much of the code was exercised by testing.',
    2,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'QA',
    'What is branch (conditional) coverage?',
    'A metric where how many branches (true/false/case labels) were exercised during testing.',
    2,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'QA',
    'What does a test plan include?',
    'The document includes the scope, approach, and schedule of testing. For scope, it covers the features to be tested, testing tasks, roles/responsibilities, and risk assessment (mitigation).',
    2,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'QA',
    'What are use cases?',
    'A document that describes how the product will be used. Generally broken down into actors, actions and outcomes.',
    2,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'QA',
    'What is a test strategy document?',
    'A document, generally written by a lead of manager, that describes the test activities, schedule, allocation of resources, test resources, final acceptance criteria, and priorities.',
    2,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'QA',
    'What is a stress testing?',
    'To test the software under extreme conditions, such as load, number of users, number and diversity of requests, large amounts of bad/garbage data, and disruptive interference (such as momentary network outages).',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'QA',
    'When is a result status an anomaly?',
    'The result status when a test passes, but an undesirable side-effect is detected.',
    3,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'QA',
    'What is path coverage?',
    'A metric where how many logical code branches were exercised during testing.',
    3,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'QA',
    'What is the typical software test lifecycle?',
    'test planning, test designing/writing, test execution, defect reporting, verifying fixed defects.',
    3,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'QA',
    'What is performance testing?',
    'To time benchmark the product under test, under repeatable and credible measuring system, to verify that the software will continuously perform under loads specified in the specification.',
    3,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'QA',
    'What is load testing?',
    'To iteratively increase the load (volume, number of concurrent activities, etc) to find the point at which the product stops performing according to specification.',
    3,
	1
  );


 SELECT COUNT(*) FROM questions WHERE category = 'QA'
