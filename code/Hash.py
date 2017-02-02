# Definition for an Entry in the Hash Table (Dictionary)
class Entry:
	key = 0      # the key value
	value = None # the value for this key
	next  = None # the next entry at this range
	
	# Constructor
	def __init__( self, key, value ):
		self.key   = key
		self.value = value
	 
	# Get the key
	def GetKey( self ):
		return self.key
	
	# Accessors for setting and getting the value of the entry
	def GetValue( self ):
		return self.value
	
	def Value( self, value ):
		self.value = value

	# Accessors for setting and getting the next entry on the chain
	def GetNext( self ):
		return self.next

	def Next( self, next ):
		self.next = next

	# Comparator for checking if key matches this entry.
	def Compare( self, key ):
		return ( self.key == key )


# Definition for a Modulo based Hashing Algorithm
class Hash:
	RANGE = 0    # the range of the index.
	index = []   # the index
	
	# constructor
	def __init__( self, range ):
		# set the index range and allocate the index
		self.RANGE = range
		self.index = [None] * self.RANGE
	 
	# Map the key into an index within the set range
	def Index( self, key ):
		return key % self.RANGE
	
	# Add a key/value entry to the index
	def Add( self, key, value ):
		ix = self.Index( key )
		
		# there is no entry at this index, add the key/value
		if self.index[ ix ] == None:
			self.index[ ix ] = Entry( key, value )
		else:
			# See if the key already exists in the chain
			next = self.index[ ix ]
			while next != None:
				# Entry found, update the value
				if next.Compare( key ):
					next.Value( value )
					break
				next = next.GetNext()
			
			# no entry found, add one
			if next == None:
				# Add the entry to the front of the chain
				add = Entry( key, value )
				add.Next( self.index[ ix ] )
				self.index[ ix ] = add
	
	# Get the value for the key
	def Get( self, key ):
		ix = self.Index( key )
		
		# See if the key exists in the chain at this entry in the index
		next = self.index[ ix ]
		while next != None:
			# Entry found, update the value
			if next.Compare( key ):
				return next.GetValue()
			next = next.GetNext()
	
		# not found
		return None

index = Hash( 100 )
index.Add( 17,   100 )
index.Add( 117,  600 ) # this will cause a collision
index.Add( 228,  300 )
index.Add( 675,  400 )
index.Add( 2298, 500 )
index.Add( 117,  200 ) # this will cause an update
print( index.Get( 17 ) )
print( index.Get( 117 ) )
print( index.Get( 228 ) )
print( index.Get( 675 ) )
print( index.Get( 2298 ) )
