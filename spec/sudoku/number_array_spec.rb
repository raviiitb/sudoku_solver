require './sudoku/number_array'

describe Sudoku::NumberArray do
  let(:number_array) { Sudoku::NumberArray.new }

  describe '#first_free_position' do
    context 'free position exists' do
      it 'returns the first free position in a given array' do
        result = number_array.first_free_position(('0'..'8').to_a)
        expect(result).to eq 0
      end
    end

    context 'free position does not exists' do
      it 'return nil' do
        result = number_array.first_free_position(('1'..'9').to_a)
        expect(result).to eq nil
      end
    end
  end

  describe '#valid_sudoku?' do
    context 'sudoku is invalid' do
      context 'row has duplicates' do
        let(:arr) { %w[1 2 3 3 4 5 6 7 8 0] + Array.new(72, '0') }
        it 'should return false' do
          expect(number_array.valid_sudoku?(8, arr)).to eq false
        end
      end

      context 'column has duplicates' do
        let(:arr) do
          %w[1 2 3 4 5 6 7 8 9] +
            %w[1 3 4 5 0 5 6 7 8] + Array.new(63, '0')
        end
        it 'should return false' do
          expect(number_array.valid_sudoku?(81, arr)).to eq false
        end
      end

      context 'square has duplicates' do
        let(:arr) do
          %w[0 0 0 4 8 6 0 0 0] +
            %w[0 0 0 5 0 8 0 0 0] + Array.new(63, '0')
        end
        it 'should return false' do
          expect(number_array.valid_sudoku?(5, arr)).to eq false
        end
      end
    end

    context 'sudoku is valid' do
      let(:arr) do
        %w[0 0 0 4 9 6 0 0 0] +
          %w[0 0 0 5 0 8 0 0 0] + Array.new(63, '0')
      end
      it 'should return false' do
        expect(number_array.valid_sudoku?(5, arr)).to eq true
      end
    end
  end
end
