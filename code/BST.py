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
				self.tail = null
			
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
	key = None # node data

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
	left  = None # left binary subtree
	right = None # right binary subtree

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
		return self.right;

	# Example action to perform on a node
	def Action( self ):
		print( self.GetKey() )

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
			if int( node.GetKey() ) ==  int( curr.GetKey() ):
				return
			
			# The node is less than the current node, traverse left
			if int( node.GetKey() )  < int( curr.GetKey() ):
				# If there is no left node, make this node the left node
				if curr.GetLeft() == None:
					curr.Left( node )
					return
				curr = curr.GetLeft()
			# The node is greater than to the current node, traverse left
			else:
				# If there is no right node, make this node the right node
				if curr.GetRight() == None:
					curr.Right( node )
					return
				curr = curr.GetRight()
		
	# Find a node in a binary tree
	def Find( self, key ):
			
		# Follow a path to find the node
		curr = self.root
		while True:
			# current node is null, return null (not found)
			if curr == None:
				return None
				
			# the value is equal to the current node, return the current node
			if int( key ) == int( curr.GetKey() ):
				return curr
			
			# The value is less than the current node, traverse left
			if int( key ) <  int( curr.GetKey() ):
				curr = curr.GetLeft()
			# The value is greater than to the current node, traverse left
			else:
				curr = curr.GetRight()
	
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
			if int( key ) == int( curr.GetKey() ):
				if isLeft:
					prev.Left( None )
				else:
					prev.Right( None )
				saveRoot = self.root;
				self.root = prev;
				if curr.GetLeft()  != None:
					self.Insert( curr.GetLeft() )
				if curr.GetRight() != None:
					self.Insert( curr.GetRight() )
				self.root = saveRoot
				return
			elif int( key ) < int( curr.GetKey() ):
				isLeft = True
				prev = curr
				curr = curr.GetLeft()
			else:
				isLeft = False
				prev = curr
				curr = curr.GetRight();
	
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
	
# Driver method
tree = BST()
tree.Insert( BinaryTree( 3 ) )
tree.Insert( BinaryTree( 6 ) )
tree.Insert( BinaryTree( 2 ) )
tree.Insert( BinaryTree( 4 ) )
tree.Insert( BinaryTree( 1 ) )
print("BST level order: 3 2 6 1 4")
BFS( tree.root )
print( "FIND(4) = " + str( tree.Find( 4 ).GetKey() ) + " FIND(1) = " + str( tree.Find( 1 ).GetKey() ) )
tree.Delete( 6 )
print("BST level order: 3 2 4 1")
BFS( tree.root )
