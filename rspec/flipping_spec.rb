require './lib/flipping.rb'

RSpec.describe Flipping do
  after { $stdin = STDIN  }

  describe '#initialize' do
    
    
    [4, 8].each do |matrix_size|
      it "sets up a #{matrix_size}x#{matrix_size} matrix with random integer values" do
        $stdin = StringIO.new("#{matrix_size}\n")
        flipping = described_class.new
        matrix = flipping.matrix
        
        expect(matrix.size).to eq(matrix_size)
        
        matrix.each do |i|
          expect(i.size).to eq(matrix_size) 
          expect(i).to all(be_a(Integer))
        end
      end
    end
  end

  context 'with defined matrix' do
    let(:matrix) { [[112,42,83,119], [56,125,56,49], [15,78,101,43], [62,98,114,108]] }
    let(:matrix_size) { 4 }

    subject { described_class.new }
    
    before do
      $stdin = StringIO.new("#{matrix_size}\n")
      allow(subject).to receive(:matrix).and_return(matrix)
    end

    it 'calculates max possible sum for defined matrix' do
      expect(subject.calculate_max_possible_sum).to eq(414)
    end

    it 'calculates current sum of NxN matrix' do
      expect(subject.calculate_current_sum).to eq(335)
    end

    it 'reverses a column' do
      expect { subject.reverse_column(2) }.to change { subject.matrix }
        .from(matrix).to([[112, 42, 114, 119], [56, 125, 101, 49], [15, 78, 56, 43], [62, 98, 83, 108]])
    end

    it 'reverses a row' do
      expect { subject.reverse_row(1) }.to change { subject.matrix }
        .from(matrix).to([[112,42,83,119], [49,56, 125,56], [15,78,101,43], [62,98,114,108]])
    end
  end
end
