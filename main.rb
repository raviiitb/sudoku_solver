Dir["#{File.dirname(__FILE__)}/sudoku/**/*.rb"].each { |file| require file }

input_arr = []

# Read the input file if given from cli else read the default input.txt file
File.open(ARGV[0] || 'files/input.txt').each do |line|
  row = line.gsub(/\s/, '').chomp.split ''
  # Abort if a given sudoku row has not equal to 9 entries
  abort('Given Sudoku problem is invalid') unless row.size == 9
  # Create a linear input array of all prefilled numbers
  input_arr += row
end

# Abort if a given sudoku has not equal to 81 entries
abort('Given Sudoku problem is invalid') unless input_arr.size == 81

problem = Sudoku::Problem.new input_arr

# Create a linear output array of solved sudoku
output_arr = problem.solve

if output_arr
  # Write the output to file in 9x9 format
  File.open('files/output.txt', 'w') do |f|
    (0..8).each do |row|
      f.puts output_arr[row * 9, 9].join "\t"
    end
  end
  puts 'Solved Sudoku problem is saved in files/output.txt'
else
  puts 'Given Sudoku problem is invalid'
end
