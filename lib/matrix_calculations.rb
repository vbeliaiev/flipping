module Flipping
  class MatrixCalculations
    def initialize(matrix)
      @matrix = matrix
      @matrix_size = matrix.size
    end

    def calculate_current_sum
      total_sum = 0
    
      0.upto(matrix_size / 2 - 1) do |i|
        0.upto(matrix_size / 2 - 1) do |j|
          total_sum += matrix[i][j]
        end
      end

      total_sum
    end

    def calculate_max_possible_sum
      total_sum = 0

      0.upto(matrix_size / 2 - 1) do |i|
        0.upto(matrix_size / 2 - 1) do |j|
          total_sum += possible_matrix_values(i, j).max
        end
      end
      
      total_sum
    end

    private

    attr_reader :matrix, :matrix_size

    def possible_matrix_values(i, j)
      max_index = matrix.size - 1
      
      a = matrix[i][j]
      b = matrix[i][max_index - j]
      c = matrix[max_index - i][j]
      d = matrix[max_index - i][max_index - j]
      
      [a, b, c, d]
    end
  end
end
