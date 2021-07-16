require_relative 'Game'
require_relative 'Player'

class Session

    def initialize
        puts "Welcome to tic tac toe."
        @players = [
            Player.new("Max", :X),
            Player.new("John", :O)
        ]
        @ties = 0
        play_loop
    end

    private

    def lets_play
        game = Game.new(@players)
        winner = game.play_a_game
        if winner
            puts "#{winner.name} won!"
            winner.increment_score
        else
            puts "It's a tie!"
            @ties += 1
        end
    end

    def play_loop
        loop do
            puts "Starting a new game."
            lets_play
            display_scores
            break unless play_again?;
        end
        puts "Goodbye!"
    end

    def play_again?
        puts
        print "Play again?(y/n)\n> "
        loop do
            answer = gets.strip[0].upcase
            case answer
            when "Y"
                return true
            when "N"
                return false
            else
                print "Please answer with 'y' or 'n'.\n> "
            end
        end
    end

    def display_scores
        puts
        puts "SOCRES TABLE:"
        puts @players.map {|player| "#{player.name}: #{player.score}"}
        puts"Ties: #{@ties}"
    end
end

Session.new