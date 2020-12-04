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

#b = Board.new(8)
#print b.board