// Definition for an Entry in the Hash Table (Dictionary)
class Entry {
	private int    key;		     // the key value
	private Object value = null; // the value for this key
	
	// Constructor
	public Entry( int key, Object value ) {
		this.key   = key;
		this.value = value;
	}
	 
	// Get the key
	public int Key() {
		return key;
	}
	
	// Accessors for setting and getting the value of the entry
	public Object Value() {
		return value;
	}
	
	public void Value( Object value ) {
		this.value = value;
	}
	
	// Comparator for checking if key matches this entry.
	public boolean Compare( int key ) {
		return ( this.key == key );
	}
}

// Definition for a Linear Probe Hashing Algorithm
public class HashLP {
	private final int RANGE;       // the range of the index.
	private Entry[] index = null;  // the index
	
	// constructor
	public HashLP( int range ) {
		// set the index range and allocate the index
		RANGE = range;
		index = new Entry[ RANGE ];
	}
	 
	// Map the key into an index within the set range
	public int Index( int key ) {
		return key % RANGE;
	}
	
	// Add a key/value entry to the index
	public void Add( int key, Object value ) {
		int ix = Index( key );
		
		// Linear probe the entries for an empty or matching slot.
		for ( /**/; ix < RANGE; ix++ ) {
			// there is no entry at this index, add the key/value
			if ( index[ ix ] == null ) {
				index[ ix ] = new Entry( key, value );
				break;
			}
				
			// Entry found, update the value
			if ( index[ ix ].Compare( key ) ) {
				index[ ix ].Value( value );
				break;
			}
		}
	}
	
	// Get the value for the key
	public Object Get( int key ) {
		int ix = Index( key );
		
		// Linear probe the entries for an empty or matching slot.
		for ( /**/; ix < RANGE; ix++ ) {
			// there is no entry at this index, return not found
			if ( index[ ix ] == null )
				return null;
				
			// Entry found
			if ( index[ ix ].Compare( key ) )
				return index[ ix ].Value();
		}
		
		// not found
		return null;
	}
	
	public static void main( String[] args ) {
		HashLP index = new HashLP( 100 );
		index.Add( 17,   100 );
		index.Add( 117,  600 ); // this will cause a collision
		index.Add( 228,  300 );
		index.Add( 675,  400 );
		index.Add( 2298, 500 );
		index.Add( 117,  200 ); // this will cause an update
		System.out.println( index.Get( 17 ) );
		System.out.println( index.Get( 117 ) );
		System.out.println( index.Get( 228 ) );
		System.out.println( index.Get( 675 ) );
		System.out.println( index.Get( 2298 ) );
	}
}