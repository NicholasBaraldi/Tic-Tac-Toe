require_relative 'Game'
require_relative 'Player'

players = [
    Player.new("Max", :X),
    Player.new("John", :O)
]

game = Game.new(players)

puts "Welcome to tic tac toe."
puts "Player one, pick a move."
game.turn(players[0])
game.print_board