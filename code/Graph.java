import java.util.LinkedList;
import java.util.Stack;

// Definition for a node in a graph
class Node {
	private Object key;                       // node data
	// list of neighboring nodes (vertices)
	private LinkedList<Node> neighbors = new LinkedList<Node>();  
	private Visit visited = Visit.UNVISITED;  // node has been visited
	
	// Visit State
	public enum Visit {
		UNVISITED,	// not visited or on frontier (while)
		FRONTIER,	// on frontier, waiting to be visited (gray)
		VISITED		// visited (black)
	}
	
	// constructor
	public Node( Object key ) {
		this.key = key;
	}
	
	// Get the Key
	public Object Key() {
		return this.key;
	}
	
	// Add a neighbor to this node
	public void Neighbor( Node neighbor ) {
		// list the node as a neighbor of this node
		neighbors.add( neighbor );
		
		// list this node as a neighbor of the node
		neighbor.neighbors.add( this );
	}
	
	// Get the nodes neighbors
	public LinkedList<Node> Neighbors() {
		return neighbors;
	}
	
	// Set the node visit 
	public void Visited( Visit visited ) {
		this.visited = visited;
	}
	
	// Get whether the node has been visited
	public Visit Visited() {
		return visited;
	}
}

// Definition for a Graph
public class Graph {
	// Breadth first search of a graph
	public static void BFS( Node root ) {
		// Create a queue for frontier nodes (nodes to be visited next)
		LinkedList<Node> frontier = new LinkedList<Node>();
		
		// Add the root node to the frontier
		frontier.add( root );
		root.Visited( Node.Visit.FRONTIER );
		
		// Traverse each node in the frontier list
		while ( frontier.size() != 0 ) {
			// visit the next node
			Node visit = frontier.remove();
			visit.Visited( Node.Visit.VISITED );
			System.out.println( visit.Key() );
			
			// Add the node's neighbors (if not visited and not on frontier list) 
			// to the frontier list
			for ( Node node : visit.Neighbors() ) {
				if ( node.Visited() == Node.Visit.UNVISITED ) {
					frontier.add( node );
					node.Visited( Node.Visit.FRONTIER );
				}
			}
		}
	}
	
	// Depth first search of a graph (Iterative)
	public static void DFS( Node root, Object goal ) {
		// Create a stack for frontier nodes (nodes to be visited next)
		Stack frontier = new Stack();
		
		// Add the root node to the frontier
		frontier.push( root );
		root.Visited( Node.Visit.FRONTIER );
		
		// Traverse each node in the frontier list
		while ( !frontier.empty() ) {
			// visit the next node
			Node visit = (Node) frontier.pop();
			visit.Visited( Node.Visit.VISITED );
			System.out.println( visit.Key() );
			
			// if searching for goal node and found, then stop
			if ( goal != null && visit.Key() == goal )
				return;
			
			// Add the node's neighbors (if not visited and not on frontier list) 
			// to the frontier list
			for ( Node node : visit.Neighbors() ) {
				if ( node.Visited() == Node.Visit.UNVISITED ) {
					frontier.push( node );
					node.Visited( Node.Visit.FRONTIER );
				}
			}
		}
	}
	
	// Depth first search of a graph (Recursive)
	public static void DFSR( Node root, Object goal ) {
		if ( root == null )
			return;
		
		// mark the node as visited
		root.Visited( Node.Visit.VISITED );
		System.out.println( root.Key() );
			
		// if searching for goal node and found, then stop
		if ( goal != null && root.Key() == goal )
			return;
		
		// Recursively visit each unvisited neighbor
		for ( Node node : root.Neighbors() ) {
			
			if ( node.Visited() == Node.Visit.UNVISITED ) {
				DFSR( node, goal );
			}
		}
	}
	
	// Depth limited search of a graph (Recursive)
	public static void DFSR( Node root, Object goal, int limit ) {
		if ( root == null )
			return;
		
		// mark the node as visited
		root.Visited( Node.Visit.VISITED );
		System.out.println( root.Key() );
			
		// if searching for goal node and found, then stop
		if ( root.Key() == goal )
			return;
		
		// At maximum search depth ( and decrement limit for recursive call )
		if ( --limit == 0 )
			return;
		
		// Recursively visit each unvisited neighbor
		for ( Node node : root.Neighbors() ) {
			if ( node.Visited() == Node.Visit.UNVISITED ) {
				DFSR( node, goal );
			}
		}
	}
	
	public static void main(String[] args ) {
		Node nodes[] = new Node[ 6 ];
		for ( int i = 0; i < 6; i++ )
			nodes[ i ] = new Node( i );
		nodes[ 0 ].Neighbor( nodes[ 1 ] );
		nodes[ 0 ].Neighbor( nodes[ 2 ] );
		nodes[ 0 ].Neighbor( nodes[ 3 ] );
		nodes[ 1 ].Neighbor( nodes[ 2 ] );
		nodes[ 1 ].Neighbor( nodes[ 3 ] );
		nodes[ 3 ].Neighbor( nodes[ 4 ] );
		nodes[ 3 ].Neighbor( nodes[ 5 ] );
		nodes[ 4 ].Neighbor( nodes[ 5 ] );
		System.out.println("BFS");
		BFS( nodes[ 0 ] );
		System.out.println("Iterative DFS");
		for ( int i = 0; i < 6; i++ )
			nodes[ i ].Visited( Node.Visit.UNVISITED);
		DFS( nodes[ 0 ], null );
		System.out.println("Iterative DFS with goal(5)");
		for ( int i = 0; i < 6; i++ )
			nodes[ i ].Visited( Node.Visit.UNVISITED);
		DFS( nodes[ 0 ], 5 );
		System.out.println("Recursive DFS");
		for ( int i = 0; i < 6; i++ )
			nodes[ i ].Visited( Node.Visit.UNVISITED);
		DFSR( nodes[ 0 ], null );
		System.out.println("Recursive DFS with goal(5)");
		for ( int i = 0; i < 6; i++ )
			nodes[ i ].Visited( Node.Visit.UNVISITED);
		DFSR( nodes[ 0 ], 5 );
	}
}