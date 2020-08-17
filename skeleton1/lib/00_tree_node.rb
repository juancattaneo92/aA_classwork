class PolyTreeNode
    attr_reader :parent, :children, :value

    def initialize(value)
        @value = value 
        @parent = nil
        @children = []
    end

    def parent=(node1)
        unless @parent.nil?
        @parent.children.delete(self)  # old parent 
    end
       @parent = node1 #node1 is our new parent

     unless node1.nil? # && node1.children.include?(self) 
        node1.children << self
      end
    end

    def add_child(node1)
        node1.parent = self
    end

    def remove_child(node1)
        node1.parent = nil
        raise 'error' if node1.parent == nil 
    end

    def dfs(target_val) # target_val is 2
        # self is 2
      return self if target_val == self.value #self.value == nil
    
      self.children.each do |child| #child = 2
        result = child.dfs(target_val) #2 

        if result != nil
            return result
        end

      end

      return nil 
    end


    def bfs(target_val)
    new_arr = [self]
    until new_arr.empty?

        current = new_arr.shift
        return current if current.value == target_val

        current.children.each do |child|
            new_arr << child
        end
    end

        nil
    end
end




# def bfs (val)

# queue = Myqqueue.new
# queue.unqueue(self)
# until queue.empty?
#     current_node = queue.unqueue
#     return current_node if current_node.value == val 
#     current_node.children.each do |child|
#     queue.enqueue(child)
# end
# end
# nil 
# end 

# *enqueue(el)
# arr << el
# *unshift
#add node to the queue (array)
#loop until no nodes left/queue empty?
# dequee from node check val of node if == val
#return node if matches 
#add node children to queue (array)
#return nil

#           1

#       2       3

#     4 5       6 7

# node2.parent = node1
# node3.parent = node1
# main_node.parent = node.value

# n1 = PolyTreeNode.new("root1")
# n2 = PolyTreeNode.new("root2")
# n3 = PolyTreeNode.new("root3")