require_relative '../lib/boardchecker'

describe BoardChecker do
  it 'finds a winner in horizontal position 123' do
    board = ['x', 'x', 'x', 4, 5, 6, 7, 8, 9]

    expect(BoardChecker.winner?(board)).to eq(true)
  end

  it 'finds a winner in vertical position 147' do
    board = ['x', 2, 3, 'x', 5, 6, 'x', 8, 9]

    expect(BoardChecker.winner?(board)).to eq(true)
  end

  it 'finds a winner in diagonal position 357' do
    board = [1, 2, 'x', 4, 'x', 6, 'x', 8, 9]

    expect(BoardChecker.winner?(board)).to eq(true)
  end

  it 'finds no winner' do
    board = [1, 2, 3, 'x', 5, 6, 'x', 8, 9]

    expect(BoardChecker.winner?(board)).to eq(false)
  end
end
