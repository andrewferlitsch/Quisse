
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

	return data

# Definition for an Quick Sort
def QuickSort( data ):
	qSort( data, 0, len( data )  - 1 )
	return data
	
def qSort( data, low, high ):
	i     = low                       # starting lower index
	j     = high                      # starting higher index
	mid   = int( low + ( high - low ) / 2 )  # midway index
	pivot = data[ mid ]               # pivot, value at the midway index
		
	# Divide the array into two partitions
	while i <= j:
		# keep advancing (ascending) the lower index until we find a value that is not less than the pivot
		# we will move this value to the right half partition.
		while data[ i ] < pivot:
			i += 1
		# keep advancing (descending) the higher index until we find a value that is not greater than the pivot
		# we will move this value to the left half partition.
		while data[ j ] > pivot:
			j -= 1

		# if the lower index has past the higher index, there is no values to swap
		# otherwise, swap the values and continue
		if i <= j:
			# swap the higher than pivot value on the left side with the lower than pivot value on the right side
			temp  = data[ i ]
			data[ i ] = data[ j ]
			data[ j ] = temp

			# advance the lower and higher indexes accordingly and continue
			i += 1
			j -= 1       

	# recursively sort the two partitions if the index has not crossed over the pivot index
	if low < j:
		qSort( data, low, j )
	if i < high:
		qSort( data, i, high )
		
# Definition for an Quick Sort
def MergeSort( data ):
	# allocate space for a temporary copy of the data
	tdata = [ 0 ] * len( data );

	# sort the data (pass in the temporary copy so routine is thread safe)
	mSort( data, 0, len( data ) - 1, tdata )
	return data
	
def mSort( data, low, high, tdata ):
	# if the partition has more than one element, then recursively divide the partition and merge the parts back in
	if low < high:
		mid = int( low + ( high - low ) / 2 )	# midway index
			 
		# sort the lower (first) half partition
		mSort( data, low, mid, tdata )
		# sort the upper (second) half partition
		mSort( data, mid + 1, high, tdata )
			
		# merge the partitions together
		merge( data, low, mid, high, tdata )
	
def merge( data, low, mid, high, tdata ):
	# make a temporary copy of the two separately sorted partitions
	for i in range( low, high + 1 ):
           tdata[ i ] = data[ i ]    
		
	# starting from the beginning of the first partition, iteratively search for the next lowest
	# number from the lower (first) and higher (second) and move into current position in the 
	# lower (first) partition
	i = low
	k = low
	j = mid + 1
	while i <= mid and j <= high:        
		if tdata[ i ] <= tdata[ j ]:
			data[ k ] = tdata[ i ]
			i += 1
		else:
			data[ k ] = tdata[ j ]
			j += 1
		k += 1
		
	# Copy any remaining elements back into the first partition
	while i <= mid:
		data[ k ] = tdata[ i ]
		k += 1
		i += 1

data = [ 5, 2, 4, 1, 6, 3 ]
data = BubbleSort( data )
for i in range( 0, len( data ) ):
	print( data[ i ] )
		
data = [ 5, 2, 4, 1, 6, 3 ]
data = InsertionSort( data )
for i in range( 0, len( data ) ):
	print( data[ i ] )
		
data = [ 5, 2, 4, 1, 6, 3 ]
data = QuickSort( data )
for i in range( 0, len( data ) ):
	print( data[ i ] )
		
data = [ 5, 2, 4, 1, 6, 3 ]
data = MergeSort( data )
for i in range( 0, len( data ) ):
	print( data[ i ] )