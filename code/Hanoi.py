# Definition for a Disc element in a Stack (Tower)
class Disc:
	disc = None # the disc (size)
	next = None # the next disc in the stack

	# Constructor, disc represents the disc on the stack (tower)
	def __init__( self, disc ):
		self.disc = disc
	
	# Get or Set the next disc this element is stacked on top of
	def Next( self, disc = None ):
		if None == disc:
			return self.next
		self.next = disc
	
	# Action to take when task is processed
	def Action( self ):
		print( self.disc )

# Definition for a Stack (Tower)
class Stack:
	top = None	# top of the stack
	
	# Check if the Stack (tower) is empty
	def Empty( self ):
		if self.top == None:
			return True
		return False
	
	# Push the disc to the top of the stack
	def Push( self, disc ):
		# Set the disc next pointer to the current top (disc below)
		disc.Next( self.top )
		# set the top to this disc
		self.top = disc
	
	# Pop the disc from the top of the stack
	def Pop( self ):
		# Stack is Empty
		if self.Empty():
			return None
		
		disc = self.top	# the disc to pop from the stack
		
		# Move the top to the current top's next pointer (disc below).
		self.top = self.top.Next()
		return disc

# Definition for Towers of Hanoi
class Hanoi:
	towers = [None] * 3; # the three towers (poles)
	for i in range( 0, 3 ):
		towers[ i ] = Stack()
	
	# Print the disc stack on each tower
	def PrintTowers( self ):
		for i in range( 0, 3 ):
			print( "Tower " + str( i + 1 ) )
			while ( True ):
				disc = self.towers[ i ].Pop()
				if disc == None:
					break
				disc.Action()
	
	# Move a stack of discs from the start tower to end tower, using the intermediate tower
	# when the stack is more than one disc.
	def Move( self, ndiscs, start, intermediate, end ):
		# If the tower is empty, move the disc to the end tower (n==1)
		if ndiscs == 1:
			end.Push( start.Pop() )
		# Otherwise (n>1 case)
		else:
			# move the remainder of the tower to the intermediate tower 
			self.Move( ndiscs - 1, start, end, intermediate )
			# move the disc to the end tower
			end.Push( start.Pop() )
			# now move the remainder of the tower on the intermediate tower to the end tower
			self.Move( ndiscs - 1, intermediate, start, end );

# Stack disks on first tower in decreasing size ( 7 .. 1 )
hanoi = Hanoi()
for i in range( 7, 0, -1 ):
	hanoi.towers[ 0 ].Push( Disc( i ) );
hanoi.Move( 7, hanoi.towers[ 0 ], hanoi.towers[ 1 ], hanoi.towers[ 2 ] )
hanoi.PrintTowers()
