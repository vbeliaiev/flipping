require_relative './matrix_calculations.rb'

module Flipping
  class BuildMatrix
    MAX_MATRIX_SIZE = 50

    def call
      loop do
        puts "Enter the matrix size. It must be a positive, even number, up to #{MAX_MATRIX_SIZE}."
        value = read_input.to_i

        if valid_matrix_size?(value)
          return build_unsolved_matrix(value)
        else 
          puts "Invalid value."
        end
      end
    end

    private

    def build_unsolved_matrix(matrix_size)
      matrix = Array.new(matrix_size) do
        Array.new(matrix_size) { rand(100) }
      end
  
      if need_to_solve?(matrix)
        matrix
      else
        build_unsolved_matrix(matrix_size)
      end
    end


    def valid_matrix_size?(value)
      value > 1 && value <= MAX_MATRIX_SIZE && value.even?
    end

    def need_to_solve?(matrix)
      current_sum = MatrixCalculations.new(matrix).calculate_current_sum
      max_possible_sum = MatrixCalculations.new(matrix).calculate_max_possible_sum
      
      max_possible_sum != current_sum
    end

    def read_input
      $stdin.gets.chomp
    end
  end
end