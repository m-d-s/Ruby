require 'pry'

class PriorityQueue
    def initialize 
        @elements = [nil]
    end

    def << (element)
        @elements << element
        up_heap(@elements.size - 1)
    end

    def pop 
        return if @elements.size < 2
        exchange(1, @elements.size - 1)
        @elements.pop
        down_heap(1)
    end

    def down_heap(index)
        leftChild = 2 * index
        rightChild = leftChild + 1
        return if leftChild > (@elements.size - 1)

        if @elements[rightChild] != nil
            exchange(leftChild, right) if @elements[leftChild] < @elements[rightChild]
        end

        return if @elements[leftChild] < @elements[index]
        
        exchange(index, leftChild)
        down_heap(leftChild)
    end

    def up_heap(index)
        parentIndex = (index / 2)
        
        return if index <= 1
        return if @elements[parentIndex] >= @elements[index]

        exchange(index, parentIndex)
        up_heap(parentIndex)
    end

    def exchange(source, dest)
        @elements[source], @elements[dest] = @elements[dest], @elements[source]
    end
    
    def display
        @elements.each { |elem| puts elem }
    end
end

h = PriorityQueue.new

h << 4

h << 5

h << 1

h.display

h.pop

h.display
