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

  INDEX(category),
  INDEX(rank)
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE utf8_bin;

DELETE FROM questions WHERE category = 'Algorithms';

#----------------------------------------------------------------------
# Algorithms
#----------------------------------------------------------------------

INSERT INTO questions (category, question, answer, rank, toggle) 
  VALUES (
    'Algorithms',
    'What is an Algorithm?',
    'A step by step procedure, which defines a set of instructions to be executed in certain order to get the desired output.',
    1,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle) 
  VALUES (
    'Algorithms',
    'What is a prime number?',
    'A number only divisible by itself and one.',
    1,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle) 
  VALUES (
    'Algorithms',
    'What arthihmetic operator is used in a prime number algorithm to test if a number is divisible by another number?',
    'The module operator is used in this algorithm to see if the number can be divisible by another number smaller than itself, by checking for a remainder in an integer division.',
    1,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle) 
  VALUES (
    'Algorithms',
    'A Big O notation for time complexity is constant?',
    'O(1)',
    1,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle) 
  VALUES (
    'Algorithms',
    'What data structure implements a First In First Out (FIFO)?',
    'Queue',
    1,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle) 
  VALUES (
    'Algorithms',
    'What data structure implements a Last In First Out (LIFO)?',
    'Stack',
    1,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle) 
  VALUES (
    'Algorithms',
    'What data structure typically has a Push() and Pop() method?',
    'A Stack is implemented using these methods (functions).',
    1,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle) 
  VALUES (
    'Algorithms',
    'What data structure typically has a Enqueue() and Dequeue() method?',
    'A Queue is implemented using these methods (functions).',
    1,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle) 
  VALUES (
    'Algorithms',
    'What is a divide and conquer algorithm?',
    'An algorithm that progressively divides a problem into smaller parts, solving the smaller parts, and merging the solutions together back into larger parts.',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle) 
  VALUES (
    'Algorithms',
    'What is Hashing?',
    'A method to convert (map) a range of key values into a range of indexes of an array.',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle) 
  VALUES (
    'Algorithms',
    'What is Linear Searching?',
    'A method of search that attempts to find an item in a list (array) by comparing each element sequentially.',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Algorithms',
    'What is a Recursive Function?',
    'A function in which it calls itself, directly or calls a function that in turn calls it.',
    2,
	1
  );


INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Algorithms',
    'What is a Linked-list?',
    'A list of data-items connected with links i.e. pointers or references, which can be used to form queues, stacks and circular lists.',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Algorithms',
    'What is a Stack?',
    'A stack is used to store and retrieve values in Last In First Out (LIFO) method.',
    2,
	1
  );


INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Algorithms',
    'What is a Graph?',
    'A representation of a set of objects where some pairs of objects are connected by links. The interconnected objects are represented by points termed as vertices, and the links that connect the vertices are called edges.',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Algorithms',
    'What is a k-ary Tree?',
    'A tree where each node has at most k children.',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Algorithms',
    'What is a Binary Tree?',
    'A type of tree where each node can have at most two children (branches).',
    2,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Algorithms',
    'What is a Binary Search Tree (BST)?',
    'A binary tree where the value of the left node is always less than or equal to the parent and the value of the root node is always greather than the parent.',
    2,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Algorithms',
    'What is a Tree Traversal?',
    'A process of visiting all the nodes of a tree.',
    2,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Algorithms',
    'This algorithm is known as the first algorithm and disoovered by an Ancient Greek mathematician in 300 BC?',
    'Euclid''s Algorithm for Greatest Common Denominator.',
    2,
	1
  ); 
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Algorithms',
    'What is a dynamic array?',
    'An array that can grow at run-time without copying elements when it is enlarged. Typically implemented using an underlying linked structure.',
    2,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle) 
  VALUES (
    'Algorithms',
    'A Big O notation for time complexity is proportional to the number of elements?',
    'O(N)',
    2,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle) 
  VALUES (
    'Algorithms',
    'What is the maximum depth of a binary tree?',
    'The leaf node that is furthest from the root.',
    2,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle) 
  VALUES (
    'Algorithms',
    'What is the minimum depth of a tree?',
    'The leaf node that is closest to the root.',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Algorithms',
    'What is a Fibonacci Series?',
    'A sequence in which it generates subsequent number by adding two previous numbers. For example − 0 1 1 2 3 5 8 13.',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Algorithms',
    'How do you find the middle of a linked list in a single pass?',
    'Use a second pointer that you advance by one link every two times the first pointer is advanced; thus moving at half the rate.',
    2,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Algorithms',
    'What is an In-Order Tree Traversal?',
    'A depth first search process of visiting all the nodes of a tree, by first visiting the left node, the root, and then the right node, and applying the process recursively at the left and right nodes.',
    3,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Algorithms',
    'What is an Pre-Order Tree Traversal?',
    'A depth first search process of visiting all the nodes of a tree, by first visiting the root, then the left node, and then the right node, and applying the process recursively at the left and right nodes.',
    3,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Algorithms',
    'What is an Post-Order Tree Traversal?',
    'A depth first search process of visiting all the nodes of a tree, by first visiting the left node, then the right node, and then the root, and applying the process recursively at the left and right nodes.',
    3,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Algorithms',
    'What is an Level-Order Tree Traversal?',
    'A breadth first search process of visiting all the nodes of a tree, by visiting each sibling node one level at a time, starting with the root node.',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Algorithms',
    'What is a Directed Graph?',
    'A graph that can only be traversed in one direction.',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Algorithms',
    'What is an Undirected Graph?',
    'A graph where an edge can be traversed in either direction.',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Algorithms',
    'What is an AVL Tree?',
    'A self-balancing binary search tree, where the height of any subtrees of a node difference only by at most one level.',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Algorithms',
    'What is a depth-first search (DFS) of a binary tree?',
    'A recursive function where at each node you recursively process the left tree and then the right tree.',
    3,
	1
  );


INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Algorithms',
    'What is an adjacency list?',
    'A collection of unordered lists used to represent a finite graph. Each list describes the set of neighbors of a vertex in the graph.',
    3,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Algorithms',
    'What is Binary Search?',
    'A search method that works only on sorted lists or arrays. This search selects the middle which splits the entire list into two parts. The method is repeated on the parts until the item is found.',
    3,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Algorithms',
    'What is time and space complexity for a breadth first (level) search (BFS)?',
    'The time and space complexity for this search methid is O(b**m).',
    3,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Algorithms',
    'What is time and space complexity for a depth first search (DFS)?',
    'The time and space complexity for this search methid is O(b**m) and O(bm).',
    3,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Algorithms',
    'What is depth limited search (DLS)?',
    'A combination of depth and breath first search, where you start with a depth first but when a depth limit is reached, it switches to breadth first.',
    3,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Algorithms',
    'What is uniform cost search (UCS)?',
    'A modified form of breath first search, where the next node picked is based on a weighted cost of the node.',
    3,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Algorithms',
    'How do you factor an exponent equation to reduce the number of multiplications in half?',
    'For even exponents, x**e = (x**2)**(e/2) and odd exponents, x**e = x * ( (x**2)**( (e-1)/2 ).',
    3,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'Algorithms',
    'How can you find if a linked list has a loop?',
    'Use two pointers. Advance the first pointer one link at a time, and advance the second pointer every second time the first pointer is advanced. If there is a loop, eventually both pointers will point to the same node.',
    3,
	0
  );

  
SELECT COUNT(*) FROM questions WHERE category = 'Algorithms';