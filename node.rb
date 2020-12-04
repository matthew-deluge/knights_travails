# creates the node which is used to store positions and potential moves
class Node
  attr_accessor :data, :neighbors

  def initialize(value)
    @data = value
    @neighbors = []
  end

end
