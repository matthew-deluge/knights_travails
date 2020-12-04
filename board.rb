# creates a chess board as an array of coordinates based on the passed side length
# typical chess board has eight sides
class Board
  attr_accessor :board

  def initialize(n)
    @board = create_board(n)
  end
    
  def create_board(n)
    a = Array.new(n) { |index| index + 1  }
    board = []
    a.each do |i|
      a.each do |j|
        board.push([i, j])
      end
    end
    board
  end

end
