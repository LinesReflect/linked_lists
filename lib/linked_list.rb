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
      while(!last_node.next_node.nil?)
        last_node = last_node.next_node
      end
      last_node.next_node = Node.new(value)
    end
  end

  def prepend(value)
    @head ? [@head = Node.new(value), @head.next_node = @head] : @head = Node.new(value)
  end
end
