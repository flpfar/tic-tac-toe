#!/usr/bin/env ruby

require './lib/board.rb'

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

has_winner = false
round = 0

until has_winner
  player = round % 2
  input_move(board, player)
  print board.show_board
  has_winner = board.checker
  round += 1
end

puts has_winner
