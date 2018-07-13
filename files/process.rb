module Files
  # Read Sudoku problem from a file and Write Sudoku solution in a file
  class Process
    class << self
      def read
        input_arr = []
        # Read the input file if given from cli else read the input.txt file
        File.open(ARGV[0] || 'files/input.txt').each do |line|
          row = line.gsub(/\s/, '').chomp.split ''
          # Abort if a given sudoku row has not equal to 9 entries
          abort('Given Sudoku problem is invalid') unless row.size == 9
          # Create a linear input array of all prefilled numbers
          input_arr += row
        end
        # Abort if a given sudoku has not equal to 81 entries
        abort('Given Sudoku problem is invalid') unless input_arr.size == 81
        input_arr
      end

      def write(arr)
        # Write the output to file in 9x9 format
        File.open('files/output.txt', 'w') do |f|
          (0..8).each do |row|
            f.puts arr[row * 9, 9].join "\t"
          end
        end
      end
    end
  end
end
