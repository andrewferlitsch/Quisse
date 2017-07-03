# Base (Super) class definition for a k-ary tree
class Node:
	# Constructor: set the node data
	def __init__(self, key):
		self.key   = key	# node data

	# Set or Get Node Data
	def Key( self, key = None ):
		if None == key:
			return self.key
		self.key = key

	# Action to perform on a node	
	def Action(node):
		raise NotImplementedError("Please Implement this method")

class BinaryTree(Node):
	# Constructor: set the node data and left/right subtrees to null
	def __init__(self, key):
		Node.__init__(self, key)
		self.left  = None	# left binary subtree
		self.right = None	# right binary subtree

	# Get ot Set Left Binary Subtree
	def Left( self, left = None ):
		if None == left:
			return self.left
		self.left = left

	# Set Right Binary Subtree
	def Right( self, right = None ):
		if None == right:
			return self.right
		self.right = right
	
	# Example action to perform on a node
	def Action(self, node):
		print( node.key)

	#InOrder Traversal
	def InOrder(self, root):
		if root == None:
			return
		self.InOrder( root.left )
		self.Action( root )
		self.InOrder( root.right )
		
	# PreOrder Traversal
	def PreOrder(self, root):
		if root == None:
			return
		self.Action( root )
		self.PreOrder( root.left )
		self.PreOrder( root.right )

	# PostOrder Traversal
	def PostOrder(self, root):
		if root == None:
			return
		self.PreOrder( root.left )
		self.PreOrder( root.right )
		self.Action( root )

# Test Driver code
root = BinaryTree(1)
root.left      = BinaryTree(2)
root.right     = BinaryTree(3)
root.left.left  = BinaryTree(4)
root.left.right  = BinaryTree(5)
print("Preorder traversal of binary tree is")
root.PreOrder( root )
 
print("Inorder traversal of binary tree is")
root.InOrder( root )
 
print("Postorder traversal of binary tree is")
root.PostOrder( root )
 

		