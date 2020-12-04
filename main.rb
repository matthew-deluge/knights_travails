require_relative 'graph.rb'
require_relative 'node.rb'
require_relative 'knight.rb'
require_relative 'board.rb'

def knight_moves(start, finish)
  g = Graph.new
  move_array = g.shortest_path(g.find_node(start), g.find_node(finish))
  puts "You made it in #{move_array.length-1} moves! Here is your path:"
  move_array.each { |move| print " #{move}\n" }
end


knight_moves([1, 1], [2, 3])
knight_moves([1, 1], [4, 4])
knight_moves([4, 4], [1, 1])


