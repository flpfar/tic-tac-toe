require_relative '../lib/board'

describe Board do
  let(:board) { Board.new('Player1', 'Player2') }

  context 'when creating a new board' do
    it 'creates a board with two players' do
      expect(board.players).to eq(0 => 'Player1', 1 => 'Player2')
    end

    it 'initializes a board array with positions 1 to 9' do
      expect(board.board).to eq([*1..9])
    end
  end

  context 'when registering a move' do
    it 'returns false when the move is not a position of the board' do
      expect(board.register_move(0, 10)).to be false
    end

    it "doesn't return true if the position of the board is already filled" do
      board.register_move(0, 1)
      expect(board.register_move(1, 1)).not_to be true
    end

    it "doesn't register the move when the position of the board is already filled" do
      board.register_move(0, 5)
      board.register_move(1, 5)
      expect(board.board).not_to eq([1, 2, 3, 4, 'o', 6, 7, 8, 9])
    end

    it 'it returns true if the move is valid' do
      expect(board.register_move(0, 6)).to be true
    end

    it 'registers the move when it is valid' do
      board.register_move(0, 5)
      expect(board.board).to eq([1, 2, 3, 4, 'x', 6, 7, 8, 9])
    end
  end
end
