require_relative '../lib/build_matrix.rb'

module Flipping
  RSpec.describe BuildMatrix do
    ['2', '4', '6'].each do |matrix_size|
      describe '#call' do    
        subject { described_class.new }
        
        before {  allow(subject).to receive(:read_input).and_return(matrix_size) }

        it "returns the #{matrix_size}x#{matrix_size} matrix" do
          matrix = subject.call
          expect(matrix.size).to be(matrix_size.to_i)
          
          matrix.each do |el|
            expect(el.size).to be(matrix_size.to_i)
          end
        end
      end
    end
  end
end