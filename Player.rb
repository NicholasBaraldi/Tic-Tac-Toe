class Player

    ROW_MAP = (:A..:C).zip(0..2).to_h

    attr_reader :marker

    def initialize(name, marker)
        @name = name
        @marker = marker
        @score = 0
    end

    def get_move
        [get_row, get_col]
    end

    def get_row
        loop do
            print "> "
            input = gets
            choice = format_row(input)
            return choice if valid_choice?(choice);
            puts "Invalid row."
        end
    end

    def get_col
        loop do
            print "> "
            input = gets
            choice = format_col(input)
            return choice if valid_choice?(choice);
            puts "Invalid column."
        end
    end

    def format_row(input)
        ROW_MAP[input[0].upcase.to_sym]
    end

    def format_col(input)
        input.to_i - 1
    end

    def valid_choice?(choice)
        (0..2).include?(choice)
    end
end