require './files/process'

describe Files::Process do
  let(:file) { Files::Process }
  describe 'read' do
    context 'given sudoku problem has row size not equal to 9' do
      it 'should raise error' do
        expect { file.read('spec/fixtures/wrong_row_sudoku.txt') }
          .to raise_error ArgumentError, 'Given input is invalid'
      end
    end

    context 'given sudoku problem has column size not equal to 9' do
      it 'should raise error' do
        expect { file.read('spec/fixtures/wrong_column_sudoku.txt') }
          .to raise_error ArgumentError, 'Given input is invalid'
      end
    end

    context 'given sudoku problem is 9x9' do
      it 'should raise error' do
        input_arr = file.read 'spec/fixtures/unsolvable_sudoku.txt'
        expect(input_arr).to be_an_instance_of Array
        expect(input_arr.size).to eq 81
      end
    end
  end
end
