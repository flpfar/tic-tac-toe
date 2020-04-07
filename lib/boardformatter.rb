require_relative 'string'

class BoardFormatter
  def self.format_with_color(board, first_time = false)
    show = first_time ? "\n" : "\n======= Current Board =======\n".reverse_color
    board.each_with_index do |board_item, index|
      show += '=========' if (index + 1) % 3 == 1
      show += board_item.is_a?(String) ? " #{board_item} ".reverse_color : " #{board_item} "
      show += ((index + 1) % 3).zero? ? "=========\n" : '|'
    end
    show += "\n"
    show = show.reverse_color if first_time
    show
  end

  def self.format_simple(board, first_time = false)
    show = first_time ? "\n" : "\n======= Current Board =======\n"
    board.each_with_index do |board_item, index|
      show += '=========' if (index + 1) % 3 == 1
      show += " #{board_item} "
      show += ((index + 1) % 3).zero? ? "=========\n" : '|'
    end
    show += "\n"
    show
  end
end
