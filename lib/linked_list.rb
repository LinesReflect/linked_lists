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

  def size(current_node = @head, size = 1)
    return 0 if current_node.nil?
    return size if current_node.next_node.nil?

    size += 1
    size(current_node.next_node, size)
  end

  def tail(current_node = @head)
    return current_node if current_node.next_node.nil?
    return nil if current_node.nil?

    tail(current_node.next_node)
  end

  def at(index, current_node = @head, count = 0)
    return current_node if index == count
    return nil if current_node.next_node.nil?

    count += 1
    at(index, current_node.next_node, count)
  end

  def pop(current_node = @head)
    return nil if current_node.nil?
    return current_node.next_node = nil if current_node.next_node == tail

    pop(current_node.next_node)
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

  def to_s(current_node = @head, string = '')
    return string if current_node.nil?

    current_node == tail ? string += "#{current_node.value}" : string += "#{current_node.value} -> "
    to_s(current_node.next_node, string)
  end

  def insert_at(value, index, current_node = @head, idx = 0)
    return current_node = Node.new(value) if current_node.nil?

    if idx == index - 1
      old_node = current_node.next_node
      current_node.next_node = Node.new(value)
      current_node.next_node.next_node = old_node
      return
    end

    idx += 1
    insert_at(value, index, current_node.next_node, idx)
  end

  def remove_at(index, current_node = @head, idx = 0)
    return nil if current_node.nil?

    if idx == index - 1 && current_node.next_node == tail
      return current_node.next_node = nil
    elsif idx == index - 1
      new_node = current_node.next_node.next_node
      current_node.next_node = nil
      current_node.next_node = new_node
      return
    end

    idx += 1
    remove_at( index, current_node.next_node, idx)
  end
end
