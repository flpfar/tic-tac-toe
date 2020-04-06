class BoardChecker
  def self.winner?(board)
    test_cases = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    test_cases.each do |t|
      return true if board[t[0]] == board[t[1]] && board[t[1]] == board[t[2]]
    end
    false
  end
end
