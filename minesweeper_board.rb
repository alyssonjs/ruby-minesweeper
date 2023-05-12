class MinesweeperBoard
    attr_reader :board, :height, :width
  
    def initialize(board)
      raise ArgumentError, "Invalid input format" unless valid_input?(board)

      @board = board.map { |row| row.chars }
      @height = @board.length
      @width = @board[0].length
    end
  
    def update_cell(y, x, value)
      @board[y][x] = value
    end
  
    def cell_value(y, x)
      @board[y][x]
    end
  
    def formatted_board
      @board.map do |row|
        row.map { |cell| cell == '0' ? ' ' : cell }.join
      end
    end

    private

    def valid_input?(board)
        row_length = board[0].length
        return false unless board.all? { |row| row.length == row_length }
    
        valid_horizontal_border = /^\+-+\+$/
        valid_vertical_border = /^\|[^|]+\|$/
        valid_inner_chars = /^(\*| )+$/
    
        board[0].match?(valid_horizontal_border) &&
          board[-1].match?(valid_horizontal_border) &&
          board[1...-1].all? do |row|
            row.match?(valid_vertical_border) && row[1...-1].match?(valid_inner_chars)
          end
    end
end

