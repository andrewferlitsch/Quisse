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

DELETE FROM questions WHERE category = 'CSS';

#----------------------------------------------------------------------
# CSS
#----------------------------------------------------------------------

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'CSS',
    'What does CSS stand for?',
    'Cascading Style Sheets',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle) 
  VALUES (
    'CSS',
    'Where in an HTML doc can you place a link to an external style sheet?',
    '<head>',
    1,
	0
  );


INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'CSS',
	'What does the HTML attribute style do?',
    'This HTML attribute is used to specify an inline style for an element?',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'CSS',
    'What does the CSS property color do?',
    'This property changes the color of text.',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'CSS',
    'What does the CSS property background-color do?',
    'This property changes the background color behind the text.',
    1,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'CSS',
    'What HTML element is used to specify CSS properties in a web page?',
    '<style></style>',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'CSS',
    'How do you specify a CSS rule for a name attribute?',
    '#name {} selector',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'CSS',
    'How do you specify a CSS rule for a class attribute?',
    '.name {} selector',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'CSS',
    'How do you specify that hyperlinks are displayed without an underline?',
    'a { text-decoration: none; }',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle) 
  VALUES (
    'CSS',
    'Can you use negative values for margin? Can you use negative values for padding?',
    'yes for margins, no for padding',
    2,
	0
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'CSS',
    'How do you left-justify a group of block elements?',
    'set style=''float:left;'' on each block element, and then a style=''clear:both'' on the next element that is not to be left-justified.',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'CSS',
    'What is the default value for the position property?',
    'static is the default value for this CSS property',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'CSS',
    'How do you select all elements inside a div?',
    'div p {}',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle) 
  VALUES (
    'CSS',
    'What is the order of values in border-width to define a width for each side?',
    'top, right, bottom, left',
    2,
	0
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'CSS',
    'What does visibility:hidden do?',
    'It hides an element from being displayed. The space consumed by the element is still rendered (blank)',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'CSS',
    'What does display:none do?',
    'It hides an element from being displayed. The space consumed by the element is not rendered (folded)',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'CSS',
    'What are some examples of psuedo-class selectors?',
    ':link, :visited, :hover, :active, :first-child, :lang',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'CSS',
    'How do you group selectors?',
    'selector1, selector2 {}  e.g., h1, h2 { font-size: 24pt; }',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'CSS',
    'How do you automatically add scroll bars if text will overflow a div element?',
    'overflow: auto',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'CSS',
    'What are three things (property values) you can do with the text-transform property?',
    'uppercase words, lowercase words, capitalize words',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'CSS',
    'How do you make a list that lists its items with squares?',
    'list-style-type: square;',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'CSS',
    'Give an example of selecting all p elements that are a child of a div element?',
    'div > p {}',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'CSS',
    'What is the z-index?',
    'The order in which elements that overlap are rendered.',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'CSS',
    'What is CSS Box Model?',
    'This model consists of a margin, border, padding and content.',
    3,
	1
  );

