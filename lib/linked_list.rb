require_relative 'node'

class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def append(value)
    @head.nil? ? @head = Node.new(value) : tail.next_node = Node.new(value)
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

  def tail
    last_node = @head
    last_node = last_node.next_node until last_node.next_node.nil?
    last_node
  end

  def at(index)
    current_node = @head
    i = 0
    while i < index
      current_node = current_node.next_node
      i += 1
    end
    current_node
  end

  def contains?(value, current_node = @head)
    return true if current_node.value == value
    return false if current_node.next_node.nil?

    contains?(value, current_node.next_node)
  end

  def to_s
    current_node = @head
    string = ''
    until current_node.nil?
      current_node.next_node.nil? ? string += "#{current_node.value}" : string += "#{current_node.value} -> "
      current_node = current_node.next_node
    end
    string
  end
end
