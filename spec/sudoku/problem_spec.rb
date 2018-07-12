require './sudoku/problem'

describe Sudoku::Problem do
  describe '#solve' do
    context 'valid input sudoku' do
      let(:sudoku) { create_sudoku_instance 'valid_sudoku' }
      it 'returns a solved sudoku as linear array' do
        result = sudoku.solve
        expect(result).to be_an_instance_of Array
      end
    end

    context 'invalid input sudoku' do
      let(:sudoku) { create_sudoku_instance 'invalid_sudoku' }
      it 'returns false' do
        result = sudoku.solve
        expect(result).to eq false
      end
    end

    def create_sudoku_instance(type)
      input_str = ''
      File.open("spec/fixtures/#{type}.txt").each do |line|
        input_str += line.gsub(/\s/, '').chomp
      end
      Sudoku::Problem.new input_str.split('')
    end
  end
end
