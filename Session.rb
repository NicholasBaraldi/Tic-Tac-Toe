require_relative 'Game'
require_relative 'Player'
require_relative 'input_helper'

class Session

    include InputHelper

    def initialize
        puts "Welcome to tic tac toe."
        @players = [
            create_player(:X),
            create_player(:O)
        ]
        @ties = 0
        play_loop
    end

    private

    def create_player(marker)
        prompt "Who will play as #{marker}?"
        name = gets.chomp.strip
        Player.new(name, marker)
    end

    def play_loop
        loop do
            puts "Starting a new game."
            game = Game.new(@players)
            update_scores(game.winner)
            display_scores
            break unless play_again?;
            @players.reverse!
        end
        puts "Goodbye!"
    end

    def update_scores(winner)
        winner ? winner.increment_score : @ties += 1
    end

    def play_again?
        puts
        prompt "Play again?(y/n)"
        loop do
            answer = gets.strip[0].upcase
            case answer
            when "Y"
                return true
            when "N"
                return false
            else
                prompt "Please answer with 'y' or 'n'."
            end
        end
    end

    def display_scores
        puts
        puts "SCOREBOARD:"
        puts @players.map {|player| "#{player.name}: #{player.score}"}
        puts"Ties: #{@ties}"
    end
end

Session.new