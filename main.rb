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


knight_moves([1, 1], [8, 8])
knight_moves([5, 6], [6, 5])
knight_moves([7, 8], [6, 6])


