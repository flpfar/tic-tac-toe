require_relative '../lib/boardchecker'

describe BoardChecker do
  it 'finds a winner in horizontal positions (Game positions: 123, 456, 789)' do
    case123 = ['x', 'x', 'x', 4, 'o', 'o', 7, 8, 9]
    case456 = [1, 'o', 'o', 'x', 'x', 'x', 7, 8, 9]
    case789 = [1, 'o', 'o', 4, 5, 6, 'x', 'x', 'x']
    expect(BoardChecker.winner?(case123)).to be true
    expect(BoardChecker.winner?(case456)).to be true
    expect(BoardChecker.winner?(case789)).to be true
  end

  it 'finds a winner in vertical positions (Game positions: 147, 258, 369)' do
    case147 = ['x', 2, 3, 'x', 'o', 'o', 'x', 8, 9]
    case258 = [1, 'o', 'x', 'x', 'o', 'x', 7, 'o', 9]
    case369 = [1, 'o', 'x', 4, 5, 'x', 7, 'o', 'x']
    expect(BoardChecker.winner?(case147)).to be true
    expect(BoardChecker.winner?(case258)).to be true
    expect(BoardChecker.winner?(case369)).to be true
  end

  it 'finds a winner in diagonal positions (Game positions: 159, 357)' do
    case159 = ['o', 'x', 'x', 4, 'o', 6, 'x', 8, 'o']
    case357 = ['o', 2, 'x', 4, 'x', 6, 'x', 8, 'o']
    expect(BoardChecker.winner?(case159)).to eq(true)
    expect(BoardChecker.winner?(case357)).to eq(true)
  end

  it 'finds no winner' do
    board = [1, 'o', 3, 'x', 5, 6, 'x', 8, 9]
    expect(BoardChecker.winner?(board)).to eq(false)
  end
end
