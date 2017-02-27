import java.util.LinkedList;
import java.util.Stack;

// Base Class definition for k-ary tree
abstract class Node {
	// node data
	private Object key;	
	// action to perform on a node
	public abstract void Action();
	
	// constructor: set the node data
	public Node( Object key ) {
		this.key = key;
	}
	
	// Set the node data
	public void Key( Object key ) {
		this.key = key;
	}
	
	// Get the node data
	public Object Key() {
		return key;
	}
}

// Derived definition for a Binary Tree
class BinaryTree extends Node {
    private BinaryTree left;	// left binary subtree
    private BinaryTree right;	// right binary subtree
	
	// Constructor: set the node data and left/right subtrees to null
	public BinaryTree (Object key) {
        super( key );
        right = null;
        left = null;
    }
	
	// Set the left binary subtree
	public void Left( BinaryTree left ) {
		this.left = left;
	}
	
	// Get the left binary subtree
	public BinaryTree Left() {
		return left;
	}
	
	// Set the right binary subtree
	public void Right( BinaryTree right ) {
		this.right = right;
	}
	
	// Get the right binary subtree
	public BinaryTree Right() {
		return right;
	}
	
	// InOrder Traversal
	public void InOrder() {
		if ( Left() != null ) Left().InOrder();
		Action();
		if ( Right() != null ) Right().InOrder();
	}
	
	// PreOrder Traversal
	public void PreOrder() {
		Action();
		if ( Left() != null ) Left().PreOrder();
		if ( Right() != null ) Right().PreOrder();
	}
	
	// PostOrder Traversal
	public void PostOrder() {
		if ( Left() != null ) Left().PostOrder();
		if ( Right() != null ) Right().PostOrder();
		Action();
	}
	
	// Example action to perform on a node
	public void Action() {
		System.out.println( this.Key() );
	}
}
public class BFS {
	public static void BFS( BinaryTree root, Object goal ) {
		
		// Check if tree is empty
		if ( root == null )
			return;
			
		// list of nodes to visit in node level order
		LinkedList<BinaryTree> visit = new LinkedList<BinaryTree>();	
		visit.add( root );
		
		// sequentially visit in node in level order as it is dynamically added to the list
		for ( int i = 0; i < visit.size(); i++ ) {
			// Perform the node action
			visit.get( i ).Action();
			
			// If searching for a goal node and found, then stop
			if ( goal != null && visit.get( i ).Key() == goal )
				return;
			
			// Add to the list the child siblings of this node
			if ( visit.get( i ).Left() != null )
				visit.add( visit.get( i ).Left() );
			if ( visit.get( i ).Right() != null )
				visit.add( visit.get( i ).Right() );
		}	
	}
	
	public static Stack<BinaryTree> Path( BinaryTree root, Object goal ) {
		// Check if tree is empty
		if ( root == null )
			return null;
		
		Stack<BinaryTree> ret = new Stack<BinaryTree>();
		
		// Node found, end search
		if ( root.Key() == goal ) {
			ret.push( root );
			return ret;
		}
		
		// Search left subtree for node
		Stack<BinaryTree> left  = Path( root.Left(), goal );
		
		// node was found on left subtree
		if ( left != null ) {
			 left.push( root );
			 return left;
		}
		
		// Search right subtree for node
		Stack<BinaryTree> right = Path( root.Right(), goal );	
		
		// node was found on right subtree
		if ( right != null ) {
			 right.push( root );
			 return right;
		}
		
		// node not in tree
		return null;
	}
	
	// Find the distance between two nodes
	public static int Distance( BinaryTree root, Object node1, Object node2 ) {
		// Get the path to the first node
		Stack<BinaryTree> path1 = Path( root, node1 );
		if ( path1 == null ) return 0;
		
		// Get the path to the second node
		Stack<BinaryTree> path2 = Path( root, node2 );
		if ( path2 == null ) return 0;

		// The minimum distance between the nodes and the root
		int i = Math.min( path1.size(), path2.size() ) - 1;		
		// Find the common ancestor within the minimum distance
		BinaryTree common = root;
		for ( /**/; i > 0; i-- ) {
			if ( path1.get( i ).Key() != path2.get( i ).Key() )
				break;
			common = path1.get( i );
		}
		
		// Find the distances between the common ancestor and the two nodes
		int dist1 = path1.size() - ( path1.size() - i ) + 1;
		int dist2 = path2.size() - ( path2.size() - i ) + 1;
		
		// return the combined distances
		return dist1 + dist2;
	}
	
	public static void main( String[] args ) {
		BinaryTree tree = new BinaryTree( "1" );
		tree.Left ( new BinaryTree( "2" ) );
		tree.Right( new BinaryTree( "3" ) );
		tree.Left().Left( new BinaryTree( "4" ) );
		tree.Left().Right( new BinaryTree( "5" ) );
		System.out.println( "BFS output 1 2 3 4 5");
		BFS( tree, null );
		System.out.println( "BFS find node 4");
		BFS( tree, "4" );
		System.out.println( "Path find 4");
		Stack<BinaryTree> path = BFS.Path( tree, "4" );
		while ( !path.empty() ) {
			System.out.println( path.pop().Key() );
		}
		
		tree.Right().Left( new BinaryTree( "6" ) );
		tree.Right().Right( new BinaryTree( "7" ) );
		System.out.println( "Distance( 4, 6 ) = 4: " + BFS.Distance( tree, "4", "6") );
	}
}