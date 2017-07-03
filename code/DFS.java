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
	
	// Example action to perform on a node
	public void Action() {
		System.out.println( this.Key() );
	}
}
public class DFS {
	// Depth First Search
	public static void DFS( BinaryTree root, Object goal ) {
		
		// Check if tree is empty
		if ( root == null )
			return;
			
		// list of nodes to visit in node level order
		Stack<BinaryTree> visit = new Stack<BinaryTree>();	
		visit.push( root );
		
		// sequentially visit in node in level order as it is dynamically added to the list
		while ( visit.size() > 0 ) {
			BinaryTree node = visit.pop();
			
			// Perform the node action
			node.Action();
			
			if ( goal != null && node.Key() == goal )
				return;
			
			// Add to the list the child siblings of this node
			if ( node.Right() != null )
				visit.push( node.Right() );
			if ( node.Left() != null )
				visit.push( node.Left() );
		}	
	}
	
	// Depth Limited Search
	public static void DLS( BinaryTree root, Object goal, int limit ) {
		// Check if tree is empty
		if ( root == null )
			return;
			
		// list of nodes to visit in node level order
		Stack<BinaryTree> visit = new Stack<BinaryTree>();	
		visit.push( root );
		
		// sequentially visit in node in level order as it is dynamically added to the list
		int depth = 0;
		while ( visit.size() > 0 ) {
			// depth limit reached
			if ( depth == limit ) {
				System.out.println("DEPTH LIMIT REACHED");
				return;
			}
			
			BinaryTree node = visit.pop();
			
			// Perform the node action
			node.Action();
			
			if ( goal != null && node.Key() == goal )
				return;
			
			// Add to the list the child siblings of this node
			if ( node.Right() != null )
				visit.push( node.Right() );
			if ( node.Left() != null )
				visit.push( node.Left() );
			// Increase the depth by one
			depth++;
		}	
	}
	
	public static void main( String[] args ) {
		BinaryTree tree = new BinaryTree( "1" );
		tree.Left ( new BinaryTree( "2" ) );
		tree.Right( new BinaryTree( "3" ) );
		tree.Left().Left( new BinaryTree( "4" ) );
		tree.Left().Right( new BinaryTree( "5" ) );
		tree.Right().Left( new BinaryTree( "6" ) );
		tree.Right().Right( new BinaryTree( "7" ) );
		System.out.println( "DFS 1,2,4,5,3,6,7");
		DFS( tree, null );
		System.out.println( "DFS find 6");
		DFS( tree, "6" );
		System.out.println( "DLS of 3 find 5");
		DLS( tree, "5", 3 );
		System.out.println( "DLS of 4 find 5");
		DLS( tree, "5", 4 );
	}
}