class Board
  attr_reader :players
  attr_reader :board

  def initialize(players)
    @players = players
    @board = [' '] * 9
  end

  def register_move(player, position)
    return false if !position.between?(1, 9) || @board[position - 1] != ' '

    @board[position - 1] = (player.zero? ? 'x' : 'o')
    true
  end

  def show_board
    show = ''
    @board.each_with_index do |board_item, index|
      show += board_item
      show += ((index + 1) % 3).zero? ? "\n" : '|'
    end
    show
  end

  def checker
    test_cases = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    test_cases.each do |t|
      r = @board[t[0]] + @board[t[1]] + @board[t[2]]
      if r == 'xxx'
        result = "We have a winner! Congratulations #{@players[0]}!!"
        return result
      elsif r == 'ooo'
        result = "We have a winner! Congratulations #{@players[1]}!!"
        return result
      elsif @board.none?(' ')
        return "It's a draw!"
      end
    end
    false
  end
end
