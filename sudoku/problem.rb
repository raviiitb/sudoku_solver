require_relative 'number_array'

module Sudoku
  # Initializes a Sudoku problem
  class Problem
    def initialize(input_arr)
      @input_arr = input_arr
    end

    # Solves an unsolved sudoku problem
    def solve(arr = @input_arr)
      number_array = NumberArray.new
      pos = number_array.first_free_position arr
      # sudoku is solved, there are no free spaces in output_arr
      return arr unless pos
      ('1'..'9').each do |i|
        arr[pos] = i
        next unless number_array.valid_sudoku? pos, arr
        r = solve arr.dup
        return r if r
      end
      false
    end
  end
end
