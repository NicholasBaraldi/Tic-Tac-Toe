require_relative 'input_helper'

class Player

    include InputHelper

    ROW_MAP = (:A..:C).zip(0..2).to_h

    attr_reader :marker, :name, :score

    def initialize(name, marker)
        @name = name
        @marker = marker
        @score = 0
    end

    def increment_score
        @score += 1
    end

    def get_move
        valid_choice = []
        loop do
            input = gets
            choice = ROW_MAP[input[0].upcase.to_sym]
            if valid_choice?(choice)
                valid_choice << choice
                choice = (input[1].to_i) -1
                if valid_choice?(choice)
                    valid_choice << choice
                    return valid_choice
                end
            end
            prompt "Invalid move"
        end
    end

    def valid_choice?(choice)
        (0..2).include?(choice)
    end
end