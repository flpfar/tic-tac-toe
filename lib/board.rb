class Board
  attr_reader :players
  attr_reader :board

  def initialize(player1, player2)
    @players = {}
    @players[0] = player1
    @players[1] = player2
    @board = (1..9).to_a
  end

  def register_move(player, position)
    return false if !position.between?(1, 9) || @board[position - 1].is_a?(String)

    @board[position - 1] = (player.zero? ? 'x' : 'o')
    true
  end
end
