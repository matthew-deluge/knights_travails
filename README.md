# Knights Travails

A function that takes two coordinates on an 8x8 chessboard (in [x, y] format, where x and y are the corresponding row and column numbers) and returns the list of moves that will get a knight piece from the first coordinate to the second coordinate the fastest. It was written as a project for [The Odin Project](https://www.theodinproject.com/lessons/knights-travails)

## Use

The function can be passes any two sets of two numbers, as long as they are potential locations on an 8X8 chessboard. For example, [1, 3] would be the square in the first row, third column (where a white bishop starts in a standard game of chess).

When two coordinates are passed to the method, it will return a list of moves in the same format, showing the fastest route a knight can take to get from the first square to the second square.

    > knight_moves([1, 1], [8, 8])
    > You made it in 6 moves! Here is your path:
      [1, 1]
      [3, 2]
      [5, 3]
      [7, 4]
      [8, 6]
      [6, 7]
      [8, 8]
    > knight_moves([5, 6], [6, 5])
    > You made it in 2 moves! Here is your path:
      [5, 6]
      [7, 7]
      [6, 5]

## Structure

**Note:** If you are working on this project for Odin Project, I would not read the next two sections until you have tried to work everything out on your own. I definitely used resources online (I read multiple articles about [Dijkstra's Algorithm](https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm) and I still do not understand it) but I think reading about the different algorithms and then actually trying to implement them in Ruby are different things, the equivalent between studying for the test and just looking up the answers for it. **End Note**

The program itself uses several classes to set up the list of possible moves for the knight. Several of these classes were created with an eye towards expanding them for a full-fledged chess game in the future

- The Board class which creates the list of coordinates on an 8x8 board, 
- The Node class which, for each coordinate, stores a list of coordinates the knight can move to in one turn
- The Knight class which stores the formula for determining if a move is valid (i.e the absolute value of the difference between the two moves must be either [1, 2] or [2, 1])
- The Graph class which creates an adjacency list of all of the moves, and the search algorithm that returns the shortest path

## Search Algorithm

While making a graph to structure the possible moves made sense pretty quickly, it took longer to figure out how to apply BFS search to it. Initially I tried to implement it recursively, but once I figured out (with a lot of help from [Geeks for Geeks](https://www.geeksforgeeks.org/graph-and-its-representations/)) that there needed to be multiple hashes and arrays that are being modified I found it easier to implement it through iteration.

The Graph class methods #populate_moveset and #populate_vertices take care of making the actual adjacency list, which is an array of nodes that have within them an array list of their neighbor nodes. 

The method #shortest_path first creates a queue array with the starting position in the 0 index; an empty hash for predecessors; and an empty array to be filled with the eventual path.

    def shortest_path(start_node, end_node)
    queue = [start_node]
    pred = {}
    path = []

It then adds a key for each vertex to the predecessors hashes, with values set initially to nil.

    def shortest_path(start_node, end_node)
    ...
      @vertices.each do |vertex|
            pred[vertex] = nil
          end

Then, it begins looping through the queue. The node at the front of the queue is shifted into being the current node being searched. If this is the node you are looking for, great! If not, it then adds each neighbor (or each square a knight piece could move to from that starting square) to the queue. It then sets the predecessor hash value of that neighbor node's key to be the current node. This ties the two nodes together, which later allows the path to be traced back. On further iterations (i.e. once you are looking at the neighbors of the neighbors of the starting node), the iteration will skip over any nodes that appear in the predecessor list. Otherwise the search would go on infinitely.

    def shortest_path(start_node, end_node)
    ...
      until queue.empty?
        current = queue.shift
        break if current == end_node

        current.neighbors.each do |neighbor|
          next if pred.values.include?(neighbor)
          queue.push(neighbor)
          pred[neighbor] = current
        end
      end

Finally, once the end_node is found, the queue loop is broken. The method then uses the predecessor list to re-trace the path by looking at the end_node's predecessor, then that node's predecessor, etc. These values are unshifted into the path array, which returns (after adding the initial position, of course.)

    def shortest_path(start_node, end_node)
    ...
      until current == start_node
            path.unshift(current.data)
            current = pred[current]
          end
          path.unshift(start_node.data)
          path
        end

This info is taken and printed out nicely by the #knight_moves function itself, but most of the heavy lifting is done by this method.


## For the Future

One thing I am going to do at a later date is clean up the #shortest_path method, probably by breaking into 2-3 smaller methods. The path tracing portion can definitely be its own method, at the very least, and a few of the loops can be one line.