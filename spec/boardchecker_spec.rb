require_relative '../lib/boardchecker'

describe BoardChecker do
  let(:test_board) { [] }
  context 'when there is a winner in horizontal positions' do
    it 'finds a winner in game positions 1 2 3' do
      test_board = ['x', 'x', 'x', 4, 'o', 'o', 7, 8, 9]
      expect(BoardChecker.winner?(test_board)).to be true
    end

    it 'finds a winner in game positions 4 5 6' do
      test_board = [1, 'o', 'o', 'x', 'x', 'x', 7, 8, 9]
      expect(BoardChecker.winner?(test_board)).to be true
    end

    it 'finds a winner in game positions 7 8 9' do
      test_board = [1, 'o', 'o', 4, 5, 6, 'x', 'x', 'x']
      expect(BoardChecker.winner?(test_board)).to be true
    end
  end

  context 'when there is a winner in vertical positions' do
    it 'finds a winner in game positions 1 4 7' do
      test_board = ['x', 2, 3, 'x', 'o', 'o', 'x', 8, 9]
      expect(BoardChecker.winner?(test_board)).to be true
    end

    it 'finds a winner in game positions 2 5 8' do
      test_board = [1, 'o', 'x', 'x', 'o', 'x', 7, 'o', 9]
      expect(BoardChecker.winner?(test_board)).to be true
    end

    it 'finds a winner in game positions 3 6 9' do
      test_board = [1, 'o', 'x', 4, 5, 'x', 7, 'o', 'x']
      expect(BoardChecker.winner?(test_board)).to be true
    end
  end

  context 'when there is a winner in diagonal positions' do
    it 'finds a winner in game positions 1 5 9' do
      test_board = ['o', 'x', 'x', 4, 'o', 6, 'x', 8, 'o']
      expect(BoardChecker.winner?(test_board)).to be true
    end

    it 'finds a winner in game positions 3 5 7' do
      test_board = ['o', 2, 'x', 4, 'x', 6, 'x', 8, 'o']
      expect(BoardChecker.winner?(test_board)).to be true
    end
  end

  it 'finds no winner' do
    test_board = [1, 'o', 3, 'x', 5, 6, 'x', 8, 9]
    expect(BoardChecker.winner?(test_board)).to eq(false)
  end
end
