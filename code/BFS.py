

# Base Class definition for k-ary tree
class Node:
	key = None	# node data	
	
	# constructor: set the node data
	def __init__( self, key ):
		self.key = key
	
	# Get or Set the node data
	def Key( self, key = None ):
		if None == key:
			return self.key

# Derived definition for a Binary Tree
class BinaryTree(Node):
	left  = None  # left binary subtree
	right = None  # right binary subtree

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
	
	# InOrder Traversal
	def InOrder( self ):
		if self.Left() != None:
			self.Left().InOrder()
		self.Action()
		if self.Right() != None:
			self.Right().InOrder()
	
	# PreOrder Traversal
	def PreOrder( self ):
		self.Action()
		if self.Left() != None:
			self.Left().PreOrder()
		if self.Right() != None:
			self.Right().PreOrder()
	
	# PostOrder Traversal
	def PostOrder( self ):
		if self.Left() != None:
			self.Left().PostOrder()
		if self.Right() != None:
			self.Right().PostOrder()
		self.Action()
	
	# Example action to perform on a node
	def Action( self ):
		print( self.Key() )
		
	# Calculate the maximum depth of the binary tree
	def MaxDepth( self, max ):
		max += 1   # increment by one level for the node
		
		lmax = max
		rmax = max # maximum depth on left and right nodes.
		
		# Calculate the maximum depth along the left binary subtree
		if self.Left() != None:
			lmax = self.Left().MaxDepth( max )
		# Calculate the maximum depth along the right binary subtree
		if self.Right() != None:
			rmax = self.Right().MaxDepth( max )
		
		if lmax > rmax:
			return lmax
		else:
			return rmax

	# Calculate the minimum depth of the binary tree
	def MinDepth( self, min ):
		min += 1    # increment by one level for the node
		
		lmin = min
		rmin = min  # minimum depth on left and right nodes.
		
		# Calculate the maximum depth along the left binary subtree
		if self.Left() != None:
			lmin = self.Left().MaxDepth( min )
		# Calculate the maximum depth along the right binary subtree
		if self.Right() != None:
			rmin = self.Right().MaxDepth( min )
		
		if lmin < rmin:
			return lmin
		else:
			return rmin
			
	# Calculate the minimum and maximum value in the binary tree
	def MinMax( self ):
		min = 2147483648  # counter for min value (start at maximum signed int)
		max = -2147483647 # counter for max value (start at minimum signed int)
			
		# list of nodes to visit in node level order
		visit = []	# list acts as dynamic array
		visit.append( self )
		
		# sequentially visit each node in level order as it is dynamically added to the list
		i = 0
		while i < len( visit ):
			# Perform the node action
			if int( visit[ i ].Key() ) > int( max ):
				max = visit[ i ].Key()
			if int( visit[ i ].Key() ) < int( min ):
				min = visit[ i ].Key()
			
			# Add to the list the child siblings of this node
			if visit[ i ].Left() != None:
				visit.append( visit[ i ].Left() )
			if visit[ i ].Right() != None:
				visit.append( visit[ i ].Right() )
			i += 1
		
		return min, max

# Breadth First Search
def BFS( root ):
	# Check if tree is empty
	if root == None:
		return
			
	# list of nodes to visit in node level order
	visit = [] # list acts as dynamic array
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
		
tree = BinaryTree( "1" )
tree.Left ( BinaryTree( "2" ) )
tree.Right( BinaryTree( "3" ) )
tree.Left().Left( BinaryTree( "4" ) )
tree.Left().Right( BinaryTree( "5" ) )
print( "BFS output 1 2 3 4 5")
BFS( tree )
print("Max Depth(3) is  " + str( tree.MaxDepth( 0 ) ) )
print("Max Depth(2) is  " + str( tree.MinDepth( 0 ) ) )
min,max = tree.MinMax()
print("Min Value(1) is  " + str( min ) )
print("Max Value(5) is  " + str( max ) )