class Player

    ROW_MAP = (:A..:C).zip(0..2).to_h

    FORMAT = {
        row: ->(input) {ROW_MAP[input[0].upcase.to_sym]},
        column: ->(input) {(input.to_i) -1}
    }

    attr_reader :marker, :name

    def initialize(name, marker)
        @name = name
        @marker = marker
        @score = 0
    end

    def get_move
        [get_coordinate(:row), get_coordinate(:column)]
    end

    private

    def get_coordinate(axis)
        loop do
            print "> "
            input = gets
            choice = FORMAT[axis].call(input)
            return choice if valid_choice?(choice);
            puts "Invalid #{axis}"
        end
    end

    def valid_choice?(choice)
        (0..2).include?(choice)
    end
end