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
  rank      TINYINT      NOT NULL DEFAULT 1,
  toggle	TINYINT		 NOT NULL DEFAULT 1,
  timing    INT          NOT NULL DEFAULT 0,

  INDEX(category),
  INDEX(rank)
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE utf8_bin;

DELETE FROM questions WHERE category = 'MySQL DBA';

#----------------------------------------------------------------------
# MySQL DBA
#----------------------------------------------------------------------

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'MySQL DBA',
    'How do you stop mysql?',
    '1. sudo service mysql stop , or 2. /etc/init.d stop, or 3. mysqladmin stop',
    1,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'MySQL DBA',
    'How do you start mysql?',
    'sudo service mysql start',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'MySQL DBA',
    'How do tell what version of mysql is running?',
    '1. mysql>\s , or 2. mysql>status , or 3. mysql --version, or 4. mysqladmin --version',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'MySQL DBA',
    'How do you get the status of the server?',
    'sudo service mysql status',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'MySQL DBA',
    'Users are complaining about their queries taking too long. You look at the server and find there are about 50 active queries running at once. Which one would you look at first?',
    'The longest-running query.',
    1,
	0
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'MySQL DBA',
    'What was the default storage engine in MySQL prior to MySQL 5.5?',
    'The storage type was MyISAM',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'MySQL DBA',
    'What was the default storage engine from MySQL 5.5 and later?',
    'The storate type is InnoDB.',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'MySQL DBA',
    'What do you put before a SELECT clause to get MySQL to show you what indexes MySQL will consider using?',
    'EXPLAIN',
    1,
	1
  );  
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'MySQL DBA',
    'What is LENGTH?',
    'The length in the number of bytes.',
    1,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'MySQL DBA',
    'What is CHAR_LENGTH?',
    'The length in the number of characters.',
    1,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'MySQL DBA',
    'How do you login to the server from the UNIX command line?',
    'mysql -h hostname -u username -p password .',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'MySQL DBA',
    'Where is mysql TMP located?',
    'mysql>show global variables like ''tmpdir'';',
    2,
	0
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'MySQL DBA',
    'Where does the my.cnf file live?',
    '#locate my.cnf',
    2,
	1
  );


INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'MySQL DBA',
    'Where is the mysql error.log located?',
    'mysql>show global variables like ''log_error'';',
    2,
	0
  );


INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'MySQL DBA',
    'What command will show an administrator what the most recent deadlock was in InnoDB?',
    'SHOW ENGINE INNODB STATUS',
    2,
	1
  );


INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'MySQL DBA',
    'You''re setting up replication between a master and a slave. What command would you use to tell the slave what master to connect to?',
    'CHANGE MASTER TO ...',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'MySQL DBA',
    'What command will show you the current state of replication on a slave?',
    'SHOW SLAVE STATUS',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'MySQL DBA',
    'What command will show you the current state of the master?',
    'SHOW MASTER STATUS',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'MySQL DBA',
    'What does ACID stand for?',
    'atomicity, consistency, isolation, durability',
    2,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'MySQL DBA',
    'What command will show you the current binary log position on a master server?',
    'SHOW MASTER STATUS',
    2,
	0
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'MySQL DBA',
    'What is the trade off for adding more indexes?',
    'The more indexes, the faster lookups are likely to be, but it will increase the amount of disk and memory space used.',
    2,
	0
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'MySQL DBA',
    'What is a Heap Table?',
    'An in-memory high speed storage on a temporary basis. They cannot contain BLOB or TEXT, or AUTO INCREMENT and support a limited set of comparision operators.',
    2,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'MySQL DBA',
    'What is the default part for MySQL Server?',
    'Port 3306.',
    2,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'MySQL DBA',
    'How do you set the maximum size of the Heap table?',
    'max_heap_table_size',
    2,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'MySQL DBA',
    'How do you convert from a UNIX Timestamp to a MySQL Timestamp?',
    'FROM_UNIXTIME',
    2,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'MySQL DBA',
    'How do you convert from a MySQL Timestamp to a UNIX Timestamp?',
    'UNIX_TIMESTAMP',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'MySQL DBA',
    'How do you kill a query?',
    'mysql>show full processlist\G kill id;',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'MySQL DBA',
    'How do you check replication status?',
    '1. mysql>show slave status\G , or 2. mysql>show master status;',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'MySQL DBA',
    'What is the default transaction isolation level for MySQL 5.5 servers if its left unconfigured in my.cnf?',
    'REPEATABLE-READ',
    3,
	0
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'MySQL DBA',
    'How do you take over a MySQL server when you don''t have the credentials?',
    '1. stop the service, 2. restart with skip grand, 3. connect as root, and 4. set a new password',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'MySQL DBA',
    'Name some of the drivers (connectors) in MySQL?',
    'PHP Driver, C Driver, Python Driver, Perl Driver, Ruby Driver, ODBC Driver, JBDC Driver',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'MySQL DBA',
    'What does myisamchk do?',
    'This command compresses the MyISAM tables.',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'MySQL DBA',
    'What is the difference between MyISAM Static and MyISAM Dynamic tables?',
    'In MyISAM Static tables all the fields are fixed width. In MyISAM Dynamic tables, the fields maybe variable length such as TEXT and BLOB.',
    3,
	0
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'MySQL DBA',
    'What is a federated table?',
    'A table that points to a table in another MySQL database.',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'MySQL DBA',
    'Where and how are MyISAM tables stored?',
    'They are stored on disk. The table definition is stored in a file ending in .frm, the data in a file ending in .myd, and the indexes in a file ending in .myi.',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'MySQL DBA',
    'What are the table storage types?',
    'MyISAM, InnoDB, Heap, Merge and ISAM.',
    3,
	1
  );

 SELECT COUNT(*) FROM questions WHERE category = 'MySQL DBA'

