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

  def at(index, current_node = @head, count = 0)
    return current_node if index == count
    return nil if current_node.next_node.nil?

    count += 1
    at(index, current_node.next_node, count)
  end

  def contains?(value, current_node = @head)
    return true if current_node.value == value
    return false if current_node.next_node.nil?

    contains?(value, current_node.next_node)
  end

  def find(value, current_node = @head, index = 0)
    return index if current_node.value == value
    return nil if current_node.next_node.nil?

    index += 1
    find(value, current_node.next_node, index)
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
