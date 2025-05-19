# lib/string_calculator.rb
module StringCalculator
  class Calculator
    @called_count = 0
    @add_occured = nil

    class << self
      attr_accessor :add_occured

      def get_called_count
        @called_count
      end

      def increment_called_count
        @called_count += 1
      end
    end

    def get_called_count
      self.class.get_called_count
    end

    def add(numbers)
      self.class.increment_called_count

      return 0 if numbers.strip.empty?

      delimiters = [",", "\n"]

      if numbers.start_with?("//")
        header, numbers = numbers.split("\n", 2)
        custom_delimiter = header[2..]
        delimiters << custom_delimiter
      end

      pattern = Regexp.union(delimiters)
      number_list = numbers.split(pattern).map(&:to_i)

      negatives = number_list.select { |n| n < 0 }
      raise ArgumentError, "negatives not allowed: #{negatives.join(', ')}" if negatives.any?

      result = number_list.sum

      self.class.add_occured.call(numbers, result) if self.class.add_occured

      result
    end
  end
end
