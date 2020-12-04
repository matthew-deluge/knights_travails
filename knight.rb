class Knight

  def initialize
  end

  def valid_move?(initial, final)
    first_diff = initial[0] - final[0]
    second_diff = initial[1] - final[1]
    if first_diff.abs == 2 && second_diff.abs == 1 || first_diff.abs == 1 && second_diff.abs == 2
      true
    else 
      false
    end 
  end
end
=begin
k = Knight.new
puts k.valid_move?([1,2],[2,1])
puts k.valid_move?([8,8],[7,6])
puts k.valid_move?([1,2],[8,8])
puts k.valid_move?([4,2],[5,5])
=end