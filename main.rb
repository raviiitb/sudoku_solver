require_relative 'sudoku/problem'
require_relative 'files/process'

# Read the input file if given from cli else read the default files/input.txt
input_arr = Files::Process.read(ARGV[0] || 'files/input.txt')
# Initializes an instance of Sudoku::Problem with input_arr as attribute
problem = Sudoku::Problem.new input_arr

# Creates a linear output array of solved sudoku
output_arr = problem.solve

if output_arr
  # Compose the solution to a file in files/output.txt
  Files::Process.write output_arr, 'files/output.txt'
  puts 'Solved Sudoku problem is saved in files/output.txt'
else
  # Solution does not exists of a given Sudoku problem
  puts 'Given Sudoku problem is invalid'
end
