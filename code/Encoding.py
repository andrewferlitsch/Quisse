
def Size( encoding ):
	first = encoding[ 0 ]
	# checking leading bit
	if ( first & 0x80 ) == 0:
		return 1
	if ( first & 0x40 ) == 0:
		return 2
	if ( first & 0x20 ) == 0:
		return 3
	if ( first & 0x10 ) == 0:
		return 4
	if ( first & 0x08 ) == 0:
		return 5
	if ( first & 0x04 ) == 0:
		return 6
	if ( first & 0x02 ) == 0:
		return 7
	if ( first & 0x01 ) == 0:
		return 8
	return 0	# error
	
encoding = [ 0 ]
encoding[ 0 ] = 0x49
print( "Size(1) = " + str( Size( encoding ) ) )
encoding[ 0 ] = 0x89
print( "Size(2) = " + str( Size( encoding ) ) )
encoding[ 0 ] = 0xCB
print( "Size(3) = " + str( Size( encoding ) ) )