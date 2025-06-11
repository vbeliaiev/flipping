require_relative '../lib/matrix_transformations.rb'

module Flipping
  RSpec.describe MatrixTransformations do
    let(:matrix) { [[112,42,83,119], [56,125,56,49], [15,78,101,43], [62,98,114,108]] }

    describe '#reverse_column' do
      let(:transformed_matrix) { [[112, 42, 114, 119], [56, 125, 101, 49], [15, 78, 56, 43], [62, 98, 83, 108]] }
      
      it 'reverses the second column (starting from 0)' do
        expect(described_class.reverse_column(matrix, 2)).to eq(transformed_matrix)
      end

      context 'when the given index is out of array' do
        [-1, 10].each do |invalid_index|
          it "raises an error when the given #{invalid_index} index is out of range" do
            expect { described_class.reverse_column(matrix, invalid_index) }.to raise_error(InvalidIndexError, "Index #{invalid_index} is out of range.")
          end
        end
      end
    end

    describe '#reverse_row' do
      let(:transformed_matrix) { [[112,42,83,119], [49,56, 125,56], [15,78,101,43], [62,98,114,108]] }

      it 'reverses the frist row (starting from 0)' do
        expect(described_class.reverse_row(matrix, 1)).to eq(transformed_matrix)
      end

      context 'when the given index is out of array' do
        [-3, 4].each do |invalid_index|
          it "raises an error when the given #{invalid_index} index is out of range" do
            expect { described_class.reverse_row(matrix, invalid_index) }.to raise_error(InvalidIndexError, "Index #{invalid_index} is out of range.")
          end
        end
      end
    end
  end
end