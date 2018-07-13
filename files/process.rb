module Files
  # Read Sudoku problem from a file and Write Sudoku solution in a file
  class Process
    class << self
      # Read the input file
      def read(file)
        input_arr = []
        File.open(file).each do |line|
          row = line.gsub(/\s/, '').chomp.split ''
          # raise an error if a given sudoku row has not equal to 9 entries
          raise ArgumentError, 'Given input is invalid' if row.size != 9
          # Create a linear input array of all prefilled numbers
          input_arr += row
        end
        # raise an error if a given sudoku has not equal to 81 entries
        raise ArgumentError, 'Given input is invalid' if input_arr.size != 81
        input_arr
      end

      # Write the output to file in 9x9 format
      def write(arr, file)
        File.open(file, 'w') do |f|
          (0..8).each do |row|
            f.puts arr[row * 9, 9].join "\t"
          end
        end
      end
    end
  end
end
