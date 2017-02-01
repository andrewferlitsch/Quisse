# Definition for an Entry in the Hash Table (Dictionary)
class Entry:
	key = 0      # the key value
	value = None # the value for this key
	
	# Constructor
	def __init__( self, key,value ):
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

	# Comparator for checking if key matches this entry.
	def Compare( self, key ):
		return ( self.key == key )


# Definition for a Linear Probe Hashing Algorithm
class HashLP:
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
		# Linear probe the entries for an empty or matching slot.
		for ix in range( self.Index( key ), self.RANGE ):
			# there is no entry at this index, add the key/value
			if self.index[ ix ] == None:
				self.index[ ix ] = Entry( key, value )
				break
				
			# Entry found, update the value
			if self.index[ ix ].Compare( key ):
				self.index[ ix ].Value( value )
				break;
	
	# Get the value for the key
	def Get( self, key ):
		ix = self.Index( key )
		
		# Linear probe the entries for an empty or matching slot.
		for ix in range( self.Index( key ), self.RANGE ):
			# there is no entry at this index, return not found
			if self.index[ ix ] == None:
				return None
				
			# Entry found
			if self.index[ ix ].Compare( key ):
				return self.index[ ix ].GetValue();
	
		# not found
		return None

index = HashLP( 100 )
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
