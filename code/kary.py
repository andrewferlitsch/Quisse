

# Base (Super) class definition for a k-ary tree
class KNode:
	key = None # node data
	k = 0      # max number of children
	
	# Dynamic array for children
	children = []
	
	# constructor: set the node data
	def __init__ ( self, k, key ):
		self.key = key
		self.k   = k
	
	# Get or Set the node data
	def Key( self, key = None ):
		if None == key:
			return self.key
		self.key = key
	
	# Get the number of children
	def Size( self ):
		return len( self.children )
	
	# Add another child (branch)
	def Add( self, key ):
		# exceeds number of allowed children
		if Size() == self.k:
			return None
		e = Tree( self.k, key )
		self.children.append( e )
		return e
	
	# Get all the children of this node
	def Children( self ):
		return this.children

# Definition for a k-ary tree
class Tree(KNode):
	def __init__( self, k, key ):
		KNode.__init__( k, key )
	
	def Action( self ):
		self # do something
