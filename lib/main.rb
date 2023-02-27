require_relative 'linked_list'
require_relative 'node'

list = LinkedList.new

list.append(2)
list.append(3)
list.append(4)
list.append(5)
list.append(6)
list.append(7)
list.append(8)
list.append(9)
list.append(10)

list.prepend(1)

puts list.to_s

puts "Size: #{list.size}"

puts "Head: #{list.head.value}"

puts "Tail: #{list.tail.value}"

puts "At index 9: #{list.at(9).value}"

list.pop
puts "Pop List: #{list.to_s}"

puts "Contains 7?: #{list.contains?(7)}"

puts "Find 3: Index #{list.find(3)}"

list.insert_at(7.5, 7)

list.remove_at(3)

puts list.to_s