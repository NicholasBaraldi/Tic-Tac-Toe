require_relative 'Game'
require_relative 'Player'

players = [
    Player.new("Max", :X)
    Player.new("John", :O)
]

game = Game.new(players)