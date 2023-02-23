require_relative 'node'

class LinkedList
  def initialize()
    @head = nil
  end

  def append(value)
    @head ? [@head = Node.new(value), @head.next_node = @head] : @head = Node.new(value)
  end
end
