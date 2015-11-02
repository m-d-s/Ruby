class PriorityQueue
    #elements[0] holds dummy value to simplify algebra
    def initialize 
      @root = [nil]
    end
    
    def push element
      #add the new element to end of the array
      @root << element
      #ensure that priority queue properties are met
      up_heap(length)
    end
    
    def pop 
      if @root.size > 1
        #echange the highest and lowest priority elements
        exchange(1, length)
        #remove the highest priority element
        @root.pop
        #reorganize the tree to retain priority queue properites
        down_heap(1)
      end
    end

    def down_heap index
      #calculate children indexes
      left_child = 2 * index
      right_child = left_child + 1
      if left_child < length
        if @root[right_child] != nil
          #ensure that left child is the higher priority child
          @root[left_child] < @root[right_child] ? exchange(left_child, right_child) : nil
        end
        #ensure that the parent is the highest piority element of all three by transitive property
        if @root[left_child] >= @root[index]
          exchange(index, left_child)
          #traverse down the tree
          down_heap(left_child)
        end
      end
    end

    def up_heap index
      #calculate parent element index  
      parentIndex = (index / 2)
      #ensure that parent element is the highest priority element
      if index > 1 && @root[parentIndex] < @root[index]
        exchange(index, parentIndex)
        #traverse up the tree
        up_heap(parentIndex)
      end
    end

    def exchange source, dest
      @root[source], @root[dest] = @root[dest], @root[source]
    end
    
    def display
      @root.each { |elem| puts elem }
    end

    def length
      @root.size - 1 
    end
end

p = PriorityQueue.new
[4,5,1,3,6,7].each { |x| p.push(x) }
6.times { p.display; p.pop }



