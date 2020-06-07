


class GraphNode
    attr_accessor :val, :neighbors

    def initialize(val)
        @val = val
        @neighbors = []
    end

    def inspect
        @val
    end
end

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]

def bfs(starting_node, target_value)
    queue = [starting_node]
    visited = []
    until queue.empty?
        #p queue
        visited << queue.first
        return queue.first if queue.first.val == target_value
        queue.first.neighbors.each do |neighbor|
            if !visited.include?(neighbor)
                queue << neighbor
            end
        end
        p queue.first
        queue.shift
    end
end

p "--------"
p bfs(a,"d")
