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
			
			# If the array is now empty, set the tail to none
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
		
		
# Definition for a Stack
class Stack:
	top = None   # top of the stack
	
	# Check if the Stack is empty
	def Empty(self):
		if self.top == None:
			return True
		return False
	
	# Push the task to the top of the stack
	def Push( self, task ):
		# Set the task next pointer to the current top
		task.Next( self.top )
		# Set the top to this task
		self.top = task
	
	# Pop the task from the top of the stack
	def Pop( self ):
		# Stack is Empty
		if self.Empty():
			return
		
		# Move the top to the current top's next pointer.
		pop = self.top
		self.top = self.top.GetNext()
		return pop
		
# Definition for a node in a graph
class Node:
	# Visit State
	UNVISITED = 0  # not visited or on frontier (while)
	FRONTIER  = 1  # on frontier, waiting to be visited (gray)
	VISITED   = 2  # visited (black)
	
	key = None                  # node data
	neighbors = DynamicArray()	# list of neighboring nodes (vertices)
	visited = UNVISITED         # node has been visited
	
	# constructor
	def __init__( self, key ):
		self.key = key
	
	# Get the Key
	def GetKey( self ):
		return self.key
	
	# Add a neighbor to this node
	def Neighbor( self, neighbor ):
		# list the node as a neighbor of this node
		self.neighbors.Add( neighbor )
		
		# ist this node as a neighbor of the node
		neighbor.neighbors.Add( self )
	
	# Get the nodes neighbors
	def GetNeighbors( self ):
		return self.neighbors
	
	# Set the node visit 
	def Visited( self, visited ):
		self.visited = visited
	
	# Get whether the node has been visited
	def GetVisited( self ):
		return self.visited
		
	next = None
	def GetNext( self ):
		return self.next

	def Next( self, next ):
		self.next = next
				
# Breadth first search of a graph
def BFS( root ):
	# Create a queue for frontier nodes (nodes to be visited next)
	frontier = DynamicArray()
		
	# Add the root node to the frontier
	frontier.Add( root )
	root.Visited( root.FRONTIER )
		
	# Traverse each node in the frontier list
	while frontier.Size() != 0:
		# visit the next node
		visit = frontier.Get( 0 )
		frontier.Delete( 0 )
		visit.Visited( visit.VISITED )
		print( visit.GetKey() )
			
		# Add the node's neighbors (if not visited and not on frontier list) 
		# to the frontier list
		nodes = visit.GetNeighbors()
		for i in range( 0, nodes.Size() ):
			node = nodes.Get( i )
			if node.GetVisited() == node.UNVISITED:
				frontier.Add( node )
				node.Visited( node.FRONTIER )

# Depth first search of a graph (Iterative)
def DFS( root ):
	# Create a stack for frontier nodes (nodes to be visited next)
	frontier = Stack();
		
	# Add the root node to the frontier
	frontier.Push( root )
	root.Visited( root.FRONTIER )
		
	# Traverse each node in the frontier list
	while frontier.Empty() == False:
		# visit the next node
		visit = frontier.Pop()
		visit.Visited( visit.VISITED );
		print( visit.GetKey() )
			
		# Add the node's neighbors (if not visited and not on frontier list) 
		# to the frontier list
		nodes = visit.GetNeighbors()
		for i in range( 0, nodes.Size() ):
			node = nodes.Get( i )
			if node.GetVisited() == node.UNVISITED:
				frontier.Push( node )
				node.Visited( node.FRONTIER )

# Depth first search of a graph (Recursive)
def DFSR( root ):
	if root == None:
		return
		
	# mark the node as visited
	root.Visited( root.VISITED )
	print( root.GetKey() )
		
	# Recursively visit each unvisited neighbor
	nodes = root.GetNeighbors()
	for i in range( 0, nodes.Size() ):
		node = nodes.Get( i )
		if node.GetVisited() == node.UNVISITED:
			DFSR( node )
	
nodes = [None] * 6;
for i in range( 0, 6 ):
	nodes[ i ] = Node( i )
nodes[ 0 ].Neighbor( nodes[ 1 ] )
nodes[ 0 ].Neighbor( nodes[ 2 ] )
nodes[ 0 ].Neighbor( nodes[ 3 ] )
nodes[ 1 ].Neighbor( nodes[ 2 ] )
nodes[ 1 ].Neighbor( nodes[ 3 ] )
nodes[ 3 ].Neighbor( nodes[ 4 ] )
nodes[ 3 ].Neighbor( nodes[ 5 ] )
nodes[ 4 ].Neighbor( nodes[ 5 ] )
BFS( nodes[ 0 ] )
for i in range( 0, 6 ):
	nodes[ i ].Visited( nodes[ i ].UNVISITED )
DFS( nodes[ 0 ] )
for i in range( 0, 6 ):
	nodes[ i ].Visited( nodes[ i ].UNVISITED )
DFSR( nodes[ 0 ] )