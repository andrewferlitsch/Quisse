
		
# Base Class definition for k-ary tree
class Node:
	key = None # node data

	# constructor: set the node data
	def __init__( self, key ):
		self.key = key
	
	# Set the node data
	def Key( self, key = None ):
		if None == key:
			return self.key
		self.key = key

# Derived definition for a Binary Tree
class BinaryTree(Node):
	left  = None # left binary subtree
	right = None # right binary subtree

	# Constructor: set the node data and left/right subtrees to null
	def __init__( self, key ):
		Node.__init__( self, key )

	# Get or Set the left binary subtree
	def Left( self, left = None ):
		if None == left:
			return self.left
		self.left = left

	# Get or Set the right binary subtree
	def Right( self, right = None ):
		if None == right:
			return self.right
		self.right = right

	# Example action to perform on a node
	def Action( self ):
		print( self.Key() )

# Definition for a binary search tree
class BST:
	root = None # root of the binary search tree
	
	# Insert a node into a binary tree
	def Insert( self, node ):
		# Empty Tree, make the node the root
		if self.root == None:
			self.root = node
			return
		
		# Follow a path to insert the node
		curr = self.root
		while True:
			# node is a duplicate, do not insert
			if int( node.Key() ) ==  int( curr.Key() ):
				return
			
			# The node is less than the current node, traverse left
			if int( node.Key() )  < int( curr.Key() ):
				# If there is no left node, make this node the left node
				if curr.Left() == None:
					curr.Left( node )
					return
				curr = curr.Left()
			# The node is greater than to the current node, traverse left
			else:
				# If there is no right node, make this node the right node
				if curr.Right() == None:
					curr.Right( node )
					return
				curr = curr.Right()
		
	# Find a node in a binary tree
	def Find( self, key ):
			
		# Follow a path to find the node
		curr = self.root
		while True:
			# current node is null, return null (not found)
			if curr == None:
				return None
				
			# the value is equal to the current node, return the current node
			if int( key ) == int( curr.Key() ):
				return curr
			
			# The value is less than the current node, traverse left
			if int( key ) <  int( curr.Key() ):
				curr = curr.Left()
			# The value is greater than to the current node, traverse left
			else:
				curr = curr.Right()
	
	# Delete a node in a binary tree
	def Delete( self, key ):

		# Follow a path to find the node
		curr = self.root
		prev = None
		isLeft = False
		while True:
			# current node is null, return (not found)
			if curr == None:
				return
				
			# the value is equal to the current node, delete the node
			if int( key ) == int( curr.Key() ):
				if isLeft:
					prev.left = None
				else:
					prev.right = None
				saveRoot = self.root;
				self.root = prev;
				if curr.Left()  != None:
					self.Insert( curr.Left() )
				if curr.Right() != None:
					self.Insert( curr.Right() )
				self.root = saveRoot
				return
			elif int( key ) < int( curr.Key() ):
				isLeft = True
				prev = curr
				curr = curr.Left()
			else:
				isLeft = False
				prev = curr
				curr = curr.Right();
	
# Breadth First Search
def BFS( root ):
	# Check if tree is empty
	if root == None:
		return
			
	# list of nodes to visit in node level order
	visit = []
	visit.append( root )
		
	# sequentially visit in node in level order as it is dynamically added to the list
	i = 0
	while i < len( visit ):
		# Perform the node action
		visit[ i ].Action()
			
		# Add to the list the child siblings of this node
		if visit[ i ].Left() != None:
			visit.append( visit[ i ].Left() )
		if visit[ i ].Right() != None:
			visit.append( visit[ i ].Right() )
		i += 1
	
# Driver method
tree = BST()
tree.Insert( BinaryTree( 3 ) )
tree.Insert( BinaryTree( 6 ) )
tree.Insert( BinaryTree( 2 ) )
tree.Insert( BinaryTree( 4 ) )
tree.Insert( BinaryTree( 1 ) )
print("BST level order: 3 2 6 1 4")
BFS( tree.root )
print( "FIND(4) = " + str( tree.Find( 4 ).Key() ) + " FIND(1) = " + str( tree.Find( 1 ).Key() ) )
tree.Delete( 6 )
print("BST level order: 3 2 4 1")
BFS( tree.root )
