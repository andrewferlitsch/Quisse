
# Definition for a Task element in a Queue
class Task:
	task = None   # the task to perform
	next = None   # the next element in the queue
	priority = 0  # the task's priority
	
	# constructor, task represents the task to be performed
	def __init__( self, task, priority ):
		self.task = task
		self.priority = priority
	
	# Get or Set the task's priority
	def Priority( self, priority = None ):
		if None == priority:
			return self.priority
		self.priority = priority
	
	# Get or Set the next task this element is chained to
	def Next( self, task = None ):
		if None == task:
			return self.next
		self.next = task

	# Action to take when task is processed
	def Action( self ):
		print( self.task )
		
# Definition for a Queue
class Queue:
	head = None
	tail = None
	
	# Check if Queue is empty
	def Empty( self ):
		if self.head == None:
			return True
		return False

	# Add a task to the queue
	def Add( self, task ):
		# the queue is empty, set head to the task
		if self.Empty():
			self.head = task
		# otherwise, insert the task into the queue according to the task's priority
		else:
			self.Insert( task )

	# Insert a task into the queue based on priority
	def Insert( self, task ):
		# Start at the head of the chain to search where to insert the task
		curr = self.head
		prev = self.head
		while curr != None:
			# Find a task who's priority is less than the new task
			if task.Priority() > curr.Priority():
				# Insert the task in front of the current task.
				task.Next( curr )
				
				# If inserting in front of the head of the queue, 
				# make the new task the head of the queue
				if curr == self.head:
					self.head = task
				# Otherwise, set the previous element's next to the new task
				else:
					prev.Next( task )
				break
			
			prev = curr;
			curr = curr.Next();
		
		# Add to the tail (end) of the queue
		if curr == None:
			prev.Next( task )
	
	# Remove the top of the queue and process the task
	def Pop( self ):
		# Queue is empty
		if self.Empty():
			return False
			
		# Process the task here
		self.head.Action()
		
		# Move the head to the next element.
		self.head = self.head.Next()
		if self.Empty():
			self.tail = None
		return True
			
	# Update the priority of the task and re-sort the queue
	def Update( self, task, priority ):
		# Update the task's priority
		task.Priority( priority );
		
		# If the task is the head of the queue, remove it and update head to the next element
		if self.head == task:
			self.head.Next( self.head.Next() )
		# Find the task in the queue
		else:
			curr = self.head.Next()
			prev = self.head;
			while curr != None:
				# Remove the task from the queue and update previous element's next to this task's next element
				if task == curr:
					prev.Next( curr.Next() );
					break;
		
		# Add the task back to the queue
		self.Add( task )

# Test Driver
print("Process in sequential order tasks: C, B and A" )
queue = Queue()
queue.Add( Task( "A", 1 ) )
queue.Add( Task( "B", 3 ) )
task =  Task( "C", 2 );
queue.Add( task );
queue.Update( task, 4 );
while queue.Pop():
	pass

