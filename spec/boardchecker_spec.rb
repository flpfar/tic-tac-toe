require_relative '../lib/boardchecker'

describe BoardChecker do
  it 'finds a winner in horizontal position 123' do
    board = [1, 'o', 'o', 'x', 'x', 'x', 7, 8, 9]
    expect(BoardChecker.winner?(board)).to eq(true)
  end

  it 'finds a winner in vertical position 147' do
    board = ['x', 'o', 3, 'x', 'o', 6, 'x', 8, 9]
    expect(BoardChecker.winner?(board)).to eq(true)
  end

  it 'finds a winner in diagonal position 357' do
    board = ['o', 2, 'x', 4, 'x', 6, 'x', 8, 'o']
    expect(BoardChecker.winner?(board)).to eq(true)
  end

  it 'finds no winner' do
    board = [1, 'o', 3, 'x', 5, 6, 'x', 8, 9]
    expect(BoardChecker.winner?(board)).to eq(false)
  end
end
