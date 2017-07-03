# Definition for a Task element in a Stack
class Task:
	task = None  # the task to perform
	next = None  # the next task in the stack
	prev = None  # the previous task in the stack

	# constructor, task represents the task to be performed
	def __init__( self, task ):
		self.task = task
	
	# Get or Set the next task this element is chained to
	def Next( self, task = None ):
		if task == None:
			return self.next
		self.next = task
		
	# Get or Set the previous task this element is chained to
	def Prev( self, task = None ):
		if task == None:
			return self.prev
		self.prev = task
	
	# Action to take when task is processed
	def Action( self ):
		print( self.task )

# Definition for a Stack Chain
class StackChain:
	top    = None # top of the 
	bottom = None # bottom of the stack
	max    = 0    # maximum size of the stack
	size   = 0    # size of the stack
	chain  = None # next stack in the chain
	
	# Constructor: instantiate a stack in a chain, specifying the maximum size of the stack.
	def __init__( self, max ):
		self.max = max
	
	# Check if the Stack is empty
	def Empty( self ):
		if self.top == None:
			return True
		return False
	
	# Push the task to the top of the stack
	def Push( self, task ):
		# Set the task next pointer to the current top
		task.Next( self.top )
		
		# Chain the current top back to the task
		if self.top != None:
			self.top.Prev( task )

		# Set the top to this task
		self.top = task
		
		# only element on the stack, set the bottom to the top
		self.size += 1
		if self.size == 1:
			self.bottom = self.top
			
		# overflowed the maximum size of the stack
		if self.size > self.max:
			# Create a new stack in the chain of the same maximum size
			if self.chain == None:
				self.chain = StackChain( self.max )
			
			# Push the bottom of this stack onto the top of the next stack in the chain
			self.chain.Push( self.bottom )
			
			# Remove the bottom by setting the bottom to the previous element from the bottom
			self.bottom = self.bottom.Prev()
	
	# Pop the task from the top of the stack
	def Pop( self ):
		# Stack is Empty
		if self.Empty():
			return 

		# The task that is being popped from the stack
		task = self.top
		
		# Stack is empty
		self.size -= 1
		if self.size == 0:
			self.top = self.bottom = None
		else:
			# Move the top to the current top's next pointer.
			self.top = self.top.Next()
			
			# There is a another stack chained to this stack
			if self.chain != None:
				# Pop the top of the stack chained to this stack
				move = self.chain.Pop()
				
				# Add this task to the bottom of the stack
				self.bottom.Next( move )
				# Set the task's next to null
				task.Next( None )
				# Set the task as the new bottom of the stack
				self.bottom = move
				
				# If the stack chained to this one is empty, set the chain pointer to null
				if self.chain.Empty():
					self.chain = None
			
		# return the task that was popped
		return task

print("Process tasks in order: 6, 5, 4, 3, 2, 1, 0" )
stack = StackChain( 3 );
for i in range( 0, 7 ):
	stack.Push( Task( i ) )
for i in range( 0, 7 ):
	stack.Pop().Action()