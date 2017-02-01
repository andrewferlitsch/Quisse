// Definition for an Entry in the Hash Table (Dictionary)
class Entry {
	private int    key;		     // the key value
	private Object value = null; // the value for this key
	private Entry  next  = null; // the next entry at this range
	
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

	// Accessors for setting and getting the next entry on the chain
	public void Next( Entry next ) {
		this.next = next;
	}
	
	public Entry Next() {
		return next;
	}
	
	// Comparator for checking if key matches this entry.
	public boolean Compare( int key ) {
		return ( this.key == key );
	}
}

// Definition for a Modulo based Hashing Algorithm
public class Hash {
	private final int RANGE;       // the range of the index.
	private Entry[] index = null;  // the index
	
	// constructor
	public Hash( int range ) {
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
		
		// there is no entry at this index, add the key/value
		if ( index[ ix ] == null ) {
			index[ ix ] = new Entry( key, value );
		}
		else {
			// See if the key already exists in the chain
			Entry next = index[ ix ];
			for ( /**/; next != null; next = next.Next() ) {
				// Entry found, update the value
				if ( next.Compare( key ) ) {
					next.Value( value );
					break;
				}
			}
			
			// no entry found, add one
			if ( next == null ) {
				// Add the entry to the front of the chain
				Entry add = new Entry( key, value );
				add.Next( index[ ix ] );
				index[ ix ] = add;
			}
		}
	}
	
	// Get the value for the key
	public Object Get( int key ) {
		int ix = Index( key );
		
		// See if the key exists in the chain at this entry in the index
		Entry next = index[ ix ];
		for ( /**/; next != null; next = next.Next() ) {
			// Entry found, update the value
			if ( next.Compare( key ) )
				return next.Value();
		}
		
		// not found
		return null;
	}
	
	public static void main( String[] args ) {
		Hash index = new Hash( 100 );
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