
CREATE TABLE IF NOT EXISTS users
(
  id        INT          NOT NULL PRIMARY KEY auto_increment,
  username  VARCHAR(16)  NOT NULL,
  password	VARCHAR(32)	 NOT NULL,
  email		VARCHAR(64)	 NOT NULL UNIQUE,
  created	DATETIME	 NOT NULL,
  lastlogin	DATETIME	 NULL,
  active	TINYINT		 NOT NULL DEFAULT 1,
 
  INDEX(username)
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE utf8_bin;
