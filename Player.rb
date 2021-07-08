class Player

    ROW_MAP = (:A..:C).zip(0..2).to_h

    attr_reader :marker

    def initialize(name, marker)
        @name = name
        @marker = marker
        @score = 0
    end

    def get_row
        print "> "
        ROW_MAP[gets[0].upcase.to_sym]
    end

    def get_col
        print "> "
        gets.to_i - 1
    end

    def get_move
        [get_row, get_col]
    end
end