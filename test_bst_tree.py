""" Node is defined as
class node:
    def __init__(self, data):
        self.data = data
        self.left = None
        self.right = None
"""
##########################ATTEMPT ONE ------------- FAIL
is_bst = 1
def checkBST(root):
    global is_bst
    vals = []
    allVals = []
    allVals.append(root.data)
    def recurse(root):
        global is_bst
        # for checking values
        vals.append([root.data, root.left.data, root.right.data])
        # for checking duplicates
        allVals.append(root.left.data)
        allVals.append(root.right.data)
        if root.right.data <= root.data or root.left.data >= root.data:
            is_bst = 0
        if root.right.right and root.left.left:
            recurse(root.left)
            recurse(root.right)
    def checkArrays():
        global is_bst
        # loop through the list of Tree Arrays
        for topIndex, topValue in enumerate(vals):
            countDown = topIndex - 1
            compareItems(topValue[0], topValue[1], topValue[2])
            # for each sub-list, count down to zero from the current index
            # during the count down, we inspect the left & right of the root node data
            # then, as the count goes down, we compare the left and right to all previous root nodes
            # while countDown >= 0:
            #    compareItems(vals[countDown][0], topValue[1], topValue[2])
            #    countDown = countDown - 1
                    
    def compareItems(_root, _left, _right):
        global is_bst
        # print(str(_right)+ " > " + str(_root) + " > " + str(_left))
        if not _right > _root or not _left < _root:
            is_bst = 0
        
    recurse(root)
    checkArrays()
    # check for duplicates
    if len(allVals) != len(set(allVals)):
        is_bst = 0
    return is_bst
   
####################################################################### ATTEMPT TWO - LOOKUP - PASS
def checkBST(root):
    
    def recurse(root, _mins, _maxs):

        if root.data <= _mins:
            return False
           
        if root.data >= _maxs:
            return False
            
        left_ok = True
        right_ok = True
        
        if root.left is not None:
            left_ok = recurse(root.left, _mins, root.data)
        if root.right is not None:
            right_ok = recurse(root.right, root.data, _maxs)
         
        return left_ok and right_ok

    return recurse(root, float('-inf'),float('inf'))
  
