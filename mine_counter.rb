  class MineCounter
    # cell adjacents directions
    DIRECTIONS = [[-1, -1], [-1, 0], [-1, 1], [0, -1], [0, 1], [1, -1], [1, 0], [1, 1]]
  
    def initialize(board)
        @board = board
    end
    
    # Method responsible to check if there is any (*) which is a mine, in all adjacents cells
    def count_adjacent_mines(y, x)
        count = 0
        DIRECTIONS.each do |dy, dx|
        ny, nx = y + dy, x + dx
        if ny.between?(0, @board.height - 1) && nx.between?(0, @board.width - 1) && @board.cell_value(ny, nx) == '*'
            count += 1
        end
      end
        count
    end
  end