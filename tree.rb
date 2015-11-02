class Tree
    attr_accessor :children, :node_name

    def initialize(name, children = {})
        @node_name = name
        @children = children
    end

    def visit_all(&block)
        visit &block
        children.each {|c| c.visit_all &block}
    end

    def visit(&block)
        block.call self
    end
end

ruby_tree = Tree.new("grandpa", { 'dad' => { 'child1' => {}, 'child2' => {} }, 'uncle' =>
                                    { 'child3' => {}, 'child2' => {} }
                                })

puts "visiting a node"
ruby_tree.visit {|node| puts node.children[node.node_name] }
puts

puts "visiting the entire tree"
ruby_tree.visit_all {|node| puts node.children[node.node_name] }
                     
