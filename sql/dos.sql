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

  INDEX(category),
  INDEX(rank)
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE utf8_bin;

DELETE FROM questions WHERE category = 'DOS';

#----------------------------------------------------------------------
# DOS
#----------------------------------------------------------------------

INSERT INTO questions (category, question, answer, rank) 
  VALUES (
    'DOS',
    'How do you keep command strings being executed in a script from being echoed to the console?',
    'echo off',
    1
  );

INSERT INTO questions (category, question, answer, rank) 
  VALUES (
    'DOS',
    'How do you redirect output from standard out and standard error to a file?',
    'Append >file or 2>file to the end of a command string.',
    1
  );


INSERT INTO questions (category, question, answer, rank) 
  VALUES (
    'DOS',
    'How do you set a variable?',
    'set var=value',
    1
  );


INSERT INTO questions (category, question, answer, rank) 
  VALUES (
    'DOS',
    'How do you remove a directory and all its contents?',
    'rmdir dirname \s',
    1
  );

INSERT INTO questions (category, question, answer, rank) 
  VALUES (
    'DOS',
    'How do you list all files ending in a specific file suffix?',
    'dir *.suf',
    1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'DOS',
    'How do you create a directory?',
    'md or mkdir',
    1,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'DOS',
    'What is a batch file?',
    'A script that consists of a series of commands to be executed by the command-line interpreter, stored in a plain text file. The filename extension .bat .',
    1,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle) 
  VALUES (
    'DOS',
    'What is sleep mode?',
    'This is a power saving mode that puts your work and settings in memory and draws a small amount of power, and can resume quickly.',
    1,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'DOS',
    'Where can you restore a file that has been recently deleted?',
    'Recycle Bin',
    1,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'DOS',
    'How do you exit the DOS command prompt?',
    'exit',
    1,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'DOS',
    'In a file matching string, what does * match.',
    'It matches any length of characters.',
    1,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'DOS',
    'What command displays the system date.',
    'The command date.',
    1,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle) 
  VALUES (
    'DOS',
    'What is hibernation mode?',
    'This is a power saving mode that puts your open documents and programs on your hard disk and then turns off your computer. This mode uses the least amount of power.',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'DOS',
    'How do you get to the command-line interpreter from Start->Run menu selection?',
    'Enter cmd.',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank) 
  VALUES (
    'DOS',
    'How do you test in an IF statement if the last command exited with a non-zero exit code?',
    'IF %ERRORLEVEL% NEQ 1',
    2
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'DOS',
    'How do you change the current working directory up one level?',
    'cd ..',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'DOS',
    'What is the syntax for a goto and the target?',
    'goto label  and  :label',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'DOS',
    'How do you clear the screen?',
    'cls',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'DOS',
    'What command is used to recover a deleted file immediately after it has been deleted?',
    'undelete',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'DOS',
    'What command lists all deleted files that can be recovered?',
    'undelete /list',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'DOS',
    'What function key will recall the previous command?',
    'F3',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'DOS',
    'What command displays the contents of a file',
    'The type command.',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'DOS',
    'What command displays all the files in a directory',
    'dir /s',
    2,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'DOS',
    'In a file matching string, what does ? match.',
    'It matches any single character.',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank) 
  VALUES (
    'DOS',
    'How do you count the number of occurrences of the word hello in a file?',
    'find "hello" file /c , where the pattern to search for must be in double quotes.',
    3
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'DOS',
    'What does CHKDSK do?',
    'This command checks the hardrive for errors, does diagnostics on the errors and reports status on files and directories.',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'DOS',
    'What batch file is executed when booting?',
    'autoexec.bat',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'DOS',
    'What command is used to copy hidden DOS system files?',
    'sys',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'DOS',
    'FAT stands for?',
    'File Allocation Table',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'DOS',
    'What command displays the label of the volume?',
    'vol',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'DOS',
    'Which file contains all the internal DOS commands?',
    'command.com',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'DOS',
    'Name some valid filesystems.',
    'FAT16, FAT32, NTFS',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'DOS',
    'What are the essential files of DOS to run the DOS interpreter.',
    'command.cmd, io.sys, msdos.sys',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'DOS',
    'What is the maximum command line length when running Windows XP or later',
    '8191 characters',
    3,
	1
  );

 SELECT COUNT(*) FROM questions WHERE category = 'DOS'