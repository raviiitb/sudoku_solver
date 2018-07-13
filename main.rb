require_relative 'sudoku/problem'
require_relative 'files/process'

input_arr = Files::Process.read(ARGV[0] || 'files/input.txt')
problem = Sudoku::Problem.new input_arr

# Create a linear output array of solved sudoku
output_arr = problem.solve

if output_arr
  Files::Process.write output_arr, 'files/output.txt'
  puts 'Solved Sudoku problem is saved in files/output.txt'
else
  puts 'Given Sudoku problem is invalid'
end
