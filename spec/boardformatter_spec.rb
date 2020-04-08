require_relative '../lib/boardformatter'

describe BoardFormatter do
  let(:board) { ['x', 'x', 'o', 'o', 5, 'x', 7, 8, 9] }
  let(:clean_board) { [*1..9] }

  it 'formats simple board' do
    final_string = "\n======= Current Board =======\n"
    final_string += "========= x | x | o =========\n"
    final_string += "========= o | 5 | x =========\n"
    final_string += "========= 7 | 8 | 9 =========\n\n"
    expect(BoardFormatter.format_simple(board)).to eq(final_string)
  end

  it 'formats simple board with first time argument' do
    final_string = "\n"
    final_string += "========= 1 | 2 | 3 =========\n"
    final_string += "========= 4 | 5 | 6 =========\n"
    final_string += "========= 7 | 8 | 9 =========\n\n"
    expect(BoardFormatter.format_simple(clean_board, true)).to eq(final_string)
  end

  it 'formats board with color' do
    final_string = "\e[7m\n======= Current Board =======\n\e[27m"
    final_string += "=========\e[7m x \e[27m|\e[7m x \e[27m|\e[7m o \e[27m=========\n"
    final_string += "=========\e[7m o \e[27m| 5 |\e[7m x \e[27m=========\n"
    final_string += "========= 7 | 8 | 9 =========\n\n"
    expect(BoardFormatter.format_with_color(board)).to eq(final_string)
  end
end
