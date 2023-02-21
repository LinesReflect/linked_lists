class Node
  attr_accessor :value, :next_node

  def initialize(value = null, next_node = null)
    @value = value
    @next_node = next_node
  end
end
