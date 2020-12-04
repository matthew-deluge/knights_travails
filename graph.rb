require_relative 'node.rb'
require_relative 'board.rb'
require_relative 'knight.rb'
require 'pry'

class Graph
  attr_accessor :vertices, :piece

  def initialize
    @vertices = []
    @piece = Knight.new
    populate_vertices
    populate_moveset
  end

  def add_vertex(data)
    vertices.push(Node.new(data))
  end

  def add_edge(start_node, end_node)
    start_node.neighbors.push(end_node)
  end

  def populate_vertices
    b = Board.new(8)
    b.board.each { |spot| add_vertex(spot) }
  end

  def populate_moveset
    @vertices.each do |vertex_a|
      @vertices.each do |vertex_b|
      add_edge(vertex_a, vertex_b) if @piece.valid_move?(vertex_a.data, vertex_b.data)
      end
    end
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
    vertices.each { |node| return node if node.data == value }
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
    until queue.empty?
      current = queue.shift
      break if current == end_node

      current.neighbors.each do |neighbor|
        next if pred.values.include?(neighbor)
          queue.push(neighbor)
          dist[neighbor] = dist[current] + 1
          pred[neighbor] = current
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


