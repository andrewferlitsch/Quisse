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

  INDEX(category),
  INDEX(rank)
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE utf8_bin;

DELETE FROM questions WHERE category = 'Network';

#----------------------------------------------------------------------
# Network
#----------------------------------------------------------------------

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Network',
    'What is DNS (Domain Name Server)? How does it work?',
    'This Server (or service) takes a domain name and resolves it into an IP addresses via a lookup directory.',
    1,
	1
  );


INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Network',
    'Describe the difference between UDP and TCP.',
    'UDP (User Datagram Protocol) and TCP (Transmission Control Protocol) both send data packets over a network. UDP does not guarantee delivery. TCP does. When the receiver receives a packet, it sends back an acknowledgement to the sender.',
    1,
	0
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Network',
    'What is a Local Area Network (LAN)?',
    'A set of connected computers located in the same physical space.',
    1,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Network',
    'What is a communication link?',
    'A connection between two devices.',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Network',
    'In IPv4, what is a C-subnet? What are the max number of addresses?',
    'This subnet is the address range of the lower 8 bits of an IPv4 address range. It can hold 256 addresses.',
    2,
	1
  );


INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Network',
    'What is WireShark?',
    'An application that is used by developers to view packets on the network.',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Network',
    'What is IPv6?',
    'This Internet addressing standard replaces the IPv4 Internet Address space. IPv4 was limited to 4 billion addresses (32-bits). This standard uses a 128-bit address, theoretically allowing 2^128, or approximately 3.4×1038 addresses.',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Network',
    'What does it mean to say that UDP is an ''unreliable'' protocol?',
    'It means that the protocol does not guarantee delivery nor offer an error when a delivery fails; this logic, if needed, must be added to an application-layer protocol.',
    2,
	0
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Network',
    'What is a node?',
    'A point (e.g. device, computer) where a connection takes occurs.',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Network',
    'What is a Virtual Private Network (VPN)?',
    'A secured tunnel through one network (e.g., Internet) into another (e.g., LAN).',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Network',
    'What is a Wide Area Network (WAN)?',
    'An interconnection of networks, computers and devices over a geographically dispersed area.',
    2,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Network',
    'What is a router?',
    'A device that connects two or more network segments together. It uses routing tables to transfer data from one network segment to another.',
    2,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Network',
    'What is a Network Interface Card (NIC)?',
    'Either a physical or logical component in a computer/device that connects the computer/device to the network via a MAC address, which is unique to the NIC.',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Network',
    'What is the difference between unicast, multicast and broadcast?',
    'Unicast sends a message to a single IP address. Multi-cast sends a message to all IP addresses registered for the multicast on a subnet. Broadcast sends a message to all IP addresses on the subnet.',
    3,
	0
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Network',
    'What is unicast?',
    'Sending a message to a single IP address.',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Network',
    'What is multicast?',
    'Sends a message to all IP addresses registered for the multicast on a subnet.',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Network',
    'What is broadcast?',
    'Sends a message to all IP addresses on the subnet.',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Network',
    'Explain the FTP protocol.',
    'The File Transfer Protocol (FTP) is used to transfer files between a client and server (or peers) over TCP/IP. The client opens a connection to send commands. The server (or client) opens a second data connection to transfer files.',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Network',
    'What are the 7 network OSI layers.',
    'Physical, Data Link, Network, Transport, Session, Presentation, and Application layer.',
    3,
	1
  );

  INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Network',
    'What is a Network Address Translation (NAT)?',
    'A protocol that allows multiple computers on a LAN to share the same connection to the Internet.',
    3,
	1
  );

  INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Network',
    'What is a Routing Information Protocol (RIP)?',
    'A protocol used by routers to aid in routing data, where routing tables are broadcasted to other routers in the network, and network distances are calculating in hops.',
    3,
	1
  );

