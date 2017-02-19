// Definition for a Disc element in a Stack (Tower)
class Disc {
	private Object disc;        // the disc (size)
	private Disc   next = null; // the next disc in the stack

	// constructor, disc represents the disc on the stack (tower)
	public Disc( Object disc ) {
		this.disc = disc;
	}
	
	// Get the next disc this element is stacked on top of
	public Disc Next() {
		return next;
	}
	
	// Set the next disc this element is stacked on top of
	public void Next( Disc disc ) {
		next = disc;
	}
	
	// Action to take when task is processed
	public void Action() {
		System.out.println( disc );
	}
}

// Definition for a Stack (Tower)
class Stack {
	private Disc top;	// top of the stack
	
	// Check if the Stack (tower) is empty
	public boolean Empty() {
		if ( top == null )
			return true;
		return false;
	}
	
	// Push the disc to the top of the stack
	public void Push( Disc disc ) {
		// Set the disc next pointer to the current top (disc below)
		disc.Next( top );
		// set the top to this disc
		top = disc;
	}
	
	// Pop the disc from the top of the stack
	public Disc Pop() {
		// Stack is Empty
		if ( Empty() )
			return null;
		
		Disc disc = top;	// the disc to pop from the stack
		
		// Move the top to the current top's next pointer (disc below).
		top = top.Next();
		return disc;
	}
}

// Definition for Towers of Hanoi
public class Hanoi {
	private static Stack[] towers = new Stack[ 3 ];	// the three towers (poles)
	static {
		towers[ 0 ] = new Stack();
		towers[ 1 ] = new Stack();
		towers[ 2 ] = new Stack();
	}
	
	// Print the disc stack on each tower
	private static void PrintTowers() {
		Disc disc;
		for ( int i = 0; i < 3; i++ ) {
			System.out.println( "Tower " + ( i + 1 ) );
			while ( ( disc = towers[ i ].Pop() ) != null ) 
				disc.Action();
		}
	}
	
	// Move a stack of discs from the start tower to end tower, using the intermediate tower
	// when the stack is more than one disc.
	private static void Move( int ndiscs, Stack start, Stack intermediate, Stack end ) {
		// If the tower is empty, move the disc to the end tower (n==1)
		if ( ndiscs == 1 ) 
			end.Push( start.Pop() );
		// Otherwise (n>1 case)
		else {
			// move the remainder of the tower to the intermediate tower 
			Move( ndiscs - 1, start, end, intermediate );
			// move the disc to the end tower
			end.Push( start.Pop() );
			// now move the remainder of the tower on the intermediate tower to the end tower
			Move( ndiscs - 1, intermediate, start, end );
		}
	}
	
	public static void main(String[] args) {
		// Stack disks on first tower in decreasing size ( 7 .. 1 )
		for ( int i = 7; i > 0; i-- )
			towers[ 0 ].Push( new Disc( i ) );
		Move( 7, towers[ 0 ], towers[ 1 ], towers[ 2 ] );
		PrintTowers();
	}
}