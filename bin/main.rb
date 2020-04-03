#!/usr/bin/env ruby

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
    show = ""
    @board.each_with_index do |board_item, index|
      show += board_item
      ((index + 1) % 3).zero? ? show += "\n" : show += '|'
    end
    show
  end

  def checker
    test_cases = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    test_cases.each do |t|
      r = @board[t[0]] + @board[t[1]] + @board[t[2]]
      if r == 'xxx'
        return @players[0] 
      elsif r == 'ooo'
        return @players[1]
      end 
    end
    false
  end
end





def start_game(board)
  puts "Welcome, #{board.players[0]} and #{board.players[1]}!"
  puts "To make a move, enter a position according to the following board map. \n"
  puts '=========   1 | 2 | 3  ========='
  puts '=========   4 | 5 | 6  ========='
  puts '=========   7 | 8 | 9  ========='
  puts '========= Game Started ========='
end

def input_move(board, player)
  print "Player #{board.players[player]} turn. Choose position: "
  print 'Invalid move, try again: ' until board.register_move(player, gets.chomp.to_i)
end

puts '========~*~*~*~*~*~*~ TicTacToe ~*~*~*~*~*~*~========'

players = {}

print 'Enter player 1 name: '
players[0] = gets.chomp

print 'Enter player 2 name: '
players[1] = gets.chomp

board = Board.new(players)

start_game(board)

winner = false
i = 0

while !winner && i < 9
  player = i % 2
  input_move(board, player)
  print board.show_board
  winner =  board.checker
  i += 1
end

if i>=9
  puts "It is a draw"
else
  puts "The winner is #{winner}"
