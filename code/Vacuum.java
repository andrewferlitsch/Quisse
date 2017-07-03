// Simple Reflex Agent
import java.util.LinkedList;

// Robot Vacuum Cleaner Definition
public class Vacuum {
	// Cleaning State of Room
	private enum State {
		CLEAN,	// Room is clean
		DIRTY	// Room is dirty
	}
	
	// Robot Action to Perform
	private enum Action {
		VACUUM,	// Vacuum the room
		MOVE	// Move to next room
	}
	
	// Description of a Room
	static private class Room {
		String id;		// Room identifier
		State  state;	// Clean state of the room
		
		public Room( String id, State state ) {
			this.id    = id;
			this.state = state;
		}
	}
	
	// List of Rooms
	static private LinkedList<Room> rooms = new LinkedList<Room>();
	
	// Find Next Dirty Room
	static private Room NextRoom( Room room ) {
		for ( Room r : rooms ) {
			// If a different room and room is dirty, then select this room
			if ( r.id != room.id && r.state == State.DIRTY )
					return r;
		}
		
		// not reachable
		return null;
	}
	
	// Randomly select a room and make it dirty
	static private void RandomDirt( Room room ) {
		while ( true ) {
			// generate random value between 1 and number of rooms + 1 (extra)
			int i = (int) Math.floor( Math.random() * rooms.size() + 1 ) + 1;
			// if rooms + 1 (extra), then do nothing
			if ( i == rooms.size() + 1 )
				return;
			// If this is not the same room you are moving from, add dirt to it.
			if ( String.valueOf( i ) != room.id ) {
				room.state = State.DIRTY;
				System.out.println( "ROOM " + i + " ADD DIRT" );
				return;
			}
		}
	}
	
	// Determine Action Agent (Robot Vacuum) is to Perform
	static private Room Agent( Room room ) {
		Action action = Action.VACUUM;
		
		switch ( room.state ) {
		// Room is Dirty
		case DIRTY: action     = Action.VACUUM; 
				    room.state = State.CLEAN;
					break;
		// Room is Clean
		case CLEAN: // Move to another dirty room
					room = NextRoom( room );
				    action = Action.MOVE;   
		            break;
		}
		
		if ( room != null )
			System.out.println( "ROOM " + room.id + " " + action );
		
		return room;
	}
	
	// Determine Action Agent (Robot Vacuum) is to Perform
	static private void AgentR( Room room ) {
		Action action = Action.VACUUM;
		
		switch ( room.state ) {
		// Room is Dirty
		case DIRTY: action     = Action.VACUUM; 
				    room.state = State.CLEAN;
					break;
		// Room is Clean
		case CLEAN: // Move to another dirty room
				    room = NextRoom( room );
				    action = Action.MOVE;   
		            break;
		}
		
		if ( room != null ) {
			System.out.println( "ROOM " + room.id + " " + action );
			AgentR( room );
		}
	}
	
	// Determine Action Agent (Robot Vacuum) is to Perform
	static private void AgentRD( Room room ) {
		Action action = Action.VACUUM;

		switch ( room.state ) {
		// Room is Dirty
		case DIRTY: action     = Action.VACUUM; 
				    room.state = State.CLEAN;
					break;
		// Room is Clean
		case CLEAN: // Randomly select a different room and make it dirty
					RandomDirt( room );
					//  Move to another dirty room
					room = NextRoom( room );
				    action = Action.MOVE;   
		            break;
		}
		
		if ( room != null ) {
			System.out.println( "ROOM " + room.id + " " + action );
			AgentRD( room );
		}
	}
	
	public static void main( String[] args ) {
		rooms.add( new Room( "1", State.DIRTY ) );
		rooms.add( new Room( "2", State.DIRTY ) );
		rooms.add( new Room( "3", State.DIRTY ) );
		
		System.out.println( "Iterative Solution" );
		Room room = rooms.get( 0 );
		while ( ( room = Agent( room ) ) != null )
			;
		
		System.out.println( "Recursive Solution" );
		for ( int i = 0; i < 3; i++ ) 
			rooms.get( i ).state = State.DIRTY;
		AgentR( rooms.get( 0 ) );	
		
		System.out.println( "Random Dirt" );
		for ( int i = 0; i < 3; i++ ) 
			rooms.get( i ).state = State.DIRTY;
		AgentRD( rooms.get( 0 ) );	
	}
}