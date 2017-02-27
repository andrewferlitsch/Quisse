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
    'How do you specify a comment?',
    '/* ... */',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'CSS',
    'How do separate multiple declarations in a selector?',
    'With a semi-colon.',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'CSS',
    'How do specify a declaration in a selector?',
    'property:value',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'CSS',
    'How do specify an inline style?',
    'style=''property:value;property:value''',
    1,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'CSS',
    'How do set a border style?',
    'border-style: value',
    1,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'CSS',
    'How do set a border style of type dotted?',
    'border-style: dotted',
    1,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'CSS',
    'How do you specify different margins for top, bottom, left and right?',
    'margin-top, margin-bottom, margin-left, margin-right',
    1,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'CSS',
    'What does the margin property do?',
    'It sets the spacing outside the border of the element.',
    1,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'CSS',
    'What does the padding property do?',
    'It sets the spacing inside the border of the element.',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'CSS',
    'How do you specify different paddings for top, bottom, left and right?',
    'padding-top, padding-bottom, padding-left, padding-right',
    1,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'CSS',
    'What are the values for the border-style property?',
    'solid, dotted, dashed, double, groove, ridge, inset, outset, none, hidden',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'CSS',
    'What is the syntax for the border shorthand?',
    'border: width style color',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'CSS',
    'How can you make rounded edges on a border?',
    'border-radius: pixel-value',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'CSS',
    'What are the four types of values for a margin property?',
    'length, percent, auto, inherit',
    2,
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
    'Yes for margins, no for padding.',
    2,
	0
  );

INSERT INTO questions (category, question, answer, rank, toggle) 
  VALUES (
    'CSS',
    'Does a margin or padding for top and bottom affect an inline element?',
    'No.',
    2,
	0
  );

INSERT INTO questions (category, question, answer, rank, toggle) 
  VALUES (
    'CSS',
    'What are the three ways to specify a color in CSS?',
    'by name (red), by hex value (#ff0000), and by rgb (rgb(255,0,0))',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle) 
  VALUES (
    'CSS',
    'When specifying a color range by numerical value, what is the range?',
    '0 .. 255 or 00 .. FF in hex.',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle) 
  VALUES (
    'CSS',
    'What does RGB stand for?',
    'Red, Green and Blue.',
    2,
	1
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
    'How do you select all paragraph elements inside a div?',
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
    'If a background image is smaller than the area to fill, how do you get it to repeat to fill the area?',
    'background-repeat: repeat-x to repeat horizontally and background-repeat: repeat-y to repeat vertically.',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'CSS',
    'How do you specify a background image?',
    'background-image: url(value)',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'CSS',
    'What is the difference between px and pt?',
    'px is a fixed size unit for width and height spacing and is equal to one dot on a screen. pt is a unit for text and is equal to 1/72 inch.',
    2,
	0
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
    'What are the different types of values for a width or height property?',
    'length, auto or %',
    2,
	1
  );
  
INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'CSS',
    'For width and height, what does the value specified as a percent do?',
    'It specifies the percent of the area for the element of the containing block.',
    2,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'CSS',
    'How do you set the maximum width of an image when it is resized?',
    'max-width: value',
    2,
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

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'CSS',
    'What is em unit?',
    'It is a scalable unit for fonts, where 1em equals the current font size.',
    3,
	0
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'CSS',
    'How do you specify that an element should have the same margin as the parent?',
    'margin: inherit',
    3,
	1
  );

INSERT INTO questions (category, question, answer, rank, toggle ) 
  VALUES (
    'CSS',
    'How do you specify an image for a list item marker?',
    'list-style-image: url(value)',
    3,
	1
  );

 SELECT COUNT(*) FROM questions WHERE category = 'CSS'
