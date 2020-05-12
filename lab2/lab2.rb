require "test/unit"

class Node
    def initialize(value)
        @value = value
        @left = nil
        @right = nil
    end

    attr_accessor :value, :left, :right
end

class BST
    def initialize(node)
        @root = node
        @size = 0
    end

    attr_reader :size
    
end

class BST_Test < Test::Unit::TestCase
    def test_node
        node = Node.new("abc")
        assert_equal("abc", node.value)
    end

    def test_BST
        node = Node.new("abc")
        bst = BST.new(node)
        assert_equal(0, bst.size)
    end
end
