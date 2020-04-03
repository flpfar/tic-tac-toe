#!/usr/bin/env ruby

puts '========~*~*~*~*~*~*~ TicTacToe ~*~*~*~*~*~*~========'

players = {}

print 'Enter player 1 name: '
players[0] = gets.chomp

print 'Enter player 2 name: '
players[1] = gets.chomp

board = [' '] * 9

puts "Welcome, #{players[0]} and #{players[1]}!"
puts "To make a move, enter a position according to the following board map. \n"
print_board((1..9).to_a)

puts '========= Game Started ========='

winner = false
i = 0

while !winner && i < 9
  player = i % 2
  print "Player #{players[player]} turn. Choose position: "
  print 'Invalid move, try again: ' until register_move(board, player, gets.chomp.to_i)
  print_board(board)

  i += 1
end
