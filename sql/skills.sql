
CREATE TABLE IF NOT EXISTS skills
(
  id        INT          NOT NULL PRIMARY KEY auto_increment,
  userid	INT			 NOT NULL,
  skill     VARCHAR(16)  NOT NULL,
  type	    VARCHAR(8)	 NOT NULL,
  percent	TINYINT		 NULL,
  time  	INT	 		 NULL,
  date		DATETIME	 NULL,
 

  FOREIGN KEY (userid) REFERENCES users(id)
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE utf8_bin;
