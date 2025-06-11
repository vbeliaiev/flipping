require_relative '../lib/matrix_calculations.rb'

module Flipping
  RSpec.describe MatrixCalculations do
    let(:matrix) { [[112,42,83,119], [56,125,56,49], [15,78,101,43], [62,98,114,108]] }
    
    
    subject { described_class.new(matrix) }

    describe '#calculate_current_sum' do
      let(:current_nxn_sum) { 335 }
      
      it 'calculates the current sum of NxN elements in the given 2Nx2N matrix' do
        expect(subject.calculate_current_sum).to be(current_nxn_sum)
      end
    end

    describe 'calculate_max_possible_sum' do
      let(:max_possible_nxn_sum) { 414 }

      it 'calculates the max possible sum NxN elements in the given 2Nx2N matrix' do
        expect(subject.calculate_max_possible_sum).to be(max_possible_nxn_sum)
      end
    end
  end
end
