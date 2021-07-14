class Board

    HEIGHT = 3
    WIDTH = HEIGHT

    def initialize
        @grid = Array.new(HEIGHT) {Array.new(WIDTH, :" ")}
    end

    def display
        output = "\n"
        output << generate_header
        output << generate_rows
        output << "\n"
    end

    def winner?(player)
        marker = player.marker
        row_win?(marker) || column_win?(marker) || diagonal_win?(marker)
    end

    def [](y,x)
        @grid[y][x]
    end

    def []=(y,x, marker)
        if @grid[y][x] != :" " && [:X, :O].include?(marker)
            false
        else
            @grid[y][x] = marker
        end
    end

    private

    def format_row(row, letter)
        row.reduce("  #{letter} ") {|row_string, cell| row_string << "[#{cell}]"} << "\n"
    end

    def generate_header
        (1..WIDTH).reduce("   ") {|header, row_n| header << "  #{row_n}"} << "\n"
    end

    def generate_rows
        letter = "@"
        @grid.reduce("") do |output, row|
            letter = letter.next
            output << format_row(row, letter)
        end
    end

    def row_win?(marker)
        @grid.any? do |row|
            row.all? do |cell|
                cell == marker
            end
        end
    end

    def column_win?(marker)
        (0...WIDTH).any? do |column|
            @grid.all? do |row|
                row[column] == marker
            end
        end
    end

    def diagonal_win?(marker)
        [-1, 1].any? do |sign|
            (0...HEIGHT).all? do |i|
                second_index = 
                    if sign > 0
                        i
                    else
                        sign * (i+1)
                    end
                @grid[i][second_index] == marker
            end
        end
    end
end