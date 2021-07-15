require_relative 'Board'

class Game

    def initialize(players)
        @players = players
        @board = Board.new
    end

    def play_a_game
        current_player, other_player = @players
        until @winner || !@board.spaces_left? do
            turn(current_player)
            current_player, other_player = other_player, current_player
        end
        puts @board.display
        @winner
    end

    def turn(player)
        puts @board.display
        puts "#{player.name}, pick a move."
        loop do
            move = player.get_move
            break if @board.place_marker(move, player.marker);
            puts "Invalid move"
        end
        @winner = player if @board.winner?(player);
    end
end