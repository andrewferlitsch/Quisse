
# Definition for a Bubble Sort
def BubbleSort( data ):
	swapped = True
	# continue to repeat until no more adjacent values are swapped
	while swapped:
		swapped = False
		# Make a scan through the list
		for i in range( 0, len( data ) - 1 ):
			# Compare adjacent values. If the first value > second value, swap the values.
			if data[ i ] > data[ i + 1 ]:
				swap = data[ i ]
				data[ i ] = data[ i + 1 ]
				data[ i + 1 ] = swap
				swapped = True
	return data
	
# Definition for an Insertion Sort
def InsertionSort( data ):
	# iterate through the list for each element except the first element
	for i in range( 1, len( data ) ):
		# starting with the current element, remove/insert proceeding
		# elements so they are in sorted order
		for j in range( i, 0, -1):
			# swap adjacent elements
			if data[ j ] < data[ j - 1 ]:
				temp = data[ j ]
				data[ j ] = data[ j -1 ]
				data[ j - 1 ] = temp

	return data;
	
data = [ 5, 2, 4, 1, 6, 3 ]
data = BubbleSort( data )
for i in range( 0, len( data ) ):
	print( data[ i ] )
		
data = [ 5, 2, 4, 1, 6, 3 ]
data = InsertionSort( data )
for i in range( 0, len( data ) ):
	print( data[ i ] )