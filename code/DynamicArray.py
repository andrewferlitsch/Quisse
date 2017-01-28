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
		
array = DynamicArray()
array.Add(1)
array.Add(3)
array.Add(4)
array.Insert(0,2)
for i in range( 0, array.Size() ):
	item = array.Get(i)
	print( item )
array.Delete(3)
for i in range( 0, array.Size() ):
	item = array.Get(i)
	print( item )