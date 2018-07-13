module Sudoku
  # Handles operations related to sudoku entries in array form
  class NumberArray
    # returns index of first 0 in an array
    def first_free_position(arr)
      arr.index '0'
    end

    # Checks if a sudoku is valid
    def valid_sudoku?(pos, arr)
      return false if duplicates?(get_row(pos / 9, arr)) ||
                      duplicates?(get_col(pos % 9, arr)) ||
                      duplicates?(get_box(pos / 9 / 3 * 3 + pos % 9 / 3, arr))
      true
    end

    private

    # Check if there are duplicate numbers(1-9) in an array
    def duplicates?(arr)
      numbers_arr = arr.reject { |num| num == '0' }
      numbers_arr.size > numbers_arr.uniq.size
    end

    # Returns a full row of given row_no
    def get_row(row_no, arr)
      arr[row_no * 9, 9]
    end

    # Returns a full column of given col_no
    def get_col(col_no, arr)
      (0..8).map { |row| arr[row * 9 + col_no] }
    end

    # Returns a box of 3x3 from given position
    def get_box(pos, arr)
      (0..2).map do |box_index|
        arr[(pos / 3 * 3 + box_index) * 9 + pos % 3 * 3, 3]
      end.flatten
    end
  end
end
