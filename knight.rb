# creates a knight piece. Contains important "valid_move?" function
# this is otherwise mostly a skeleton to be filled in when I make the full-fledged chess game
class Knight

  def initialize; end

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
