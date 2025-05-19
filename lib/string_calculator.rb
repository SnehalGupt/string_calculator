# lib/string_calculator.rb
module StringCalculator
  class Calculator
    # Class variable to track how many times `Add()` is called
    @called_count = 0
    @add_occured = nil  # Event handler for AddOccured

    class << self
      attr_accessor :add_occured  # Allow setting the event handler

      def get_called_count
        @called_count  # Return the number of times Add() was called
      end
    end

    def initialize
      @called_count = 0  # Instance-level count (optional)
    end

    def add(numbers)
      self.class.instance_variable_set(:@called_count, self.class.get_called_count + 1)

      # Perform add logic
      result = 0
      return result if numbers.strip.empty?

      delimiters = [",", "\n"]

      # Handle custom delimiters
      if numbers.start_with?("//")
        header, numbers = numbers.split("\n", 2)
        custom_delimiter = header[2..]
        delimiters << custom_delimiter
      end

      # Parse the numbers and compute the sum
      pattern = Regexp.union(delimiters)
      number_list = numbers.split(pattern).map(&:to_i)

      # Check for negative numbers
      negatives = number_list.select { |n| n < 0 }
      if negatives.any?
        raise ArgumentError, "negatives not allowed: #{negatives.join(', ')}"
      end

      result = number_list.sum

      # Trigger the AddOccured event
      self.class.add_occured.call(numbers, result) if self.class.add_occured

      result
    end
  end
end
