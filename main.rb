require_relative 'sudoku/problem'
require_relative 'files/process'

input_arr = Files::Process.read
problem = Sudoku::Problem.new input_arr

# Create a linear output array of solved sudoku
output_arr = problem.solve

if output_arr
  Files::Process.write output_arr
  puts 'Solved Sudoku problem is saved in files/output.txt'
else
  puts 'Given Sudoku problem is invalid'
end
