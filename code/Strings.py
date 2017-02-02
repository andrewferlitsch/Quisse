
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
	
print( Reverse( "abcdefg" ) )
print( ReverseR( "abcdefg" ) )