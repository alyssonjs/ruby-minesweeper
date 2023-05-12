require_relative 'mine_counter'
require_relative 'minesweeper_board'

class Board
  def initialize(inp)
    @board = MinesweeperBoard.new(inp)
    @mine_counter = MineCounter.new(@board)
  end

  def self.transform(inp)
      new(inp).transform
  end

  # Not aproud of it but couldn't find a better way
  def transform
      (1...@board.height - 1).each do |y|
        (1...@board.width - 1).each do |x|
          if @board.cell_value(y, x) != '*'
            count = @mine_counter.count_adjacent_mines(y, x)
            @board.update_cell(y, x, count == 0 ? ' ' : count.to_s)
          end
        end
      end
      output_board
  end
  
  def output_board
      @board.formatted_board
  end
end
