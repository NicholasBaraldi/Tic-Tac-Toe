require_relative 'Game'
require_relative 'Player'

class Session

    def initialize
        @players = [
            Player.new("Max", :X),
            Player.new("John", :O)
        ]
        @ties = 0
        play_loop
    end

    private

    def play_loop
        puts "Welcome to tic tac toe."
        loop do
            puts "Starting a new game."
            game = Game.new(@players)
            @last_winner = game.winner
            update_scores
            display_scores
            break unless play_again?;
        end
        puts "Goodbye!"
    end

    def update_scores
        @last_winner ? @last_winner.increment_score : @ties += 1
    end

    def announce_winner
        @last_winner ? "#{@last_winner.name} won!" : "It's a tie!"
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
        puts announce_winner
        puts
        puts "SCOREBOARD:"
        puts @players.map {|player| "#{player.name}: #{player.score}"}
        puts"Ties: #{@ties}"
    end
end

Session.new