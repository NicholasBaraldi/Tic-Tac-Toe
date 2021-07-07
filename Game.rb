require_relative 'Board'

class Game

    def initialize(players)
        @players = players
        @board = Board.new
    end
end