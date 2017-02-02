
# Reverse the order of a string (Iterative)
def Reverse( original ):
	# Create a second string to hold/return the reversed string
	length = len( original )
	reversed = ""
		
	# copy over the string in reverse order
	for i in range( length-1, -1, -1 ):
		reversed += original[ i ]
		
	return reversed
	
# Reverse the order of a string (Recursion)
def ReverseR( original ):
	if len( original ) > 1:
		return ReverseR( original[1:] ) + original[ 0 ]
	return original
	
# Determine if a string is a Palindrome
def Palindrome( s ):
	length = len( s )
	for i in range( 0, int( length / 2 ) ):
		if s[ i ] != s[ length - i - 1 ]:
			return False
	return True
	
# Determine if a string is a Palindrome for Phrases
def PalindromeP( s ):
	length = len( s )
	i = 0
	j = length - 1
	while i < j:
		if isPunctOrSpace( s[ i ] ):
			i += 1
			continue

		if isPunctOrSpace( s[ j ] ):
			j -= 1
			continue

		if s[ i ].lower() != s[ j ].lower():
			return False
		i += 1 
		if j != i:
			j -= 1

	return True
	
def isPunctOrSpace(c):
	val = ord(c)
	return  ( val >= 32 and val <= 47 ) or ( val >= 58 and val <= 64 ) or ( val >= 91 and val <= 96 ) or ( val >= 123 and val <= 126 )
	
# Count the number of occurrences of a character in a string
def CharOccur( s ):
	counter = [0] * 96	# codes 32 .. 127 are printable (so skip first 32)
	length = len(s)
	# use counter as an accumulator while we count each character in string
	for i in range( 0, length):
		counter[ ord( s[ i ] ) - 32 ] += 1	# offset ascii code by 32
	return counter
	
# Count all duplicated characters
def DupChar( s ):
	# Get the character occurrences
	dup = CharOccur( s )
	# Mask out all single count occurrences
	length = len( dup )
	for i in range( 0, length):
		dup[ i ] &= ~0x001;
	return dup
	
print( Reverse( "abcdefg" ) )
print( ReverseR( "abcdefg" ) )
print( Palindrome( "noon" ) )
print( Palindrome( "rotator" ) )
print( Palindrome( "notone" ) )
print( PalindromeP( "my gym" ) )
print( PalindromeP( "Red rum, sir, is murder" ) )
res = CharOccur( "jack and jill jumped over the hill to fetch a pale of water")
for i in range(32, 128):
	if res[ i - 32 ] > 0:
		print( chr( i ) + ": " + str( res[ i - 32 ] ) )
res = DupChar( "jack and jill jumped over the hill to fetch a pale of water")
for i in range(32, 128):
	if res[ i - 32 ] > 0:
		print( chr( i ) + ": " + str( res[ i - 32 ] ) )
