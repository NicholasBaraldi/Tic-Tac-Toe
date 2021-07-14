require_relative 'Game'
require_relative 'Player'

players = [
    Player.new("Max", :X),
    Player.new("John", :O)
]

game = Game.new(players)

puts "Welcome to tic tac toe."
winner = game.play_a_game
puts "#{winner.name} won!"