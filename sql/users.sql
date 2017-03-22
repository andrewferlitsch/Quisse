
CREATE TABLE IF NOT EXISTS questions
(
  id        INT          NOT NULL PRIMARY KEY auto_increment,
  username  VARCHAR(16)  NOT NULL,
  password	VARCHAR(32)	 NOT NULL,
  email		VARCHAR(64)	 NOT NULL,
  created	DATETIME	 NOT NULL DEFAULT SYSDATE(),
  lastlogin	DATETIME	 NULL,
 
  INDEX(username)
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE utf8_bin;
