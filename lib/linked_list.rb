require_relative 'node'

class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def append(value)
    if @head.nil? 
      @head = Node.new(value) 
    else
      last_node = @head
      last_node = last_node.next_node until last_node.next_node.nil?
      last_node.next_node = Node.new(value)
    end
  end

  def prepend(value)
    @head = Node.new(value, @head)
  end

  def size
    size = 0
    current_node = @head
    until current_node.nil?
      current_node = current_node.next_node
      size += 1
    end
    size
  end
end
