class IterativeLinkedList

  attr_accessor :head

  def count
    if head
      recursive_counter(head, 1)
    else
      0
    end
  end

  def recursive_counter(node, i)
    if next_node = node.next
      recursive_counter(next_node, i + 1)
    else
      i
    end
  end

  def push(info)
    if head.nil?
      self.head = Node.new(info)
    else
      current_node = head
      while current_node.next != nil
        current_node = current_node.next
      end
      current_node.next = Node.new(info)
    end
  end

end

class Node
  attr_accessor :next

  def initialize(info)
    @info = info
  end
end
