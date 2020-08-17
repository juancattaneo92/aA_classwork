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



