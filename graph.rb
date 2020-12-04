require_relative 'node.rb'
require_relative 'board.rb'
require_relative 'knight.rb'
require 'pry'

class Graph
  attr_accessor :vertices, :piece

  def initialize
    @vertices = []
    @piece = Knight.new
  end

  def add_vertex(data)
    vertices.push(Node.new(data))
  end

  def add_edge(start_node, end_node)
    start_node.neighbors.push(end_node)
  end

  def pretty_print
    @vertices.each do |vertex| 
      print vertex.data
      print ' Neighbors: '
      vertex.neighbors.each { |neighbor| print neighbor.data }
      puts ""
    end
  end

  def find_node(value)
    vertices.each do |node|
      if node.data == value
        return node
      end
    end
  end


  def shortest_path(start_node, end_node)
    queue = [start_node]
    dist = {}
    pred = {}
    path = []
    @vertices.each do |vertex|
      dist[vertex] = nil
      pred[vertex] = nil
    end
    dist[start_node] = 0
    current = nil
    until queue.empty?
      current = queue.shift
      break if current == end_node
      current.neighbors.each do |neighbor|
        unless pred.values.include?(neighbor)
          queue.push(neighbor)
          dist[neighbor] = dist[current] + 1
          pred[neighbor] = current
        end
      end
    end
    
    until current == start_node
      path.unshift(current.data)
      current = pred[current]
    end
    path.unshift(start_node.data)
    path


  end

end


g = Graph.new
b = Board.new(8)
b.board.each do |spot|
  g.add_vertex(spot)
end
g.vertices.each do |vertex_a|
  g.vertices.each do |vertex_b|
    g.add_edge(vertex_a, vertex_b) if g.piece.valid_move?(vertex_a.data, vertex_b.data)
  end
end

print g.shortest_path(g.find_node([1,1]), g.find_node([8,8]))


