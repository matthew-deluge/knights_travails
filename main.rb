#Create an array using permutations (8x8)
require 'pry'



=begin
  def knight_moves(initial, final, searched_array = [], move_array = [], queue = [])
    search_index = @board.index(initial)
    return final if @graph[search_index].include?(final)
    
    @graph[search_index].each do |potential_move|
      next if searched_array.include?(potential_move)
      queue.push(potential_move)
    end
    # binding.pry
    searched_array.push(initial)
    next_up = queue.shift
    move_array.unshift(knight_moves(next_up, final, searched_array, move_array, queue))
    move_array.unshift(initial) if move_array.include?(final)
    move_array
  end

end






knight = Knight.new
print knight.knight_moves([2,1],[1,1])

=end
