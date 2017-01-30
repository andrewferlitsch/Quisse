class Sort {
	// Definition for a Bubble Sort
	public static int[] BubbleSort( int[] data ) {
		boolean swapped = true;
		// continue to repeat until no more adjacent values are swapped
		while ( swapped ) {
			swapped = false;
			// Make a scan through the list
			for ( int i = 0; i < data.length - 1; i++ ) {
				// Compare adjacent values. If the first value > second value, swap the values.
				if ( data[ i ] > data[ i + 1 ] ) {
					int swap = data[ i ];
					data[ i ] = data[ i + 1 ];
					data[ i + 1 ] = swap;
					swapped = true;
				}
			}
		}
		return data;
	}
	
	// Definition for an Insertion Sort
	public static int[] InsertionSort( int[] data ) {
		// iterate through the list for each element except the first element
		for ( int i = 1; i < data.length; i++ ) {
			// starting with the current element, remove/insert proceeding
			// elements so they are in sorted order
			for ( int j = i; j > 0; j-- ) {
				// swap adjacent elements
				if ( data[ j ] < data[ j - 1 ] ) {
					int temp = data[ j ];
					data[ j ] = data[ j -1 ];
					data[ j - 1 ] = temp;
				}
			}
		}
		return data;
	}
	
	// Definition for an Quick Sort
	public static int[] QuickSort( int[] data ) {
		qSort( data, 0, data.length - 1 );
		return data;
	} 
	
	private static void qSort( int[] data, int low, int high ) {
		int i     = low;						// starting lower index
		int j     = high;						// starting higher index
		int mid   = low + ( high - low ) / 2;	// midway index
		int pivot = data[ mid ];				// pivot, value at the midway index
		
		// Divide the array into two partitions
		while ( i <= j ) {
			// keep advancing (ascending) the lower index until we find a value that is not less than the pivot
			// we will move this value to the right half partition.
			while ( data[ i ] < pivot ) {
                i++;
            }
			// keep advancing (descending) the higher index until we find a value that is not greater than the pivot
			// we will move this value to the left half partition.
			while ( data[ j ] > pivot ) {
                j--;
            }
			// if the lower index has past the higher index, there is no values to swap
			// otherwise, swap the values and continue
			if ( i <= j ) {
				// swap the higher than pivot value on the left side with the lower than pivot value on the right side
				int temp  = data[ i ];
				data[ i ] = data[ j ];
				data[ j ] = temp;

                // advance the lower and higher indexes accordingly and continue
                i++;
                j--;
            }
		}        
		
		// recursively sort the two partitions if the index has not crossed over the pivot index
        if ( low < j )
            qSort( data, low, j );
        if ( i < high )
            qSort( data, i, high );
	}
	
	// Definition for an Quick Sort
	public static int[] MergeSort( int[] data ) {
		// allocate space for a temporary copy of the data
		int[] tdata = new int[ data.length ];

		// sort the data (pass in the temporary copy so routine is thread safe)
		mSort( data, 0, data.length - 1, tdata );
		return data;
	} 
	
	private static void mSort( int[] data, int low, int high, int[] tdata ) {
		// if the partition has more than one element, then recursively divide the partition and merge the parts back in
		if ( low < high ) {
			int mid   = low + ( high - low ) / 2;	// midway index
			
			// sort the lower (first) half partition
			mSort( data, low, mid, tdata );
			// sort the upper (second) half partition
			mSort( data, mid + 1, high, tdata );
			
			// merge the partitions together
			merge( data, low, mid, high, tdata );
		}
	}
	
	private static void merge( int[] data, int low, int mid, int high, int[] tdata ) {
		// make a temporary copy of the two separately sorted partitions
		for ( int i = low; i <= high; i++ )
            tdata[ i ] = data[ i ];	        
		
		// starting from the beginning of the first partition, iteratively search for the next lowest
		// number from the lower (first) and higher (second) and move into current position in the 
		// lower (first) partition
		int i = low, k = low;
        int j = mid + 1;
		while ( i <= mid && j <= high ) {            
			if ( tdata[ i ] <= tdata[ j ] ) {
                data[ k ] = tdata[ i ];
                i++;
            } else {
                data[ k ] = tdata[ j ];
                j++;
            }
            k++;
		}
		
		// Copy any remaining elements back into the first partition
		while ( i <= mid ) {
            data[ k ] = tdata[ i ];
            k++;
            i++;
        }
	}
	
	public static void main( String[] args ) {
		int[] data = new int[ 6 ];
		data[ 0 ] = 5; data[ 1 ] = 2; data[ 2 ] = 4; data[ 3 ] = 1; data[ 4 ] = 6; data[ 5 ] = 3;
		data = BubbleSort( data );
		for ( int i = 0; i < data.length; i++ )
			System.out.println( data[ i ] );
		
		data[ 0 ] = 5; data[ 1 ] = 2; data[ 2 ] = 4; data[ 3 ] = 1; data[ 4 ] = 6; data[ 5 ] = 3;
		data = InsertionSort( data );
		for ( int i = 0; i < data.length; i++ )
			System.out.println( data[ i ] );
		
		data[ 0 ] = 5; data[ 1 ] = 2; data[ 2 ] = 4; data[ 3 ] = 1; data[ 4 ] = 6; data[ 5 ] = 3;
		data = QuickSort( data );
		for ( int i = 0; i < data.length; i++ )
			System.out.println( data[ i ] );
		
		data[ 0 ] = 5; data[ 1 ] = 2; data[ 2 ] = 4; data[ 3 ] = 1; data[ 4 ] = 6; data[ 5 ] = 3;
		data = MergeSort( data );
		for ( int i = 0; i < data.length; i++ )
			System.out.println( data[ i ] );
	}
}