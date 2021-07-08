class Board

    HEIGHT = 3
    WIDTH = HEIGHT

    attr_accessor :grid

    def initialize
        @grid = Array.new(HEIGHT) {Array.new(WIDTH, :" ")}
    end

    def print_grid
        @grid.each do |row|
            puts
            row.each do |cell|
                print "[#{cell}]"
            end
        end
        puts
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

    def winner?
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
end

b = Board.new

b [0,2] = :X
b [1,1] = :X
b [2,0] = :X
b.print_grid
puts b.diagonal_win?(:X)