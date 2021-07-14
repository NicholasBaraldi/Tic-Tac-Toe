require_relative 'Board'

class Game

    def initialize(players)
        @players = players
        @board = Board.new
    end

    def play_a_game
        current_player, other_player = @players
        until @winner do
            turn(current_player)
            current_player, other_player = other_player, current_player
        end
        puts @board.display
        @winner
    end

    def turn(player)
        puts @board.display
        puts "#{player.name}, pick a move."
        move = player.get_move
        @board[*move] = player.marker
        @winner = player if @board.winner?(player)
    end
end