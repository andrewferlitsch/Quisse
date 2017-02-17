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
  toggle    TINYINT      NOT NULL DEFAULT 1,
  timing	INT			 NOT NULL DEFAULT 0,

  INDEX(category),
  INDEX(rank)
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE utf8_bin;

DELETE FROM questions WHERE category = 'Security';

#----------------------------------------------------------------------
# Security
#----------------------------------------------------------------------

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Security',
    'What is the difference between http:// and https:// ?',
    'http sends data unencrypted. https sends it encrypted using SSL',
    1,
	0
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Security',
    'How does http:// send data?',
    'This HTTP prefix sends data unencrypted.',
    1,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Security',
    'How does https:// send data?',
    'This HTTP prefix sends data encrypted using SSL.',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Security',
    'What is SSL?',
    'Secured Sockets Layer. It is a form of encryption over TCP/IP +networks between clients and servers. The server will have an SSL certificate which contains a public/private key used for the encryption. The SSL certificate is obtained and authenticated by a Certificate Authority (CA).',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Security',
    'What is encryption?',
    'A method to transform the content so that it cannot be read by anyone that does not have the key to decrypt the encrypted content back into its original format.',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Security',
    'What is a Trojan Horse?',
    'Malicious software that is hidden inside what might appear inside something that might otherwise appear legitimate, in an email message, social media, or web site.',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Security',
    'What is difference between Symmetric and Asymmetric encryption?',
    'For symmetric, the same key is used to encrypt and decrypt. For asymmetric, a different key is used to encrypt and decrypt.',
    1,
	0
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Security',
    'What is Phishing?',
    'A social engineering technique of impersonating a website to get someone to enter their password.',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Security',
    'What is a Firewall?',
    'A network device which blocks certain kinds of network traffic, forming a barrier between a trusted and an untrusted network.',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Security',
    'What is Spyware?',
    'Software that is installed on your computer without your knowledge that monitors your activities, and reports back the activities.',
    1,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Security',
    'What is a one-way hash? Name at least one popular method.',
    'A type of encryption where once something is encrypted it cannot be decrypted back to the original form. It is commonly used for encrypting passwords. The one-way hashed version of the password is stored instead of the original password. Popular methods are SHA1 and MD5.',
    2,
	1
  );


INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Security',
    'What is two factor authentication?',
    'An additional authentication device that produces an access token which has a short life (e.g., 60 seconds), which must be used in conjunction with a password.',
    2,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Security',
    'What is one-way hashing?',
    'A method of encryption where the encrypted content cannot be decrypted, but the method will always produce the same encrypted result for the same string. It is commonly used for storing passwords.',
    2,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Security',
    'Name three ways to authenticate someone?',
    'password, token, and biometrics',
    2,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Security',
    'What are privileges (user rights)?',
    'A priviledge allows or restricts access to a resource, independent of the user''s discretionary access control.',
    2,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Security',
    'What is a strong password?',
    'A password that would be computational difficult to guess. It usually contains numbers, capitialization and symbols in addition to letters. It would avoid sequences of common words, and common numerical sequences such as birth years.',
    2,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Security',
    'What is DDos?',
    'A distributed denial of service attack. This occurs when massive continuous requests are made to a server from a distributed network of computers.',
    2,
	0
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Security',
    'What is social engineering?',
    'The use of deception to manipulate individuals into divulging confidential or personal information that may be used for fraudulent purposes.',
    2,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Security',
    'What is a Man in the Middle attack?',
    'The attacker secretly relays and possibly alters the communication between two parties who believe they are directly communicating with each other.',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Security',
    'Describe how Public Key Encryption works.',
    'Public Key Encryption (PKE) is a form of encryption where one key (public) is used to encrypt a message, while a another key (private) is used to decrypt the message. The receiver has a public key which the sender uses to encrypt the message, and the receiver then decrypts it using the private key. As long as the receiver makes their public key available, then anybody can send an encrypted message to the receiver, but only the receiver can decrypt it.',
    3,
	0
  );


INSERT INTO questions (category, question, answer, rank , toggle ) 
  VALUES (
    'Security',
    'What is a Certificate Authority (CA)?',
    'A certificate authority (CA) is an entity that issues digital certificates. A digital certificate certifies the ownership of a public key by the named subject of the certificate.',
    3,
	0
  );


INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Security',
    'What is Cross Site Scripting (XSS)?',
    'XSS attacks occur when malicious code is injected into a website, generally through an input control.',
    3,
	0
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Security',
    'What is Symmetric Encryption?',
    'A encryption method where the same key is used to encrypt and decrypt the content.',
    3,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Security',
    'What is a salted hash?',
    'A random seed is used to salt hashed values that are stored. For example, in a password system, using a salted hash will produce a different stored value than the same password and hash algorithm on another system.',
    3,
	0
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Security',
    'What is Penetration Testing (PenTest)?',
    'Having a trusted security expert attack a system for the purpose of discovering security vulnerabilities.',
    3,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Security',
    'What is an airgapped machine?',
    'An isolated machine holding sensitive information that cannot be accessed by external or wireless networks.',
    3,
	0
  );

 SELECT COUNT(*) FROM questions WHERE category = 'Security'
