#!/usr/bin/env ruby

require_relative '../lib/board.rb'
require_relative '../lib/boardchecker.rb'
require_relative '../lib/boardformatter.rb'
require_relative '../lib/string.rb'

def start_game(board)
  puts "#{'Welcome'.green}, #{board.players[0]} and #{board.players[1]}!"
  puts "To make a move, enter a position according to the following board map: \n"
  print BoardFormatter.format_with_color(board.board, true)
  puts 'Game Started!'.green
end

def input_move(board, current_player)
  print "\nPlayer " + board.players[current_player].green + ' turn. Choose position: '
  print 'Invalid move, try again: ' until board.register_move(current_player, gets.chomp.to_i)
end
system 'clear'
puts '========~*~*~*~*~*~*~ TicTacToe ~*~*~*~*~*~*~========'.reverse_color

print 'Enter player 1 name: '
player1 = gets.chomp

print 'Enter player 2 name: '
player2 = gets.chomp

board = Board.new(player1, player2)

start_game(board)

has_winner = false
round = 0

while !has_winner && round < 9
  current_player = round % 2
  input_move(board, current_player)
  system 'clear'
  print BoardFormatter.format_with_color(board.board)
  has_winner = BoardChecker.winner?(board.board)
  round += 1
end

if has_winner
  puts("We have a winner! Congratulations #{board.players[current_player]}!!".green.bold)
else
  puts("It's a draw!\n".gray.bold)
end
