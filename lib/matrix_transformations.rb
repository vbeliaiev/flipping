module Flipping
  class InvalidIndexError < StandardError; end

  class MatrixTransformations
    class << self
      def reverse_column(matrix, col_nb)
        raise invalid_index_error(col_nb) unless valid_index?(matrix, col_nb)
        matrix = deep_duplicate(matrix)

        initial_col = matrix.map { |row| row[col_nb] }
        ordered_col = initial_col.reverse
        matrix.each_with_index do |row, index|
          row[col_nb] = ordered_col[index]
        end
        matrix
      end
      
      def reverse_row(matrix, row_nb)
        raise invalid_index_error(row_nb) unless valid_index?(matrix, row_nb)
        matrix = deep_duplicate(matrix)
 
        matrix[row_nb] = matrix[row_nb].reverse
        matrix
      end

      private

      def valid_index?(matrix, index)
        index >= 0 && index < matrix.size
      end

      def invalid_index_error(index)
        InvalidIndexError.new("Index #{index} is out of range.")
      end
 
      def deep_duplicate(matrix)
        matrix.map(&:dup)
      end
    end
  end
end