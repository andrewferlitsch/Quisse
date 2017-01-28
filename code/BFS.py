
# Base Class definition for k-ary tree
class Node:
	key = None	# node data	
	
	# constructor: set the node data
	def __init__( self, key ):
		self.key = key;
	
	# Set the node data
	def Key( key ):
		self.key = key;
	
	# Get the node data
	def GetKey():
		return self.key;

# Derived definition for a Binary Tree
class BinaryTree(Node):
    left  = None  # left binary subtree
    right = None  # right binary subtree
	
	# Constructor: set the node data and left/right subtrees to null
	def BinaryTree ( self, key ):
        Node.__init__( self, key )
	
	# Set the left binary subtree
	def Left( self, left ):
		self.left = left
	
	# Get the left binary subtree
	def GetLeft( self ):
		return self.left
	
	# Set the right binary subtree
	def Right( self, right ):
		self.right = right
	
	# Get the right binary subtree
	def GetRight( self ):
		return self.right;
	
	# InOrder Traversal
	def InOrder( self ):
		if self.GetLeft() != None:
			self.GetLeft().InOrder()
		self.Action()
		if self.GetRight() != None:
			self.GetRight().InOrder()
	
	# PreOrder Traversal
	def PreOrder( self ):
		self.Action()
		if self.GetLeft() != None:
			self.GetLeft().PreOrder()
		if self.GetRight() != None:
			self.GetRight().PreOrder()
	
	# PostOrder Traversal
	def PostOrder( self ):
		if self.GetLeft() != None:
			self.GetLeft().PostOrder()
		if self.GetRight() != None:
			self.GetRight().PostOrder()
		self.Action()
	
	# Example action to perform on a node
	def Action( self ):
		print( self.GetKey() )

class BFS {
	def BFS( root ):
		
		# Check if tree is empty
		if root == None:
			return
			
		# list of nodes to visit in node level order
		LinkedList<BinaryTree> visit = new LinkedList<BinaryTree>();	
		visit.add( root );
		
		// sequentially visit in node in level order as it is dynamically added to the list
		for ( int i = 0; i < visit.size(); i++ ) {
			// Perform the node action
			visit.get( i ).Action();
			
			// Add to the list the child siblings of this node
			if ( visit.get( i ).Left() != null )
				visit.add( visit.get( i ).Left() );
			if ( visit.get( i ).Right() != null )
				visit.add( visit.get( i ).Right() );
		}	
	}
	
	public static void main( String[] args ) {
		BinaryTree tree = new BinaryTree( "1" );
		tree.Left ( new BinaryTree( "2" ) );
		tree.Right( new BinaryTree( "3" ) );
		tree.Left().Left( new BinaryTree( "4" ) );
		tree.Left().Right( new BinaryTree( "5" ) );
		System.out.println( "BFS output 1 2 3 4 5");
		BFS( tree );
	}
}