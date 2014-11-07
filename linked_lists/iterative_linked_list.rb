require 'pry'

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

  def delete(info)

  end

  def pop
    if head
      current_node = head
      if current_node.next == nil
        info = current_node.info
        self.head = nil
        info
      else
        while current_node.next.next != nil
          if current_node.next == nil
            current_node
          else
            current_node = current_node.next
          end
        end
         last_info = current_node.next.info
         current_node.next = nil
         last_info
      end
    else
      nil
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
  attr_accessor :next, :info

  def initialize(info)
    @info = info
  end
end
