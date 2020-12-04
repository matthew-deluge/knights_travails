
class Node
  attr_accessor :data, :neighbors

  def initialize(value)
    @data = value
    @neighbors = []
  end

end
=begin
n = Node.new(1)
puts n.data
=end