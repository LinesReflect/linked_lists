require_relative 'node'

class LinkedList
  attr_accessor :head

  def initialize()
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
    @head ? [@head = Node.new(value), @head.next_node = @head] : @head = Node.new(value)
  end
end
