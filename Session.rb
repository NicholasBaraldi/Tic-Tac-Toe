require_relative 'Game'
require_relative 'Player'

class Session

    def initialize
        puts "Welcome to tic tac toe."
        @players = [
            Player.new("Max", :X),
            Player.new("John", :O)
        ]
        lets_play
    end

    def lets_play
        game = Game.new(@players)
        winner = game.play_a_game
        if winner
            puts "#{winner.name} won!"
        else
            puts "It's a tie!"
        end
    end
end

Session.new