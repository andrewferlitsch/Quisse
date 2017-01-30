
# Definition for an element in the dynamic array
class Element:
	next = None	# next element in array
	
	# Constructor: set the node data
	def __init__(self, value):
		self.value   = value	# node data

# Definition for a Dynamic Array
class DynamicArray:
	head = None # head of the array
	tail = None # tail of the array
	size = 0    # size of the array
	
	# The size (number of elements) of the array
	def Size( self ):
		return self.size;

	# Add an element to the end of the dynamic array
	def Add( self, value ):
		e = Element(value)
		
		# Set the next element of the previous tail to the new element
		if self.tail != None:
			self.tail.next = e

		# set the current tail to the new element
		self.tail = e
		
		# If there is no head (first element), set the head to the new element.
		if self.head == None:
			self.head = e
		
		# Increment the size of the array
		self.size += 1
		
	# Get the value at the corresponding index
	def Get( self, index ):
		# Check for out of bounds condition
		if index > self.size - 1 or index < 0:
			return None
			
		# Step (linear) to the index position
		curr = self.head;
		for i in range( 0, index ):
			curr = curr.next
			
		return curr.value

	def Delete( self, index ):
		# Check for out of bounds condition
		if index > self.size - 1 or index < 0:
			return False;
		
		# Remove the head of the dynamic array
		if index == 0:
			# Set the head to the next head
			self.head = self.head.next;
			
			# If the array is now empty, set the tail to null
			self.size -= 1
			if self.size == 0:
				self.tail = None
			
			return True
		
		# Find the element at the specified index, and remember the element before it.
		curr = self.head
		prev = None
		for i in range( 0, index ):
			prev = curr
			curr = curr.next
		
		# Set the next pointer of the previous element to the next pointer of the current element,
		# thus dropping this element which is between them.
		prev.next = curr.next
		
		# We deleted the tail. Set the current tail to the previous element.
		self.size -= 1
		if self.size == index:
			self.tail = prev
			
		return True
		
	def Insert( self, index, value ):
		# Check for out of bounds condition
		if index > self.size - 1 or index < 0:
			return False
			
		# Adding to the tail
		if index == self.size-1:
			Add( value )
			return True
		
		# Find the element at the index
		curr = self.head
		for i in range( 0, index ):
			curr = curr.next

		# Insert (after) between the current element and the next
		e = Element( value )
		e.next = curr.next
		curr.next = e
		
		self.size += 1
		return True

# Base Class definition for k-ary tree
class Node:
	key = None	# node data	
	
	# constructor: set the node data
	def __init__( self, key ):
		self.key = key
	
	# Set the node data
	def Key( self, key ):
		self.key = key
	
	# Get the node data
	def GetKey( self ):
		return self.key

# Derived definition for a Binary Tree
class BinaryTree(Node):
	left  = None  # left binary subtree
	right = None  # right binary subtree

	# Constructor: set the node data and left/right subtrees to null
	def __init__( self, key ):
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
		return self.right
	
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
		
	# Calculate the maximum depth of the binary tree
	def MaxDepth( self, max ):
		max += 1   # increment by one level for the node
		
		lmax = max
		rmax = max # maximum depth on left and right nodes.
		
		# Calculate the maximum depth along the left binary subtree
		if self.GetLeft() != None:
			lmax = self.GetLeft().MaxDepth( max )
		# Calculate the maximum depth along the right binary subtree
		if self.GetRight() != None:
			rmax = self.GetRight().MaxDepth( max )
		
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
		if self.GetLeft() != None:
			lmin = self.GetLeft().MaxDepth( min )
		# Calculate the maximum depth along the right binary subtree
		if self.GetRight() != None:
			rmin = self.GetRight().MaxDepth( min )
		
		if lmin < rmin:
			return lmin
		else:
			return rmin
			
	# Calculate the minimum and maximum value in the binary tree
	def MinMax( self ):
		min = 2147483648  # counter for min value (start at maximum signed int)
		max = -2147483647 # counter for max value (start at minimum signed int)
			
		# list of nodes to visit in node level order
		visit = DynamicArray()	
		visit.Add( self )
		
		# sequentially visit each node in level order as it is dynamically added to the list
		i = 0
		while i < visit.Size():
			# Perform the node action
			if int( visit.Get( i ).GetKey() ) > int( max ):
				max = visit.Get( i ).GetKey()
			if int( visit.Get( i ).GetKey() ) < int( min ):
				min = visit.Get( i ).GetKey()
			
			# Add to the list the child siblings of this node
			if visit.Get( i ).GetLeft() != None:
				visit.Add( visit.Get( i ).GetLeft() )
			if visit.Get( i ).GetRight() != None:
				visit.Add( visit.Get( i ).GetRight() )
			i += 1
		
		return min, max

# Breadth First Search
def BFS( root ):
	# Check if tree is empty
	if root == None:
		return
			
	# list of nodes to visit in node level order
	visit = DynamicArray()
	visit.Add( root );
		
	# sequentially visit in node in level order as it is dynamically added to the list
	i = 0
	while i < visit.Size():
		# Perform the node action
		visit.Get( i ).Action()
			
		# Add to the list the child siblings of this node
		if visit.Get( i ).GetLeft() != None:
			visit.Add( visit.Get( i ).GetLeft() )
		if visit.Get( i ).GetRight() != None:
			visit.Add( visit.Get( i ).GetRight() )
		i += 1
		
tree = BinaryTree( "1" )
tree.Left ( BinaryTree( "2" ) )
tree.Right( BinaryTree( "3" ) )
tree.GetLeft().Left( BinaryTree( "4" ) )
tree.GetLeft().Right( BinaryTree( "5" ) )
print( "BFS output 1 2 3 4 5")
BFS( tree )
print("Max Depth(3) is  " + str( tree.MaxDepth( 0 ) ) )
print("Max Depth(2) is  " + str( tree.MinDepth( 0 ) ) )
min,max = tree.MinMax()
print("Min Value(1) is  " + str( min ) )
print("Max Value(5) is  " + str( max ) )