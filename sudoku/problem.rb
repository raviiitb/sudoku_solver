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
      ('1'..'9').each do |num|
        arr[pos] = num
        next unless number_array.valid_sudoku? pos, arr
        temp_sol = solve arr.dup
        return temp_sol if temp_sol
      end
      false
    end
  end
end
