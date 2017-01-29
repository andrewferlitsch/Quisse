
# Euclid's algorithm as an iterative solution
def GCD( x, y ):
	# continue until the division of of the two numbers does not leave a remainder (evenly divisible)
	while y > 0:
		# calculate the remainder of the division by between x and y
		remainder = ( y % x )
			
		# swap the value of x with y
		x = y
			
		# set y to the remainder
		y = remainder
		
	return x

# Euclid's algorithm as a recursive solution
def GCDR( x, y ):
	# return the current value of x when y is reduced to zero.
	if y == 0:
		return x
			
	return GCDR( y, ( y % x ) )
	
# Calculate the least common multiple
def LCM( x, y ):
	return ( x * y ) / GCD( x, y )
	
print( "GCD " + str( GCD( 12, 16 ) ) )
print( "GCD " + str( GCDR( 12, 16 ) ) )
print( "LCM " + str( LCM( 6, 8 ) ) )
