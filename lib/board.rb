require "pry"

class Board
    attr_accessor :cells

    def initialize
        reset!
    end

    def reset!
        # @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
        @cells = Array.new(9, " ")
    end

    def display
        puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
        puts "-----------"
        puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
        puts "-----------"
        puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
      end

    def position(input)
        @cells[input.to_i-1]
    end

    def full?
        @cells.any?{|space| space == " "} ? false : true
    end

    def turn_count
        @cells.count { |element| element == "X" || element == "O" }
    end

    def taken?(index)
        position(index) != " " ? true : false
    end

    def valid_move?(index)
        if index.to_i.between?(1,9)
            taken?(index) == true ? false : true
        end
    end

    def update(space, player)
        @cells[space.to_i-1] = player.token
    end
end

