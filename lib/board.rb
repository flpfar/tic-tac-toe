class Board
  attr_reader :players
  attr_reader :board

  def initialize(players)
    @players = players
    @board = (1..9).to_a
  end

  def register_move(player, position)
    return false if !position.between?(1, 9) || @board[position - 1].is_a?(String)

    @board[position - 1] = (player.zero? ? 'x' : 'o')
    true
  end

  def show_board
    show = ''
    @board.each_with_index do |board_item, index|
      show += '=========' if (index + 1) % 3 == 1
      show += ' ' + board_item.to_s + ' '
      show += ((index + 1) % 3).zero? ? "=========\n" : '|'
    end
    show
  end
end
